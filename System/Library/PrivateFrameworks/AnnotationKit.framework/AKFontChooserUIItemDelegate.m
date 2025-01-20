@interface AKFontChooserUIItemDelegate
- (AKTextAttributesViewController)parentController;
- (id)convertFont:(id)a3;
- (int64_t)tag;
- (void)setParentController:(id)a3;
- (void)syncFontsToUI:(id)a3;
@end

@implementation AKFontChooserUIItemDelegate

- (int64_t)tag
{
  return 765105;
}

- (id)convertFont:(id)a3
{
  id v4 = a3;
  v5 = [(AKFontChooserUIItemDelegate *)self parentController];
  v6 = [v5 convertFont:v4];

  return v6;
}

- (void)syncFontsToUI:(id)a3
{
  id v4 = a3;
  id v5 = [(AKFontChooserUIItemDelegate *)self parentController];
  [v5 syncFontsToUI:v4];
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