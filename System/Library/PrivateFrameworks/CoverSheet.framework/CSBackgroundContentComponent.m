@interface CSBackgroundContentComponent
- (CSBackgroundContentComponent)init;
@end

@implementation CSBackgroundContentComponent

- (CSBackgroundContentComponent)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSBackgroundContentComponent;
  v2 = [(CSComponent *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CSComponent *)v2 setType:24];
  }
  return v3;
}

@end