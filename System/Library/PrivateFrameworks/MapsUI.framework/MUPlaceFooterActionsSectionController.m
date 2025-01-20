@interface MUPlaceFooterActionsSectionController
- (BOOL)isImpressionable;
- (MUPlaceFooterActionsSectionController)initWithMapItem:(id)a3 actionManager:(id)a4;
- (UIView)sectionView;
- (id)analyticsModule;
- (int)analyticsModuleType;
- (void)reloadData;
@end

@implementation MUPlaceFooterActionsSectionController

- (MUPlaceFooterActionsSectionController)initWithMapItem:(id)a3 actionManager:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MUPlaceFooterActionsSectionController;
  v7 = [(MUPlaceSectionController *)&v11 initWithMapItem:a3];
  if (v7)
  {
    v8 = [[MUFooterActionsSectionController alloc] initWithActionManager:v6];
    underlyingSectionController = v7->_underlyingSectionController;
    v7->_underlyingSectionController = v8;
  }
  return v7;
}

- (UIView)sectionView
{
  return [(MUFooterActionsSectionController *)self->_underlyingSectionController sectionView];
}

- (void)reloadData
{
}

- (int)analyticsModuleType
{
  return 23;
}

- (id)analyticsModule
{
  v2 = (void *)MEMORY[0x1E4F643A8];
  uint64_t v3 = [(MUPlaceFooterActionsSectionController *)self analyticsModuleType];
  return (id)[v2 moduleFromModuleType:v3];
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void).cxx_destruct
{
}

@end