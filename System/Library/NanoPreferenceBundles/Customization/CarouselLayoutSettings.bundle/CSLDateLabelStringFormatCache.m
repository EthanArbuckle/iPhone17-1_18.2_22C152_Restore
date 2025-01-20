@interface CSLDateLabelStringFormatCache
+ (id)sharedInstance;
- (BOOL)_shouldShowHoursForTimerDuration:(double)a3;
- (CSLDateLabelStringFormatCache)init;
- (NSDateFormatter)abbrevDayMonthFormatter;
- (NSDateFormatter)abbrevDayMonthTimeFormatter;
- (NSDateFormatter)abbreviatedTimerJustMinutesSecondsFormatter;
- (NSDateFormatter)abbreviatedTimerWithHoursFormatter;
- (NSDateFormatter)alarmSnoozeJustMinutesSecondsFormatter;
- (NSDateFormatter)alarmSnoozeWithHoursFormatter;
- (NSDateFormatter)dayMonthYearFormatter;
- (NSDateFormatter)dayOfWeekFormatter;
- (NSDateFormatter)dayOfWeekMonthDayFormatter;
- (NSDateFormatter)dayOfWeekWithTimeFormatter;
- (NSDateFormatter)longYMDHMSNoSpaceFormatter;
- (NSDateFormatter)longYMDHMSZFormatter;
- (NSDateFormatter)relativeDateFormatter;
- (NSDateFormatter)relativeDateTimeFormatter;
- (NSDateFormatter)shortDayMonthFormatter;
- (NSDateFormatter)shortDayMonthTimeFormatter;
- (NSDateFormatter)timeFormatter;
- (NSDateFormatter)timeNoAMPMFormatter;
- (NSNumberFormatter)decimalFormatter;
- (id)formatAbbreviatedTimerDuration:(double)a3;
- (id)formatAlarmSnoozeDuration:(double)a3;
- (id)formatDateAsAbbreviatedDayMonthStyle:(id)a3;
- (id)formatDateAsAbbreviatedDayMonthWithTimeStyle:(id)a3;
- (id)formatDateAsAbbreviatedDayOfWeekWithTime:(id)a3;
- (id)formatDateAsDayMonthYearStyle:(id)a3;
- (id)formatDateAsDayOfWeek:(id)a3;
- (id)formatDateAsDayOfWeekMonthDayStyle:(id)a3;
- (id)formatDateAsLongYMDHMSNoSpacesWithDate:(id)a3;
- (id)formatDateAsLongYMDHMSZWithDate:(id)a3;
- (id)formatDateAsRelativeDateAndTimeStyle:(id)a3;
- (id)formatDateAsRelativeDateStyle:(id)a3;
- (id)formatDateAsShortDayMonthWithTimeStyle:(id)a3;
- (id)formatDateAsTimeNoAMPM:(id)a3;
- (id)formatDateAsTimeStyle:(id)a3;
- (id)formatNumberAsDecimal:(id)a3;
- (void)_withLock:(id)a3;
- (void)dealloc;
@end

@implementation CSLDateLabelStringFormatCache

+ (id)sharedInstance
{
  if (qword_45E70 != -1) {
    dispatch_once(&qword_45E70, &stru_3CDC8);
  }
  v2 = (void *)qword_45E68;

  return v2;
}

- (CSLDateLabelStringFormatCache)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSLDateLabelStringFormatCache;
  v2 = [(CSLDateLabelStringFormatCache *)&v5 init];
  v3 = v2;
  if (v2) {
    pthread_mutex_init(&v2->_lock, 0);
  }
  return v3;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)CSLDateLabelStringFormatCache;
  [(CSLDateLabelStringFormatCache *)&v3 dealloc];
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  pthread_mutex_lock(p_lock);
  v4[2](v4);

  pthread_mutex_unlock(p_lock);
}

- (NSDateFormatter)dayOfWeekFormatter
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_20764;
  v9 = sub_20774;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2077C;
  v4[3] = &unk_3CDF0;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLDateLabelStringFormatCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDateFormatter *)v2;
}

- (NSDateFormatter)dayOfWeekWithTimeFormatter
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_20764;
  v9 = sub_20774;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2099C;
  v4[3] = &unk_3CDF0;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLDateLabelStringFormatCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDateFormatter *)v2;
}

- (NSDateFormatter)dayMonthYearFormatter
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_20764;
  v9 = sub_20774;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_20BBC;
  v4[3] = &unk_3CDF0;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLDateLabelStringFormatCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDateFormatter *)v2;
}

- (NSDateFormatter)shortDayMonthFormatter
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_20764;
  v9 = sub_20774;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_20DDC;
  v4[3] = &unk_3CDF0;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLDateLabelStringFormatCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDateFormatter *)v2;
}

- (NSDateFormatter)shortDayMonthTimeFormatter
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_20764;
  v9 = sub_20774;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_20FFC;
  v4[3] = &unk_3CDF0;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLDateLabelStringFormatCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDateFormatter *)v2;
}

- (NSDateFormatter)abbrevDayMonthFormatter
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_20764;
  v9 = sub_20774;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2121C;
  v4[3] = &unk_3CDF0;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLDateLabelStringFormatCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDateFormatter *)v2;
}

- (NSDateFormatter)abbrevDayMonthTimeFormatter
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_20764;
  v9 = sub_20774;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2143C;
  v4[3] = &unk_3CDF0;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLDateLabelStringFormatCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDateFormatter *)v2;
}

- (NSDateFormatter)dayOfWeekMonthDayFormatter
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_20764;
  v9 = sub_20774;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2165C;
  v4[3] = &unk_3CDF0;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLDateLabelStringFormatCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDateFormatter *)v2;
}

- (NSDateFormatter)timeNoAMPMFormatter
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_20764;
  v9 = sub_20774;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2187C;
  v4[3] = &unk_3CDF0;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLDateLabelStringFormatCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDateFormatter *)v2;
}

- (NSDateFormatter)timeFormatter
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_20764;
  v9 = sub_20774;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_21AA4;
  v4[3] = &unk_3CDF0;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLDateLabelStringFormatCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDateFormatter *)v2;
}

- (NSDateFormatter)relativeDateTimeFormatter
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_20764;
  v9 = sub_20774;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_21CB0;
  v4[3] = &unk_3CDF0;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLDateLabelStringFormatCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDateFormatter *)v2;
}

- (NSDateFormatter)relativeDateFormatter
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_20764;
  v9 = sub_20774;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_21ED0;
  v4[3] = &unk_3CDF0;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLDateLabelStringFormatCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDateFormatter *)v2;
}

- (NSNumberFormatter)decimalFormatter
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_20764;
  v9 = sub_20774;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_220F0;
  v4[3] = &unk_3CDF0;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLDateLabelStringFormatCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumberFormatter *)v2;
}

- (NSDateFormatter)abbreviatedTimerWithHoursFormatter
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_20764;
  v9 = sub_20774;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_222E8;
  v4[3] = &unk_3CDF0;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLDateLabelStringFormatCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDateFormatter *)v2;
}

- (NSDateFormatter)abbreviatedTimerJustMinutesSecondsFormatter
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_20764;
  v9 = sub_20774;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2251C;
  v4[3] = &unk_3CDF0;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLDateLabelStringFormatCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDateFormatter *)v2;
}

- (NSDateFormatter)alarmSnoozeWithHoursFormatter
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_20764;
  v9 = sub_20774;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_22750;
  v4[3] = &unk_3CDF0;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLDateLabelStringFormatCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDateFormatter *)v2;
}

- (NSDateFormatter)alarmSnoozeJustMinutesSecondsFormatter
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_20764;
  v9 = sub_20774;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_22984;
  v4[3] = &unk_3CDF0;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLDateLabelStringFormatCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDateFormatter *)v2;
}

- (NSDateFormatter)longYMDHMSZFormatter
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_20764;
  v9 = sub_20774;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_22BB8;
  v4[3] = &unk_3CDF0;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLDateLabelStringFormatCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDateFormatter *)v2;
}

- (NSDateFormatter)longYMDHMSNoSpaceFormatter
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_20764;
  v9 = sub_20774;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_22DB4;
  v4[3] = &unk_3CDF0;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLDateLabelStringFormatCache *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDateFormatter *)v2;
}

- (id)formatNumberAsDecimal:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSLDateLabelStringFormatCache *)self decimalFormatter];
  v6 = [v5 stringFromNumber:v4];

  return v6;
}

- (id)formatDateAsDayOfWeek:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSLDateLabelStringFormatCache *)self dayOfWeekFormatter];
  v6 = [v5 stringFromDate:v4];

  return v6;
}

- (id)formatDateAsAbbreviatedDayOfWeekWithTime:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSLDateLabelStringFormatCache *)self dayOfWeekWithTimeFormatter];
  v6 = [v5 stringFromDate:v4];

  return v6;
}

- (id)formatDateAsDayMonthYearStyle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSLDateLabelStringFormatCache *)self dayMonthYearFormatter];
  v6 = [v5 stringFromDate:v4];

  return v6;
}

- (id)formatDateAsShortDayMonthWithTimeStyle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSLDateLabelStringFormatCache *)self shortDayMonthTimeFormatter];
  v6 = [v5 stringFromDate:v4];

  return v6;
}

- (id)formatDateAsAbbreviatedDayMonthStyle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSLDateLabelStringFormatCache *)self abbrevDayMonthFormatter];
  v6 = [v5 stringFromDate:v4];

  return v6;
}

- (id)formatDateAsAbbreviatedDayMonthWithTimeStyle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSLDateLabelStringFormatCache *)self abbrevDayMonthTimeFormatter];
  v6 = [v5 stringFromDate:v4];

  return v6;
}

- (id)formatDateAsTimeStyle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSLDateLabelStringFormatCache *)self timeFormatter];
  v6 = [v5 stringFromDate:v4];

  return v6;
}

- (id)formatDateAsRelativeDateAndTimeStyle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSLDateLabelStringFormatCache *)self relativeDateTimeFormatter];
  v6 = [v5 stringFromDate:v4];

  return v6;
}

- (id)formatDateAsDayOfWeekMonthDayStyle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSLDateLabelStringFormatCache *)self dayOfWeekMonthDayFormatter];
  v6 = [v5 stringFromDate:v4];

  return v6;
}

- (id)formatDateAsTimeNoAMPM:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSLDateLabelStringFormatCache *)self timeNoAMPMFormatter];
  v6 = [v5 stringFromDate:v4];

  uint64_t v7 = +[NSCharacterSet whitespaceCharacterSet];
  v8 = [v6 stringByTrimmingCharactersInSet:v7];

  return v8;
}

- (id)formatDateAsLongYMDHMSZWithDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSLDateLabelStringFormatCache *)self longYMDHMSZFormatter];
  v6 = [v5 stringFromDate:v4];

  return v6;
}

- (id)formatDateAsLongYMDHMSNoSpacesWithDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSLDateLabelStringFormatCache *)self longYMDHMSNoSpaceFormatter];
  v6 = [v5 stringFromDate:v4];

  return v6;
}

- (id)formatDateAsRelativeDateStyle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSLDateLabelStringFormatCache *)self relativeDateFormatter];
  v6 = [v5 stringFromDate:v4];

  return v6;
}

- (BOOL)_shouldShowHoursForTimerDuration:(double)a3
{
  return (uint64_t)a3 > 3599;
}

- (id)formatAbbreviatedTimerDuration:(double)a3
{
  if (-[CSLDateLabelStringFormatCache _shouldShowHoursForTimerDuration:](self, "_shouldShowHoursForTimerDuration:")) {
    [(CSLDateLabelStringFormatCache *)self abbreviatedTimerWithHoursFormatter];
  }
  else {
  uint64_t v5 = [(CSLDateLabelStringFormatCache *)self abbreviatedTimerJustMinutesSecondsFormatter];
  }
  v6 = +[NSDate dateWithTimeInterval:self->_timerReferenceDate sinceDate:a3];
  uint64_t v7 = [v5 stringFromDate:v6];

  return v7;
}

- (id)formatAlarmSnoozeDuration:(double)a3
{
  if (-[CSLDateLabelStringFormatCache _shouldShowHoursForTimerDuration:](self, "_shouldShowHoursForTimerDuration:")) {
    [(CSLDateLabelStringFormatCache *)self alarmSnoozeWithHoursFormatter];
  }
  else {
  uint64_t v5 = [(CSLDateLabelStringFormatCache *)self alarmSnoozeJustMinutesSecondsFormatter];
  }
  v6 = +[NSDate dateWithTimeInterval:self->_alarmReferenceDate sinceDate:a3];
  uint64_t v7 = [v5 stringFromDate:v6];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmReferenceDate, 0);
  objc_storeStrong((id *)&self->_timerReferenceDate, 0);
  objc_storeStrong((id *)&self->_alarmSnoozeJustMinutesSecondsFormatter, 0);
  objc_storeStrong((id *)&self->_alarmSnoozeWithHoursFormatter, 0);
  objc_storeStrong((id *)&self->_abbreviatedTimerJustMinutesSecondsFormatter, 0);
  objc_storeStrong((id *)&self->_abbreviatedTimerWithHoursFormatter, 0);
  objc_storeStrong((id *)&self->_decimalFormatter, 0);
  objc_storeStrong((id *)&self->_longYMDHMSNoSpaceFormatter, 0);
  objc_storeStrong((id *)&self->_longYMDHMSZFormatter, 0);
  objc_storeStrong((id *)&self->_timeNoAMPMFormatter, 0);
  objc_storeStrong((id *)&self->_dayOfWeekMonthDayFormatter, 0);
  objc_storeStrong((id *)&self->_relativeDateFormatter, 0);
  objc_storeStrong((id *)&self->_relativeDateTimeFormatter, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_abbrevDayMonthTimeFormatter, 0);
  objc_storeStrong((id *)&self->_abbrevDayMonthFormatter, 0);
  objc_storeStrong((id *)&self->_shortDayMonthTimeFormatter, 0);
  objc_storeStrong((id *)&self->_shortDayMonthFormatter, 0);
  objc_storeStrong((id *)&self->_dayMonthYearFormatter, 0);
  objc_storeStrong((id *)&self->_dayOfWeekWithTimeFormatter, 0);

  objc_storeStrong((id *)&self->_dayOfWeekFormatter, 0);
}

@end