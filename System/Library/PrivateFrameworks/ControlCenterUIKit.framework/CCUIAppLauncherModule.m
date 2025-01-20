@interface CCUIAppLauncherModule
- (BOOL)expandsGridSizeClassesForAccessibility;
- (BOOL)requestAuthenticationForExpandedModule;
- (BOOL)supportsApplicationShortcuts;
- (CCUIAppLauncherModule)init;
- (CCUIContentModuleContext)contentModuleContext;
- (NSString)applicationIdentifier;
- (NSString)displayName;
- (NSString)launchApplicationIdentifier;
- (NSURL)launchURL;
- (SBFApplication)_application;
- (UIImage)iconGlyph;
- (id)contentViewControllerForContext:(id)a3;
- (id)launchURLForTouchType:(int64_t)a3;
- (void)_fetchApplicationIfNeeded;
- (void)handleTapWithTouchType:(int64_t)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setContentModuleContext:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setLaunchApplicationIdentifier:(id)a3;
- (void)setLaunchURL:(id)a3;
- (void)setRequestAuthenticationForExpandedModule:(BOOL)a3;
- (void)setSupportsApplicationShortcuts:(BOOL)a3;
@end

@implementation CCUIAppLauncherModule

- (CCUIAppLauncherModule)init
{
  v21.receiver = self;
  v21.super_class = (Class)CCUIAppLauncherModule;
  v2 = [(CCUIAppLauncherModule *)&v21 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28B50], "ccui_bundleForModuleInstance:", v2);
    bundle = v2->_bundle;
    v2->_bundle = (NSBundle *)v3;

    v5 = [(NSBundle *)v2->_bundle infoDictionary];
    v6 = [v5 objectForKey:@"CCAssociatedBundleIdentifier"];
    [(CCUIAppLauncherModule *)v2 setApplicationIdentifier:v6];

    v7 = [v5 objectForKey:@"CCLaunchApplicationIdentifier"];
    [(CCUIAppLauncherModule *)v2 setLaunchApplicationIdentifier:v7];

    v8 = [v5 objectForKey:@"CCLaunchURL"];
    if (v8)
    {
      v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
      [(CCUIAppLauncherModule *)v2 setLaunchURL:v9];
    }
    else
    {
      [(CCUIAppLauncherModule *)v2 setLaunchURL:0];
    }
    uint64_t v10 = [(NSBundle *)v2->_bundle ccui_displayName];
    displayName = v2->_displayName;
    v2->_displayName = (NSString *)v10;

    v12 = [v5 objectForKey:@"CCSupportsApplicationShortcuts"];
    v13 = v12;
    if (v12) {
      char v14 = [v12 BOOLValue];
    }
    else {
      char v14 = 1;
    }
    v2->_supportsApplicationShortcuts = v14;
    v15 = [v5 objectForKey:@"CCRequestAuthenticationForExpandedModule"];
    v16 = v15;
    if (v15) {
      LOBYTE(v15) = [v15 BOOLValue];
    }
    v2->_requestAuthenticationForExpandedModule = (char)v15;
    v17 = dispatch_get_global_queue(9, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__CCUIAppLauncherModule_init__block_invoke;
    block[3] = &unk_1E6AD41E8;
    v20 = v2;
    dispatch_async(v17, block);
  }
  return v2;
}

uint64_t __29__CCUIAppLauncherModule_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchApplicationIfNeeded];
}

- (UIImage)iconGlyph
{
  return (UIImage *)[MEMORY[0x1E4FB1818] imageNamed:@"AppIcon" inBundle:self->_bundle];
}

- (id)launchURLForTouchType:(int64_t)a3
{
  return self->_launchURL;
}

- (void)handleTapWithTouchType:(int64_t)a3
{
  -[CCUIAppLauncherModule launchURLForTouchType:](self, "launchURLForTouchType:");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [(CCUIAppLauncherModule *)self launchApplicationIdentifier];
  v6 = [(CCUIAppLauncherModule *)self applicationIdentifier];
  if (v9)
  {
    v7 = [(CCUIAppLauncherModule *)self contentModuleContext];
    v8 = [(CCUIAppLauncherModule *)self launchURLForTouchType:a3];
    [v7 openURL:v8 completionHandler:0];
LABEL_3:

LABEL_6:
    goto LABEL_7;
  }
  if (v5)
  {
    v7 = [(CCUIAppLauncherModule *)self contentModuleContext];
    [v7 openApplication:v5 completionHandler:0];
    goto LABEL_6;
  }
  if (v6)
  {
    v7 = [(CCUIAppLauncherModule *)self contentModuleContext];
    v8 = [(CCUIAppLauncherModule *)self applicationIdentifier];
    [v7 openApplication:v8 completionHandler:0];
    goto LABEL_3;
  }
LABEL_7:
}

- (id)contentViewControllerForContext:(id)a3
{
  v4 = objc_alloc_init(CCUIAppLauncherViewController);
  v5 = [(CCUIAppLauncherModule *)self contentModuleContext];
  [(CCUIMenuModuleViewController *)v4 setContentModuleContext:v5];

  [(CCUIAppLauncherViewController *)v4 setModule:self];
  return v4;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (SBFApplication)_application
{
  [(CCUIAppLauncherModule *)self _fetchApplicationIfNeeded];
  application = self->_application;
  return application;
}

- (void)_fetchApplicationIfNeeded
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (obj->_applicationIdentifier && !obj->_application)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4FA5E90]) initWithApplicationBundleIdentifier:obj->_applicationIdentifier];
    application = obj->_application;
    obj->_application = (SBFApplication *)v3;

    v2 = obj;
  }
  objc_sync_exit(v2);
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSString)launchApplicationIdentifier
{
  return self->_launchApplicationIdentifier;
}

- (void)setLaunchApplicationIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (void)setLaunchURL:(id)a3
{
}

- (BOOL)supportsApplicationShortcuts
{
  return self->_supportsApplicationShortcuts;
}

- (void)setSupportsApplicationShortcuts:(BOOL)a3
{
  self->_supportsApplicationShortcuts = a3;
}

- (BOOL)requestAuthenticationForExpandedModule
{
  return self->_requestAuthenticationForExpandedModule;
}

- (void)setRequestAuthenticationForExpandedModule:(BOOL)a3
{
  self->_requestAuthenticationForExpandedModule = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_launchApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end