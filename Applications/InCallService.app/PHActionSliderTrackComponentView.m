@interface PHActionSliderTrackComponentView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
@end

@implementation PHActionSliderTrackComponentView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"path"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PHActionSliderTrackComponentView;
    BOOL v5 = [(PHActionSliderTrackComponentView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

@end