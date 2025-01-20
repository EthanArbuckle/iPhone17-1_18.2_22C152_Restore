@interface ARDepthSensorSettings
- (ARDepthSensorSettings)initWithVideoFormat:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)timeOfFlightProjectorMode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setTimeOfFlightProjectorMode:(id)a3;
@end

@implementation ARDepthSensorSettings

- (ARDepthSensorSettings)initWithVideoFormat:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)ARDepthSensorSettings;
  v3 = [(ARImageSensorSettings *)&v15 initWithVideoFormat:a3];
  if (v3)
  {
    int64_t v4 = +[ARKitUserDefaults integerForKey:@"com.apple.arkit.jasper.timeOfFlightProjectorMode"];
    v5 = @"ARTimeOfFlightProjectorModeNone";
    v6 = v5;
    unint64_t v7 = v4 - 1;
    v8 = v5;
    if (v7 <= 5)
    {
      v8 = v5;
      if ((0x27u >> v7))
      {
        v8 = *off_1E6185220[v7];
      }
    }
    if ([(__CFString *)v8 isEqualToString:v6])
    {
      v9 = @"ARTimeOfFlightProjectorModeNormalShortHybrid";

      v10 = _ARLogGeneral_0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        *(_DWORD *)buf = 138543874;
        v17 = v12;
        __int16 v18 = 2048;
        v19 = v3;
        __int16 v20 = 2114;
        v21 = v9;
        _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Invalid default for ARJasperTimeOfFlightProjectorMode, falling back to %{public}@", buf, 0x20u);
      }
    }
    else
    {
      v9 = v8;
    }
    timeOfFlightProjectorMode = v3->_timeOfFlightProjectorMode;
    v3->_timeOfFlightProjectorMode = &v9->isa;
  }
  return v3;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v7.receiver = self;
  v7.super_class = (Class)ARDepthSensorSettings;
  int64_t v4 = [(ARImageSensorSettings *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@", v4];

  [v5 appendFormat:@"TimeOfFlightProjectorMode: %@\n", self->_timeOfFlightProjectorMode];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARDepthSensorSettings;
  if ([(ARImageSensorSettings *)&v8 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [v4 timeOfFlightProjectorMode];
    char v6 = [v5 isEqualToString:self->_timeOfFlightProjectorMode];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ARDepthSensorSettings;
  v5 = -[ARImageSensorSettings copyWithZone:](&v9, sel_copyWithZone_);
  uint64_t v6 = [(NSString *)self->_timeOfFlightProjectorMode copyWithZone:a3];
  objc_super v7 = (void *)v5[9];
  v5[9] = v6;

  return v5;
}

- (NSString)timeOfFlightProjectorMode
{
  return self->_timeOfFlightProjectorMode;
}

- (void)setTimeOfFlightProjectorMode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end