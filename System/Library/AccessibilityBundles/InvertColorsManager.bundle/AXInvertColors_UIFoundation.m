@interface AXInvertColors_UIFoundation
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_UIFoundation

+ (void)performValidations:(id)a3
{
}

+ (void)installCategories:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A680;
  block[3] = &unk_44528;
  id v6 = a3;
  uint64_t v3 = qword_83648;
  id v4 = v6;
  if (v3 != -1) {
    dispatch_once(&qword_83648, block);
  }
}

+ (int64_t)helperType
{
  return 1;
}

@end