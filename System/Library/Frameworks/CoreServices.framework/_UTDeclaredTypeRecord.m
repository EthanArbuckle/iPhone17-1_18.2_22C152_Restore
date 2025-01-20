@interface _UTDeclaredTypeRecord
+ (BOOL)supportsSecureCoding;
+ (id)_propertyClasses;
- (BOOL)conformsToTypeIdentifier:(id)a3;
- (BOOL)isActive;
- (BOOL)isCoreType;
- (BOOL)isDeclared;
- (BOOL)isDynamic;
- (BOOL)isExported;
- (BOOL)isImported;
- (BOOL)isInPublicDomain;
- (BOOL)isWildcard;
- (LSBundleRecord)_declaringBundleRecord;
- (id)_declaringBundleBookmark;
- (id)_declaringBundleBookmarkWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)_declaringBundleRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)_delegatePath;
- (id)_delegatePathWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)_localizedDescription;
- (id)_localizedDescriptionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)childTypeIdentifiers;
- (id)childTypeIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)declaration;
- (id)declarationWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)declaringBundleRecord;
- (id)identifier;
- (id)identifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)parentTypeIdentifiers;
- (id)parentTypeIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)pedigree;
- (id)pedigreeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)referenceURL;
- (id)referenceURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)tagSpecification;
- (id)tagSpecificationWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)version;
- (id)versionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (unsigned)_rawFlags;
- (unsigned)_rawFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (void)_LSRecord_resolve__declaringBundleBookmark;
- (void)_LSRecord_resolve__declaringBundleRecord;
- (void)_LSRecord_resolve__delegatePath;
- (void)_LSRecord_resolve__localizedDescription;
- (void)_LSRecord_resolve_childTypeIdentifiers;
- (void)_LSRecord_resolve_declaration;
- (void)_LSRecord_resolve_identifier;
- (void)_LSRecord_resolve_parentTypeIdentifiers;
- (void)_LSRecord_resolve_pedigree;
- (void)_LSRecord_resolve_referenceURL;
- (void)_LSRecord_resolve_tagSpecification;
- (void)_LSRecord_resolve_version;
- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (void)_enumerateRelatedTypeStructuresWithContext:(LSContext *)a3 unitID:(unsigned int)a4 maximumDegreeOfSeparation:(int64_t)a5 block:(id)a6;
- (void)_enumerateRelatedTypeUnitsOrDynamicIdsWithContext:(LSContext *)a3 unitID:(unsigned int)a4 maximumDegreeOfSeparation:(int64_t)a5 block:(id)a6;
@end

@implementation _UTDeclaredTypeRecord

- (id)identifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  v6 = (void *)_CSStringCopyCFString();

  return v6;
}

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  v11.receiver = self;
  v11.super_class = (Class)_UTDeclaredTypeRecord;
  [(UTTypeRecord *)&v11 _detachFromContext:a3 tableID:*(void *)&a4 unitID:*(void *)&a5 unitBytes:a6];
  v7 = [(LSRecord *)self _resolvedPropertyValueForGetter:sel__declaringBundleRecord];
  v8 = v7;
  if (v7) {
    [v7 detach];
  }

  v9 = [(LSRecord *)self _resolvedPropertyValueForGetter:sel__localizedDescription];
  v10 = v9;
  if (v9) {
    [v9 detach];
  }
}

- (id)identifier
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_identifierWithContext_tableID_unitID_unitBytes_);
}

- (id)_declaringBundleRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakDeclaringBundleRecord);

  if (WeakRetained)
  {
LABEL_2:
    v10 = 0;
    goto LABEL_3;
  }
  db = a3->db;
  unsigned int var5 = a6->var5;
  if ((a6->var2 & 0x2000) != 0)
  {
    v10 = (_DWORD *)_LSGetPlugin((uint64_t)db, var5);
    if (v10) {
      v10 = [[LSApplicationExtensionRecord alloc] _initWithContext:a3 pluginID:a6->var5 pluginData:v10 error:0];
    }
  }
  else
  {
    v10 = (_DWORD *)_LSBundleGet(db, var5);
    if (v10)
    {
      v14 = v10;
      int v15 = v10[42];
      switch(v15)
      {
        case 11:
          v10 = +[LSBundleRecord coreTypesBundleRecord];
          break;
        case 8:
          v10 = -[LSBundleRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:]([LSBundleRecord alloc], "_initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:", 0, 0, a3, *(unsigned int *)(-[_LSDatabase schema]((uint64_t)a3->db) + 4), a6->var5, v10, 0);
          break;
        case 2:
          v10 = [[LSApplicationRecord alloc] _initWithContext:a3 bundleID:a6->var5 bundleData:v10 error:0];
          break;
        default:
          v16 = _LSRecordLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = v14[42];
            v18 = [(_UTDeclaredTypeRecord *)self identifier];
            *(_DWORD *)buf = 134218242;
            uint64_t v20 = v17;
            __int16 v21 = 2114;
            v22 = v18;
            _os_log_impl(&dword_182959000, v16, OS_LOG_TYPE_ERROR, "Unexpected bundle class %lu declaring type %{public}@", buf, 0x16u);
          }
          goto LABEL_2;
      }
    }
  }
LABEL_3:

  return v10;
}

- (id)versionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  if ((a6->var2 & 0x100) != 0)
  {
    v6 = objc_msgSend(NSNumber, "numberWithInt:", a6->var4, *(void *)&a4, *(void *)&a5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)referenceURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  v6 = (void *)_CSStringCopyCFString();
  if (v6) {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v6];
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (id)_delegatePathWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  if ((a6->var2 & 0x2000) != 0)
  {
    id v11 = 0;
  }
  else
  {
    v8 = (void *)_CSStringCopyCFString();
    if (v8)
    {
      if (_LSBundleGet(a3->db, a6->var5) && (v9 = (void *)_CSStringCopyCFString(), (v10 = v9) != 0))
      {
        id v11 = [v9 stringByAppendingPathComponent:v8];
      }
      else
      {
        id v11 = v8;
      }
    }
    else
    {
      id v11 = 0;
    }
  }

  return v11;
}

- (void).cxx_destruct
{
}

- (BOOL)isDynamic
{
  return 0;
}

- (unsigned)_rawFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  return a6->var2;
}

- (void)_LSRecord_resolve_identifier
{
  id v2 = [(_UTDeclaredTypeRecord *)self identifier];
}

- (BOOL)conformsToTypeIdentifier:(id)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50___UTDeclaredTypeRecord_conformsToTypeIdentifier___block_invoke;
  v6[3] = &unk_1E5231970;
  v6[4] = a3;
  v6[5] = &v7;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50___UTDeclaredTypeRecord_conformsToTypeIdentifier___block_invoke_2;
  v5[3] = &unk_1E5231998;
  v5[5] = a3;
  v5[6] = &v7;
  v5[4] = self;
  [(LSRecord *)self _ifAttached:v6 else:v5];
  char v3 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)_LSRecord_resolve_parentTypeIdentifiers
{
  id v2 = [(_UTDeclaredTypeRecord *)self parentTypeIdentifiers];
}

- (id)parentTypeIdentifiers
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_parentTypeIdentifiersWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_declaration
{
  id v2 = [(_UTDeclaredTypeRecord *)self declaration];
}

- (id)declaration
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_declarationWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_childTypeIdentifiers
{
  id v2 = [(_UTDeclaredTypeRecord *)self childTypeIdentifiers];
}

- (id)childTypeIdentifiers
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_childTypeIdentifiersWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__delegatePath
{
  id v2 = [(_UTDeclaredTypeRecord *)self _delegatePath];
}

- (id)_delegatePath
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__delegatePathWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__declaringBundleBookmark
{
  id v2 = [(_UTDeclaredTypeRecord *)self _declaringBundleBookmark];
}

- (id)_declaringBundleBookmark
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__declaringBundleBookmarkWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__declaringBundleRecord
{
  id v2 = [(_UTDeclaredTypeRecord *)self _declaringBundleRecord];
}

- (id)declaringBundleRecord
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakDeclaringBundleRecord);
  if (!WeakRetained)
  {
    id WeakRetained = [(_UTDeclaredTypeRecord *)self _declaringBundleRecord];
  }

  return WeakRetained;
}

- (LSBundleRecord)_declaringBundleRecord
{
  return (LSBundleRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__declaringBundleRecordWithContext_tableID_unitID_unitBytes_);
}

- (id)_declaringBundleBookmarkWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  BundleBaseData = (int *)_UTTypeGetBundleBaseData(a3->db, (uint64_t)a6);
  if (BundleBaseData)
  {
    v8 = _LSAliasGet(a3->db, *BundleBaseData);
    uint64_t v9 = (void *)[v8 copy];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)childTypeIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  db = a3->db;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  int v15 = __82___UTDeclaredTypeRecord_childTypeIdentifiersWithContext_tableID_unitID_unitBytes___block_invoke;
  v16 = &unk_1E52317B8;
  v18 = a3;
  id v10 = v8;
  id v17 = v10;
  _UTTypeSearchConformingTypesWithBlock(db, a5, 1, 0, (uint64_t)&v13);
  id v11 = objc_msgSend(v10, "copy", v13, v14, v15, v16);

  return v11;
}

- (id)_localizedDescriptionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  id v6 = [[_LSLocalizedStringRecord alloc] _initWithContext:a3 unitID:_UTGetLocalizedDescription(a3->db, a5)];

  return v6;
}

- (id)parentTypeIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  db = a3->db;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  int v15 = __83___UTDeclaredTypeRecord_parentTypeIdentifiersWithContext_tableID_unitID_unitBytes___block_invoke;
  v16 = &unk_1E52317B8;
  v18 = a3;
  id v10 = v8;
  id v17 = v10;
  _UTTypeSearchConformsToTypesWithBlock((uint64_t)db, a5, 1, 0, (uint64_t)&v13);
  id v11 = objc_msgSend(v10, "copy", v13, v14, v15, v16);

  return v11;
}

- (id)pedigreeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  PedigreeInternal = (void *)_UTTypeGetPedigreeInternal((uint64_t *)a3, a5);
  uint64_t v7 = PedigreeInternal;
  if (PedigreeInternal)
  {
    id v8 = PedigreeInternal;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CAD0] set];
  }
  uint64_t v9 = v8;

  return v9;
}

- (BOOL)isCoreType
{
  return ([(_UTDeclaredTypeRecord *)self _rawFlags] >> 5) & 1;
}

- (void)_LSRecord_resolve__localizedDescription
{
  id v2 = [(_UTDeclaredTypeRecord *)self _localizedDescription];
}

- (void)_LSRecord_resolve_tagSpecification
{
  id v2 = [(_UTDeclaredTypeRecord *)self tagSpecification];
}

- (id)declarationWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v10 = [(_UTDeclaredTypeRecord *)self identifier];
  [v9 setObject:v10 forKeyedSubscript:@"UTTypeIdentifier"];

  id v11 = [(_UTDeclaredTypeRecord *)self version];
  [v9 setObject:v11 forKeyedSubscript:@"UTTypeVersion"];

  v12 = [(_UTDeclaredTypeRecord *)self _localizedDescription];
  uint64_t v13 = [v12 defaultStringValue];
  [v9 setObject:v13 forKeyedSubscript:@"UTTypeDescription"];

  uint64_t v14 = (void *)_CSStringCopyCFString();
  [v9 setObject:v14 forKeyedSubscript:@"UTKEXTIdentifier"];

  int v15 = [(_UTDeclaredTypeRecord *)self tagSpecification];
  v16 = [v15 _expensiveDictionaryRepresentation];
  [v9 setObject:v16 forKeyedSubscript:@"UTTypeTagSpecification"];

  if (a6->var14)
  {
    uint64_t EntryWithClass = _LSBindingListGetEntryWithClass(a3->db);
    if (EntryWithClass && (uint64_t v18 = *(unsigned int *)(EntryWithClass + 4), v18))
    {
      id v19 = 0;
      uint64_t v20 = EntryWithClass + 8;
      do
      {
        v20 += 4;
        __int16 v21 = (void *)_CSStringCopyCFString();
        v22 = v21;
        if (v21 && [v21 length])
        {
          if (!v19) {
            id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v19 addObject:v22];
        }

        --v18;
      }
      while (v18);
    }
    else
    {
      id v19 = 0;
    }
    [v9 setObject:v19 forKeyedSubscript:@"UTTypeConformsTo"];
  }
  uint64_t v23 = [(_UTDeclaredTypeRecord *)self referenceURL];
  v24 = [v23 absoluteString];
  [v9 setObject:v24 forKeyedSubscript:@"UTTypeReferenceURL"];

  if ([(_UTDeclaredTypeRecord *)self isWildcard]) {
    [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"UTTypeIsWildcard"];
  }
  v25 = +[_LSLazyPropertyList lazyPropertyListWithPropertyList:]((uint64_t)_LSLazyPropertyList, v9);

  return v25;
}

- (id)tagSpecification
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_tagSpecificationWithContext_tableID_unitID_unitBytes_);
}

- (id)_localizedDescription
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__localizedDescriptionWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isWildcard
{
  return ([(_UTDeclaredTypeRecord *)self _rawFlags] >> 9) & 1;
}

- (unsigned)_rawFlags
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel__rawFlagsWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_version
{
  id v2 = [(_UTDeclaredTypeRecord *)self version];
}

- (id)version
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_versionWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_referenceURL
{
  id v2 = [(_UTDeclaredTypeRecord *)self referenceURL];
}

- (id)referenceURL
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_referenceURLWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_pedigree
{
  id v2 = [(_UTDeclaredTypeRecord *)self pedigree];
}

- (id)pedigree
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_pedigreeWithContext_tableID_unitID_unitBytes_);
}

- (id)tagSpecificationWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  if (!a6->var13) {
    goto LABEL_21;
  }
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unsigned int EntryCount = _LSBindingListGetEntryCount();
  id v9 = v22;
  if (EntryCount)
  {
    for (unsigned int i = 0; i != EntryCount; ++i)
    {
      EntryAtIndex = _LSBindingListGetEntryAtIndex(a3->db, a6->var13, i);
      if (EntryAtIndex)
      {
        v12 = (void *)_CSStringCopyCFString();
        if (v12)
        {
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v14 = EntryAtIndex[1];
          if (v14)
          {
            int v15 = EntryAtIndex + 2;
            do
            {
              ++v15;
              v16 = (void *)_CSStringCopyCFString();
              if (v16) {
                [v13 addObject:v16];
              }

              --v14;
            }
            while (v14);
          }
          id v9 = v22;
          if ([v13 count])
          {
            id v17 = [v22 objectForKeyedSubscript:v12];
            uint64_t v18 = v17;
            if (v17)
            {
              id v19 = [v17 arrayByAddingObjectsFromArray:v13];
            }
            else
            {
              id v19 = (void *)[v13 copy];
            }
            [v22 setObject:v19 forKeyedSubscript:v12];
          }
        }
      }
    }
  }
  if (v9)
  {
    uint64_t v20 = +[_LSLazyPropertyList lazyPropertyListWithPropertyList:]((uint64_t)_LSLazyPropertyList, v9);
  }
  else
  {
LABEL_21:
    uint64_t v20 = _LSLazyPropertyListGetSharedEmptyPropertyList();
  }

  return v20;
}

+ (id)_propertyClasses
{
  v4[7] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:7];

  return v2;
}

- (BOOL)isDeclared
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_enumerateRelatedTypeStructuresWithContext:(LSContext *)a3 unitID:(unsigned int)a4 maximumDegreeOfSeparation:(int64_t)a5 block:(id)a6
{
  if (a5 < 1)
  {
    if (a5 < 0)
    {
      db = a3->db;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __107___UTDeclaredTypeRecord__enumerateRelatedTypeStructuresWithContext_unitID_maximumDegreeOfSeparation_block___block_invoke_2;
      v9[3] = &unk_1E5231948;
      if (a5 == 0x8000000000000000) {
        uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v8 = -a5;
      }
      v9[4] = a6;
      v9[5] = a3;
      _UTTypeSearchConformingTypesWithBlock(db, a4, v8, 0, (uint64_t)v9);
    }
  }
  else
  {
    id v6 = a3->db;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __107___UTDeclaredTypeRecord__enumerateRelatedTypeStructuresWithContext_unitID_maximumDegreeOfSeparation_block___block_invoke;
    v10[3] = &unk_1E5231948;
    v10[4] = a6;
    v10[5] = a3;
    _UTTypeSearchConformsToTypesWithBlock((uint64_t)v6, a4, a5, 0, (uint64_t)v10);
  }
}

- (BOOL)isInPublicDomain
{
  return ([(_UTDeclaredTypeRecord *)self _rawFlags] >> 1) & 1;
}

- (BOOL)isExported
{
  return ([(_UTDeclaredTypeRecord *)self _rawFlags] >> 4) & 1;
}

- (BOOL)isImported
{
  return ([(_UTDeclaredTypeRecord *)self _rawFlags] & 0x10) == 0;
}

- (BOOL)isActive
{
  return [(_UTDeclaredTypeRecord *)self _rawFlags] & 1;
}

- (void)_enumerateRelatedTypeUnitsOrDynamicIdsWithContext:(LSContext *)a3 unitID:(unsigned int)a4 maximumDegreeOfSeparation:(int64_t)a5 block:(id)a6
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __114___UTDeclaredTypeRecord__enumerateRelatedTypeUnitsOrDynamicIdsWithContext_unitID_maximumDegreeOfSeparation_block___block_invoke;
  v6[3] = &unk_1E52319C0;
  v6[4] = a6;
  [(_UTDeclaredTypeRecord *)self _enumerateRelatedTypeStructuresWithContext:a3 unitID:*(void *)&a4 maximumDegreeOfSeparation:a5 block:v6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UTDeclaredTypeRecord;
  v4 = [(LSRecord *)&v7 copyWithZone:a3];
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_weakDeclaringBundleRecord);
    objc_storeWeak(v4 + 4, WeakRetained);
  }
  return v4;
}

@end