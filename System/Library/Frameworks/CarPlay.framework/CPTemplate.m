@interface CPTemplate
+ (BOOL)supportsSecureCoding;
- (BOOL)barButton:(id)a3 setImage:(id)a4;
- (BOOL)barButton:(id)a3 setTitle:(id)a4;
- (BOOL)control:(id)a3 setEnabled:(BOOL)a4;
- (BOOL)control:(id)a3 setSelected:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsUpdate;
- (BOOL)shouldHideNavigationBar;
- (BOOL)showsTabBadge;
- (CPBarButton)backButton;
- (CPBaseTemplateProviding)templateProvider;
- (CPTemplate)init;
- (CPTemplate)initWithCoder:(id)a3;
- (CPTemplateDelegate)templateDelegate;
- (NAFuture)templateProviderFuture;
- (NSArray)internalLeadingBarButtons;
- (NSArray)internalTrailingBarButtons;
- (NSString)backTitle;
- (NSString)description;
- (NSString)tabTitle;
- (NSUUID)identifier;
- (UIImage)tabImage;
- (UITabBarSystemItem)tabSystemItem;
- (id)userInfo;
- (unint64_t)hash;
- (void)connectTemplateProvider:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleActionForControlIdentifier:(id)a3;
- (void)invalidateTemplateProvider;
- (void)setBackButton:(id)a3;
- (void)setInternalLeadingBarButtons:(id)a3;
- (void)setInternalTrailingBarButtons:(id)a3;
- (void)setLeadingNavigationBarButtons:(id)a3;
- (void)setNeedsUpdate;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setShowsTabBadge:(BOOL)showsTabBadge;
- (void)setTabImage:(UIImage *)tabImage;
- (void)setTabSystemItem:(UITabBarSystemItem)tabSystemItem;
- (void)setTabTitle:(NSString *)tabTitle;
- (void)setTemplateDelegate:(id)a3;
- (void)setTemplateProvider:(id)a3;
- (void)setTemplateProviderFuture:(id)a3;
- (void)setTrailingNavigationBarButtons:(id)a3;
- (void)setUserInfo:(id)userInfo;
- (void)templateDidAppearWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)templateDidDisappearWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)templateWillAppearWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)templateWillDisappearWithIdentifier:(id)a3 animated:(BOOL)a4;
@end

@implementation CPTemplate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPTemplate)init
{
  v12.receiver = self;
  v12.super_class = (Class)CPTemplate;
  v2 = [(CPTemplate *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08C38] UUID];
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;

    uint64_t v5 = objc_opt_new();
    internalLeadingBarButtons = v2->_internalLeadingBarButtons;
    v2->_internalLeadingBarButtons = (NSArray *)v5;

    uint64_t v7 = objc_opt_new();
    internalTrailingBarButtons = v2->_internalTrailingBarButtons;
    v2->_internalTrailingBarButtons = (NSArray *)v7;

    v9 = (NAFuture *)objc_alloc_init(MEMORY[0x263F58190]);
    templateProviderFuture = v2->_templateProviderFuture;
    v2->_templateProviderFuture = v9;
  }
  return v2;
}

- (CPTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CPTemplate;
  uint64_t v5 = [(CPTemplate *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPTemplateIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"CPTemplateLeadingNavigationBarButtons"];
    internalLeadingBarButtons = v5->_internalLeadingBarButtons;
    v5->_internalLeadingBarButtons = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClasses:v11 forKey:@"CPTemplateTrailingNavigationBarButtons"];
    internalTrailingBarButtons = v5->_internalTrailingBarButtons;
    v5->_internalTrailingBarButtons = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPTemplateNavigationBarBackButtonKey"];
    backButton = v5->_backButton;
    v5->_backButton = (CPBarButton *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPTemplateTabTitleKey"];
    tabTitle = v5->_tabTitle;
    v5->_tabTitle = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPTemplateTabImageKey"];
    tabImage = v5->_tabImage;
    v5->_tabImage = (UIImage *)v20;

    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPTemplateTabSystemItemKey"];
    v5->_tabSystemItem = [v22 unsignedIntegerValue];

    v5->_showsTabBadge = [v4 decodeBoolForKey:@"kCPTemplateTabBadgeKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(CPTemplate *)self identifier];
  [v11 encodeObject:v4 forKey:@"CPTemplateIdentifier"];

  uint64_t v5 = [(CPTemplate *)self internalLeadingBarButtons];
  [v11 encodeObject:v5 forKey:@"CPTemplateLeadingNavigationBarButtons"];

  uint64_t v6 = [(CPTemplate *)self internalTrailingBarButtons];
  [v11 encodeObject:v6 forKey:@"CPTemplateTrailingNavigationBarButtons"];

  uint64_t v7 = [(CPTemplate *)self backButton];
  [v11 encodeObject:v7 forKey:@"kCPTemplateNavigationBarBackButtonKey"];

  v8 = [(CPTemplate *)self tabTitle];
  [v11 encodeObject:v8 forKey:@"CPTemplateTabTitleKey"];

  uint64_t v9 = [(CPTemplate *)self tabImage];
  [v11 encodeObject:v9 forKey:@"CPTemplateTabImageKey"];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[CPTemplate tabSystemItem](self, "tabSystemItem"));
  [v11 encodeObject:v10 forKey:@"kCPTemplateTabSystemItemKey"];

  objc_msgSend(v11, "encodeBool:forKey:", -[CPTemplate showsTabBadge](self, "showsTabBadge"), @"kCPTemplateTabBadgeKey");
}

- (NSString)description
{
  uint64_t v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CPTemplate;
  id v4 = [(CPTemplate *)&v11 description];
  uint64_t v5 = [(CPTemplate *)self identifier];
  uint64_t v6 = [(CPTemplate *)self userInfo];
  uint64_t v7 = [(CPTemplate *)self tabTitle];
  v8 = [(CPTemplate *)self tabImage];
  uint64_t v9 = [v3 stringWithFormat:@"%@ <identifier: %@, userInfo: %@, tabTitle: %@, tabImage: %@, showsTabBadge: %d>", v4, v5, v6, v7, v8, -[CPTemplate showsTabBadge](self, "showsTabBadge")];

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CPTemplate *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(CPTemplate *)v4 identifier];
      uint64_t v6 = [(CPTemplate *)self identifier];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(CPTemplate *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)connectTemplateProvider:(id)a3
{
  id v4 = a3;
  [(CPTemplate *)self setTemplateProvider:v4];
  id v5 = [(CPTemplate *)self templateProviderFuture];
  [v5 finishWithResult:v4];
}

- (void)invalidateTemplateProvider
{
  [(CPTemplate *)self setTemplateProvider:0];
  unint64_t v3 = [(CPTemplate *)self templateProviderFuture];
  [v3 cancel];

  id v4 = (id)objc_opt_new();
  [(CPTemplate *)self setTemplateProviderFuture:v4];
}

- (BOOL)shouldHideNavigationBar
{
  unint64_t v3 = [(CPTemplate *)self backButton];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(CPTemplate *)self leadingNavigationBarButtons];
    if ([v5 count])
    {
      BOOL v4 = 0;
    }
    else
    {
      uint64_t v6 = [(CPTemplate *)self trailingNavigationBarButtons];
      BOOL v4 = [v6 count] == 0;
    }
  }

  return v4;
}

- (void)setBackButton:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    id v8 = v6;
    uint64_t v9 = [MEMORY[0x263EFFA08] setWithObject:v7];
    id v10 = v8;
    if (([v9 containsObject:object_getClass(v10)] & 1) == 0)
    {
      objc_super v11 = (void *)MEMORY[0x263EFF940];
      uint64_t v12 = *MEMORY[0x263EFF4A0];
      v13 = NSStringFromSelector(a2);
      [v11 raise:v12, @"Unsupported object %@ passed to %@. Allowed classes: %@", v10, v13, v9, 0 format];
    }
  }
  objc_storeStrong((id *)&self->_backButton, a3);
  uint64_t v14 = [(CPTemplate *)self templateProviderFuture];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __28__CPTemplate_setBackButton___block_invoke;
  v17[3] = &unk_26430B400;
  id v18 = v6;
  id v15 = v6;
  id v16 = (id)[v14 addSuccessBlock:v17];
}

uint64_t __28__CPTemplate_setBackButton___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHostBackButton:*(void *)(a1 + 32)];
}

- (void)setLeadingNavigationBarButtons:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __45__CPTemplate_setLeadingNavigationBarButtons___block_invoke;
  v18[3] = &__block_descriptor_40_e28_v32__0__CPBarButton_8Q16_B24l;
  v18[4] = a2;
  [v5 enumerateObjectsUsingBlock:v18];
  id v6 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v20 = self;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_2181A5000, v6, OS_LOG_TYPE_DEFAULT, "%@: New leading bar buttons: %@", buf, 0x16u);
  }

  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(CPTemplate *)self setInternalLeadingBarButtons:0];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __45__CPTemplate_setLeadingNavigationBarButtons___block_invoke_38;
  v16[3] = &unk_26430B448;
  v16[4] = self;
  id v17 = v7;
  id v8 = v7;
  [v5 enumerateObjectsUsingBlock:v16];
  uint64_t v9 = (void *)[v8 copy];
  [(CPTemplate *)self setInternalLeadingBarButtons:v9];

  id v10 = [(CPTemplate *)self internalLeadingBarButtons];
  objc_super v11 = [(CPTemplate *)self templateProviderFuture];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __45__CPTemplate_setLeadingNavigationBarButtons___block_invoke_2;
  v14[3] = &unk_26430B400;
  id v15 = v10;
  id v12 = v10;
  id v13 = (id)[v11 addSuccessBlock:v14];
}

void __45__CPTemplate_setLeadingNavigationBarButtons___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  id v7 = *(const char **)(a1 + 32);
  id v11 = v3;
  if (([v6 containsObject:object_getClass(v11)] & 1) == 0)
  {
    id v8 = (void *)MEMORY[0x263EFF940];
    uint64_t v9 = *MEMORY[0x263EFF4A0];
    id v10 = NSStringFromSelector(v7);
    [v8 raise:v9, @"Unsupported object %@ passed to %@. Allowed classes: %@", v11, v10, v6, 0 format];
  }
}

void __45__CPTemplate_setLeadingNavigationBarButtons___block_invoke_38(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a3 == 2)
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = a2;
    [v6 setDelegate:v5];
    [*(id *)(a1 + 40) addObject:v6];
  }
}

uint64_t __45__CPTemplate_setLeadingNavigationBarButtons___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setLeadingNavigationBarButtons:*(void *)(a1 + 32)];
}

- (void)setTrailingNavigationBarButtons:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __46__CPTemplate_setTrailingNavigationBarButtons___block_invoke;
  v18[3] = &__block_descriptor_40_e28_v32__0__CPBarButton_8Q16_B24l;
  v18[4] = a2;
  [v5 enumerateObjectsUsingBlock:v18];
  id v6 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v20 = self;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_2181A5000, v6, OS_LOG_TYPE_DEFAULT, "%@: New trailing bar buttons: %@", buf, 0x16u);
  }

  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(CPTemplate *)self setInternalTrailingBarButtons:0];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __46__CPTemplate_setTrailingNavigationBarButtons___block_invoke_39;
  v16[3] = &unk_26430B448;
  v16[4] = self;
  id v17 = v7;
  id v8 = v7;
  [v5 enumerateObjectsUsingBlock:v16];
  uint64_t v9 = (void *)[v8 copy];
  [(CPTemplate *)self setInternalTrailingBarButtons:v9];

  id v10 = [(CPTemplate *)self internalTrailingBarButtons];
  id v11 = [(CPTemplate *)self templateProviderFuture];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__CPTemplate_setTrailingNavigationBarButtons___block_invoke_2;
  v14[3] = &unk_26430B400;
  id v15 = v10;
  id v12 = v10;
  id v13 = (id)[v11 addSuccessBlock:v14];
}

void __46__CPTemplate_setTrailingNavigationBarButtons___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  id v7 = *(const char **)(a1 + 32);
  id v11 = v3;
  if (([v6 containsObject:object_getClass(v11)] & 1) == 0)
  {
    id v8 = (void *)MEMORY[0x263EFF940];
    uint64_t v9 = *MEMORY[0x263EFF4A0];
    id v10 = NSStringFromSelector(v7);
    [v8 raise:v9, @"Unsupported object %@ passed to %@. Allowed classes: %@", v11, v10, v6, 0 format];
  }
}

void __46__CPTemplate_setTrailingNavigationBarButtons___block_invoke_39(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a3 == 2)
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = a2;
    [v6 setDelegate:v5];
    [*(id *)(a1 + 40) addObject:v6];
  }
}

uint64_t __46__CPTemplate_setTrailingNavigationBarButtons___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setTrailingNavigationBarButtons:*(void *)(a1 + 32)];
}

- (NSString)backTitle
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(CPTemplate *)self performSelector:sel_title];
  }
  else
  {
    id v3 = 0;
  }
  if (![v3 length])
  {
    BOOL v4 = [(CPTemplate *)self tabTitle];

    if (v4)
    {
      uint64_t v5 = [(CPTemplate *)self tabTitle];

      id v3 = (void *)v5;
    }
  }

  return (NSString *)v3;
}

- (void)handleActionForControlIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__CPTemplate_handleActionForControlIdentifier___block_invoke;
  v6[3] = &unk_264309F38;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __47__CPTemplate_handleActionForControlIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__9;
  objc_super v24 = __Block_byref_object_dispose__9;
  id v25 = 0;
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = [*(id *)(a1 + 32) leadingNavigationBarButtons];
  [v2 addObjectsFromArray:v3];

  id v4 = [*(id *)(a1 + 32) trailingNavigationBarButtons];
  [v2 addObjectsFromArray:v4];

  id v5 = [*(id *)(a1 + 32) backButton];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) backButton];
    [v2 addObject:v6];
  }
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __47__CPTemplate_handleActionForControlIdentifier___block_invoke_42;
  id v17 = &unk_26430B470;
  id v18 = *(id *)(a1 + 40);
  v19 = &v20;
  [v2 enumerateObjectsUsingBlock:&v14];
  if (v21[5])
  {
    id v7 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = v21[5];
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v27 = v9;
      __int16 v28 = 2112;
      uint64_t v29 = v8;
      __int16 v30 = 2112;
      uint64_t v31 = v10;
      _os_log_impl(&dword_2181A5000, v7, OS_LOG_TYPE_INFO, "%@: Activated button: %@ for control identifier: %@", buf, 0x20u);
    }

    objc_msgSend((id)v21[5], "handlePrimaryAction", v14, v15, v16, v17);
  }
  else
  {
    id v11 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = v12;
      __int16 v28 = 2112;
      uint64_t v29 = v13;
      _os_log_impl(&dword_2181A5000, v11, OS_LOG_TYPE_INFO, "%@: No button found for control identifier: %@", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v20, 8);
}

void __47__CPTemplate_handleActionForControlIdentifier___block_invoke_42(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 identifier];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)templateWillAppearWithIdentifier:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__CPTemplate_templateWillAppearWithIdentifier_animated___block_invoke;
  block[3] = &unk_26430B498;
  block[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __56__CPTemplate_templateWillAppearWithIdentifier_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) templateDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) templateDelegate];
    [v4 templateWillAppearWithIdentifier:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
  }
}

- (void)templateWillDisappearWithIdentifier:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CPTemplate_templateWillDisappearWithIdentifier_animated___block_invoke;
  block[3] = &unk_26430B498;
  block[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __59__CPTemplate_templateWillDisappearWithIdentifier_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) templateDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) templateDelegate];
    [v4 templateWillDisappearWithIdentifier:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
  }
}

- (void)templateDidAppearWithIdentifier:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CPTemplate_templateDidAppearWithIdentifier_animated___block_invoke;
  block[3] = &unk_26430B498;
  block[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __55__CPTemplate_templateDidAppearWithIdentifier_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) templateDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) templateDelegate];
    [v4 templateDidAppearWithIdentifier:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
  }
}

- (void)templateDidDisappearWithIdentifier:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__CPTemplate_templateDidDisappearWithIdentifier_animated___block_invoke;
  block[3] = &unk_26430B498;
  block[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __58__CPTemplate_templateDidDisappearWithIdentifier_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) templateDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) templateDelegate];
    [v4 templateDidDisappearWithIdentifier:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
  }
}

- (BOOL)control:(id)a3 setEnabled:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(CPTemplate *)self templateProviderFuture];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __33__CPTemplate_control_setEnabled___block_invoke;
  v11[3] = &unk_26430B4C0;
  id v12 = v6;
  BOOL v13 = a4;
  id v8 = v6;
  id v9 = (id)[v7 addSuccessBlock:v11];

  return 1;
}

void __33__CPTemplate_control_setEnabled___block_invoke(uint64_t a1, void *a2)
{
  char v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 setControl:v5 enabled:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)control:(id)a3 setSelected:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(CPTemplate *)self templateProviderFuture];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __34__CPTemplate_control_setSelected___block_invoke;
  v11[3] = &unk_26430B4C0;
  id v12 = v6;
  BOOL v13 = a4;
  id v8 = v6;
  id v9 = (id)[v7 addSuccessBlock:v11];

  return 1;
}

void __34__CPTemplate_control_setSelected___block_invoke(uint64_t a1, void *a2)
{
  char v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 setControl:v5 selected:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)barButton:(id)a3 setImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CPTemplate *)self templateProviderFuture];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __33__CPTemplate_barButton_setImage___block_invoke;
  v13[3] = &unk_26430B4E8;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = (id)[v8 addSuccessBlock:v13];

  return 1;
}

void __33__CPTemplate_barButton_setImage___block_invoke(uint64_t a1, void *a2)
{
  char v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 setBarButton:v5 image:*(void *)(a1 + 40)];
}

- (BOOL)barButton:(id)a3 setTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CPTemplate *)self templateProviderFuture];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __33__CPTemplate_barButton_setTitle___block_invoke;
  v13[3] = &unk_26430B4E8;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = (id)[v8 addSuccessBlock:v13];

  return 1;
}

void __33__CPTemplate_barButton_setTitle___block_invoke(uint64_t a1, void *a2)
{
  char v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 setBarButton:v5 title:*(void *)(a1 + 40)];
}

- (void)setNeedsUpdate
{
  id v2 = self;
  objc_sync_enter(v2);
  if (![(CPTemplate *)v2 needsUpdate])
  {
    [(CPTemplate *)v2 setNeedsUpdate:1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __28__CPTemplate_setNeedsUpdate__block_invoke;
    block[3] = &unk_264309D80;
    block[4] = v2;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  objc_sync_exit(v2);
}

void __28__CPTemplate_setNeedsUpdate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) performUpdate];
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(a1 + 32) setNeedsUpdate:0];
  objc_sync_exit(obj);
}

- (CPBarButton)backButton
{
  return self->_backButton;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)userInfo
{
}

- (NSString)tabTitle
{
  return self->_tabTitle;
}

- (void)setTabTitle:(NSString *)tabTitle
{
}

- (UIImage)tabImage
{
  return self->_tabImage;
}

- (void)setTabImage:(UIImage *)tabImage
{
}

- (UITabBarSystemItem)tabSystemItem
{
  return self->_tabSystemItem;
}

- (void)setTabSystemItem:(UITabBarSystemItem)tabSystemItem
{
  self->_tabSystemItem = tabSystemItem;
}

- (BOOL)showsTabBadge
{
  return self->_showsTabBadge;
}

- (void)setShowsTabBadge:(BOOL)showsTabBadge
{
  self->_showsTabBadge = showsTabBadge;
}

- (CPBaseTemplateProviding)templateProvider
{
  return self->_templateProvider;
}

- (void)setTemplateProvider:(id)a3
{
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (NAFuture)templateProviderFuture
{
  return self->_templateProviderFuture;
}

- (void)setTemplateProviderFuture:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (CPTemplateDelegate)templateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_templateDelegate);

  return (CPTemplateDelegate *)WeakRetained;
}

- (void)setTemplateDelegate:(id)a3
{
}

- (NSArray)internalLeadingBarButtons
{
  return self->_internalLeadingBarButtons;
}

- (void)setInternalLeadingBarButtons:(id)a3
{
}

- (NSArray)internalTrailingBarButtons
{
  return self->_internalTrailingBarButtons;
}

- (void)setInternalTrailingBarButtons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalTrailingBarButtons, 0);
  objc_storeStrong((id *)&self->_internalLeadingBarButtons, 0);
  objc_destroyWeak((id *)&self->_templateDelegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_templateProviderFuture, 0);
  objc_storeStrong((id *)&self->_templateProvider, 0);
  objc_storeStrong((id *)&self->_tabImage, 0);
  objc_storeStrong((id *)&self->_tabTitle, 0);
  objc_storeStrong(&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_backButton, 0);
}

@end