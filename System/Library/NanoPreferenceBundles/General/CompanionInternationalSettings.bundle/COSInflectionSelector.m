@interface COSInflectionSelector
- (BOOL)canShareInflectionWithApps;
- (COSInflectionSelector)initWithInternationalController:(id)a3;
- (COSInternationalController)internationalController;
- (NPSDomainAccessor)gizmoProtectedMorphologyDomain;
- (NPSDomainAccessor)gizmoPublicMorphologyDomain;
- (NPSManager)syncManager;
- (id)currentInflection;
- (void)setCanShareInflectionWithApps:(BOOL)a3;
- (void)setGizmoProtectedMorphologyDomain:(id)a3;
- (void)setGizmoPublicMorphologyDomain:(id)a3;
- (void)setInflection:(id)a3;
- (void)setInternationalController:(id)a3;
- (void)setSyncManager:(id)a3;
@end

@implementation COSInflectionSelector

- (COSInflectionSelector)initWithInternationalController:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)COSInflectionSelector;
  v6 = [(COSInflectionSelector *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_internationalController, a3);
    v8 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.morphology.internal"];
    gizmoProtectedMorphologyDomain = v7->_gizmoProtectedMorphologyDomain;
    v7->_gizmoProtectedMorphologyDomain = v8;

    v10 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.morphology"];
    gizmoPublicMorphologyDomain = v7->_gizmoPublicMorphologyDomain;
    v7->_gizmoPublicMorphologyDomain = v10;

    v12 = (NPSManager *)objc_alloc_init((Class)NPSManager);
    syncManager = v7->_syncManager;
    v7->_syncManager = v12;
  }
  return v7;
}

- (id)currentInflection
{
  v3 = [(COSInflectionSelector *)self gizmoProtectedMorphologyDomain];
  id v4 = [v3 synchronize];

  id v5 = [(COSInflectionSelector *)self gizmoPublicMorphologyDomain];
  id v6 = [v5 synchronize];

  v7 = [(COSInflectionSelector *)self gizmoProtectedMorphologyDomain];
  v8 = [v7 objectForKey:@"AppleUserMorphology"];

  if (_NSIsNSDictionary())
  {
    id v9 = v8;
    uint64_t v12 = 0;
    id v10 = [objc_alloc((Class)_NSAttributedStringGrammarInflection) initWithExternalRepresentationDictionary:v9 error:&v12];
  }
  else
  {
    id v10 = objc_alloc_init((Class)_NSAttributedStringGrammarInflection);
  }

  return v10;
}

- (BOOL)canShareInflectionWithApps
{
  v3 = [(COSInflectionSelector *)self gizmoProtectedMorphologyDomain];
  id v4 = [v3 synchronize];

  id v5 = [(COSInflectionSelector *)self gizmoProtectedMorphologyDomain];
  id v6 = [v5 objectForKey:@"AppleUserMorphologyAllowThirdPartyAccess"];

  if (_NSIsNSNumber()) {
    unsigned __int8 v7 = [v6 BOOLValue];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)setInflection:(id)a3
{
  id v4 = a3;
  id v5 = [(COSInflectionSelector *)self gizmoProtectedMorphologyDomain];
  id v6 = [v4 externalRepresentationDictionary];
  [v5 setObject:v6 forKey:@"AppleUserMorphology"];

  unsigned __int8 v7 = [(COSInflectionSelector *)self gizmoProtectedMorphologyDomain];
  id v8 = [v7 synchronize];

  id v9 = [(COSInflectionSelector *)self syncManager];
  id v10 = [(COSInflectionSelector *)self gizmoProtectedMorphologyDomain];
  v11 = [v10 domain];
  CFStringRef v25 = @"AppleUserMorphology";
  uint64_t v12 = +[NSArray arrayWithObjects:&v25 count:1];
  v13 = +[NSSet setWithArray:v12];
  [v9 synchronizeNanoDomain:v11 keys:v13];

  LODWORD(v10) = [(COSInflectionSelector *)self canShareInflectionWithApps];
  v14 = [(COSInflectionSelector *)self gizmoPublicMorphologyDomain];
  objc_super v15 = v14;
  if (v10)
  {
    v16 = [v4 externalRepresentationDictionary];
    [v15 setObject:v16 forKey:@"AppleUserMorphology"];
  }
  else
  {
    [v14 setObject:0 forKey:@"AppleUserMorphology"];
  }

  v17 = [(COSInflectionSelector *)self gizmoPublicMorphologyDomain];
  id v18 = [v17 synchronize];

  v19 = [(COSInflectionSelector *)self syncManager];
  v20 = [(COSInflectionSelector *)self gizmoPublicMorphologyDomain];
  v21 = [v20 domain];
  CFStringRef v24 = @"AppleUserMorphology";
  v22 = +[NSArray arrayWithObjects:&v24 count:1];
  v23 = +[NSSet setWithArray:v22];
  [v19 synchronizeNanoDomain:v21 keys:v23];
}

- (void)setCanShareInflectionWithApps:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(COSInflectionSelector *)self gizmoProtectedMorphologyDomain];
  id v6 = +[NSNumber numberWithBool:v3];
  [v5 setObject:v6 forKey:@"AppleUserMorphologyAllowThirdPartyAccess"];

  unsigned __int8 v7 = [(COSInflectionSelector *)self gizmoProtectedMorphologyDomain];
  id v8 = [v7 synchronize];

  id v9 = [(COSInflectionSelector *)self syncManager];
  id v10 = [(COSInflectionSelector *)self gizmoProtectedMorphologyDomain];
  v11 = [v10 domain];
  CFStringRef v15 = @"AppleUserMorphologyAllowThirdPartyAccess";
  uint64_t v12 = +[NSArray arrayWithObjects:&v15 count:1];
  v13 = +[NSSet setWithArray:v12];
  [v9 synchronizeNanoDomain:v11 keys:v13];

  v14 = [(COSInflectionSelector *)self currentInflection];
  [(COSInflectionSelector *)self setInflection:v14];
}

- (COSInternationalController)internationalController
{
  return self->_internationalController;
}

- (void)setInternationalController:(id)a3
{
}

- (NPSDomainAccessor)gizmoProtectedMorphologyDomain
{
  return self->_gizmoProtectedMorphologyDomain;
}

- (void)setGizmoProtectedMorphologyDomain:(id)a3
{
}

- (NPSDomainAccessor)gizmoPublicMorphologyDomain
{
  return self->_gizmoPublicMorphologyDomain;
}

- (void)setGizmoPublicMorphologyDomain:(id)a3
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
  objc_storeStrong((id *)&self->_gizmoPublicMorphologyDomain, 0);
  objc_storeStrong((id *)&self->_gizmoProtectedMorphologyDomain, 0);

  objc_storeStrong((id *)&self->_internationalController, 0);
}

@end