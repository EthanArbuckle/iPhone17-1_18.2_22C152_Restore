@interface MRUPopoverPresentationController
- (BOOL)_centersPopoverIfSourceViewNotSet;
- (MRUPopoverPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
@end

@implementation MRUPopoverPresentationController

- (MRUPopoverPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MRUPopoverPresentationController;
  v4 = [(MRUPopoverPresentationController *)&v7 initWithPresentedViewController:a3 presentingViewController:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:2];
    [(MRUPopoverPresentationController *)v4 setOverrideTraitCollection:v5];

    +[UIPopoverPresentationController _setAlwaysAllowPopoverPresentations:1];
  }
  return v4;
}

- (BOOL)_centersPopoverIfSourceViewNotSet
{
  return 1;
}

@end