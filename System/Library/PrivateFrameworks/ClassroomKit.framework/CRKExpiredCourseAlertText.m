@interface CRKExpiredCourseAlertText
+ (id)new;
- (CRKCourse)course;
- (CRKExpiredCourseAlertText)init;
- (CRKExpiredCourseAlertText)initWithCourse:(id)a3;
- (NSString)acknowledgeOptionTitle;
- (NSString)message;
- (NSString)title;
@end

@implementation CRKExpiredCourseAlertText

- (CRKExpiredCourseAlertText)initWithCourse:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CRKExpiredCourseAlertText.m", 23, @"Invalid parameter not satisfying: %@", @"course" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)CRKExpiredCourseAlertText;
  v7 = [(CRKExpiredCourseAlertText *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_course, a3);
  }

  return v8;
}

- (NSString)title
{
  v3 = NSString;
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"“%@” has expired and will be removed" value:&stru_26D7E7B00 table:0];
  id v6 = [(CRKExpiredCourseAlertText *)self course];
  v7 = [v6 courseName];
  v8 = objc_msgSend(v3, "stringWithFormat:", v5, v7);

  return (NSString *)v8;
}

- (NSString)acknowledgeOptionTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"Remove" value:&stru_26D7E7B00 table:0];

  return (NSString *)v3;
}

- (NSString)message
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"Classes that have not been joined for more than a year are automatically removed." value:&stru_26D7E7B00 table:0];

  return (NSString *)v3;
}

- (CRKCourse)course
{
  return self->_course;
}

- (void).cxx_destruct
{
}

+ (id)new
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, a1, @"CRKExpiredCourseAlertText.m", 55, @"%@ is unavailable for %@", v5, a1 object file lineNumber description];

  return 0;
}

- (CRKExpiredCourseAlertText)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"CRKExpiredCourseAlertText.m", 60, @"%@ is unavailable for %@", v5, self object file lineNumber description];

  return 0;
}

@end