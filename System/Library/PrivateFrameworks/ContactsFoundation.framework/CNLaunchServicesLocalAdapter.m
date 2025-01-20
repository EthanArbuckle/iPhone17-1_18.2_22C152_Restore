@interface CNLaunchServicesLocalAdapter
+ (id)lsApplicationWorkspaceForBundleId:(id)a3;
- (CNLaunchServicesLocalAdapter)initWithApplicationWorkspace:(id)a3;
- (LSApplicationWorkspace)workspace;
- (id)getDefaultAppProxyFromTU;
- (unint64_t)_convertDefaultAppCategory:(unint64_t)a3;
- (void)applicationForBundleIdentifier:(id)a3 withReply:(id)a4;
- (void)applicationsAvailableForDefaultAppCategory:(id)a3 withReply:(id)a4;
- (void)applicationsAvailableForHandlingURLScheme:(id)a3 withReply:(id)a4;
- (void)applicationsForUserActivityType:(id)a3 withReply:(id)a4;
- (void)defaultApplicationForDefaultAppCategory:(id)a3 withReply:(id)a4;
- (void)openSensitiveURLInBackground:(id)a3 withOptions:(id)a4 withReply:(id)a5;
- (void)openUserActivityData:(id)a3 inApplication:(id)a4 withReply:(id)a5;
- (void)setWorkspace:(id)a3;
@end

@implementation CNLaunchServicesLocalAdapter

- (CNLaunchServicesLocalAdapter)initWithApplicationWorkspace:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNLaunchServicesLocalAdapter;
  v6 = [(CNLaunchServicesLocalAdapter *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workspace, a3);
    v8 = v7;
  }

  return v7;
}

- (void)applicationsForUserActivityType:(id)a3 withReply:(id)a4
{
  v6 = (void (**)(id, id, void))a4;
  id v7 = a3;
  v8 = [(CNLaunchServicesLocalAdapter *)self workspace];
  v9 = [v8 applicationsForUserActivityType:v7];

  objc_msgSend(v9, "_cn_map:", &__block_literal_global_81);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if (off_1EE0265E0((uint64_t)&__block_literal_global_93, v11)) {
    id v10 = v11;
  }
  else {
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }
  v6[2](v6, v10, 0);
}

- (void)applicationsAvailableForHandlingURLScheme:(id)a3 withReply:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F29088];
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = a3;
  id v14 = objc_alloc_init(v6);
  [v14 setScheme:v8];

  v9 = [(CNLaunchServicesLocalAdapter *)self workspace];
  id v10 = [v14 URL];
  id v11 = [v9 applicationsAvailableForOpeningURL:v10];
  v12 = objc_msgSend(v11, "_cn_map:", &__block_literal_global_81);

  if (off_1EE0265E0((uint64_t)&__block_literal_global_93, v12)) {
    v13 = v12;
  }
  else {
    v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v7[2](v7, v13, 0);
}

- (void)applicationsAvailableForDefaultAppCategory:(id)a3 withReply:(id)a4
{
  v6 = (void (**)(id, void *, void))a4;
  unint64_t v7 = -[CNLaunchServicesLocalAdapter _convertDefaultAppCategory:](self, "_convertDefaultAppCategory:", [a3 integerValue]);
  id v11 = [MEMORY[0x1E4F223C8] displayOrderEnumeratorForViableDefaultAppsForCategory:v7 options:0];
  id v8 = [v11 allObjects];
  v9 = objc_msgSend(v8, "_cn_map:", &__block_literal_global_15_1);

  if (off_1EE0265E0((uint64_t)&__block_literal_global_93, v9)) {
    id v10 = v9;
  }
  else {
    id v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v6[2](v6, v10, 0);
}

- (void)defaultApplicationForDefaultAppCategory:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (void (**)(id, uint64_t, void))a4;
  if ([v6 integerValue] == 1
    && ([(CNLaunchServicesLocalAdapter *)self getDefaultAppProxyFromTU],
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v9 = (id)v8;
    v7[2](v7, v8, 0);
  }
  else
  {
    unint64_t v10 = -[CNLaunchServicesLocalAdapter _convertDefaultAppCategory:](self, "_convertDefaultAppCategory:", [v6 integerValue]);
    id v11 = [(CNLaunchServicesLocalAdapter *)self workspace];
    id v15 = 0;
    v12 = [v11 defaultApplicationForCategory:v10 error:&v15];
    id v9 = v15;

    if (v12)
    {
      id v14 = CNApplicationProxyFromLSApplicationRecord_block_invoke_2(v13, v12);
    }
    else
    {
      id v14 = 0;
    }
    ((void (**)(id, uint64_t, id))v7)[2](v7, (uint64_t)v14, v9);
  }
}

- (id)getDefaultAppProxyFromTU
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  v2 = (uint64_t (*)(void))getdefaultAppRelayTelephonySettingSymbolLoc_ptr;
  uint64_t v13 = getdefaultAppRelayTelephonySettingSymbolLoc_ptr;
  if (!getdefaultAppRelayTelephonySettingSymbolLoc_ptr)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getdefaultAppRelayTelephonySettingSymbolLoc_block_invoke;
    v9[3] = &unk_1E569FC28;
    v9[4] = &v10;
    __getdefaultAppRelayTelephonySettingSymbolLoc_block_invoke((uint64_t)v9);
    v2 = (uint64_t (*)(void))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v2)
  {
    +[CNImageCropUtilities centeredSquareCropRectInRect:]();
    uint64_t v8 = v7;
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v8);
  }
  uint64_t v3 = v2();
  if (v3 == 1)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  else if (v3 == 2)
  {
    v4 = [CNApplicationProxy alloc];
    id v5 = [(CNApplicationProxy *)v4 initWithBundleIdentifier:@"com.apple.mobilephone" teamIdentifier:@"0000000000" localizedName:@"Phone" activityTypes:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (unint64_t)_convertDefaultAppCategory:(unint64_t)a3
{
  if (!a3) {
    return 3;
  }
  if (a3 != 1)
  {
    CNUnimplementedMethodException(self, a2);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return 4;
}

- (void)applicationForBundleIdentifier:(id)a3 withReply:(id)a4
{
  id v5 = (void (**)(id, id, void))a4;
  id v6 = a3;
  unint64_t v7 = [(id)objc_opt_class() lsApplicationWorkspaceForBundleId:v6];

  CNApplicationProxyFromLSApplicationProxy_block_invoke(v8, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  v5[2](v5, v9, 0);
}

- (void)openUserActivityData:(id)a3 inApplication:(id)a4 withReply:(id)a5
{
  id v16 = a4;
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F22488];
  id v9 = a5;
  id v10 = a3;
  id v11 = (void *)[[v8 alloc] _initWithUserActivityData:v10];

  uint64_t v12 = [v16 bundleIdentifier];

  if (v12)
  {
    uint64_t v13 = objc_opt_class();
    id v14 = [v16 bundleIdentifier];
    uint64_t v12 = [v13 lsApplicationWorkspaceForBundleId:v14];
  }
  id v15 = [(CNLaunchServicesLocalAdapter *)self workspace];
  [v15 openUserActivity:v11 withApplicationProxy:v12 completionHandler:v9];
}

- (void)openSensitiveURLInBackground:(id)a3 withOptions:(id)a4 withReply:(id)a5
{
  uint64_t v8 = (void (**)(id, uint64_t, id))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CNLaunchServicesLocalAdapter *)self workspace];
  id v14 = 0;
  uint64_t v12 = [v11 openSensitiveURL:v10 withOptions:v9 error:&v14];

  id v13 = v14;
  v8[2](v8, v12, v13);
}

+ (id)lsApplicationWorkspaceForBundleId:(id)a3
{
  return (id)[MEMORY[0x1E4F223B8] applicationProxyForIdentifier:a3];
}

- (LSApplicationWorkspace)workspace
{
  return self->_workspace;
}

- (void)setWorkspace:(id)a3
{
}

- (void).cxx_destruct
{
}

@end