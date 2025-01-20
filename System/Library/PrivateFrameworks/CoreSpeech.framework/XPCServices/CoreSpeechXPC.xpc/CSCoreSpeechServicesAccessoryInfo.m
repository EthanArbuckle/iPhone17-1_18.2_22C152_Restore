@interface CSCoreSpeechServicesAccessoryInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)supportsAlwaysOnAccelerometer;
- (BOOL)supportsJustSiri;
- (CSCoreSpeechServicesAccessoryInfo)init;
- (CSCoreSpeechServicesAccessoryInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSupportsAlwaysOnAccelerometer:(BOOL)a3;
- (void)setSupportsJustSiri:(BOOL)a3;
@end

@implementation CSCoreSpeechServicesAccessoryInfo

- (void)setSupportsAlwaysOnAccelerometer:(BOOL)a3
{
  self->_supportsAlwaysOnAccelerometer = a3;
}

- (BOOL)supportsAlwaysOnAccelerometer
{
  return self->_supportsAlwaysOnAccelerometer;
}

- (void)setSupportsJustSiri:(BOOL)a3
{
  self->_supportsJustSiri = a3;
}

- (BOOL)supportsJustSiri
{
  return self->_supportsJustSiri;
}

- (CSCoreSpeechServicesAccessoryInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSCoreSpeechServicesAccessoryInfo;
  v5 = [(CSCoreSpeechServicesAccessoryInfo *)&v7 init];
  if (v5)
  {
    v5->_supportsJustSiri = [v4 decodeBoolForKey:@"sJS"];
    v5->_supportsAlwaysOnAccelerometer = [v4 decodeBoolForKey:@"sAlwaysOnAccelerometer"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL supportsJustSiri = self->_supportsJustSiri;
  id v5 = a3;
  [v5 encodeBool:supportsJustSiri forKey:@"sJS"];
  [v5 encodeBool:self->_supportsAlwaysOnAccelerometer forKey:@"sAlwaysOnAccelerometer"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CSCoreSpeechServicesAccessoryInfo);
  [(CSCoreSpeechServicesAccessoryInfo *)v4 setSupportsJustSiri:self->_supportsJustSiri];
  [(CSCoreSpeechServicesAccessoryInfo *)v4 setSupportsAlwaysOnAccelerometer:self->_supportsAlwaysOnAccelerometer];
  return v4;
}

- (id)description
{
  v8[0] = @"sJS";
  v3 = +[NSNumber numberWithBool:self->_supportsJustSiri];
  v8[1] = @"sAlwaysOnAccelerometer";
  v9[0] = v3;
  id v4 = +[NSNumber numberWithBool:self->_supportsAlwaysOnAccelerometer];
  v9[1] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  v6 = [v5 description];

  return v6;
}

- (CSCoreSpeechServicesAccessoryInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSCoreSpeechServicesAccessoryInfo;
  result = [(CSCoreSpeechServicesAccessoryInfo *)&v3 init];
  if (result) {
    result->_BOOL supportsJustSiri = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end