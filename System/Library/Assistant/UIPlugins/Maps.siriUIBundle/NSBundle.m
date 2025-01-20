@interface NSBundle
+ (id)_ma_bundle;
@end

@implementation NSBundle

+ (id)_ma_bundle
{
  if (qword_51B20 != -1) {
    dispatch_once(&qword_51B20, &stru_3D008);
  }
  v2 = (void *)qword_51B18;

  return v2;
}

@end