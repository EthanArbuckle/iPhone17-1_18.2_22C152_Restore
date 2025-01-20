@interface HUTriggerDurationPickerValue
+ (id)valueWithDuration:(double)a3;
+ (id)valueWithNoDuration;
- (BOOL)hasDuration;
- (HUTriggerDurationPickerValue)init;
- (HUTriggerDurationPickerValue)initWithDuration:(id)a3;
- (NSNumber)duration;
@end

@implementation HUTriggerDurationPickerValue

+ (id)valueWithDuration:(double)a3
{
  id v4 = objc_alloc((Class)a1);
  v5 = [NSNumber numberWithDouble:a3];
  v6 = (void *)[v4 initWithDuration:v5];

  return v6;
}

+ (id)valueWithNoDuration
{
  v2 = (void *)[objc_alloc((Class)a1) initWithDuration:0];

  return v2;
}

- (HUTriggerDurationPickerValue)init
{
  return [(HUTriggerDurationPickerValue *)self initWithDuration:0];
}

- (HUTriggerDurationPickerValue)initWithDuration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUTriggerDurationPickerValue;
  v6 = [(HUTriggerDurationPickerValue *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_duration, a3);
  }

  return v7;
}

- (BOOL)hasDuration
{
  v2 = [(HUTriggerDurationPickerValue *)self duration];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
}

@end