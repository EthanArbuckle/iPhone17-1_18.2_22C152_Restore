@interface SFCertificateWarningJSController
- (SFCertificateWarningJSController)initWithCertificateWarningController:(id)a3;
- (id)bypassFeatureButtonText;
- (id)bypassFeatureIconPath;
- (id)bypassFeatureTitleText;
- (id)bypassFeatureWarningText;
- (void)bypassFeatureVisitWebsite;
- (void)goBackSelected;
- (void)openClockSettings;
- (void)pageLoaded;
- (void)showCertificateInformation;
- (void)visitInsecureWebsite;
- (void)visitInsecureWebsiteWithTemporaryBypass;
@end

@implementation SFCertificateWarningJSController

- (SFCertificateWarningJSController)initWithCertificateWarningController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFCertificateWarningJSController;
  v5 = [(SFCertificateWarningJSController *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_certificateWarningController, v4);
    v7 = v6;
  }

  return v6;
}

- (void)pageLoaded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_certificateWarningController);
  [WeakRetained certificateWarningPageLoaded];
}

- (void)visitInsecureWebsite
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_certificateWarningController);
  [WeakRetained visitInsecureWebsite];
}

- (void)visitInsecureWebsiteWithTemporaryBypass
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_certificateWarningController);
  [WeakRetained visitInsecureWebsiteWithTemporaryBypass];
}

- (void)showCertificateInformation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_certificateWarningController);
  [WeakRetained showCertificateInformation];
}

- (void)openClockSettings
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_certificateWarningController);
  [WeakRetained openClockSettings];
}

- (void)goBackSelected
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_certificateWarningController);
  [WeakRetained goBackSelected];
}

- (void)bypassFeatureVisitWebsite
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_certificateWarningController);
  [WeakRetained visitWebsiteWithoutPrivateRelay];
}

- (id)bypassFeatureTitleText
{
  v2 = NSString;
  v3 = _WBSLocalizedString();
  id v4 = objc_msgSend(v2, "stringWithFormat:", v3, @" ");

  return v4;
}

- (id)bypassFeatureWarningText
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_certificateWarningController);
  v3 = [WeakRetained warningPageContext];

  id v4 = [v3 failingURL];
  v5 = [v4 host];

  [v3 warningCategory];
  v6 = NSString;
  v7 = _WBSLocalizedString();
  v8 = objc_msgSend(v6, "stringWithFormat:", v7, v5, @" ");

  return v8;
}

- (id)bypassFeatureButtonText
{
  return (id)_WBSLocalizedString();
}

- (id)bypassFeatureIconPath
{
  return &cfstr_M1252441412995;
}

- (void).cxx_destruct
{
}

@end