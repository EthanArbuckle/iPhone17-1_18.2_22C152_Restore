@interface BCSCopyActionPickerItem
- (BCSCopyActionPickerItem)initWithAction:(id)a3 textToCopy:(id)a4;
- (BCSCopyActionPickerItem)initWithAction:(id)a3 urlToCopy:(id)a4;
- (BOOL)canGroupInSubmenu;
- (BOOL)isCopyActionItem;
- (NSString)textToCopy;
- (NSURL)urlToCopy;
- (id)icon;
- (void)performActionWithFBOptions:(id)a3;
@end

@implementation BCSCopyActionPickerItem

- (BCSCopyActionPickerItem)initWithAction:(id)a3 textToCopy:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = _BCSLocalizedString(@"Copy", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  v14.receiver = self;
  v14.super_class = (Class)BCSCopyActionPickerItem;
  v9 = [(BCSActionPickerItem *)&v14 initWithLabel:v8 action:v7];

  if (v9)
  {
    uint64_t v10 = [v6 copy];
    textToCopy = v9->_textToCopy;
    v9->_textToCopy = (NSString *)v10;

    v12 = v9;
  }

  return v9;
}

- (BCSCopyActionPickerItem)initWithAction:(id)a3 urlToCopy:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = _BCSLocalizedString(@"Copy Link", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  v14.receiver = self;
  v14.super_class = (Class)BCSCopyActionPickerItem;
  v9 = [(BCSActionPickerItem *)&v14 initWithLabel:v8 action:v7];

  if (v9)
  {
    uint64_t v10 = [v6 copy];
    urlToCopy = v9->_urlToCopy;
    v9->_urlToCopy = (NSURL *)v10;

    v12 = v9;
  }

  return v9;
}

- (id)icon
{
  id UIImageClass = getUIImageClass();
  return (id)[UIImageClass systemImageNamed:@"doc.on.doc"];
}

- (void)performActionWithFBOptions:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSCopyActionPickerItem: performing action", v7, 2u);
  }
  v5 = [getUIPasteboardClass() generalPasteboard];
  id v6 = v5;
  if (self->_textToCopy) {
    objc_msgSend(v5, "setString:");
  }
  if (self->_urlToCopy) {
    objc_msgSend(v6, "setURL:");
  }
  [(BCSActionPickerItem *)self didPerformAction];
}

- (BOOL)isCopyActionItem
{
  return 1;
}

- (BOOL)canGroupInSubmenu
{
  return 1;
}

- (NSString)textToCopy
{
  return self->_textToCopy;
}

- (NSURL)urlToCopy
{
  return self->_urlToCopy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlToCopy, 0);
  objc_storeStrong((id *)&self->_textToCopy, 0);
}

@end