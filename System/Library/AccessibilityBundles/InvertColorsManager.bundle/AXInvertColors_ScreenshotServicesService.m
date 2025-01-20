@interface AXInvertColors_ScreenshotServicesService
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
@end

@implementation AXInvertColors_ScreenshotServicesService

+ (void)installCategories:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2E14;
  block[3] = &unk_44528;
  id v6 = a3;
  uint64_t v3 = qword_83608;
  id v4 = v6;
  if (v3 != -1) {
    dispatch_once(&qword_83608, block);
  }
}

+ (int64_t)helperType
{
  return 2;
}

@end