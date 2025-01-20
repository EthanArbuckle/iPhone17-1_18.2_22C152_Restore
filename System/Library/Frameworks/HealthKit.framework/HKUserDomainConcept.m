@interface HKUserDomainConcept
+ (BOOL)supportsSecureCoding;
+ (id)_typeIdentifier;
+ (id)deletedUserDomainConceptWithUUID:(id)a3 creationTimestamp:(double)a4;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion;
- (BOOL)canRequestSyncUponInsertion;
- (BOOL)isAdHocUserDomainConcept;
- (BOOL)isDeleted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSemanticallyEquivalent:(id)a3;
- (BOOL)unitTesting_isIdentical:(id)a3;
- (BOOL)unitTesting_isIdentical:(id)a3 ignoreModificationTimestamp:(BOOL)a4;
- (HKMedicalCodingCollection)codingCollection;
- (HKUserDomainConcept)init;
- (HKUserDomainConcept)initWithCoder:(id)a3;
- (HKUserDomainConcept)initWithCodingCollection:(id)a3 linkCollection:(id)a4 propertyCollection:(id)a5;
- (HKUserDomainConceptLinkCollection)linkCollection;
- (HKUserDomainConceptPropertyCollection)propertyCollection;
- (HKUserDomainConceptSemanticIdentifier)semanticIdentifier;
- (HKUserDomainConceptTypeIdentifier)identifier;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSString)build;
- (NSUUID)UUID;
- (double)creationTimestamp;
- (double)modificationTimestamp;
- (id)_dataDescriptionAllowedForPublic:(BOOL)a3;
- (id)_deepCopy;
- (id)_firstCodingForSystem:(id)a3;
- (id)_init;
- (id)copyUserDomainConceptByMergingInConcept:(id)a3;
- (id)copyUserDomainConceptByMergingInPropertyCollection:(id)a3;
- (id)copyUserDomainConceptBySettingProperties:(id)a3;
- (id)deletedUserDomainConcept;
- (id)description;
- (id)descriptionAllowedForPublic:(BOOL)a3;
- (id)firstAdhocCoding;
- (id)firstConceptIdentifier;
- (id)firstOntologyCoding;
- (id)modificationCopy;
- (id)unitTesting_duplicate;
- (id)userDomainConceptByAddingCodings:(id)a3;
- (id)userDomainConceptByReplacingCodings:(id)a3;
- (id)userDomainConceptByReplacingLinks:(id)a3;
- (id)userDomainConceptByReplacingLinks:(id)a3 andCodings:(id)a4;
- (int64_t)healthd_use_only_syncEntityIdentity;
- (unint64_t)hash;
- (void)_setBuild:(id)a3;
- (void)_setCodingCollection:(id)a3;
- (void)_setCreationTimestamp:(double)a3;
- (void)_setDeleted:(BOOL)a3;
- (void)_setIdentifier:(id)a3;
- (void)_setLinkCollection:(id)a3;
- (void)_setModificationTimestamp:(double)a3;
- (void)_setOperatingSystemVersion:(id *)a3;
- (void)_setPropertyCollection:(id)a3;
- (void)_setUUID:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setHealthd_use_only_syncEntityIdentity:(int64_t)a3;
@end

@implementation HKUserDomainConcept

- (HKUserDomainConcept)initWithCodingCollection:(id)a3 linkCollection:(id)a4 propertyCollection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)HKUserDomainConcept;
  v11 = [(HKUserDomainConcept *)&v30 init];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
    v13 = (void *)*((void *)v11 + 2);
    *((void *)v11 + 2) = v12;

    uint64_t v14 = [(id)objc_opt_class() _typeIdentifier];
    v15 = (void *)*((void *)v11 + 5);
    *((void *)v11 + 5) = v14;

    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    *((CFAbsoluteTime *)v11 + 6) = Current;
    *((CFAbsoluteTime *)v11 + 7) = Current;
    v17 = +[_HKBehavior sharedBehavior];
    v18 = v17;
    if (v17)
    {
      [v17 currentOSVersionStruct];
    }
    else
    {
      long long v28 = 0uLL;
      uint64_t v29 = 0;
    }
    *(_OWORD *)(v11 + 88) = v28;
    *((void *)v11 + 13) = v29;
    uint64_t v19 = [v18 currentOSBuild];
    v20 = (void *)*((void *)v11 + 8);
    *((void *)v11 + 8) = v19;

    v11[8] = 0;
    uint64_t v21 = [v8 copy];
    v22 = (void *)*((void *)v11 + 3);
    *((void *)v11 + 3) = v21;

    uint64_t v23 = [v9 copy];
    v24 = (void *)*((void *)v11 + 4);
    *((void *)v11 + 4) = v23;

    uint64_t v25 = [v10 copy];
    v26 = (void *)*((void *)v11 + 10);
    *((void *)v11 + 10) = v25;
  }
  return (HKUserDomainConcept *)v11;
}

- (id)description
{
  return [(HKUserDomainConcept *)self descriptionAllowedForPublic:1];
}

- (id)descriptionAllowedForPublic:(BOOL)a3
{
  uint64_t v4 = [(HKUserDomainConcept *)self _dataDescriptionAllowedForPublic:a3];
  uint64_t v25 = (void *)v4;
  if (v4)
  {
    v5 = [NSString stringWithFormat:@" %@", v4];
  }
  else
  {
    v5 = &stru_1EEC60288;
  }
  v24 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v23 = objc_opt_class();
  v22 = [(HKUserDomainConceptTypeIdentifier *)self->_identifier schema];
  int64_t v6 = [(HKUserDomainConceptTypeIdentifier *)self->_identifier code];
  v7 = [(NSUUID *)self->_UUID hk_shortRepresentation];
  id v8 = [(HKUserDomainConcept *)self creationDate];
  id v9 = HKDiagnosticStringFromDate(v8);
  id v10 = [(HKUserDomainConcept *)self modificationDate];
  v11 = HKDiagnosticStringFromDate(v10);
  build = self->_build;
  long long v26 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
  int64_t patchVersion = self->_operatingSystemVersion.patchVersion;
  v13 = HKNSOperatingSystemVersionString(&v26);
  uint64_t v14 = [v24 stringWithFormat:@"<%@ %@ %ld %@%@, (%@), (%@), %@ (%@)", v23, v22, v6, v7, v5, v9, v11, build, v13];

  uint64_t v15 = [(HKMedicalCodingCollection *)self->_codingCollection count];
  v16 = "s";
  if (v15 >= 1)
  {
    if (v15 == 1) {
      v17 = "";
    }
    else {
      v17 = "s";
    }
    [v14 appendFormat:@", %ld coding%s", v15, v17];
  }
  uint64_t v18 = [(HKUserDomainConceptLinkCollection *)self->_linkCollection count];
  if (v18 >= 1)
  {
    if (v18 == 1) {
      v16 = "";
    }
    [v14 appendFormat:@", %ld link%s %ld", v18, v16, -[HKUserDomainConceptLinkCollection epoch](self->_linkCollection, "epoch")];
  }
  uint64_t v19 = [(HKUserDomainConceptPropertyCollection *)self->_propertyCollection count];
  if (v19 >= 1)
  {
    v20 = @"properties";
    if (v19 == 1) {
      v20 = @"property";
    }
    [v14 appendFormat:@", %ld %@", v19, v20];
  }
  [v14 appendString:@">"];

  return v14;
}

- (HKUserDomainConcept)init
{
  return [(HKUserDomainConcept *)self initWithCodingCollection:0 linkCollection:0 propertyCollection:0];
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)HKUserDomainConcept;
  return [(HKUserDomainConcept *)&v3 init];
}

- (id)userDomainConceptByAddingCodings:(id)a3
{
  id v4 = a3;
  v5 = [(HKUserDomainConcept *)self modificationCopy];
  codingCollection = self->_codingCollection;
  if (codingCollection)
  {
    v7 = [(HKMedicalCodingCollection *)codingCollection collectionByAddingCodings:v4];
  }
  else
  {
    v7 = [[HKMedicalCodingCollection alloc] initWithCodings:v4];
  }
  id v8 = v7;
  [v5 _setCodingCollection:v7];

  return v5;
}

- (id)userDomainConceptByReplacingCodings:(id)a3
{
  id v4 = a3;
  v5 = [(HKUserDomainConcept *)self modificationCopy];
  int64_t v6 = [[HKMedicalCodingCollection alloc] initWithCodings:v4];

  [v5 _setCodingCollection:v6];

  return v5;
}

- (id)userDomainConceptByReplacingLinks:(id)a3
{
  id v4 = a3;
  v5 = [(HKUserDomainConcept *)self modificationCopy];
  [v5 _setLinkCollection:v4];

  return v5;
}

- (id)userDomainConceptByReplacingLinks:(id)a3 andCodings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HKUserDomainConcept *)self modificationCopy];
  [v8 _setLinkCollection:v7];

  id v9 = [[HKMedicalCodingCollection alloc] initWithCodings:v6];
  [v8 _setCodingCollection:v9];

  return v8;
}

- (id)copyUserDomainConceptBySettingProperties:(id)a3
{
  id v4 = a3;
  v5 = [(HKUserDomainConcept *)self modificationCopy];
  id v6 = [[HKUserDomainConceptPropertyCollection alloc] initWithProperties:v4];

  [v5 _setPropertyCollection:v6];
  return v5;
}

- (id)copyUserDomainConceptByMergingInPropertyCollection:(id)a3
{
  id v4 = a3;
  v5 = [(HKUserDomainConcept *)self propertyCollection];
  id v6 = +[HKUserDomainConceptPropertyCollection propertyCollectionByMergingCollection:v5 otherCollection:v4];

  if (v6 == v5)
  {
    id v7 = self;
  }
  else
  {
    id v7 = [(HKUserDomainConcept *)self modificationCopy];
    [(HKUserDomainConcept *)v7 _setPropertyCollection:v6];
  }

  return v7;
}

- (id)copyUserDomainConceptByMergingInConcept:(id)a3
{
  id v4 = a3;
  v5 = [(HKUserDomainConcept *)self propertyCollection];
  id v6 = [v4 propertyCollection];
  id v7 = +[HKUserDomainConceptPropertyCollection propertyCollectionByMergingCollection:v5 otherCollection:v6];

  id v8 = [(HKUserDomainConcept *)self linkCollection];
  id v9 = [v4 linkCollection];

  id v10 = +[HKUserDomainConceptLinkCollection collectionByMergingCollection:v8 otherCollection:v9];

  if (v10 == v8)
  {
    int v11 = 1;
  }
  else
  {
    if (!v8)
    {
      LOBYTE(v11) = 0;
      goto LABEL_9;
    }
    int v11 = [v10 isEqual:v8];
  }
  if (v7 == v5 && v11)
  {
    uint64_t v12 = self;
    goto LABEL_13;
  }
LABEL_9:
  v13 = [(HKUserDomainConcept *)self modificationCopy];
  uint64_t v12 = v13;
  if (v7 != v5) {
    [(HKUserDomainConcept *)v13 _setPropertyCollection:v7];
  }
  if ((v11 & 1) == 0) {
    [(HKUserDomainConcept *)v12 _setLinkCollection:v10];
  }
LABEL_13:

  return v12;
}

- (id)deletedUserDomainConcept
{
  return +[HKUserDomainConcept deletedUserDomainConceptWithUUID:self->_UUID creationTimestamp:self->_creationTimestamp];
}

+ (id)deletedUserDomainConceptWithUUID:(id)a3 creationTimestamp:(double)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HKUserDomainConcept);
  id v7 = (void *)[v5 copy];

  [(HKUserDomainConcept *)v6 _setUUID:v7];
  [(HKUserDomainConcept *)v6 _setDeleted:1];
  [(HKUserDomainConcept *)v6 _setCreationTimestamp:a4];

  return v6;
}

- (id)modificationCopy
{
  v2 = [(HKUserDomainConcept *)self _deepCopy];
  [v2 _setModificationTimestamp:CFAbsoluteTimeGetCurrent()];
  objc_super v3 = +[_HKBehavior sharedBehavior];
  id v4 = v3;
  if (v3) {
    [v3 currentOSVersionStruct];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  [v2 _setOperatingSystemVersion:v7];
  id v5 = [v4 currentOSBuild];
  [v2 _setBuild:v5];

  return v2;
}

- (NSDate)creationDate
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_creationTimestamp];
}

- (NSDate)modificationDate
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_modificationTimestamp];
}

- (BOOL)isAdHocUserDomainConcept
{
  v2 = [(HKUserDomainConcept *)self firstAdhocCoding];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_UUID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKUserDomainConcept *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      UUID = self->_UUID;
      id v6 = [(HKUserDomainConcept *)v4 UUID];
      char v7 = [(NSUUID *)UUID isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)_deepCopy
{
  BOOL v3 = (void *)[objc_alloc((Class)objc_opt_class()) _initBareObject];
  id v4 = (void *)[(HKUserDomainConceptTypeIdentifier *)self->_identifier copy];
  [v3 _setIdentifier:v4];

  id v5 = (void *)[(NSUUID *)self->_UUID copy];
  [v3 _setUUID:v5];

  [v3 _setDeleted:self->_deleted];
  [v3 _setCreationTimestamp:self->_creationTimestamp];
  [v3 _setModificationTimestamp:self->_modificationTimestamp];
  $A44FF20282FB96BA82CF1B0FF6945C38 operatingSystemVersion = self->_operatingSystemVersion;
  [v3 _setOperatingSystemVersion:&operatingSystemVersion];
  id v6 = (void *)[(NSString *)self->_build copy];
  [v3 _setBuild:v6];

  [v3 _setCodingCollection:self->_codingCollection];
  [v3 _setLinkCollection:self->_linkCollection];
  [v3 _setPropertyCollection:self->_propertyCollection];

  return v3;
}

- (id)_dataDescriptionAllowedForPublic:(BOOL)a3
{
  if (self->_deleted) {
    return @"DELETED";
  }
  else {
    return 0;
  }
}

+ (id)_typeIdentifier
{
  return +[HKUserDomainConceptTypeIdentifier baseUserDomainConceptIdentifier];
}

- (BOOL)isSemanticallyEquivalent:(id)a3
{
  id v4 = a3;
  id v5 = [(HKUserDomainConcept *)self semanticIdentifier];
  id v6 = [v4 semanticIdentifier];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (HKUserDomainConceptSemanticIdentifier)semanticIdentifier
{
  v2 = [[HKBaseUserDomainConceptSemanticIdentifier alloc] initWithUUID:self->_UUID];

  return (HKUserDomainConceptSemanticIdentifier *)v2;
}

- (BOOL)canRequestSyncUponInsertion
{
  return self->_deleted;
}

- (id)firstOntologyCoding
{
  BOOL v3 = +[HKMedicalCodingSystem appleOntologySystem];
  id v4 = [(HKUserDomainConcept *)self _firstCodingForSystem:v3];

  return v4;
}

- (id)firstAdhocCoding
{
  BOOL v3 = +[HKMedicalCodingSystem adHocConceptSystem];
  id v4 = [(HKUserDomainConcept *)self _firstCodingForSystem:v3];

  return v4;
}

- (id)firstConceptIdentifier
{
  v2 = [(HKUserDomainConcept *)self firstOntologyCoding];
  BOOL v3 = [v2 code];

  if (v3) {
    id v4 = -[HKConceptIdentifier initWithRawIdentifier:]([HKConceptIdentifier alloc], "initWithRawIdentifier:", (int)[v3 intValue]);
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_firstCodingForSystem:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = [(HKUserDomainConcept *)self codingCollection];
  id v6 = [v5 codings];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v7)
  {
    id v9 = 0;
    goto LABEL_19;
  }
  uint64_t v8 = v7;
  id v9 = 0;
  uint64_t v10 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v22 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      uint64_t v13 = [v12 codingSystem];
      if ((id)v13 == v4)
      {

        if (v9)
        {
LABEL_12:
          v17 = [v9 code];
          uint64_t v18 = [v12 code];
          uint64_t v19 = [v17 compare:v18];

          if (v19 != 1) {
            continue;
          }
        }
LABEL_13:
        uint64_t v14 = v9;
        id v9 = v12;
        goto LABEL_14;
      }
      uint64_t v14 = (void *)v13;
      if (v4)
      {
        uint64_t v15 = [v12 codingSystem];
        int v16 = [v15 isEqual:v4];

        if (!v16) {
          continue;
        }
        if (v9) {
          goto LABEL_12;
        }
        goto LABEL_13;
      }
LABEL_14:
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v8);
LABEL_19:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  [v5 encodeObject:UUID forKey:@"uuid"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeDouble:@"created" forKey:self->_creationTimestamp];
  [v5 encodeDouble:@"modified" forKey:self->_modificationTimestamp];
  [v5 encodeInteger:self->_operatingSystemVersion.majorVersion forKey:@"major_version"];
  [v5 encodeInteger:self->_operatingSystemVersion.minorVersion forKey:@"minor_version"];
  [v5 encodeInteger:self->_operatingSystemVersion.patchVersion forKey:@"patch_version"];
  [v5 encodeObject:self->_build forKey:@"build"];
  [v5 encodeBool:self->_deleted forKey:@"deleted"];
  [v5 encodeObject:self->_codingCollection forKey:@"codingCollection"];
  [v5 encodeObject:self->_linkCollection forKey:@"linkCollection"];
  [v5 encodeObject:self->_propertyCollection forKey:@"propertyCollection"];
}

- (HKUserDomainConcept)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  [v4 decodeDoubleForKey:@"created"];
  double v8 = v7;
  [v4 decodeDoubleForKey:@"modified"];
  double v10 = v9;
  uint64_t v21 = [v4 decodeIntegerForKey:@"major_version"];
  uint64_t v20 = [v4 decodeIntegerForKey:@"minor_version"];
  uint64_t v11 = [v4 decodeIntegerForKey:@"patch_version"];
  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"build"];
  char v13 = [v4 decodeBoolForKey:@"deleted"];
  uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codingCollection"];
  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkCollection"];
  int v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"propertyCollection"];

  v22.receiver = self;
  v22.super_class = (Class)HKUserDomainConcept;
  v17 = [(HKUserDomainConcept *)&v22 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_UUID, v5);
    objc_storeStrong((id *)&v18->_identifier, v6);
    v18->_creationTimestamp = v8;
    v18->_modificationTimestamp = v10;
    v18->_operatingSystemVersion.majorVersion = v21;
    v18->_operatingSystemVersion.minorVersion = v20;
    v18->_operatingSystemVersion.int64_t patchVersion = v11;
    objc_storeStrong((id *)&v18->_build, v12);
    v18->_deleted = v13;
    objc_storeStrong((id *)&v18->_codingCollection, v14);
    objc_storeStrong((id *)&v18->_linkCollection, v15);
    objc_storeStrong((id *)&v18->_propertyCollection, v16);
  }

  return v18;
}

- (void)_setUUID:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (!v5)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HKUserDomainConcept.m", 445, @"Invalid parameter not satisfying: %@", @"UUID != nil" object file lineNumber description];

    id v5 = 0;
  }
  id v6 = (NSUUID *)[v5 copy];
  UUID = self->_UUID;
  self->_UUID = v6;
}

- (void)_setIdentifier:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (!v5)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HKUserDomainConcept.m", 451, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];

    id v5 = 0;
  }
  id v6 = (HKUserDomainConceptTypeIdentifier *)[v5 copy];
  identifier = self->_identifier;
  self->_identifier = v6;
}

- (void)_setDeleted:(BOOL)a3
{
  self->_deleted = a3;
}

- (void)_setCreationTimestamp:(double)a3
{
  self->_creationTimestamp = a3;
}

- (void)_setModificationTimestamp:(double)a3
{
  self->_modificationTimestamp = a3;
}

- (void)_setOperatingSystemVersion:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_operatingSystemVersion.int64_t patchVersion = a3->var2;
  *(_OWORD *)&self->_operatingSystemVersion.majorVersion = v3;
}

- (void)_setBuild:(id)a3
{
  self->_build = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setCodingCollection:(id)a3
{
  self->_codingCollection = (HKMedicalCodingCollection *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setLinkCollection:(id)a3
{
  self->_linkCollection = (HKUserDomainConceptLinkCollection *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setPropertyCollection:(id)a3
{
  self->_propertyCollection = (HKUserDomainConceptPropertyCollection *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)unitTesting_isIdentical:(id)a3
{
  return [(HKUserDomainConcept *)self unitTesting_isIdentical:a3 ignoreModificationTimestamp:0];
}

- (BOOL)unitTesting_isIdentical:(id)a3 ignoreModificationTimestamp:(BOOL)a4
{
  double v7 = (char *)a3;
  if ([(HKUserDomainConcept *)self isEqual:v7]
    && (a4 || self->_modificationTimestamp == *((double *)v7 + 7)))
  {
    UUID = self->_UUID;
    id v9 = (NSUUID *)*((void *)v7 + 2);
    if (UUID == v9 || v9 && -[NSUUID isEqual:](UUID, "isEqual:"))
    {
      identifier = self->_identifier;
      uint64_t v11 = (HKUserDomainConceptTypeIdentifier *)*((void *)v7 + 5);
      if ((identifier == v11 || v11 && -[HKUserDomainConceptTypeIdentifier isEqual:](identifier, "isEqual:"))
        && self->_deleted == v7[8]
        && self->_creationTimestamp == *((double *)v7 + 6))
      {
        long long v36 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
        int64_t patchVersion = self->_operatingSystemVersion.patchVersion;
        long long v34 = *(_OWORD *)(v7 + 88);
        uint64_t v35 = *((void *)v7 + 13);
        if (HKNSOperatingSystemVersionsEqual((uint64_t)&v36, (uint64_t)&v34))
        {
          build = self->_build;
          char v13 = (NSString *)*((void *)v7 + 8);
          if (build == v13 || v13 && -[NSString isEqual:](build, "isEqual:"))
          {
            uint64_t v14 = [(HKMedicalCodingCollection *)self->_codingCollection codingsSet];
            uint64_t v15 = [*((id *)v7 + 3) codingsSet];
            if (v14 == v15)
            {
              [(HKUserDomainConceptLinkCollection *)self->_linkCollection links];
            }
            else
            {
              uint64_t v16 = [*((id *)v7 + 3) codingsSet];
              if (!v16)
              {
                BOOL v19 = 0;
LABEL_40:

                goto LABEL_21;
              }
              id v4 = (void *)v16;
              v17 = [(HKMedicalCodingCollection *)self->_codingCollection codingsSet];
              uint64_t v18 = [*((id *)v7 + 3) codingsSet];
              if (![v17 isEqualToSet:v18])
              {
                BOOL v19 = 0;
LABEL_39:

                goto LABEL_40;
              }
              [(HKUserDomainConceptLinkCollection *)self->_linkCollection links];
            uint64_t v21 = };
            objc_super v22 = [*((id *)v7 + 4) links];
            if (v21 == v22)
            {
              propertyCollection = self->_propertyCollection;
              uint64_t v29 = (HKUserDomainConceptPropertyCollection *)*((void *)v7 + 10);
              BOOL v19 = propertyCollection == v29;
              if (propertyCollection != v29 && v29) {
                BOOL v19 = -[HKUserDomainConceptPropertyCollection isEqual:](propertyCollection, "isEqual:");
              }
            }
            else
            {
              long long v23 = [*((id *)v7 + 4) links];
              if (v23)
              {
                long long v24 = [(HKUserDomainConceptLinkCollection *)self->_linkCollection links];
                uint64_t v25 = [*((id *)v7 + 4) links];
                if ([v24 isEqual:v25])
                {
                  uint64_t v26 = self->_propertyCollection;
                  v27 = (HKUserDomainConceptPropertyCollection *)*((void *)v7 + 10);
                  BOOL v19 = v26 == v27;
                  if (v26 != v27 && v27) {
                    BOOL v19 = -[HKUserDomainConceptPropertyCollection isEqual:](v26, "isEqual:");
                  }
                }
                else
                {
                  BOOL v19 = 0;
                }
              }
              else
              {
                BOOL v19 = 0;
              }
            }
            uint64_t v18 = v31;
            v17 = v33;
            if (v14 == v15) {
              goto LABEL_40;
            }
            goto LABEL_39;
          }
        }
      }
    }
  }
  BOOL v19 = 0;
LABEL_21:

  return v19;
}

- (id)unitTesting_duplicate
{
  v2 = [(HKUserDomainConcept *)self _deepCopy];
  long long v3 = [MEMORY[0x1E4F29128] UUID];
  [v2 _setUUID:v3];

  return v2;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (HKMedicalCodingCollection)codingCollection
{
  return self->_codingCollection;
}

- (HKUserDomainConceptLinkCollection)linkCollection
{
  return self->_linkCollection;
}

- (HKUserDomainConceptTypeIdentifier)identifier
{
  return self->_identifier;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (double)creationTimestamp
{
  return self->_creationTimestamp;
}

- (double)modificationTimestamp
{
  return self->_modificationTimestamp;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = *($A44FF20282FB96BA82CF1B0FF6945C38 *)((char *)self + 88);
  return self;
}

- (NSString)build
{
  return self->_build;
}

- (int64_t)healthd_use_only_syncEntityIdentity
{
  return self->_healthd_use_only_syncEntityIdentity;
}

- (void)setHealthd_use_only_syncEntityIdentity:(int64_t)a3
{
  self->_healthd_use_only_syncEntityIdentity = a3;
}

- (HKUserDomainConceptPropertyCollection)propertyCollection
{
  return self->_propertyCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyCollection, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_linkCollection, 0);
  objc_storeStrong((id *)&self->_codingCollection, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end