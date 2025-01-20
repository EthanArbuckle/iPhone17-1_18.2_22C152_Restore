@interface CRCarPlayCapabilities
+ (BOOL)supportsSecureCoding;
+ (NSString)capabilitiesIdentifier;
+ (NSString)capabilitiesVersion;
+ (id)carPlayCapabilitiesCache;
+ (id)fetchCarCapabilities;
+ (id)newCapabilitiesFromGlobalDomain;
+ (void)_resetCapabilitiesGlobalDomain;
+ (void)capabilitiesIdentifier;
+ (void)fetchCarCapabilities;
+ (void)invalidateCarPlayCapabilitiesCache;
+ (void)newCapabilitiesFromGlobalDomain;
+ (void)setCapabilitiesIdentifier:(id)a3;
+ (void)setCapabilitiesVersion:(id)a3;
+ (void)setCarPlayCapabilitiesCache:(id)a3;
+ (void)waitForCarCapabilitiesValuesWithReply:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCapabilities:(id)a3;
- (BOOL)persisted;
- (CRCarPlayCapabilities)init;
- (CRCarPlayCapabilities)initWithCoder:(id)a3;
- (CRCarPlayCapabilities)initWithDictionaryRepresentation:(id)a3;
- (CRCarPlayCapabilities)initWithVersion:(id)a3;
- (NSDictionary)userInfo;
- (NSString)version;
- (NSValue)dashboardRoundedCorners;
- (NSValue)viewAreaInsets;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)informativeText;
- (int64_t)nowPlayingAlbumArtMode;
- (int64_t)userInterfaceStyle;
- (unint64_t)disabledFeature;
- (void)encodeWithCoder:(id)a3;
- (void)persistCapabilitiesToGlobalDomain;
- (void)setDashboardRoundedCorners:(id)a3;
- (void)setDisabledFeature:(unint64_t)a3;
- (void)setNowPlayingAlbumArtMode:(int64_t)a3;
- (void)setPersisted:(BOOL)a3;
- (void)setUserInfo:(id)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
- (void)setVersion:(id)a3;
- (void)setViewAreaInsets:(id)a3;
@end

@implementation CRCarPlayCapabilities

- (CRCarPlayCapabilities)init
{
  v12.receiver = self;
  v12.super_class = (Class)CRCarPlayCapabilities;
  v2 = [(CRCarPlayCapabilities *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [NSString string];
    version = v2->_version;
    v2->_version = (NSString *)v3;

    *(_OWORD *)&v2->_disabledFeature = xmmword_1ABB4CB90;
    v2->_userInterfaceStyle = 2;
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithEdgeInsets:", *MEMORY[0x1E4F28250], *(double *)(MEMORY[0x1E4F28250] + 8), *(double *)(MEMORY[0x1E4F28250] + 16), *(double *)(MEMORY[0x1E4F28250] + 24));
    viewAreaInsets = v2->_viewAreaInsets;
    v2->_viewAreaInsets = (NSValue *)v5;

    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithEdgeInsets:", 13.0, 0.0, 0.0, 0.0);
    dashboardRoundedCorners = v2->_dashboardRoundedCorners;
    v2->_dashboardRoundedCorners = (NSValue *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionary];
    userInfo = v2->_userInfo;
    v2->_userInfo = (NSDictionary *)v9;
  }
  return v2;
}

- (CRCarPlayCapabilities)initWithVersion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRCarPlayCapabilities *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    version = v5->_version;
    v5->_version = (NSString *)v6;
  }
  return v5;
}

- (id)description
{
  int v3 = CRIsTestContext();
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  version = self->_version;
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:self->_disabledFeature];
  if (v3)
  {
    v19 = version;
    v20 = v4;
    int64_t nowPlayingAlbumArtMode = self->_nowPlayingAlbumArtMode;
    viewAreaInsets = self->_viewAreaInsets;
    dashboardRoundedCorners = self->_dashboardRoundedCorners;
    int64_t userInterfaceStyle = self->_userInterfaceStyle;
    userInfo = self->_userInfo;
    v13 = [NSNumber numberWithBool:self->_persisted];
    v14 = [v20 stringWithFormat:@"<%@: %p> version = %@, disabledFeature = %@, int64_t nowPlayingAlbumArtMode = %ld, userInterfaceStyle = %ld, viewAreaInset = %@, dashboardRoundedCorners = %@, userInfo = %@, persisted = %@", v5, self, v19, v7, nowPlayingAlbumArtMode, userInterfaceStyle, viewAreaInsets, dashboardRoundedCorners, userInfo, v13];
  }
  else
  {
    v13 = +[CARSessionConfiguration descriptionForCapability:self->_nowPlayingAlbumArtMode];
    v15 = +[CARSessionConfiguration descriptionForUserInterfaceStyle:self->_userInterfaceStyle];
    long long v21 = *(_OWORD *)&self->_viewAreaInsets;
    v16 = self->_userInfo;
    v17 = [NSNumber numberWithBool:self->_persisted];
    v14 = [v4 stringWithFormat:@"<%@: %p> version = %@, disabledFeature = %@, int64_t nowPlayingAlbumArtMode = %@, userInterfaceStyle = %@, viewAreaInset = %@, dashboardRoundedCorners = %@, userInfo = %@, persisted = %@", v5, self, version, v7, v13, v15, v21, v16, v17];
  }
  return v14;
}

- (id)informativeText
{
  int v3 = NSString;
  id v4 = [(id)objc_opt_class() capabilitiesIdentifier];
  version = self->_version;
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_disabledFeature];
  uint64_t v7 = +[CARSessionConfiguration descriptionForCapability:self->_nowPlayingAlbumArtMode];
  v8 = +[CARSessionConfiguration descriptionForUserInterfaceStyle:self->_userInterfaceStyle];
  long long v13 = *(_OWORD *)&self->_viewAreaInsets;
  userInfo = self->_userInfo;
  v10 = [NSNumber numberWithBool:self->_persisted];
  v11 = [v3 stringWithFormat:@"vehicle identifier = %@\nplist version = %@\ndisabledFeature mask = %@\nint64_t nowPlayingAlbumArtMode = %@\nuserInterfaceStyle = %@\nviewAreaInset = %@\ndashboardRoundedCorners = %@\nuserInfo = %@, persisted = %@", v4, version, v6, v7, v8, v13, userInfo, v10];

  return v11;
}

+ (NSString)capabilitiesIdentifier
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (sCRCarPlayCapabilitiesIdentifier) {
    int v3 = (__CFString *)[(id)sCRCarPlayCapabilitiesIdentifier copy];
  }
  else {
    int v3 = @"CarCapabilitiesDefaultIdentifier";
  }
  objc_sync_exit(v2);

  id v4 = CarGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[CRCarPlayCapabilities capabilitiesIdentifier]();
  }

  return (NSString *)v3;
}

+ (void)setCapabilitiesIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  uint64_t v6 = (void *)sCRCarPlayCapabilitiesIdentifier;
  if (v4)
  {
    if (([(id)sCRCarPlayCapabilitiesIdentifier isEqualToString:v4] & 1) == 0)
    {
      uint64_t v7 = CarGeneralLogging();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        +[CRCarPlayCapabilities setCapabilitiesIdentifier:]();
      }

      uint64_t v8 = [v4 copy];
      uint64_t v9 = (void *)sCRCarPlayCapabilitiesIdentifier;
      sCRCarPlayCapabilitiesIdentifier = v8;
    }
  }
  else
  {
    sCRCarPlayCapabilitiesIdentifier = @"CarCapabilitiesDefaultIdentifier";
  }
  objc_sync_exit(v5);
}

+ (void)setCapabilitiesVersion:(id)a3
{
  if (a3)
  {
    CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
    CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    id v6 = a3;
    uint64_t v7 = (void *)CFPreferencesCopyValue(@"CarCapabilities", v3, v4, v5);
    uint64_t v8 = (void *)[v7 mutableCopy];
    uint64_t v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = (id)objc_opt_new();
    }
    value = v10;

    [value setObject:v6 forKey:@"CarCapabilitiesContentVersion"];
    CFPreferencesSetValue(@"CarCapabilities", value, v3, v4, v5);
    CFPreferencesSynchronize(v3, v4, v5);
  }
}

+ (NSString)capabilitiesVersion
{
  if (capabilitiesVersion_onceToken != -1) {
    dispatch_once(&capabilitiesVersion_onceToken, &__block_literal_global_24);
  }
  id v2 = (void *)capabilitiesVersion_sCapabilitiesVersion;
  return (NSString *)v2;
}

void __44__CRCarPlayCapabilities_capabilitiesVersion__block_invoke()
{
  CFStringRef v0 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
  CFStringRef v1 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  id v7 = (id)CFPreferencesCopyValue(@"CarCapabilities", (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFStringRef v3 = [v7 objectForKey:@"CarCapabilitiesContentVersion"];
  CFStringRef v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [NSString string];
  }
  id v6 = (void *)capabilitiesVersion_sCapabilitiesVersion;
  capabilitiesVersion_sCapabilitiesVersion = (uint64_t)v5;

  CFPreferencesSynchronize(v0, v1, v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRCarPlayCapabilities)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRCarPlayCapabilities;
  id v5 = [(CRCarPlayCapabilities *)&v11 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"CRCapabilitiesVersionKey"])
    {
      id v6 = [v4 decodeObjectForKey:@"CRCapabilitiesVersionKey"];
      [(CRCarPlayCapabilities *)v5 setVersion:v6];
    }
    if ([v4 containsValueForKey:@"CapabilitiesViewAreaInsetKey"])
    {
      id v7 = [v4 decodeObjectForKey:@"CapabilitiesViewAreaInsetKey"];
      [(CRCarPlayCapabilities *)v5 setViewAreaInsets:v7];
    }
    if ([v4 containsValueForKey:@"CapabilitiesDashboardRoundedCornersKey"])
    {
      uint64_t v8 = [v4 decodeObjectForKey:@"CapabilitiesDashboardRoundedCornersKey"];
      [(CRCarPlayCapabilities *)v5 setDashboardRoundedCorners:v8];
    }
    if ([v4 containsValueForKey:@"CapabilitiesNowPlayingAlbumArtKey"]) {
      -[CRCarPlayCapabilities setNowPlayingAlbumArtMode:](v5, "setNowPlayingAlbumArtMode:", [v4 decodeIntegerForKey:@"CapabilitiesNowPlayingAlbumArtKey"]);
    }
    if ([v4 containsValueForKey:@"CRCapabilitiesDisabledFeatureKey"]) {
      -[CRCarPlayCapabilities setDisabledFeature:](v5, "setDisabledFeature:", [v4 decodeIntegerForKey:@"CRCapabilitiesDisabledFeatureKey"]);
    }
    if ([v4 containsValueForKey:@"CRCapabilitiesUserInterfaceStyleKey"]) {
      -[CRCarPlayCapabilities setUserInterfaceStyle:](v5, "setUserInterfaceStyle:", [v4 decodeIntegerForKey:@"CRCapabilitiesUserInterfaceStyleKey"]);
    }
    if ([v4 containsValueForKey:@"CRCapabilitiesUserInfoKey"])
    {
      uint64_t v9 = [v4 decodeObjectForKey:@"CRCapabilitiesUserInfoKey"];
      [(CRCarPlayCapabilities *)v5 setUserInfo:v9];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  version = self->_version;
  id v8 = v4;
  if (version)
  {
    [v4 encodeObject:version forKey:@"CRCapabilitiesVersionKey"];
    id v4 = v8;
  }
  viewAreaInsets = self->_viewAreaInsets;
  if (viewAreaInsets)
  {
    [v8 encodeObject:viewAreaInsets forKey:@"CapabilitiesViewAreaInsetKey"];
    id v4 = v8;
  }
  dashboardRoundedCorners = self->_dashboardRoundedCorners;
  if (dashboardRoundedCorners)
  {
    [v8 encodeObject:dashboardRoundedCorners forKey:@"CapabilitiesDashboardRoundedCornersKey"];
    id v4 = v8;
  }
  [v4 encodeInteger:self->_nowPlayingAlbumArtMode forKey:@"CapabilitiesNowPlayingAlbumArtKey"];
  [v8 encodeInteger:self->_disabledFeature forKey:@"CRCapabilitiesDisabledFeatureKey"];
  [v8 encodeInteger:self->_userInterfaceStyle forKey:@"CRCapabilitiesUserInterfaceStyleKey"];
  [v8 encodeObject:self->_userInfo forKey:@"CRCapabilitiesUserInfoKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 64), self->_version);
    *(void *)(v5 + 16) = self->_disabledFeature;
    *(void *)(v5 + 24) = self->_nowPlayingAlbumArtMode;
    *(void *)(v5 + 48) = self->_userInterfaceStyle;
    objc_storeStrong((id *)(v5 + 32), self->_viewAreaInsets);
    objc_storeStrong((id *)(v5 + 40), self->_dashboardRoundedCorners);
    objc_storeStrong((id *)(v5 + 56), self->_userInfo);
    *(unsigned char *)(v5 + 8) = self->_persisted;
  }
  return (id)v5;
}

- (BOOL)isEqualToCapabilities:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRCarPlayCapabilities *)self version];
  id v6 = [v4 version];
  int v7 = [v5 isEqualToString:v6];

  if (!v7) {
    goto LABEL_8;
  }
  unint64_t v8 = [(CRCarPlayCapabilities *)self disabledFeature];
  if (v8 != [v4 disabledFeature]) {
    goto LABEL_8;
  }
  int64_t v9 = [(CRCarPlayCapabilities *)self nowPlayingAlbumArtMode];
  if (v9 != [v4 nowPlayingAlbumArtMode]) {
    goto LABEL_8;
  }
  id v10 = [(CRCarPlayCapabilities *)self viewAreaInsets];
  [v10 edgeInsetsValue];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  v19 = [v4 viewAreaInsets];
  [v19 edgeInsetsValue];
  v47.top = v20;
  v47.left = v21;
  v47.bottom = v22;
  v47.right = v23;
  v45.top = v12;
  v45.left = v14;
  v45.bottom = v16;
  v45.right = v18;
  BOOL v24 = NSEdgeInsetsEqual(v45, v47);

  if (!v24) {
    goto LABEL_8;
  }
  v25 = [(CRCarPlayCapabilities *)self dashboardRoundedCorners];
  [v25 edgeInsetsValue];
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  v34 = [v4 dashboardRoundedCorners];
  [v34 edgeInsetsValue];
  v48.top = v35;
  v48.left = v36;
  v48.bottom = v37;
  v48.right = v38;
  v46.top = v27;
  v46.left = v29;
  v46.bottom = v31;
  v46.right = v33;
  BOOL v39 = NSEdgeInsetsEqual(v46, v48);

  if (!v39) {
    goto LABEL_8;
  }
  int64_t v40 = [(CRCarPlayCapabilities *)self userInterfaceStyle];
  if (v40 == [v4 userInterfaceStyle])
  {
    v41 = [(CRCarPlayCapabilities *)self userInfo];
    v42 = [v4 userInfo];
    char v43 = [v41 isEqualToDictionary:v42];
  }
  else
  {
LABEL_8:
    char v43 = 0;
  }

  return v43;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CRCarPlayCapabilities *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CRCarPlayCapabilities *)self isEqualToCapabilities:v4];
  }

  return v5;
}

- (CRCarPlayCapabilities)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CRCarPlayCapabilities;
  BOOL v5 = [(CRCarPlayCapabilities *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"CRCapabilitiesVersionKey"];
    version = v5->_version;
    v5->_version = (NSString *)v6;

    unint64_t v8 = [v4 objectForKeyedSubscript:@"CRCapabilitiesDisabledFeatureKey"];
    v5->_disabledFeature = [v8 integerValue];

    int64_t v9 = [v4 objectForKeyedSubscript:@"CapabilitiesNowPlayingAlbumArtKey"];
    v5->_int64_t nowPlayingAlbumArtMode = [v9 integerValue];

    id v10 = [v4 objectForKeyedSubscript:@"CapabilitiesViewAreaInsetKey"];
    double v11 = (void *)MEMORY[0x1E4F29238];
    NSRect v23 = NSRectFromString(v10);
    uint64_t v12 = objc_msgSend(v11, "valueWithEdgeInsets:", v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);
    viewAreaInsets = v5->_viewAreaInsets;
    v5->_viewAreaInsets = (NSValue *)v12;

    CGFloat v14 = [v4 objectForKeyedSubscript:@"CapabilitiesDashboardRoundedCornersKey"];
    double v15 = (void *)MEMORY[0x1E4F29238];
    NSRect v24 = NSRectFromString(v14);
    uint64_t v16 = objc_msgSend(v15, "valueWithEdgeInsets:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
    dashboardRoundedCorners = v5->_dashboardRoundedCorners;
    v5->_dashboardRoundedCorners = (NSValue *)v16;

    CGFloat v18 = [v4 objectForKeyedSubscript:@"CRCapabilitiesUserInterfaceStyleKey"];
    v5->_int64_t userInterfaceStyle = [v18 integerValue];

    uint64_t v19 = [v4 objectForKeyedSubscript:@"CRCapabilitiesUserInfoKey"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v19;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_version forKeyedSubscript:@"CRCapabilitiesVersionKey"];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_disabledFeature];
  [v3 setObject:v4 forKeyedSubscript:@"CRCapabilitiesDisabledFeatureKey"];

  BOOL v5 = [NSNumber numberWithInteger:self->_nowPlayingAlbumArtMode];
  [v3 setObject:v5 forKeyedSubscript:@"CapabilitiesNowPlayingAlbumArtKey"];

  [(NSValue *)self->_viewAreaInsets edgeInsetsValue];
  uint64_t v6 = NSStringFromRect(v11);
  [v3 setObject:v6 forKeyedSubscript:@"CapabilitiesViewAreaInsetKey"];

  [(NSValue *)self->_dashboardRoundedCorners edgeInsetsValue];
  int v7 = NSStringFromRect(v12);
  [v3 setObject:v7 forKeyedSubscript:@"CapabilitiesDashboardRoundedCornersKey"];

  unint64_t v8 = [NSNumber numberWithInteger:self->_userInterfaceStyle];
  [v3 setObject:v8 forKeyedSubscript:@"CRCapabilitiesUserInterfaceStyleKey"];

  [v3 setObject:self->_userInfo forKeyedSubscript:@"CRCapabilitiesUserInfoKey"];
  return v3;
}

+ (id)fetchCarCapabilities
{
  id v3 = (void *)[a1 newCapabilitiesFromGlobalDomain];
  if (([v3 persisted] & 1) == 0)
  {
    id v4 = [a1 carPlayCapabilitiesCache];

    if (v4)
    {
      uint64_t v5 = [a1 carPlayCapabilitiesCache];

      id v3 = (void *)v5;
    }
  }
  uint64_t v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[CRCarPlayCapabilities fetchCarCapabilities];
  }

  return v3;
}

+ (id)newCapabilitiesFromGlobalDomain
{
  CFStringRef v2 = +[CRCarPlayCapabilities capabilitiesIdentifier];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  uint64_t v6 = (void *)CFPreferencesCopyValue(@"CarCapabilities", v3, v4, v5);
  int v7 = [v6 objectForKey:v2];
  unint64_t v8 = CarGeneralLogging();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9) {
      +[CRCarPlayCapabilities newCapabilitiesFromGlobalDomain]();
    }

    id v10 = [[CRCarPlayCapabilities alloc] initWithDictionaryRepresentation:v7];
    NSRect v11 = v10;
    uint64_t v12 = 1;
  }
  else
  {
    if (v9) {
      +[CRCarPlayCapabilities newCapabilitiesFromGlobalDomain](v8);
    }

    id v10 = (CRCarPlayCapabilities *)objc_opt_new();
    NSRect v11 = v10;
    uint64_t v12 = 0;
  }
  [(CRCarPlayCapabilities *)v10 setPersisted:v12];

  return v11;
}

- (void)persistCapabilitiesToGlobalDomain
{
  CFStringRef v0 = [NSNumber numberWithInt:getpid()];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_2(&dword_1ABB00000, v1, v2, "%s: persisting car capabilities to global domain for identifier %@: %@ (%@)", v3, v4, v5, v6, 2u);
}

+ (void)_resetCapabilitiesGlobalDomain
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "+[CRCarPlayCapabilities _resetCapabilitiesGlobalDomain]";
  _os_log_debug_impl(&dword_1ABB00000, log, OS_LOG_TYPE_DEBUG, "%s: resetting car capabilities to global domain", (uint8_t *)&v1, 0xCu);
}

+ (void)waitForCarCapabilitiesValuesWithReply:(id)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, id, void))a3;
  uint64_t v5 = +[CRCarPlayCapabilities capabilitiesIdentifier];
  if ([v5 isEqualToString:@"CarCapabilitiesDefaultIdentifier"])
  {

    uint64_t v6 = +[CRCarPlayCapabilities capabilitiesIdentifier];

    uint64_t v5 = (void *)v6;
  }
  if (v5 && ([v5 isEqualToString:@"CarCapabilitiesDefaultIdentifier"] & 1) == 0)
  {
    [a1 invalidateCarPlayCapabilitiesCache];
    int v7 = +[CRCarPlayCapabilities fetchCarCapabilities];
    unint64_t v8 = [v7 version];
    if (v8
      && ([v7 version],
          BOOL v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 integerValue],
          uint64_t v11 = [@"5" integerValue],
          v9,
          v8,
          v10 > v11))
    {
      uint64_t v12 = CarGeneralLogging();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "+[CRCarPlayCapabilities waitForCarCapabilitiesValuesWithReply:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v7;
        _os_log_impl(&dword_1ABB00000, v12, OS_LOG_TYPE_DEFAULT, "%s: CarCapabilities available for current session: %@", buf, 0x16u);
      }

      if (!v4) {
        goto LABEL_13;
      }
      id v13 = [v7 dictionaryRepresentation];
      v4[2](v4, v13, 0);
    }
    else
    {
      NSRect v24 = [MEMORY[0x1E4F1C9C8] date];
      CGFloat v14 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0327300];
      double v15 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_opt_class();
      uint64_t v23 = objc_opt_class();
      CGFloat v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, v23, objc_opt_class(), 0);
      [v14 setClasses:v18 forSelector:sel_requestCarCapabilitiesStatus_withReply_ argumentIndex:0 ofReply:1];

      uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.carkit.app.service" options:4096];
      [v19 setRemoteObjectInterface:v14];
      [v19 resume];
      CGFloat v20 = [v19 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_147_0];
      CGFloat v35 = @"CRCarPlayCapabilitiesIdentifierKey";
      v36[0] = v5;
      CGFloat v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      double v32 = __Block_byref_object_copy__5;
      CGFloat v33 = __Block_byref_object_dispose__5;
      id v34 = 0;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __63__CRCarPlayCapabilities_waitForCarCapabilitiesValuesWithReply___block_invoke_148;
      v25[3] = &unk_1E5E3BBF0;
      CGFloat v29 = buf;
      id v30 = a1;
      double v28 = v4;
      id v13 = v24;
      id v26 = v13;
      id v22 = v19;
      id v27 = v22;
      [v20 requestCarCapabilitiesStatus:v21 withReply:v25];

      _Block_object_dispose(buf, 8);
    }

LABEL_13:
  }
}

void __63__CRCarPlayCapabilities_waitForCarCapabilitiesValuesWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __63__CRCarPlayCapabilities_waitForCarCapabilitiesValuesWithReply___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __63__CRCarPlayCapabilities_waitForCarCapabilitiesValuesWithReply___block_invoke_148(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __63__CRCarPlayCapabilities_waitForCarCapabilitiesValuesWithReply___block_invoke_148_cold_1();
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    objc_msgSend(*(id *)(a1 + 64), "setCarPlayCapabilitiesCache:");
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    int v7 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) dictionaryRepresentation];
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
  }
  unint64_t v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
      BOOL v9 = @"Found";
    }
    else {
      BOOL v9 = @"Did not find";
    }
    [*(id *)(a1 + 32) timeIntervalSinceNow];
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    int v12 = 136315906;
    id v13 = "+[CRCarPlayCapabilities waitForCarCapabilitiesValuesWithReply:]_block_invoke";
    __int16 v14 = 2112;
    double v15 = v9;
    __int16 v16 = 2048;
    double v17 = fabs(v10);
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    _os_log_impl(&dword_1ABB00000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@ capabilities values after waiting %f s: %@", (uint8_t *)&v12, 0x2Au);
  }

  [*(id *)(a1 + 40) invalidate];
}

+ (void)invalidateCarPlayCapabilitiesCache
{
  id obj = a1;
  objc_sync_enter(obj);
  id v2 = (void *)sCRCarPlayCapabilitiesCache;
  sCRCarPlayCapabilitiesCache = 0;

  objc_sync_exit(obj);
}

+ (void)setCarPlayCapabilitiesCache:(id)a3
{
  id v9 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  uint64_t v5 = [v9 version];
  uint64_t v6 = [v5 integerValue];

  if (v6 >= 1)
  {
    uint64_t v7 = [v9 copy];
    unint64_t v8 = (void *)sCRCarPlayCapabilitiesCache;
    sCRCarPlayCapabilitiesCache = v7;
  }
  objc_sync_exit(v4);
}

+ (id)carPlayCapabilitiesCache
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = (id)sCRCarPlayCapabilitiesCache;
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)disabledFeature
{
  return self->_disabledFeature;
}

- (void)setDisabledFeature:(unint64_t)a3
{
  self->_disabledFeature = a3;
}

- (int64_t)nowPlayingAlbumArtMode
{
  return self->_nowPlayingAlbumArtMode;
}

- (void)setNowPlayingAlbumArtMode:(int64_t)a3
{
  self->_int64_t nowPlayingAlbumArtMode = a3;
}

- (NSValue)viewAreaInsets
{
  return self->_viewAreaInsets;
}

- (void)setViewAreaInsets:(id)a3
{
}

- (NSValue)dashboardRoundedCorners
{
  return self->_dashboardRoundedCorners;
}

- (void)setDashboardRoundedCorners:(id)a3
{
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_int64_t userInterfaceStyle = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (BOOL)persisted
{
  return self->_persisted;
}

- (void)setPersisted:(BOOL)a3
{
  self->_persisted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_dashboardRoundedCorners, 0);
  objc_storeStrong((id *)&self->_viewAreaInsets, 0);
}

+ (void)capabilitiesIdentifier
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_3(&dword_1ABB00000, v0, v1, "%s: returning capabilities identifier %@", (uint8_t *)v2);
}

+ (void)setCapabilitiesIdentifier:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_3(&dword_1ABB00000, v0, v1, "%s: setting capabilities identifier %@", (uint8_t *)v2);
}

+ (void)fetchCarCapabilities
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = [NSNumber numberWithInt:getpid()];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  OUTLINED_FUNCTION_2_3(&dword_1ABB00000, a2, v5, "CarCapabilities: fetched car capabilities for pid %@: %@", (uint8_t *)&v6);
}

+ (void)newCapabilitiesFromGlobalDomain
{
  CFStringRef v0 = [NSNumber numberWithInt:getpid()];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_2(&dword_1ABB00000, v1, v2, "%s: retrieved car capabilities from global domain for identifier %@: %@ (%@)", v3, v4, v5, v6, 2u);
}

void __63__CRCarPlayCapabilities_waitForCarCapabilitiesValuesWithReply___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_ERROR, "CRCarPlayAppService error: %@", (uint8_t *)&v2, 0xCu);
}

void __63__CRCarPlayCapabilities_waitForCarCapabilitiesValuesWithReply___block_invoke_148_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_3(&dword_1ABB00000, v0, v1, "%s: requestCarCapabilitiesStatus service did reply. capabilities = %@", (uint8_t *)v2);
}

@end