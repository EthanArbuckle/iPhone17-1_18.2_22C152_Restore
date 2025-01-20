@interface _SFPerSitePreferencesVendor
- (WBSAutomaticReaderActivationManager)automaticReaderActivationManager;
- (WBSLockdownModePreferenceManager)lockdownModePreferenceManager;
- (WBSProfilePreferenceManager)profilePreferenceManager;
- (WBSProfileProviding)profileProvider;
- (_SFAppInfoOverlayPreferenceManager)appInfoOverlayPreferenceManager;
- (_SFContentBlockersPreferenceManager)contentBlockersPreferenceManager;
- (_SFGeolocationPermissionManager)sharedGeolocationPermissionManager;
- (_SFPageZoomPreferenceManager)pageZoomPreferenceManager;
- (_SFPerSitePreferencesVendor)initWithExtensionsController:(id)a3 profileProvider:(id)a4;
- (_SFRequestDesktopSitePreferenceManager)requestDesktopSitePreferenceManager;
- (_SFUserMediaPermissionController)sharedUserMediaPermissionController;
- (id)managerForPreference:(id)a3;
- (void)dealloc;
@end

@implementation _SFPerSitePreferencesVendor

- (_SFRequestDesktopSitePreferenceManager)requestDesktopSitePreferenceManager
{
  requestDesktopSitePreferenceManager = self->_requestDesktopSitePreferenceManager;
  if (!requestDesktopSitePreferenceManager)
  {
    v4 = [_SFRequestDesktopSitePreferenceManager alloc];
    v5 = [MEMORY[0x1E4F98CD8] sharedStore];
    v6 = +[_SFRequestDesktopSiteQuirksManager sharedManager];
    v7 = [(_SFRequestDesktopSitePreferenceManager *)v4 initWithPerSitePreferencesStore:v5 quirksManager:v6];
    v8 = self->_requestDesktopSitePreferenceManager;
    self->_requestDesktopSitePreferenceManager = v7;

    requestDesktopSitePreferenceManager = self->_requestDesktopSitePreferenceManager;
  }

  return requestDesktopSitePreferenceManager;
}

- (_SFPerSitePreferencesVendor)initWithExtensionsController:(id)a3 profileProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_SFPerSitePreferencesVendor;
  v9 = [(_SFPerSitePreferencesVendor *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_extensionsController, a3);
    objc_storeStrong((id *)&v10->_profileProvider, a4);
    v11 = v10;
  }

  return v10;
}

- (void)dealloc
{
  [(_SFContentBlockersPreferenceManager *)self->_contentBlockersPreferenceManager invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_SFPerSitePreferencesVendor;
  [(_SFPerSitePreferencesVendor *)&v3 dealloc];
}

- (WBSAutomaticReaderActivationManager)automaticReaderActivationManager
{
  automaticReaderPreferenceManager = self->_automaticReaderPreferenceManager;
  if (!automaticReaderPreferenceManager)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F98990]);
    v5 = [MEMORY[0x1E4F98CD8] sharedStore];
    v6 = (WBSAutomaticReaderActivationManager *)[v4 initWithPerSitePreferencesStore:v5];
    id v7 = self->_automaticReaderPreferenceManager;
    self->_automaticReaderPreferenceManager = v6;

    automaticReaderPreferenceManager = self->_automaticReaderPreferenceManager;
  }

  return automaticReaderPreferenceManager;
}

- (_SFContentBlockersPreferenceManager)contentBlockersPreferenceManager
{
  contentBlockersPreferenceManager = self->_contentBlockersPreferenceManager;
  if (!contentBlockersPreferenceManager)
  {
    id v4 = [_SFContentBlockersPreferenceManager alloc];
    v5 = [MEMORY[0x1E4F98CD8] sharedStore];
    v6 = [(_SFContentBlockersPreferenceManager *)v4 initWithPerSitePreferencesStore:v5 extensionsController:self->_extensionsController];
    id v7 = self->_contentBlockersPreferenceManager;
    self->_contentBlockersPreferenceManager = v6;

    contentBlockersPreferenceManager = self->_contentBlockersPreferenceManager;
  }

  return contentBlockersPreferenceManager;
}

- (_SFUserMediaPermissionController)sharedUserMediaPermissionController
{
  return (_SFUserMediaPermissionController *)+[WBSUserMediaPermissionController sharedController];
}

- (_SFGeolocationPermissionManager)sharedGeolocationPermissionManager
{
  return (_SFGeolocationPermissionManager *)+[_SFGeolocationPermissionManager sharedManager];
}

- (WBSLockdownModePreferenceManager)lockdownModePreferenceManager
{
  lockdownModePreferenceManager = self->_lockdownModePreferenceManager;
  if (!lockdownModePreferenceManager)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F98C18]);
    v5 = [MEMORY[0x1E4F98CD8] sharedStore];
    v6 = (WBSLockdownModePreferenceManager *)[v4 initWithPerSitePreferenceStore:v5];
    id v7 = self->_lockdownModePreferenceManager;
    self->_lockdownModePreferenceManager = v6;

    lockdownModePreferenceManager = self->_lockdownModePreferenceManager;
  }

  return lockdownModePreferenceManager;
}

- (_SFPageZoomPreferenceManager)pageZoomPreferenceManager
{
  pageZoomPreferenceManager = self->_pageZoomPreferenceManager;
  if (!pageZoomPreferenceManager)
  {
    id v4 = +[_SFPageZoomPreferenceManager sharedManager];
    v5 = self->_pageZoomPreferenceManager;
    self->_pageZoomPreferenceManager = v4;

    pageZoomPreferenceManager = self->_pageZoomPreferenceManager;
  }

  return pageZoomPreferenceManager;
}

- (_SFAppInfoOverlayPreferenceManager)appInfoOverlayPreferenceManager
{
  appInfoOverlayPreferenceManager = self->_appInfoOverlayPreferenceManager;
  if (!appInfoOverlayPreferenceManager)
  {
    id v4 = [_SFAppInfoOverlayPreferenceManager alloc];
    v5 = [MEMORY[0x1E4F98CD8] sharedStore];
    v6 = [(_SFAppInfoOverlayPreferenceManager *)v4 initWithPerSitePreferencesStore:v5];
    id v7 = self->_appInfoOverlayPreferenceManager;
    self->_appInfoOverlayPreferenceManager = v6;

    appInfoOverlayPreferenceManager = self->_appInfoOverlayPreferenceManager;
  }

  return appInfoOverlayPreferenceManager;
}

- (WBSProfilePreferenceManager)profilePreferenceManager
{
  profilePreferenceManager = self->_profilePreferenceManager;
  if (!profilePreferenceManager)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F98D30]);
    v5 = [MEMORY[0x1E4F98CD8] sharedStore];
    v6 = (WBSProfilePreferenceManager *)[v4 initWithPerSitePreferencesStore:v5 profileProvider:self->_profileProvider];
    id v7 = self->_profilePreferenceManager;
    self->_profilePreferenceManager = v6;

    profilePreferenceManager = self->_profilePreferenceManager;
  }

  return profilePreferenceManager;
}

- (id)managerForPreference:(id)a3
{
  id v4 = a3;
  preferenceToManager = self->_preferenceToManager;
  if (!preferenceToManager)
  {
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    id v7 = self->_preferenceToManager;
    self->_preferenceToManager = v6;

    v38 = [(_SFPerSitePreferencesVendor *)self automaticReaderActivationManager];
    id v8 = self->_preferenceToManager;
    v9 = [v38 readerPreference];
    [(NSMutableDictionary *)v8 setObject:v38 forKeyedSubscript:v9];

    v37 = [(_SFPerSitePreferencesVendor *)self contentBlockersPreferenceManager];
    v10 = self->_preferenceToManager;
    v11 = [v37 contentBlockersPreference];
    [(NSMutableDictionary *)v10 setObject:v37 forKeyedSubscript:v11];

    v12 = [(_SFPerSitePreferencesVendor *)self sharedUserMediaPermissionController];
    objc_super v13 = self->_preferenceToManager;
    v14 = [v12 cameraMediaCapturePreference];
    [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:v14];

    v15 = self->_preferenceToManager;
    v16 = [v12 microphoneMediaCapturePreference];
    [(NSMutableDictionary *)v15 setObject:v12 forKeyedSubscript:v16];

    v36 = [(_SFPerSitePreferencesVendor *)self sharedGeolocationPermissionManager];
    v17 = self->_preferenceToManager;
    v18 = [v36 geolocationPreference];
    [(NSMutableDictionary *)v17 setObject:v36 forKeyedSubscript:v18];

    v19 = [(_SFPerSitePreferencesVendor *)self requestDesktopSitePreferenceManager];
    v20 = self->_preferenceToManager;
    v21 = [v19 requestDesktopSitePreference];
    [(NSMutableDictionary *)v20 setObject:v19 forKeyedSubscript:v21];

    v22 = [(_SFPerSitePreferencesVendor *)self pageZoomPreferenceManager];
    v23 = self->_preferenceToManager;
    v24 = [v22 pageZoomPreference];
    [(NSMutableDictionary *)v23 setObject:v22 forKeyedSubscript:v24];

    v25 = [(_SFPerSitePreferencesVendor *)self appInfoOverlayPreferenceManager];
    v26 = self->_preferenceToManager;
    v27 = [v25 appInfoOverlayPreference];
    [(NSMutableDictionary *)v26 setObject:v25 forKeyedSubscript:v27];

    v28 = [(_SFPerSitePreferencesVendor *)self lockdownModePreferenceManager];
    v29 = self->_preferenceToManager;
    v30 = [v28 lockdownPreference];
    [(NSMutableDictionary *)v29 setObject:v28 forKeyedSubscript:v30];

    v31 = [(_SFPerSitePreferencesVendor *)self profilePreferenceManager];
    v32 = self->_preferenceToManager;
    v33 = [v31 profilePreference];
    [(NSMutableDictionary *)v32 setObject:v31 forKeyedSubscript:v33];

    preferenceToManager = self->_preferenceToManager;
  }
  v34 = [(NSMutableDictionary *)preferenceToManager objectForKeyedSubscript:v4];

  return v34;
}

- (WBSProfileProviding)profileProvider
{
  return self->_profileProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileProvider, 0);
  objc_storeStrong((id *)&self->_profilePreferenceManager, 0);
  objc_storeStrong((id *)&self->_lockdownModePreferenceManager, 0);
  objc_storeStrong((id *)&self->_appInfoOverlayPreferenceManager, 0);
  objc_storeStrong((id *)&self->_pageZoomPreferenceManager, 0);
  objc_storeStrong((id *)&self->_requestDesktopSitePreferenceManager, 0);
  objc_storeStrong((id *)&self->_contentBlockersPreferenceManager, 0);
  objc_storeStrong((id *)&self->_automaticReaderPreferenceManager, 0);
  objc_storeStrong((id *)&self->_extensionsController, 0);

  objc_storeStrong((id *)&self->_preferenceToManager, 0);
}

@end