@interface LSClaimRecord
+ (BOOL)supportsSecureCoding;
+ (id)_propertyClasses;
- (BOOL)defaultShareModeCollaboration;
- (LSBundleRecord)_claimingBundleRecord;
- (LSBundleRecord)claimingBundleRecord;
- (NSArray)URLSchemes;
- (NSArray)typeIdentifiers;
- (NSDictionary)iconDictionary;
- (NSString)handlerRank;
- (NSString)localizedName;
- (NSURL)iconResourceBundleURL;
- (_LSLocalizedStringRecord)_localizedName;
- (id)URLSchemesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)_claimingBundleRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)_localizedNameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)handlerRankWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)iconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)iconResourceBundleURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)localizedNameWithPreferredLocalizations:(id)a3;
- (id)typeIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (unsigned)_rawFlags;
- (unsigned)_rawFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (unsigned)role;
- (unsigned)roleWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (void)_LSRecord_resolve_URLSchemes;
- (void)_LSRecord_resolve__claimingBundleRecord;
- (void)_LSRecord_resolve__localizedName;
- (void)_LSRecord_resolve_handlerRank;
- (void)_LSRecord_resolve_iconDictionary;
- (void)_LSRecord_resolve_iconResourceBundleURL;
- (void)_LSRecord_resolve_typeIdentifiers;
- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
@end

@implementation LSClaimRecord

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__claimingBundleRecord, *(void *)&a4, *(void *)&a5, a6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7) {
    [v7 detach];
  }

  id v8 = [(LSRecord *)self _resolvedPropertyValueForGetter:sel__localizedName];
  if (v8) {
    [v8 detach];
  }
}

- (id)typeIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__LSClaimRecord_typeIdentifiersWithContext_tableID_unitID_unitBytes___block_invoke;
  v12[3] = &unk_1E522DE48;
  id v9 = v8;
  id v13 = v9;
  _LSEnumerateClaimedTypes((uint64_t)a3, (uint64_t)a6, v12);
  v10 = (void *)[v9 copy];

  return v10;
}

- (id)iconResourceBundleURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  if ((a6->var9 || a6->var8[0]) && a6->var10)
  {
    id v7 = (void *)_CSStringCopyCFString();
    id v8 = [(LSClaimRecord *)self claimingBundleRecord];
    id v9 = [v8 URL];

    if (v9 && v7)
    {
      v10 = [v9 URLByAppendingPathComponent:v7];

      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  v11 = [(LSClaimRecord *)self claimingBundleRecord];
  v10 = [v11 URL];

LABEL_10:

  return v10;
}

- (id)iconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  unsigned int var9 = a6->var9;
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", 2, *(void *)&a4, *(void *)&a5);
  if (var9)
  {
    id v9 = (void *)_CSStringCopyCFString();
    if (v9) {
      [v8 setObject:v9 forKeyedSubscript:@"CFBundleIconName"];
    }
  }
  else
  {
    id v9 = 0;
  }
  v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
  uint64_t v11 = 0;
  var8 = a6->var8;
  do
  {
    if (!var8[v11]) {
      break;
    }
    id v13 = (void *)_CSStringCopyCFString();
    if (v13) {
      [v10 addObject:v13];
    }
    ++v11;
  }
  while (v11 != 8);
  if ([v10 count]) {
    [v8 setObject:v9 forKeyedSubscript:@"CFBundleIconFiles"];
  }

  return v8;
}

- (id)handlerRankWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  v6 = _LSCopyHandlerRankStringFromNumericHandlerRank(a6->var3);

  return v6;
}

- (LSBundleRecord)claimingBundleRecord
{
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakClaimingBundleRecord);
  if (!WeakRetained)
  {
    WeakRetained = [(LSClaimRecord *)self _claimingBundleRecord];
  }

  return (LSBundleRecord *)WeakRetained;
}

- (id)_localizedNameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  id v6 = [[_LSLocalizedStringRecord alloc] _initWithContext:a3 unitID:a6->var6];

  return v6;
}

- (id)_claimingBundleRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakClaimingBundleRecord);

  if (WeakRetained)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = (_DWORD *)_LSBundleGet(a3->db, a6->var5);
    if (v9)
    {
      v10 = v9;
      uint64_t v11 = (objc_class *)objc_opt_class();
      if (v10[42] == 2) {
        uint64_t v11 = (objc_class *)objc_opt_class();
      }
      id v9 = (_DWORD *)[[v11 alloc] _initWithNode:0 bundleIdentifier:0 context:a3 tableID:a3->db->schema.bundleTable unitID:a6->var5 bundleBaseData:v10 error:0];
    }
  }

  return v9;
}

- (id)URLSchemesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__LSClaimRecord_URLSchemesWithContext_tableID_unitID_unitBytes___block_invoke;
  v12[3] = &unk_1E522DE48;
  id v9 = v8;
  id v13 = v9;
  _LSEnumerateClaimedSchemes((uint64_t)a3, (uint64_t)a6, v12);
  v10 = (void *)[v9 copy];

  return v10;
}

- (void).cxx_destruct
{
}

uint64_t __64__LSClaimRecord_URLSchemesWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __69__LSClaimRecord_typeIdentifiersWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)_LSRecord_resolve_iconResourceBundleURL
{
  id v2 = [(LSClaimRecord *)self iconResourceBundleURL];
}

- (void)_LSRecord_resolve_iconDictionary
{
  id v2 = [(LSClaimRecord *)self iconDictionary];
}

- (NSDictionary)iconDictionary
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_iconDictionaryWithContext_tableID_unitID_unitBytes_);
}

- (unsigned)role
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel_roleWithContext_tableID_unitID_unitBytes_);
}

- (unsigned)roleWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  return a6->var4;
}

- (unsigned)_rawFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  return a6->var2;
}

- (void)_LSRecord_resolve_typeIdentifiers
{
  id v2 = [(LSClaimRecord *)self typeIdentifiers];
}

- (NSArray)typeIdentifiers
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_typeIdentifiersWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_handlerRank
{
  id v2 = [(LSClaimRecord *)self handlerRank];
}

- (NSString)handlerRank
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_handlerRankWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__localizedName
{
  id v2 = [(LSClaimRecord *)self _localizedName];
}

- (_LSLocalizedStringRecord)_localizedName
{
  return (_LSLocalizedStringRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__localizedNameWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__claimingBundleRecord
{
  id v2 = [(LSClaimRecord *)self _claimingBundleRecord];
}

- (void)_LSRecord_resolve_URLSchemes
{
  id v2 = [(LSClaimRecord *)self URLSchemes];
}

- (NSArray)URLSchemes
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_URLSchemesWithContext_tableID_unitID_unitBytes_);
}

- (LSBundleRecord)_claimingBundleRecord
{
  return (LSBundleRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__claimingBundleRecordWithContext_tableID_unitID_unitBytes_);
}

- (NSURL)iconResourceBundleURL
{
  return (NSURL *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_iconResourceBundleURLWithContext_tableID_unitID_unitBytes_);
}

- (unsigned)_rawFlags
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel__rawFlagsWithContext_tableID_unitID_unitBytes_);
}

+ (id)_propertyClasses
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)localizedName
{
  id v2 = [(LSClaimRecord *)self _localizedName];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (id)localizedNameWithPreferredLocalizations:(id)a3
{
  v4 = [(LSClaimRecord *)self _localizedName];
  v5 = [v4 stringValueWithPreferredLocalizations:a3];

  return v5;
}

- (BOOL)defaultShareModeCollaboration
{
  return ([(LSClaimRecord *)self _rawFlags] >> 11) & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LSClaimRecord;
  v4 = [(LSRecord *)&v7 copyWithZone:a3];
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_weakClaimingBundleRecord);
    objc_storeWeak(v4 + 4, WeakRetained);
  }
  return v4;
}

@end