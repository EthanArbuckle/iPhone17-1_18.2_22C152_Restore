@interface HUItemModuleController
- (BOOL)canSelectDisabledItem:(id)a3;
- (BOOL)canSelectItem:(id)a3;
- (BOOL)shouldHideFooterBelowSectionWithIdentifier:(id)a3;
- (BOOL)shouldHideHeaderAboveSectionWithIdentifier:(id)a3;
- (BOOL)shouldManageTextFieldForItem:(id)a3;
- (Class)cellClassForItem:(id)a3;
- (Class)collectionCellClassForItem:(id)a3;
- (HFItemModule)module;
- (HUItemModuleController)initWithModule:(id)a3;
- (HUItemModuleControllerHosting)host;
- (NSString)moduleIdentifier;
- (id)asGeneric;
- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4;
- (id)currentTextForTextField:(id)a3 item:(id)a4;
- (id)defaultTextForTextField:(id)a3 item:(id)a4;
- (id)leadingSwipeActionsForItem:(id)a3;
- (id)textFieldForVisibleItem:(id)a3;
- (id)trailingSwipeActionsForItem:(id)a3;
- (int64_t)rowAnimationForOperationType:(unint64_t)a3 item:(id)a4 suggestedAnimation:(int64_t)a5;
- (unint64_t)didSelectItem:(id)a3;
- (unint64_t)hostType;
- (void)setHost:(id)a3;
- (void)setHostType:(unint64_t)a3;
@end

@implementation HUItemModuleController

- (HUItemModuleController)initWithModule:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HUItemModuleController.m", 17, @"Invalid parameter not satisfying: %@", @"module" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)HUItemModuleController;
  v7 = [(HUItemModuleController *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_module, a3);
    uint64_t v9 = [v6 moduleIdentifier];
    moduleIdentifier = v8->_moduleIdentifier;
    v8->_moduleIdentifier = (NSString *)v9;
  }
  return v8;
}

- (HFItemModule)module
{
  return self->_module;
}

- (NSString)moduleIdentifier
{
  return self->_moduleIdentifier;
}

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  return 0;
}

- (HUItemModuleControllerHosting)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  return (HUItemModuleControllerHosting *)WeakRetained;
}

- (void)setHost:(id)a3
{
}

- (void)setHostType:(unint64_t)a3
{
  self->_hostType = a3;
}

- (id)asGeneric
{
  sub_1BE3BDA1C();
  id v2 = sub_1BE3BD990();

  return v2;
}

- (Class)cellClassForItem:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HUItemModuleController.m", 29, @"%s is an abstract method that must be overriden by subclass %@", "-[HUItemModuleController cellClassForItem:]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (Class)collectionCellClassForItem:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HUItemModuleController.m", 35, @"%s is an abstract method that must be overriden by subclass %@", "-[HUItemModuleController collectionCellClassForItem:]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (BOOL)canSelectItem:(id)a3
{
  return 1;
}

- (BOOL)canSelectDisabledItem:(id)a3
{
  return 0;
}

- (unint64_t)didSelectItem:(id)a3
{
  return 0;
}

- (int64_t)rowAnimationForOperationType:(unint64_t)a3 item:(id)a4 suggestedAnimation:(int64_t)a5
{
  return a5;
}

- (id)leadingSwipeActionsForItem:(id)a3
{
  return 0;
}

- (id)trailingSwipeActionsForItem:(id)a3
{
  return 0;
}

- (BOOL)shouldHideFooterBelowSectionWithIdentifier:(id)a3
{
  return 0;
}

- (BOOL)shouldHideHeaderAboveSectionWithIdentifier:(id)a3
{
  return 0;
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  return 0;
}

- (id)defaultTextForTextField:(id)a3 item:(id)a4
{
  return 0;
}

- (id)currentTextForTextField:(id)a3 item:(id)a4
{
  return 0;
}

- (id)textFieldForVisibleItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUItemModuleController *)self host];
  id v6 = [v5 moduleController:self textFieldForVisibleItem:v4];

  return v6;
}

- (unint64_t)hostType
{
  return self->_hostType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleIdentifier, 0);
  objc_storeStrong((id *)&self->_module, 0);

  objc_destroyWeak((id *)&self->_host);
}

@end