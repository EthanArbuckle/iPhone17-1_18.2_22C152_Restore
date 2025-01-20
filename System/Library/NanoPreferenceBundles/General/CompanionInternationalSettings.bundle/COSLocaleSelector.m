@interface COSLocaleSelector
- (COSInternationalController)internationalController;
- (COSLocaleSelector)initWithInternationalController:(id)a3;
- (NPSDomainAccessor)gizmoGlobalDomain;
- (NPSManager)syncManager;
- (id)availableLocaleIdentifiers;
- (id)currentLocale;
- (void)postLocaleChangedNotification;
- (void)resetTimeFormat;
- (void)setGizmoGlobalDomain:(id)a3;
- (void)setInternationalController:(id)a3;
- (void)setLocale:(id)a3;
- (void)setLocaleFromCalendarID:(id)a3;
- (void)setLocaleFromLanguageIdentifier:(id)a3;
- (void)setLocaleOnly:(id)a3;
- (void)setRegion:(id)a3 changeLanguageVariant:(BOOL)a4;
- (void)setSyncManager:(id)a3;
- (void)updateLocale:(id)a3;
@end

@implementation COSLocaleSelector

- (COSLocaleSelector)initWithInternationalController:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)COSLocaleSelector;
  v6 = [(COSLocaleSelector *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_internationalController, a3);
    v8 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@".GlobalPreferences"];
    gizmoGlobalDomain = v7->_gizmoGlobalDomain;
    v7->_gizmoGlobalDomain = v8;

    v10 = (NPSManager *)objc_alloc_init((Class)NPSManager);
    syncManager = v7->_syncManager;
    v7->_syncManager = v10;
  }
  return v7;
}

- (void)setLocaleOnly:(id)a3
{
  [(COSLocaleSelector *)self updateLocale:a3];

  [(COSLocaleSelector *)self postLocaleChangedNotification];
}

- (void)postLocaleChangedNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.nano.watchlocalechanged", 0, 0, 1u);
}

- (void)updateLocale:(id)a3
{
  id v4 = a3;
  id v5 = [(COSLocaleSelector *)self gizmoGlobalDomain];
  [v5 setObject:v4 forKey:@"AppleLocale"];

  v6 = [(COSLocaleSelector *)self gizmoGlobalDomain];
  id v7 = [v6 synchronize];

  v8 = [(COSLocaleSelector *)self syncManager];
  v9 = [(COSLocaleSelector *)self gizmoGlobalDomain];
  v10 = [v9 domain];
  CFStringRef v13 = @"AppleLocale";
  v11 = +[NSArray arrayWithObjects:&v13 count:1];
  v12 = +[NSSet setWithArray:v11];
  [v8 synchronizeNanoDomain:v10 keys:v12];
}

- (void)resetTimeFormat
{
  v3 = [(COSLocaleSelector *)self gizmoGlobalDomain];
  [v3 setObject:0 forKey:@"AppleICUForce12HourTime"];

  id v4 = [(COSLocaleSelector *)self gizmoGlobalDomain];
  id v5 = [v4 synchronize];

  v6 = [(COSLocaleSelector *)self gizmoGlobalDomain];
  [v6 setObject:0 forKey:@"AppleICUForce24HourTime"];

  v12[0] = @"AppleICUForce24HourTime";
  v12[1] = @"AppleICUForce12HourTime";
  id v7 = +[NSArray arrayWithObjects:v12 count:2];
  v8 = [(COSLocaleSelector *)self syncManager];
  v9 = [(COSLocaleSelector *)self gizmoGlobalDomain];
  v10 = [v9 domain];
  v11 = +[NSSet setWithArray:v7];
  [v8 synchronizeNanoDomain:v10 keys:v11];
}

- (void)setLocale:(id)a3
{
  [(COSLocaleSelector *)self updateLocale:a3];
  [(COSLocaleSelector *)self resetTimeFormat];

  [(COSLocaleSelector *)self postLocaleChangedNotification];
}

- (void)setLocaleFromCalendarID:(id)a3
{
  id v11 = a3;
  id v4 = [(COSLocaleSelector *)self currentLocale];
  id v5 = [v4 localeIdentifier];

  v6 = +[NSLocale componentsFromLocaleIdentifier:v5];
  id v7 = +[NSMutableDictionary dictionaryWithDictionary:v6];
  v8 = [(COSLocaleSelector *)self internationalController];
  v9 = [v8 defaultCalendarForLocaleID:v5];

  if ([v9 isEqual:v11]) {
    [v7 removeObjectForKey:@"calendar"];
  }
  else {
    [v7 setObject:v11 forKey:@"calendar"];
  }
  if (([v6 isEqual:v7] & 1) == 0)
  {
    uint64_t v10 = +[NSLocale canonicalLocaleIdentifierFromComponents:v7];

    [(COSLocaleSelector *)self setLocaleOnly:v10];
    id v5 = (void *)v10;
  }
}

- (id)availableLocaleIdentifiers
{
  internationalController = self->_internationalController;
  if (!internationalController) {
    sub_1EE10();
  }

  return [(COSInternationalController *)internationalController availableLocaleIdentifiers];
}

- (id)currentLocale
{
  v3 = [(COSLocaleSelector *)self gizmoGlobalDomain];
  id v4 = [v3 synchronize];

  id v5 = [(COSLocaleSelector *)self gizmoGlobalDomain];
  uint64_t v6 = [v5 objectForKey:@"AppleLocale"];

  if (v6) {
    id v7 = (__CFString *)v6;
  }
  else {
    id v7 = @"en_US";
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = +[NSLocale localeWithLocaleIdentifier:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setLocaleFromLanguageIdentifier:(id)a3
{
  id v12 = a3;
  id v4 = [(COSLocaleSelector *)self currentLocale];
  id v5 = [v4 localeIdentifier];

  uint64_t v6 = +[NSLocale canonicalLocaleIdentifier:v5 withNewLanguageIdentifier:v12];
  internationalController = self->_internationalController;
  if (!internationalController) {
    sub_1EE3C();
  }
  v8 = [(COSInternationalController *)internationalController validateLocale:v6];

  v9 = +[NSLocale componentsFromLocaleIdentifier:v8];
  id v10 = [v9 mutableCopy];

  [v10 removeObjectForKey:@"numbers"];
  id v11 = [(COSInternationalController *)self->_internationalController canonicalLocaleIdentifierWithValidCalendarForComponents:v10];

  if (([v11 isEqualToString:v5] & 1) == 0) {
    [(COSLocaleSelector *)self setLocale:v11];
  }
}

- (void)setRegion:(id)a3 changeLanguageVariant:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!self->_internationalController) {
    sub_1EE68();
  }
  id v22 = v6;
  id v7 = objc_alloc((Class)IPLanguageListManager);
  v8 = [(id)objc_opt_class() preferredLanguages];
  v9 = [(COSLocaleSelector *)self currentLocale];
  id v10 = [v7 initWithPreferredLanguages:v8 preferredLocale:v9];

  [v10 setRegion:v22 updateFirstLanguage:v4];
  id v11 = [(COSLocaleSelector *)self currentLocale];
  id v12 = +[NSLocale _localeIdentifierForRegionChangeFrom:v11 to:v22];

  [(COSLocaleSelector *)self setLocale:v12];
  internationalController = self->_internationalController;
  v14 = [v10 preferredLanguages];
  [(COSInternationalController *)internationalController setPreferredLanguages:v14];

  v15 = [v10 deviceLanguage];
  v16 = [(COSLocaleSelector *)self currentLocale];
  v17 = [v16 localeIdentifier];
  LOBYTE(internationalController) = +[NSLocale _language:v15 usesSameLocalizationAs:v17];

  if ((internationalController & 1) == 0)
  {
    v18 = [(COSLocaleSelector *)self currentLocale];
    v19 = [v18 localeIdentifier];
    v20 = [v10 deviceLanguage];
    v21 = +[NSLocale canonicalLocaleIdentifier:v19 withNewLanguageIdentifier:v20];

    [(COSLocaleSelector *)self setLocale:v21];
  }
}

- (COSInternationalController)internationalController
{
  return self->_internationalController;
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

  objc_storeStrong((id *)&self->_internationalController, 0);
}

@end