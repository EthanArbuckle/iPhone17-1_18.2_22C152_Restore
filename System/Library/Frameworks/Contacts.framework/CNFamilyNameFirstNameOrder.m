@interface CNFamilyNameFirstNameOrder
- (id)nameProperties;
- (id)phoneticNameProperties;
- (id)sortingNameProperties;
- (int64_t)nameOrder;
@end

@implementation CNFamilyNameFirstNameOrder

- (id)nameProperties
{
  if (nameProperties_cn_once_token_5 != -1) {
    dispatch_once(&nameProperties_cn_once_token_5, &__block_literal_global_33_0);
  }
  v2 = (void *)nameProperties_cn_once_object_5;

  return v2;
}

void __44__CNFamilyNameFirstNameOrder_nameProperties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C978]);
  id v7 = +[CN namePrefixDescription];
  v1 = +[CN familyNameDescription];
  v2 = +[CN givenNameDescription];
  v3 = +[CN middleNameDescription];
  v4 = +[CN nameSuffixDescription];
  uint64_t v5 = objc_msgSend(v0, "initWithObjects:", v7, v1, v2, v3, v4, 0);
  v6 = (void *)nameProperties_cn_once_object_5;
  nameProperties_cn_once_object_5 = v5;
}

- (id)phoneticNameProperties
{
  if (phoneticNameProperties_cn_once_token_6 != -1) {
    dispatch_once(&phoneticNameProperties_cn_once_token_6, &__block_literal_global_35_2);
  }
  v2 = (void *)phoneticNameProperties_cn_once_object_6;

  return v2;
}

void __52__CNFamilyNameFirstNameOrder_phoneticNameProperties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C978]);
  id v5 = +[CN phoneticFamilyNameDescription];
  v1 = +[CN phoneticGivenNameDescription];
  v2 = +[CN phoneticMiddleNameDescription];
  uint64_t v3 = objc_msgSend(v0, "initWithObjects:", v5, v1, v2, 0);
  v4 = (void *)phoneticNameProperties_cn_once_object_6;
  phoneticNameProperties_cn_once_object_6 = v3;
}

- (id)sortingNameProperties
{
  if (sortingNameProperties_cn_once_token_7 != -1) {
    dispatch_once(&sortingNameProperties_cn_once_token_7, &__block_literal_global_37_0);
  }
  v2 = (void *)sortingNameProperties_cn_once_object_7;

  return v2;
}

void __51__CNFamilyNameFirstNameOrder_sortingNameProperties__block_invoke()
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v12 = objc_alloc(MEMORY[0x1E4F1C978]);
  v13 = +[CN phoneticFamilyNameDescription];
  v16[0] = v13;
  id v0 = +[CN familyNameDescription];
  v16[1] = v0;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v2 = +[CN phoneticGivenNameDescription];
  v15[0] = v2;
  uint64_t v3 = +[CN givenNameDescription];
  v15[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  id v5 = +[CN phoneticMiddleNameDescription];
  v14[0] = v5;
  v6 = +[CN middleNameDescription];
  v14[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v8 = +[CN nameSuffixDescription];
  v9 = +[CN namePrefixDescription];
  uint64_t v10 = objc_msgSend(v12, "initWithObjects:", v1, v4, v7, v8, v9, 0);
  v11 = (void *)sortingNameProperties_cn_once_object_7;
  sortingNameProperties_cn_once_object_7 = v10;
}

- (int64_t)nameOrder
{
  return 2;
}

@end