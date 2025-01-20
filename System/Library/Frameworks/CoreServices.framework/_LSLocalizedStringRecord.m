@interface _LSLocalizedStringRecord
+ (BOOL)supportsSecureCoding;
+ (id)_propertyClasses;
+ (id)sanitizeString:(id)a3;
- (NSArray)_missingBundleLocs;
- (NSDictionary)_allUnsanitizedStringValues;
- (NSDictionary)allStringValues;
- (NSString)defaultStringValue;
- (NSString)stringValue;
- (id)_allUnsanitizedStringValuesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LocalizedString *)a6;
- (id)_initWithContext:(LSContext *)a3 unitID:(unsigned int)a4;
- (id)_missingBundleLocsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LocalizedString *)a6;
- (id)debugDescription;
- (id)stringValueWithPreferredLocalizations:(id)a3;
- (void)_LSRecord_resolve__allUnsanitizedStringValues;
- (void)_LSRecord_resolve__missingBundleLocs;
- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
@end

@implementation _LSLocalizedStringRecord

- (id)_initWithContext:(LSContext *)a3 unitID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (LaunchServices::LocalizedString::Get((LaunchServices::LocalizedString *)a3->db, *(_LSDatabase **)&a4))
  {
    uint64_t localizedStringTable = a3->db->schema.localizedStringTable;
    v9.receiver = self;
    v9.super_class = (Class)_LSLocalizedStringRecord;
    return [(LSRecord *)&v9 _initWithContext:a3 tableID:localizedStringTable unitID:v4];
  }
  else
  {

    return 0;
  }
}

- (id)_allUnsanitizedStringValuesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LocalizedString *)a6
{
  return LaunchServices::LocalizedString::getAllUnsafeLocalizations((LaunchServices::LocalizedString *)a6, a3->db, 0, 0, 0);
}

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  [(_LSLocalizedStringRecord *)self _allUnsanitizedStringValues];

  [(_LSLocalizedStringRecord *)self _missingBundleLocs];
  v11.receiver = self;
  v11.super_class = (Class)_LSLocalizedStringRecord;
  [(LSRecord *)&v11 _detachFromContext:a3 tableID:v8 unitID:v7 unitBytes:a6];
}

- (id)_missingBundleLocsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LocalizedString *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = LaunchServices::LocalizedString::getBundleLocs((LaunchServices::LocalizedString *)a6, a3->db);
  id v8 = objc_alloc(MEMORY[0x1E4F1CA80]);
  if (v7) {
    objc_super v9 = v7;
  }
  else {
    objc_super v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v10 = (void *)[v8 initWithArray:v9];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  objc_super v11 = [(_LSLocalizedStringRecord *)self _allUnsanitizedStringValues];
  v12 = [v11 allKeys];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        [v10 removeObject:*(void *)(*((void *)&v18 + 1) + 8 * i)];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  v16 = [v10 allObjects];

  return v16;
}

- (NSDictionary)_allUnsanitizedStringValues
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__allUnsanitizedStringValuesWithContext_tableID_unitID_unitBytes_);
}

- (NSArray)_missingBundleLocs
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__missingBundleLocsWithContext_tableID_unitID_unitBytes_);
}

- (NSString)stringValue
{
  return (NSString *)[(_LSLocalizedStringRecord *)self stringValueWithPreferredLocalizations:0];
}

- (void)_LSRecord_resolve__missingBundleLocs
{
  id v2 = [(_LSLocalizedStringRecord *)self _missingBundleLocs];
}

- (void)_LSRecord_resolve__allUnsanitizedStringValues
{
  id v2 = [(_LSLocalizedStringRecord *)self _allUnsanitizedStringValues];
}

- (NSString)defaultStringValue
{
  uint64_t v10 = 0;
  objc_super v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__35;
  uint64_t v14 = __Block_byref_object_dispose__35;
  id v15 = 0;
  v3 = (void *)MEMORY[0x18530F680](self, a2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46___LSLocalizedStringRecord_defaultStringValue__block_invoke;
  v9[3] = &unk_1E522FCA8;
  v9[4] = &v10;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46___LSLocalizedStringRecord_defaultStringValue__block_invoke_2;
  v8[3] = &unk_1E522C090;
  v8[4] = self;
  v8[5] = &v10;
  [(LSRecord *)self _ifAttached:v9 else:v8];
  if (v11[5])
  {
    uint64_t v4 = [(id)objc_opt_class() sanitizeString:v11[5]];
    v5 = (void *)v11[5];
    v11[5] = v4;
  }
  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (NSString *)v6;
}

- (id)stringValueWithPreferredLocalizations:(id)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__35;
  v17 = __Block_byref_object_dispose__35;
  id v18 = 0;
  id v6 = (void *)MEMORY[0x18530F680]();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke;
  v12[3] = &unk_1E522FC30;
  v12[4] = a3;
  v12[5] = &v13;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke_2;
  v11[3] = &unk_1E522FC58;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = &v13;
  v11[7] = a2;
  [(LSRecord *)self _ifAttached:v12 else:v11];
  if (v14[5])
  {
    uint64_t v7 = [(id)objc_opt_class() sanitizeString:v14[5]];
    id v8 = (void *)v14[5];
    v14[5] = v7;
  }
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

+ (id)sanitizeString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _LSBalanceBiDiControlCharacters();

  v5 = _LSReplaceForbiddenCharacters(v4, 1);

  return v5;
}

+ (id)_propertyClasses
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)allStringValues
{
  id v2 = [(_LSLocalizedStringRecord *)self _allUnsanitizedStringValues];
  uint64_t v3 = [v2 count];
  if (v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v3];
    uint64_t v5 = objc_opt_class();
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __43___LSLocalizedStringRecord_allStringValues__block_invoke;
    uint64_t v14 = &unk_1E522FC80;
    uint64_t v16 = v5;
    id v6 = v4;
    id v15 = v6;
    [v2 enumerateKeysAndObjectsUsingBlock:&v11];
    uint64_t v7 = objc_msgSend(v6, "copy", v11, v12, v13, v14);
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v9 = v8;

  return v9;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(_LSLocalizedStringRecord *)self stringValue];
  id v6 = (void *)[v3 initWithFormat:@"<%@ %p> \"%@\"", v4, self, v5];

  return v6;
}

@end