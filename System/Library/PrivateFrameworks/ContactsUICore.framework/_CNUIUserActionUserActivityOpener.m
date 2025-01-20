@interface _CNUIUserActionUserActivityOpener
+ (id)errorForUnableToOpenUserActivity:(id)a3 withUnderlyingError:(id)a4;
- (CNLSApplicationWorkspace)applicationWorkspace;
- (_CNUIUserActionUserActivityOpener)init;
- (_CNUIUserActionUserActivityOpener)initWithApplicationWorkspace:(id)a3;
- (id)openUserActivity:(id)a3 usingBundleIdentifier:(id)a4 withScheduler:(id)a5;
@end

@implementation _CNUIUserActionUserActivityOpener

- (_CNUIUserActionUserActivityOpener)init
{
  v3 = objc_alloc_init(CNLSApplicationWorkspace);
  v4 = [(_CNUIUserActionUserActivityOpener *)self initWithApplicationWorkspace:v3];

  return v4;
}

- (_CNUIUserActionUserActivityOpener)initWithApplicationWorkspace:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNUIUserActionUserActivityOpener;
  v6 = [(_CNUIUserActionUserActivityOpener *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_applicationWorkspace, a3);
    v8 = v7;
  }

  return v7;
}

- (id)openUserActivity:(id)a3 usingBundleIdentifier:(id)a4 withScheduler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = (objc_class *)MEMORY[0x263F33630];
  id v11 = a5;
  id v12 = objc_alloc_init(v10);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __90___CNUIUserActionUserActivityOpener_openUserActivity_usingBundleIdentifier_withScheduler___block_invoke;
  v26[3] = &unk_264018780;
  id v13 = v8;
  id v27 = v13;
  v28 = self;
  id v29 = v9;
  id v30 = v12;
  id v14 = v12;
  id v15 = v9;
  [v11 performBlock:v26];

  v16 = [v14 future];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  v22 = __90___CNUIUserActionUserActivityOpener_openUserActivity_usingBundleIdentifier_withScheduler___block_invoke_2;
  v23 = &unk_2640173D0;
  v24 = self;
  id v25 = v13;
  id v17 = v13;
  v18 = [v16 recover:&v20];

  objc_msgSend(v18, "addFailureBlock:", &__block_literal_global_58, v20, v21, v22, v23, v24);
  return v18;
}

+ (id)errorForUnableToOpenUserActivity:(id)a3 withUnderlyingError:(id)a4
{
  v20[2] = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263F335A8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 descriptionBuilderWithObject:v7];
  id v9 = [v7 activityType];
  id v10 = (id)[v8 appendName:@"activityType" object:v9];

  id v11 = [v7 title];
  id v12 = (id)[v8 appendName:@"title" object:v11];

  id v13 = [v7 userInfo];

  id v14 = (id)[v8 appendName:@"userInfo" object:v13];
  v19[0] = @"user activity";
  id v15 = [v8 build];
  v19[1] = *MEMORY[0x263F08608];
  v20[0] = v15;
  v20[1] = v6;
  v16 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

  id v17 = [MEMORY[0x263F087E8] errorWithDomain:@"CNContactsUIErrorDomain" code:202 userInfo:v16];

  return v17;
}

- (CNLSApplicationWorkspace)applicationWorkspace
{
  return self->_applicationWorkspace;
}

- (void).cxx_destruct
{
}

@end