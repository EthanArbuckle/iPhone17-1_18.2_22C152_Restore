@interface DSDateFormatter
+ (id)sharedFormatter;
- (DSDateFormatter)formatterWithType:(int64_t)a3;
- (DSDateFormatter)init;
- (NSMutableDictionary)dateFormatters;
- (void)setDateFormatters:(id)a3;
@end

@implementation DSDateFormatter

+ (id)sharedFormatter
{
  if (sharedFormatter_onceToken != -1) {
    dispatch_once(&sharedFormatter_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedFormatter_singleton;

  return v2;
}

void __34__DSDateFormatter_sharedFormatter__block_invoke(id a1)
{
  sharedFormatter_singleton = objc_alloc_init(DSDateFormatter);

  _objc_release_x1();
}

- (DSDateFormatter)init
{
  v6.receiver = self;
  v6.super_class = (Class)DSDateFormatter;
  v2 = [(DSDateFormatter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    dateFormatters = v2->_dateFormatters;
    v2->_dateFormatters = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (DSDateFormatter)formatterWithType:(int64_t)a3
{
  v5 = [(DSDateFormatter *)self dateFormatters];
  objc_super v6 = +[NSNumber numberWithInteger:a3];
  v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    v8 = [(DSDateFormatter *)self dateFormatters];
    v9 = +[NSNumber numberWithInteger:a3];
    id v10 = [v8 objectForKeyedSubscript:v9];
  }
  else
  {
    id v10 = objc_alloc_init((Class)NSDateFormatter);
    id v11 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US_POSIX"];
    [v10 setLocale:v11];

    [v10 setFormatterBehavior:1040];
    switch(a3)
    {
      case 0:
        v12 = @"yyyy-MM-dd'T'HH:mm:ssZZZZZ";
        goto LABEL_11;
      case 1:
        [v10 setDateFormat:@"MM/dd/YYYY HH:mm:ss ZZZ"];
        v13 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
        [v10 setTimeZone:v13];
        goto LABEL_7;
      case 2:
        [v10 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
        v13 = +[NSLocale systemLocale];
        [v10 setLocale:v13];
LABEL_7:

        break;
      case 3:
        v12 = @"yyyy-MM-dd";
        goto LABEL_11;
      case 4:
        v12 = @"EEE MMM dd HH:mm:ss z yyyy";
        goto LABEL_11;
      case 5:
        v12 = @"yyyy-MM-dd HH.mm.ss.SSS Z";
LABEL_11:
        [v10 setDateFormat:v12];
        break;
      case 6:
        v14 = +[NSLocale autoupdatingCurrentLocale];
        [v10 setLocale:v14];

        [v10 setDateStyle:3];
        [v10 setTimeStyle:1];
        [v10 setDoesRelativeDateFormatting:1];
        break;
      default:
        break;
    }
    v8 = [(DSDateFormatter *)self dateFormatters];
    v9 = +[NSNumber numberWithInteger:a3];
    [v8 setObject:v10 forKeyedSubscript:v9];
  }

  return (DSDateFormatter *)v10;
}

- (NSMutableDictionary)dateFormatters
{
  return self->_dateFormatters;
}

- (void)setDateFormatters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end