@interface NSPropertyDescription
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)_allowsCloudEncryption;
- (BOOL)_comparePredicatesAndWarnings:(id)a3;
- (BOOL)_epsilonEquals:(id)a3 rhs:(id)a4 withFlags:(int)a5;
- (BOOL)_hasMaxValueInExtraIvars;
- (BOOL)_hasMinValueInExtraIvars;
- (BOOL)_isAttribute;
- (BOOL)_isEditable;
- (BOOL)_isEqual:(id)a3 skipIndexCheck:(BOOL)a4;
- (BOOL)_isEqualWithoutIndex:(id)a3;
- (BOOL)_isFileBackedFuture;
- (BOOL)_isOrdered;
- (BOOL)_isRelationship;
- (BOOL)_isSchemaEqual:(id)a3;
- (BOOL)_isSpotlightIndexedAndTransient;
- (BOOL)_isToManyRelationship;
- (BOOL)_isTriggerBacked;
- (BOOL)_nonPredicateValidateValue:(id *)a3 forKey:(id)a4 inObject:(id)a5 error:(id *)a6;
- (BOOL)_preserveValueOnDelete;
- (BOOL)_skipValidation;
- (BOOL)_storeBinaryDataExternally;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIndexed;
- (BOOL)isIndexedBySpotlight;
- (BOOL)isOptional;
- (BOOL)isReadOnly;
- (BOOL)isStoredInExternalRecord;
- (BOOL)isTransient;
- (NSArray)validationPredicates;
- (NSArray)validationWarnings;
- (NSData)versionHash;
- (NSDictionary)userInfo;
- (NSEntityDescription)entity;
- (NSPropertyDescription)init;
- (NSPropertyDescription)initWithCoder:(id)a3;
- (NSString)name;
- (NSString)renamingIdentifier;
- (NSString)versionHashModifier;
- (_NSExtraPropertyIVars)_extraIVars;
- (__CFString)_elementPath;
- (__CFString)_rootName;
- (id)_initWithName:(id)a3;
- (id)_namespace;
- (id)_qualifiedName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)superCompositeAttribute;
- (int)_encodedPropertyFlagsForFlags:(int)a3;
- (int64_t)_entitysReferenceID;
- (uint64_t)_setNamespace:(uint64_t)result;
- (unint64_t)_propertyType;
- (unint64_t)hash;
- (void)_appendPropertyFieldsToData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8;
- (void)_createCachesAndOptimizeState;
- (void)_initializeExtraIVars;
- (void)_replaceValidationPredicates:(id)a3 andWarnings:(id)a4;
- (void)_restoreValidation;
- (void)_setEntity:(id)a3;
- (void)_setEntityAndMaintainIndices:(id)a3;
- (void)_setEntitysReferenceID:(int64_t)a3;
- (void)_setOrdered:(BOOL)a3;
- (void)_stripForMigration;
- (void)_throwIfNotEditable;
- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4;
- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setIndexed:(BOOL)indexed;
- (void)setIndexedBySpotlight:(BOOL)indexedBySpotlight;
- (void)setName:(NSString *)name;
- (void)setOptional:(BOOL)optional;
- (void)setReadOnly:(BOOL)a3;
- (void)setRenamingIdentifier:(NSString *)renamingIdentifier;
- (void)setStoredInExternalRecord:(BOOL)storedInExternalRecord;
- (void)setSuperCompositeAttribute:(id)a3;
- (void)setTransient:(BOOL)transient;
- (void)setUserInfo:(NSDictionary *)userInfo;
- (void)setValidationPredicates:(NSArray *)validationPredicates withValidationWarnings:(NSArray *)validationWarnings;
- (void)setVersionHashModifier:(NSString *)versionHashModifier;
@end

@implementation NSPropertyDescription

- (BOOL)_nonPredicateValidateValue:(id *)a3 forKey:(id)a4 inObject:(id)a5 error:(id *)a6
{
  if ([(NSPropertyDescription *)self isOptional]
    || *a3
    || [(NSPropertyDescription *)self isTransient] && !(_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
  {
    return 1;
  }
  if (!a6) {
    return 0;
  }
  v12 = (void *)-[NSManagedObject _generateErrorWithCode:andMessage:forKey:andValue:additionalDetail:]((uint64_t)a5, 1570, 0, (uint64_t)a4, (uint64_t)*a3, 0);
  BOOL result = 0;
  *a6 = v12;
  return result;
}

- (BOOL)isOptional
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 2) & 1;
}

- (id)superCompositeAttribute
{
  if (!atomic_load((unint64_t *)&self->_extraIvars)) {
    return 0;
  }
  unint64_t v3 = atomic_load((unint64_t *)&self->_extraIvars);
  return *(id *)(v3 + 32);
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)_isRelationship
{
  return 0;
}

- (BOOL)isTransient
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 1) & 1;
}

- (BOOL)_storeBinaryDataExternally
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 11) & 1;
}

- (id)_qualifiedName
{
  id v3 = [(NSPropertyDescription *)self _namespace];
  if (v3) {
    return (id)[NSString stringWithFormat:@"%@.%@", v3, -[NSPropertyDescription name](self, "name")];
  }

  return [(NSPropertyDescription *)self name];
}

- (id)_namespace
{
  if (!atomic_load((unint64_t *)&self->_extraIvars)) {
    return 0;
  }
  unint64_t v3 = atomic_load((unint64_t *)&self->_extraIvars);
  return *(id *)(v3 + 24);
}

- (BOOL)_isFileBackedFuture
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 14) & 1;
}

- (void)_setEntitysReferenceID:(int64_t)a3
{
  uint64_t entitysReferenceIDForProperty = self->_entitysReferenceIDForProperty;
  if (entitysReferenceIDForProperty == -1 || entitysReferenceIDForProperty == a3) {
    self->_uint64_t entitysReferenceIDForProperty = a3;
  }
  else {
    __break(1u);
  }
}

- (BOOL)isStoredInExternalRecord
{
  if ((*(_WORD *)&self->_propertyDescriptionFlags & 0x40) != 0) {
    return ![(NSPropertyDescription *)self isTransient];
  }
  else {
    return 0;
  }
}

- (BOOL)isIndexedBySpotlight
{
  if ((*(_WORD *)&self->_propertyDescriptionFlags & 0x20) != 0) {
    return ![(NSPropertyDescription *)self isTransient];
  }
  else {
    return 0;
  }
}

- (void)_createCachesAndOptimizeState
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  validationPredicates = self->_validationPredicates;
  uint64_t v3 = [(NSArray *)validationPredicates countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(validationPredicates);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) allowEvaluation];
      }
      uint64_t v4 = [(NSArray *)validationPredicates countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)_allowsCloudEncryption
{
  return *(_WORD *)&self->_propertyDescriptionFlags >> 15;
}

- (BOOL)_isSpotlightIndexedAndTransient
{
  return (~*(_WORD *)&self->_propertyDescriptionFlags & 0x22) != 0;
}

- (void)_replaceValidationPredicates:(id)a3 andWarnings:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];

  self->_validationPredicates = (NSArray *)a3;
  self->_validationWarnings = (NSArray *)a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  validationPredicates = self->_validationPredicates;
  uint64_t v8 = [(NSArray *)validationPredicates countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(validationPredicates);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) allowEvaluation];
      }
      uint64_t v9 = [(NSArray *)validationPredicates countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)_isTriggerBacked
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 13) & 1;
}

- (NSDictionary)userInfo
{
  if (self->_userInfo) {
    return &self->_userInfo->super;
  }
  else {
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  }
}

- (BOOL)_preserveValueOnDelete
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 12) & 1;
}

- (BOOL)_isEditable
{
  entity = self->_entity;
  return !entity || [(NSEntityDescription *)entity _isEditable];
}

- (BOOL)_isOrdered
{
  return HIBYTE(*(_WORD *)&self->_propertyDescriptionFlags) & 1;
}

- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4
{
  memset(&c, 0, sizeof(c));
  __int16 v6 = [(NSPropertyDescription *)self isOptional];
  if ([(NSPropertyDescription *)self isTransient]) {
    __int16 v7 = 2;
  }
  else {
    __int16 v7 = 0;
  }
  __int16 v8 = v7 | v6;
  if ([(NSPropertyDescription *)self isReadOnly]) {
    __int16 v9 = 4;
  }
  else {
    __int16 v9 = 0;
  }
  __int16 data = v8 | v9;
  CC_SHA256_Init(&c);
  name = (__CFString *)self->_name;
  if (!name)
  {
LABEL_10:
    CStringPtr = (const char *)[(__CFString *)name UTF8String];
    if (!CStringPtr) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  CStringPtr = CFStringGetCStringPtr(name, 0x8000100u);
  if (!CStringPtr)
  {
    name = (__CFString *)self->_name;
    goto LABEL_10;
  }
LABEL_11:
  CC_LONG v12 = strlen(CStringPtr);
  CC_SHA256_Update(&c, CStringPtr, v12);
LABEL_12:
  CC_SHA256_Update(&c, &data, 2u);
  versionHashModifier = self->_versionHashModifier;
  if (versionHashModifier)
  {
    long long v14 = CFStringGetCStringPtr((CFStringRef)versionHashModifier, 0x8000100u);
    if (!v14) {
      long long v14 = [(NSString *)self->_versionHashModifier UTF8String];
    }
    CC_LONG v15 = strlen(v14);
    CC_SHA256_Update(&c, v14, v15);
  }
  CC_SHA256_Final((unsigned __int8 *)a3, &c);
}

- (BOOL)isReadOnly
{
  return *(_WORD *)&self->_propertyDescriptionFlags & 1;
}

- (BOOL)_isAttribute
{
  return 0;
}

- (void)setOptional:(BOOL)optional
{
  BOOL v3 = optional;
  [(NSPropertyDescription *)self _throwIfNotEditable];
  if (v3) {
    __int16 v5 = 4;
  }
  else {
    __int16 v5 = 0;
  }
  *(_WORD *)&self->_propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFFB | v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    *(void *)(v4 + 32) = [(NSString *)self->_name copy];
    *(void *)(v4 + 40) = [(NSArray *)[(NSPropertyDescription *)self validationPredicates] copy];
    *(void *)(v4 + 48) = [(NSArray *)[(NSPropertyDescription *)self validationWarnings] copy];
    int v5 = *(_WORD *)(v4 + 72) & 0xFFFE | *(_WORD *)&self->_propertyDescriptionFlags & 1;
    *(_WORD *)(v4 + 72) = *(_WORD *)(v4 + 72) & 0xFFFE | *(_WORD *)&self->_propertyDescriptionFlags & 1;
    unsigned int v6 = v5 & 0xFFFFFFFD | (2 * ((*(_WORD *)&self->_propertyDescriptionFlags >> 1) & 1));
    *(_WORD *)(v4 + 72) = v6;
    unsigned int v7 = v6 & 0xFFFFFFFB | (4 * ((*(_WORD *)&self->_propertyDescriptionFlags >> 2) & 1));
    *(_WORD *)(v4 + 72) = v7;
    unsigned int v8 = v7 & 0xFFFFFFF7 | (8 * ((*(_WORD *)&self->_propertyDescriptionFlags >> 3) & 1));
    *(_WORD *)(v4 + 72) = v8;
    unsigned int v9 = v8 & 0xFFFFFFEF | (16 * ((*(_WORD *)&self->_propertyDescriptionFlags >> 4) & 1));
    *(_WORD *)(v4 + 72) = v9;
    unsigned int v10 = v9 & 0xFFFFFFDF | (32 * ((*(_WORD *)&self->_propertyDescriptionFlags >> 5) & 1));
    *(_WORD *)(v4 + 72) = v10;
    unsigned int v11 = v10 & 0xFFFFFFBF | (((*(_WORD *)&self->_propertyDescriptionFlags >> 6) & 1) << 6);
    *(_WORD *)(v4 + 72) = v11;
    unsigned int v12 = v11 & 0xFFFFFEFF | ((HIBYTE(*(_WORD *)&self->_propertyDescriptionFlags) & 1) << 8);
    *(_WORD *)(v4 + 72) = v12;
    *(_WORD *)(v4 + 72) = *(_WORD *)&self->_propertyDescriptionFlags & 0x8000 | v12 & 0x7FFF;
    *(void *)(v4 + 64) = [(NSMutableDictionary *)self->_userInfo copy];
    *(void *)(v4 + 8) = [(NSString *)self->_versionHashModifier copy];
    *(void *)(v4 + 16) = 0;
    *(_WORD *)(v4 + 76) = -1;
    objc_msgSend((id)v4, "setRenamingIdentifier:", -[NSPropertyDescription renamingIdentifier](self, "renamingIdentifier"));
    objc_msgSend((id)v4, "setSuperCompositeAttribute:", -[NSPropertyDescription superCompositeAttribute](self, "superCompositeAttribute"));
  }
  return (id)v4;
}

- (NSPropertyDescription)initWithCoder:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v46.receiver = self;
  v46.super_class = (Class)NSPropertyDescription;
  uint64_t v4 = [(NSPropertyDescription *)&v46 init];
  if (v4)
  {
    int v5 = +[PFModelDecoderContext retainedContext];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v37 = v5;
    v43 = __39__NSPropertyDescription_initWithCoder___block_invoke;
    v44 = &unk_1E544B868;
    v45 = v5;
    unsigned int v6 = [a3 decodeInt32ForKey:@"_P"];
    char v7 = v6;
    if (v6)
    {
      *(_WORD *)&v4->_propertyDescriptionFlags = (2 * v6) & 4 | (v6 >> 2) & 3 | (v6 >> 3) & 0x60 | (v6 >> 2) & 0x100 | (((v6 >> 11) & 1) << 15) | *(_WORD *)&v4->_propertyDescriptionFlags & 0x7E98;
      if ((v6 & 0x10) != 0) {
        goto LABEL_35;
      }
    }
    else
    {
      if ([a3 decodeBoolForKey:@"NSIsOptional"]) {
        __int16 v8 = 4;
      }
      else {
        __int16 v8 = 0;
      }
      *(_WORD *)&v4->_propertyDescriptionFlags = *(_WORD *)&v4->_propertyDescriptionFlags & 0xFFFB | v8;
      *(_WORD *)&v4->_propertyDescriptionFlags = *(_WORD *)&v4->_propertyDescriptionFlags & 0xFFFE | [a3 decodeBoolForKey:@"NSIsReadOnly"];
      if ([a3 decodeBoolForKey:@"NSIsTransient"]) {
        __int16 v9 = 2;
      }
      else {
        __int16 v9 = 0;
      }
      *(_WORD *)&v4->_propertyDescriptionFlags = *(_WORD *)&v4->_propertyDescriptionFlags & 0xFFFD | v9;
      if ([a3 decodeBoolForKey:@"NSIndexedBySpotlight"]) {
        __int16 v10 = 32;
      }
      else {
        __int16 v10 = 0;
      }
      *(_WORD *)&v4->_propertyDescriptionFlags = *(_WORD *)&v4->_propertyDescriptionFlags & 0xFFDF | v10;
      if ([a3 decodeBoolForKey:@"NSIsStoredInTruth"]) {
        __int16 v11 = 64;
      }
      else {
        __int16 v11 = 0;
      }
      *(_WORD *)&v4->_propertyDescriptionFlags = *(_WORD *)&v4->_propertyDescriptionFlags & 0xFFBF | v11;
      if ([a3 decodeBoolForKey:@"NSIsOrdered"]) {
        __int16 v12 = 256;
      }
      else {
        __int16 v12 = 0;
      }
      *(_WORD *)&v4->_propertyDescriptionFlags = *(_WORD *)&v4->_propertyDescriptionFlags & 0xFEFF | v12;
      if ([a3 decodeBoolForKey:@"NSAllowsCloudEncryption"]) {
        __int16 v13 = 0x8000;
      }
      else {
        __int16 v13 = 0;
      }
      *(_WORD *)&v4->_propertyDescriptionFlags = v13 & 0x8000 | *(_WORD *)&v4->_propertyDescriptionFlags & 0x7FFF;
    }
    long long v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0), @"NSValidationPredicates");
    v4->_validationPredicates = v17;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(v17);
          }
          v21 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if (!byte_1EB270ABE)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v21 allowEvaluation];
            }
          }
          if ([v21 isNSArray])
          {
            objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4866, &unk_1ED7E20C8));

            goto LABEL_61;
          }
        }
        uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
LABEL_35:
    if ((v7 & 0x20) == 0)
    {
      v22 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = objc_opt_class();
      v4->_validationWarnings = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v22, "setWithObjects:", v23, v24, v25, objc_opt_class(), 0), @"NSValidationWarnings");
    }
    if ((v7 & 0x40) == 0) {
      v4->_userInfo = (NSMutableDictionary *)(id)[a3 decodeObjectOfClasses:+[_PFRoutines plistClassesForSecureCoding]() forKey:@"NSUserInfo"];
    }
    if ((v7 & 0x80) == 0)
    {
      v26 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v27 = objc_opt_class();
      v28 = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0), @"NSVersionHashModifier");
      v4->_versionHashModifier = v28;
      if (v28)
      {
        if (![(NSString *)v28 isNSString])
        {
          v33 = &unk_1ED7E20F0;
          goto LABEL_60;
        }
      }
    }
    *(_WORD *)&v4->_propertyDescriptionFlags &= ~0x10u;
    v29 = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPropertyName"];
    v4->_name = v29;
    if (v29 && ![(NSString *)v29 isNSString])
    {
      v33 = &unk_1ED7E2118;
      goto LABEL_60;
    }
    uint64_t v30 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSEntity"];
    v4->_entity = (NSEntityDescription *)v30;
    if (v30)
    {
      if (v37) {
        v31 = (void *)v37[3];
      }
      else {
        v31 = 0;
      }
      [v31 addObject:v30];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        v33 = &unk_1ED7E2168;
      }
      else {
        v33 = &unk_1ED7E2140;
      }
      if (v37 == 0 || (isKindOfClass & 1) == 0) {
        goto LABEL_60;
      }
      if (!v37[1] && !v37[2])
      {
        v33 = &unk_1ED7E2168;
        goto LABEL_60;
      }
    }
    v34 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v35 = objc_opt_class();
    -[NSPropertyDescription setRenamingIdentifier:](v4, "setRenamingIdentifier:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0), @"NSRenamingIdentifier"));
    if (![(NSPropertyDescription *)v4 renamingIdentifier]
      || ([(NSString *)[(NSPropertyDescription *)v4 renamingIdentifier] isNSString] & 1) != 0)
    {
      -[NSPropertyDescription _setNamespace:]((uint64_t)v4, 0);
      [(NSPropertyDescription *)v4 setSuperCompositeAttribute:0];
      v4->_uint64_t entitysReferenceIDForProperty = -1;
LABEL_62:
      v43((uint64_t)v42);
      return v4;
    }
    v33 = &unk_1ED7E2190;
LABEL_60:
    objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4866, v33));

LABEL_61:
    uint64_t v4 = 0;
    goto LABEL_62;
  }
  return v4;
}

- (NSString)renamingIdentifier
{
  unint64_t v2 = atomic_load((unint64_t *)&self->_extraIvars);
  if (v2 && (BOOL v3 = (NSString **)atomic_load((unint64_t *)&self->_extraIvars), (v4 = *v3) != 0)) {
    return v4;
  }
  else {
    return [(NSPropertyDescription *)self name];
  }
}

- (uint64_t)_setNamespace:(uint64_t)result
{
  if (result)
  {
    BOOL v3 = (unint64_t *)result;
    uint64_t v4 = (unint64_t *)(result + 56);
    if (atomic_load((unint64_t *)(result + 56)))
    {
      unint64_t v6 = atomic_load(v4);

      unint64_t v7 = atomic_load(v4);
      *(void *)(v7 + 24) = 0;
    }
    if (!atomic_load(v4)) {
      [v3 _initializeExtraIVars];
    }
    __int16 v9 = v3 + 7;
    unint64_t v10 = atomic_load(v9);
    uint64_t v15 = *(void *)(v10 + 24);
    __int16 v11 = (void *)[a2 copy];
    unint64_t v12 = atomic_load(v9);
    uint64_t v13 = v15;
    uint64_t v14 = v15;
    atomic_compare_exchange_strong((atomic_ullong *volatile)(v12 + 24), (unint64_t *)&v14, (unint64_t)v11);
    if (v14 != v13)
    {

      uint64_t v13 = v15;
    }
    return MEMORY[0x1F41817F8](v11, v13);
  }
  return result;
}

- (void)_initializeExtraIVars
{
  BOOL v3 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    BOOL v3 = malloc_default_zone();
  }
  uint64_t v4 = malloc_type_zone_calloc(v3, 1uLL, 0x28uLL, 0x108004046168151uLL);
  uint64_t v5 = 0;
  atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_extraIvars, (unint64_t *)&v5, (unint64_t)v4);
  if (v5)
  {
    unint64_t v6 = v4;
    unint64_t v7 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      unint64_t v7 = malloc_default_zone();
    }
    malloc_zone_free(v7, v6);
  }
}

- (void)setSuperCompositeAttribute:(id)a3
{
  p_extraIvars = (unint64_t *)&self->_extraIvars;
  if (!atomic_load((unint64_t *)&self->_extraIvars)) {
    [(NSPropertyDescription *)self _initializeExtraIVars];
  }
  unint64_t v7 = atomic_load(p_extraIvars);
  *(void *)(v7 + 32) = a3;
  if (a3)
  {
    if ([a3 _namespace]) {
      uint64_t v8 = [NSString stringWithFormat:@"%@.%@", objc_msgSend(a3, "_namespace"), objc_msgSend(a3, "name")];
    }
    else {
      uint64_t v8 = [a3 name];
    }
    __int16 v9 = (void *)v8;
  }
  else
  {
    __int16 v9 = 0;
  }

  -[NSPropertyDescription _setNamespace:]((uint64_t)self, v9);
}

- (void)setRenamingIdentifier:(NSString *)renamingIdentifier
{
  if (!renamingIdentifier
    || [(NSString *)renamingIdentifier isNSString]
    && [(NSString *)[(NSPropertyDescription *)self name] isEqualToString:renamingIdentifier])
  {
    p_extraIvars = (unint64_t *)&self->_extraIvars;
    if (atomic_load((unint64_t *)&self->_extraIvars))
    {
      unint64_t v7 = (id *)atomic_load(p_extraIvars);

      uint64_t v8 = (void *)atomic_load(p_extraIvars);
      *uint64_t v8 = 0;
    }
  }
  else
  {
    __int16 v9 = (unint64_t *)&self->_extraIvars;
    if (!atomic_load((unint64_t *)&self->_extraIvars)) {
      [(NSPropertyDescription *)self _initializeExtraIVars];
    }
    __int16 v11 = (uint64_t *)atomic_load(v9);
    uint64_t v16 = *v11;
    unint64_t v12 = (void *)[(NSString *)renamingIdentifier copy];
    uint64_t v13 = (atomic_ullong *)atomic_load(v9);
    uint64_t v14 = v16;
    uint64_t v15 = v16;
    atomic_compare_exchange_strong(v13, (unint64_t *)&v15, (unint64_t)v12);
    if (v15 != v14)
    {

      uint64_t v14 = v16;
    }
    MEMORY[0x1F41817F8](v12, v14);
  }
}

void __39__NSPropertyDescription_initWithCoder___block_invoke(uint64_t a1)
{
}

- (id)_initWithName:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSPropertyDescription;
  uint64_t v4 = [(NSPropertyDescription *)&v7 init];
  uint64_t v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->_propertyDescriptionFlags = *(_WORD *)&v4->_propertyDescriptionFlags & 0xFE80 | 4;
    v4->_name = (NSString *)[a3 copy];
    v5->_uint64_t entitysReferenceIDForProperty = -1;
    v5->_versionHashModifier = 0;
    v5->_versionHash = 0;
  }
  return v5;
}

- (NSPropertyDescription)init
{
  return (NSPropertyDescription *)[(NSPropertyDescription *)self _initWithName:0];
}

- (void)setReadOnly:(BOOL)a3
{
  __int16 v3 = a3;
  [(NSPropertyDescription *)self _throwIfNotEditable];
  *(_WORD *)&self->_propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFFE | v3;
}

- (void)setName:(NSString *)name
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(NSPropertyDescription *)self _throwIfNotEditable];
  if (self->_name != name)
  {
    uint64_t v5 = [(NSPropertyDescription *)self entity];
    unint64_t v6 = v5;
    if (v5
      && [(NSDictionary *)[(NSEntityDescription *)v5 propertiesByName] objectForKey:name]&& ![(NSPropertyDescription *)self superCompositeAttribute])
    {
LABEL_19:
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"Can't change name of property from %@ to %@", self->_name, name), 0 reason userInfo]);
    }
    if ([(NSPropertyDescription *)self superCompositeAttribute])
    {
      objc_super v7 = objc_msgSend(-[NSPropertyDescription superCompositeAttribute](self, "superCompositeAttribute"), "elements");
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "name"), "isEqualToString:", name))goto LABEL_19; {
          }
            }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v9);
      }

      self->_name = (NSString *)[(NSString *)name copy];
    }
    else
    {
      -[NSEntityDescription _removeProperty:]((uint64_t)v6, self);

      self->_name = (NSString *)[(NSString *)name copy];
      [(NSEntityDescription *)v6 _addProperty:self];
    }
  }
}

- (void)_throwIfNotEditable
{
}

- (NSArray)validationWarnings
{
  if (self->_validationWarnings) {
    return self->_validationWarnings;
  }
  else {
    return (NSArray *)NSArray_EmptyArray;
  }
}

- (NSArray)validationPredicates
{
  if (self->_validationPredicates) {
    return self->_validationPredicates;
  }
  else {
    return (NSArray *)NSArray_EmptyArray;
  }
}

- (BOOL)_hasMinValueInExtraIvars
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 10) & 1;
}

- (BOOL)_hasMaxValueInExtraIvars
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 9) & 1;
}

- (_NSExtraPropertyIVars)_extraIVars
{
  p_extraIvars = (unint64_t *)&self->_extraIvars;
  if (!atomic_load((unint64_t *)&self->_extraIvars)) {
    [(NSPropertyDescription *)self _initializeExtraIVars];
  }
  return (_NSExtraPropertyIVars *)atomic_load(p_extraIvars);
}

- (void)setIndexed:(BOOL)indexed
{
  entity = self->_entity;
  if (entity)
  {
    -[NSEntityDescription _addIndexForProperty:]((uint64_t)entity, self);
  }
  else
  {
    if (indexed) {
      __int16 v5 = 8;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->_propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFF7 | v5;
  }
}

- (void)_setEntityAndMaintainIndices:(id)a3
{
  entity = self->_entity;
  if (entity == a3) {
    return;
  }
  if (entity)
  {
    if (-[NSEntityDescription _hasIndexForProperty:]((uint64_t)entity, self))
    {
      -[NSEntityDescription _removeIndexForProperty:]((uint64_t)self->_entity, self);
      self->_entity = (NSEntityDescription *)a3;
      goto LABEL_6;
    }
    self->_entity = (NSEntityDescription *)a3;
LABEL_11:
    if (a3) {
      return;
    }
    __int16 v7 = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFF7;
    goto LABEL_14;
  }
  __int16 propertyDescriptionFlags = (__int16)self->_propertyDescriptionFlags;
  self->_entity = (NSEntityDescription *)a3;
  if ((propertyDescriptionFlags & 8) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  if (!a3)
  {
    __int16 v7 = *(_WORD *)&self->_propertyDescriptionFlags | 8;
LABEL_14:
    *(_WORD *)&self->___int16 propertyDescriptionFlags = v7;
    return;
  }

  -[NSEntityDescription _addIndexForProperty:]((uint64_t)a3, self);
}

- (NSEntityDescription)entity
{
  return self->_entity;
}

- (int64_t)_entitysReferenceID
{
  return self->_entitysReferenceIDForProperty;
}

- (unint64_t)hash
{
  unint64_t v2 = [(NSPropertyDescription *)self name];

  return [(NSString *)v2 hash];
}

- (void)dealloc
{
  p_extraIvars = (unint64_t *)&self->_extraIvars;
  if (atomic_load((unint64_t *)&self->_extraIvars))
  {
    __int16 v5 = (id *)atomic_load(p_extraIvars);

    unint64_t v6 = (void *)atomic_load(p_extraIvars);
    *unint64_t v6 = 0;
    unint64_t v7 = atomic_load(p_extraIvars);

    unint64_t v8 = atomic_load(p_extraIvars);
    *(void *)(v8 + 24) = 0;
    unint64_t v9 = atomic_load(p_extraIvars);
    *(void *)(v9 + 32) = 0;
    if ((*(_WORD *)&self->_propertyDescriptionFlags & 0x80) == 0)
    {
      uint64_t v10 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone) {
        uint64_t v10 = malloc_default_zone();
      }
      __int16 v11 = (void *)atomic_load((unint64_t *)&self->_extraIvars);
      malloc_zone_free(v10, v11);
    }
    atomic_store(0, (unint64_t *)&self->_extraIvars);
  }

  self->_entity = 0;
  self->_name = 0;

  self->_validationPredicates = 0;
  self->_validationWarnings = 0;

  self->_userInfo = 0;
  self->_versionHash = 0;

  self->_versionHashModifier = 0;
  v12.receiver = self;
  v12.super_class = (Class)NSPropertyDescription;
  [(NSPropertyDescription *)&v12 dealloc];
}

+ (void)initialize
{
  self;

  objc_opt_class();
}

- (BOOL)_isEqual:(id)a3 skipIndexCheck:(BOOL)a4
{
  if (a3 == self)
  {
    LOBYTE(v9) = 1;
    return v9;
  }
  if (!a3) {
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  unint64_t v7 = [(NSPropertyDescription *)self _propertyType];
  if (v7 != [a3 _propertyType]) {
    goto LABEL_16;
  }
  unint64_t v8 = [(NSPropertyDescription *)self name];
  uint64_t v9 = [a3 name];
  if (v8 == (NSString *)v9
    || (uint64_t v10 = v9, LOBYTE(v9) = 0, v8) && v10 && (LODWORD(v9) = -[NSString isEqual:](v8, "isEqual:"), v9))
  {
    int v11 = [(NSPropertyDescription *)self isOptional];
    if (v11 != [a3 isOptional]
      || (int v12 = [(NSPropertyDescription *)self isTransient],
          v12 != [a3 isTransient])
      || (int v13 = [(NSPropertyDescription *)self _allowsCloudEncryption],
          v13 != [a3 _allowsCloudEncryption])
      || !a4
      && (int v14 = -[NSPropertyDescription isIndexed](self, "isIndexed"), v14 != [a3 isIndexed])|| (v15 = -[NSPropertyDescription isIndexedBySpotlight](self, "isIndexedBySpotlight"), v15 != objc_msgSend(a3, "isIndexedBySpotlight"))|| (v16 = -[NSPropertyDescription isStoredInExternalRecord](self, "isStoredInExternalRecord"), v16 != objc_msgSend(a3, "isStoredInExternalRecord")))
    {
LABEL_16:
      LOBYTE(v9) = 0;
      return v9;
    }
    uint64_t v17 = [(NSPropertyDescription *)self userInfo];
    uint64_t v9 = [a3 userInfo];
    if (v17 == (NSDictionary *)v9
      || (uint64_t v18 = v9, LOBYTE(v9) = 0, v17) && v18 && (LODWORD(v9) = -[NSDictionary isEqual:](v17, "isEqual:"), v9))
    {
      uint64_t v19 = [(NSPropertyDescription *)self versionHashModifier];
      uint64_t v9 = [a3 versionHashModifier];
      if (v19 == (NSString *)v9
        || (uint64_t v20 = v9, LOBYTE(v9) = 0, v19) && v20 && (LODWORD(v9) = -[NSString isEqual:](v19, "isEqual:"), v9))
      {
        LOBYTE(v9) = [(NSPropertyDescription *)self _comparePredicatesAndWarnings:a3];
      }
    }
  }
  return v9;
}

- (NSString)versionHashModifier
{
  return self->_versionHashModifier;
}

- (BOOL)isIndexed
{
  entity = self->_entity;
  if (entity)
  {
    int v4 = -[NSEntityDescription _hasIndexForProperty:]((uint64_t)entity, self);
    if (![(NSPropertyDescription *)self _isEditable])
    {
      if (v4) {
        __int16 v5 = 8;
      }
      else {
        __int16 v5 = 0;
      }
      *(_WORD *)&self->___int16 propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFF7 | v5;
    }
  }
  else
  {
    return (*(_WORD *)&self->_propertyDescriptionFlags >> 3) & 1;
  }
  return v4;
}

- (BOOL)_comparePredicatesAndWarnings:(id)a3
{
  id v5 = [(NSPropertyDescription *)self _rawValidationPredicates];
  uint64_t v6 = [a3 _rawValidationPredicates];
  if (v5 == (id)v6 || (uint64_t v7 = v6, LOBYTE(v6) = 0, v5) && v7 && (LODWORD(v6) = objc_msgSend(v5, "isEqual:"), v6))
  {
    id v8 = [(NSPropertyDescription *)self _rawValidationWarnings];
    uint64_t v6 = [a3 _rawValidationWarnings];
    if (v8 == (id)v6)
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      uint64_t v9 = v6;
      LOBYTE(v6) = 0;
      if (v8 && v9)
      {
        LOBYTE(v6) = objc_msgSend(v8, "isEqual:");
      }
    }
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  return [(NSPropertyDescription *)self _isEqual:a3 skipIndexCheck:0];
}

- (int)_encodedPropertyFlagsForFlags:(int)a3
{
  return a3;
}

- (void)encodeWithCoder:(id)a3
{
  if ([(NSPropertyDescription *)self isOptional])
  {
    [a3 encodeBool:1 forKey:@"NSIsOptional"];
    uint64_t v5 = 3;
  }
  else
  {
    uint64_t v5 = 1;
  }
  if ([(NSPropertyDescription *)self isReadOnly])
  {
    [a3 encodeBool:1 forKey:@"NSIsReadOnly"];
    uint64_t v5 = v5 | 4;
  }
  if ([(NSPropertyDescription *)self isTransient])
  {
    [a3 encodeBool:1 forKey:@"NSIsTransient"];
    uint64_t v5 = v5 | 8;
  }
  if ([(NSPropertyDescription *)self isIndexedBySpotlight])
  {
    [a3 encodeBool:1 forKey:@"NSIndexedBySpotlight"];
    uint64_t v5 = v5 | 0x100;
  }
  if ([(NSPropertyDescription *)self isStoredInExternalRecord])
  {
    [a3 encodeBool:1 forKey:@"NSIsStoredInTruth"];
    uint64_t v5 = v5 | 0x200;
  }
  if ([(NSPropertyDescription *)self _isOrdered])
  {
    [a3 encodeBool:1 forKey:@"NSIsOrdered"];
    uint64_t v5 = v5 | 0x400;
  }
  if ([(NSPropertyDescription *)self _allowsCloudEncryption])
  {
    [a3 encodeBool:1 forKey:@"NSAllowsCloudEncryption"];
    uint64_t v5 = v5 | 0x800;
  }
  uint64_t v6 = [(NSPropertyDescription *)self renamingIdentifier];
  if (v6) {
    [a3 encodeObject:v6 forKey:@"NSRenamingIdentifier"];
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[NSPropertyDescription name](self, "name"), @"NSPropertyName");
  objc_msgSend(a3, "encodeConditionalObject:forKey:", -[NSPropertyDescription entity](self, "entity"), @"NSEntity");
  uint64_t v7 = [(NSPropertyDescription *)self validationPredicates];
  if ([(NSArray *)v7 count]) {
    [a3 encodeObject:v7 forKey:@"NSValidationPredicates"];
  }
  else {
    uint64_t v5 = v5 | 0x10;
  }
  id v8 = [(NSPropertyDescription *)self validationWarnings];
  if ([(NSArray *)v8 count]) {
    [a3 encodeObject:v8 forKey:@"NSValidationWarnings"];
  }
  else {
    uint64_t v5 = v5 | 0x20;
  }
  uint64_t v9 = [(NSPropertyDescription *)self userInfo];
  if ([(NSDictionary *)v9 count]) {
    [a3 encodeObject:v9 forKey:@"NSUserInfo"];
  }
  else {
    uint64_t v5 = v5 | 0x40;
  }
  uint64_t v10 = [(NSPropertyDescription *)self versionHashModifier];
  if ([(NSString *)v10 length]) {
    [a3 encodeObject:v10 forKey:@"NSVersionHashModifier"];
  }
  else {
    uint64_t v5 = v5 | 0x80;
  }
  uint64_t v11 = [(NSPropertyDescription *)self _encodedPropertyFlagsForFlags:v5];

  [a3 encodeInt32:v11 forKey:@"_P"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NSPropertyDescription;
  return (id)[NSString stringWithFormat:@"(%@), name %@, isOptional %d, isTransient %d, entity %@, renamingIdentifier %@, validation predicates %@, warnings %@, versionHashModifier %@\n userInfo %@", -[NSPropertyDescription description](&v3, sel_description), -[NSPropertyDescription name](self, "name"), -[NSPropertyDescription isOptional](self, "isOptional"), -[NSPropertyDescription isTransient](self, "isTransient"), -[NSEntityDescription name](-[NSPropertyDescription entity](self, "entity"), "name"), -[NSPropertyDescription renamingIdentifier](self, "renamingIdentifier"), -[NSPropertyDescription validationPredicates](self, "validationPredicates"), -[NSPropertyDescription validationWarnings](self, "validationWarnings"), -[NSPropertyDescription versionHashModifier](self, "versionHashModifier"), -[NSPropertyDescription userInfo](self, "userInfo")];
}

- (void)setTransient:(BOOL)transient
{
  BOOL v3 = transient;
  [(NSPropertyDescription *)self _throwIfNotEditable];
  if (v3) {
    __int16 v5 = 2;
  }
  else {
    __int16 v5 = 0;
  }
  *(_WORD *)&self->___int16 propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFFD | v5;
}

- (void)setValidationPredicates:(NSArray *)validationPredicates withValidationWarnings:(NSArray *)validationWarnings
{
  [(NSPropertyDescription *)self _throwIfNotEditable];
  NSUInteger v7 = [(NSArray *)validationPredicates count];
  if (v7 != [(NSArray *)validationWarnings count]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Mismatch between length of validation predicates and warnings" userInfo:0]);
  }
  id v8 = self->_validationPredicates;
  if (v8 != validationPredicates)
  {

    self->_validationPredicates = (NSArray *)[(NSArray *)validationPredicates copy];
  }
  uint64_t v9 = self->_validationWarnings;
  if (v9 != validationWarnings)
  {

    self->_validationWarnings = (NSArray *)[(NSArray *)validationWarnings copy];
  }
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
  objc_sync_enter(self);
  __int16 v5 = self->_userInfo;
  if (v5 != (NSMutableDictionary *)userInfo)
  {

    self->_userInfo = (NSMutableDictionary *)[(NSDictionary *)userInfo copy];
  }

  objc_sync_exit(self);
}

- (NSData)versionHash
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  versionHash = self->_versionHash;
  if (versionHash)
  {
LABEL_7:
    __int16 v5 = versionHash;
    return v5;
  }
  [(NSPropertyDescription *)self _versionHash:v8 inStyle:0];
  int v4 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v8 length:32];
  if (![(NSPropertyDescription *)self _isEditable])
  {
    uint64_t v6 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_versionHash, (unint64_t *)&v6, (unint64_t)v4);
    if (v6) {

    }
    versionHash = self->_versionHash;
    goto LABEL_7;
  }
  __int16 v5 = v4;
  return v5;
}

- (void)setVersionHashModifier:(NSString *)versionHashModifier
{
  [(NSPropertyDescription *)self _throwIfNotEditable];
  __int16 v5 = self->_versionHashModifier;
  if (v5 != versionHashModifier)
  {

    self->_versionHashModifier = (NSString *)[(NSString *)versionHashModifier copy];
  }
}

- (void)setIndexedBySpotlight:(BOOL)indexedBySpotlight
{
  BOOL v3 = indexedBySpotlight;
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([(NSPropertyDescription *)self _propertyType] == 7)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3B8];
    id v8 = @"attribute";
    v9[0] = [(NSPropertyDescription *)self name];
    objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, @"A composite attribute type cannot be indexed by spotlight.", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1)));
  }
  if (v3) {
    __int16 v5 = 32;
  }
  else {
    __int16 v5 = 0;
  }
  *(_WORD *)&self->___int16 propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFDF | v5;
}

- (void)setStoredInExternalRecord:(BOOL)storedInExternalRecord
{
  if (storedInExternalRecord) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFFBF | v3;
}

- (__CFString)_rootName
{
  if (result)
  {
    v1 = (void *)[(__CFString *)result _namespace];
    if (v1)
    {
      unint64_t v2 = (void *)[v1 componentsSeparatedByString:@"."];
      return (__CFString *)[v2 firstObject];
    }
    else
    {
      return &stru_1ED787880;
    }
  }
  return result;
}

- (__CFString)_elementPath
{
  if (result)
  {
    v1 = result;
    unint64_t v2 = (void *)[(__CFString *)result _namespace];
    if (v2)
    {
      __int16 v3 = v2;
      uint64_t v4 = [v2 rangeOfString:@"."];
      if ((unint64_t)(v4 - 1) > 0x7FFFFFFFFFFFFFFDLL)
      {
        return (__CFString *)[(__CFString *)v1 name];
      }
      else
      {
        uint64_t v5 = [v3 substringFromIndex:v4 + 1];
        return (__CFString *)[NSString stringWithFormat:@"%@.%@", v5, -[__CFString name](v1, "name")];
      }
    }
    else
    {
      return &stru_1ED787880;
    }
  }
  return result;
}

- (BOOL)_epsilonEquals:(id)a3 rhs:(id)a4 withFlags:(int)a5
{
  if (a3 == a4) {
    return 1;
  }
  else {
    return [a3 isEqual:a4];
  }
}

- (BOOL)_isSchemaEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(NSPropertyDescription *)self name];
  uint64_t v6 = [a3 name];
  if (v5 == (NSString *)v6) {
    return 1;
  }
  uint64_t v7 = v6;
  BOOL result = 0;
  if (v5 && v7)
  {
    return -[NSString isEqual:](v5, "isEqual:");
  }
  return result;
}

- (unint64_t)_propertyType
{
  return 0;
}

- (BOOL)_isEqualWithoutIndex:(id)a3
{
  return [(NSPropertyDescription *)self _isEqual:a3 skipIndexCheck:1];
}

- (BOOL)_isToManyRelationship
{
  return 0;
}

- (void)_setEntity:(id)a3
{
  self->_entity = (NSEntityDescription *)a3;
}

- (void)_setOrdered:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 propertyDescriptionFlags = *(_WORD *)&self->_propertyDescriptionFlags & 0xFEFF | v3;
}

- (void)_stripForMigration
{
  *(_WORD *)&self->_propertyDescriptionFlags |= 0x10u;
}

- (void)_restoreValidation
{
  *(_WORD *)&self->_propertyDescriptionFlags &= ~0x10u;
}

- (BOOL)_skipValidation
{
  return (*(_WORD *)&self->_propertyDescriptionFlags >> 4) & 1;
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)_appendPropertyFieldsToData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8
{
  _writeInt32IntoData(a3, [(NSPropertyDescription *)self _propertyType]);
  _writeInt32IntoData(a3, *(_DWORD *)&self->_propertyDescriptionFlags);
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a6, "valueForKey:", self->_versionHashModifier), "unsignedIntegerValue"));
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a7, "objectForKey:", self->_versionHash), "unsignedIntegerValue"));
  _writeInt32IntoData(a3, objc_msgSend(a8, "indexForKey:", -[NSEntityDescription name](self->_entity, "name")));
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a5, "objectForKey:", self->_name), "unsignedIntegerValue"));
  if ([(NSArray *)self->_validationWarnings count])
  {
    _writeInt32IntoData(a3, 1u);
    _writePFEncodedArrayShapeIntoData(a3, self->_validationPredicates, a7, 0);
    _writePFEncodedArrayShapeIntoData(a3, self->_validationWarnings, a6, a7);
  }
  else
  {
    _writeInt32IntoData(a3, 0);
  }
  if (atomic_load((unint64_t *)&self->_extraIvars))
  {
    _writeInt32IntoData(a3, 1u);
    int v15 = (void *)atomic_load((unint64_t *)&self->_extraIvars);
    if (*v15)
    {
      _writeInt32IntoData(a3, 1u);
      int v16 = (void *)atomic_load((unint64_t *)&self->_extraIvars);
      _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a6, "objectForKey:", *v16), "unsignedIntegerValue"));
    }
    else
    {
      _writeInt64IntoData(a3, 0);
    }
    unint64_t v17 = atomic_load((unint64_t *)&self->_extraIvars);
    _writeInt64IntoData(a3, *(void *)(v17 + 8));
    unint64_t v18 = atomic_load((unint64_t *)&self->_extraIvars);
    _writeInt64IntoData(a3, *(void *)(v18 + 16));
  }
  else
  {
    _writeInt32IntoData(a3, 0);
  }
  if (self->_userInfo) {
    unsigned int v19 = objc_msgSend((id)objc_msgSend(a7, "objectForKey:"), "unsignedIntegerValue");
  }
  else {
    unsigned int v19 = 0;
  }
  _writeInt32IntoData(a3, v19);
  unsigned int v20 = [(NSPropertyDescription *)self _entitysReferenceID];

  _writeInt32IntoData(a3, v20);
}

@end