@interface CPSImageRowCell
- (void)configureWithImageRowItem:(id)a3 selectGridItemBlock:(id)a4 selectTitleBlock:(id)a5 showActivityIndicator:(BOOL)a6 bundleIdentifier:(id)a7;
@end

@implementation CPSImageRowCell

- (void)configureWithImageRowItem:(id)a3 selectGridItemBlock:(id)a4 selectTitleBlock:(id)a5 showActivityIndicator:(BOOL)a6 bundleIdentifier:(id)a7
{
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  BOOL v21 = a6;
  id v20 = 0;
  objc_storeStrong(&v20, a7);
  v15 = (void *)MEMORY[0x263F31370];
  id v18 = (id)[location[0] text];
  id v17 = (id)[location[0] gridImages];
  id v16 = (id)[location[0] imageTitles];
  id v12 = v23;
  id v13 = v22;
  BOOL v14 = v21;
  LOBYTE(v7) = [location[0] isEnabled] & 1;
  id v19 = (id)[v15 configurationWithText:v18 images:v17 imageTitles:v16 selectGridItemBlock:v12 selectTitleBlock:v13 showActivityIndicator:v14 enabled:v7 bundleIdentifier:v20];

  [(CPUIImageRowCell *)v25 applyConfiguration:v19];
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

@end