@interface HUNoiseSample
+ (id)dateFormatter;
- (HUNoiseSample)initWithSampleDate:(id)a3 splValue:(float)a4 andDuration:(float)a5;
- (NSDate)sampleDate;
- (float)sampleDuration;
- (float)splValue;
- (id)detailedDescription;
- (void)setSampleDate:(id)a3;
- (void)setSampleDuration:(float)a3;
- (void)setSplValue:(float)a3;
@end

@implementation HUNoiseSample

+ (id)dateFormatter
{
  if (dateFormatter_token != -1) {
    dispatch_once(&dateFormatter_token, &__block_literal_global_3);
  }
  v2 = (void *)dateFormatter__formatter;

  return v2;
}

uint64_t __30__HUNoiseSample_dateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)dateFormatter__formatter;
  dateFormatter__formatter = v0;

  v2 = (void *)dateFormatter__formatter;
  v3 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  [v2 setLocale:v3];

  v4 = (void *)dateFormatter__formatter;

  return [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss:SS"];
}

- (HUNoiseSample)initWithSampleDate:(id)a3 splValue:(float)a4 andDuration:(float)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUNoiseSample;
  v9 = [(HUNoiseSample *)&v14 init];
  v10 = v9;
  if (v9)
  {
    [(HUNoiseSample *)v9 setSampleDate:v8];
    *(float *)&double v11 = a4;
    [(HUNoiseSample *)v10 setSplValue:v11];
    *(float *)&double v12 = a5;
    [(HUNoiseSample *)v10 setSampleDuration:v12];
  }

  return v10;
}

- (id)detailedDescription
{
  v3 = NSString;
  v4 = NSNumber;
  [(HUNoiseSample *)self splValue];
  v5 = objc_msgSend(v4, "numberWithFloat:");
  v6 = +[HUNoiseSample dateFormatter];
  v7 = [(HUNoiseSample *)self sampleDate];
  id v8 = [v6 stringFromDate:v7];
  v9 = NSNumber;
  [(HUNoiseSample *)self sampleDuration];
  v10 = objc_msgSend(v9, "numberWithFloat:");
  double v11 = [v3 stringWithFormat:@"(%@, %@, %@)", v5, v8, v10];

  return v11;
}

- (NSDate)sampleDate
{
  return self->_sampleDate;
}

- (void)setSampleDate:(id)a3
{
}

- (float)splValue
{
  return self->_splValue;
}

- (void)setSplValue:(float)a3
{
  self->_splValue = a3;
}

- (float)sampleDuration
{
  return self->_sampleDuration;
}

- (void)setSampleDuration:(float)a3
{
  self->_sampleDuration = a3;
}

- (void).cxx_destruct
{
}

@end