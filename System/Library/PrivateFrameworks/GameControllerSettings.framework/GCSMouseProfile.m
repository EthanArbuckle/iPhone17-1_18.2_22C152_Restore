@interface GCSMouseProfile
+ (BOOL)supportsSecureCoding;
+ (id)defaultIdentifier;
+ (id)newDefaultProfile;
- (BOOL)useLinearTracking;
- (GCSJSONObject)jsonObject;
- (GCSMouseProfile)init;
- (GCSMouseProfile)initWithBundleIdentifier:(id)a3 trackingSpeed:(double)a4 useLinearTracking:(BOOL)a5;
- (GCSMouseProfile)initWithCoder:(id)a3;
- (GCSMouseProfile)initWithJSONObject:(id)a3;
- (NSString)bundleIdentifier;
- (double)trackingSpeed;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setTrackingSpeed:(double)a3;
@end

@implementation GCSMouseProfile

- (GCSMouseProfile)init
{
  id v2 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"abstract method" userInfo:0];
  objc_exception_throw(v2);
}

- (GCSMouseProfile)initWithBundleIdentifier:(id)a3 trackingSpeed:(double)a4 useLinearTracking:(BOOL)a5
{
  id v8 = a3;
  if ([v8 length]
    && (v14.receiver = self,
        v14.super_class = (Class)GCSMouseProfile,
        (self = [(GCSMouseProfile *)&v14 init]) != 0))
  {
    v9 = (NSString *)[v8 copy];
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v9;

    double v11 = -1.0;
    if (a4 > 0.0) {
      double v11 = a4;
    }
    self->_trackingSpeed = v11;
    self->_useLinearTracking = a5;
    self = self;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [GCSMouseProfile alloc];
  bundleIdentifier = self->_bundleIdentifier;
  double trackingSpeed = self->_trackingSpeed;
  BOOL useLinearTracking = self->_useLinearTracking;
  return [(GCSMouseProfile *)v4 initWithBundleIdentifier:bundleIdentifier trackingSpeed:useLinearTracking useLinearTracking:trackingSpeed];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSMouseProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GCSMouseProfile;
  v5 = [(GCSMouseProfile *)&v11 init];
  if (v5
    && ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        bundleIdentifier = v5->_bundleIdentifier,
        v5->_bundleIdentifier = (NSString *)v6,
        bundleIdentifier,
        v5->_bundleIdentifier))
  {
    [v4 decodeDoubleForKey:@"trackingSpeed"];
    if (v8 <= 0.0) {
      double v8 = -1.0;
    }
    v5->_double trackingSpeed = v8;
    v5->_BOOL useLinearTracking = [v4 decodeBoolForKey:@"useLinearTracking"];
    v9 = v5;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  if (self->_trackingSpeed > 0.0)
  {
    id v4 = +[NSNumber numberWithDouble:](&off_26D32C058, "numberWithDouble:");
    [v5 encodeObject:v4 forKey:@"trackingSpeed"];
  }
  [v5 encodeBool:self->_useLinearTracking forKey:@"trackingSpeed"];
}

- (GCSMouseProfile)initWithJSONObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  v12.receiver = self;
  v12.super_class = (Class)GCSMouseProfile;
  self = [(GCSMouseProfile *)&v12 init];
  if (!self) {
    goto LABEL_7;
  }
  objc_msgSend(v4, "_gcs_stringForJSONKey:", @"_bundleIdentifier");
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v5;

  if (self->_bundleIdentifier)
  {
    v7 = objc_msgSend(v4, "_gcs_numberForJSONKey:", @"_trackingSpeed");
    [v7 doubleValue];
    self->_double trackingSpeed = v8;

    if (self->_trackingSpeed <= 0.0) {
      self->_double trackingSpeed = -1.0;
    }
    v9 = objc_msgSend(v4, "_gcs_numberForJSONKey:", @"_useLinearTracking");
    self->_BOOL useLinearTracking = [v9 BOOLValue];

    self = self;
    v10 = self;
  }
  else
  {
LABEL_7:
    v10 = 0;
  }

  return v10;
}

- (GCSJSONObject)jsonObject
{
  v3 = objc_opt_new();
  [v3 setObject:self->_bundleIdentifier forKeyedSubscript:@"_bundleIdentifier"];
  if (self->_trackingSpeed > 0.0)
  {
    id v4 = +[NSNumber numberWithDouble:](&off_26D32C058, "numberWithDouble:");
    [v3 setObject:v4 forKeyedSubscript:@"_trackingSpeed"];
  }
  id v5 = +[NSNumber numberWithBool:self->_useLinearTracking];
  [v3 setObject:v5 forKeyedSubscript:@"_useLinearTracking"];

  uint64_t v6 = (void *)[v3 copy];
  return (GCSJSONObject *)v6;
}

- (void)setTrackingSpeed:(double)a3
{
  if (a3 <= 0.0) {
    a3 = -1.0;
  }
  self->_double trackingSpeed = a3;
}

+ (id)defaultIdentifier
{
  return @"com.apple.default";
}

+ (id)newDefaultProfile
{
  id v2 = [GCSMouseProfile alloc];
  v3 = +[GCSMouseProfile defaultIdentifier];
  id v4 = [(GCSMouseProfile *)v2 initWithBundleIdentifier:v3 trackingSpeed:0 useLinearTracking:-1.0];

  return v4;
}

- (double)trackingSpeed
{
  return self->_trackingSpeed;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)useLinearTracking
{
  return self->_useLinearTracking;
}

- (void).cxx_destruct
{
}

@end