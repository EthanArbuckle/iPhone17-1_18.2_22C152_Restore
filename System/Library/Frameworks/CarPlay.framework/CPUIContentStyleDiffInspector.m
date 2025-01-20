@interface CPUIContentStyleDiffInspector
- (void)observeMapStyleWithBlock:(id)a3;
@end

@implementation CPUIContentStyleDiffInspector

- (void)observeMapStyleWithBlock:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__CPUIContentStyleDiffInspector_observeMapStyleWithBlock___block_invoke;
  v9[3] = &unk_26430A820;
  id v5 = v4;
  id v10 = v5;
  [(FBSSettingsDiffInspector *)self observeOtherSetting:1893182283 withBlock:v9];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__CPUIContentStyleDiffInspector_observeMapStyleWithBlock___block_invoke_2;
  v7[3] = &unk_26430A820;
  id v8 = v5;
  id v6 = v5;
  [(FBSSettingsDiffInspector *)self observeOtherSetting:3152422721 withBlock:v7];
}

uint64_t __58__CPUIContentStyleDiffInspector_observeMapStyleWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__CPUIContentStyleDiffInspector_observeMapStyleWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end