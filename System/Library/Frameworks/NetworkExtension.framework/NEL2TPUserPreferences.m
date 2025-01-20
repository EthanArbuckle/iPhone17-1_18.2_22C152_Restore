@interface NEL2TPUserPreferences
+ (SCNetworkConnectionRef)createConnectionForConfiguration:(uint64_t)a1;
+ (void)clearCurrentForConfiguration:(uint64_t)a1;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isCurrent;
- (BOOL)isForced;
- (NEL2TPUserPreferences)initWithConfiguration:(id)a3;
- (NEVPNProtocolL2TP)settings;
- (NSString)identifier;
- (NSString)name;
- (void)dealloc;
- (void)setCurrent:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setSettings:(id)a3;
@end

@implementation NEL2TPUserPreferences

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isForced
{
  return self->_forced;
}

- (void)setCurrent:(BOOL)a3
{
  self->_current = a3;
}

- (BOOL)isCurrent
{
  return self->_current;
}

- (void)setSettings:(id)a3
{
}

- (NEVPNProtocolL2TP)settings
{
  return (NEVPNProtocolL2TP *)objc_getProperty(self, a2, 32, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEL2TPUserPreferences *)self name];
  if (v5
    && (v6 = (void *)v5,
        [(NEL2TPUserPreferences *)self name],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 length],
        v7,
        v6,
        v8))
  {
    BOOL v9 = 1;
  }
  else
  {
    [v4 addObject:@"L2TP user preferences has no name"];
    BOOL v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  v2 = self;
  if (self) {
    self = (NEL2TPUserPreferences *)self->_userPrefs;
  }
  CFRelease(self);
  v3.receiver = v2;
  v3.super_class = (Class)NEL2TPUserPreferences;
  [(NEL2TPUserPreferences *)&v3 dealloc];
}

- (NEL2TPUserPreferences)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NEL2TPUserPreferences;
  uint64_t v5 = [(NEL2TPUserPreferences *)&v11 init];
  if (v5)
  {
    SCNetworkConnectionRef v6 = +[NEL2TPUserPreferences createConnectionForConfiguration:]((uint64_t)NEL2TPUserPreferences, v4);
    v5->_userPrefs = (__SCUserPreferencesRef *)SCNetworkConnectionCreateUserPreferences();
    CFRelease(v6);
    if (!v5->_userPrefs)
    {
      BOOL v9 = 0;
      goto LABEL_6;
    }
    uint64_t v7 = SCUserPreferencesGetUniqueID();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;
  }
  BOOL v9 = v5;
LABEL_6:

  return v9;
}

+ (SCNetworkConnectionRef)createConnectionForConfiguration:(uint64_t)a1
{
  id v2 = a2;
  self;
  objc_super v3 = [v2 identifier];

  id v4 = [v3 UUIDString];

  SCNetworkConnectionRef v5 = SCNetworkConnectionCreateWithServiceID((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4, 0, 0);
  return v5;
}

+ (void)clearCurrentForConfiguration:(uint64_t)a1
{
  id v2 = a2;
  self;
  SCNetworkConnectionRef v3 = +[NEL2TPUserPreferences createConnectionForConfiguration:]((uint64_t)NEL2TPUserPreferences, v2);

  UserPreferences = (const void *)SCNetworkConnectionCreateUserPreferences();
  SCUserPreferencesSetCurrent();
  SCUserPreferencesRemove();
  CFRelease(UserPreferences);

  CFRelease(v3);
}

@end