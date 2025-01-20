@interface AMSUIWebAppViewModel
+ (BOOL)validateJSObject:(id)a3;
- (AMSUIWebAppViewModel)initWithJSObject:(id)a3 context:(id)a4;
- (NSString)accessibilityLabel;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)title;
- (NSURL)iconURL;
- (id)_makeBarButtonItemView;
- (id)iconWithSize:(CGSize)a3 scale:(double)a4;
- (void)setAccessibilityLabel:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setIconURL:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation AMSUIWebAppViewModel

- (AMSUIWebAppViewModel)initWithJSObject:(id)a3 context:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)AMSUIWebAppViewModel;
  v8 = [(AMSUIWebAppViewModel *)&v32 init];
  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:@"accessibilityLabel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }

    accessibilityLabel = v8->_accessibilityLabel;
    v8->_accessibilityLabel = v10;

    v12 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }

    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = v13;

    v15 = [v6 objectForKeyedSubscript:@"iconURL"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }

    if (v16)
    {
      uint64_t v17 = [objc_alloc(NSURL) initWithString:v16];
      iconURL = v8->_iconURL;
      v8->_iconURL = (NSURL *)v17;
    }
    v19 = [v6 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }

    title = v8->_title;
    v8->_title = v20;

    if (!v8->_title)
    {
      v22 = v8->_bundleIdentifier;
      id v31 = 0;
      v23 = [MEMORY[0x263F01890] bundleRecordWithBundleIdentifier:v22 allowPlaceholder:1 error:&v31];
      id v24 = v31;
      if (v23)
      {
        uint64_t v25 = [v23 localizedName];
        v26 = v8->_title;
        v8->_title = (NSString *)v25;
      }
      else
      {
        v26 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
        if (!v26)
        {
          v26 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        v27 = [v26 OSLogObject];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = objc_opt_class();
          v29 = [v7 logKey];
          *(_DWORD *)buf = 138543618;
          uint64_t v34 = v28;
          __int16 v35 = 2114;
          v36 = v29;
          _os_log_impl(&dword_21C134000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to get bundle record", buf, 0x16u);
        }
      }
    }
  }

  return v8;
}

- (id)_makeBarButtonItemView
{
  v23[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F82828]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = [v3 heightAnchor];
  v5 = [v4 constraintEqualToConstant:30.0];
  [v5 setActive:1];

  id v6 = [v3 widthAnchor];
  id v7 = [v6 constraintEqualToConstant:30.0];
  [v7 setActive:1];

  +[AMSUICommonScreen scale];
  v9 = -[AMSUIWebAppViewModel iconWithSize:scale:](self, "iconWithSize:scale:", 30.0, 30.0, v8);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __46__AMSUIWebAppViewModel__makeBarButtonItemView__block_invoke;
  v21[3] = &unk_2643E4740;
  id v22 = v3;
  id v10 = v3;
  [v9 addSuccessBlock:v21];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __46__AMSUIWebAppViewModel__makeBarButtonItemView__block_invoke_2;
  v20[3] = &unk_2643E3570;
  v20[4] = self;
  [v9 addErrorBlock:v20];
  v11 = objc_alloc_init(AMSUICommonLabel);
  v12 = [(AMSUIWebAppViewModel *)self title];
  [(AMSUICommonLabel *)v11 setText:v12];

  [(AMSUICommonLabel *)v11 setTextAlignment:1];
  v13 = objc_msgSend(MEMORY[0x263F825C8], "ams_primaryText");
  [(AMSUICommonLabel *)v11 setTextColor:v13];

  v14 = objc_alloc_init(AMSUICommonStackView);
  [(AMSUICommonStackView *)v14 setSpacing:8.0];
  [(AMSUICommonStackView *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  v23[0] = v10;
  v23[1] = v11;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  [(AMSUICommonStackView *)v14 addArrangedSubviews:v15];

  id v16 = objc_msgSend(MEMORY[0x263F825C8], "ams_appTint");
  [v10 setTintColor:v16];

  uint64_t v17 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835F0] addingSymbolicTraits:2 options:0];
  v18 = [MEMORY[0x263F81708] fontWithDescriptor:v17 size:0.0];
  [(AMSUICommonLabel *)v11 setFont:v18];

  [(AMSUICommonStackView *)v14 setAxis:0];
  return v14;
}

uint64_t __46__AMSUIWebAppViewModel__makeBarButtonItemView__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performSelectorOnMainThread:sel_setImage_ withObject:a2 waitUntilDone:0];
}

void __46__AMSUIWebAppViewModel__makeBarButtonItemView__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v3)
  {
    id v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2114;
    id v9 = v2;
    id v5 = v7;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to load image %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)iconWithSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  __int16 v8 = [(AMSUIWebAppViewModel *)self iconURL];
  if (v8)
  {
    id v9 = +[AMSUIImageLoader defaultLoader];
    id v10 = [v9 fetchImageWithURL:v8];
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x263F27E10]);
    id v12 = objc_alloc(MEMORY[0x263F4B540]);
    v13 = [(AMSUIWebAppViewModel *)self bundleIdentifier];
    id v9 = (void *)[v12 initWithBundleIdentifier:v13];

    v14 = objc_msgSend(objc_alloc(MEMORY[0x263F4B558]), "initWithSize:scale:", width, height, a4);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __43__AMSUIWebAppViewModel_iconWithSize_scale___block_invoke;
    v16[3] = &unk_2643E4768;
    id v10 = v11;
    id v17 = v10;
    [v9 getCGImageForImageDescriptor:v14 completion:v16];
  }
  return v10;
}

void __43__AMSUIWebAppViewModel_iconWithSize_scale___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = (id)[objc_alloc(MEMORY[0x263F827E8]) initWithCGImage:a2];
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:");
  }
  else
  {
    id v3 = *(void **)(a1 + 32);
    AMSError();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:");
  }
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(AMSUIWebAppViewModel *)self accessibilityLabel];

  if (v4)
  {
    id v5 = [(AMSUIWebAppViewModel *)self accessibilityLabel];
    [v3 setObject:v5 forKey:@"accessibilityLabel"];
  }
  int v6 = [(AMSUIWebAppViewModel *)self bundleIdentifier];

  if (v6)
  {
    id v7 = [(AMSUIWebAppViewModel *)self bundleIdentifier];
    [v3 setObject:v7 forKey:@"bundleIdentifier"];
  }
  __int16 v8 = [(AMSUIWebAppViewModel *)self iconURL];

  if (v8)
  {
    id v9 = [(AMSUIWebAppViewModel *)self iconURL];
    id v10 = [v9 absoluteString];
    [v3 setObject:v10 forKey:@"iconURL"];
  }
  id v11 = [(AMSUIWebAppViewModel *)self title];

  if (v11)
  {
    id v12 = [(AMSUIWebAppViewModel *)self title];
    [v3 setObject:v12 forKey:@"title"];
  }
  v13 = [v3 description];

  return (NSString *)v13;
}

+ (BOOL)validateJSObject:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"bundleIdentifier"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
}

@end