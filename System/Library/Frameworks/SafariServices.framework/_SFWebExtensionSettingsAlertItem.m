@interface _SFWebExtensionSettingsAlertItem
+ (id)buttonWithTitle:(id)a3 textStyle:(id)a4 icon:(id)a5 extension:(id)a6 handler:(id)a7;
- (WBSWebExtensionData)extension;
@end

@implementation _SFWebExtensionSettingsAlertItem

+ (id)buttonWithTitle:(id)a3 textStyle:(id)a4 icon:(id)a5 extension:(id)a6 handler:(id)a7
{
  id v12 = a6;
  v13 = [a1 singleLineButtonWithTitle:a3 textStyle:a4 icon:a5 action:26 handler:a7];
  v14 = (void *)v13[25];
  v13[25] = v12;

  return v13;
}

- (WBSWebExtensionData)extension
{
  return self->_extension;
}

- (void).cxx_destruct
{
}

@end