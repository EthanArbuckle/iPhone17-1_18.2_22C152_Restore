@interface ACDAccountStore(GKNillableShims)
- (void)gkSaveAccount:()GKNillableShims verify:withCompletion:;
@end

@implementation ACDAccountStore(GKNillableShims)

- (void)gkSaveAccount:()GKNillableShims verify:withCompletion:
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__ACDAccountStore_GKNillableShims__gkSaveAccount_verify_withCompletion___block_invoke;
  v10[3] = &unk_1E64724C0;
  id v11 = v8;
  id v9 = v8;
  [a1 saveAccount:a3 verify:a4 dataclassActions:0 completion:v10];
}

@end