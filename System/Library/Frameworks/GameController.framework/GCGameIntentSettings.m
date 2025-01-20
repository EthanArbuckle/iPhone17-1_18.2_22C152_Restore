@interface GCGameIntentSettings
+ (BOOL)supportsSecureCoding;
+ (id)appLibrarySettings:(BOOL)a3 appLibraryPod:(int64_t)a4;
+ (id)gameSettings:(BOOL)a3 gameBundleID:(id)a4;
+ (id)homeScreenSettings:(BOOL)a3;
- (BOOL)enabled;
- (GCGameIntentSettings)init;
- (GCGameIntentSettings)initWithCoder:(id)a3;
- (NSString)gameBundleID;
- (int64_t)appLibraryPod;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAppLibraryPod:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGameBundleID:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation GCGameIntentSettings

+ (id)homeScreenSettings:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = objc_alloc_init(GCGameIntentSettings);
  [(GCGameIntentSettings *)v4 setType:0];
  [(GCGameIntentSettings *)v4 setEnabled:v3];

  return v4;
}

+ (id)gameSettings:(BOOL)a3 gameBundleID:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v6 = objc_alloc_init(GCGameIntentSettings);
  [(GCGameIntentSettings *)v6 setType:1];
  [(GCGameIntentSettings *)v6 setEnabled:v4];
  [(GCGameIntentSettings *)v6 setGameBundleID:v5];

  return v6;
}

+ (id)appLibrarySettings:(BOOL)a3 appLibraryPod:(int64_t)a4
{
  BOOL v5 = a3;
  v6 = objc_alloc_init(GCGameIntentSettings);
  [(GCGameIntentSettings *)v6 setType:2];
  [(GCGameIntentSettings *)v6 setEnabled:v5];
  [(GCGameIntentSettings *)v6 setAppLibraryPod:a4];

  return v6;
}

- (GCGameIntentSettings)init
{
  v3.receiver = self;
  v3.super_class = (Class)GCGameIntentSettings;
  result = [(GCGameIntentSettings *)&v3 init];
  if (result)
  {
    result->_type = 2;
    result->_enabled = 0;
    result->_appLibraryPod = 0;
  }
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)gameBundleID
{
  return self->_gameBundleID;
}

- (void)setGameBundleID:(id)a3
{
}

- (int64_t)appLibraryPod
{
  return self->_appLibraryPod;
}

- (void)setAppLibraryPod:(int64_t)a3
{
  self->_appLibraryPod = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGameIntentSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCGameIntentSettings;
  BOOL v5 = [(GCGameIntentSettings *)&v9 init];
  if (v5)
  {
    v5->_type = [v4 decodeInt64ForKey:@"_type"];
    v5->_enabled = [v4 decodeBoolForKey:@"_enabled"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_gameBundleID"];
    gameBundleID = v5->_gameBundleID;
    v5->_gameBundleID = (NSString *)v6;

    v5->_appLibraryPod = [v4 decodeInt64ForKey:@"_appLibraryPod"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInt64:type forKey:@"_type"];
  [v5 encodeBool:self->_enabled forKey:@"_enabled"];
  [v5 encodeObject:self->_gameBundleID forKey:@"_gameBundleID"];
  [v5 encodeInt64:self->_appLibraryPod forKey:@"_appLibraryPod"];
}

@end