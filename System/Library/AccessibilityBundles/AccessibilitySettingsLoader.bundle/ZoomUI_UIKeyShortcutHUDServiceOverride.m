@interface ZoomUI_UIKeyShortcutHUDServiceOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_requestHUDPresentationIfAllowedWithUnpreparedConfiguration:(id)a3;
@end

@implementation ZoomUI_UIKeyShortcutHUDServiceOverride

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyShortcutHUDService";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_requestHUDPresentationIfAllowedWithUnpreparedConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [getZoomServicesClass() sharedInstance];
  char v6 = [v5 shouldSuppressKeyCommandHUD];

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)ZoomUI_UIKeyShortcutHUDServiceOverride;
    [(ZoomUI_UIKeyShortcutHUDServiceOverride *)&v7 _requestHUDPresentationIfAllowedWithUnpreparedConfiguration:v4];
  }
}

@end