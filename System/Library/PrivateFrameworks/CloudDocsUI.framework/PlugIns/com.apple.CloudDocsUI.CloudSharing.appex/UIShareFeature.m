@interface UIShareFeature
+ (UIShareFeatureState)coOwners;
@end

@implementation UIShareFeature

+ (UIShareFeatureState)coOwners
{
  if (qword_100061C78 != -1) {
    dispatch_once(&qword_100061C78, &stru_10004C958);
  }
  v2 = (void *)qword_100061C70;

  return (UIShareFeatureState *)v2;
}

@end