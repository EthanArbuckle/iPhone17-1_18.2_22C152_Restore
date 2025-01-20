@interface HUQuickControlPresentationContext
- (BOOL)didAuthenticate;
- (BOOL)isConfiguredForNonHomeUser;
- (BOOL)prefersSystemTransitions;
- (BOOL)shouldIncludeRoomNameInHeaderTitle;
- (CGRect)sourceRect;
- (HFHomeKitObject)parentViewHomeKitObject;
- (HMHome)home;
- (HUDetailsPresentationDelegateHost)detailsViewController;
- (HUQuickControlPresentationItemManager)itemManager;
- (NSCopying)item;
- (NSSet)controlItems;
- (NSString)tappedArea;
- (UIViewController)sourceViewController;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)colorStyle;
- (void)setColorStyle:(unint64_t)a3;
- (void)setControlItems:(id)a3;
- (void)setDetailsViewController:(id)a3;
- (void)setDidAuthenticate:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setIsConfiguredForNonHomeUser:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setItemManager:(id)a3;
- (void)setParentViewHomeKitObject:(id)a3;
- (void)setPrefersSystemTransitions:(BOOL)a3;
- (void)setShouldIncludeRoomNameInHeaderTitle:(BOOL)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setSourceViewController:(id)a3;
- (void)setTappedArea:(id)a3;
@end

@implementation HUQuickControlPresentationContext

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setColorStyle:", -[HUQuickControlPresentationContext colorStyle](self, "colorStyle"));
  v5 = [(HUQuickControlPresentationContext *)self item];
  if (v5) {
    goto LABEL_4;
  }
  v6 = [(HUQuickControlPresentationContext *)self itemManager];

  if (v6)
  {
    v7 = [HUQuickControlPresentationItemManager alloc];
    v5 = [(HUQuickControlPresentationContext *)self itemManager];
    v8 = [v5 homeKitObjectUUID];
    v9 = [(HUQuickControlPresentationContext *)self itemManager];
    v10 = -[HUQuickControlPresentationItemManager initWithHomeKitObjectUUID:type:](v7, "initWithHomeKitObjectUUID:type:", v8, [v9 presentationItemType]);
    [v4 setItemManager:v10];

LABEL_4:
  }
  v11 = [(HUQuickControlPresentationContext *)self item];
  [v4 setItem:v11];

  v12 = [(HUQuickControlPresentationContext *)self controlItems];
  [v4 setControlItems:v12];

  v13 = [(HUQuickControlPresentationContext *)self home];
  [v4 setHome:v13];

  [(HUQuickControlPresentationContext *)self sourceRect];
  objc_msgSend(v4, "setSourceRect:");
  v14 = [(HUQuickControlPresentationContext *)self sourceViewController];
  [v4 setSourceViewController:v14];

  objc_msgSend(v4, "setDidAuthenticate:", -[HUQuickControlPresentationContext didAuthenticate](self, "didAuthenticate"));
  v15 = [(HUQuickControlPresentationContext *)self tappedArea];
  [v4 setTappedArea:v15];

  objc_msgSend(v4, "setPrefersSystemTransitions:", -[HUQuickControlPresentationContext prefersSystemTransitions](self, "prefersSystemTransitions"));
  objc_msgSend(v4, "setShouldIncludeRoomNameInHeaderTitle:", -[HUQuickControlPresentationContext shouldIncludeRoomNameInHeaderTitle](self, "shouldIncludeRoomNameInHeaderTitle"));
  return v4;
}

- (unint64_t)colorStyle
{
  return self->_colorStyle;
}

- (void)setColorStyle:(unint64_t)a3
{
  self->_colorStyle = a3;
}

- (NSCopying)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (NSSet)controlItems
{
  return self->_controlItems;
}

- (void)setControlItems:(id)a3
{
}

- (HUQuickControlPresentationItemManager)itemManager
{
  return self->_itemManager;
}

- (void)setItemManager:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HFHomeKitObject)parentViewHomeKitObject
{
  return self->_parentViewHomeKitObject;
}

- (void)setParentViewHomeKitObject:(id)a3
{
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (UIViewController)sourceViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setSourceViewController:(id)a3
{
}

- (NSString)tappedArea
{
  return self->_tappedArea;
}

- (void)setTappedArea:(id)a3
{
}

- (BOOL)didAuthenticate
{
  return self->_didAuthenticate;
}

- (void)setDidAuthenticate:(BOOL)a3
{
  self->_didAuthenticate = a3;
}

- (BOOL)prefersSystemTransitions
{
  return self->_prefersSystemTransitions;
}

- (void)setPrefersSystemTransitions:(BOOL)a3
{
  self->_prefersSystemTransitions = a3;
}

- (BOOL)shouldIncludeRoomNameInHeaderTitle
{
  return self->_shouldIncludeRoomNameInHeaderTitle;
}

- (void)setShouldIncludeRoomNameInHeaderTitle:(BOOL)a3
{
  self->_shouldIncludeRoomNameInHeaderTitle = a3;
}

- (HUDetailsPresentationDelegateHost)detailsViewController
{
  return self->_detailsViewController;
}

- (void)setDetailsViewController:(id)a3
{
}

- (BOOL)isConfiguredForNonHomeUser
{
  return self->_isConfiguredForNonHomeUser;
}

- (void)setIsConfiguredForNonHomeUser:(BOOL)a3
{
  self->_isConfiguredForNonHomeUser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsViewController, 0);
  objc_storeStrong((id *)&self->_tappedArea, 0);
  objc_destroyWeak((id *)&self->_sourceViewController);
  objc_storeStrong((id *)&self->_parentViewHomeKitObject, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_storeStrong((id *)&self->_controlItems, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end