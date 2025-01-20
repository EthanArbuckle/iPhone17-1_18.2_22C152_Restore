@interface HUAssociatedSceneAndTriggerModuleController
- (BOOL)canSelectItem:(id)a3;
- (Class)cellClassForItem:(id)a3;
- (unint64_t)didSelectItem:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
@end

@implementation HUAssociatedSceneAndTriggerModuleController

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v10 = v4;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v10;
    }
    else {
      v6 = 0;
    }
    v7 = v10;
    if (v6) {
      goto LABEL_8;
    }
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v8 handleFailureInFunction:v9, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v5, objc_opt_class() file lineNumber description];
  }
  v7 = 0;
LABEL_8:

  [v7 setHideIcon:1];
  [v7 setAccessoryType:1];
}

- (BOOL)canSelectItem:(id)a3
{
  return 1;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUItemModuleController *)self module];
  id v6 = [v5 scenesItem];

  if (v6 == v4)
  {
    v7 = [HUAccessorySceneListViewController alloc];
    v8 = [(HUItemModuleController *)self module];
    v9 = [v8 serviceLikeItem];
    id v10 = [(HUAccessorySceneListViewController *)v7 initWithServiceLikeItem:v9];

    v11 = +[HUViewControllerPresentationRequest requestWithViewController:v10];
    [v11 setPreferredPresentationType:1];
    v12 = [(HUItemModuleController *)self host];
    id v13 = (id)[v12 moduleController:self presentViewControllerForRequest:v11];
  }
  return 0;
}

@end