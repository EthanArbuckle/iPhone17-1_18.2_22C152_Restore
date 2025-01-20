@interface CPSEntityResourceProvider
- (CPEntityClientTemplateDelegate)templateDelegate;
- (CPEntityProviding)entityTemplate;
- (CPSEntityActionDelegate)actionDelegate;
- (CPSEntityResourceProvider)initWithTemplateEnvironment:(id)a3 entityTemplate:(id)a4 templateDelegate:(id)a5 actionDelegate:(id)a6;
- (CPSTemplateEnvironment)templateEnvironment;
- (NSString)description;
- (void)setEntityTemplate:(id)a3;
- (void)setTemplateDelegate:(id)a3;
- (void)updateEntityTemplate:(id)a3 withProxyDelegate:(id)a4;
@end

@implementation CPSEntityResourceProvider

- (CPSEntityResourceProvider)initWithTemplateEnvironment:(id)a3 entityTemplate:(id)a4 templateDelegate:(id)a5 actionDelegate:(id)a6
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  id v13 = 0;
  objc_storeStrong(&v13, a6);
  v6 = v17;
  v17 = 0;
  v12.receiver = v6;
  v12.super_class = (Class)CPSEntityResourceProvider;
  v17 = [(CPSEntityResourceProvider *)&v12 init];
  objc_storeStrong((id *)&v17, v17);
  if (v17)
  {
    objc_storeWeak((id *)&v17->_templateEnvironment, location[0]);
    objc_storeWeak((id *)&v17->_entityTemplate, v15);
    objc_storeWeak((id *)&v17->_templateDelegate, v14);
    objc_storeWeak((id *)&v17->_actionDelegate, v13);
  }
  v8 = v17;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v8;
}

- (NSString)description
{
  objc_super v12 = self;
  SEL v11 = a2;
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)CPSEntityResourceProvider;
  v8 = [(CPSEntityResourceProvider *)&v10 description];
  v7 = [(CPSEntityResourceProvider *)v12 templateEnvironment];
  v6 = [(CPSEntityResourceProvider *)v12 entityTemplate];
  v5 = [(CPSEntityResourceProvider *)v12 templateDelegate];
  v4 = [(CPSEntityResourceProvider *)v12 actionDelegate];
  id v9 = (id)[v3 stringWithFormat:@"%@\n\t%@\n\t%@\n\t%@\n\t%@", v8, v7, v6, v5, v4];

  return (NSString *)v9;
}

- (void)updateEntityTemplate:(id)a3 withProxyDelegate:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(CPSEntityResourceProvider *)v7 setEntityTemplate:location[0]];
  [(CPSEntityResourceProvider *)v7 setTemplateDelegate:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (CPSTemplateEnvironment)templateEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_templateEnvironment);

  return (CPSTemplateEnvironment *)WeakRetained;
}

- (CPEntityProviding)entityTemplate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_entityTemplate);

  return (CPEntityProviding *)WeakRetained;
}

- (void)setEntityTemplate:(id)a3
{
}

- (CPEntityClientTemplateDelegate)templateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_templateDelegate);

  return (CPEntityClientTemplateDelegate *)WeakRetained;
}

- (void)setTemplateDelegate:(id)a3
{
}

- (CPSEntityActionDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (CPSEntityActionDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end