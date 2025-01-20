@interface BGAppRefreshTask
- (id)_initWithIdentifier:(id)a3 activity:(id)a4;
- (id)description;
- (void)setTaskCompletedWithSuccess:(BOOL)a3;
@end

@implementation BGAppRefreshTask

- (id)_initWithIdentifier:(id)a3 activity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BGAppRefreshTask;
  return [(BGTask *)&v5 _initWithIdentifier:a3 activity:a4];
}

- (id)description
{
  v2 = NSString;
  v3 = [(BGTask *)self identifier];
  v4 = [v2 stringWithFormat:@"<BGAppRefreshTask: %@>", v3];

  return v4;
}

- (void)setTaskCompletedWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    objc_super v5 = [(BGTask *)self _activity];

    if (v5) {
      v6 = &__block_literal_global;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  [(BGTask *)self _setTaskCompletedWithSuccess:v3 actionsIfNotAlreadyCompleted:v6];
}

double __48__BGAppRefreshTask_setTaskCompletedWithSuccess___block_invoke()
{
  Class v0 = NSClassFromString(&cfstr_Uiapplication.isa);
  if (!v0) {
    return 0.0;
  }
  v1 = [(objc_class *)v0 sharedApplication];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__BGAppRefreshTask_setTaskCompletedWithSuccess___block_invoke_2;
  v16[3] = &unk_264421958;
  id v2 = v1;
  id v17 = v2;
  BOOL v3 = (uint64_t (**)(void))MEMORY[0x21D4B0AB0](v16);
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v4 = [MEMORY[0x263F08B88] currentThread];
  int v5 = [v4 isMainThread];

  if (v5)
  {
    int v6 = v3[2](v3);
    *((unsigned char *)v13 + 24) = v6;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__BGAppRefreshTask_setTaskCompletedWithSuccess___block_invoke_3;
    block[3] = &unk_264421980;
    v11 = &v12;
    v10 = v3;
    dispatch_sync(MEMORY[0x263EF83A0], block);

    int v6 = *((unsigned __int8 *)v13 + 24);
  }
  if (v6) {
    double v7 = 0.1;
  }
  else {
    double v7 = 0.0;
  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __48__BGAppRefreshTask_setTaskCompletedWithSuccess___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _appAdoptsUISceneLifecycle];
  if ((v2 & 1) == 0) {
    [*(id *)(a1 + 32) _updateSnapshotForBackgroundApplication:1];
  }
  return v2 ^ 1u;
}

uint64_t __48__BGAppRefreshTask_setTaskCompletedWithSuccess___block_invoke_3(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end