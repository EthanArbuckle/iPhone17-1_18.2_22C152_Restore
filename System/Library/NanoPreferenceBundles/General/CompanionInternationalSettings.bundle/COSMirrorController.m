@interface COSMirrorController
+ (id)mirrorControllerWithInternationalController:(id)a3;
- (BOOL)mirrorSettings;
- (BOOL)shouldShowMirroringAsEnabled;
- (COSInternationalController)internationalController;
- (id)applicationBundleIdentifier;
- (id)localizedPaneTitle;
- (void)setInternationalController:(id)a3;
@end

@implementation COSMirrorController

+ (id)mirrorControllerWithInternationalController:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = v4;
  if (v4)
  {
    [v4 setInternationalController:v3];
    id v6 = [v5 specifiers];
  }

  return v5;
}

- (BOOL)shouldShowMirroringAsEnabled
{
  if (![(COSMirrorController *)self mirrorSettings]) {
    return 0;
  }
  id v3 = [(COSMirrorController *)self internationalController];
  uint64_t v4 = [v3 languageSelector];
  v5 = [(id)v4 appleLanguages];

  id v6 = +[NSLocale preferredLanguages];
  LOBYTE(v4) = [v5 isEqualToArray:v6];

  return (v4 & 1) != 0;
}

- (id)applicationBundleIdentifier
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)localizedPaneTitle
{
  return 0;
}

- (BOOL)mirrorSettings
{
  if (COSActivePairingIsTinker()) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)COSMirrorController;
  return [(COSMirrorController *)&v4 mirrorSettings];
}

- (COSInternationalController)internationalController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internationalController);

  return (COSInternationalController *)WeakRetained;
}

- (void)setInternationalController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end