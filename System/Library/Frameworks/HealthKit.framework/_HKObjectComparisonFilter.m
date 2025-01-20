@interface _HKObjectComparisonFilter
+ (BOOL)allowsEmptyContainerValuesForKeyPath:(id)a3;
+ (BOOL)allowsEmptyDataTypesSetForKeyPath:(id)a3;
+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4;
+ (BOOL)isSupportedDevicePropertyKey:(id)a3;
+ (BOOL)isSupportedKeyPath:(id)a3;
+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7;
+ (id)allowedDataTypeClassesForKeyPath:(id)a3;
+ (id)allowedValueClassesForKeyPath:(id)a3;
+ (int64_t)enumRepresentationForKeyPath:(id)a3;
- (BOOL)_acceptsDataObjectComparingDeviceProperty:(id)a3;
- (BOOL)_acceptsDataObjectWithAppleWatchSource:(id)a3;
- (BOOL)_acceptsDataObjectWithContributor:(id)a3;
- (BOOL)_acceptsDataObjectWithCreationTime:(double)a3;
- (BOOL)_acceptsDataObjectWithMetadata:(id)a3;
- (BOOL)_acceptsDataObjectWithSource:(id)a3;
- (BOOL)_acceptsDataObjectWithValue:(id)a3;
- (BOOL)acceptsDataObject:(id)a3;
- (void)_configureForKeyPathDeviceProperty;
- (void)_configureForKeyPathSource;
- (void)_configureForMetdataKeyPath;
- (void)configureInMemoryFilter;
@end

@implementation _HKObjectComparisonFilter

+ (BOOL)isSupportedDevicePropertyKey:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"HKDevicePropertyFirmwareVersion"] & 1) != 0
    || ([v3 isEqualToString:@"HKDevicePropertyHardwareVersion"] & 1) != 0
    || ([v3 isEqualToString:@"HKDevicePropertyLocalIdentifier"] & 1) != 0
    || ([v3 isEqualToString:@"HKDevicePropertyManufacturer"] & 1) != 0
    || ([v3 isEqualToString:@"HKDevicePropertyModel"] & 1) != 0
    || ([v3 isEqualToString:@"HKDevicePropertyName"] & 1) != 0
    || ([v3 isEqualToString:@"HKDevicePropertySoftwareVersion"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"HKDevicePropertyUDIDeviceIdentifier"];
  }

  return v4;
}

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"correlation"] & 1) != 0
    || ([v4 isEqualToString:@"device"] & 1) != 0
    || ([v4 isEqualToString:@"source"] & 1) != 0
    || ([v4 isEqualToString:@"sourceRevision"] & 1) != 0
    || ([v4 isEqualToString:@"UUID"] & 1) != 0
    || ([v4 isEqualToString:@"workout"] & 1) != 0
    || ([v4 isEqualToString:@"appleWatch"] & 1) != 0
    || ([v4 isEqualToString:@"association"] & 1) != 0
    || ([v4 isEqualToString:@"ratingOfExertionAssociation"] & 1) != 0
    || ([v4 isEqualToString:@"OSBuild"] & 1) != 0
    || ([v4 isEqualToString:@"contributor"] & 1) != 0
    || ([v4 isEqualToString:@"creationDate"] & 1) != 0
    || ([v4 isEqualToString:@"productType"] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    if (objc_msgSend(v4, "hk_hasDevicePropertyKeyPathPrefix"))
    {
      v7 = [v4 substringFromIndex:objc_msgSend(@"device.", "length")];
      char v5 = [a1 isSupportedDevicePropertyKey:v7];
    }
    else
    {
      if (!objc_msgSend(v4, "hk_hasMetadataKeyPathPrefix"))
      {
        char v5 = 0;
        goto LABEL_15;
      }
      v7 = [v4 substringFromIndex:objc_msgSend(@"metadata.", "length")];
      char v5 = [v7 length] != 0;
    }
  }
LABEL_15:

  return v5;
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();

  return (id)[v3 setWithObject:v4];
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"correlation"])
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
LABEL_3:
    id v7 = [v6 setWithObject:objc_opt_class()];
LABEL_10:
    v11 = v7;
    goto LABEL_11;
  }
  if ([v5 isEqualToString:@"device"]
    || [v5 isEqualToString:@"source"]
    || [v5 isEqualToString:@"sourceRevision"]
    || [v5 isEqualToString:@"UUID"])
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    id v7 = (id)objc_msgSend(v8, "initWithObjects:", v9, v10, objc_opt_class(), 0);
    goto LABEL_10;
  }
  if ([v5 isEqualToString:@"workout"])
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    goto LABEL_3;
  }
  if ([v5 isEqualToString:@"appleWatch"])
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    goto LABEL_3;
  }
  if (([v5 isEqualToString:@"association"] & 1) != 0
    || [v5 isEqualToString:@"ratingOfExertionAssociation"])
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    goto LABEL_3;
  }
  if (([v5 isEqualToString:@"OSBuild"] & 1) != 0
    || [v5 isEqualToString:@"productType"])
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    goto LABEL_3;
  }
  if ([v5 isEqualToString:@"contributor"])
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    goto LABEL_3;
  }
  if ([v5 isEqualToString:@"creationDate"])
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    goto LABEL_3;
  }
  if (objc_msgSend(v5, "hk_hasDevicePropertyKeyPathPrefix"))
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v14 = objc_opt_class();
    id v7 = (id)objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0, v21);
    goto LABEL_10;
  }
  if (!objc_msgSend(v5, "hk_hasMetadataKeyPathPrefix"))
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:a1 file:@"_HKObjectComparisonFilter.m" lineNumber:222 description:@"Unreachable code has been executed"];

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    goto LABEL_10;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v15, "initWithObjects:", v16, v17, objc_opt_class(), 0);
  v19 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_acceptedPublicMetadataValueClasses");
  v11 = [v18 setByAddingObjectsFromSet:v19];

LABEL_11:

  return v11;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  id v5 = a4;
  if ([v5 isEqualToString:@"correlation"])
  {
    BOOL v6 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
    goto LABEL_9;
  }
  if (([v5 isEqualToString:@"device"] & 1) != 0
    || ([v5 isEqualToString:@"source"] & 1) != 0
    || [v5 isEqualToString:@"sourceRevision"])
  {
    BOOL v6 = a3 == 10 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
    goto LABEL_9;
  }
  if ([v5 isEqualToString:@"UUID"])
  {
    BOOL v6 = a3 == 4 || a3 == 10;
    goto LABEL_9;
  }
  if (([v5 isEqualToString:@"workout"] & 1) != 0
    || ([v5 isEqualToString:@"association"] & 1) != 0
    || [v5 isEqualToString:@"ratingOfExertionAssociation"]
    || [v5 isEqualToString:@"appleWatch"])
  {
    goto LABEL_21;
  }
  if ([v5 isEqualToString:@"productType"])
  {
    if (a3 != 7) {
      goto LABEL_31;
    }
LABEL_29:
    BOOL v7 = 1;
    goto LABEL_12;
  }
  if (!objc_msgSend(v5, "hk_hasDevicePropertyKeyPathPrefix"))
  {
    if (objc_msgSend(v5, "hk_hasMetadataKeyPathPrefix"))
    {
      if (a3 == 10) {
        goto LABEL_29;
      }
    }
    else if ([v5 isEqualToString:@"contributor"])
    {
LABEL_21:
      BOOL v6 = a3 == 4;
      goto LABEL_9;
    }
LABEL_31:
    BOOL v7 = +[_HKComparisonFilter isAllowedPredicateOperatorType:a3 forKeyPath:v5];
    goto LABEL_12;
  }
  BOOL v6 = a3 == 10;
LABEL_9:
  BOOL v7 = v6;
LABEL_12:

  return v7;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS____HKObjectComparisonFilter;
  if (objc_msgSendSuper2(&v18, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v12, v13, a5, a6, a7))
  {
    if ([v13 isEqualToString:@"device"]
      || [v13 isEqualToString:@"source"]
      || [v13 isEqualToString:@"sourceRevision"]
      || [v13 isEqualToString:@"UUID"])
    {
      uint64_t v15 = objc_opt_class();
      char IsValueValidForDevicePropertyKeyPath = HKIsValueOrContainerValidForOperatorType(a5, v12, v15, (uint64_t)a7);
    }
    else if (objc_msgSend(v13, "hk_hasDevicePropertyKeyPathPrefix"))
    {
      char IsValueValidForDevicePropertyKeyPath = _IsValueValidForDevicePropertyKeyPath(v12, (uint64_t)a7);
    }
    else
    {
      if (!objc_msgSend(v13, "hk_hasMetadataKeyPathPrefix"))
      {
        BOOL v14 = 1;
        goto LABEL_10;
      }
      char IsValueValidForDevicePropertyKeyPath = _IsMetadataValueValidForOperatorType(a5, v12, (uint64_t)a7);
    }
    BOOL v14 = IsValueValidForDevicePropertyKeyPath;
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_10:

  return v14;
}

+ (BOOL)allowsEmptyDataTypesSetForKeyPath:(id)a3
{
  return 1;
}

+ (BOOL)allowsEmptyContainerValuesForKeyPath:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"device"] & 1) != 0
    || ([v3 isEqualToString:@"source"] & 1) != 0
    || ([v3 isEqualToString:@"sourceRevision"] & 1) != 0
    || ([v3 isEqualToString:@"UUID"] & 1) != 0
    || (objc_msgSend(v3, "hk_hasDevicePropertyKeyPathPrefix") & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = objc_msgSend(v3, "hk_hasMetadataKeyPathPrefix");
  }

  return v4;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"correlation"])
  {
    int64_t v6 = 0;
  }
  else if ([v5 isEqualToString:@"device"])
  {
    int64_t v6 = 1;
  }
  else if ([v5 isEqualToString:@"source"])
  {
    int64_t v6 = 2;
  }
  else if ([v5 isEqualToString:@"sourceRevision"])
  {
    int64_t v6 = 3;
  }
  else if ([v5 isEqualToString:@"UUID"])
  {
    int64_t v6 = 4;
  }
  else if ([v5 isEqualToString:@"workout"])
  {
    int64_t v6 = 5;
  }
  else if ([v5 isEqualToString:@"appleWatch"])
  {
    int64_t v6 = 6;
  }
  else if (([v5 isEqualToString:@"association"] & 1) != 0 {
         || ([v5 isEqualToString:@"ratingOfExertionAssociation"] & 1) != 0)
  }
  {
    int64_t v6 = 7;
  }
  else if ([v5 isEqualToString:@"OSBuild"])
  {
    int64_t v6 = 8;
  }
  else if ([v5 isEqualToString:@"contributor"])
  {
    int64_t v6 = 13;
  }
  else if ([v5 isEqualToString:@"creationDate"])
  {
    int64_t v6 = 10;
  }
  else if ([v5 isEqualToString:@"productType"])
  {
    int64_t v6 = 9;
  }
  else if (objc_msgSend(v5, "hk_hasDevicePropertyKeyPathPrefix"))
  {
    int64_t v6 = 11;
  }
  else if (objc_msgSend(v5, "hk_hasMetadataKeyPathPrefix"))
  {
    int64_t v6 = 12;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:a1 file:@"_HKObjectComparisonFilter.m" lineNumber:340 description:@"Unreachable code has been executed"];

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKObjectComparisonFilter;
    int64_t v6 = (int64_t)objc_msgSendSuper2(&v9, sel_enumRepresentationForKeyPath_, v5);
  }

  return v6;
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS____HKObjectComparisonFilter;
  if (objc_msgSendSuper2(&v14, sel_areValidTypes_forKeyPath_error_, v8, v9, a5))
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60___HKObjectComparisonFilter_areValidTypes_forKeyPath_error___block_invoke;
    v12[3] = &unk_1E58C85B8;
    id v13 = v9;
    char v10 = objc_msgSend(v8, "hk_allObjectsPassTestWithError:test:", a5, v12);
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)configureInMemoryFilter
{
  v9.receiver = self;
  v9.super_class = (Class)_HKObjectComparisonFilter;
  [(_HKComparisonFilter *)&v9 configureInMemoryFilter];
  id v3 = [(_HKComparisonFilter *)self keyPath];
  int v4 = [v3 isEqualToString:@"source"];

  if (v4)
  {
    [(_HKObjectComparisonFilter *)self _configureForKeyPathSource];
  }
  else
  {
    id v5 = [(_HKComparisonFilter *)self keyPath];
    int v6 = objc_msgSend(v5, "hk_hasDevicePropertyKeyPathPrefix");

    if (v6)
    {
      [(_HKObjectComparisonFilter *)self _configureForKeyPathDeviceProperty];
    }
    else
    {
      BOOL v7 = [(_HKComparisonFilter *)self keyPath];
      int v8 = objc_msgSend(v7, "hk_hasMetadataKeyPathPrefix");

      if (v8) {
        [(_HKObjectComparisonFilter *)self _configureForMetdataKeyPath];
      }
    }
  }
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = 1;
    switch([(_HKComparisonFilter *)self keyPathIntegerValue])
    {
      case 0:
      case 5:
      case 7:
      case 8:
        break;
      case 1:
        uint64_t v6 = [v4 device];
        goto LABEL_8;
      case 2:
        int v8 = [v4 _source];
        BOOL v9 = [(_HKObjectComparisonFilter *)self _acceptsDataObjectWithSource:v8];
        goto LABEL_16;
      case 3:
        uint64_t v6 = [v4 sourceRevision];
        goto LABEL_8;
      case 4:
        uint64_t v6 = [v4 UUID];
LABEL_8:
        int v8 = (void *)v6;
        BOOL v9 = [(_HKObjectComparisonFilter *)self _acceptsDataObjectWithValue:v6];
        goto LABEL_16;
      case 6:
        int v8 = [v4 _source];
        BOOL v9 = [(_HKObjectComparisonFilter *)self _acceptsDataObjectWithAppleWatchSource:v8];
        goto LABEL_16;
      case 9:
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Product type filter does not support acceptsDataObject: and cannot be used in updating queries."];
        goto LABEL_11;
      case 10:
        [v4 _creationTimestamp];
        BOOL v5 = -[_HKObjectComparisonFilter _acceptsDataObjectWithCreationTime:](self, "_acceptsDataObjectWithCreationTime:");
        break;
      case 11:
        int v8 = [v4 device];
        BOOL v9 = [(_HKObjectComparisonFilter *)self _acceptsDataObjectComparingDeviceProperty:v8];
        goto LABEL_16;
      case 12:
        int v8 = [v4 metadata];
        BOOL v9 = [(_HKObjectComparisonFilter *)self _acceptsDataObjectWithMetadata:v8];
        goto LABEL_16;
      case 13:
        int v8 = [v4 contributor];
        BOOL v9 = [(_HKObjectComparisonFilter *)self _acceptsDataObjectWithContributor:v8];
LABEL_16:
        BOOL v5 = v9;

        break;
      default:
        BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
        [v7 handleFailureInMethod:1 object:self file:@"_HKObjectComparisonFilter.m" lineNumber:418 description:@"Unreachable code has been executed"];

        goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_configureForKeyPathSource
{
  unint64_t v3 = [(_HKComparisonFilter *)self operatorType];
  id v4 = [(_HKComparisonFilter *)self value];
  id v6 = v4;
  if (v3 == 10) {
    char v5 = objc_msgSend(v4, "hk_containsObjectPassingTest:", &__block_literal_global_142);
  }
  else {
    char v5 = __55___HKObjectComparisonFilter__configureForKeyPathSource__block_invoke((uint64_t)v4, v4);
  }
  self->_compareForLocalDevice = v5;
}

- (void)_configureForKeyPathDeviceProperty
{
  unint64_t v3 = [(_HKComparisonFilter *)self keyPath];
  id v4 = [v3 substringFromIndex:objc_msgSend(@"device.", "length")];

  id v10 = v4;
  if ([v10 isEqualToString:@"HKDevicePropertyFirmwareVersion"])
  {
    char v5 = sel_firmwareVersion;
LABEL_17:
    NSStringFromSelector(v5);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if ([v10 isEqualToString:@"HKDevicePropertyHardwareVersion"])
  {
    char v5 = sel_hardwareVersion;
    goto LABEL_17;
  }
  if ([v10 isEqualToString:@"HKDevicePropertyLocalIdentifier"])
  {
    char v5 = sel_localIdentifier;
    goto LABEL_17;
  }
  if ([v10 isEqualToString:@"HKDevicePropertyManufacturer"])
  {
    char v5 = sel_manufacturer;
    goto LABEL_17;
  }
  if ([v10 isEqualToString:@"HKDevicePropertyModel"])
  {
    char v5 = sel_model;
    goto LABEL_17;
  }
  if ([v10 isEqualToString:@"HKDevicePropertyName"])
  {
    char v5 = sel_name;
    goto LABEL_17;
  }
  if ([v10 isEqualToString:@"HKDevicePropertySoftwareVersion"])
  {
    char v5 = sel_softwareVersion;
    goto LABEL_17;
  }
  if ([v10 isEqualToString:@"HKDevicePropertyUDIDeviceIdentifier"])
  {
    char v5 = sel_UDIDeviceIdentifier;
    goto LABEL_17;
  }
  int v8 = [MEMORY[0x1E4F28B00] currentHandler];
  BOOL v9 = [NSString stringWithUTF8String:"NSString * _Nonnull _DevicePropertyNameForDevicePropertyKey(NSString * _Nonnull __strong)"];
  [v8 handleFailureInFunction:v9 file:@"_HKObjectComparisonFilter.m" lineNumber:109 description:@"Unreachable code has been executed"];

  id v6 = &stru_1EEC60288;
LABEL_18:

  devicePropertyName = self->_devicePropertyName;
  self->_devicePropertyName = &v6->isa;
}

- (void)_configureForMetdataKeyPath
{
  id v5 = [(_HKComparisonFilter *)self keyPath];
  unint64_t v3 = [v5 substringFromIndex:objc_msgSend(@"metadata.", "length")];
  metadataKey = self->_metadataKey;
  self->_metadataKey = v3;
}

- (BOOL)_acceptsDataObjectWithValue:(id)a3
{
  id v5 = a3;
  if ([(_HKComparisonFilter *)self operatorType] == 10)
  {
    id v6 = [(_HKComparisonFilter *)self value];
    char v7 = [v6 containsObject:v5];
LABEL_5:
    LOBYTE(self) = v7;
    goto LABEL_6;
  }
  if ([(_HKComparisonFilter *)self operatorType] == 4)
  {
    id v6 = [(_HKComparisonFilter *)self value];
    char v7 = [v6 isEqual:v5];
    goto LABEL_5;
  }
  if ([(_HKComparisonFilter *)self operatorType] == 5)
  {
    id v6 = [(_HKComparisonFilter *)self value];
    LODWORD(self) = [v6 isEqual:v5] ^ 1;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_HKObjectComparisonFilter.m" lineNumber:461 description:@"Unreachable code has been executed"];
    LOBYTE(self) = 0;
  }
LABEL_6:

  return (char)self;
}

- (BOOL)_acceptsDataObjectWithSource:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_compareForLocalDevice && [v4 _isLocalDevice]) {
    BOOL v6 = [(_HKComparisonFilter *)self operatorType] == 4
  }
      || [(_HKComparisonFilter *)self operatorType] == 10;
  else {
    BOOL v6 = [(_HKObjectComparisonFilter *)self _acceptsDataObjectWithValue:v5];
  }

  return v6;
}

- (BOOL)_acceptsDataObjectWithAppleWatchSource:(id)a3
{
  char v4 = [a3 _isAppleWatch];
  id v5 = [(_HKComparisonFilter *)self value];
  char v6 = v4 ^ [v5 BOOLValue] ^ 1;

  return v6;
}

- (BOOL)_acceptsDataObjectWithCreationTime:(double)a3
{
  char v4 = self;
  id v5 = [(_HKComparisonFilter *)self value];
  [v5 timeIntervalSinceReferenceDate];
  unint64_t v7 = HKCompareDoubles(a3, v6);
  LOBYTE(v4) = HKComparisonResultMatchesPredicateOperator(v7, [(_HKComparisonFilter *)v4 operatorType]);

  return (char)v4;
}

- (BOOL)_acceptsDataObjectComparingDeviceProperty:(id)a3
{
  char v4 = [a3 valueForKeyPath:self->_devicePropertyName];
  id v5 = [(_HKComparisonFilter *)self value];
  double v6 = v5;
  if (v4) {
    char v7 = [v5 containsObject:v4];
  }
  else {
    char v7 = [v5 count] == 0;
  }

  return v7;
}

- (BOOL)_acceptsDataObjectWithMetadata:(id)a3
{
  char v4 = [a3 objectForKeyedSubscript:self->_metadataKey];
  if ([(_HKComparisonFilter *)self operatorType] == 10)
  {
    if (v4)
    {
      id v5 = [(_HKComparisonFilter *)self value];
      char v6 = [v5 containsObject:v4];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v7 = [(_HKComparisonFilter *)self value];
    if (v7)
    {
    }
    else if ([(_HKComparisonFilter *)self operatorType] == 5)
    {
      char v6 = v4 != 0;
      goto LABEL_13;
    }
    int v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_acceptedPublicMetadataValueClasses");
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60___HKObjectComparisonFilter__acceptsDataObjectWithMetadata___block_invoke;
    v15[3] = &unk_1E58C7568;
    v15[4] = self;
    objc_msgSend(v8, "hk_anyObjectPassingTest:", v15);

    uint64_t v9 = [(_HKComparisonFilter *)self value];
    if (v9 && (id v10 = (void *)v9, isKindOfClass = objc_opt_isKindOfClass(), v10, (isKindOfClass & 1) == 0))
    {
      char v6 = [(_HKComparisonFilter *)self operatorType] == 5;
    }
    else
    {
      id v12 = [(_HKComparisonFilter *)self value];
      unint64_t v13 = [v4 compare:v12];

      char v6 = HKComparisonResultMatchesPredicateOperator(v13, [(_HKComparisonFilter *)self operatorType]);
    }
  }
LABEL_13:

  return v6;
}

- (BOOL)_acceptsDataObjectWithContributor:(id)a3
{
  if (!a3) {
    return 0;
  }
  char v4 = [a3 UUID];
  id v5 = [(_HKComparisonFilter *)self value];
  char v6 = [v4 isEqual:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataKey, 0);

  objc_storeStrong((id *)&self->_devicePropertyName, 0);
}

@end