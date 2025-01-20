@interface CSLUICalendarIconSource
+ (id)sharedInstance;
- (CSLUICalendarIconSource)init;
- (UIImage)calendarIcon;
- (UIImage)circularCalendarIcon;
- (id)_calendarOverrideDate;
- (id)_resizeImage:(id)a3 newSize:(CGSize)a4;
- (void)_notifyObserversWithIcon:(id)a3 circularIcon:(id)a4;
- (void)_timeOrLocaleChanged:(id)a3;
- (void)_updateCalendarIcon:(BOOL)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation CSLUICalendarIconSource

+ (id)sharedInstance
{
  if (qword_45E50 != -1) {
    dispatch_once(&qword_45E50, &stru_3CB88);
  }
  v2 = (void *)qword_45E48;

  return v2;
}

- (CSLUICalendarIconSource)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSLUICalendarIconSource;
  v2 = [(CSLUICalendarIconSource *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (CSLPRFConcurrentObserverStore *)[objc_alloc((Class)CSLPRFConcurrentObserverStore) initWithServiceName:@"com.apple.carousel.csluicalendariconsource"];
    observers = v3->_observers;
    v3->_observers = v4;

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v3 selector:"_timeOrLocaleChanged:" name:UIApplicationSignificantTimeChangeNotification object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v3 selector:"_timeOrLocaleChanged:" name:NSCalendarDayChangedNotification object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v3 selector:"_timeOrLocaleChanged:" name:NSCurrentLocaleDidChangeNotification object:0];

    [(CSLUICalendarIconSource *)v3 _updateCalendarIcon:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSLUICalendarIconSource;
  [(CSLUICalendarIconSource *)&v4 dealloc];
}

- (void)_timeOrLocaleChanged:(id)a3
{
  objc_super v4 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_EBF4;
  block[3] = &unk_3CBB0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_notifyObserversWithIcon:(id)a3 circularIcon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  observers = self->_observers;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_ECC4;
  v11[3] = &unk_3CC00;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(CSLPRFConcurrentObserverStore *)observers enumerateObserversWithBlock:v11];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (UIImage)calendarIcon
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v4 = self->_squareCalendarIcon;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)_calendarOverrideDate
{
  if (qword_45E60 != -1) {
    dispatch_once(&qword_45E60, &stru_3CC20);
  }
  v2 = (void *)qword_45E58;

  return v2;
}

- (void)_updateCalendarIcon:(BOOL)a3
{
  BOOL v49 = a3;
  objc_super v4 = +[NSCalendar currentCalendar];
  v50 = self;
  v5 = [(CSLUICalendarIconSource *)self _calendarOverrideDate];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[NSDate date];
  }
  v8 = v7;

  +[CSLUILayoutIconView defaultDiameter];
  id v9 = +[CSLUICalendarIconLayoutItem calendarIconLayoutModelForIconDiameter:"calendarIconLayoutModelForIconDiameter:"];
  double y = CGPointZero.y;
  id v11 = v8;
  id v12 = v4;
  [v9 size];
  double v14 = v13;
  double v16 = v15;
  v17 = +[NSParagraphStyle defaultParagraphStyle];
  id v18 = [v17 mutableCopy];

  [v18 setAlignment:1];
  v19 = +[NSLocale currentLocale];
  v20 = [v19 objectForKey:NSLocaleLanguageCode];
  if ([v20 isEqualToString:@"ja"]) {
    +[UIColor blackColor];
  }
  else {
  v47 = +[UIColor systemRedColor];
  }

  v45 = [v9 dayFont];
  v21 = [v12 components:528 fromDate:v11];

  v48 = v12;
  v46 = CSLStringAbbreviationForDayOfWeek((uint64_t)[v21 weekday]);
  v53[0] = NSForegroundColorAttributeName;
  v53[1] = NSFontAttributeName;
  v54[0] = v47;
  v54[1] = v45;
  v53[2] = NSParagraphStyleAttributeName;
  id v22 = [v18 copy];
  v54[2] = v22;
  v44 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:3];

  v23 = +[UIColor blackColor];
  v24 = [v9 dateFont];
  v25 = v18;
  v26 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v21 day]);
  v27 = +[NSNumberFormatter localizedStringFromNumber:v26 numberStyle:0];

  v51[0] = NSForegroundColorAttributeName;
  v51[1] = NSFontAttributeName;
  v52[0] = v23;
  v52[1] = v24;
  v51[2] = NSParagraphStyleAttributeName;
  id v28 = [v25 copy];
  v52[2] = v28;
  v29 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:3];

  v55.width = v14;
  v55.height = v16;
  UIGraphicsBeginImageContextWithOptions(v55, 0, 0.0);
  v30 = +[UIColor whiteColor];
  [v30 setFill];

  id v31 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", CGPointZero.x, y, v14, v16);
  CurrentContext = UIGraphicsGetCurrentContext();
  v56.origin.x = CGPointZero.x;
  v56.origin.double y = y;
  v56.size.width = v14;
  v56.size.height = v16;
  CGContextFillRect(CurrentContext, v56);
  [v9 dayHorizontalOffset];
  double v34 = v33 + 0.0;
  [v9 dayBaselineFromOriginY];
  double v36 = v35;
  [v9 dayHorizontalOffset];
  double v38 = v14 + v37;
  [v45 lineHeight];
  objc_msgSend(v46, "drawWithRect:options:attributes:context:", 0, v44, 0, v34, v36, v38, v39);
  [v9 dateBaselineFromOriginY];
  double v41 = v40;
  [v24 lineHeight];
  objc_msgSend(v27, "drawWithRect:options:attributes:context:", 0, v29, 0, 0.0, v41, v14, v42);
  v43 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  os_unfair_lock_lock(&v50->_lock);
  objc_storeStrong((id *)&v50->_squareCalendarIcon, v43);
  os_unfair_lock_unlock(&v50->_lock);
  if (v49) {
    [(CSLUICalendarIconSource *)v50 _notifyObserversWithIcon:v43 circularIcon:0];
  }
}

- (id)_resizeImage:(id)a3 newSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  v20.origin.CGFloat x = 0.0;
  v20.origin.CGFloat y = 0.0;
  v20.size.double width = width;
  v20.size.double height = height;
  CGRect v21 = CGRectIntegral(v20);
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat v9 = v21.size.width;
  CGFloat v10 = v21.size.height;
  id v11 = v6;
  id v12 = (CGImage *)[v11 CGImage];

  v19.double width = width;
  v19.double height = height;
  UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
  double v14 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", CGPointZero.x, CGPointZero.y, width, height, (double)(uint64_t)llround(width * 0.5));
  [v14 addClip];

  v17.b = 0.0;
  v17.c = 0.0;
  v17.a = 1.0;
  *(_OWORD *)&v17.d = xmmword_2E810;
  v17.tCGFloat y = height;
  CGContextConcatCTM(CurrentContext, &v17);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.double width = v9;
  v22.size.double height = v10;
  CGContextDrawImage(CurrentContext, v22, v12);
  double v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v15;
}

- (UIImage)circularCalendarIcon
{
  return self->_circularCalendarIcon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circularCalendarIcon, 0);
  objc_storeStrong((id *)&self->_squareCalendarIcon, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end