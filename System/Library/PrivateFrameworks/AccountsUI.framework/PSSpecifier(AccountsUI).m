@interface PSSpecifier(AccountsUI)
+ (id)acui_iconForDataclass:()AccountsUI;
+ (id)acui_linkListCellSpecifierForDataclass:()AccountsUI account:target:set:get:detail:;
+ (id)acui_linkListCellSpecifierForDataclass:()AccountsUI target:set:get:detail:;
+ (id)acui_specifierForAppWithBundleID:()AccountsUI target:set:get:;
+ (id)acui_specifierForDataclass:()AccountsUI account:target:set:get:;
+ (id)acui_specifierForDataclass:()AccountsUI target:set:get:;
+ (id)acui_specifierIconForAccountTypeIdentifier:()AccountsUI;
+ (id)circularImageFromCGImage:()AccountsUI size:scale:;
+ (id)imageForApplicationBundleIdentifier:()AccountsUI;
+ (uint64_t)_bundle;
- (NSObject)_switchSpinnerTimer;
- (uint64_t)acui_appBundleID;
- (uint64_t)acui_dataclass;
@end

@implementation PSSpecifier(AccountsUI)

+ (uint64_t)_bundle
{
  return [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
}

+ (id)acui_iconForDataclass:()AccountsUI
{
  uint64_t v12 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  uint64_t obja = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __49__PSSpecifier_AccountsUI__acui_iconForDataclass___block_invoke;
  v9 = &__block_descriptor_40_e5_v8__0l;
  uint64_t v10 = v12;
  v14 = (dispatch_once_t *)&acui_iconForDataclass__onceToken;
  id v13 = 0;
  objc_storeStrong(&v13, &obja);
  if (*v14 != -1) {
    dispatch_once(v14, v13);
  }
  objc_storeStrong(&v13, 0);
  id v4 = (id)[(id)acui_iconForDataclass__dataClassIcons objectForKeyedSubscript:location[0]];
  objc_storeStrong(location, 0);
  return v4;
}

+ (id)imageForApplicationBundleIdentifier:()AccountsUI
{
  id location[2] = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  id v10 = (id)[MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F2B8]];
  id v3 = objc_alloc(MEMORY[0x1E4F6F248]);
  id v9 = (id)[v3 initWithBundleIdentifier:location[0]];
  id v8 = (id)[v9 prepareImageForDescriptor:v10];
  v5 = (void *)MEMORY[0x1E4F42A80];
  uint64_t v6 = [v8 CGImage];
  [v8 scale];
  id v7 = (id)objc_msgSend(v5, "imageWithCGImage:scale:orientation:", v6, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v7;
}

+ (id)circularImageFromCGImage:()AccountsUI size:scale:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  *(double *)&long long v25 = a4;
  *((double *)&v25 + 1) = a5;
  uint64_t v24 = a1;
  uint64_t v23 = a2;
  uint64_t v22 = a3;
  double v21 = a6;
  id v6 = objc_alloc(MEMORY[0x1E4F42A58]);
  id v20 = (id)[v6 initWithSize:v25];
  id v19 = (id)[MEMORY[0x1E4F42A80] imageWithCGImage:v22 scale:0 orientation:v21];
  id v9 = v20;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  int v12 = -1073741824;
  int v13 = 0;
  v14 = __63__PSSpecifier_AccountsUI__circularImageFromCGImage_size_scale___block_invoke;
  v15 = &unk_1E6D202E0;
  long long v17 = v25;
  id v16 = v19;
  id v18 = (id)[v9 imageWithActions:&v11];
  if (!v18)
  {
    os_log_t oslog = (os_log_t)_ACUILogSystem();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_32((uint64_t)v26, (uint64_t)"+[PSSpecifier(AccountsUI) circularImageFromCGImage:size:scale:]", 122, (uint64_t)"+[PSSpecifier(AccountsUI) circularImageFromCGImage:size:scale:]");
      _os_log_error_impl(&dword_1DDFE5000, oslog, OS_LOG_TYPE_ERROR, "%s (%d) \"%s Couldn't create circular image\"", v26, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  id v8 = v18;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  return v8;
}

+ (id)acui_specifierIconForAccountTypeIdentifier:()AccountsUI
{
  id location[2] = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  id v7 = (dispatch_once_t *)&acui_specifierIconForAccountTypeIdentifier__onceToken;
  id v6 = 0;
  objc_storeStrong(&v6, &__block_literal_global_5);
  if (*v7 != -1) {
    dispatch_once(v7, v6);
  }
  objc_storeStrong(&v6, 0);
  id v4 = (id)[(id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache objectForKeyedSubscript:location[0]];
  objc_storeStrong(location, 0);
  return v4;
}

+ (id)acui_specifierForDataclass:()AccountsUI target:set:get:
{
  id v13 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v10 = (id)objc_msgSend(v13, "acui_specifierForDataclass:account:target:set:get:", location[0], 0, v11, a5, a6);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v10;
}

+ (id)acui_specifierForDataclass:()AccountsUI account:target:set:get:
{
  id v19 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  id v16 = 0;
  objc_storeStrong(&v16, a5);
  v15[2] = a6;
  v15[1] = a7;
  v15[0] = +[ACUILocalization localizedStringForDataclass:location[0] withSuffix:@"LABEL" forAccount:v17];
  id v14 = (id)[v19 preferenceSpecifierNamed:v15[0] target:v16 set:a6 get:a7 detail:0 cell:6 edit:0];
  id v13 = (id)objc_msgSend(v19, "acui_iconForDataclass:", location[0]);
  if (v13) {
    [v14 setProperty:v13 forKey:*MEMORY[0x1E4F93190]];
  }
  [v14 setProperty:location[0] forKey:*MEMORY[0x1E4F93188]];
  [v14 setProperty:location[0] forKey:@"com.apple.accountsui.dataclass"];
  id v8 = v14;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v8;
}

+ (id)acui_linkListCellSpecifierForDataclass:()AccountsUI target:set:get:detail:
{
  id v15 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12 = (id)objc_msgSend(v15, "acui_linkListCellSpecifierForDataclass:account:target:set:get:detail:", location[0], 0, v13, a5, a6, a7);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v12;
}

+ (id)acui_linkListCellSpecifierForDataclass:()AccountsUI account:target:set:get:detail:
{
  id v21 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  id v18 = 0;
  objc_storeStrong(&v18, a5);
  v17[3] = a6;
  v17[2] = a7;
  v17[1] = a8;
  v17[0] = +[ACUILocalization localizedStringForDataclass:location[0] withSuffix:@"LABEL" forAccount:0];
  id v16 = (id)[v21 preferenceSpecifierNamed:v17[0] target:v18 set:a6 get:a7 detail:a8 cell:2 edit:0];
  id v15 = (id)objc_msgSend(v21, "acui_iconForDataclass:", location[0]);
  if (v15) {
    [v16 setProperty:v15 forKey:*MEMORY[0x1E4F93190]];
  }
  [v16 setProperty:location[0] forKey:*MEMORY[0x1E4F93188]];
  [v16 setProperty:location[0] forKey:@"com.apple.accountsui.dataclass"];
  id v9 = v16;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (uint64_t)acui_dataclass
{
  return objc_msgSend(a1, "propertyForKey:", @"com.apple.accountsui.dataclass", a2, a1);
}

+ (id)acui_specifierForAppWithBundleID:()AccountsUI target:set:get:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v27 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  id v25 = 0;
  objc_storeStrong(&v25, a4);
  uint64_t v24 = a5;
  uint64_t v23 = a6;
  id v22 = 0;
  id v21 = (id)SBSCopyLocalizedApplicationNameForDisplayIdentifier();
  if ([v21 length])
  {
    id v6 = (id)[v27 preferenceSpecifierNamed:v21 target:v25 set:v24 get:v23 detail:0 cell:6 edit:0];
    id v7 = v22;
    id v22 = v6;

    [v22 setProperty:location[0] forKey:*MEMORY[0x1E4F93188]];
    [v22 setProperty:location[0] forKey:@"com.apple.accountsui.bundleID"];
    id v13 = (id)[MEMORY[0x1E4F42D90] mainScreen];
    [v13 scale];
    double v14 = v8;

    double v20 = v14;
    id v19 = 0;
    if ([location[0] isEqualToString:@"com.apple.siri"]) {
      id v9 = (id)PSSiriImage();
    }
    else {
      id v9 = (id)[MEMORY[0x1E4F42A80] _applicationIconImageForBundleIdentifier:location[0] format:0 scale:v20];
    }
    id v10 = v19;
    id v19 = v9;

    if (v19) {
      [v22 setProperty:v19 forKey:*MEMORY[0x1E4F93190]];
    }
    objc_storeStrong(&v19, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)_ACUILogSystem();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v28, (uint64_t)"+[PSSpecifier(AccountsUI) acui_specifierForAppWithBundleID:target:set:get:]", 245, (uint64_t)location[0]);
      _os_log_error_impl(&dword_1DDFE5000, oslog, OS_LOG_TYPE_ERROR, "%s (%d) \"SBS did not give us a name for the app with identifier %@!\"", v28, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  id v12 = v22;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v12;
}

- (uint64_t)acui_appBundleID
{
  return objc_msgSend(a1, "propertyForKey:", @"com.apple.accountsui.bundleID", a2, a1);
}

- (NSObject)_switchSpinnerTimer
{
  id v24 = a1;
  v23[1] = a2;
  v23[0] = (id)[a1 propertyForKey:*MEMORY[0x1E4F93220]];
  double v8 = MEMORY[0x1E4F14428];
  id v22 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v8);

  if (v23[0])
  {
    dispatch_time_t v2 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v22, v2, 0xFFFFFFFFFFFFFFFFLL, 0);
    v5 = v22;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    int v17 = -1073741824;
    int v18 = 0;
    id v19 = __46__PSSpecifier_AccountsUI___switchSpinnerTimer__block_invoke;
    double v20 = &unk_1E6D20118;
    id v21 = v23[0];
    dispatch_source_set_event_handler(v5, &v16);
    id v6 = v22;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    int v10 = -1073741824;
    int v11 = 0;
    id v12 = __46__PSSpecifier_AccountsUI___switchSpinnerTimer__block_invoke_2;
    id v13 = &unk_1E6D20098;
    id v14 = v23[0];
    id v15 = v24;
    dispatch_source_set_cancel_handler(v6, &v9);
    id v7 = (id)[v23[0] accessoryView];
    [v7 setEnabled:0];

    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v21, 0);
  }
  id v4 = v22;
  objc_storeStrong((id *)&v22, 0);
  objc_storeStrong(v23, 0);
  return v4;
}

@end