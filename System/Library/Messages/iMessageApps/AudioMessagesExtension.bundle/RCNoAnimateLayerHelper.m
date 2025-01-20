@interface RCNoAnimateLayerHelper
+ (id)sharedNoAnimationHelper;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
@end

@implementation RCNoAnimateLayerHelper

+ (id)sharedNoAnimationHelper
{
  if (qword_82DA8 != -1) {
    dispatch_once(&qword_82DA8, &stru_6D060);
  }
  v2 = (void *)qword_82DA0;

  return v2;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  v4 = +[NSNull null];

  return v4;
}

@end