@interface LAKeyStoreBackendQueryBuilder
- (id)_commonGenericPasswordParams;
- (id)_commonKeyParams;
- (id)_commonQueryParams;
- (id)createQueryForGenericPasswordWithIdentifier:(id)a3 domain:(id)a4 data:(id)a5 protectedBy:(id)a6;
- (id)createQueryForKeyWithIdentifier:(id)a3 domain:(id)a4 acl:(id)a5;
- (id)fetchQueryForGenericPasswordWithIdentifier:(id)a3 domain:(id)a4;
- (id)fetchQueryForGenericPasswordsWithDomain:(id)a3;
- (id)fetchQueryForKeyWithIdentifier:(id)a3 domain:(id)a4;
- (id)fetchQueryForKeyWithPublicKeyHash:(id)a3;
- (id)fetchQueryForKeysWithDomain:(id)a3;
- (id)removeQueryForGenericPasswordsWithDomain:(id)a3;
- (id)removeQueryForKeysWithDomain:(id)a3;
@end

@implementation LAKeyStoreBackendQueryBuilder

- (id)createQueryForKeyWithIdentifier:(id)a3 domain:(id)a4 acl:(id)a5
{
  v26[4] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = -[LAKeyStoreBackendQueryBuilder _commonKeyParams]((uint64_t)self);
  uint64_t v12 = *MEMORY[0x1E4F3B740];
  uint64_t v13 = *MEMORY[0x1E4F3B788];
  v25[0] = *MEMORY[0x1E4F3B718];
  v25[1] = v13;
  v26[0] = v12;
  v26[1] = v10;
  uint64_t v14 = *MEMORY[0x1E4F3B708];
  v26[2] = &unk_1F19EC6E8;
  uint64_t v15 = *MEMORY[0x1E4F3BC18];
  v25[2] = v14;
  v25[3] = v15;
  v23[0] = *MEMORY[0x1E4F3B548];
  v16 = +[LASecAccessControl deserializeACL:v8];

  uint64_t v17 = *MEMORY[0x1E4F3B6B0];
  v24[0] = v16;
  v24[1] = MEMORY[0x1E4F1CC38];
  uint64_t v18 = *MEMORY[0x1E4F3B5E0];
  v23[1] = v17;
  v23[2] = v18;
  v19 = [v9 dataUsingEncoding:4];

  v24[2] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  v26[3] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];

  [v11 addEntriesFromDictionary:v21];

  return v11;
}

- (id)_commonKeyParams
{
  v8[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = -[LAKeyStoreBackendQueryBuilder _commonQueryParams](a1);
    uint64_t v2 = *MEMORY[0x1E4F3B9A0];
    uint64_t v3 = *MEMORY[0x1E4F3B890];
    v7[0] = *MEMORY[0x1E4F3B978];
    v7[1] = v3;
    uint64_t v4 = *MEMORY[0x1E4F3B898];
    v8[0] = v2;
    v8[1] = v4;
    v7[2] = *MEMORY[0x1E4F3B6D8];
    v8[2] = *MEMORY[0x1E4F3B6E8];
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
    [v1 addEntriesFromDictionary:v5];
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

- (id)fetchQueryForKeyWithIdentifier:(id)a3 domain:(id)a4
{
  v17[5] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = -[LAKeyStoreBackendQueryBuilder _commonKeyParams]((uint64_t)self);
  uint64_t v9 = *MEMORY[0x1E4F3B788];
  v17[0] = v7;
  uint64_t v10 = *MEMORY[0x1E4F3B5E0];
  v16[0] = v9;
  v16[1] = v10;
  v11 = [v6 dataUsingEncoding:4];

  uint64_t v12 = *MEMORY[0x1E4F3BC80];
  v16[2] = *MEMORY[0x1E4F3BC68];
  v16[3] = v12;
  v16[4] = *MEMORY[0x1E4F3BB80];
  v17[1] = v11;
  v17[2] = MEMORY[0x1E4F1CC38];
  uint64_t v13 = *MEMORY[0x1E4F3BB90];
  v17[3] = MEMORY[0x1E4F1CC38];
  v17[4] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];

  [v8 addEntriesFromDictionary:v14];

  return v8;
}

- (id)fetchQueryForKeyWithPublicKeyHash:(id)a3
{
  v12[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = -[LAKeyStoreBackendQueryBuilder _commonKeyParams]((uint64_t)self);
  uint64_t v6 = *MEMORY[0x1E4F3BC68];
  v11[0] = *MEMORY[0x1E4F3B5D0];
  v11[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F3BB80];
  v11[2] = *MEMORY[0x1E4F3BC80];
  v11[3] = v7;
  v12[0] = v4;
  v12[1] = MEMORY[0x1E4F1CC38];
  uint64_t v8 = *MEMORY[0x1E4F3BB90];
  v12[2] = MEMORY[0x1E4F1CC38];
  v12[3] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];

  [v5 addEntriesFromDictionary:v9];

  return v5;
}

- (id)fetchQueryForKeysWithDomain:(id)a3
{
  v12[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = -[LAKeyStoreBackendQueryBuilder _commonKeyParams]((uint64_t)self);
  v11[0] = *MEMORY[0x1E4F3B5E0];
  uint64_t v6 = [v4 dataUsingEncoding:4];

  uint64_t v7 = *MEMORY[0x1E4F3BC80];
  v11[1] = *MEMORY[0x1E4F3BC68];
  v11[2] = v7;
  v11[3] = *MEMORY[0x1E4F3BB80];
  v12[0] = v6;
  v12[1] = MEMORY[0x1E4F1CC38];
  uint64_t v8 = *MEMORY[0x1E4F3BB88];
  v12[2] = MEMORY[0x1E4F1CC38];
  v12[3] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  [v5 addEntriesFromDictionary:v9];

  return v5;
}

- (id)removeQueryForKeysWithDomain:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = -[LAKeyStoreBackendQueryBuilder _commonKeyParams]((uint64_t)self);
  uint64_t v9 = *MEMORY[0x1E4F3B5E0];
  uint64_t v6 = [v4 dataUsingEncoding:4];

  v10[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 addEntriesFromDictionary:v7];

  return v5;
}

- (id)createQueryForGenericPasswordWithIdentifier:(id)a3 domain:(id)a4 data:(id)a5 protectedBy:(id)a6
{
  v23[6] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = -[LAKeyStoreBackendQueryBuilder _commonGenericPasswordParams]((uint64_t)self);
  v22[0] = *MEMORY[0x1E4F3B548];
  uint64_t v15 = +[LASecAccessControl allowAllACL];
  uint64_t v16 = *MEMORY[0x1E4F3B788];
  v23[0] = v15;
  v23[1] = v13;
  uint64_t v17 = *MEMORY[0x1E4F3B5C0];
  v22[1] = v16;
  v22[2] = v17;
  uint64_t v18 = *MEMORY[0x1E4F3B850];
  v23[2] = v13;
  void v23[3] = v12;
  uint64_t v19 = *MEMORY[0x1E4F3B688];
  v22[3] = v18;
  v22[4] = v19;
  v22[5] = *MEMORY[0x1E4F3BD38];
  v23[4] = v10;
  v23[5] = v11;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:6];

  [v14 addEntriesFromDictionary:v20];

  return v14;
}

- (id)_commonGenericPasswordParams
{
  v7[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = -[LAKeyStoreBackendQueryBuilder _commonQueryParams](a1);
    uint64_t v2 = *MEMORY[0x1E4F3B978];
    v6[0] = *MEMORY[0x1E4F3B698];
    v6[1] = v2;
    uint64_t v3 = *MEMORY[0x1E4F3B988];
    v7[0] = MEMORY[0x1E4F1CC38];
    v7[1] = v3;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
    [v1 addEntriesFromDictionary:v4];
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

- (id)fetchQueryForGenericPasswordWithIdentifier:(id)a3 domain:(id)a4
{
  v16[6] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[LAKeyStoreBackendQueryBuilder _commonGenericPasswordParams]((uint64_t)self);
  uint64_t v9 = *MEMORY[0x1E4F3B5C0];
  v15[0] = *MEMORY[0x1E4F3B788];
  v15[1] = v9;
  v16[0] = v7;
  v16[1] = v7;
  uint64_t v10 = *MEMORY[0x1E4F3BC68];
  v15[2] = *MEMORY[0x1E4F3B850];
  v15[3] = v10;
  uint64_t v11 = *MEMORY[0x1E4F3BB80];
  v15[4] = *MEMORY[0x1E4F3BC70];
  v15[5] = v11;
  v16[2] = v6;
  v16[3] = MEMORY[0x1E4F1CC38];
  uint64_t v12 = *MEMORY[0x1E4F3BB90];
  v16[4] = MEMORY[0x1E4F1CC38];
  void v16[5] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:6];

  [v8 addEntriesFromDictionary:v13];

  return v8;
}

- (id)fetchQueryForGenericPasswordsWithDomain:(id)a3
{
  v12[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = -[LAKeyStoreBackendQueryBuilder _commonGenericPasswordParams]((uint64_t)self);
  uint64_t v6 = *MEMORY[0x1E4F3BC68];
  v11[0] = *MEMORY[0x1E4F3B850];
  v11[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F3BB80];
  v11[2] = *MEMORY[0x1E4F3BC70];
  v11[3] = v7;
  v12[0] = v4;
  v12[1] = MEMORY[0x1E4F1CC38];
  uint64_t v8 = *MEMORY[0x1E4F3BB88];
  v12[2] = MEMORY[0x1E4F1CC38];
  v12[3] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];

  [v5 addEntriesFromDictionary:v9];

  return v5;
}

- (id)removeQueryForGenericPasswordsWithDomain:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = -[LAKeyStoreBackendQueryBuilder _commonGenericPasswordParams]((uint64_t)self);
  uint64_t v8 = *MEMORY[0x1E4F3B850];
  v9[0] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v5 addEntriesFromDictionary:v6];

  return v5;
}

- (id)_commonQueryParams
{
  void v6[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = *MEMORY[0x1E4F3BD08];
    v5[0] = *MEMORY[0x1E4F3B670];
    v5[1] = v1;
    v6[0] = @"APLA";
    v6[1] = MEMORY[0x1E4F1CC38];
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
    uint64_t v3 = (void *)[v2 mutableCopy];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

@end