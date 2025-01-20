@interface AKTextAttributesUIItemDelegate
- (AKTextAttributesViewController)parentController;
- (id)convertTextAttributes:(id)a3;
- (int64_t)tag;
- (void)setParentController:(id)a3;
- (void)syncTextAttributesToUI:(id)a3;
@end

@implementation AKTextAttributesUIItemDelegate

- (int64_t)tag
{
  return 765106;
}

- (id)convertTextAttributes:(id)a3
{
  id v4 = a3;
  v5 = [(AKTextAttributesUIItemDelegate *)self parentController];
  v6 = [v5 convertTextAttributes:v4];

  return v6;
}

- (void)syncTextAttributesToUI:(id)a3
{
  id v4 = a3;
  id v5 = [(AKTextAttributesUIItemDelegate *)self parentController];
  [v5 syncTextAttributesToUI:v4];
}

- (AKTextAttributesViewController)parentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

  return (AKTextAttributesViewController *)WeakRetained;
}

- (void)setParentController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end