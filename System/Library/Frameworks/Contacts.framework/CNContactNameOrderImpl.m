@interface CNContactNameOrderImpl
+ (id)defaultNewContactOrder;
+ (id)defaultOrder;
+ (id)defaultSortOrder;
+ (id)familyNameFirstOrder;
+ (id)givenNameFirstOrder;
+ (id)orderForSortOrder:(int64_t)a3;
- (id)nameProperties;
- (id)phoneticNameProperties;
- (id)sortingNameProperties;
- (int64_t)nameOrder;
@end

@implementation CNContactNameOrderImpl

+ (id)defaultOrder
{
  v3 = +[CNContactsUserDefaults sharedDefaults];
  uint64_t v4 = [v3 displayNameOrder];

  if (v4 == 2) {
    [a1 familyNameFirstOrder];
  }
  else {
  v5 = [a1 givenNameFirstOrder];
  }

  return v5;
}

+ (id)givenNameFirstOrder
{
  if (givenNameFirstOrder_cn_once_token_0 != -1) {
    dispatch_once(&givenNameFirstOrder_cn_once_token_0, &__block_literal_global_64);
  }
  v2 = (void *)givenNameFirstOrder_cn_once_object_0;

  return v2;
}

+ (id)familyNameFirstOrder
{
  if (familyNameFirstOrder_cn_once_token_1 != -1) {
    dispatch_once(&familyNameFirstOrder_cn_once_token_1, &__block_literal_global_3);
  }
  v2 = (void *)familyNameFirstOrder_cn_once_object_1;

  return v2;
}

uint64_t __46__CNContactNameOrderImpl_familyNameFirstOrder__block_invoke()
{
  familyNameFirstOrder_cn_once_object_1 = objc_alloc_init(CNFamilyNameFirstNameOrder);

  return MEMORY[0x1F41817F8]();
}

uint64_t __45__CNContactNameOrderImpl_givenNameFirstOrder__block_invoke()
{
  givenNameFirstOrder_cn_once_object_0 = objc_alloc_init(CNGivenNameFirstNameOrder);

  return MEMORY[0x1F41817F8]();
}

+ (id)defaultSortOrder
{
  v3 = +[CNContactsUserDefaults sharedDefaults];
  uint64_t v4 = [v3 sortOrder];

  if (v4 == 3) {
    [a1 familyNameFirstOrder];
  }
  else {
  v5 = [a1 givenNameFirstOrder];
  }

  return v5;
}

+ (id)defaultNewContactOrder
{
  v3 = +[CNContactsUserDefaults sharedDefaults];
  uint64_t v4 = [v3 newContactDisplayNameOrder];

  if (v4 == 2) {
    [a1 familyNameFirstOrder];
  }
  else {
  v5 = [a1 givenNameFirstOrder];
  }

  return v5;
}

- (int64_t)nameOrder
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"abstract method" userInfo:0];
  objc_exception_throw(v2);
}

+ (id)orderForSortOrder:(int64_t)a3
{
  if (a3 == 2)
  {
    v3 = +[CNContactNameOrderImpl givenNameFirstOrder];
  }
  else
  {
    if (a3 == 3) {
      +[CNContactNameOrderImpl familyNameFirstOrder];
    }
    else {
    v3 = +[CNContactNameOrderImpl defaultSortOrder];
    }
  }

  return v3;
}

- (id)nameProperties
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactNameOrderImpl;
  [(CNContactNameOrderImpl *)&v3 doesNotRecognizeSelector:a2];
  return 0;
}

- (id)phoneticNameProperties
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactNameOrderImpl;
  [(CNContactNameOrderImpl *)&v3 doesNotRecognizeSelector:a2];
  return 0;
}

- (id)sortingNameProperties
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactNameOrderImpl;
  [(CNContactNameOrderImpl *)&v3 doesNotRecognizeSelector:a2];
  return 0;
}

@end