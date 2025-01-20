@interface SHAttribution
+ (BOOL)requiresMediaLibraryAttributionForBundleIdentifier:(id)a3;
+ (BOOL)requiresMusicRecognitionSensorActivityAttributionForBundleIdentifier:(id)a3;
+ (id)mediaLibraryAttributionExceptionPlist;
+ (id)musicRecognitionSensorActivityAttributionExceptionPlist;
+ (id)productNameForBundleIdentifier:(id)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (NSString)bundleIdentifier;
- (NSString)containingAppBundleIdentifier;
- (NSString)productName;
- (NSString)teamIdentifier;
- (SHAttribution)init;
- (SHAttribution)initWithConnection:(id)a3;
- (void)configureAttributionForConnection:(id)a3;
- (void)configureAttributionForTask:(__SecTask *)a3;
@end

@implementation SHAttribution

- (SHAttribution)init
{
  v5.receiver = self;
  v5.super_class = (Class)SHAttribution;
  v2 = [(SHAttribution *)&v5 init];
  if (v2)
  {
    SecTaskRef v3 = SecTaskCreateFromSelf(0);
    [(SHAttribution *)v2 configureAttributionForTask:v3];
    CFRelease(v3);
  }
  return v2;
}

- (SHAttribution)initWithConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SHAttribution;
  objc_super v5 = [(SHAttribution *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SHAttribution *)v5 configureAttributionForConnection:v4];
  }

  return v6;
}

- (NSString)containingAppBundleIdentifier
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  SecTaskRef v3 = [(SHAttribution *)self bundleIdentifier];

  if (v3)
  {
    id v4 = [(SHAttribution *)self bundleIdentifier];
    id v20 = 0;
    objc_super v5 = [MEMORY[0x263F01890] bundleRecordWithBundleIdentifier:v4 allowPlaceholder:0 error:&v20];
    id v6 = v20;
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [v5 containingBundleRecord];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_super v8 = [v7 bundleIdentifier];
          v9 = v8;
          if (v8)
          {
            v10 = v4;
            id v4 = v8;
          }
          else
          {
            v10 = sh_log_object();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_224B4B000, v10, OS_LOG_TYPE_ERROR, "Client app is an app extension, but no containing app bundle identifier", buf, 2u);
            }
          }

          v11 = v4;
        }
        else
        {
          v18 = sh_log_object();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_224B4B000, v18, OS_LOG_TYPE_ERROR, "Client is an app extension, but has a containing bundle that's not an application", buf, 2u);
          }

          v11 = v4;
        }

        goto LABEL_23;
      }
      v13 = sh_log_object();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v14 = "Client is not an extension, use bundle identifier";
        v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
        uint32_t v17 = 2;
        goto LABEL_14;
      }
    }
    else
    {
      v13 = sh_log_object();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v22 = v6;
        v14 = "Failed to get bundle record, instead using bundle identifier. %{public}@";
        v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
        uint32_t v17 = 12;
LABEL_14:
        _os_log_impl(&dword_224B4B000, v15, v16, v14, buf, v17);
      }
    }

    v11 = v4;
LABEL_23:

    v12 = v11;
    goto LABEL_24;
  }
  v11 = sh_log_object();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224B4B000, v11, OS_LOG_TYPE_ERROR, "There is no bundle identifier", buf, 2u);
  }
  v12 = 0;
LABEL_24:

  return (NSString *)v12;
}

- (NSString)productName
{
  SecTaskRef v3 = [(SHAttribution *)self bundleIdentifier];

  if (v3)
  {
    id v4 = [(SHAttribution *)self bundleIdentifier];
    objc_super v5 = +[SHAttribution productNameForBundleIdentifier:v4];
  }
  else
  {
    objc_super v5 = 0;
  }

  return (NSString *)v5;
}

+ (id)productNameForBundleIdentifier:(id)a3
{
  SecTaskRef v3 = (objc_class *)MEMORY[0x263F01878];
  id v4 = a3;
  uint64_t v8 = 0;
  objc_super v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v8];

  id v6 = [v5 localizedName];

  return v6;
}

+ (BOOL)requiresMediaLibraryAttributionForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 mediaLibraryAttributionExceptionPlist];
  id v6 = [(id)v5 objectForKey:@"com.apple.private.shazamkit.exception.medialibraryattribution"];

  LOBYTE(v5) = [v6 containsObject:v4];
  return v5 ^ 1;
}

+ (BOOL)requiresMusicRecognitionSensorActivityAttributionForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 musicRecognitionSensorActivityAttributionExceptionPlist];
  id v6 = [v5 objectForKey:@"com.apple.private.shazamkit.musicrecognitionsensoractivity"];

  LOBYTE(v5) = [v6 containsObject:v4];
  return (char)v5;
}

- (void)configureAttributionForTask:(__SecTask *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  CFErrorRef error = 0;
  id v4 = (__CFString *)SecTaskCopySigningIdentifier(a3, &error);
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = &v4->isa;

  if (self->_bundleIdentifier) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = error == 0;
  }
  if (!v6)
  {
    v7 = sh_log_object();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFErrorRef v14 = error;
      _os_log_impl(&dword_224B4B000, v7, OS_LOG_TYPE_ERROR, "Unable to get signing identifier from task: %{public}@", buf, 0xCu);
    }
  }
  uint64_t v8 = (NSString *)SecTaskCopyTeamIdentifier();
  teamIdentifier = self->_teamIdentifier;
  self->_teamIdentifier = v8;

  CFErrorRef v10 = error;
  if (!self->_teamIdentifier && error)
  {
    v11 = sh_log_object();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFErrorRef v14 = error;
      _os_log_impl(&dword_224B4B000, v11, OS_LOG_TYPE_ERROR, "Unable to get team identifier from task: %{public}@", buf, 0xCu);
    }

    CFErrorRef v10 = error;
  }
  if (v10) {
    CFRelease(v10);
  }
}

- (void)configureAttributionForConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 auditToken];
    SecTaskRef v6 = SecTaskCreateWithAuditToken(0, &token);
    if (v6)
    {
      SecTaskRef v7 = v6;
      [v5 auditToken];
LABEL_6:
      long long v9 = v12;
      *(_OWORD *)self->_auditToken.val = v11;
      *(_OWORD *)&self->_auditToken.val[4] = v9;
      -[SHAttribution configureAttributionForTask:](self, "configureAttributionForTask:", v7, (void)v11);
      CFRelease(v7);
      goto LABEL_10;
    }
  }
  else
  {
    memset(&token, 0, sizeof(token));
    SecTaskRef v8 = SecTaskCreateWithAuditToken(0, &token);
    if (v8)
    {
      SecTaskRef v7 = v8;
      long long v11 = 0u;
      long long v12 = 0u;
      goto LABEL_6;
    }
  }
  CFErrorRef v10 = sh_log_object();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_224B4B000, v10, OS_LOG_TYPE_ERROR, "Unable to create SecTask for audit token", (uint8_t *)&v11, 2u);
  }

LABEL_10:
}

+ (id)musicRecognitionSensorActivityAttributionExceptionPlist
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__SHAttribution_musicRecognitionSensorActivityAttributionExceptionPlist__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (musicRecognitionSensorActivityAttributionExceptionPlist_onceToken != -1) {
    dispatch_once(&musicRecognitionSensorActivityAttributionExceptionPlist_onceToken, block);
  }
  v2 = (void *)musicRecognitionSensorActivityAttributionExceptionPlist_plist;

  return v2;
}

void __72__SHAttribution_musicRecognitionSensorActivityAttributionExceptionPlist__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v1 = [(id)*MEMORY[0x263F1DC40] preferredFilenameExtension];
  id v4 = [v0 pathForResource:@"SHMusicRecognitionSensorActivityAttributionPlist" ofType:v1];

  uint64_t v2 = [NSDictionary dictionaryWithContentsOfFile:v4];
  SecTaskRef v3 = (void *)musicRecognitionSensorActivityAttributionExceptionPlist_plist;
  musicRecognitionSensorActivityAttributionExceptionPlist_plist = v2;
}

+ (id)mediaLibraryAttributionExceptionPlist
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SHAttribution_mediaLibraryAttributionExceptionPlist__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mediaLibraryAttributionExceptionPlist_onceToken != -1) {
    dispatch_once(&mediaLibraryAttributionExceptionPlist_onceToken, block);
  }
  uint64_t v2 = (void *)mediaLibraryAttributionExceptionPlist_plist;

  return v2;
}

void __54__SHAttribution_mediaLibraryAttributionExceptionPlist__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v1 = [(id)*MEMORY[0x263F1DC40] preferredFilenameExtension];
  id v4 = [v0 pathForResource:@"MediaLibraryAttributionException" ofType:v1];

  uint64_t v2 = [NSDictionary dictionaryWithContentsOfFile:v4];
  SecTaskRef v3 = (void *)mediaLibraryAttributionExceptionPlist_plist;
  mediaLibraryAttributionExceptionPlist_plist = v2;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamIdentifier, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end