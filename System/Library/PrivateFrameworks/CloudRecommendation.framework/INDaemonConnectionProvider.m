@interface INDaemonConnectionProvider
- (void)renewCredentialsWithCompletion:(id)a3;
@end

@implementation INDaemonConnectionProvider

- (void)renewCredentialsWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v4 = (void *)getINDaemonConnectionClass_softClass;
  uint64_t v14 = getINDaemonConnectionClass_softClass;
  if (!getINDaemonConnectionClass_softClass)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __getINDaemonConnectionClass_block_invoke;
    v10[3] = &unk_2652845F8;
    v10[4] = &v11;
    __getINDaemonConnectionClass_block_invoke((uint64_t)v10);
    v4 = (void *)v12[3];
  }
  v5 = v4;
  _Block_object_dispose(&v11, 8);
  id v6 = objc_alloc_init(v5);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__INDaemonConnectionProvider_renewCredentialsWithCompletion___block_invoke;
  v8[3] = &unk_2652845D0;
  id v9 = v3;
  id v7 = v3;
  [v6 renewCredentialsWithCompletion:v8];
}

uint64_t __61__INDaemonConnectionProvider_renewCredentialsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end