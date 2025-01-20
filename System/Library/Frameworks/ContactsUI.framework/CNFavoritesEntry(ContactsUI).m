@interface CNFavoritesEntry(ContactsUI)
- (void)performActionWithCompletion:()ContactsUI;
- (void)performActionWithContext:()ContactsUI completion:;
- (void)performActionWithExtensionContext:()ContactsUI completion:;
@end

@implementation CNFavoritesEntry(ContactsUI)

- (void)performActionWithExtensionContext:()ContactsUI completion:
{
  v6 = (void *)MEMORY[0x1E4F5A708];
  id v7 = a4;
  id v8 = [v6 contextWithExtensionContext:a3];
  [a1 performActionWithContext:v8 completion:v7];
}

- (void)performActionWithCompletion:()ContactsUI
{
  v4 = (objc_class *)MEMORY[0x1E4F5A708];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [a1 performActionWithContext:v6 completion:v5];
}

- (void)performActionWithContext:()ContactsUI completion:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F5A718];
  v9 = [a1 contactProperty];
  v10 = [a1 actionType];
  v11 = [a1 bundleIdentifier];
  v12 = [v8 actionItemForContactProperty:v9 actionType:v10 bundleIdentifier:v11];

  if (v12)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1B9F8]);
    v14 = [v13 channelForFavoritesEntry:a1 error:0];

    v15 = [v14 channelIdentifier];
    [v6 setChannelIdentifier:v15];

    [v6 setIsOriginatingFromFavorites:1];
    v16 = [v12 performActionWithContext:v6];
    if (v7)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __68__CNFavoritesEntry_ContactsUI__performActionWithContext_completion___block_invoke;
      v20[3] = &unk_1E54993A0;
      id v17 = v7;
      id v21 = v17;
      [v16 addSuccessBlock:v20];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __68__CNFavoritesEntry_ContactsUI__performActionWithContext_completion___block_invoke_2;
      v18[3] = &unk_1E54993C8;
      id v19 = v17;
      [v16 addFailureBlock:v18];
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5A5E0] code:204 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v14);
  }
}

@end