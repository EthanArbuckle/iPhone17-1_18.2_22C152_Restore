@interface ATXDailyTimeSummary
+ (BOOL)supportsSecureCoding;
- (ATXDailyTimeSummary)initWithCoder:(id)a3;
- (double)dnd;
- (double)driving;
- (double)exercise;
- (double)gaming;
- (double)mindfulness;
- (double)noMode;
- (double)outdoors;
- (double)personal;
- (double)quality;
- (double)reading;
- (double)screen;
- (double)sleep;
- (double)work;
- (int64_t)silencedNotificationCount;
- (void)encodeWithCoder:(id)a3;
- (void)setDnd:(double)a3;
- (void)setDriving:(double)a3;
- (void)setExercise:(double)a3;
- (void)setGaming:(double)a3;
- (void)setMindfulness:(double)a3;
- (void)setNoMode:(double)a3;
- (void)setOutdoors:(double)a3;
- (void)setPersonal:(double)a3;
- (void)setQuality:(double)a3;
- (void)setReading:(double)a3;
- (void)setScreen:(double)a3;
- (void)setSilencedNotificationCount:(int64_t)a3;
- (void)setSleep:(double)a3;
- (void)setWork:(double)a3;
@end

@implementation ATXDailyTimeSummary

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXDailyTimeSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)ATXDailyTimeSummary;
  v5 = [(ATXDailyTimeSummary *)&v30 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"screen"];
    v5->_screen = v6;
    [v4 decodeDoubleForKey:@"quality"];
    v5->_quality = v7;
    [v4 decodeDoubleForKey:@"outdoors"];
    v5->_outdoors = v8;
    v9 = ATXModeToString(0x10uLL);
    [v4 decodeDoubleForKey:v9];
    v5->_noMode = v10;

    v11 = ATXModeToString(0xDuLL);
    [v4 decodeDoubleForKey:v11];
    v5->_dnd = v12;

    v13 = ATXModeToString(5uLL);
    [v4 decodeDoubleForKey:v13];
    v5->_sleep = v14;

    v15 = ATXModeToString(4uLL);
    [v4 decodeDoubleForKey:v15];
    v5->_driving = v16;

    v17 = ATXModeToString(3uLL);
    [v4 decodeDoubleForKey:v17];
    v5->_exercise = v18;

    v19 = ATXModeToString(2uLL);
    [v4 decodeDoubleForKey:v19];
    v5->_work = v20;

    v21 = ATXModeToString(1uLL);
    [v4 decodeDoubleForKey:v21];
    v5->_personal = v22;

    v23 = ATXModeToString(7uLL);
    [v4 decodeDoubleForKey:v23];
    v5->_reading = v24;

    v25 = ATXModeToString(6uLL);
    [v4 decodeDoubleForKey:v25];
    v5->_gaming = v26;

    v27 = ATXModeToString(0xEuLL);
    [v4 decodeDoubleForKey:v27];
    v5->_mindfulness = v28;

    v5->_silencedNotificationCount = [v4 decodeIntegerForKey:@"notificationsSilenced"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double outdoors = self->_outdoors;
  id v25 = a3;
  [v25 encodeDouble:@"outdoors" forKey:outdoors];
  [v25 encodeDouble:@"screen" forKey:self->_screen];
  [v25 encodeDouble:@"quality" forKey:self->_quality];
  double noMode = self->_noMode;
  double v6 = ATXModeToString(0x10uLL);
  [v25 encodeDouble:v6 forKey:noMode];

  double dnd = self->_dnd;
  double v8 = ATXModeToString(0xDuLL);
  [v25 encodeDouble:v8 forKey:dnd];

  double sleep = self->_sleep;
  double v10 = ATXModeToString(5uLL);
  [v25 encodeDouble:v10 forKey:sleep];

  double driving = self->_driving;
  double v12 = ATXModeToString(4uLL);
  [v25 encodeDouble:v12 forKey:driving];

  double exercise = self->_exercise;
  double v14 = ATXModeToString(3uLL);
  [v25 encodeDouble:v14 forKey:exercise];

  double work = self->_work;
  double v16 = ATXModeToString(2uLL);
  [v25 encodeDouble:v16 forKey:work];

  double personal = self->_personal;
  double v18 = ATXModeToString(1uLL);
  [v25 encodeDouble:v18 forKey:personal];

  double reading = self->_reading;
  double v20 = ATXModeToString(7uLL);
  [v25 encodeDouble:v20 forKey:reading];

  double gaming = self->_gaming;
  double v22 = ATXModeToString(6uLL);
  [v25 encodeDouble:v22 forKey:gaming];

  double mindfulness = self->_mindfulness;
  double v24 = ATXModeToString(0xEuLL);
  [v25 encodeDouble:v24 forKey:mindfulness];

  [v25 encodeInteger:self->_silencedNotificationCount forKey:@"notificationsSilenced"];
}

- (double)outdoors
{
  return self->_outdoors;
}

- (void)setOutdoors:(double)a3
{
  self->_double outdoors = a3;
}

- (double)screen
{
  return self->_screen;
}

- (void)setScreen:(double)a3
{
  self->_screen = a3;
}

- (double)quality
{
  return self->_quality;
}

- (void)setQuality:(double)a3
{
  self->_quality = a3;
}

- (double)noMode
{
  return self->_noMode;
}

- (void)setNoMode:(double)a3
{
  self->_double noMode = a3;
}

- (double)dnd
{
  return self->_dnd;
}

- (void)setDnd:(double)a3
{
  self->_double dnd = a3;
}

- (double)sleep
{
  return self->_sleep;
}

- (void)setSleep:(double)a3
{
  self->_double sleep = a3;
}

- (double)driving
{
  return self->_driving;
}

- (void)setDriving:(double)a3
{
  self->_double driving = a3;
}

- (double)exercise
{
  return self->_exercise;
}

- (void)setExercise:(double)a3
{
  self->_double exercise = a3;
}

- (double)work
{
  return self->_work;
}

- (void)setWork:(double)a3
{
  self->_double work = a3;
}

- (double)personal
{
  return self->_personal;
}

- (void)setPersonal:(double)a3
{
  self->_double personal = a3;
}

- (double)reading
{
  return self->_reading;
}

- (void)setReading:(double)a3
{
  self->_double reading = a3;
}

- (double)gaming
{
  return self->_gaming;
}

- (void)setGaming:(double)a3
{
  self->_double gaming = a3;
}

- (double)mindfulness
{
  return self->_mindfulness;
}

- (void)setMindfulness:(double)a3
{
  self->_double mindfulness = a3;
}

- (int64_t)silencedNotificationCount
{
  return self->_silencedNotificationCount;
}

- (void)setSilencedNotificationCount:(int64_t)a3
{
  self->_silencedNotificationCount = a3;
}

@end