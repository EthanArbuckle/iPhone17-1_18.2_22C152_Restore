@interface ACUISOpenApplicationAction
- (ACUISOpenApplicationAction)init;
- (ACUISOpenApplicationAction)initWithNSUserActivity:(id)a3;
- (ACUISOpenApplicationAction)initWithURL:(id)a3;
- (NSSet)launchActions;
@end

@implementation ACUISOpenApplicationAction

- (ACUISOpenApplicationAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)ACUISOpenApplicationAction;
  return [(ACUISOpenApplicationAction *)&v3 initWithInfo:0 responder:0];
}

- (ACUISOpenApplicationAction)initWithURL:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = objc_opt_new();
    [v5 setObject:v4 forSetting:0];
  }
  else
  {
    v5 = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)ACUISOpenApplicationAction;
  v6 = [(ACUISOpenApplicationAction *)&v8 initWithInfo:v5 responder:0];

  return v6;
}

- (ACUISOpenApplicationAction)initWithNSUserActivity:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v16 = 0;
  v17[0] = &v16;
  v17[1] = 0x3032000000;
  v17[2] = __Block_byref_object_copy_;
  v17[3] = __Block_byref_object_dispose_;
  id v18 = 0;
  [v4 setNeedsSave:0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __53__ACUISOpenApplicationAction_initWithNSUserActivity___block_invoke;
  v15[3] = &unk_264E78380;
  v15[4] = &v19;
  v15[5] = &v16;
  [v4 _createUserActivityDataWithOptions:0 completionHandler:v15];
  if (*(void *)(v17[0] + 40))
  {
    v5 = _logger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ACUISOpenApplicationAction initWithNSUserActivity:]((uint64_t)v17, v5);
    }

    v14.receiver = self;
    v14.super_class = (Class)ACUISOpenApplicationAction;
    v6 = [(ACUISOpenApplicationAction *)&v14 initWithInfo:0 responder:0];
  }
  else
  {
    uint64_t v7 = v20[5];
    v25 = &unk_26F09DAB8;
    v26[0] = v7;
    objc_super v8 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
    v9 = (void *)[objc_alloc(MEMORY[0x263F823E0]) initWithSettings:v8];
    if (v9)
    {
      v10 = objc_opt_new();
      [v10 setObject:v9 forSetting:1];
      v13.receiver = self;
      v13.super_class = (Class)ACUISOpenApplicationAction;
      v6 = [(ACUISOpenApplicationAction *)&v13 initWithInfo:v10 responder:0];
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)ACUISOpenApplicationAction;
      v6 = [(ACUISOpenApplicationAction *)&v12 initWithInfo:0 responder:0];
    }
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v19, 8);
  return v6;
}

void __53__ACUISOpenApplicationAction_initWithNSUserActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  objc_super v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (NSSet)launchActions
{
  objc_super v3 = [(ACUISOpenApplicationAction *)self info];
  id v4 = [v3 objectForSetting:0];

  if (v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F829E0]) initWithURL:v4];
    id v6 = [MEMORY[0x263EFF9C0] set];
    [v6 addObject:v5];
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = [(ACUISOpenApplicationAction *)self info];
  objc_super v8 = [v7 objectForSetting:1];

  if (v8)
  {
    if (!v6)
    {
      id v6 = [MEMORY[0x263EFF9C0] set];
    }
    [v6 addObject:v8];
  }
  uint64_t v9 = (void *)[v6 copy];

  return (NSSet *)v9;
}

- (void)initWithNSUserActivity:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_23C948000, a2, OS_LOG_TYPE_ERROR, "Unable to serialize NSUserActivity: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end