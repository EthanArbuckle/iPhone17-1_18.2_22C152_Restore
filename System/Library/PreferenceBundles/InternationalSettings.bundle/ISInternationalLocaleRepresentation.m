@interface ISInternationalLocaleRepresentation
+ (id)sharedInstance;
- (ISInternationalLocaleRepresentation)init;
- (NSString)calendarIdentifier;
- (NSString)currentlySelectedCalendarIdentifier;
- (unint64_t)calendarDirectionality;
- (void)setCalendarDirectionality:(unint64_t)a3;
- (void)setCalendarIdentifier:(id)a3;
- (void)setCurrentlySelectedCalendarIdentifier:(id)a3;
@end

@implementation ISInternationalLocaleRepresentation

+ (id)sharedInstance
{
  if (qword_391C0 != -1) {
    dispatch_once(&qword_391C0, &stru_30EE8);
  }
  v2 = (void *)qword_391C8;

  return v2;
}

- (ISInternationalLocaleRepresentation)init
{
  v5.receiver = self;
  v5.super_class = (Class)ISInternationalLocaleRepresentation;
  v2 = [(ISInternationalLocaleRepresentation *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ISInternationalLocaleRepresentation *)v2 setCurrentlySelectedCalendarIdentifier:0];
  }
  return v3;
}

- (void)setCalendarIdentifier:(id)a3
{
  id v10 = a3;
  v4 = +[NSLocale currentLocale];
  objc_super v5 = [v4 localeIdentifier];

  v6 = +[NSLocale componentsFromLocaleIdentifier:v5];
  v7 = +[NSMutableDictionary dictionaryWithDictionary:v6];
  v8 = +[IntlUtility defaultCalendarForLocaleID:v5];
  if ([v8 isEqual:v10]) {
    [v7 removeObjectForKey:@"calendar"];
  }
  else {
    [v7 setObject:v10 forKey:@"calendar"];
  }
  if (([v6 isEqual:v7] & 1) == 0)
  {
    uint64_t v9 = +[NSLocale canonicalLocaleIdentifierFromComponents:v7];

    +[NSLocale setLocaleOnly:v9];
    +[InternationalSettingsController syncPreferencesForLanguageOrLocaleChange];
    objc_super v5 = (void *)v9;
  }
  [(ISInternationalLocaleRepresentation *)self setCurrentlySelectedCalendarIdentifier:v10];
}

- (NSString)calendarIdentifier
{
  v3 = [(ISInternationalLocaleRepresentation *)self currentlySelectedCalendarIdentifier];

  if (v3)
  {
    v4 = [(ISInternationalLocaleRepresentation *)self currentlySelectedCalendarIdentifier];
  }
  else
  {
    objc_super v5 = +[NSLocale currentLocale];
    v6 = [v5 localeIdentifier];

    v7 = +[NSLocale componentsFromLocaleIdentifier:v6];
    v4 = [v7 objectForKey:@"calendar"];
    if (!v4)
    {
      v4 = +[IntlUtility defaultCalendarForLocaleID:v6];
    }
  }

  return (NSString *)v4;
}

- (void)setCalendarDirectionality:(unint64_t)a3
{
  v3 = &kCFBooleanTrue;
  if (a3 != 2) {
    v3 = &kCFBooleanFalse;
  }
  CFBooleanRef v4 = *v3;
  if (a3) {
    CFBooleanRef v5 = v4;
  }
  else {
    CFBooleanRef v5 = 0;
  }
  CFPreferencesSetAppValue(@"NSLocaleCalendarDirectionIsRightToLeft", v5, kCFPreferencesAnyApplication);
}

- (unint64_t)calendarDirectionality
{
  v2 = +[NSLocale currentLocale];
  v3 = (char *)[v2 _calendarDirection];

  if (v3 == (unsigned char *)&dword_0 + 1) {
    return 2;
  }
  else {
    return 1;
  }
}

- (NSString)currentlySelectedCalendarIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCurrentlySelectedCalendarIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end