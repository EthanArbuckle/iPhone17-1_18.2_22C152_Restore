@interface ARParentImageSensorSettings
- (ARParentImageSensorSettings)init;
- (BOOL)allowCameraInMultipleForegroundAppLayout;
- (BOOL)audioCaptureEnabled;
- (BOOL)isEqual:(id)a3;
- (NSArray)settings;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAllowCameraInMultipleForegroundAppLayout:(BOOL)a3;
- (void)setAudioCaptureEnabled:(BOOL)a3;
- (void)setSettings:(id)a3;
@end

@implementation ARParentImageSensorSettings

- (ARParentImageSensorSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)ARParentImageSensorSettings;
  v2 = [(ARParentImageSensorSettings *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    settings = v2->_settings;
    v2->_settings = (NSArray *)v3;
  }
  return v2;
}

- (NSArray)settings
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_settings copyItems:1];
  return (NSArray *)v2;
}

- (void)setSettings:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  objc_super v6 = (NSArray *)[[v4 alloc] initWithArray:v5 copyItems:1];

  settings = self->_settings;
  self->_settings = v6;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  if ([v6 isMemberOfClass:objc_opt_class()])
  {
    id v7 = v6;
    v8 = [(ARParentImageSensorSettings *)self settings];
    v9 = [v7 settings];
    if (v8 == v9
      || ([(ARParentImageSensorSettings *)self settings],
          uint64_t v3 = objc_claimAutoreleasedReturnValue(),
          [v7 settings],
          v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      int v11 = [(ARParentImageSensorSettings *)self allowCameraInMultipleForegroundAppLayout];
      if (v11 == [v7 allowCameraInMultipleForegroundAppLayout])
      {
        BOOL v12 = [(ARParentImageSensorSettings *)self audioCaptureEnabled];
        int v10 = v12 ^ [v7 audioCaptureEnabled] ^ 1;
      }
      else
      {
        LOBYTE(v10) = 0;
      }
      if (v8 == v9) {
        goto LABEL_11;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  LOBYTE(v10) = 0;
LABEL_12:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setSettings:self->_settings];
  v4[8] = self->_audioCaptureEnabled;
  v4[9] = self->_allowCameraInMultipleForegroundAppLayout;
  return v4;
}

- (BOOL)audioCaptureEnabled
{
  return self->_audioCaptureEnabled;
}

- (void)setAudioCaptureEnabled:(BOOL)a3
{
  self->_audioCaptureEnabled = a3;
}

- (BOOL)allowCameraInMultipleForegroundAppLayout
{
  return self->_allowCameraInMultipleForegroundAppLayout;
}

- (void)setAllowCameraInMultipleForegroundAppLayout:(BOOL)a3
{
  self->_allowCameraInMultipleForegroundAppLayout = a3;
}

- (void).cxx_destruct
{
}

@end