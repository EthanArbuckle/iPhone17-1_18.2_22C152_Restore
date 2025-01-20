@interface UTType
+ (BOOL)supportsSecureCoding;
+ (NSArray)typesWithTag:(NSString *)tag tagClass:(NSString *)tagClass conformingToType:(UTType *)supertype;
+ (UTType)_typeOfCurrentDevice;
+ (UTType)exportedTypeWithIdentifier:(NSString *)identifier;
+ (UTType)exportedTypeWithIdentifier:(NSString *)identifier conformingToType:(UTType *)parentType;
+ (UTType)importedTypeWithIdentifier:(NSString *)identifier;
+ (UTType)importedTypeWithIdentifier:(NSString *)identifier conformingToType:(UTType *)parentType;
+ (UTType)new;
+ (UTType)typeWithFilenameExtension:(NSString *)filenameExtension;
+ (UTType)typeWithFilenameExtension:(NSString *)filenameExtension conformingToType:(UTType *)supertype;
+ (UTType)typeWithIdentifier:(NSString *)identifier;
+ (UTType)typeWithMIMEType:(NSString *)mimeType;
+ (UTType)typeWithMIMEType:(NSString *)mimeType conformingToType:(UTType *)supertype;
+ (UTType)typeWithTag:(NSString *)tag tagClass:(NSString *)tagClass conformingToType:(UTType *)supertype;
+ (id)_constantTypeForURLPropertyProviderWithIdentifier:(id)a3;
+ (id)_exportedTypeWithIdentifier:(id)a3 bundle:(id)a4 conformingToType:(id)a5;
+ (id)_importedTypeWithIdentifier:(id)a3 bundle:(id)a4 conformingToType:(id)a5;
+ (id)_typeForURLPropertyProviderWithTypeRecord:(id)a3;
+ (id)_typeOfItemAtFileURL:(id)a3 error:(id *)a4;
+ (id)_typeOfPromiseAtFileURL:(id)a3 error:(id *)a4;
+ (id)_typeWithBluetoothProductID:(unsigned int)a3 vendorID:(unsigned __int16)a4;
+ (id)_typeWithDeviceModelCode:(id)a3;
+ (id)_typeWithDeviceModelCode:(id)a3 enclosureColor:(UTHardwareColor)a4;
+ (id)_typeWithDeviceModelCodeWithoutResolvingCurrentDevice:(id)a3;
+ (id)_typeWithIdentifier:(id)a3 allowUndeclared:(BOOL)a4;
+ (id)_typeWithIdentifier:(id)a3 constantIndex:(int64_t)a4 error:(id *)a5;
+ (id)_typeWithTypeRecord:(id)a3 detachTypeRecord:(BOOL)a4 findConstant:(BOOL)a5;
+ (id)_typesWithIdentifiers:(id)a3;
+ (void)_enumerateAllDeclaredTypesUsingBlock:(id)a3;
+ (void)_unrealizeAllCoreTypes;
- (BOOL)_getPreferredEnclosureColor:(UTHardwareColor *)a3;
- (BOOL)_isCoreType;
- (BOOL)_isExported;
- (BOOL)_isImported;
- (BOOL)_isRealized;
- (BOOL)_isWildcard;
- (BOOL)_shouldURLPropertyProviderEncodeTypeRecord;
- (BOOL)conformsToType:(UTType *)type;
- (BOOL)isDeclared;
- (BOOL)isDynamic;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPublicType;
- (BOOL)isSubtypeOfType:(UTType *)type;
- (BOOL)isSupertypeOfType:(UTType *)type;
- (NSDictionary)_kindStringDictionary;
- (NSDictionary)_localizedDescriptionDictionary;
- (NSDictionary)tags;
- (NSNumber)version;
- (NSOrderedSet)_parentTypes;
- (NSSet)_childTypes;
- (NSSet)_subtypes;
- (NSSet)supertypes;
- (NSString)_kindString;
- (NSString)identifier;
- (NSString)localizedDescription;
- (NSString)preferredFilenameExtension;
- (NSString)preferredMIMEType;
- (NSURL)referenceURL;
- (UTType)init;
- (UTType)initWithCoder:(id)a3;
- (UTTypeRecord)_typeRecord;
- (id)_initWithTypeRecord:(id)a3;
- (id)_kindStringWithPreferredLocalizations:(id)a3;
- (id)_localizedDescriptionWithPreferredLocalizations:(id)a3;
- (id)_preferredTagOfClass:(id)a3;
- (id)debugDescription;
- (int64_t)_constantIndex;
- (unint64_t)_getEnclosureColors:(UTHardwareColor *)a3 count:(unint64_t)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UTType

- (void).cxx_destruct
{
}

+ (UTType)typeWithIdentifier:(NSString *)identifier
{
  return (UTType *)_UTTypeGetForIdentifier((__CFString *)identifier, 0);
}

- (BOOL)isDeclared
{
  v2 = [(UTType *)self _typeRecord];
  char v3 = [v2 isDeclared];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = [(UTType *)self identifier];
  objc_msgSend(a3, "encodeObject:forKey:");

  objc_msgSend(a3, "encodeInteger:forKey:", -[UTType _constantIndex](self, "_constantIndex"), @"constantIndex");
  objc_msgSend(NSNumber, "numberWithBool:", -[UTType isDeclared](self, "isDeclared"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "encodeObject:forKey:");

  objc_msgSend(NSNumber, "numberWithBool:", -[UTType isDynamic](self, "isDynamic"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "encodeObject:forKey:");
}

- (BOOL)isDynamic
{
  v2 = [(UTType *)self _typeRecord];
  char v3 = [v2 isDynamic];

  return v3;
}

- (int64_t)_constantIndex
{
  return -1;
}

- (id)_preferredTagOfClass:(id)a3
{
  v4 = [(UTType *)self _typeRecord];
  id v5 = [v4 preferredTagOfClass:a3];

  return v5;
}

+ (UTType)exportedTypeWithIdentifier:(NSString *)identifier
{
  int v5 = __UTGetDeclarationStatusFromInfoPlist(identifier, 1, 0, v3);
  if (v5) {
    __UNIFORM_TYPE_IDENTIFIER_WAS_NOT_DECLARED_IN_INFO_PLIST_OF_BUNDLE__((uint64_t)identifier, 1, 0, v5);
  }

  return (UTType *)UniformTypeIdentifiers::Type::getExportedType((__CFString *)identifier, 0, v6, v7);
}

- (UTType)initWithCoder:(id)a3
{
  v31[2] = *MEMORY[0x1E4F143B8];
  int v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"declared"];
  id v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"dynamic"];
  if (_NSIsNSString())
  {
    if (object_getClass(self) == (Class)UTType
      && (v20 = __UTFindCoreTypesConstantWithIdentifier(v5, [a3 decodeIntegerForKey:@"constantIndex"])) != 0)
    {
      v14 = v20;
    }
    else
    {
      if (!v6
        || ((char v8 = [v6 BOOLValue], !v7) ? (v9 = 1) : (v9 = v8),
            (v9 & 1) != 0 || ([v7 BOOLValue] & 1) != 0))
      {
        v10 = [MEMORY[0x1E4F22490] typeRecordWithIdentifier:v5];
      }
      else
      {
        v10 = [MEMORY[0x1E4F22490] typeRecordWithPotentiallyUndeclaredIdentifier:v5];
      }
      v11 = v10;
      v25 = v10;
      if (v10)
      {
        id v12 = _UTTaggedTypeCreate(v10);
        v13 = v12;
        if (v12)
        {
          v14 = (UTType *)v12;
        }
        else
        {
          v14 = [(UTType *)self _initWithTypeRecord:v11];
          if (v14) {
            _UTDetachTypeRecords((uint64_t)&v25, 1);
          }
        }

        v22 = v25;
      }
      else
      {

        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        v30[0] = *MEMORY[0x1E4F28228];
        v30[1] = @"UTIdentifier";
        v31[0] = @"Unrecognized type identifier.";
        v31[1] = v5;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
        v23 = (void *)[v21 initWithDomain:*MEMORY[0x1E4F281F8] code:4864 userInfo:v22];
        [a3 failWithError:v23];

        v14 = 0;
      }
    }
  }
  else
  {

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    if (v5)
    {
      v28[0] = *MEMORY[0x1E4F28228];
      v28[1] = @"UTIdentifier";
      v29[0] = @"Type identifier was not a string.";
      v29[1] = v5;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
      v17 = (void *)[v15 initWithDomain:*MEMORY[0x1E4F281F8] code:4864 userInfo:v16];
      [a3 failWithError:v17];
    }
    else
    {
      uint64_t v26 = *MEMORY[0x1E4F28228];
      v27 = @"Type identifier was not encoded.";
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      v19 = (void *)[v15 initWithDomain:*MEMORY[0x1E4F281F8] code:4865 userInfo:v18];
      [a3 failWithError:v19];
    }
    v14 = 0;
  }

  return v14;
}

+ (NSArray)typesWithTag:(NSString *)tag tagClass:(NSString *)tagClass conformingToType:(UTType *)supertype
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (tag)
  {
    if (tagClass) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"UTType.mm", 711, @"Invalid parameter not satisfying: %@", @"tag != nil" object file lineNumber description];

    if (tagClass) {
      goto LABEL_3;
    }
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, a1, @"UTType.mm", 712, @"Invalid parameter not satisfying: %@", @"tagClass != nil" object file lineNumber description];

LABEL_3:
  if (!UniformTypeIdentifiers::Type::isTagValid((UniformTypeIdentifiers::Type *)tag, (__CFString *)tagClass, tag))goto LABEL_21; {
  v10 = (void *)MEMORY[0x1E4F22490];
  }
  v11 = [(UTType *)supertype identifier];
  id v12 = [v10 typeRecordsWithTag:tag ofClass:tagClass conformingToIdentifier:v11];

  if (!v12) {
    goto LABEL_21;
  }
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = +[UTType _typeWithTypeRecord:*(void *)(*((void *)&v25 + 1) + 8 * i) detachTypeRecord:0 findConstant:1];
        [v13 addObject:v18];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v15);
  }

  v19 = (void *)[v13 copy];
  if (qword_1EB20A668 != -1) {
    dispatch_once(&qword_1EB20A668, &__block_literal_global_2);
  }
  if (_MergedGlobals_2)
  {
    unint64_t v20 = [v14 count];
    uint64_t v21 = v20;
    if (v20)
    {
      if (v20 > 0x80)
      {
        uint64_t v29 = 0;
        std::vector<UTTypeRecord *>::vector(__p, v20, &v29);
        objc_msgSend(v14, "getObjects:range:", __p[0], 0, v21);
        _UTDetachTypeRecords((uint64_t)__p[0], v21);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      else
      {
        bzero(__p, 0x400uLL);
        objc_msgSend(v14, "getObjects:range:", __p, 0, v21);
        _UTDetachTypeRecords((uint64_t)__p, v21);
      }
    }
  }

  if (!v19) {
LABEL_21:
  }
    v19 = (void *)MEMORY[0x1E4F1CBF0];

  return (NSArray *)v19;
}

+ (id)_typeWithTypeRecord:(id)a3 detachTypeRecord:(BOOL)a4 findConstant:(BOOL)a5
{
  BOOL v5 = a4;
  id v12 = a3;
  if (!a3) {
    goto LABEL_8;
  }
  BOOL v6 = a5;
  char v8 = _UTTaggedTypeCreate(a3);
  if (v8) {
    goto LABEL_12;
  }
  if (!v6
    || ([a3 identifier],
        char v9 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        __UTFindCoreTypesConstantWithIdentifier(v9, 0x7FFFFFFFFFFFFFFFuLL),
        char v8 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v8))
  {
LABEL_8:
    id v10 = [[UTType alloc] _initWithTypeRecord:v12];
    if (v5 && v12)
    {
      char v8 = v10;
      _UTDetachTypeRecords((uint64_t)&v12, 1);
    }
    else
    {
      char v8 = v10;
    }
    goto LABEL_12;
  }
  if (_UTCoreTypesConstantSetTypeRecordIfNil((uint64_t)v8, v12) && v5) {
    _UTDetachTypeRecords((uint64_t)&v12, 1);
  }
LABEL_12:

  return v8;
}

- (id)_initWithTypeRecord:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UTType;
  v4 = [(UTType *)&v7 init];
  BOOL v5 = v4;
  if (v4) {
    objc_storeStrong((id *)&v4->_typeRecord, a3);
  }
  return v5;
}

- (unint64_t)hash
{
  v2 = [(UTType *)self identifier];
  unint64_t HashCode = _UTIdentifierGetHashCode(v2);

  return HashCode;
}

- (BOOL)conformsToType:(UTType *)type
{
  if (!type)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"UTType.mm", 623, @"Invalid parameter not satisfying: %@", @"type != nil" object file lineNumber description];
  }
  if (self == type) {
    return 1;
  }
  BOOL v5 = [(UTType *)self identifier];
  BOOL v6 = [(UTType *)type identifier];
  BOOL v7 = _UTIdentifiersAreEqual(v5, v6);

  if (v7) {
    return 1;
  }
  char v9 = [(UTType *)self _typeRecord];
  id v10 = [(UTType *)type identifier];
  char v8 = [v9 conformsToTypeIdentifier:v10];

  return v8;
}

- (NSString)identifier
{
  v2 = [(UTType *)self _typeRecord];
  char v3 = [v2 identifier];

  return (NSString *)v3;
}

- (UTTypeRecord)_typeRecord
{
  return (UTTypeRecord *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    id v3 = a3;
    if (a3)
    {
      if (objc_opt_isKindOfClass())
      {
        BOOL v5 = [(UTType *)self identifier];
        BOOL v6 = [v3 identifier];
        LOBYTE(v3) = _UTIdentifiersAreEqual(v5, v6);
      }
      else
      {
        LOBYTE(v3) = 0;
      }
    }
  }
  return (char)v3;
}

- (NSString)preferredFilenameExtension
{
  return (NSString *)[(UTType *)self _preferredTagOfClass:@"public.filename-extension"];
}

+ (id)_constantTypeForURLPropertyProviderWithIdentifier:(id)a3
{
  return __UTFindCoreTypesConstantWithIdentifier((__CFString *)a3, 0x7FFFFFFFFFFFFFFFuLL);
}

+ (id)_typeForURLPropertyProviderWithTypeRecord:(id)a3
{
  return +[UTType _typeWithTypeRecord:a3 detachTypeRecord:1 findConstant:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (UTType)typeWithTag:(NSString *)tag tagClass:(NSString *)tagClass conformingToType:(UTType *)supertype
{
  if (tag)
  {
    if (tagClass) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"UTType.mm", 695, @"Invalid parameter not satisfying: %@", @"tag != nil" object file lineNumber description];

    if (tagClass) {
      goto LABEL_3;
    }
  }
  uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, a1, @"UTType.mm", 696, @"Invalid parameter not satisfying: %@", @"tagClass != nil" object file lineNumber description];

LABEL_3:
  if (UniformTypeIdentifiers::Type::isTagValid((UniformTypeIdentifiers::Type *)tag, (__CFString *)tagClass, tag))
  {
    id v10 = (void *)MEMORY[0x1E4F22490];
    v11 = [(UTType *)supertype identifier];
    id v12 = [v10 typeRecordWithTag:tag ofClass:tagClass conformingToIdentifier:v11];

    if (v12)
    {
      v13 = +[UTType _typeWithTypeRecord:v12 detachTypeRecord:1 findConstant:1];
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return (UTType *)v13;
}

+ (UTType)typeWithFilenameExtension:(NSString *)filenameExtension conformingToType:(UTType *)supertype
{
  return (UTType *)[a1 typeWithTag:filenameExtension tagClass:@"public.filename-extension" conformingToType:supertype];
}

+ (UTType)_typeOfCurrentDevice
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  LOBYTE(v13) = 0;
  char v14 = 0;
  if (qword_1EB20A5E8 != -1) {
    dispatch_once(&qword_1EB20A5E8, &__block_literal_global_42);
  }
  if (!_MergedGlobals) {
    goto LABEL_15;
  }
  v2 = getenv("__UTModelCodeOverride");
  if (!v2)
  {
    BOOL v7 = getenv("__UTEnclosureColorOverride");
    if (!v7) {
      goto LABEL_15;
    }
    BOOL v5 = v7;
    BOOL v6 = 0;
LABEL_9:
    if (strchr(v5, 44))
    {
      int v16 = 0;
      uint64_t v15 = 0;
      if (sscanf(v5, "%u,%u,%u", &v15, (char *)&v15 + 4, &v16) < 3)
      {
        if (v6)
        {
          unint64_t v8 = 0;
          uint64_t v9 = 0;
          char v10 = 0;
LABEL_21:
          unint64_t v13 = v9 | v8;
          char v14 = v10;
          UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCode(v6, (UniformTypeIdentifiers::ModelCode *)&v13, 3);
          id v11 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_22;
        }
        goto LABEL_15;
      }
      uint64_t v9 = 0;
      unint64_t v8 = ((unint64_t)BYTE4(v15) << 40) | ((unint64_t)v16 << 48) | ((unint64_t)v15 << 32);
    }
    else
    {
      unint64_t v8 = strtoll(v5, 0, 0) << 32;
      uint64_t v9 = 1;
    }
    char v10 = 1;
    goto LABEL_21;
  }
  uint64_t v3 = [NSString stringWithUTF8String:v2];
  v4 = getenv("__UTEnclosureColorOverride");
  if (v4)
  {
    BOOL v5 = v4;
    BOOL v6 = (UniformTypeIdentifiers::ModelCode *)v3;
    goto LABEL_9;
  }
  if (v3)
  {
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    char v10 = 0;
    BOOL v6 = (UniformTypeIdentifiers::ModelCode *)v3;
    goto LABEL_21;
  }
LABEL_15:
  if (qword_1EB20A5E0 != -1) {
    dispatch_once(&qword_1EB20A5E0, &__block_literal_global);
  }
  id v11 = (id)qword_1EB20A5D8;
LABEL_22:

  return (UTType *)v11;
}

void __48__UTType_DeviceModelCodes___typeOfCurrentDevice__block_invoke()
{
  v2[0] = 0;
  v2[8] = 0;
  uint64_t v0 = UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCode(0, (UniformTypeIdentifiers::ModelCode *)v2, 3);
  v1 = (void *)qword_1EB20A5D8;
  qword_1EB20A5D8 = v0;
}

+ (id)_typeWithDeviceModelCode:(id)a3
{
  if (!a3)
  {
    unint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"UTModelCode.mm", 89, @"Invalid parameter not satisfying: %@", @"modelCode != nil" object file lineNumber description];
  }
  v9[0] = 0;
  v9[8] = 0;
  v4 = UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCode((UniformTypeIdentifiers::ModelCode *)a3, (UniformTypeIdentifiers::ModelCode *)v9, 1);

  return v4;
}

+ (id)_typeWithDeviceModelCode:(id)a3 enclosureColor:(UTHardwareColor)a4
{
  if (!a3)
  {
    char v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"UTModelCode.mm", 96, @"Invalid parameter not satisfying: %@", @"modelCode != nil" object file lineNumber description];
  }
  UTHardwareColor v11 = a4;
  char v12 = 1;
  BOOL v6 = UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCode((UniformTypeIdentifiers::ModelCode *)a3, (UniformTypeIdentifiers::ModelCode *)&v11, 1);

  return v6;
}

+ (id)_typeWithDeviceModelCodeWithoutResolvingCurrentDevice:(id)a3
{
  if (!a3)
  {
    unint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"UTModelCode.mm", 103, @"Invalid parameter not satisfying: %@", @"modelCode != nil" object file lineNumber description];
  }
  v9[0] = 0;
  v9[8] = 0;
  v4 = UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCodeAndHardwareColorWithoutResolvingCurrentDevice(a3, (UniformTypeIdentifiers::ModelCode *)v9);

  return v4;
}

- (BOOL)_getPreferredEnclosureColor:(UTHardwareColor *)a3
{
  if (!a3)
  {
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"UTModelCode.mm", 110, @"Invalid parameter not satisfying: %@", @"outEnclosureColor != NULL" object file lineNumber description];
  }
  return [(UTType *)self _getEnclosureColors:a3 count:1] == 1;
}

- (unint64_t)_getEnclosureColors:(UTHardwareColor *)a3 count:(unint64_t)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    unint64_t v4 = a4;
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"UTModelCode.mm", 119, @"Invalid parameter not satisfying: %@", @"outEnclosureColors != NULL" object file lineNumber description];

    a4 = v4;
  }
  unint64_t v39 = a4;
  if (!a4) {
    return 0;
  }
  if ([(UTType *)self conformsToType:&off_1EB20A410])
  {
    BOOL v6 = [(UTType *)self identifier];
    uint64_t v7 = [v6 rangeOfString:@"-" options:4];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v9 = 0;
    }
    else
    {
      char v10 = [v6 substringFromIndex:v7 + v8];
      unint64_t v11 = [v10 length];
      uint64_t v12 = 0;
      char v13 = 0;
      do
      {
        char v14 = (const void *)UniformTypeIdentifiers::ModelCode::getiOSHardwareColor(NSString *)::colors[v12];
        if (v14 && CFEqual(v14, v10))
        {
          unint64_t v4 = ((unint64_t)LOBYTE(UniformTypeIdentifiers::ModelCode::getiOSHardwareColor(NSString *)::colors[v12 + 1]) << 24) | ((unint64_t)BYTE1(UniformTypeIdentifiers::ModelCode::getiOSHardwareColor(NSString *)::colors[v12 + 1]) << 32) | ((unint64_t)BYTE2(UniformTypeIdentifiers::ModelCode::getiOSHardwareColor(NSString *)::colors[v12 + 1]) << 40);
          char v13 = 1;
        }
        v12 += 2;
      }
      while (v12 != 20);
      if (v13 || v11 < 3)
      {
        LOBYTE(v15) = 0;
        if (!v13 && v11 && v11 <= 2)
        {
          int v16 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v10];
          v45[0] = -1;
          int v17 = [v16 scanLongLong:v45];
          if (v45[0] >= 0) {
            int v18 = v17;
          }
          else {
            int v18 = 0;
          }
          BOOL v19 = v45[0] < 0x80000000;
          char v13 = v18 & v19;
          LOBYTE(v15) = (v18 & v19) != 0;
          if ((v18 & v19) != 0) {
            unint64_t v4 = v45[0] << 24;
          }
        }
      }
      else
      {
        int v44 = 0;
        LODWORD(v45[0]) = 0;
        char v13 = 0;
        LOBYTE(v15) = 0;
        if (sscanf((const char *)[v10 UTF8String], "%x%n", v45, &v44) == 1
          && v44 == 6)
        {
          unint64_t v15 = ((unint64_t)LOBYTE(v45[0]) << 48) | ((unint64_t)BYTE1(v45[0]) << 40) | ((unint64_t)BYTE2(v45[0]) << 32);
          unint64_t v4 = v15 >> 8;
          char v13 = 1;
        }
      }
      if (v13)
      {
        *a3 = (UTHardwareColor)(v15 | (v4 << 8));
        unint64_t v9 = 1;
      }
      else
      {
        unint64_t v9 = 0;
      }
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if (v9 >= v39) {
    return 1;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  unint64_t v20 = [(UTType *)self tags];
  uint64_t v21 = [v20 objectForKeyedSubscript:@"com.apple.device-model-code"];

  uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v41 != v23) {
          objc_enumerationMutation(v21);
        }
        long long v25 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v27 = [v25 rangeOfString:@"@ECOLOR="];
        if (v27 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v28 = v26;
          uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v25];
          [v29 setCharactersToBeSkipped:0];
          [v29 setScanLocation:v27 + v28];
          memset(v45, 0, 12);
          if ([v29 scanInt:v45])
          {
            if ([v29 scanString:@"," intoString:0]
              && [v29 scanInt:(char *)v45 + 4]
              && [v29 scanString:@"," intoString:0]
              && [v29 scanInt:&v45[1]])
            {
              int8x8_t v30 = vand_s8((int8x8_t)vmax_s32(*(int32x2_t *)((char *)v45 + 4), 0), (int8x8_t)0xFF000000FFLL);
              v31.i64[0] = v30.u32[0];
              v31.i64[1] = v30.u32[1];
              int64x2_t v32 = (int64x2_t)vshlq_u64(v31, (uint64x2_t)xmmword_19B03C870);
              unint64_t v33 = vorrq_s8((int8x16_t)vdupq_laneq_s64(v32, 1), (int8x16_t)v32).u64[0];
              unint64_t v34 = (unint64_t)(LOBYTE(v45[0]) & ~(SLODWORD(v45[0]) >> 31)) << 32;
            }
            else
            {
              unint64_t v33 = (unint64_t)LODWORD(v45[0]) << 32;
              unint64_t v34 = 1;
            }
            a3[v9++] = (UTHardwareColor)(v33 | v34);
            if (v9 >= v39)
            {

              goto LABEL_54;
            }
          }
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }
LABEL_54:

  return v9;
}

+ (id)_typeWithBluetoothProductID:(unsigned int)a3 vendorID:(unsigned __int16)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d:%d", a4, *(void *)&a3);
  BOOL v6 = +[UTType typeWithTag:v5 tagClass:@"public.bluetooth-vendor-product-id" conformingToType:&off_1EB20A250];
  uint64_t v7 = v6;
  if (v6)
  {
    BOOL v6 = (void *)[v6 isDeclared];
    if (v6)
    {
      id v8 = v7;
      id v9 = v8;
      goto LABEL_75;
    }
  }
  char v10 = UniformTypeIdentifiers::Accessory::log((UniformTypeIdentifiers::Accessory *)v6);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v17 = a3;
    _os_log_error_impl(&dword_19B02E000, v10, OS_LOG_TYPE_ERROR, "Failed to find type for bluetooth device '%d'", buf, 8u);
  }

  if ((int)a3 > 21759)
  {
    if ((int)a3 <= 28943)
    {
      if ((int)a3 > 28935)
      {
        if (a3 == 28936)
        {
          unint64_t v11 = "AppleTV6,2";
          goto LABEL_68;
        }
        if (a3 == 28943)
        {
          unint64_t v11 = "AudioAccessory1,1";
          goto LABEL_68;
        }
      }
      else
      {
        if (a3 == 21760)
        {
          unint64_t v11 = "Device1,21760";
          goto LABEL_68;
        }
        if (a3 == 28420)
        {
          unint64_t v11 = "AppleTV5,3";
          goto LABEL_68;
        }
      }
    }
    else if ((int)a3 <= 29714)
    {
      if (a3 == 28944)
      {
        unint64_t v11 = "AudioAccessory1,2";
        goto LABEL_68;
      }
      if (a3 == 29455)
      {
        unint64_t v11 = "AppleTV11,2";
        goto LABEL_68;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x7413u:
          unint64_t v11 = "AudioAccessory5,1";
          goto LABEL_68;
        case 0xFFFDu:
          unint64_t v11 = "HeGn";
          goto LABEL_68;
        case 0xFFFEu:
          unint64_t v11 = "ApGn";
          goto LABEL_68;
      }
    }
  }
  else
  {
    if ((int)a3 > 8193)
    {
      switch(a3)
      {
        case 0x2002u:
          unint64_t v11 = "AirPods1,1";
          break;
        case 0x2003u:
          unint64_t v11 = "PowerBeats3,1";
          break;
        case 0x2005u:
          unint64_t v11 = "BeatsX1,1";
          break;
        case 0x2006u:
          unint64_t v11 = "BeatsSolo3,1";
          break;
        case 0x2009u:
          unint64_t v11 = "BeatsStudio3,2";
          break;
        case 0x200Au:
          unint64_t v11 = "Device1,8202";
          break;
        case 0x200Bu:
          unint64_t v11 = "PowerbeatsPro1,1";
          break;
        case 0x200Cu:
          unint64_t v11 = "BeatsSoloPro1,1";
          break;
        case 0x200Du:
          unint64_t v11 = "Powerbeats4,1";
          break;
        case 0x200Eu:
          unint64_t v11 = "AirPodsPro1,1";
          break;
        case 0x200Fu:
          unint64_t v11 = "AirPods1,3";
          break;
        case 0x2010u:
          unint64_t v11 = "Device1,8208";
          break;
        case 0x2011u:
          unint64_t v11 = "BeatsStudioBuds1,1";
          break;
        case 0x2012u:
          unint64_t v11 = "Device1,8210";
          break;
        case 0x2013u:
          unint64_t v11 = "Device1,8211";
          break;
        case 0x2014u:
          unint64_t v11 = "Device1,8212";
          break;
        case 0x2015u:
          unint64_t v11 = "Device1,8213";
          break;
        case 0x2016u:
          unint64_t v11 = "BeatsStudioBuds1,2";
          break;
        case 0x2017u:
          unint64_t v11 = "BeatsStudioPro1,1";
          break;
        case 0x2018u:
          unint64_t v11 = "Device1,8216";
          break;
        case 0x2019u:
          unint64_t v11 = "Device1,8217";
          break;
        case 0x201Au:
          unint64_t v11 = "Device1,8218";
          break;
        case 0x201Bu:
          unint64_t v11 = "Device1,8219";
          break;
        case 0x201Cu:
          unint64_t v11 = "Device1,8220";
          break;
        case 0x201Du:
          unint64_t v11 = "Device1,8221";
          break;
        case 0x201Eu:
          unint64_t v11 = "Device1,8222";
          break;
        case 0x201Fu:
          unint64_t v11 = "Device1,8223";
          break;
        case 0x2020u:
          unint64_t v11 = "Device1,8224";
          break;
        case 0x2024u:
          unint64_t v11 = "Device1,8228";
          break;
        case 0x2025u:
          unint64_t v11 = "Device1,8229";
          break;
        case 0x2026u:
          unint64_t v11 = "Device1,8230";
          break;
        default:
          goto LABEL_67;
      }
      goto LABEL_68;
    }
    switch(a3)
    {
      case 0u:
        unint64_t v11 = "Invalid";
        goto LABEL_68;
      case 0x266u:
        unint64_t v11 = "ATVRemote1,1";
        goto LABEL_68;
      case 0x26Du:
        unint64_t v11 = "ATVRemote1,2";
        goto LABEL_68;
    }
  }
LABEL_67:
  unint64_t v11 = "?";
LABEL_68:
  uint64_t v12 = [NSString stringWithUTF8String:v11];
  id v8 = +[UTType _typeWithDeviceModelCodeWithoutResolvingCurrentDevice:v12];

  if (v8 && (char v13 = (UniformTypeIdentifiers::Accessory *)[v8 isDeclared], v13))
  {
    id v9 = v8;
  }
  else
  {
    char v14 = UniformTypeIdentifiers::Accessory::log(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v17 = a3;
      _os_log_impl(&dword_19B02E000, v14, OS_LOG_TYPE_DEFAULT, "Failed to find type for bluetooth device '%d' via model code", buf, 8u);
    }

    id v9 = 0;
  }

LABEL_75:

  return v9;
}

+ (UTType)new
{
}

- (UTType)init
{
}

+ (UTType)typeWithFilenameExtension:(NSString *)filenameExtension
{
  return (UTType *)[a1 typeWithTag:filenameExtension tagClass:@"public.filename-extension" conformingToType:&off_1EB2090D0];
}

+ (UTType)typeWithMIMEType:(NSString *)mimeType
{
  return (UTType *)[a1 typeWithTag:mimeType tagClass:@"public.mime-type" conformingToType:&off_1EB2090D0];
}

+ (UTType)typeWithMIMEType:(NSString *)mimeType conformingToType:(UTType *)supertype
{
  return (UTType *)[a1 typeWithTag:mimeType tagClass:@"public.mime-type" conformingToType:supertype];
}

- (NSString)preferredMIMEType
{
  return (NSString *)[(UTType *)self _preferredTagOfClass:@"public.mime-type"];
}

- (NSString)localizedDescription
{
  v2 = [(UTType *)self _typeRecord];
  uint64_t v3 = [v2 localizedDescription];

  return (NSString *)v3;
}

- (NSNumber)version
{
  v2 = [(UTType *)self _typeRecord];
  uint64_t v3 = [v2 version];

  return (NSNumber *)v3;
}

- (NSURL)referenceURL
{
  v2 = [(UTType *)self _typeRecord];
  uint64_t v3 = [v2 referenceURL];

  return (NSURL *)v3;
}

- (BOOL)isPublicType
{
  v2 = [(UTType *)self _typeRecord];
  char v3 = [v2 isInPublicDomain];

  return v3;
}

+ (void)_enumerateAllDeclaredTypesUsingBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    char v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"UTType.mm", 204, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
  }
  unsigned __int8 v19 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v4 = [MEMORY[0x1E4F22490] enumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
LABEL_5:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v16 != v6) {
        objc_enumerationMutation(v4);
      }
      uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * v7);
      id v9 = (void *)MEMORY[0x19F387810]();
      char v10 = +[UTType _typeWithTypeRecord:v8 detachTypeRecord:1 findConstant:1];
      if (v10) {
        (*((void (**)(id, void *, unsigned __int8 *))a3 + 2))(a3, v10, &v19);
      }

      int v11 = v19;
      if (v11) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v5) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
}

+ (id)_typesWithIdentifiers:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v31 = 0;
  int64x2_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  unint64_t v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(__CFString **)(*((void *)&v27 + 1) + 8 * i);
        id v9 = __UTFindCoreTypesConstantWithIdentifier(v8, 0x7FFFFFFFFFFFFFFFuLL);
        if ([v9 _isRealized])
        {
          char v10 = (void *)v32[5];
          if (!v10)
          {
            uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
            uint64_t v12 = (void *)v32[5];
            v32[5] = v11;

            char v10 = (void *)v32[5];
          }
          [v10 setObject:v9 forKeyedSubscript:v8];
          if (!v5) {
            uint64_t v5 = (void *)[v3 mutableCopy];
          }
          [v5 removeObject:v8];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v4);

    if (v5)
    {
      uint64_t v13 = [v5 count];
      id v14 = v5;
      if (!v13) {
        goto LABEL_30;
      }
      goto LABEL_19;
    }
  }
  else
  {

    uint64_t v5 = 0;
  }
  id v14 = v3;
LABEL_19:
  long long v15 = [MEMORY[0x1E4F22490] typeRecordsWithIdentifiers:v14];
  long long v16 = v15;
  if (v15)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __32__UTType__typesWithIdentifiers___block_invoke;
    v23[3] = &unk_1E583E890;
    uint64_t v26 = &v31;
    id v17 = v15;
    id v24 = v17;
    id v25 = v3;
    [v17 enumerateKeysAndObjectsUsingBlock:v23];
    if (qword_1EB20A668 != -1) {
      dispatch_once(&qword_1EB20A668, &__block_literal_global_2);
    }
    if (_MergedGlobals_2)
    {
      unint64_t v18 = [v17 count];
      uint64_t v19 = v18;
      if (v18)
      {
        if (v18 > 0x80)
        {
          uint64_t v37 = 0;
          std::vector<UTTypeRecord *>::vector(__p, v18, &v37);
          [v17 getObjects:__p[0] andKeys:0 count:v19];
          _UTDetachTypeRecords((uint64_t)__p[0], v19);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
        }
        else
        {
          bzero(__p, 0x400uLL);
          [v17 getObjects:__p andKeys:0 count:v19];
          _UTDetachTypeRecords((uint64_t)__p, v19);
        }
      }
    }
  }
LABEL_30:
  unint64_t v20 = (void *)v32[5];
  if (v20) {
    uint64_t v21 = objc_msgSend(v20, "copy", v14);
  }
  else {
    uint64_t v21 = (void *)MEMORY[0x1E4F1CC08];
  }

  _Block_object_dispose(&v31, 8);

  return v21;
}

void __32__UTType__typesWithIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = +[UTType _typeWithTypeRecord:a3 detachTypeRecord:0 findConstant:1];
  if (v5)
  {
    id v13 = v5;
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    uint64_t v9 = [*(id *)(a1 + 40) member:a2];
    char v10 = (void *)v9;
    if (v9) {
      uint64_t v11 = (void *)v9;
    }
    else {
      uint64_t v11 = a2;
    }
    id v12 = v11;

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v13 forKeyedSubscript:v12];
    uint64_t v5 = v13;
  }
}

- (id)_localizedDescriptionWithPreferredLocalizations:(id)a3
{
  if (!a3)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"UTType.mm", 278, @"Invalid parameter not satisfying: %@", @"preferredLocalizations != nil" object file lineNumber description];
  }
  uint64_t v5 = [(UTType *)self _typeRecord];
  uint64_t v6 = [v5 localizedDescriptionWithPreferredLocalizations:a3];

  return v6;
}

- (NSDictionary)_localizedDescriptionDictionary
{
  v2 = [(UTType *)self identifier];
  id v3 = (void *)_UTTypeCopyDescriptionLocalizationDictionary();

  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  uint64_t v5 = v4;

  return v5;
}

- (NSString)_kindString
{
  v2 = [(UTType *)self identifier];
  id v3 = (void *)_UTTypeCopyKindStringForNonMaterializedItem();

  return (NSString *)v3;
}

- (id)_kindStringWithPreferredLocalizations:(id)a3
{
  if (!a3)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UTType.mm", 305, @"Invalid parameter not satisfying: %@", @"preferredLocalizations != nil" object file lineNumber description];
  }
  uint64_t v4 = [(UTType *)self identifier];
  uint64_t v5 = (void *)_UTTypeCopyKindStringForNonMaterializedItem();

  return v5;
}

- (NSDictionary)_kindStringDictionary
{
  v2 = [(UTType *)self identifier];
  id v3 = (void *)_UTTypeCopyKindStringDictionaryForNonMaterializedItem();
  uint64_t v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  uint64_t v5 = v3;

  return v5;
}

+ (id)_typeOfItemAtFileURL:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v14 = 0;
  int v6 = [a3 getResourceValue:&v14 forKey:*MEMORY[0x1E4F1C538] error:a4];
  id v7 = v14;
  uint64_t v8 = v7;
  if (v6) {
    BOOL v9 = a4 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9 && v7 == 0)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F289D0];
    v16[0] = a3;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    *a4 = (id)[v11 initWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:v12];
  }

  return v8;
}

+ (id)_typeOfPromiseAtFileURL:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (([a3 isFileURL] & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"UTType.mm", 332, @"Invalid parameter not satisfying: %@", @"promiseURL.fileURL" object file lineNumber description];

    if (!a4) {
      return 0;
    }
    goto LABEL_3;
  }
  if (a4)
  {
LABEL_3:
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v12 = *MEMORY[0x1E4F289D0];
    v13[0] = a3;
    BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *a4 = (id)[v8 initWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:v9];
  }
  return 0;
}

- (NSOrderedSet)_parentTypes
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  uint64_t v4 = (void *)MEMORY[0x19F387810]();
  uint64_t v5 = [(UTType *)self _typeRecord];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __22__UTType__parentTypes__block_invoke;
  v27[3] = &unk_1E583E8B8;
  id v6 = v3;
  id v28 = v6;
  [v5 enumerateParentTypesWithBlock:v27];

  id v7 = v6;
  if (qword_1EB20A668 != -1) {
    dispatch_once(&qword_1EB20A668, &__block_literal_global_2);
  }
  if (_MergedGlobals_2)
  {
    unint64_t v8 = [v7 count];
    if (v8)
    {
      if (v8 > 0x80)
      {
        v33[0] = 0;
        std::vector<UTTypeRecord *>::vector(__p, v8, v33);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v17 = v7;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v33 count:16];
        if (v18)
        {
          uint64_t v19 = 0;
          uint64_t v20 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v35 != v20) {
                objc_enumerationMutation(v17);
              }
              unint64_t v22 = (unint64_t)*(id *)(*((void *)&v34 + 1) + 8 * i);
              uint64_t v23 = (void *)v22;
              if ((v22 & 0x8000000000000000) == 0 && [(id)v22 _constantIndex] < 0)
              {
                id v24 = (id)[v23 _typeRecord];
                if (v24) {
                  *((void *)__p[0] + v19++) = v24;
                }
              }
            }
            uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v33 count:16];
          }
          while (v18);

          if (v19) {
            _UTDetachTypeRecords((uint64_t)__p[0], v19);
          }
        }
        else
        {
        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      else
      {
        bzero(v33, 0x400uLL);
        *(_OWORD *)__p = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v9 = v7;
        uint64_t v10 = [v9 countByEnumeratingWithState:__p objects:&v34 count:16];
        if (v10)
        {
          uint64_t v11 = 0;
          uint64_t v12 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v30 != v12) {
                objc_enumerationMutation(v9);
              }
              unint64_t v14 = (unint64_t)*((id *)__p[1] + j);
              uint64_t v15 = (void *)v14;
              if ((v14 & 0x8000000000000000) == 0 && [(id)v14 _constantIndex] < 0)
              {
                id v16 = (id)[v15 _typeRecord];
                if (v16) {
                  v33[v11++] = (uint64_t)v16;
                }
              }
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:__p objects:&v34 count:16];
          }
          while (v10);

          if (v11) {
            _UTDetachTypeRecords((uint64_t)v33, v11);
          }
        }
        else
        {
        }
      }
    }
  }

  id v25 = (void *)[v7 copy];

  return (NSOrderedSet *)v25;
}

void __22__UTType__parentTypes__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = +[UTType _typeWithTypeRecord:a2 detachTypeRecord:0 findConstant:1];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (NSSet)_childTypes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = (void *)MEMORY[0x19F387810]();
  uint64_t v5 = [(UTType *)self _typeRecord];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __21__UTType__childTypes__block_invoke;
  v9[3] = &unk_1E583E8B8;
  id v6 = v3;
  id v10 = v6;
  [v5 enumerateChildTypesWithBlock:v9];

  UniformTypeIdentifiers::Type::detachTypeRecordsInTypes<NSMutableSet<UTType *> * {__strong}>(v6);
  id v7 = (void *)[v6 copy];

  return (NSSet *)v7;
}

void __21__UTType__childTypes__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = +[UTType _typeWithTypeRecord:a2 detachTypeRecord:0 findConstant:1];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (NSSet)_subtypes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = (void *)MEMORY[0x19F387810]();
  uint64_t v5 = [(UTType *)self _typeRecord];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __19__UTType__subtypes__block_invoke;
  v9[3] = &unk_1E583E8B8;
  id v6 = v3;
  id v10 = v6;
  [v5 enumerateDescendantsWithBlock:v9];

  UniformTypeIdentifiers::Type::detachTypeRecordsInTypes<NSMutableSet<UTType *> * {__strong}>(v6);
  id v7 = (void *)[v6 copy];

  return (NSSet *)v7;
}

void __19__UTType__subtypes__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = +[UTType _typeWithTypeRecord:a2 detachTypeRecord:0 findConstant:1];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (BOOL)_isExported
{
  v2 = [(UTType *)self _typeRecord];
  char v3 = [v2 isExported];

  return v3;
}

- (BOOL)_isImported
{
  v2 = [(UTType *)self _typeRecord];
  char v3 = [v2 isImported];

  return v3;
}

- (BOOL)_isWildcard
{
  v2 = [(UTType *)self _typeRecord];
  char v3 = [v2 isWildcard];

  return v3;
}

- (BOOL)_isCoreType
{
  v2 = [(UTType *)self _typeRecord];
  char v3 = v2;
  if (v2) {
    char v4 = [v2 isCoreType];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (void)_unrealizeAllCoreTypes
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = _UTGetAllCoreTypesConstants();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "_unrealize", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (BOOL)_isRealized
{
  return 1;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  Class Class = object_getClass(self);
  uint64_t v5 = [(UTType *)self identifier];
  BOOL v6 = [(UTType *)self isDynamic];
  BOOL v7 = [(UTType *)self isDeclared];
  long long v8 = @"not ";
  if (v6) {
    long long v9 = &stru_1EEABA4F8;
  }
  else {
    long long v9 = @"not ";
  }
  if (v7) {
    long long v8 = &stru_1EEABA4F8;
  }
  id v10 = (void *)[v3 initWithFormat:@"<%@ %p> %@ (%@dynamic, %@declared)", Class, self, v5, v9, v8];

  return v10;
}

- (BOOL)isSupertypeOfType:(UTType *)type
{
  if (!type)
  {
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"UTType.mm", 641, @"Invalid parameter not satisfying: %@", @"type != nil" object file lineNumber description];
  }

  return [(UTType *)type isSubtypeOfType:self];
}

- (BOOL)isSubtypeOfType:(UTType *)type
{
  if (!type)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UTType.mm", 648, @"Invalid parameter not satisfying: %@", @"type != nil" object file lineNumber description];
  }
  if (self == type) {
    return 0;
  }
  uint64_t v5 = [(UTType *)self identifier];
  BOOL v6 = [(UTType *)type identifier];
  BOOL v7 = !_UTIdentifiersAreEqual(v5, v6) && [(UTType *)self conformsToType:type];

  return v7;
}

- (NSSet)supertypes
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = [(UTType *)self _typeRecord];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __33__UTType_Conformance__supertypes__block_invoke;
  v25[3] = &unk_1E583E8B8;
  id v5 = v3;
  id v26 = v5;
  [v4 enumeratePedigreeWithBlock:v25];

  id v6 = (id)[v5 copy];
  if (qword_1EB20A668 != -1) {
    dispatch_once(&qword_1EB20A668, &__block_literal_global_2);
  }
  if (_MergedGlobals_2)
  {
    unint64_t v7 = [v6 count];
    if (v7)
    {
      if (v7 > 0x80)
      {
        v31[0] = 0;
        std::vector<UTTypeRecord *>::vector(__p, v7, v31);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v16 = v6;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v31 count:16];
        if (v17)
        {
          uint64_t v18 = 0;
          uint64_t v19 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v33 != v19) {
                objc_enumerationMutation(v16);
              }
              unint64_t v21 = (unint64_t)*(id *)(*((void *)&v32 + 1) + 8 * i);
              unint64_t v22 = (void *)v21;
              if ((v21 & 0x8000000000000000) == 0 && [(id)v21 _constantIndex] < 0)
              {
                id v23 = (id)[v22 _typeRecord];
                if (v23) {
                  *((void *)__p[0] + v18++) = v23;
                }
              }
            }
            uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v31 count:16];
          }
          while (v17);

          if (v18) {
            _UTDetachTypeRecords((uint64_t)__p[0], v18);
          }
        }
        else
        {
        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      else
      {
        bzero(v31, 0x400uLL);
        *(_OWORD *)__p = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v8 = v6;
        uint64_t v9 = [v8 countByEnumeratingWithState:__p objects:&v32 count:16];
        if (v9)
        {
          uint64_t v10 = 0;
          uint64_t v11 = *(void *)v28;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v28 != v11) {
                objc_enumerationMutation(v8);
              }
              unint64_t v13 = (unint64_t)*((id *)__p[1] + j);
              unint64_t v14 = (void *)v13;
              if ((v13 & 0x8000000000000000) == 0 && [(id)v13 _constantIndex] < 0)
              {
                id v15 = (id)[v14 _typeRecord];
                if (v15) {
                  v31[v10++] = (uint64_t)v15;
                }
              }
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:__p objects:&v32 count:16];
          }
          while (v9);

          if (v10) {
            _UTDetachTypeRecords((uint64_t)v31, v10);
          }
        }
        else
        {
        }
      }
    }
  }

  return (NSSet *)v6;
}

void __33__UTType_Conformance__supertypes__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)MEMORY[0x19F387810]();
  id v5 = +[UTType _typeWithTypeRecord:a2 detachTypeRecord:0 findConstant:1];
  [*(id *)(a1 + 32) addObject:v5];
}

- (NSDictionary)tags
{
  v2 = [(UTType *)self _typeRecord];
  id v3 = [v2 tagSpecification];
  uint64_t v4 = [v3 _expensiveDictionaryRepresentation];
  id v5 = v4;
  if (!v4) {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v6 = v4;

  return v6;
}

+ (UTType)exportedTypeWithIdentifier:(NSString *)identifier conformingToType:(UTType *)parentType
{
  if (!parentType)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"UTType.mm", 751, @"Invalid parameter not satisfying: %@", @"parentType != nil" object file lineNumber description];
  }
  int v6 = __UTGetDeclarationStatusFromInfoPlist(identifier, 1, 0, v4);
  if (v6) {
    __UNIFORM_TYPE_IDENTIFIER_WAS_NOT_DECLARED_IN_INFO_PLIST_OF_BUNDLE__((uint64_t)identifier, 1, 0, v6);
  }

  return (UTType *)UniformTypeIdentifiers::Type::getExportedType((__CFString *)identifier, 0, v7, v8);
}

+ (UTType)importedTypeWithIdentifier:(NSString *)identifier
{
  int v5 = __UTGetDeclarationStatusFromInfoPlist(identifier, 0, 0, v3);
  if (v5) {
    __UNIFORM_TYPE_IDENTIFIER_WAS_NOT_DECLARED_IN_INFO_PLIST_OF_BUNDLE__((uint64_t)identifier, 0, 0, v5);
  }

  return (UTType *)UniformTypeIdentifiers::Type::getImportedType((UniformTypeIdentifiers::Type *)identifier, 0, 0, v6);
}

+ (UTType)importedTypeWithIdentifier:(NSString *)identifier conformingToType:(UTType *)parentType
{
  if (!parentType)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"UTType.mm", 765, @"Invalid parameter not satisfying: %@", @"parentType != nil" object file lineNumber description];
  }
  int v7 = __UTGetDeclarationStatusFromInfoPlist(identifier, 0, 0, v4);
  if (v7) {
    __UNIFORM_TYPE_IDENTIFIER_WAS_NOT_DECLARED_IN_INFO_PLIST_OF_BUNDLE__((uint64_t)identifier, 0, 0, v7);
  }

  return (UTType *)UniformTypeIdentifiers::Type::getImportedType((UniformTypeIdentifiers::Type *)identifier, (NSString *)&parentType->super.isa, 0, v8);
}

+ (id)_exportedTypeWithIdentifier:(id)a3 bundle:(id)a4 conformingToType:(id)a5
{
  int v8 = __UTGetDeclarationStatusFromInfoPlist(a3, 1, a4, v5);
  if (v8) {
    __UNIFORM_TYPE_IDENTIFIER_WAS_NOT_DECLARED_IN_INFO_PLIST_OF_BUNDLE__((uint64_t)a3, 1, a4, v8);
  }

  return UniformTypeIdentifiers::Type::getExportedType((__CFString *)a3, (NSString *)a4, v9, v10);
}

+ (id)_importedTypeWithIdentifier:(id)a3 bundle:(id)a4 conformingToType:(id)a5
{
  int v9 = __UTGetDeclarationStatusFromInfoPlist(a3, 0, a4, v5);
  if (v9) {
    __UNIFORM_TYPE_IDENTIFIER_WAS_NOT_DECLARED_IN_INFO_PLIST_OF_BUNDLE__((uint64_t)a3, 0, a4, v9);
  }

  return UniformTypeIdentifiers::Type::getImportedType((UniformTypeIdentifiers::Type *)a3, (NSString *)a5, (UTType *)a4, v10);
}

+ (id)_typeWithIdentifier:(id)a3 constantIndex:(int64_t)a4 error:(id *)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"UTType.mm", 916, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }
  if (a1 == UTType)
  {
    int v9 = __UTFindCoreTypesConstantWithIdentifier((__CFString *)a3, a4);
    if (v9) {
      goto LABEL_8;
    }
    unint64_t v13 = [MEMORY[0x1E4F22490] typeRecordWithIdentifier:a3];
    if (v13)
    {
      int v9 = +[UTType _typeWithTypeRecord:v13 detachTypeRecord:1 findConstant:0];
    }
    else
    {
      int v9 = 0;
    }

    if (!a5) {
      goto LABEL_8;
    }
  }
  else
  {
    int v9 = [a1 typeWithIdentifier:a3];
    if (!a5) {
      goto LABEL_8;
    }
  }
  if (!v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    v16[0] = *MEMORY[0x1E4F28228];
    v16[1] = @"UTIdentifier";
    v17[0] = @"Unrecognized type identifier.";
    v17[1] = a3;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    *a5 = (id)[v10 initWithDomain:*MEMORY[0x1E4F281F8] code:4864 userInfo:v11];

    int v9 = 0;
  }
LABEL_8:

  return v9;
}

- (BOOL)_shouldURLPropertyProviderEncodeTypeRecord
{
  return (unint64_t)[(UTType *)self _constantIndex] >> 63;
}

+ (id)_typeWithIdentifier:(id)a3 allowUndeclared:(BOOL)a4
{
  return _UTTypeGetForIdentifier((__CFString *)a3, a4);
}

@end