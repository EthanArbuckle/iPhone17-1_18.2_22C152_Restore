@interface LNSpeechUaapXPCClient
- (void)registerUaapApp:(id)a3 forLocale:(id)a4 withAssetFiles:(id)a5 completion:(id)a6;
@end

@implementation LNSpeechUaapXPCClient

- (void)registerUaapApp:(id)a3 forLocale:(id)a4 withAssetFiles:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v13 = (void *)getCSSpeechUaapXPCClientClass_softClass;
  uint64_t v20 = getCSSpeechUaapXPCClientClass_softClass;
  if (!getCSSpeechUaapXPCClientClass_softClass)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __getCSSpeechUaapXPCClientClass_block_invoke;
    v16[3] = &unk_1E5B39E50;
    v16[4] = &v17;
    __getCSSpeechUaapXPCClientClass_block_invoke((uint64_t)v16);
    v13 = (void *)v18[3];
  }
  v14 = v13;
  _Block_object_dispose(&v17, 8);
  id v15 = objc_alloc_init(v14);
  [v15 registerUaapApp:v9 forLocale:v10 withAssetFiles:v11 completion:v12];
}

@end