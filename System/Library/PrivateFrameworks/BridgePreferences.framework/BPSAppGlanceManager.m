@interface BPSAppGlanceManager
- (PSListController)listControllerDelegate;
- (id)glanceSpecifierForIdentifier:(id)a3;
- (id)showsGlance:(id)a3;
- (void)setListControllerDelegate:(id)a3;
@end

@implementation BPSAppGlanceManager

- (id)glanceSpecifierForIdentifier:(id)a3
{
  return 0;
}

- (id)showsGlance:(id)a3
{
  return 0;
}

- (PSListController)listControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listControllerDelegate);
  return (PSListController *)WeakRetained;
}

- (void)setListControllerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end