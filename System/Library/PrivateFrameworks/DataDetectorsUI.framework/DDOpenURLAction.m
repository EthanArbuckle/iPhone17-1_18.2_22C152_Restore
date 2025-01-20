@interface DDOpenURLAction
- (BOOL)canBePerformedByOpeningURL;
- (BOOL)canBePerformedWhenDeviceIsLocked;
- (BOOL)shouldOpenInApp;
- (BOOL)shouldOpenInBrowser;
- (id)appLink;
- (id)compactTitle;
- (id)companionAction;
- (id)iconName;
- (id)localizedName;
- (id)notificationIconBundleIdentifier;
- (id)notificationURL;
- (id)quickActionTitle;
- (void)performFromView:(id)a3;
@end

@implementation DDOpenURLAction

- (id)iconName
{
  if (self->super._hasCompanion)
  {
    if ([(NSURL *)self->super._url dd_isAppleStore])
    {
      if ([(NSURL *)self->super._url dd_isAppleApps])
      {
        return @"appstore";
      }
      else if ([(NSURL *)self->super._url dd_isAppleBooks])
      {
        return @"book";
      }
      else if ([(NSURL *)self->super._url dd_isAppleMusic])
      {
        return @"music";
      }
      else if ([(NSURL *)self->super._url dd_isApplePodcasts])
      {
        return @"podcasts";
      }
      else if ([(NSURL *)self->super._url dd_isAppleTV])
      {
        return @"tv";
      }
      else
      {
        return @"star";
      }
    }
    else
    {
      return @"arrow.up.forward.app";
    }
  }
  else
  {
    v3 = @"safari";
    if (!self->super._isCompanion)
    {
      if ([(NSURL *)self->super._url dd_isMaps:1])
      {
        return @"map";
      }
      else
      {
        v5 = [(NSURL *)self->super._url scheme];
        v6 = [v5 lowercaseString];
        int v7 = [v6 isEqualToString:@"rdar"];

        if (v7) {
          return @"ant";
        }
      }
    }
  }
  return v3;
}

- (id)appLink
{
  if (!self->_appLinkInitDone)
  {
    self->_appLinkInitDone = 1;
    if (appLink_onceToken != -1) {
      dispatch_once(&appLink_onceToken, &__block_literal_global_7);
    }
    if (appLink_entitled)
    {
      url = self->super._url;
      if (url)
      {
        v6 = [MEMORY[0x1E4F22398] appLinksWithURL:url limit:1 error:0];
        int v7 = [v6 firstObject];
        appLink = self->_appLink;
        self->_appLink = v7;
      }
    }
  }
  v3 = self->_appLink;
  return v3;
}

uint64_t __26__DDOpenURLAction_appLink__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F22398] currentProcessHasReadAccess];
  appLink_entitled = result;
  return result;
}

- (id)companionAction
{
  if (self->super._isCompanion
    || self->super._hasCompanion
    || ([(DDOpenURLAction *)self appLink],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    v3 = 0;
  }
  else
  {
    v3 = [(DDAction *)[DDOpenURLAction alloc] initWithURL:self->super._url result:self->super._result context:self->super._context];
    if (v3)
    {
      v3->super._isCompanion = 1;
      self->super._hasCompanion = 1;
    }
  }
  return v3;
}

- (id)localizedName
{
  if (self->super._hasCompanion)
  {
    v2 = [(DDOpenURLAction *)self appLink];
    v3 = [v2 targetApplicationRecord];
    v4 = [v3 localizedName];

    v5 = NSString;
    v6 = DDLocalizedString(@"Open in “%@”");
    int v7 = objc_msgSend(v5, "stringWithFormat:", v6, v4);
  }
  else if (self->super._isCompanion)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F22408]);
    v9 = [MEMORY[0x1E4F1CB10] URLWithString:@"http://"];
    v10 = (void *)[v8 initWithURL:v9 error:0];
    v11 = [v10 bundleRecord];
    v12 = [v11 localizedName];

    if ([v12 length])
    {
      v13 = NSString;
      v14 = DDLocalizedString(@"Open in %@");
      int v7 = objc_msgSend(v13, "stringWithFormat:", v14, v12);
    }
    else
    {
      int v7 = DDLocalizedString(@"Open in Web Browser");
    }
  }
  else
  {
    v15 = [(NSURL *)self->super._url scheme];
    v16 = [v15 lowercaseString];
    int v17 = [v16 isEqualToString:@"rdar"];

    if (v17) {
      v18 = @"Open in Radar";
    }
    else {
      v18 = @"Open Link";
    }
    int v7 = DDLocalizedString(v18);
  }
  return v7;
}

- (id)compactTitle
{
  v3 = self->super._result;
  if (v3)
  {
    v4 = actionSheetTitleForResult((uint64_t)v3);
  }
  else
  {
    url = self->super._url;
    if (!url)
    {
      v6 = 0;
      goto LABEL_9;
    }
    v4 = actionSheetTitleForURL(url);
  }
  v6 = v4;
  if (v4 && (unint64_t)[v4 length] <= 0x3B)
  {
    id v7 = v6;
    v6 = v7;
    goto LABEL_10;
  }
LABEL_9:
  v10.receiver = self;
  v10.super_class = (Class)DDOpenURLAction;
  id v7 = [(DDAction *)&v10 compactTitle];
LABEL_10:
  id v8 = v7;

  return v8;
}

- (id)quickActionTitle
{
  url = self->super._url;
  if (url)
  {
    v4 = [(NSURL *)url _lp_highLevelDomain];
    if ([v4 length]) {
      goto LABEL_5;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)DDOpenURLAction;
  v4 = [(DDAction *)&v6 quickActionTitle];
LABEL_5:
  return v4;
}

- (void)performFromView:(id)a3
{
  id v9 = a3;
  if ([(DDOpenURLAction *)self shouldOpenInApp]
    && ([(DDOpenURLAction *)self appLink],
        v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    v5 = [(DDOpenURLAction *)self appLink];
    [v5 setEnabled:1];

    objc_super v6 = [(DDOpenURLAction *)self appLink];
    [v6 openWithCompletionHandler:0];
  }
  else
  {
    if ([(DDOpenURLAction *)self shouldOpenInBrowser])
    {
      id v7 = [(DDOpenURLAction *)self appLink];

      if (v7)
      {
        id v8 = [(DDOpenURLAction *)self appLink];
        [v8 setEnabled:0];
      }
    }
    [(DDAction *)self _performFromView:v9 byOpeningURL:self->super._url disableAppLink:[(DDOpenURLAction *)self shouldOpenInBrowser]];
  }
}

- (BOOL)canBePerformedWhenDeviceIsLocked
{
  if (![(DDOpenURLAction *)self shouldOpenInApp]) {
    return 1;
  }
  v3 = [(DDOpenURLAction *)self appLink];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)canBePerformedByOpeningURL
{
  return 1;
}

- (id)notificationIconBundleIdentifier
{
  v2 = [(NSURL *)self->super._url scheme];
  v3 = [v2 lowercaseString];
  int v4 = [v3 hasPrefix:@"http"];

  if (v4) {
    return @"com.apple.mobilesafari";
  }
  else {
    return 0;
  }
}

- (id)notificationURL
{
  return self->super._url;
}

- (BOOL)shouldOpenInBrowser
{
  return self->super._isCompanion;
}

- (BOOL)shouldOpenInApp
{
  return self->super._hasCompanion;
}

- (void).cxx_destruct
{
}

@end