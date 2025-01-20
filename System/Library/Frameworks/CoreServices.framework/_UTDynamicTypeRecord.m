@interface _UTDynamicTypeRecord
+ (BOOL)supportsSecureCoding;
+ (id)_propertyClasses;
- (BOOL)conformsToTypeIdentifier:(id)a3;
- (BOOL)isActive;
- (BOOL)isChildOfTypeIdentifier:(id)a3;
- (BOOL)isCoreType;
- (BOOL)isDeclared;
- (BOOL)isDynamic;
- (BOOL)isExported;
- (BOOL)isImported;
- (BOOL)isInPublicDomain;
- (BOOL)isWildcard;
- (_UTDynamicTypeRecord)initWithCoder:(id)a3;
- (id)_declaringBundleBookmark;
- (id)_delegatePath;
- (id)_initWithContext:(LSContext *)a3 dynamicUTI:(id)a4;
- (id)_localizedDescription;
- (id)_persistentIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (id)childTypeIdentifiers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)declaration;
- (id)declaringBundleRecord;
- (id)identifier;
- (id)parentTypeIdentifiers;
- (id)pedigree;
- (id)pedigreeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)preferredTagOfClass:(id)a3;
- (id)referenceURL;
- (id)tagSpecification;
- (id)version;
- (void)_LSRecord_resolve_pedigree;
- (void)_enumerateRelatedTypeUnitsOrDynamicIdsWithContext:(LSContext *)a3 unitID:(unsigned int)a4 maximumDegreeOfSeparation:(int64_t)a5 block:(id)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UTDynamicTypeRecord

- (id)pedigreeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  Pedigree = (void *)_UTDynamicGetPedigree((uint64_t)a3, (__CFString *)self->_identifier);
  v7 = Pedigree;
  if (Pedigree)
  {
    id v8 = Pedigree;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CAD0] set];
  }
  v9 = v8;

  return v9;
}

- (BOOL)isDynamic
{
  return 1;
}

- (void).cxx_destruct
{
}

- (id)preferredTagOfClass:(id)a3
{
  id FirstTag = _UTDynamicGetFirstTag((const __CFString *)self->_identifier, (const __CFString *)a3);

  return FirstTag;
}

- (id)_persistentIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  v12.receiver = self;
  v12.super_class = (Class)_UTDynamicTypeRecord;
  v7 = [(LSRecord *)&v12 _persistentIdentifierWithContext:a3 tableID:*(void *)&a4 unitID:*(void *)&a5 unitBytes:a6];
  id v8 = (void *)[v7 mutableCopy];

  v9 = [(NSString *)self->_identifier dataUsingEncoding:4];
  if (v9) {
    [v8 appendData:v9];
  }

  v10 = (void *)[v8 copy];

  return v10;
}

- (id)_initWithContext:(LSContext *)a3 dynamicUTI:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UTDynamicTypeRecord;
  v5 = -[LSRecord _initWithContext:tableID:unitID:](&v9, sel__initWithContext_tableID_unitID_);
  if (v5)
  {
    uint64_t v6 = [a4 copy];
    v7 = (void *)v5[4];
    v5[4] = v6;
  }
  return v5;
}

- (BOOL)conformsToTypeIdentifier:(id)a3
{
  id v4 = a3;
  if ([(_UTDynamicTypeRecord *)self isChildOfTypeIdentifier:v4])
  {
    char v5 = 1;
    uint64_t v6 = v4;
  }
  else
  {
    uint64_t v6 = [v4 lowercaseString];

    v7 = [(_UTDynamicTypeRecord *)self pedigree];
    id v8 = v7;
    if (v7) {
      char v5 = [v7 containsObject:v6];
    }
    else {
      char v5 = 0;
    }
  }
  return v5;
}

- (void)_LSRecord_resolve_pedigree
{
  id v2 = [(_UTDynamicTypeRecord *)self pedigree];
}

- (id)pedigree
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_pedigreeWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isChildOfTypeIdentifier:(id)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  CFStringRef identifier = (const __CFString *)self->_identifier;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48___UTDynamicTypeRecord_isChildOfTypeIdentifier___block_invoke;
  v6[3] = &unk_1E52319E8;
  v6[4] = a3;
  v6[5] = &v7;
  _UTDynamicEnumerateParentIdentifiers(identifier, (uint64_t)v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)tagSpecification
{
  TagSpecification = (void *)_UTDynamicGetTagSpecification((const __CFString *)self->_identifier);
  if (TagSpecification) {
    +[_LSLazyPropertyList lazyPropertyListWithPropertyList:]((uint64_t)_LSLazyPropertyList, TagSpecification);
  }
  else {
  v3 = _LSLazyPropertyListGetSharedEmptyPropertyList();
  }

  return v3;
}

- (id)identifier
{
  return objc_getProperty(self, a2, 32, 1);
}

- (id)version
{
  return 0;
}

- (BOOL)isDeclared
{
  return 0;
}

- (BOOL)isWildcard
{
  return 0;
}

- (BOOL)isInPublicDomain
{
  return 0;
}

- (BOOL)isExported
{
  return 0;
}

- (BOOL)isImported
{
  return 0;
}

- (BOOL)isActive
{
  return 0;
}

- (BOOL)isCoreType
{
  return 0;
}

- (id)declaringBundleRecord
{
  return 0;
}

- (id)declaration
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_identifier forKeyedSubscript:@"UTTypeIdentifier"];
  TagSpecification = (void *)_UTDynamicGetTagSpecification((const __CFString *)self->_identifier);
  [v3 setObject:TagSpecification forKeyedSubscript:@"UTTypeTagSpecification"];

  ParentIdentifiers = (void *)_UTDynamicGetParentIdentifiers((const __CFString *)self->_identifier);
  [v3 setObject:ParentIdentifiers forKeyedSubscript:@"UTTypeConformsTo"];

  uint64_t v6 = +[_LSLazyPropertyList lazyPropertyListWithPropertyList:]((uint64_t)_LSLazyPropertyList, v3);

  return v6;
}

- (id)referenceURL
{
  return 0;
}

- (id)parentTypeIdentifiers
{
  ParentIdentifiers = (void *)_UTDynamicGetParentIdentifiers((const __CFString *)self->_identifier);
  if (ParentIdentifiers) {
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:ParentIdentifiers];
  }
  else {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
  }
  char v4 = v3;

  return v4;
}

- (id)childTypeIdentifiers
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (id)_localizedDescription
{
  return 0;
}

- (id)_declaringBundleBookmark
{
  return 0;
}

- (id)_delegatePath
{
  return 0;
}

- (void)_enumerateRelatedTypeUnitsOrDynamicIdsWithContext:(LSContext *)a3 unitID:(unsigned int)a4 maximumDegreeOfSeparation:(int64_t)a5 block:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = a5 - 1;
  if (a5 >= 1)
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x5812000000;
    v29[3] = __Block_byref_object_copy__256;
    memset(&v29[5], 0, 40);
    v29[4] = __Block_byref_object_dispose__257;
    int v30 = 1065353216;
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = [(_UTDynamicTypeRecord *)self parentTypeIdentifiers];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v22;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_super v12 = *(__CFString **)(*((void *)&v21 + 1) + 8 * v11);
        int v20 = 0;
        if (_UTTypeIdentifierIsDynamic(v12))
        {
          v13 = (void *)MEMORY[0x18530F680]();
          if (([0 containsObject:v12] & 1) == 0)
          {
            [0 addObject:v12];
            v17[0] = v12;
            v17[1] = 1;
            int v18 = 0;
            char v19 = 0;
            (*((void (**)(id, void *, uint64_t *))a6 + 2))(a6, v17, v26 + 3);
          }
        }
        else if (_UTGetActiveTypeForCFStringIdentifier(a3->db, v12, &v20))
        {
          db = a3->db;
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __113___UTDynamicTypeRecord__enumerateRelatedTypeUnitsOrDynamicIdsWithContext_unitID_maximumDegreeOfSeparation_block___block_invoke;
          v16[3] = &unk_1E5231A10;
          v16[4] = a6;
          v16[5] = v29;
          v16[6] = &v25;
          _UTTypeSearchConformsToTypesWithBlock((uint64_t)db, v20, v15, 0, (uint64_t)v16);
        }
        if (*((unsigned char *)v26 + 24)) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v31 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(v29, 8);
    std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::~__hash_table((uint64_t)&v29[6]);
  }
}

+ (id)_propertyClasses
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UTDynamicTypeRecord;
  -[LSRecord encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_identifier forKey:@"identifier"];
}

- (_UTDynamicTypeRecord)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UTDynamicTypeRecord;
  char v4 = -[LSRecord initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    uint64_t v5 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"identifier");
    CFStringRef identifier = v4->_identifier;
    v4->_CFStringRef identifier = (NSString *)v5;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UTDynamicTypeRecord;
  char v4 = [(LSRecord *)&v7 copyWithZone:a3];
  uint64_t v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 4, self->_identifier);
  }
  return v5;
}

@end