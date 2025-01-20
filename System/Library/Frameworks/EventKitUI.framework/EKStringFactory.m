@interface EKStringFactory
+ (id)sharedInstance;
- (EKStringFactory)init;
- (__CFDateFormatter)_customFormatter;
- (__CFDateFormatter)standardTimeFormatter;
- (id)_dateStringForEventInvitationWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6 withFormat:(unint64_t)a7 showTimeZone:(BOOL)a8;
- (id)_stringForDateTime:(id)a3 timeZone:(__CFTimeZone *)a4;
- (id)_stringForTime:(id)a3;
- (id)dateStringForDate:(double)a3 allDay:(BOOL)a4 shortFormat:(BOOL)a5;
- (id)dateStringForDate:(double)a3 allDay:(BOOL)a4 standalone:(BOOL)a5 shortFormat:(BOOL)a6;
- (id)dateStringForEventInvitation:(id)a3 timeZone:(id)a4;
- (id)dateStringForEventInvitationWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6;
- (id)dateStringForSuggestedEventWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6 showTimeZone:(BOOL)a7;
- (id)timeStringForDate:(double)a3 inTimeZone:(id)a4;
- (void)_invalidateFormatters;
- (void)dealloc;
@end

@implementation EKStringFactory

+ (id)sharedInstance
{
  v2 = (void *)sharedInstance___shared;
  if (!sharedInstance___shared)
  {
    id v3 = objc_alloc_init((Class)objc_opt_class());
    v4 = (void *)sharedInstance___shared;
    sharedInstance___shared = (uint64_t)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_EKStringFactoryHandleSignificantTimeChange, (CFStringRef)*MEMORY[0x1E4F578B0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v2 = (void *)sharedInstance___shared;
  }

  return v2;
}

- (EKStringFactory)init
{
  v5.receiver = self;
  v5.super_class = (Class)EKStringFactory;
  v2 = [(EKStringFactory *)&v5 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__localeChanged_ name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(EKStringFactory *)self _invalidateFormatters];
  v4.receiver = self;
  v4.super_class = (Class)EKStringFactory;
  [(EKStringFactory *)&v4 dealloc];
}

- (void)_invalidateFormatters
{
  standardTimeFormatter = self->_standardTimeFormatter;
  if (standardTimeFormatter)
  {
    CFRelease(standardTimeFormatter);
    self->_standardTimeFormatter = 0;
  }
  customFormatter = self->_customFormatter;
  if (customFormatter)
  {
    CFRelease(customFormatter);
    self->_customFormatter = 0;
  }
}

- (__CFDateFormatter)_customFormatter
{
  result = self->_customFormatter;
  if (!result)
  {
    CFLocaleRef v4 = CFLocaleCopyCurrent();
    self->_customFormatter = CFDateFormatterCreate(0, v4, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
    CFRelease(v4);
    return self->_customFormatter;
  }
  return result;
}

- (__CFDateFormatter)standardTimeFormatter
{
  result = self->_standardTimeFormatter;
  if (!result)
  {
    CFLocaleRef v4 = CFLocaleCopyCurrent();
    self->_standardTimeFormatter = CFDateFormatterCreate(0, v4, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
    CFRelease(v4);
    return self->_standardTimeFormatter;
  }
  return result;
}

- (id)timeStringForDate:(double)a3 inTimeZone:(id)a4
{
  objc_super v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a4;
  v7 = [v5 dateFromISO8601String:@"2001-01-01T00:00:00Z"];
  v8 = [MEMORY[0x1E4F57B60] sharedGenerator];
  v9 = [v7 dateByAddingTimeInterval:a3];
  v10 = [v8 timeStringForDate:v9 inTimeZone:v6];

  return v10;
}

- (id)dateStringForDate:(double)a3 allDay:(BOOL)a4 shortFormat:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v8 = [MEMORY[0x1E4F1C9C8] dateFromISO8601String:@"2001-01-01T00:00:00Z"];
  v9 = [MEMORY[0x1E4F57B60] sharedGenerator];
  v10 = [v8 dateByAddingTimeInterval:a3];
  v11 = [v9 dateStringForDate:v10 allDay:v6 shortFormat:v5];

  return v11;
}

- (id)dateStringForDate:(double)a3 allDay:(BOOL)a4 standalone:(BOOL)a5 shortFormat:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  v10 = [MEMORY[0x1E4F1C9C8] dateFromISO8601String:@"2001-01-01T00:00:00Z"];
  v11 = [MEMORY[0x1E4F57B60] sharedGenerator];
  v12 = [v10 dateByAddingTimeInterval:a3];
  v13 = [v11 dateStringForDate:v12 allDay:v8 standalone:v7 shortFormat:v6];

  return v13;
}

- (id)_stringForTime:(id)a3
{
  double var5 = a3.var5;
  unint64_t v4 = *(void *)&a3.var0;
  BOOL v6 = (const void *)CalCopySystemTimeZone();
  CFAbsoluteTime v7 = MEMORY[0x1BA985590](v4, *(void *)&var5, v6);
  BOOL v8 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
  if (!HIBYTE(v4))
  {
    CPDateFormatStringForFormatType();
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9
      && [(__CFString *)v9 rangeOfString:@"H"] == 0x7FFFFFFFFFFFFFFFLL
      && [(__CFString *)v10 rangeOfString:@"k"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = [(EKStringFactory *)self _customFormatter];
      CFDateFormatterSetFormat(v11, v10);
      StringWithAbsoluteTime = (__CFString *)CFDateFormatterCreateStringWithAbsoluteTime(*v8, v11, v7);

      if (StringWithAbsoluteTime) {
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  StringWithAbsoluteTime = (__CFString *)CFDateFormatterCreateStringWithAbsoluteTime(*v8, [(EKStringFactory *)self standardTimeFormatter], v7);
LABEL_9:
  CFRelease(v6);

  return StringWithAbsoluteTime;
}

- (id)_stringForDateTime:(id)a3 timeZone:(__CFTimeZone *)a4
{
  if (!a3.var4)
  {
    BOOL v5 = CPDateFormatStringForFormatType();
    BOOL v6 = v5;
    if (v5 && [v5 rangeOfString:@"H"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v6 rangeOfString:@"k"];
    }
    else
    {
    }
  }
  CPDateFormatStringForFormatType();
  CFAbsoluteTime v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CalGregorianDateGetAbsoluteTimeWithFallbackToDefaultTimeZone();
  CFAbsoluteTime v9 = v8;
  if (v7)
  {
    v10 = [(EKStringFactory *)self _customFormatter];
    CFDateFormatterSetFormat(v10, v7);
    CFRetain(v10);
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  }
  else
  {
    CFLocaleRef v12 = CFLocaleCopyCurrent();
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v10 = CFDateFormatterCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v12, kCFDateFormatterMediumStyle, kCFDateFormatterMediumStyle);
    CFRelease(v12);
  }
  StringWithAbsoluteTime = (__CFString *)CFDateFormatterCreateStringWithAbsoluteTime(v11, v10, v9);
  CFRelease(v10);

  return StringWithAbsoluteTime;
}

- (id)dateStringForEventInvitation:(id)a3 timeZone:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [v7 startDate];
  CFAbsoluteTime v9 = [v7 endDate];
  uint64_t v10 = [v7 isAllDay];

  CFAllocatorRef v11 = [(EKStringFactory *)self dateStringForEventInvitationWithStartDate:v8 endDate:v9 timeZone:v6 allDay:v10];

  return v11;
}

- (id)dateStringForEventInvitationWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6
{
  return [(EKStringFactory *)self _dateStringForEventInvitationWithStartDate:a3 endDate:a4 timeZone:a5 allDay:a6 withFormat:0 showTimeZone:0];
}

- (id)dateStringForSuggestedEventWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6 showTimeZone:(BOOL)a7
{
  return [(EKStringFactory *)self _dateStringForEventInvitationWithStartDate:a3 endDate:a4 timeZone:a5 allDay:a6 withFormat:1 showTimeZone:a7];
}

- (id)_dateStringForEventInvitationWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6 withFormat:(unint64_t)a7 showTimeZone:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v17 = EventKitUIBundle();
  v18 = (void *)v17;
  if (a6)
  {
    v19 = [MEMORY[0x1E4F57B60] sharedGenerator];
    v20 = [v19 stringForDate:v14 withLongFormatString:0 useAbbreviatedFormats:0 lowerCase:0];
  }
  else
  {
    BOOL v44 = v8;
    v46 = (void *)v17;
    [v14 timeIntervalSinceReferenceDate];
    uint64_t GregorianDateWithFallbackToDefaultTimeZone = CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone();
    uint64_t v23 = v22;
    id v45 = v15;
    [v15 timeIntervalSinceReferenceDate];
    uint64_t v24 = CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone();
    uint64_t v26 = v25;
    if ((GregorianDateWithFallbackToDefaultTimeZone & 0xFFFFFFFFFFFFLL) == (v24 & 0xFFFFFFFFFFFFLL))
    {
      [MEMORY[0x1E4F57B60] sharedGenerator];
      v28 = unint64_t v27 = a7;
      v19 = [v28 stringForDate:v14 withLongFormatString:0 useAbbreviatedFormats:0 lowerCase:0];

      v29 = -[EKStringFactory _stringForTime:](self, "_stringForTime:", GregorianDateWithFallbackToDefaultTimeZone, v23);
      v30 = -[EKStringFactory _stringForTime:](self, "_stringForTime:", v24, v26);
      id v31 = [NSString alloc];
      v32 = [v46 localizedStringForKey:@"Invitation from start time to end time" value:@"%@ to %@" table:0];
      v33 = objc_msgSend(v31, "initWithFormat:", v32, v29, v30);

      if (v27)
      {
        v34 = [v46 localizedStringForKey:@"Suggested event date and time format" value:@"%@ from %@" table:0];
        v20 = objc_msgSend(NSString, "localizedStringWithFormat:", v34, v19, v33);
      }
      else
      {
        v20 = [NSString stringWithFormat:@"%@\n%@", v19, v33];
      }
      id v15 = v45;
      BOOL v8 = v44;

      v18 = v46;
    }
    else
    {
      v35 = (const void *)CalCopySystemTimeZone();
      v19 = -[EKStringFactory _stringForDateTime:timeZone:](self, "_stringForDateTime:timeZone:", GregorianDateWithFallbackToDefaultTimeZone, v23, v35);
      v36 = -[EKStringFactory _stringForDateTime:timeZone:](self, "_stringForDateTime:timeZone:", v24, v26, v35);
      v37 = NSString;
      if (a7) {
        v38 = @"%@ to %@";
      }
      else {
        v38 = @"%@\nto %@";
      }
      v18 = v46;
      v39 = [v46 localizedStringForKey:v38 value:&stru_1F0CC2140 table:0];
      v20 = objc_msgSend(v37, "localizedStringWithFormat:", v39, v19, v36);

      CFRelease(v35);
      id v15 = v45;
      BOOL v8 = v44;
    }
  }

  if (v16 && v8)
  {
    v40 = [v16 abbreviationForDate:v14];
    v41 = [v18 localizedStringForKey:@"Date/time string with time zone format" value:@"%@ (%@)" table:0];
    uint64_t v42 = objc_msgSend(NSString, "localizedStringWithFormat:", v41, v20, v40);

    v20 = (void *)v42;
  }

  return v20;
}

@end