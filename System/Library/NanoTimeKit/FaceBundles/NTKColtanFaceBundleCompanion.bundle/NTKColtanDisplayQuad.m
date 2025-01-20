@interface NTKColtanDisplayQuad
- (BOOL)isMasking;
- (BOOL)prepareForTime:(double)a3;
- (NSCalendar)calendar;
- (NSDate)overrideDate;
- (NTKColtanDisplayQuad)initWithRole:(unint64_t)a3 screenScale:(double)a4;
- (__n128)centerGlowColor;
- (__n128)hourHandInnerColor;
- (__n128)hourHandOuterColor;
- (__n128)minuteHandInnerColor;
- (__n128)minuteHandOuterColor;
- (__n128)secondHandColor;
- (float)maskRadius;
- (float)opacity;
- (float)tickColoration;
- (float)tickOpacity;
- (unint64_t)density;
- (unint64_t)quality;
- (unint64_t)role;
- (void)_significantTimeChanged;
- (void)_updateRendererHandAngles;
- (void)dealloc;
- (void)performOffscreenPassesWithCommandBuffer:(id)a3;
- (void)renderForDisplayWithEncoder:(id)a3;
- (void)setDensity:(unint64_t)a3;
- (void)setMaskRadius:(float)a3;
- (void)setMasking:(BOOL)a3;
- (void)setOpacity:(float)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setOverrideDate:(id)a3 hourRadians:(double)a4 minuteRadians:(double)a5 secondRadians:(double)a6;
- (void)setPalette:(id)a3;
- (void)setQuality:(unint64_t)a3;
- (void)setTickOpacity:(float)a3;
- (void)setupForQuadView:(id)a3;
@end

@implementation NTKColtanDisplayQuad

- (NTKColtanDisplayQuad)initWithRole:(unint64_t)a3 screenScale:(double)a4
{
  v16.receiver = self;
  v16.super_class = (Class)NTKColtanDisplayQuad;
  v6 = [(NTKColtanDisplayQuad *)&v16 init];
  v7 = v6;
  if (v6)
  {
    v6->_screenScale = a4;
    uint64_t v8 = +[CLKUIMetalResourceManager sharedDevice];
    device = v7->_device;
    v7->_device = (MTLDevice *)v8;

    uint64_t v10 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    calendar = v7->_calendar;
    v7->_calendar = (NSCalendar *)v10;

    v7->_role = a3;
    v7->_opacity = 1.0;
    v7->_quality = 0;
    uint64_t v12 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    mediaTimingFunction = v7->_mediaTimingFunction;
    v7->_mediaTimingFunction = (CAMediaTimingFunction *)v12;

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v7 selector:"_significantTimeChanged" name:UIApplicationSignificantTimeChangeNotification object:0];
  }
  return v7;
}

- (void)dealloc
{
  resourceManager = self->_resourceManager;
  if (resourceManager)
  {
    [(NTKColtanResourceManager *)resourceManager removeClient];
    v4 = self->_resourceManager;
    self->_resourceManager = 0;
  }
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:UIApplicationSignificantTimeChangeNotification object:0];

  v6.receiver = self;
  v6.super_class = (Class)NTKColtanDisplayQuad;
  [(NTKColtanDisplayQuad *)&v6 dealloc];
}

- (void)setPalette:(id)a3
{
  id v4 = a3;
  v5 = [v4 hourHandInnerColor];
  CLKUIConvertToRGBfFromUIColor();
  *(_OWORD *)self->_hourHandInnerColor = v6;

  v7 = [v4 hourHandOuterColor];
  CLKUIConvertToRGBfFromUIColor();
  *(_OWORD *)self->_hourHandOuterColor = v8;

  v9 = [v4 minuteHandInnerColor];
  CLKUIConvertToRGBfFromUIColor();
  *(_OWORD *)self->_minuteHandInnerColor = v10;

  v11 = [v4 minuteHandOuterColor];
  CLKUIConvertToRGBfFromUIColor();
  *(_OWORD *)self->_minuteHandOuterColor = v12;

  v13 = [v4 centerGlowColor];
  CLKUIConvertToRGBfFromUIColor();
  *(_OWORD *)self->_centerGlowColor = v14;

  v15 = [v4 secondHandColor];
  CLKUIConvertToRGBfFromUIColor();
  *(_OWORD *)self->_secondHandColor = v16;

  id v18 = [v4 tickColoration];

  [v18 floatValue];
  self->_tickColoration = v17;
}

- (void)setupForQuadView:(id)a3
{
  id v15 = a3;
  [v15 bounds];
  double v5 = v4;
  double v7 = v6;
  double screenScale = self->_screenScale;
  resourceManager = self->_resourceManager;
  if (resourceManager)
  {
    [(NTKColtanResourceManager *)resourceManager removeClient];
    long long v10 = self->_resourceManager;
    self->_resourceManager = 0;
  }
  +[NTKColtanResourceManager sharedInstanceWithPixelFormat:](NTKColtanResourceManager, "sharedInstanceWithPixelFormat:", [v15 colorPixelFormat]);
  v11 = (NTKColtanResourceManager *)objc_claimAutoreleasedReturnValue();
  long long v12 = self->_resourceManager;
  self->_resourceManager = v11;

  [(NTKColtanResourceManager *)self->_resourceManager addClient];
  v13 = -[NTKColtanRenderer initWithSize:]([NTKColtanRenderer alloc], "initWithSize:", v5 * screenScale, v7 * screenScale);
  renderer = self->_renderer;
  self->_renderer = v13;

  [(NTKColtanRenderer *)self->_renderer setResourceManager:self->_resourceManager];
  [v15 setPreferredFramesPerSecond:30];
}

- (BOOL)prepareForTime:(double)a3
{
  return ([(NTKColtanDisplayQuad *)self isOpaque] & 1) != 0 || self->_opacity > 0.0;
}

- (void)setDensity:(unint64_t)a3
{
  self->_density = a3;
}

- (void)_updateRendererHandAngles
{
  double v3 = CACurrentMediaTime();
  double endOverrideTime = self->_endOverrideTime;
  overrideDate = self->_overrideDate;
  if (v3 >= endOverrideTime)
  {
    if (!overrideDate)
    {
      long long v10 = +[NTKDate faceDate];
      NTKHourMinuteSecondAnglesForTime();

      float v7 = (float)0.0 / 6.2832;
      float v8 = v7;
      HIDWORD(v9) = 0;
      *(float *)&double v9 = v7;
      goto LABEL_10;
    }
  }
  else if (!overrideDate)
  {
    goto LABEL_6;
  }
  [(NTKColtanRenderer *)self->_renderer resetTemporalAccumulation];
  double endOverrideTime = self->_endOverrideTime;
LABEL_6:
  double v6 = (v3 - self->_startOverrideTime) / (endOverrideTime - self->_startOverrideTime);
  *(float *)&double v6 = v6;
  if (*(float *)&v6 > 1.0) {
    *(float *)&double v6 = 1.0;
  }
  [(CAMediaTimingFunction *)self->_mediaTimingFunction _solveForInput:v6];
  float v7 = self->_startSecondAngle + (float)((float)(self->_endSecondAngle - self->_startSecondAngle) * *(float *)&v9);
  float v8 = self->_startMinuteAngle + (float)((float)(self->_endMinuteAngle - self->_startMinuteAngle) * *(float *)&v9);
  *(float *)&double v9 = self->_startHourAngle + (float)((float)(self->_endHourAngle - self->_startHourAngle) * *(float *)&v9);
LABEL_10:
  *(float *)&double v9 = *(float *)&v9 * 6.2832;
  [(NTKColtanRenderer *)self->_renderer setHourAngle:v9];
  *(float *)&double v11 = v8 * 6.2832;
  [(NTKColtanRenderer *)self->_renderer setMinuteAngle:v11];
  *(float *)&double v12 = v7 * 6.2832;
  [(NTKColtanRenderer *)self->_renderer setSecondAngle:v12];
}

- (void)performOffscreenPassesWithCommandBuffer:(id)a3
{
}

- (void)renderForDisplayWithEncoder:(id)a3
{
}

- (void)setOverrideDate:(id)a3 hourRadians:(double)a4 minuteRadians:(double)a5 secondRadians:(double)a6
{
  id v12 = a3;
  if (v12)
  {
    objc_storeStrong((id *)&self->_overrideDate, a3);
    double v11 = CACurrentMediaTime();
    self->_startOverrideTime = v11;
    self->_double endOverrideTime = v11;
    *(float *)&double v11 = a6;
    *(float *)&double v11 = (float)(*(float *)&v11 / 6.2832) - floor((float)(*(float *)&v11 / 6.2832));
    self->_startSecondAngle = *(float *)&v11;
    self->_endSecondAngle = *(float *)&v11;
    *(float *)&double v11 = a5;
    *(float *)&double v11 = (float)(*(float *)&v11 / 6.2832) - floor((float)(*(float *)&v11 / 6.2832));
    self->_startMinuteAngle = *(float *)&v11;
    self->_endMinuteAngle = *(float *)&v11;
    *(float *)&double v11 = a4;
    *(float *)&double v11 = (float)(*(float *)&v11 / 6.2832) - floor((float)(*(float *)&v11 / 6.2832));
    self->_startHourAngle = *(float *)&v11;
    self->_endHourAngle = *(float *)&v11;
  }
  else
  {
    [(NTKColtanDisplayQuad *)self setOverrideDate:0 duration:0.0];
  }
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v7 = a3;
  p_overrideDate = &self->_overrideDate;
  if ((NTKEqualObjects() & 1) == 0)
  {
    uint64_t v9 = +[NTKDate faceDate];
    long long v10 = (void *)v9;
    double v11 = *p_overrideDate;
    if (!*p_overrideDate) {
      double v11 = (void *)v9;
    }
    id v12 = v11;
    if (v7)
    {
      id v13 = v7;
    }
    else
    {
      id v13 = [v10 dateByAddingTimeInterval:a4];
    }
    long long v14 = v13;
    double v15 = CACurrentMediaTime();
    self->_startOverrideTime = v15;
    self->_double endOverrideTime = v15 + a4;
    objc_storeStrong((id *)&self->_overrideDate, a3);
    NTKHourMinuteSecondAnglesForTime();
    float v16 = (float)((float)0.0 / 6.2832) - floor((float)((float)0.0 / 6.2832));
    self->_float startSecondAngle = v16;
    self->_float startMinuteAngle = v16;
    self->_float startHourAngle = v16;
    NTKHourMinuteSecondAnglesForTime();
    float v17 = (float)((float)0.0 / 6.2832) - floor((float)((float)0.0 / 6.2832));
    self->_float endSecondAngle = v17;
    self->_float endMinuteAngle = v17;
    self->_float endHourAngle = v17;
    float startSecondAngle = self->_startSecondAngle;
    float endSecondAngle = self->_endSecondAngle;
    if (vabds_f32(startSecondAngle, endSecondAngle) > 0.5)
    {
      BOOL v20 = startSecondAngle <= 0.5;
      float v21 = -1.0;
      if (!v20) {
        float v21 = 1.0;
      }
      self->_float endSecondAngle = endSecondAngle + v21;
    }
    float startMinuteAngle = self->_startMinuteAngle;
    float endMinuteAngle = self->_endMinuteAngle;
    if (vabds_f32(startMinuteAngle, endMinuteAngle) > 0.5)
    {
      float v24 = -1.0;
      if (startMinuteAngle > 0.5) {
        float v24 = 1.0;
      }
      self->_float endMinuteAngle = endMinuteAngle + v24;
    }
    float startHourAngle = self->_startHourAngle;
    float endHourAngle = self->_endHourAngle;
    if (vabds_f32(startHourAngle, endHourAngle) > 0.5)
    {
      BOOL v20 = startHourAngle <= 0.5;
      float v27 = -1.0;
      if (!v20) {
        float v27 = 1.0;
      }
      self->_float endHourAngle = endHourAngle + v27;
    }
  }
}

- (void)_significantTimeChanged
{
  double v3 = +[NSTimeZone systemTimeZone];
  double v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = (objc_class *)objc_opt_class();
    double v6 = NSStringFromClass(v5);
    id v7 = [(NSCalendar *)self->_calendar timeZone];
    float v8 = [v7 name];
    int v14 = 138412546;
    double v15 = v6;
    __int16 v16 = 2112;
    float v17 = v8;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%@ received significant time change with current timezone: %@", (uint8_t *)&v14, 0x16u);
  }
  [(NSCalendar *)self->_calendar setTimeZone:v3];
  uint64_t v9 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    long long v10 = (objc_class *)objc_opt_class();
    double v11 = NSStringFromClass(v10);
    id v12 = [(NSCalendar *)self->_calendar timeZone];
    id v13 = [v12 name];
    int v14 = 138412546;
    double v15 = v11;
    __int16 v16 = 2112;
    float v17 = v13;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%@ did set new timezone after significant time change to: %@", (uint8_t *)&v14, 0x16u);
  }
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (unint64_t)role
{
  return self->_role;
}

- (float)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(float)a3
{
  self->_opacity = a3;
}

- (float)tickOpacity
{
  return self->_tickOpacity;
}

- (void)setTickOpacity:(float)a3
{
  self->_tickOpacity = a3;
}

- (float)maskRadius
{
  return self->_maskRadius;
}

- (void)setMaskRadius:(float)a3
{
  self->_maskRadius = a3;
}

- (BOOL)isMasking
{
  return self->_masking;
}

- (void)setMasking:(BOOL)a3
{
  self->_masking = a3;
}

- (unint64_t)quality
{
  return self->_quality;
}

- (void)setQuality:(unint64_t)a3
{
  self->_quality = a3;
}

- (unint64_t)density
{
  return self->_density;
}

- (__n128)hourHandInnerColor
{
  return a1[10];
}

- (__n128)hourHandOuterColor
{
  return a1[11];
}

- (__n128)minuteHandInnerColor
{
  return a1[12];
}

- (__n128)minuteHandOuterColor
{
  return a1[13];
}

- (__n128)centerGlowColor
{
  return a1[14];
}

- (__n128)secondHandColor
{
  return a1[15];
}

- (float)tickColoration
{
  return self->_tickColoration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_mediaTimingFunction, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end