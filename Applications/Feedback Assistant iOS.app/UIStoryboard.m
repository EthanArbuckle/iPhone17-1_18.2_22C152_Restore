@interface UIStoryboard
+ (id)fbaMainStoryboard;
@end

@implementation UIStoryboard

+ (id)fbaMainStoryboard
{
  if (qword_100121E38 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100125F70;

  return v2;
}

@end