@interface ACAccountStore(SLGoogle)
- (uint64_t)sl_openGoogleAuthenticationSheetForAccount:()SLGoogle shouldConfirm:completion:;
- (void)sl_openGoogleAuthenticationSheetForAccount:()SLGoogle shouldConfirm:delegateClassName:completion:;
- (void)sl_openGoogleAuthenticationSheetWithAccountDescription:()SLGoogle completion:;
- (void)sl_openYouTubeAuthenticationSheetWithAccountDescription:()SLGoogle completion:;
- (void)sl_openYouTubeAuthenticationSheetWithUsername:()SLGoogle accountDescription:completion:;
@end

@implementation ACAccountStore(SLGoogle)

- (void)sl_openGoogleAuthenticationSheetWithAccountDescription:()SLGoogle completion:
{
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x1E4F177C0];
  id v8 = a3;
  v9 = [a1 accountTypeWithAccountTypeIdentifier:v7];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F179B0]) initWithAccountType:v9];
  [v10 setAccountDescription:v8];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__ACAccountStore_SLGoogle__sl_openGoogleAuthenticationSheetWithAccountDescription_completion___block_invoke;
  v12[3] = &unk_1E6467930;
  id v13 = v6;
  id v11 = v6;
  objc_msgSend(a1, "sl_openGoogleAuthenticationSheetForAccount:shouldConfirm:completion:", v10, 0, v12);
}

- (uint64_t)sl_openGoogleAuthenticationSheetForAccount:()SLGoogle shouldConfirm:completion:
{
  return objc_msgSend(a1, "sl_openGoogleAuthenticationSheetForAccount:shouldConfirm:delegateClassName:completion:", a3, a4, @"SLGoogleAuthFlowController", a5);
}

- (void)sl_openYouTubeAuthenticationSheetWithAccountDescription:()SLGoogle completion:
{
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x1E4F177C0];
  id v8 = a3;
  v9 = [a1 accountTypeWithAccountTypeIdentifier:v7];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F179B0]) initWithAccountType:v9];
  [v10 setAccountDescription:v8];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__ACAccountStore_SLGoogle__sl_openYouTubeAuthenticationSheetWithAccountDescription_completion___block_invoke;
  v12[3] = &unk_1E6467930;
  id v13 = v6;
  id v11 = v6;
  objc_msgSend(a1, "sl_openGoogleAuthenticationSheetForAccount:shouldConfirm:delegateClassName:completion:", v10, 0, @"SLYouTubeAuthFlowController", v12);
}

- (void)sl_openYouTubeAuthenticationSheetWithUsername:()SLGoogle accountDescription:completion:
{
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x1E4F177C0];
  id v10 = a4;
  id v11 = a3;
  v12 = [a1 accountTypeWithAccountTypeIdentifier:v9];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F179B0]) initWithAccountType:v12];
  [v13 setUsername:v11];

  [v13 setAccountDescription:v10];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __104__ACAccountStore_SLGoogle__sl_openYouTubeAuthenticationSheetWithUsername_accountDescription_completion___block_invoke;
  v15[3] = &unk_1E6467930;
  id v16 = v8;
  id v14 = v8;
  objc_msgSend(a1, "sl_openGoogleAuthenticationSheetForAccount:shouldConfirm:delegateClassName:completion:", v13, 1, @"SLYouTubeAuthFlowController", v15);
}

- (void)sl_openGoogleAuthenticationSheetForAccount:()SLGoogle shouldConfirm:delegateClassName:completion:
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = CPSystemRootDirectory();
  id v14 = [v13 stringByAppendingPathComponent:@"System/Library/Frameworks/Social.framework"];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __114__ACAccountStore_SLGoogle__sl_openGoogleAuthenticationSheetForAccount_shouldConfirm_delegateClassName_completion___block_invoke;
  v16[3] = &unk_1E6467930;
  id v17 = v10;
  id v15 = v10;
  [a1 openAuthenticationURLForAccount:v12 withDelegateClassName:v11 fromBundleAtPath:v14 shouldConfirm:a4 completion:v16];
}

@end