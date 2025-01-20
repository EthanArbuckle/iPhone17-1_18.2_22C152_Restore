@interface LNEnvironment
+ (BOOL)supportsSecureCoding;
+ (LNEnvironment)defaultEnvironment;
- (BOOL)locationAuthorizationStatusForBundleIdentifier:(id)a3;
- (CLLocation)currentLocation;
- (LNEnvironment)initWithCoder:(id)a3;
- (LNEnvironment)initWithLocaleIdentifier:(id)a3;
- (NSCalendar)calendar;
- (NSMutableDictionary)locationAuthorizationStatus;
- (NSString)localeIdentifier;
- (NSTimeZone)timeZone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)trimLocation:(id)a3 atKeyPath:(id)a4 againstTCCWithBundleIdentifier:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setCurrentLocation:(id)a3;
- (void)setLocationAuthorizationStatus:(id)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation LNEnvironment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationAuthorizationStatus, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

- (void)setLocationAuthorizationStatus:(id)a3
{
}

- (NSMutableDictionary)locationAuthorizationStatus
{
  return self->_locationAuthorizationStatus;
}

- (void)setCalendar:(id)a3
{
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCurrentLocation:(id)a3
{
}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setTimeZone:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (LNEnvironment)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localeIdentifier"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentLocation"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"calendar"];
    self = [(LNEnvironment *)self initWithLocaleIdentifier:v5];
    [(LNEnvironment *)self setTimeZone:v6];
    [(LNEnvironment *)self setCurrentLocation:v7];
    [(LNEnvironment *)self setCalendar:v8];

    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNEnvironment *)self localeIdentifier];
  [v4 encodeObject:v5 forKey:@"localeIdentifier"];

  v6 = [(LNEnvironment *)self timeZone];
  [v4 encodeObject:v6 forKey:@"timeZone"];

  v7 = [(LNEnvironment *)self calendar];
  [v4 encodeObject:v7 forKey:@"calendar"];

  id v16 = v4;
  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = v16;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;

  v10 = [v9 userInfo];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  id v12 = v11;

  v13 = [(LNEnvironment *)self currentLocation];
  if (v9)
  {
    v14 = [v12 objectForKeyedSubscript:@"bundleIdentifier"];
    v15 = [(LNEnvironment *)self trimLocation:v13 atKeyPath:@"currentLocation" againstTCCWithBundleIdentifier:v14];
    [v16 encodeObject:v15 forKey:@"currentLocation"];
  }
  else
  {
    [v16 encodeObject:v13 forKey:@"currentLocation"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [LNEnvironment alloc];
  v5 = [(LNEnvironment *)self localeIdentifier];
  v6 = [(LNEnvironment *)v4 initWithLocaleIdentifier:v5];

  v7 = [(LNEnvironment *)self timeZone];
  [(LNEnvironment *)v6 setTimeZone:v7];

  v8 = [(LNEnvironment *)self currentLocation];
  [(LNEnvironment *)v6 setCurrentLocation:v8];

  id v9 = [(LNEnvironment *)self calendar];
  [(LNEnvironment *)v6 setCalendar:v9];

  v10 = [(LNEnvironment *)self locationAuthorizationStatus];
  v11 = (void *)[v10 mutableCopy];
  [(LNEnvironment *)v6 setLocationAuthorizationStatus:v11];

  return v6;
}

- (BOOL)locationAuthorizationStatusForBundleIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!+[LNEntitlementsValidator validateEntitlement:forCurrentTaskWithValidator:](LNEntitlementsValidator, "validateEntitlement:forCurrentTaskWithValidator:", @"com.apple.locationd.effective_bundle", &__block_literal_global_23)|| !+[LNEntitlementsValidator validateEntitlement:@"com.apple.security.exception.mach-lookup.global-name" forCurrentTaskWithValidator:&__block_literal_global_28])
  {
    v6 = getLNLogCategorySecurity();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      goto LABEL_8;
    }
LABEL_9:
    char v3 = 0;
    goto LABEL_10;
  }
  unsigned int v5 = [MEMORY[0x1E4F1E600] authorizationStatusForBundleIdentifier:v4];
  if (v5 < 3)
  {
    v6 = getLNLogCategorySecurity();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11) = 0;
      v7 = "Removing location value because of TCC";
      v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
LABEL_8:
      _os_log_impl(&dword_1A4419000, v8, v9, v7, (uint8_t *)&v11, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (v5 - 3 > 1) {
    goto LABEL_11;
  }
  v6 = getLNLogCategorySecurity();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138543362;
    id v12 = v4;
    _os_log_impl(&dword_1A4419000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ is authorized to access location", (uint8_t *)&v11, 0xCu);
  }
  char v3 = 1;
LABEL_10:

LABEL_11:
  return v3 & 1;
}

uint64_t __64__LNEnvironment_locationAuthorizationStatusForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v3 = v2;
    }
    else {
      char v3 = 0;
    }
  }
  else
  {
    char v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = [v4 containsObject:@"com.apple.locationd.synchronous"];

  return v5;
}

BOOL __64__LNEnvironment_locationAuthorizationStatusForBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

- (id)trimLocation:(id)a3 atKeyPath:(id)a4 againstTCCWithBundleIdentifier:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"LNEnvironment.m", 53, @"Invalid parameter not satisfying: %@", @"keyPath" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_17:
    id v17 = 0;
    goto LABEL_18;
  }
  if (!v9) {
    goto LABEL_17;
  }
LABEL_3:
  id v12 = getLNLogCategorySecurity();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v10;
  }

  if (v11)
  {
    uint64_t v13 = [(LNEnvironment *)self locationAuthorizationStatus];
    v14 = [v13 objectForKeyedSubscript:v11];

    if (!v14)
    {
      v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[LNEnvironment locationAuthorizationStatusForBundleIdentifier:](self, "locationAuthorizationStatusForBundleIdentifier:", v11));
      v15 = [(LNEnvironment *)self locationAuthorizationStatus];
      [v15 setObject:v14 forKeyedSubscript:v11];
    }
    if ([v14 BOOLValue]) {
      id v16 = v9;
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;
  }
  else
  {
    v14 = getLNLogCategorySecurity();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4419000, v14, OS_LOG_TYPE_ERROR, "Removing location because the bundle identifier is not defined", buf, 2u);
    }
    id v17 = 0;
  }

LABEL_18:
  return v17;
}

- (LNEnvironment)initWithLocaleIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"LNEnvironment.m", 28, @"Invalid parameter not satisfying: %@", @"localeIdentifier" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)LNEnvironment;
  v6 = [(LNEnvironment *)&v14 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    localeIdentifier = v6->_localeIdentifier;
    v6->_localeIdentifier = (NSString *)v7;

    id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    locationAuthorizationStatus = v6->_locationAuthorizationStatus;
    v6->_locationAuthorizationStatus = v9;

    id v11 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (LNEnvironment)defaultEnvironment
{
  if (defaultEnvironment_onceToken != -1) {
    dispatch_once(&defaultEnvironment_onceToken, &__block_literal_global_3567);
  }
  id v2 = (void *)defaultEnvironment_defaultEnvironment;
  return (LNEnvironment *)v2;
}

uint64_t __35__LNEnvironment_defaultEnvironment__block_invoke()
{
  defaultEnvironment_defaultEnvironment = [[LNEnvironment alloc] initWithLocaleIdentifier:@"en"];
  return MEMORY[0x1F41817F8]();
}

@end