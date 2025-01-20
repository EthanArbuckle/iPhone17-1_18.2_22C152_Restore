@interface COSLanguageSelector
- (COSInternationalController)internationalController;
- (COSLanguageSelector)initWithInternationalController:(id)a3;
- (NPSDomainAccessor)gizmoGlobalDomain;
- (NPSManager)syncManager;
- (id)appleLanguages;
- (id)deviceLanguageIdentifier;
- (id)systemLanguages;
- (void)setGizmoGlobalDomain:(id)a3;
- (void)setInternationalController:(id)a3;
- (void)setLanguages:(id)a3;
- (void)setSyncManager:(id)a3;
@end

@implementation COSLanguageSelector

- (COSLanguageSelector)initWithInternationalController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)COSLanguageSelector;
  v5 = [(COSLanguageSelector *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_internationalController, v4);
    v7 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@".GlobalPreferences"];
    gizmoGlobalDomain = v6->_gizmoGlobalDomain;
    v6->_gizmoGlobalDomain = v7;

    v9 = (NPSManager *)objc_alloc_init((Class)NPSManager);
    syncManager = v6->_syncManager;
    v6->_syncManager = v9;
  }
  return v6;
}

- (id)appleLanguages
{
  v3 = [(COSLanguageSelector *)self gizmoGlobalDomain];
  id v4 = [v3 synchronize];

  v5 = [(COSLanguageSelector *)self gizmoGlobalDomain];
  v6 = [v5 objectForKey:@"AppleLanguages"];

  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v6 = &off_2DCF8;
  }

  return v6;
}

- (void)setLanguages:(id)a3
{
  id v4 = a3;
  v5 = [(COSLanguageSelector *)self gizmoGlobalDomain];
  [v5 setObject:v4 forKey:@"AppleLanguages"];

  v6 = [(COSLanguageSelector *)self gizmoGlobalDomain];
  id v7 = [v6 synchronize];

  v8 = [(COSLanguageSelector *)self syncManager];
  v9 = [(COSLanguageSelector *)self gizmoGlobalDomain];
  v10 = [v9 domain];
  v11 = +[NSSet setWithObject:@"AppleLanguages"];
  [v8 synchronizeNanoDomain:v10 keys:v11];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.nano.watchlanguagechanged", 0, 0, 1u);
}

- (id)systemLanguages
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internationalController);
  v3 = [WeakRetained systemLanguages];

  return v3;
}

- (id)deviceLanguageIdentifier
{
  v3 = [(COSLanguageSelector *)self systemLanguages];
  id v4 = [(COSLanguageSelector *)self appleLanguages];
  v5 = +[NSBundle preferredLocalizationsFromArray:v3 forPreferences:v4];
  v6 = [v5 firstObject];

  return v6;
}

- (COSInternationalController)internationalController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internationalController);

  return (COSInternationalController *)WeakRetained;
}

- (void)setInternationalController:(id)a3
{
}

- (NPSDomainAccessor)gizmoGlobalDomain
{
  return self->_gizmoGlobalDomain;
}

- (void)setGizmoGlobalDomain:(id)a3
{
}

- (NPSManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_gizmoGlobalDomain, 0);

  objc_destroyWeak((id *)&self->_internationalController);
}

@end