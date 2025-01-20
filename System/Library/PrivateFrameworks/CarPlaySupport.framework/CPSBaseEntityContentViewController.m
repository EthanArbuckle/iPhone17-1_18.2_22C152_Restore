@interface CPSBaseEntityContentViewController
- (BOOL)shouldAppearInUnsafeArea;
- (BOOL)viewController:(id)a3 didPressButton:(id)a4;
- (CPEntity)entity;
- (CPSBaseEntityContentViewController)initWithEntity:(id)a3 resourceProvider:(id)a4;
- (CPSEntityResourceProvider)resourceProvider;
- (void)didUpdateEntity:(id)a3;
- (void)setResourceProvider:(id)a3;
- (void)updateWithEntity:(id)a3;
@end

@implementation CPSBaseEntityContentViewController

- (CPSBaseEntityContentViewController)initWithEntity:(id)a3 resourceProvider:(id)a4
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  v4 = v12;
  v12 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)CPSBaseEntityContentViewController;
  v8 = -[CPSBaseEntityContentViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0);
  v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8)
  {
    objc_storeStrong((id *)&v12->_resourceProvider, v10);
    [(CPSBaseEntityContentViewController *)v12 updateWithEntity:location[0]];
  }
  v6 = v12;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v6;
}

- (void)updateWithEntity:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (([(CPEntity *)v4->_entity isEqual:location[0]] & 1) == 0)
  {
    objc_storeStrong((id *)&v4->_entity, location[0]);
    [(CPSBaseEntityContentViewController *)v4 didUpdateEntity:v4->_entity];
  }
  objc_storeStrong(location, 0);
}

- (void)didUpdateEntity:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (BOOL)shouldAppearInUnsafeArea
{
  return 0;
}

- (BOOL)viewController:(id)a3 didPressButton:(id)a4
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  v12 = [(CPSBaseEntityContentViewController *)v16 resourceProvider];
  v11 = [(CPSEntityResourceProvider *)v12 actionDelegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    objc_super v9 = [(CPSBaseEntityContentViewController *)v16 resourceProvider];
    v8 = [(CPSEntityResourceProvider *)v9 actionDelegate];
    v5 = v16;
    id v6 = v14;
    v7 = [(CPSBaseEntityContentViewController *)v16 entity];
    -[CPSEntityActionDelegate entityContentViewController:didPressButton:forEntity:](v8, "entityContentViewController:didPressButton:forEntity:", v5, v6);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (CPEntity)entity
{
  return self->_entity;
}

- (CPSEntityResourceProvider)resourceProvider
{
  return self->_resourceProvider;
}

- (void)setResourceProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end