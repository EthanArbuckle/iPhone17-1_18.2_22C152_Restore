@interface ACCUserDefaults
+ (id)sharedDefaults;
- (ACCUserDefaults)init;
@end

@implementation ACCUserDefaults

- (ACCUserDefaults)init
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = NSStringFromSelector("sharedDefaults");
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, @"Use +[%@ %@] instead of -%@.", v4, v5, NSStringFromSelector(a2));
  return 0;
}

+ (id)sharedDefaults
{
  if (qword_10013C7D0 != -1) {
    dispatch_once(&qword_10013C7D0, &stru_10012A340);
  }
  return (id)qword_10013C7C8;
}

@end