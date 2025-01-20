@interface APUIAppIconDataSource
+ (id)_appClipIconForIdentifier:(id)a3;
+ (id)_appClipIconTreatmentForCGImage:(CGImage *)a3;
+ (id)iconForBundleIdentifier:(id)a3 shouldApplyMask:(BOOL)a4;
+ (void)openApplication:(id)a3 completion:(id)a4;
- (APUIAppIconDataSourceDelegate)delegate;
- (BOOL)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5;
- (id)icon:(id)a3 displayNameForLocation:(id)a4;
- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4;
- (id)icon:(id)a3 unmaskedImageWithInfo:(SBIconImageInfo *)a4;
- (unint64_t)priorityForIcon:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation APUIAppIconDataSource

+ (id)_appClipIconForIdentifier:(id)a3
{
  v4 = [MEMORY[0x263F1CBA0] webClipWithIdentifier:a3];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 iconImage];
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(a1, "_appClipIconTreatmentForCGImage:", objc_msgSend(v6, "CGImage"));
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_appClipIconTreatmentForCGImage:(CGImage *)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 scale];
  double v6 = v5;

  v7 = (void *)[objc_alloc(MEMORY[0x263F4B528]) initWithCGImage:a3 scale:v6];
  id v8 = objc_alloc(MEMORY[0x263F4B540]);
  v18[0] = v7;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  v10 = (void *)[v8 initWithImages:v9];

  v11 = [MEMORY[0x263F4B558] imageDescriptorNamed:*MEMORY[0x263F4B578]];
  [v11 setShape:5];
  v12 = [v10 prepareImageForDescriptor:v11];
  v13 = v12;
  if (v12)
  {
    v14 = (void *)MEMORY[0x263F1C6B0];
    uint64_t v15 = [v12 CGImage];
    [v13 scale];
    v16 = objc_msgSend(v14, "imageWithCGImage:scale:orientation:", v15, 0);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)iconForBundleIdentifier:(id)a3 shouldApplyMask:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  double v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 scale];
  double v8 = v7;

  v9 = [v5 lowercaseString];
  int v10 = [v9 isEqualToString:@"com.apple.mobilecal"];

  id v11 = objc_alloc(MEMORY[0x263F4B540]);
  v12 = v11;
  if (v10)
  {
    v13 = [MEMORY[0x263EFF910] date];
    v14 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v15 = (void *)[v12 initWithDate:v13 calendar:v14 format:0];
  }
  else
  {
    uint64_t v15 = (void *)[v11 initWithBundleIdentifier:v5];
  }
  v16 = [MEMORY[0x263F4B558] imageDescriptorNamed:*MEMORY[0x263F4B578]];
  [v16 setShouldApplyMask:v4];
  v17 = [v15 prepareImageForDescriptor:v16];
  v18 = objc_msgSend(MEMORY[0x263F1C6B0], "imageWithCGImage:scale:orientation:", objc_msgSend(v17, "CGImage"), 0, v8);

  return v18;
}

- (unint64_t)priorityForIcon:(id)a3
{
  return 1;
}

- (id)icon:(id)a3 displayNameForLocation:(id)a4
{
  BOOL v4 = [a3 applicationBundleID];
  if ([v4 length])
  {
    if ([MEMORY[0x263F24FF8] isAppClipWebClipBundleId:v4])
    {
      id v5 = [MEMORY[0x263F1CBA0] webClipWithIdentifier:v4];
      double v6 = [v5 title];
    }
    else
    {
      double v6 = [MEMORY[0x263F24FF8] localizedNameForBundle:v4];
    }
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4
{
  BOOL v4 = [a3 applicationBundleID];
  if ([v4 length] && objc_msgSend(MEMORY[0x263F24FF8], "isAppClipWebClipBundleId:", v4))
  {
    id v5 = [(id)objc_opt_class() _appClipIconForIdentifier:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)icon:(id)a3 unmaskedImageWithInfo:(SBIconImageInfo *)a4
{
  BOOL v4 = [a3 applicationBundleID];
  if ([v4 length])
  {
    id v5 = [(id)objc_opt_class() iconForBundleIdentifier:v4 shouldApplyMask:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = [WeakRetained appIconDataSource:self launchAppFromIcon:v6];

  if (v8)
  {
    BOOL v9 = 1;
  }
  else
  {
    int v10 = [v6 applicationBundleID];
    uint64_t v11 = [v10 length];
    BOOL v9 = v11 != 0;
    if (v11)
    {
      [(id)objc_opt_class() openApplication:v10 completion:0];
    }
    else
    {
      v12 = __atxlog_handle_ui();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[APUIAppIconDataSource icon:launchFromLocation:context:](v12);
      }
    }
  }

  return v9;
}

+ (void)openApplication:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  if ([v5 length])
  {
    if ([MEMORY[0x263F24FF8] isAppClipWebClipBundleId:v5])
    {
      double v7 = __atxlog_handle_ui();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v5;
        _os_log_impl(&dword_225AE0000, v7, OS_LOG_TYPE_DEFAULT, "AppIconDataSource: +openApplication asked to open clip: %@", buf, 0xCu);
      }

      [MEMORY[0x263F79480] launchWebClipWithIdentifier:v5];
      if (v6) {
        v6[2](v6, 1, 0);
      }
    }
    else
    {
      BOOL v9 = (void *)[v5 copy];

      int v10 = __atxlog_handle_ui();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v9;
        _os_log_impl(&dword_225AE0000, v10, OS_LOG_TYPE_DEFAULT, "AppIconDataSource: +openApplication launching app: %@", buf, 0xCu);
      }

      uint64_t v11 = dispatch_get_global_queue(25, 0);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __52__APUIAppIconDataSource_openApplication_completion___block_invoke;
      v12[3] = &unk_264764B00;
      id v5 = v9;
      id v13 = v5;
      v14 = v6;
      dispatch_async(v11, v12);
    }
  }
  else
  {
    char v8 = __atxlog_handle_ui();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[APUIAppIconDataSource icon:launchFromLocation:context:](v8);
    }

    if (v6) {
      v6[2](v6, 0, 0);
    }
  }
}

void __52__APUIAppIconDataSource_openApplication_completion___block_invoke(uint64_t a1)
{
  v10[3] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
  uint64_t v3 = *MEMORY[0x263F3F608];
  v9[0] = *MEMORY[0x263F3F5C0];
  v9[1] = v3;
  v10[0] = @"AppPredictions";
  v10[1] = MEMORY[0x263EFFA88];
  v9[2] = *MEMORY[0x263F3F5E8];
  v10[2] = MEMORY[0x263EFFA88];
  BOOL v4 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [MEMORY[0x263F3F778] optionsWithDictionary:v4];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__APUIAppIconDataSource_openApplication_completion___block_invoke_2;
  v7[3] = &unk_264764AD8;
  id v8 = *(id *)(a1 + 40);
  [v2 openApplication:v5 withOptions:v6 completion:v7];
}

void __52__APUIAppIconDataSource_openApplication_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    double v7 = __atxlog_handle_ui();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __52__APUIAppIconDataSource_openApplication_completion___block_invoke_2_cold_1((uint64_t)v6, v7);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, BOOL, id))(v8 + 16))(v8, v6 == 0, v6);
  }
}

- (APUIAppIconDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APUIAppIconDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)icon:(os_log_t)log launchFromLocation:context:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_225AE0000, log, OS_LOG_TYPE_ERROR, "AppIconDataSource: asked to +openApplication with empty identifier", v1, 2u);
}

void __52__APUIAppIconDataSource_openApplication_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225AE0000, a2, OS_LOG_TYPE_ERROR, "AppIconDataSource: could not open app: %@", (uint8_t *)&v2, 0xCu);
}

@end