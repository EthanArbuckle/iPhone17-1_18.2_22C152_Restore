@interface NSBundle
+ (id)asc_frameworkBundle;
+ (id)asc_localizedStringKeyPlatformSuffix;
+ (id)asc_realMainBundle;
@end

@implementation NSBundle

+ (id)asc_realMainBundle
{
  return +[NSBundle mainBundle];
}

+ (id)asc_frameworkBundle
{
  if (qword_1001A6140 != -1) {
    dispatch_once(&qword_1001A6140, &stru_100184500);
  }
  v2 = (void *)qword_1001A6148;

  return v2;
}

+ (id)asc_localizedStringKeyPlatformSuffix
{
  return @"_IOS";
}

@end