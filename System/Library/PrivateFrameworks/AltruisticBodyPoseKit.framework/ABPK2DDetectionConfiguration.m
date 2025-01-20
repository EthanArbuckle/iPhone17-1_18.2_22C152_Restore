@interface ABPK2DDetectionConfiguration
- (ABPK2DDetectionConfiguration)initWithAlgorithmMode:(int64_t)a3;
- (ABPK2DDetectionConfiguration)initWithAlgorithmMode:(int64_t)a3 abpkDeviceOrientation:(int64_t)a4;
- (BOOL)deviceANEVersionPriorOrEqualToH12;
- (NSString)deviceANEVersion;
- (int64_t)abpkDeviceOrientation;
- (int64_t)algMode;
- (int64_t)deviceType;
- (void)setAbpkDeviceOrientation:(int64_t)a3;
- (void)setDeviceType:(int64_t)a3;
@end

@implementation ABPK2DDetectionConfiguration

- (ABPK2DDetectionConfiguration)initWithAlgorithmMode:(int64_t)a3
{
  self->_abpkDeviceOrientation = 3;
  v15.receiver = self;
  v15.super_class = (Class)ABPK2DDetectionConfiguration;
  v4 = [(ABPK2DDetectionConfiguration *)&v15 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_16;
  }
  v4->_int64_t algMode = a3;
  int v6 = determineDeviceANEVersionPriorOrEqualToH12();
  v5->_deviceANEVersionPriorOrEqualToH12 = v6;
  int64_t algMode = v5->_algMode;
  if (algMode == 2) {
    int v8 = v6;
  }
  else {
    int v8 = 0;
  }
  if (v8 == 1)
  {
    v9 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v14[0] = 0;
      v10 = " Breakthrough Gesture mode not supported on this device ";
LABEL_14:
      _os_log_impl(&dword_21B7C6000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)v14, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  int v11 = algMode ? 0 : v6;
  if (v11 != 1)
  {
LABEL_16:
    v12 = v5;
    goto LABEL_17;
  }
  v9 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v14[0] = 0;
    v10 = " Gesture Detection mode not supported on this device ";
    goto LABEL_14;
  }
LABEL_15:

  v12 = 0;
LABEL_17:

  return v12;
}

- (ABPK2DDetectionConfiguration)initWithAlgorithmMode:(int64_t)a3 abpkDeviceOrientation:(int64_t)a4
{
  result = [(ABPK2DDetectionConfiguration *)self initWithAlgorithmMode:a3];
  if (result) {
    result->_abpkDeviceOrientation = a4;
  }
  return result;
}

- (int64_t)algMode
{
  return self->_algMode;
}

- (int64_t)abpkDeviceOrientation
{
  return self->_abpkDeviceOrientation;
}

- (void)setAbpkDeviceOrientation:(int64_t)a3
{
  self->_abpkDeviceOrientation = a3;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (NSString)deviceANEVersion
{
  return self->_deviceANEVersion;
}

- (BOOL)deviceANEVersionPriorOrEqualToH12
{
  return self->_deviceANEVersionPriorOrEqualToH12;
}

- (void).cxx_destruct
{
}

@end