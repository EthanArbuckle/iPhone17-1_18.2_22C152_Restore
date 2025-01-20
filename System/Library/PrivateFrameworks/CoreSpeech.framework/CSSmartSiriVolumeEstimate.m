@interface CSSmartSiriVolumeEstimate
+ (BOOL)supportsSecureCoding;
- (CSSmartSiriVolumeEstimate)initWithCoder:(id)a3;
- (CSSmartSiriVolumeEstimate)initWithVolumeEstimate:(float)a3 debugLogFile:(id)a4;
- (NSString)debugLogPath;
- (float)volumeEstimate;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CSSmartSiriVolumeEstimate

- (void).cxx_destruct
{
}

- (NSString)debugLogPath
{
  return self->_debugLogPath;
}

- (float)volumeEstimate
{
  return self->_volumeEstimate;
}

- (void)encodeWithCoder:(id)a3
{
  float volumeEstimate = self->_volumeEstimate;
  id v7 = a3;
  *(float *)&double v5 = volumeEstimate;
  v6 = +[NSNumber numberWithFloat:v5];
  [v7 encodeObject:v6 forKey:@"estimatedTTSVolume"];

  [v7 encodeObject:self->_debugLogPath forKey:@"debugLogPath"];
}

- (CSSmartSiriVolumeEstimate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSSmartSiriVolumeEstimate;
  double v5 = [(CSSmartSiriVolumeEstimate *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"estimatedTTSVolume"];
    [v6 floatValue];
    v5->_float volumeEstimate = v7;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"debugLogPath"];
    debugLogPath = v5->_debugLogPath;
    v5->_debugLogPath = (NSString *)v8;
  }
  return v5;
}

- (CSSmartSiriVolumeEstimate)initWithVolumeEstimate:(float)a3 debugLogFile:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CSSmartSiriVolumeEstimate;
  uint64_t v8 = [(CSSmartSiriVolumeEstimate *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_float volumeEstimate = a3;
    objc_storeStrong((id *)&v8->_debugLogPath, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end