@interface AMSUIWebNavigationBarModel
- (AMSUIWebBarButtonItemModel)accessoryBarButtonItemModel;
- (AMSUIWebBarButtonItemModel)leftBarButtonItemModel;
- (AMSUIWebBarButtonItemModel)rightBarButtonItemModel;
- (AMSUIWebNavigationBarModel)initWithJSObject:(id)a3 context:(id)a4;
- (BOOL)hidesBackButton;
- (BOOL)includesLeftItems;
- (BOOL)includesRightItems;
- (NSArray)otherBarButtonItemModels;
- (NSString)backButtonTitle;
- (NSString)backgroundColor;
- (NSString)description;
- (NSString)title;
- (int64_t)backgroundStyle;
- (int64_t)style;
- (void)setAccessoryBarButtonItemModel:(id)a3;
- (void)setBackButtonTitle:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setHidesBackButton:(BOOL)a3;
- (void)setLeftBarButtonItemModel:(id)a3;
- (void)setOtherBarButtonItemModels:(id)a3;
- (void)setRightBarButtonItemModel:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation AMSUIWebNavigationBarModel

- (AMSUIWebNavigationBarModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v47.receiver = self;
    v47.super_class = (Class)AMSUIWebNavigationBarModel;
    v9 = [(AMSUIWebNavigationBarModel *)&v47 init];
    if (v9)
    {
      v10 = [AMSUIWebBarButtonItemModel alloc];
      v11 = [v6 objectForKeyedSubscript:@"accessoryButton"];
      uint64_t v12 = [(AMSUIWebBarButtonItemModel *)v10 initWithJSObject:v11 context:v7];
      accessoryBarButtonItemModel = v9->_accessoryBarButtonItemModel;
      v9->_accessoryBarButtonItemModel = (AMSUIWebBarButtonItemModel *)v12;

      v14 = [v6 objectForKeyedSubscript:@"backButtonTitle"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }

      backButtonTitle = v9->_backButtonTitle;
      v9->_backButtonTitle = v15;

      uint64_t v17 = +[AMSUIWebModel backgroundColorFromPageModel:v6];
      backgroundColor = v9->_backgroundColor;
      v9->_backgroundColor = (NSString *)v17;

      v19 = [v6 objectForKeyedSubscript:@"backgroundStyle"];
      if (objc_opt_respondsToSelector())
      {
        v20 = [v6 objectForKeyedSubscript:@"backgroundStyle"];
        v9->_backgroundStyle = [v20 longLongValue];
      }
      else
      {
        v9->_backgroundStyle = 0;
      }

      v21 = [v6 objectForKeyedSubscript:@"hideBackButton"];
      if (objc_opt_respondsToSelector()) {
        v9->_hidesBackButton = [v21 BOOLValue];
      }
      v22 = [AMSUIWebBarButtonItemModel alloc];
      v23 = [v6 objectForKeyedSubscript:@"leftButton"];
      uint64_t v24 = [(AMSUIWebBarButtonItemModel *)v22 initWithJSObject:v23 context:v7];
      leftBarButtonItemModel = v9->_leftBarButtonItemModel;
      v9->_leftBarButtonItemModel = (AMSUIWebBarButtonItemModel *)v24;

      v26 = [v6 objectForKeyedSubscript:@"otherButtons"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v27 = v26;
      }
      else {
        id v27 = 0;
      }

      if (v27)
      {
        v45[0] = MEMORY[0x263EF8330];
        v45[1] = 3221225472;
        v45[2] = __55__AMSUIWebNavigationBarModel_initWithJSObject_context___block_invoke;
        v45[3] = &unk_2643E5458;
        id v46 = v7;
        uint64_t v28 = objc_msgSend(v27, "ams_mapWithTransformIgnoresNil:", v45);
        otherBarButtonItemModels = v9->_otherBarButtonItemModels;
        v9->_otherBarButtonItemModels = (NSArray *)v28;

        id v30 = v46;
      }
      else
      {
        v31 = [v6 objectForKeyedSubscript:@"otherButton"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v30 = v31;
        }
        else {
          id v30 = 0;
        }

        id v32 = objc_alloc(MEMORY[0x263EFF8C0]);
        v33 = [[AMSUIWebBarButtonItemModel alloc] initWithJSObject:v30 context:v7];
        uint64_t v34 = objc_msgSend(v32, "initWithObjects:", v33, 0);
        v35 = v9->_otherBarButtonItemModels;
        v9->_otherBarButtonItemModels = (NSArray *)v34;
      }
      v36 = [AMSUIWebBarButtonItemModel alloc];
      v37 = [v6 objectForKeyedSubscript:@"rightButton"];
      uint64_t v38 = [(AMSUIWebBarButtonItemModel *)v36 initWithJSObject:v37 context:v7];
      rightBarButtonItemModel = v9->_rightBarButtonItemModel;
      v9->_rightBarButtonItemModel = (AMSUIWebBarButtonItemModel *)v38;

      v40 = [v6 objectForKeyedSubscript:@"style"];
      if (objc_opt_respondsToSelector()) {
        v9->_style = [v40 integerValue];
      }
      v41 = [v6 objectForKeyedSubscript:@"title"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v42 = v41;
      }
      else {
        v42 = 0;
      }

      title = v9->_title;
      v9->_title = v42;
    }
    self = v9;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

AMSUIWebBarButtonItemModel *__55__AMSUIWebNavigationBarModel_initWithJSObject_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[AMSUIWebBarButtonItemModel alloc] initWithJSObject:v3 context:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)includesLeftItems
{
  v2 = [(AMSUIWebNavigationBarModel *)self leftBarButtonItemModel];
  char v3 = [v2 isEmpty] ^ 1;

  return v3;
}

- (BOOL)includesRightItems
{
  v2 = [(AMSUIWebNavigationBarModel *)self rightBarButtonItemModel];
  char v3 = [v2 isEmpty] ^ 1;

  return v3;
}

- (NSString)description
{
  v27[5] = *MEMORY[0x263EF8340];
  v26[0] = @"backgroundStyle";
  char v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[AMSUIWebNavigationBarModel backgroundStyle](self, "backgroundStyle"));
  v27[0] = v3;
  v26[1] = @"hidesBackButton";
  if ([(AMSUIWebNavigationBarModel *)self hidesBackButton]) {
    v4 = @"true";
  }
  else {
    v4 = @"false";
  }
  v27[1] = v4;
  v26[2] = @"includesLeftItems";
  if ([(AMSUIWebNavigationBarModel *)self includesLeftItems]) {
    v5 = @"true";
  }
  else {
    v5 = @"false";
  }
  v27[2] = v5;
  v26[3] = @"includesRightItems";
  if ([(AMSUIWebNavigationBarModel *)self includesRightItems]) {
    id v6 = @"true";
  }
  else {
    id v6 = @"false";
  }
  v27[3] = v6;
  v26[4] = @"style";
  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[AMSUIWebNavigationBarModel style](self, "style"));
  v27[4] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:5];
  v9 = (void *)[v8 mutableCopy];

  v10 = [(AMSUIWebNavigationBarModel *)self accessoryBarButtonItemModel];

  if (v10)
  {
    v11 = [(AMSUIWebNavigationBarModel *)self accessoryBarButtonItemModel];
    [v9 setObject:v11 forKey:@"accessoryButton"];
  }
  uint64_t v12 = [(AMSUIWebNavigationBarModel *)self backButtonTitle];

  if (v12)
  {
    v13 = [(AMSUIWebNavigationBarModel *)self backButtonTitle];
    [v9 setObject:v13 forKey:@"backButtonTitle"];
  }
  v14 = [(AMSUIWebNavigationBarModel *)self backgroundColor];

  if (v14)
  {
    v15 = [(AMSUIWebNavigationBarModel *)self backgroundColor];
    [v9 setObject:v15 forKey:@"backgroundColor"];
  }
  v16 = [(AMSUIWebNavigationBarModel *)self leftBarButtonItemModel];

  if (v16)
  {
    uint64_t v17 = [(AMSUIWebNavigationBarModel *)self leftBarButtonItemModel];
    [v9 setObject:v17 forKey:@"leftButton"];
  }
  v18 = [(AMSUIWebNavigationBarModel *)self otherBarButtonItemModels];

  if (v18)
  {
    v19 = [(AMSUIWebNavigationBarModel *)self otherBarButtonItemModels];
    [v9 setObject:v19 forKey:@"otherButtons"];
  }
  v20 = [(AMSUIWebNavigationBarModel *)self rightBarButtonItemModel];

  if (v20)
  {
    v21 = [(AMSUIWebNavigationBarModel *)self rightBarButtonItemModel];
    [v9 setObject:v21 forKey:@"rightButton"];
  }
  v22 = [(AMSUIWebNavigationBarModel *)self title];

  if (v22)
  {
    v23 = [(AMSUIWebNavigationBarModel *)self title];
    [v9 setObject:v23 forKey:@"title"];
  }
  uint64_t v24 = [v9 description];

  return (NSString *)v24;
}

- (AMSUIWebBarButtonItemModel)accessoryBarButtonItemModel
{
  return self->_accessoryBarButtonItemModel;
}

- (void)setAccessoryBarButtonItemModel:(id)a3
{
}

- (NSString)backButtonTitle
{
  return self->_backButtonTitle;
}

- (void)setBackButtonTitle:(id)a3
{
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
}

- (BOOL)hidesBackButton
{
  return self->_hidesBackButton;
}

- (void)setHidesBackButton:(BOOL)a3
{
  self->_hidesBackButton = a3;
}

- (AMSUIWebBarButtonItemModel)leftBarButtonItemModel
{
  return self->_leftBarButtonItemModel;
}

- (void)setLeftBarButtonItemModel:(id)a3
{
}

- (NSArray)otherBarButtonItemModels
{
  return self->_otherBarButtonItemModels;
}

- (void)setOtherBarButtonItemModels:(id)a3
{
}

- (AMSUIWebBarButtonItemModel)rightBarButtonItemModel
{
  return self->_rightBarButtonItemModel;
}

- (void)setRightBarButtonItemModel:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
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
  objc_storeStrong((id *)&self->_rightBarButtonItemModel, 0);
  objc_storeStrong((id *)&self->_otherBarButtonItemModels, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItemModel, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_backButtonTitle, 0);
  objc_storeStrong((id *)&self->_accessoryBarButtonItemModel, 0);
}

@end