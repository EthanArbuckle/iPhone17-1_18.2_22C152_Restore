@interface AXDisplayManagerObjcWrapper
- (AXDisplayManagerObjcWrapper)initWithService:(id)a3;
- (AXUIService)service;
- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 completion:(id)a5;
- (void)removeContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 completion:(id)a5;
- (void)setService:(id)a3;
@end

@implementation AXDisplayManagerObjcWrapper

- (AXDisplayManagerObjcWrapper)initWithService:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXDisplayManagerObjcWrapper;
  v5 = [(AXDisplayManagerObjcWrapper *)&v8 init];
  v6 = v5;
  if (v5) {
    [(AXDisplayManagerObjcWrapper *)v5 setService:v4];
  }

  return v6;
}

- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v11 = +[AXUIDisplayManager sharedDisplayManager];
  v10 = [(AXDisplayManagerObjcWrapper *)self service];
  [v11 addContentViewController:v9 withUserInteractionEnabled:v5 forService:v10 context:0 userInterfaceStyle:1 completion:v8];
}

- (void)removeContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v11 = +[AXUIDisplayManager sharedDisplayManager];
  v10 = [(AXDisplayManagerObjcWrapper *)self service];
  [v11 removeContentViewController:v9 withUserInteractionEnabled:v5 forService:v10 context:0 completion:v8];
}

- (AXUIService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);

  return (AXUIService *)WeakRetained;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end