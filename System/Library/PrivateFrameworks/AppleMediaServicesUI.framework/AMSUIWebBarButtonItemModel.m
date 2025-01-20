@interface AMSUIWebBarButtonItemModel
- (AMSUIWebAppViewModel)appViewModel;
- (AMSUIWebBarButtonItemModel)initWithJSObject:(id)a3 context:(id)a4;
- (AMSUIWebButtonModel)buttonModel;
- (BOOL)isEmpty;
- (NSArray)conditionalButtonModels;
- (NSString)description;
- (void)setAppViewModel:(id)a3;
- (void)setButtonModel:(id)a3;
- (void)setConditionalButtonModels:(id)a3;
@end

@implementation AMSUIWebBarButtonItemModel

- (AMSUIWebBarButtonItemModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)AMSUIWebBarButtonItemModel;
  v8 = [(AMSUIWebBarButtonItemModel *)&v20 init];
  if (v8)
  {
    id v9 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    if (v10)
    {
      if (+[AMSUIWebAppViewModel validateJSObject:v10])
      {
        v11 = [[AMSUIWebAppViewModel alloc] initWithJSObject:v10 context:v7];
        id appViewModel = v8->_appViewModel;
        v8->_id appViewModel = v11;
      }
      else
      {
        v14 = [[AMSUIWebButtonModel alloc] initWithJSObject:v10 context:v7];
        id appViewModel = v8->_buttonModel;
        v8->_buttonModel = v14;
      }
    }
    else
    {
      id v13 = v9;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id appViewModel = v13;
      }
      else {
        id appViewModel = 0;
      }

      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __55__AMSUIWebBarButtonItemModel_initWithJSObject_context___block_invoke;
      v18[3] = &unk_2643E48D0;
      id v19 = v7;
      uint64_t v15 = objc_msgSend(appViewModel, "ams_mapWithTransformIgnoresNil:", v18);
      conditionalButtonModels = v8->_conditionalButtonModels;
      v8->_conditionalButtonModels = (NSArray *)v15;
    }
  }

  return v8;
}

AMSUIWebConditionalButtonModel *__55__AMSUIWebBarButtonItemModel_initWithJSObject_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[AMSUIWebConditionalButtonModel alloc] initWithJSObject:v3 context:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)isEmpty
{
  id v3 = [(AMSUIWebBarButtonItemModel *)self appViewModel];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(AMSUIWebBarButtonItemModel *)self buttonModel];
    if (v5)
    {
      BOOL v4 = 0;
    }
    else
    {
      id v6 = [(AMSUIWebBarButtonItemModel *)self conditionalButtonModels];
      BOOL v4 = [v6 count] == 0;
    }
  }

  return v4;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  BOOL v4 = [(AMSUIWebBarButtonItemModel *)self appViewModel];

  if (v4)
  {
    v5 = [(AMSUIWebBarButtonItemModel *)self appViewModel];
    [v3 setObject:v5 forKey:@"appViewModel"];
  }
  id v6 = [(AMSUIWebBarButtonItemModel *)self buttonModel];

  if (v6)
  {
    id v7 = [(AMSUIWebBarButtonItemModel *)self buttonModel];
    [v3 setObject:v7 forKey:@"buttonModel"];
  }
  v8 = [(AMSUIWebBarButtonItemModel *)self conditionalButtonModels];

  if (v8)
  {
    id v9 = [(AMSUIWebBarButtonItemModel *)self conditionalButtonModels];
    [v3 setObject:v9 forKey:@"conditionalButtonModels"];
  }
  id v10 = [v3 description];

  return (NSString *)v10;
}

- (AMSUIWebAppViewModel)appViewModel
{
  return self->_appViewModel;
}

- (void)setAppViewModel:(id)a3
{
}

- (AMSUIWebButtonModel)buttonModel
{
  return self->_buttonModel;
}

- (void)setButtonModel:(id)a3
{
}

- (NSArray)conditionalButtonModels
{
  return self->_conditionalButtonModels;
}

- (void)setConditionalButtonModels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionalButtonModels, 0);
  objc_storeStrong((id *)&self->_buttonModel, 0);
  objc_storeStrong((id *)&self->_appViewModel, 0);
}

@end