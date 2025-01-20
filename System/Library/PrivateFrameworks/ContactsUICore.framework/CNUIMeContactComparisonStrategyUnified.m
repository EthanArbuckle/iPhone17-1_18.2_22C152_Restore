@interface CNUIMeContactComparisonStrategyUnified
- (BOOL)isMeContact:(id)a3;
- (NSSet)meContactIdentifiersFound;
- (id)identifierAndLinkIdentifierAndLinkedContactIdentifiersFromContact:(id)a3;
- (id)meContactIdentifiers;
- (void)meContactChangedInStore:(id)a3;
- (void)setMeContactIdentifiersFound:(id)a3;
@end

@implementation CNUIMeContactComparisonStrategyUnified

- (void)meContactChangedInStore:(id)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263EFE020];
  v17[0] = *MEMORY[0x263EFDFE0];
  v17[1] = v4;
  v5 = (void *)MEMORY[0x263EFF8C0];
  id v6 = a3;
  v7 = [v5 arrayWithObjects:v17 count:2];
  id v16 = 0;
  v8 = [v6 _crossPlatformUnifiedMeContactWithKeysToFetch:v7 error:&v16];
  id v9 = v16;

  id v15 = v9;
  v10 = [v6 meContactIdentifiers:&v15];

  id v11 = v15;
  v12 = [(CNUIMeContactComparisonStrategyUnified *)self identifierAndLinkIdentifierAndLinkedContactIdentifiersFromContact:v8];
  v13 = (void *)[v12 mutableCopy];

  if (((*(uint64_t (**)(void))(*MEMORY[0x263F334B0] + 16))() & 1) == 0) {
    [v13 addObjectsFromArray:v10];
  }
  v14 = (void *)[v13 copy];
  [(CNUIMeContactComparisonStrategyUnified *)self setMeContactIdentifiersFound:v14];
}

- (id)meContactIdentifiers
{
  v2 = [(CNUIMeContactComparisonStrategyUnified *)self meContactIdentifiersFound];
  v3 = [v2 allObjects];

  return v3;
}

- (BOOL)isMeContact:(id)a3
{
  uint64_t v4 = [(CNUIMeContactComparisonStrategyUnified *)self identifierAndLinkIdentifierAndLinkedContactIdentifiersFromContact:a3];
  v5 = [(CNUIMeContactComparisonStrategyUnified *)self meContactIdentifiersFound];
  char v6 = [v4 intersectsSet:v5];

  return v6;
}

- (id)identifierAndLinkIdentifierAndLinkedContactIdentifiersFromContact:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF9C0] set];
  uint64_t v5 = *MEMORY[0x263F334E0];
  char v6 = [v3 identifier];
  char v7 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if ((v7 & 1) == 0)
  {
    v8 = [v3 identifier];
    [v4 addObject:v8];
  }
  if (![v3 isUnified])
  {
    id v15 = +[CNUIMeContactMonitor log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v3;
      _os_log_impl(&dword_20B704000, v15, OS_LOG_TYPE_DEFAULT, "*** WARNING *** contact is not unified %@", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_10;
  }
  id v9 = [v3 linkIdentifier];
  char v10 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v9);

  if ((v10 & 1) == 0)
  {
    id v11 = [v3 linkIdentifier];
    [v4 addObject:v11];
  }
  uint64_t v12 = *MEMORY[0x263F334B0];
  v13 = [v3 linkedContacts];
  v14 = objc_msgSend(v13, "_cn_map:", &__block_literal_global_136);
  LOBYTE(v12) = (*(uint64_t (**)(uint64_t, void *))(v12 + 16))(v12, v14);

  if ((v12 & 1) == 0)
  {
    id v15 = [v3 linkedContacts];
    id v16 = [v15 _cn_map:&__block_literal_global_136];
    [v4 addObjectsFromArray:v16];

LABEL_10:
  }

  return v4;
}

- (NSSet)meContactIdentifiersFound
{
  return self->_meContactIdentifiersFound;
}

- (void)setMeContactIdentifiersFound:(id)a3
{
}

- (void).cxx_destruct
{
}

@end