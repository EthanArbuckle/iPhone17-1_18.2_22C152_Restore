@interface BCSDataDetectionActionPickerItem
- (BCSDataDetectionActionPickerItem)initWithAction:(id)a3 ddAction:(id)a4;
- (BOOL)isCopyActionItem;
- (BOOL)shouldDismissAlertWhenActionIsTaken;
- (CNContact)contact;
- (NSString)icsString;
- (id)actionURL;
- (id)icon;
- (id)label;
- (id)serviceApplicationBundleIdentifier;
- (id)targetApplicationBundleIdentifier;
- (void)action:(id)a3 didDismissAlertController:(id)a4;
- (void)performActionWithFBOptions:(id)a3;
@end

@implementation BCSDataDetectionActionPickerItem

- (BCSDataDetectionActionPickerItem)initWithAction:(id)a3 ddAction:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [v7 localizedName];
  v13.receiver = self;
  v13.super_class = (Class)BCSDataDetectionActionPickerItem;
  v10 = [(BCSActionPickerItem *)&v13 initWithLabel:v9 action:v8];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_ddAction, a4);
    v11 = v10;
  }

  return v10;
}

- (BOOL)shouldDismissAlertWhenActionIsTaken
{
  return [(DDAction *)self->_ddAction hasUserInterface] ^ 1;
}

- (BOOL)isCopyActionItem
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)label
{
  return (id)[(DDAction *)self->_ddAction localizedName];
}

- (id)icon
{
  v2 = [(DDAction *)self->_ddAction icon];
  if ([v2 isSymbolImage]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)serviceApplicationBundleIdentifier
{
  return (id)[(DDAction *)self->_ddAction serviceIdentifier];
}

- (id)targetApplicationBundleIdentifier
{
  return (id)[(DDAction *)self->_ddAction notificationIconBundleIdentifier];
}

- (id)actionURL
{
  return (id)[(DDAction *)self->_ddAction notificationURL];
}

- (CNContact)contact
{
  return (CNContact *)[(DDAction *)self->_ddAction contact];
}

- (NSString)icsString
{
  v2 = [(DDAction *)self->_ddAction context];
  v3 = [v2 objectForKeyedSubscript:@"ICS"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (void)performActionWithFBOptions:(id)a3
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSDataDetectionActionPickerItem: performing action", v7, 2u);
  }
  id v4 = [(BCSActionPickerItem *)self actionPickerItemDelegate];
  v5 = [v4 actionPickerItemAlertController:self];

  v6 = [getDDDetectionControllerClass() sharedController];
  [v6 performAction:self->_ddAction fromAlertController:v5 interactionDelegate:self];

  [(BCSActionPickerItem *)self didPerformAction];
}

- (void)action:(id)a3 didDismissAlertController:(id)a4
{
  id v5 = a4;
  id v6 = [(BCSActionPickerItem *)self actionPickerItemDelegate];
  [v6 actionPickerItem:self didDismissAlertController:v5];
}

- (void).cxx_destruct
{
}

@end