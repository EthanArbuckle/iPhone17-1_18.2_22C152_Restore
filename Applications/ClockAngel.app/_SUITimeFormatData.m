@interface _SUITimeFormatData
+ (id)_timeFormatDataAccessLock;
+ (id)_timeLocaleForLocale:(id)a3;
+ (id)instanceForLocale:(id)a3;
- (NSDateComponentsFormatter)abbreviatedHourDateFormatter;
- (NSDateComponentsFormatter)abbreviatedHourMinuteDateFormatter;
- (NSNumberFormatter)doubleWidthNumberFormatter;
- (NSNumberFormatter)singleWidthNumberFormatter;
- (NSString)formatHourMin;
- (NSString)formatHourMinSec;
- (NSString)formatHourMinSecSubsec;
- (NSString)formatMin;
- (NSString)formatMinSec;
- (NSString)formatMinSecSubsec;
- (_SUITimeFormatData)initWithLocale:(id)a3;
@end

@implementation _SUITimeFormatData

+ (id)instanceForLocale:(id)a3
{
  id v4 = a3;
  v5 = [a1 _timeFormatDataAccessLock];
  [v5 lock];
  v6 = (void *)qword_1000C7150;
  if (!qword_1000C7150)
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    v8 = (void *)qword_1000C7150;
    qword_1000C7150 = (uint64_t)v7;

    v6 = (void *)qword_1000C7150;
  }
  v9 = [v6 objectForKeyedSubscript:v4];
  if (!v9)
  {
    v9 = [[_SUITimeFormatData alloc] initWithLocale:v4];
    [(id)qword_1000C7150 setObject:v9 forKeyedSubscript:v4];
  }
  [v5 unlock];

  return v9;
}

+ (id)_timeFormatDataAccessLock
{
  if (qword_1000C7160[0] != -1) {
    dispatch_once(qword_1000C7160, &stru_1000B2840);
  }
  v2 = (void *)qword_1000C7158;

  return v2;
}

+ (id)_timeLocaleForLocale:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSLocale);
  v5 = [v3 localeIdentifier];

  id v6 = [v4 initWithLocaleIdentifier:v5];

  return v6;
}

- (_SUITimeFormatData)initWithLocale:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_SUITimeFormatData;
  v5 = [(_SUITimeFormatData *)&v34 init];
  if (v5)
  {
    id v6 = [(id)objc_opt_class() _timeLocaleForLocale:v4];
    uint64_t v7 = +[NSDateFormatter dateFormatFromTemplate:@"HHmm" options:0 locale:v6];
    formatHourMin = v5->_formatHourMin;
    v5->_formatHourMin = (NSString *)v7;

    uint64_t v9 = +[NSDateFormatter dateFormatFromTemplate:@"HHmmssSS" options:0 locale:v6];
    formatHourMinSecSubsec = v5->_formatHourMinSecSubsec;
    v5->_formatHourMinSecSubsec = (NSString *)v9;

    uint64_t v11 = +[NSDateFormatter dateFormatFromTemplate:@"HHmmss" options:0 locale:v6];
    formatHourMinSec = v5->_formatHourMinSec;
    v5->_formatHourMinSec = (NSString *)v11;

    uint64_t v13 = +[NSDateFormatter dateFormatFromTemplate:@"mmssSS" options:0 locale:v6];
    formatMinSecSubsec = v5->_formatMinSecSubsec;
    v5->_formatMinSecSubsec = (NSString *)v13;

    uint64_t v15 = +[NSDateFormatter dateFormatFromTemplate:@"mmss" options:0 locale:v6];
    formatMinSec = v5->_formatMinSec;
    v5->_formatMinSec = (NSString *)v15;

    uint64_t v17 = +[NSDateFormatter dateFormatFromTemplate:@"m" options:0 locale:v6];
    formatMin = v5->_formatMin;
    v5->_formatMin = (NSString *)v17;

    v19 = [v6 localeIdentifier];
    unsigned int v20 = [v19 hasPrefix:@"ee_"];

    if (v20)
    {
      if ([(NSString *)v5->_formatMinSecSubsec hasPrefix:@"'aɖabaƒoƒo' "])
      {
        uint64_t v21 = -[NSString substringFromIndex:](v5->_formatMinSecSubsec, "substringFromIndex:", [@"'aɖabaƒoƒo' " length]);
        v22 = v5->_formatMinSecSubsec;
        v5->_formatMinSecSubsec = (NSString *)v21;
      }
      if ([(NSString *)v5->_formatMinSec hasPrefix:@"'aɖabaƒoƒo' "])
      {
        uint64_t v23 = -[NSString substringFromIndex:](v5->_formatMinSec, "substringFromIndex:", [@"'aɖabaƒoƒo' " length]);
        v24 = v5->_formatMinSec;
        v5->_formatMinSec = (NSString *)v23;
      }
    }
    v25 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
    singleWidthNumberFormatter = v5->_singleWidthNumberFormatter;
    v5->_singleWidthNumberFormatter = v25;

    [(NSNumberFormatter *)v5->_singleWidthNumberFormatter setNumberStyle:0];
    [(NSNumberFormatter *)v5->_singleWidthNumberFormatter setPositiveFormat:@"0"];
    [(NSNumberFormatter *)v5->_singleWidthNumberFormatter setLocale:v4];
    v27 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
    doubleWidthNumberFormatter = v5->_doubleWidthNumberFormatter;
    v5->_doubleWidthNumberFormatter = v27;

    [(NSNumberFormatter *)v5->_doubleWidthNumberFormatter setNumberStyle:0];
    [(NSNumberFormatter *)v5->_doubleWidthNumberFormatter setPositiveFormat:@"00"];
    [(NSNumberFormatter *)v5->_doubleWidthNumberFormatter setLocale:v4];
    v29 = (NSDateComponentsFormatter *)objc_alloc_init((Class)NSDateComponentsFormatter);
    abbreviatedHourDateFormatter = v5->_abbreviatedHourDateFormatter;
    v5->_abbreviatedHourDateFormatter = v29;

    [(NSDateComponentsFormatter *)v5->_abbreviatedHourDateFormatter setUnitsStyle:1];
    [(NSDateComponentsFormatter *)v5->_abbreviatedHourDateFormatter setAllowedUnits:32];
    v31 = (NSDateComponentsFormatter *)objc_alloc_init((Class)NSDateComponentsFormatter);
    abbreviatedHourMinuteDateFormatter = v5->_abbreviatedHourMinuteDateFormatter;
    v5->_abbreviatedHourMinuteDateFormatter = v31;

    [(NSDateComponentsFormatter *)v5->_abbreviatedHourMinuteDateFormatter setUnitsStyle:1];
    [(NSDateComponentsFormatter *)v5->_abbreviatedHourMinuteDateFormatter setAllowedUnits:96];
  }
  return v5;
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

- (NSDateComponentsFormatter)abbreviatedHourDateFormatter
{
  return self->_abbreviatedHourDateFormatter;
}

- (NSDateComponentsFormatter)abbreviatedHourMinuteDateFormatter
{
  return self->_abbreviatedHourMinuteDateFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abbreviatedHourMinuteDateFormatter, 0);
  objc_storeStrong((id *)&self->_abbreviatedHourDateFormatter, 0);
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