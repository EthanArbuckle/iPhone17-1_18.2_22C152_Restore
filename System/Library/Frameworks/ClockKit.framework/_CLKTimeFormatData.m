@interface _CLKTimeFormatData
+ (id)_timeFormatDataAccessLock;
+ (id)_timeLocale;
+ (id)instanceForCurrentLocale;
+ (void)resetTimeFormatData;
- (NSNumberFormatter)doubleWidthNumberFormatter;
- (NSNumberFormatter)singleWidthNumberFormatter;
- (NSString)formatHourMin;
- (NSString)formatHourMinSec;
- (NSString)formatHourMinSecSubsec;
- (NSString)formatMin;
- (NSString)formatMinSec;
- (NSString)formatMinSecSubsec;
- (_CLKTimeFormatData)init;
@end

@implementation _CLKTimeFormatData

+ (void)resetTimeFormatData
{
  id v3 = [a1 _timeFormatDataAccessLock];
  [v3 lock];
  v2 = (void *)__currentTimeFormatData;
  __currentTimeFormatData = 0;

  [v3 unlock];
}

+ (id)instanceForCurrentLocale
{
  v2 = [a1 _timeFormatDataAccessLock];
  [v2 lock];
  id v3 = (void *)__currentTimeFormatData;
  if (!__currentTimeFormatData)
  {
    v4 = objc_alloc_init(_CLKTimeFormatData);
    v5 = (void *)__currentTimeFormatData;
    __currentTimeFormatData = (uint64_t)v4;

    id v3 = (void *)__currentTimeFormatData;
  }
  id v6 = v3;
  [v2 unlock];

  return v6;
}

+ (id)_timeFormatDataAccessLock
{
  if (_timeFormatDataAccessLock_onceToken != -1) {
    dispatch_once(&_timeFormatDataAccessLock_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)_timeFormatDataAccessLock_accessLock;

  return v2;
}

+ (id)_timeLocale
{
  id v2 = objc_alloc(MEMORY[0x263EFF960]);
  id v3 = [MEMORY[0x263EFF960] currentLocale];
  v4 = [v3 localeIdentifier];
  v5 = (void *)[v2 initWithLocaleIdentifier:v4];

  return v5;
}

- (_CLKTimeFormatData)init
{
  v27.receiver = self;
  v27.super_class = (Class)_CLKTimeFormatData;
  id v2 = [(_CLKTimeFormatData *)&v27 init];
  if (v2)
  {
    id v3 = [(id)objc_opt_class() _timeLocale];
    uint64_t v4 = [MEMORY[0x263F08790] dateFormatFromTemplate:@"HHmm" options:0 locale:v3];
    formatHourMin = v2->_formatHourMin;
    v2->_formatHourMin = (NSString *)v4;

    uint64_t v6 = [MEMORY[0x263F08790] dateFormatFromTemplate:@"HHmmssSS" options:0 locale:v3];
    formatHourMinSecSubsec = v2->_formatHourMinSecSubsec;
    v2->_formatHourMinSecSubsec = (NSString *)v6;

    uint64_t v8 = [MEMORY[0x263F08790] dateFormatFromTemplate:@"HHmmss" options:0 locale:v3];
    formatHourMinSec = v2->_formatHourMinSec;
    v2->_formatHourMinSec = (NSString *)v8;

    uint64_t v10 = [MEMORY[0x263F08790] dateFormatFromTemplate:@"mmssSS" options:0 locale:v3];
    formatMinSecSubsec = v2->_formatMinSecSubsec;
    v2->_formatMinSecSubsec = (NSString *)v10;

    uint64_t v12 = [MEMORY[0x263F08790] dateFormatFromTemplate:@"mmss" options:0 locale:v3];
    formatMinSec = v2->_formatMinSec;
    v2->_formatMinSec = (NSString *)v12;

    uint64_t v14 = [MEMORY[0x263F08790] dateFormatFromTemplate:@"m" options:0 locale:v3];
    formatMin = v2->_formatMin;
    v2->_formatMin = (NSString *)v14;

    v16 = [v3 localeIdentifier];
    int v17 = [v16 hasPrefix:@"ee_"];

    if (v17)
    {
      if ([(NSString *)v2->_formatMinSecSubsec hasPrefix:@"'aɖabaƒoƒo' "])
      {
        uint64_t v18 = -[NSString substringFromIndex:](v2->_formatMinSecSubsec, "substringFromIndex:", [@"'aɖabaƒoƒo' " length]);
        v19 = v2->_formatMinSecSubsec;
        v2->_formatMinSecSubsec = (NSString *)v18;
      }
      if ([(NSString *)v2->_formatMinSec hasPrefix:@"'aɖabaƒoƒo' "])
      {
        uint64_t v20 = -[NSString substringFromIndex:](v2->_formatMinSec, "substringFromIndex:", [@"'aɖabaƒoƒo' " length]);
        v21 = v2->_formatMinSec;
        v2->_formatMinSec = (NSString *)v20;
      }
    }
    v22 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x263F08A30]);
    singleWidthNumberFormatter = v2->_singleWidthNumberFormatter;
    v2->_singleWidthNumberFormatter = v22;

    [(NSNumberFormatter *)v2->_singleWidthNumberFormatter setNumberStyle:0];
    [(NSNumberFormatter *)v2->_singleWidthNumberFormatter setPositiveFormat:@"0"];
    v24 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x263F08A30]);
    doubleWidthNumberFormatter = v2->_doubleWidthNumberFormatter;
    v2->_doubleWidthNumberFormatter = v24;

    [(NSNumberFormatter *)v2->_doubleWidthNumberFormatter setNumberStyle:0];
    [(NSNumberFormatter *)v2->_doubleWidthNumberFormatter setPositiveFormat:@"00"];
  }
  return v2;
}

- (NSString)formatHourMinSecSubsec
{
  return self->_formatHourMinSecSubsec;
}

- (NSString)formatHourMinSec
{
  return self->_formatHourMinSec;
}

- (NSString)formatHourMin
{
  return self->_formatHourMin;
}

- (NSString)formatMinSecSubsec
{
  return self->_formatMinSecSubsec;
}

- (NSString)formatMinSec
{
  return self->_formatMinSec;
}

- (NSString)formatMin
{
  return self->_formatMin;
}

- (NSNumberFormatter)singleWidthNumberFormatter
{
  return self->_singleWidthNumberFormatter;
}

- (NSNumberFormatter)doubleWidthNumberFormatter
{
  return self->_doubleWidthNumberFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleWidthNumberFormatter, 0);
  objc_storeStrong((id *)&self->_singleWidthNumberFormatter, 0);
  objc_storeStrong((id *)&self->_formatMin, 0);
  objc_storeStrong((id *)&self->_formatMinSec, 0);
  objc_storeStrong((id *)&self->_formatMinSecSubsec, 0);
  objc_storeStrong((id *)&self->_formatHourMin, 0);
  objc_storeStrong((id *)&self->_formatHourMinSec, 0);

  objc_storeStrong((id *)&self->_formatHourMinSecSubsec, 0);
}

@end