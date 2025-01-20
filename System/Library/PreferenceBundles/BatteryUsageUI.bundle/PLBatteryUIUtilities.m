@interface PLBatteryUIUtilities
+ (BOOL)hasBatteryLevelDataAtTapIndex:(int)a3 fromGraphData:(id)a4 queryRange:(int)a5;
+ (BOOL)inDemoMode;
+ (BOOL)is24HourClock;
+ (BOOL)isDateMidnight:(id)a3;
+ (BOOL)isDateStartOfWeek:(id)a3;
+ (BOOL)isDeviceLayoutRTL;
+ (BOOL)isInUnitTest;
+ (BOOL)isTappedIntervalCurrentBucket:(int)a3 withQueryRange:(int)a4 andEndTime:(id)a5;
+ (BOOL)shouldDisplayAuthView;
+ (double)getOneLineWidthOfText:(id)a3 withFont:(id)a4;
+ (double)millisecondsFromMachTime:(unint64_t)a3;
+ (id)accessibilityDescriptionForChargingTime:(double)a3;
+ (id)accessibilityDescriptionForDate:(double)a3;
+ (id)accessibilityDescriptionForDateTime:(double)a3;
+ (id)accessibilityDescriptionForHour:(double)a3 duration:(double)a4;
+ (id)accessibilityDescriptionForTimeInterval:(double)a3;
+ (id)clipWithRoundedCorner:(double)a3 toImage:(id)a4;
+ (id)containerPath;
+ (id)convertImage:(id)a3 toColor:(id)a4;
+ (id)convertImageToGrayScale:(id)a3;
+ (id)getDefaultValueForKey:(id)a3;
+ (id)getLocalizedStringFromNumber:(id)a3;
+ (id)getLocalizedTimeStringFromFutureDate:(id)a3;
+ (id)getRelativeDateStringForDate:(id)a3;
+ (id)getScreenOnOffSecsAtTapIndex:(int)a3 fromGraphData:(id)a4 queryRange:(int)a5;
+ (id)iconUTTypeIdentifierForNonApp:(id)a3;
+ (id)iconUTTypeIdentifierForSuggestion:(int)a3;
+ (id)loadDataFromJSONResource:(id)a3;
+ (id)localizedStringWithHour:(int)a3;
+ (id)localizedStringWithMin:(int)a3;
+ (id)localizedStringWithPercentage:(double)a3;
+ (id)replaceWithUnBreakableSpace:(id)a3;
+ (id)scaledScreenOn:(double)a3 screenOff:(double)a4 andMaxTotalTime:(double)a5;
+ (id)screenOffColor;
+ (id)screenOnColor;
+ (id)specFromDictionary:(id)a3;
+ (int)getNumOfBreakdownEntriesAtTapIndex:(int)a3 fromBreakdownData:(id)a4 queryRange:(int)a5;
+ (int64_t)localizedDateComponentsUnitsStyle;
+ (int64_t)localizedLeftTextAlignment;
+ (int64_t)localizedRightTextAlignment;
+ (void)setDefaultValue:(id)a3 forKey:(id)a4;
@end

@implementation PLBatteryUIUtilities

+ (int64_t)localizedDateComponentsUnitsStyle
{
  v2 = +[NSLocale preferredLanguages];
  v3 = [v2 firstObject];
  unsigned int v4 = [v3 hasPrefix:@"en"];

  if (v4) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (id)localizedStringWithHour:(int)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_33E9C;
  block[3] = &unk_BF450;
  block[4] = a1;
  if (qword_D73E8 != -1) {
    dispatch_once(&qword_D73E8, block);
  }
  unsigned int v4 = [(id)qword_D73F0 stringFromTimeInterval:(double)(3600 * a3)];

  return v4;
}

+ (id)localizedStringWithMin:(int)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_33FE0;
  block[3] = &unk_BF450;
  block[4] = a1;
  if (qword_D73F8 != -1) {
    dispatch_once(&qword_D73F8, block);
  }
  unsigned int v4 = [(id)qword_D7400 stringFromTimeInterval:(double)(60 * a3)];

  return v4;
}

+ (double)getOneLineWidthOfText:(id)a3 withFont:(id)a4
{
  NSAttributedStringKey v11 = NSFontAttributeName;
  id v12 = a4;
  id v5 = a4;
  id v6 = a3;
  v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 3, v7, 0, 3.40282347e38, 3.40282347e38);
  double v9 = v8;

  return v9;
}

+ (BOOL)isDateStartOfWeek:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[NSCalendar currentCalendar];
  id v5 = [v4 components:512 fromDate:v3];

  id v6 = [v5 weekday];
  LOBYTE(v6) = v6 == (id)(CalWeekStartForDisplay() + 1);

  return (char)v6;
}

+ (int)getNumOfBreakdownEntriesAtTapIndex:(int)a3 fromBreakdownData:(id)a4 queryRange:(int)a5
{
  id v7 = a4;
  double v8 = v7;
  if (v7)
  {
    if (a5)
    {
      double v9 = [v7 objectForKeyedSubscript:@"PLBatteryUIQueryRangeWeekTapKey"];
      v10 = v9;
      if (v9 && (unint64_t)[v9 count] > a3)
      {
LABEL_9:
        v13 = [v10 objectAtIndexedSubscript:a3];
        v14 = [v13 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
        int v11 = [v14 count];

LABEL_11:
        goto LABEL_12;
      }
    }
    else
    {
      id v12 = [v7 objectForKeyedSubscript:@"PLBatteryUIQueryRangeDayTapKey"];
      v10 = v12;
      if (v12 && (unint64_t)[v12 count] > a3) {
        goto LABEL_9;
      }
    }
    int v11 = 0;
    goto LABEL_11;
  }
  int v11 = 0;
LABEL_12:

  return v11;
}

+ (id)getScreenOnOffSecsAtTapIndex:(int)a3 fromGraphData:(id)a4 queryRange:(int)a5
{
  id v7 = a4;
  double v8 = v7;
  if (!v7)
  {
    v22 = 0;
    goto LABEL_17;
  }
  if (!a5)
  {
    v23 = [v7 objectForKeyedSubscript:@"PLBatteryUIGraph24hrs"];
    v24 = [v23 objectForKeyedSubscript:@"PLBatteryUIScreenOnTimeKey"];
    v10 = [v24 objectForKeyedSubscript:@"PLBatteryUIGraphHourly"];

    v25 = [v8 objectForKeyedSubscript:@"PLBatteryUIGraph24hrs"];
    v26 = [v25 objectForKeyedSubscript:@"PLBatteryUIScreenOffTimeKey"];
    v18 = [v26 objectForKeyedSubscript:@"PLBatteryUIGraphHourly"];

    double v11 = 0.0;
    if (!v10
      || !v18
      || (unint64_t)[v10 count] <= a3
      || (unint64_t)[v18 count] <= a3)
    {
      double v17 = 0.0;
      goto LABEL_15;
    }
    v27 = [v10 objectAtIndexedSubscript:a3];
    [v27 doubleValue];
    double v17 = v28;

    v19 = [v18 objectAtIndexedSubscript:a3];
    [v19 doubleValue];
    double v11 = v29;
LABEL_6:

LABEL_15:
    goto LABEL_16;
  }
  double v9 = [v7 objectForKeyedSubscript:@"PLBatteryUIGraphDays"];
  v10 = v9;
  double v11 = 0.0;
  if (v9 && (unint64_t)[v9 count] > a3)
  {
    uint64_t v12 = a3;
    v13 = [v10 objectAtIndexedSubscript:a3];
    v14 = [v13 objectForKeyedSubscript:@"PLBatteryUIScreenOnTimeKey"];
    v15 = [v14 objectForKeyedSubscript:@"PLBatteryUIGraphTotal"];
    [v15 doubleValue];
    double v17 = v16;

    v18 = [v10 objectAtIndexedSubscript:v12];
    v19 = [v18 objectForKeyedSubscript:@"PLBatteryUIScreenOffTimeKey"];
    v20 = [v19 objectForKeyedSubscript:@"PLBatteryUIGraphTotal"];
    [v20 doubleValue];
    double v11 = v21;

    goto LABEL_6;
  }
  double v17 = 0.0;
LABEL_16:

  v30 = +[NSNumber numberWithDouble:v17];
  v33[0] = v30;
  v31 = +[NSNumber numberWithDouble:v11];
  v33[1] = v31;
  v22 = +[NSArray arrayWithObjects:v33 count:2];

LABEL_17:

  return v22;
}

+ (BOOL)hasBatteryLevelDataAtTapIndex:(int)a3 fromGraphData:(id)a4 queryRange:(int)a5
{
  id v7 = a4;
  double v8 = v7;
  if (!v7) {
    goto LABEL_16;
  }
  if (!a5)
  {
    v15 = [v7 objectForKeyedSubscript:@"PLBatteryUIGraph24hrs"];
    v10 = [v15 objectForKeyedSubscript:@"PLBatteryUIBatteryLevelsKey"];

    if (v10)
    {
      uint64_t v16 = 0;
      uint64_t v17 = 4 * a3;
      while ((unint64_t)[v10 count] > v17 + v16)
      {
        v18 = [v10 objectAtIndexedSubscript:v17 + v16];
        v19 = v18;
        if (v18)
        {
          if ([v18 count] == (char *)&dword_0 + 2)
          {
            v20 = [v19 objectAtIndexedSubscript:1];
            unsigned __int8 v21 = [v20 intValue];

            v22 = [v19 objectAtIndexedSubscript:0];
            int v23 = [v22 intValue];

            if ((v21 & 1) == 0 && v23 >= 1)
            {

              char v14 = 1;
              goto LABEL_15;
            }
          }
        }

        if (++v16 == 4) {
          goto LABEL_14;
        }
      }
      goto LABEL_14;
    }
LABEL_16:
    char v14 = 0;
    goto LABEL_17;
  }
  double v9 = [v7 objectForKeyedSubscript:@"PLBatteryUIGraphDays"];
  v10 = v9;
  if (!v9 || (unint64_t)[v9 count] <= a3)
  {
LABEL_14:
    char v14 = 0;
    goto LABEL_15;
  }
  double v11 = [v10 objectAtIndexedSubscript:a3];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"PLBatteryUIEnergyKey"];
  signed int v13 = [v12 intValue];

  char v14 = v13 > 0;
LABEL_15:

LABEL_17:
  return v14;
}

+ (BOOL)isDateMidnight:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[NSCalendar currentCalendar];
  id v5 = [v4 startOfDayForDate:v3];
  unsigned __int8 v6 = [v5 isEqual:v3];

  return v6;
}

+ (id)convertImageToGrayScale:(id)a3
{
  id v3 = a3;
  [v3 size];
  double v5 = v4;
  [v3 size];
  double v7 = v6;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  double v9 = CGBitmapContextCreate(0, (unint64_t)v5, (unint64_t)v7, 8uLL, 0, DeviceGray, 1u);
  id v10 = v3;
  double v11 = (CGImage *)[v10 CGImage];

  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = v5;
  v16.size.height = v7;
  CGContextDrawImage(v9, v16, v11);
  Image = CGBitmapContextCreateImage(v9);
  signed int v13 = +[UIImage imageWithCGImage:Image];
  CGImageRelease(Image);
  CGContextRelease(v9);
  CGColorSpaceRelease(DeviceGray);

  return v13;
}

+ (id)convertImage:(id)a3 toColor:(id)a4
{
  id v5 = a4;
  double v6 = [a3 imageWithRenderingMode:2];
  [v6 size];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [v6 scale];
  CGFloat v12 = v11;
  v19.width = v8;
  v19.height = v10;
  UIGraphicsBeginImageContextWithOptions(v19, 0, v12);
  [v5 set];

  [v6 size];
  double v14 = v13;
  [v6 size];
  objc_msgSend(v6, "drawInRect:", 0.0, 0.0, v14, v15);
  CGRect v16 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v16;
}

+ (id)clipWithRoundedCorner:(double)a3 toImage:(id)a4
{
  id v5 = a4;
  [v5 size];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v10 = +[UIScreen mainScreen];
  [v10 scale];
  CGFloat v12 = v11;
  v25.width = v7;
  v25.height = v9;
  UIGraphicsBeginImageContextWithOptions(v25, 0, v12);

  [v5 size];
  double v14 = v13;
  [v5 size];
  double v16 = v15;
  [v5 size];
  v18 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v14, v16, v17 * a3);
  [v18 addClip];

  [v5 size];
  double v20 = v19;
  [v5 size];
  objc_msgSend(v5, "drawInRect:", 0.0, 0.0, v20, v21);

  v22 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v22;
}

+ (id)screenOnColor
{
  return +[UIColor systemBlueColor];
}

+ (id)screenOffColor
{
  v2 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
  id v3 = +[UIColor systemCyanColor];
  double v4 = [v3 resolvedColorWithTraitCollection:v2];

  return v4;
}

+ (BOOL)isTappedIntervalCurrentBucket:(int)a3 withQueryRange:(int)a4 andEndTime:(id)a5
{
  if (a4) {
    return a3 == 9;
  }
  double v6 = [a5 dateByAddingTimeInterval:(double)(23 - a3) * -3600.0];
  CGFloat v7 = [v6 dateByAddingTimeInterval:-3600.0];
  double v8 = +[NSDate date];
  [v8 timeIntervalSinceDate:v7];
  if (v9 >= 0.0)
  {
    [v8 timeIntervalSinceDate:v6];
    BOOL v5 = v10 <= 0.0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)scaledScreenOn:(double)a3 screenOff:(double)a4 andMaxTotalTime:(double)a5
{
  double v5 = a4;
  double v6 = a3 + a4;
  if (v6 > a5)
  {
    a3 = a3 * a5 / v6;
    double v5 = v5 * a5 / v6;
  }
  CGFloat v7 = +[NSNumber numberWithDouble:a3];
  v11[0] = v7;
  double v8 = +[NSNumber numberWithDouble:v5];
  v11[1] = v8;
  double v9 = +[NSArray arrayWithObjects:v11 count:2];

  return v9;
}

+ (id)replaceWithUnBreakableSpace:(id)a3
{
  return [a3 stringByReplacingOccurrencesOfString:@" " withString:@" "];
}

+ (BOOL)isInUnitTest
{
  if (qword_D7410 != -1) {
    dispatch_once(&qword_D7410, &stru_BF470);
  }
  return byte_D7408;
}

+ (id)iconUTTypeIdentifierForSuggestion:(int)a3
{
  unsigned int v4 = +[PLModelingUtilities isiPhone];
  double v5 = @"ipad";
  if (v4) {
    double v5 = @"iphone";
  }
  double v6 = v5;
  switch(a3)
  {
    case 1:
      double v8 = @"com.apple.graphic-icon.auto-lock";
      break;
    case 2:
      double v8 = @"com.apple.graphic-icon.display";
      break;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 10:
    case 11:
      CGFloat v7 = BUILogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        sub_8E768(a3, v7);
      }

      double v8 = 0;
      break;
    case 8:
      double v8 = @"com.apple.graphic-icon.recent-usage";
      break;
    case 9:
    case 12:
      double v8 = +[NSString stringWithFormat:@"com.apple.graphic-icon.%@.battery-ongoing-restore", v6];
      break;
    default:
      double v8 = @"com.apple.graphic-icon.auto-brightness";
      break;
  }

  return v8;
}

+ (id)iconUTTypeIdentifierForNonApp:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[PLModelingUtilities isiPhone];
  double v5 = @"ipad";
  if (v4) {
    double v5 = @"iphone";
  }
  double v6 = v5;
  if ([v3 isEqualToString:@"DeviceSetup"])
  {
    +[NSString stringWithFormat:@"com.apple.graphic-icon.%@.battery-ongoing-restore", v6];
LABEL_5:
    CGFloat v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"EN"])
  {
    CGFloat v7 = @"com.apple.graphic-icon.exposure-notifications";
  }
  else if ([v3 isEqualToString:@"Flashlight"])
  {
    CGFloat v7 = @"com.apple.graphic-icon.flashlight";
  }
  else
  {
    if ([v3 isEqualToString:@"HLS"])
    {
      +[NSString stringWithFormat:@"com.apple.graphic-icon.apps-on-%@", v6];
      goto LABEL_5;
    }
    if ([v3 isEqualToString:@"PoorCellCondition"])
    {
      CGFloat v7 = @"com.apple.graphic-icon.cellular-settings";
    }
    else if ([v3 isEqualToString:@"PowerOutAccessories"])
    {
      CGFloat v7 = @"com.apple.graphic-icon.usb";
    }
    else if ([v3 isEqualToString:@"SoundRecognition"])
    {
      CGFloat v7 = @"com.apple.graphic-icon.sound-recognition";
    }
    else if ([v3 isEqualToString:@"Hotspot"])
    {
      CGFloat v7 = @"com.apple.graphic-icon.personal-hotspot";
    }
    else
    {
      double v8 = BUILogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_8E7E0((uint64_t)v3, v8);
      }

      CGFloat v7 = 0;
    }
  }
LABEL_23:

  return v7;
}

+ (id)specFromDictionary:(id)a3
{
  uint64_t v14 = 0;
  id v3 = +[NSJSONSerialization dataWithJSONObject:a3 options:0 error:&v14];
  if (v14)
  {
    unsigned int v4 = BUILogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_8EE08(v4, v5, v6, v7, v8, v9, v10, v11);
    }

    id v12 = 0;
  }
  else
  {
    id v12 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];
  }

  return v12;
}

+ (id)loadDataFromJSONResource:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 pathForResource:v3 ofType:0];

  if (v5)
  {
    uint64_t v6 = +[NSData dataWithContentsOfFile:v5];
    if (v6)
    {
      uint64_t v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:0];
      goto LABEL_10;
    }
    double v15 = BUILogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_8EE78(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  else
  {
    uint64_t v6 = BUILogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_8EE40(v6, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  uint64_t v7 = 0;
LABEL_10:

  return v7;
}

+ (double)millisecondsFromMachTime:(unint64_t)a3
{
  if (qword_D7498 != -1) {
    dispatch_once(&qword_D7498, &stru_BF6B8);
  }
  return *(double *)&qword_D74A0 * (double)a3 / 1000000.0;
}

+ (BOOL)is24HourClock
{
  id v2 = +[NSLocale currentLocale];
  char v3 = PSLocaleUses24HourClock();
  CFRelease(v2);

  return v3;
}

+ (id)getLocalizedStringFromNumber:(id)a3
{
  return +[NSNumberFormatter localizedStringFromNumber:a3 numberStyle:3];
}

+ (id)containerPath
{
  if (qword_D74B0 != -1) {
    dispatch_once(&qword_D74B0, &stru_BF6D8);
  }
  id v2 = (void *)qword_D74A8;

  return v2;
}

+ (BOOL)inDemoMode
{
  if (qword_D74B8 != -1) {
    dispatch_once(&qword_D74B8, &stru_BF6F8);
  }
  return byte_D74C0;
}

+ (id)getDefaultValueForKey:(id)a3
{
  id v3 = a3;
  +[PLBatteryUIUtilities containerPath];
  unsigned int v4 = (void *)_CFPreferencesCopyAppValueWithContainer();

  return v4;
}

+ (void)setDefaultValue:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[PLBatteryUIUtilities containerPath];
  _CFPreferencesSetAppValueWithContainer();
}

+ (BOOL)isDeviceLayoutRTL
{
  id v2 = +[UIApplication sharedApplication];
  BOOL v3 = [v2 userInterfaceLayoutDirection] == (char *)&dword_0 + 1;

  return v3;
}

+ (int64_t)localizedLeftTextAlignment
{
  if (+[PLBatteryUIUtilities isDeviceLayoutRTL]) {
    return 2;
  }
  else {
    return 0;
  }
}

+ (int64_t)localizedRightTextAlignment
{
  if (+[PLBatteryUIUtilities isDeviceLayoutRTL]) {
    return 0;
  }
  else {
    return 2;
  }
}

+ (id)localizedStringWithPercentage:(double)a3
{
  BOOL v3 = +[NSNumber numberWithDouble:a3 / 100.0];
  unsigned int v4 = +[NSNumberFormatter localizedStringFromNumber:v3 numberStyle:3];

  return v4;
}

+ (id)getRelativeDateStringForDate:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[NSDate date];
  [v4 timeIntervalSinceDate:v3];
  if (v5 < 0.0)
  {
    id v6 = &stru_C3A18;
    goto LABEL_13;
  }
  double v7 = v5;
  uint64_t v8 = +[NSCalendar currentCalendar];
  id v9 = objc_alloc_init((Class)NSDateFormatter);
  uint64_t v10 = +[NSLocale currentLocale];
  [v9 setLocale:v10];

  [v9 setDoesRelativeDateFormatting:1];
  if (![v8 isDate:v3 inSameDayAsDate:v4])
  {
    if (v7 >= 604800.0) {
      CFStringRef v12 = @"M/d/yyyy";
    }
    else {
      CFStringRef v12 = @"EEE j:mm a";
    }
    [v9 setLocalizedDateFormatFromTemplate:v12];
    goto LABEL_11;
  }
  if (v7 >= 10800.0)
  {
    [v9 setDateStyle:0];
    [v9 setTimeStyle:1];
LABEL_11:
    uint64_t v13 = [v9 stringFromDate:v3];
    goto LABEL_12;
  }
  id v11 = objc_alloc_init((Class)BSUIRelativeDateLabel);
  objc_msgSend(v11, "timerFiredWithValue:forResolution:comparedToNow:");
  uint64_t v13 = [v11 text];

LABEL_12:
  id v6 = v13;

LABEL_13:

  return v6;
}

+ (id)getLocalizedTimeStringFromFutureDate:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[NSDate date];
  [v3 timeIntervalSinceDate:v4];
  if (v5 >= 0.0)
  {
    double v7 = v5;
    uint64_t v8 = +[NSCalendar currentCalendar];
    id v9 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v10 = +[NSLocale currentLocale];
    [v9 setLocale:v10];

    [v9 setDoesRelativeDateFormatting:1];
    if ([v8 isDate:v3 inSameDayAsDate:v4])
    {
      [v9 setDateStyle:0];
      [v9 setTimeStyle:1];
      id v11 = BUILogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_8EFB8((uint64_t)v3, v11);
      }

      CFStringRef v12 = [v9 stringFromDate:v3];
      uint64_t v13 = BUILogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_8EF40((uint64_t)v12, v13);
      }
    }
    else
    {
      if (v7 >= 604800.0) {
        CFStringRef v14 = @"M/d/yyyy";
      }
      else {
        CFStringRef v14 = @"EEE j:mm a";
      }
      [v9 setLocalizedDateFormatFromTemplate:v14];
      CFStringRef v12 = [v9 stringFromDate:v3];
    }
    id v6 = v12;
  }
  else
  {
    id v6 = &stru_C3A18;
  }

  return v6;
}

+ (id)accessibilityDescriptionForHour:(double)a3 duration:(double)a4
{
  if (qword_D7500 != -1) {
    dispatch_once(&qword_D7500, &stru_BF778);
  }
  id v6 = BatteryUILocalization(@"AX_BUIGRAPH_TO");
  double v7 = (void *)qword_D74F8;
  uint64_t v8 = +[NSDate dateWithTimeIntervalSince1970:a3];
  id v9 = [v7 stringFromDate:v8];
  uint64_t v10 = (void *)qword_D74F8;
  id v11 = +[NSDate dateWithTimeIntervalSince1970:a3 + a4];
  CFStringRef v12 = [v10 stringFromDate:v11];
  uint64_t v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v9, v12);

  return v13;
}

+ (id)accessibilityDescriptionForChargingTime:(double)a3
{
  if (qword_D7510 != -1) {
    dispatch_once(&qword_D7510, &stru_BF798);
  }
  unsigned int v4 = (void *)qword_D7508;
  double v5 = +[NSDate dateWithTimeIntervalSince1970:a3];
  id v6 = [v4 stringFromDate:v5];

  return v6;
}

+ (id)accessibilityDescriptionForDate:(double)a3
{
  if (qword_D7520 != -1) {
    dispatch_once(&qword_D7520, &stru_BF7B8);
  }
  unsigned int v4 = (void *)qword_D7518;
  double v5 = +[NSDate dateWithTimeIntervalSince1970:a3];
  id v6 = [v4 stringFromDate:v5];

  return v6;
}

+ (id)accessibilityDescriptionForDateTime:(double)a3
{
  if (qword_D7530 != -1) {
    dispatch_once(&qword_D7530, &stru_BF7D8);
  }
  unsigned int v4 = (void *)qword_D7528;
  double v5 = +[NSDate dateWithTimeIntervalSince1970:a3];
  id v6 = [v4 stringFromDate:v5];

  return v6;
}

+ (id)accessibilityDescriptionForTimeInterval:(double)a3
{
  if (qword_D7540 != -1) {
    dispatch_once(&qword_D7540, &stru_BF7F8);
  }
  if (a3 >= 60.0) {
    [(id)qword_D7538 stringFromTimeInterval:a3];
  }
  else {
  unsigned int v4 = BatteryUILocalization(@"AX_BUIGRAPH_LESS_THAN_A_MINUTE");
  }

  return v4;
}

+ (BOOL)shouldDisplayAuthView
{
  return 0;
}

@end