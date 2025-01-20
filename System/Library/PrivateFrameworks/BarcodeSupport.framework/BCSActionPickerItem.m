@interface BCSActionPickerItem
+ (id)actionPickerItemWithLabel:(id)a3 actionHandler:(id)a4;
- (BCSAction)action;
- (BCSActionPickerItem)initWithAction:(id)a3;
- (BCSActionPickerItem)initWithLabel:(id)a3 action:(id)a4;
- (BCSActionPickerItem)initWithLabel:(id)a3 actionHandler:(id)a4;
- (BCSActionPickerItemDelegate)actionPickerItemDelegate;
- (BOOL)canGroupInSubmenu;
- (BOOL)isCopyActionItem;
- (BOOL)shouldDismissAlertWhenActionIsTaken;
- (BOOL)useInlineMenu;
- (NSString)label;
- (NSString)localizedDefaultActionDescription;
- (NSString)serviceApplicationBundleIdentifier;
- (NSString)targetApplicationBundleIdentifier;
- (NSURL)actionURL;
- (UIImage)icon;
- (int64_t)dataType;
- (void)didPerformAction;
- (void)performAction;
- (void)performActionWithFBOptions:(id)a3;
- (void)setActionPickerItemDelegate:(id)a3;
- (void)setIcon:(id)a3;
@end

@implementation BCSActionPickerItem

+ (id)actionPickerItemWithLabel:(id)a3 actionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithLabel:v7 actionHandler:v6];

  return v8;
}

- (BCSActionPickerItem)initWithLabel:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BCSActionPickerItem;
  v8 = [(BCSActionPickerItem *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    label = v8->_label;
    v8->_label = (NSString *)v9;

    objc_storeStrong((id *)&v8->_action, a4);
    v11 = v8;
  }

  return v8;
}

- (BCSActionPickerItem)initWithLabel:(id)a3 actionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BCSActionPickerItem;
  v8 = [(BCSActionPickerItem *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    label = v8->_label;
    v8->_label = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    id actionHandler = v8->_actionHandler;
    v8->_id actionHandler = (id)v11;

    objc_super v13 = v8;
  }

  return v8;
}

- (BCSActionPickerItem)initWithAction:(id)a3
{
  id v4 = a3;
  v5 = [v4 localizedDefaultActionDescription];
  id v6 = [(BCSActionPickerItem *)self initWithLabel:v5 action:v4];

  return v6;
}

- (void)performAction
{
}

- (void)performActionWithFBOptions:(id)a3
{
  id v4 = a3;
  if (self->_actionHandler)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSActionPickerItem: _actionHandler called in -performAction", v6, 2u);
    }
    (*((void (**)(void))self->_actionHandler + 2))();
  }
  action = self->_action;
  if (action) {
    [(BCSAction *)action performActionWithOptions:v4 completion:&__block_literal_global];
  }
  [(BCSActionPickerItem *)self didPerformAction];
}

- (void)didPerformAction
{
  action = self->_action;
  if (action)
  {
    v3 = action;
    id v4 = +[BCSAWDLogger sharedLogger];
    [v4 logBarcodeActivatedEventForAction:v3];
  }
}

- (BOOL)shouldDismissAlertWhenActionIsTaken
{
  return 1;
}

- (int64_t)dataType
{
  v2 = [(BCSAction *)self->_action data];
  int64_t v3 = [v2 type];

  return v3;
}

- (NSString)localizedDefaultActionDescription
{
  return [(BCSAction *)self->_action localizedDefaultActionDescription];
}

- (BCSActionPickerItemDelegate)actionPickerItemDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionPickerItemDelegate);
  return (BCSActionPickerItemDelegate *)WeakRetained;
}

- (void)setActionPickerItemDelegate:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (BCSAction)action
{
  return self->_action;
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (NSString)serviceApplicationBundleIdentifier
{
  return self->_serviceApplicationBundleIdentifier;
}

- (NSString)targetApplicationBundleIdentifier
{
  return self->_targetApplicationBundleIdentifier;
}

- (BOOL)isCopyActionItem
{
  return self->_copyActionItem;
}

- (BOOL)useInlineMenu
{
  return self->_useInlineMenu;
}

- (BOOL)canGroupInSubmenu
{
  return self->_canGroupInSubmenu;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_actionPickerItemDelegate);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong(&self->_actionHandler, 0);
}

@end