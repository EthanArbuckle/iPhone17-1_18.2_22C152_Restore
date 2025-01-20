@interface AOSThreadManager
+ (id)sharedManager;
- (void)dealloc;
- (void)runAuthThreadWithContext:(id)a3;
@end

@implementation AOSThreadManager

+ (id)sharedManager
{
  id result = (id)_sharedMgr;
  if (!_sharedMgr)
  {
    id result = objc_alloc_init(AOSThreadManager);
    _sharedMgr = (uint64_t)result;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AOSThreadManager;
  [(AOSThreadManager *)&v2 dealloc];
}

- (void)runAuthThreadWithContext:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F086B0]);
  uint64_t v5 = [a3 account];
  uint64_t v6 = [a3 transaction];
  v7 = (void *)[a3 info];
  uint64_t v8 = [v7 objectForKey:kAOSAuthPreviousTokenKey];
  v9 = (void *)[v7 objectForKey:kAOSAuthRequestURLKey];
  if (v5)
  {
    AOSAccountGetUser(v5);
    AOSAccountGetPassword(v5);
  }
  if (!_AOSValidateURL(v9))
  {
    NSLog(&cfstr_AoskitErrorRaf.isa, v9);
    CFIndex v10 = 5001;
    goto LABEL_7;
  }
  if (v8 || (v16 = AOSAccountCopyAuthInfo(v5, v9, 0, 0)) == 0 || (v13 = v16, [v16 count] != 2))
  {
    CFIndex v10 = 5002;
LABEL_7:
    CFErrorRef v11 = CFErrorCreate(0, kAOSErrorDomain, v10, 0);
    int v12 = 0;
    v13 = 0;
    char v14 = v11 == 0;
    goto LABEL_8;
  }
  AOSTransactionSetResult(v6, v13);
  CFErrorRef v11 = 0;
  int v12 = 1;
  char v14 = 1;
LABEL_8:
  AOSTransactionSetError(v6, v11);
  AOSTransactionSetSuccessful(v6, v14);
  AOSTransactionSetIsFinished(v6, 1);
  if ((v14 & 1) == 0) {
    CFRelease(v11);
  }
  if (v12) {
    CFRelease(v13);
  }
  char v15 = [a3 scheduleCallback];
  if (a3 && (v15 & 1) == 0) {
    CFRelease(a3);
  }
  [v4 drain];
}

@end