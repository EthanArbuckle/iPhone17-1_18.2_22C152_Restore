@interface NSPersonNameComponents(ContactsPrivate)
+ (id)componentsForContact:()ContactsPrivate;
+ (id)descriptorForUsedKeys;
- (void)overrideComponentsInContact:()ContactsPrivate;
@end

@implementation NSPersonNameComponents(ContactsPrivate)

+ (id)componentsForContact:()ContactsPrivate
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  v6 = +[CN allNameComponentRelatedProperties];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__NSPersonNameComponents_ContactsPrivate__componentsForContact___block_invoke;
  v12[3] = &unk_1E56B92D8;
  uint64_t v15 = a1;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [v6 enumerateObjectsUsingBlock:v12];
  v9 = v14;
  id v10 = v7;

  return v10;
}

+ (id)descriptorForUsedKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__NSPersonNameComponents_ContactsPrivate__descriptorForUsedKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (descriptorForUsedKeys_cn_once_token_0 != -1) {
    dispatch_once(&descriptorForUsedKeys_cn_once_token_0, block);
  }
  v1 = (void *)descriptorForUsedKeys_cn_once_object_0;

  return v1;
}

- (void)overrideComponentsInContact:()ContactsPrivate
{
  id v4 = a3;
  id v5 = +[CN allNameComponentRelatedProperties];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__NSPersonNameComponents_ContactsPrivate__overrideComponentsInContact___block_invoke;
  v7[3] = &unk_1E56B9300;
  id v8 = v4;
  uint64_t v9 = a1;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

@end