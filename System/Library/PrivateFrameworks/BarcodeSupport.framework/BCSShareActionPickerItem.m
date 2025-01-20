@interface BCSShareActionPickerItem
- (BCSShareActionPickerItem)initWithAction:(id)a3;
- (BOOL)canGroupInSubmenu;
- (id)icon;
- (id)label;
- (void)performActionWithFBOptions:(id)a3;
@end

@implementation BCSShareActionPickerItem

- (BCSShareActionPickerItem)initWithAction:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCSShareActionPickerItem;
  v5 = [(BCSActionPickerItem *)&v12 initWithAction:v4];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    itemsToShare = v5->_itemsToShare;
    v5->_itemsToShare = (NSMutableArray *)v6;

    v8 = v5->_itemsToShare;
    v9 = [v4 urlThatCanBeOpened];
    [(NSMutableArray *)v8 addObject:v9];

    v10 = v5;
  }

  return v5;
}

- (id)label
{
  return _BCSLocalizedString(@"Share…", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
}

- (id)icon
{
  id UIImageClass = getUIImageClass();
  return (id)[UIImageClass systemImageNamed:@"square.and.arrow.up"];
}

- (void)performActionWithFBOptions:(id)a3
{
  id v4 = (void *)[objc_alloc((Class)getUIActivityViewControllerClass()) initWithActivityItems:self->_itemsToShare applicationActivities:0];
  v5 = [v4 popoverPresentationController];
  uint64_t v6 = [(BCSActionPickerItem *)self action];
  v7 = [v6 delegate];
  v8 = [v7 presentingViewControllerForAction:v6];

  if (v8)
  {
    [v5 _setCentersPopoverIfSourceViewNotSet:1];
    [v8 presentViewController:v4 animated:1 completion:0];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[BCSShareActionPickerItem performActionWithFBOptions:]();
  }
}

- (BOOL)canGroupInSubmenu
{
  return 1;
}

- (void).cxx_destruct
{
}

- (void)performActionWithFBOptions:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSShareActionPickerItem: can't find presenting view controller, please set up the action's delegate.", v0, 2u);
}

@end