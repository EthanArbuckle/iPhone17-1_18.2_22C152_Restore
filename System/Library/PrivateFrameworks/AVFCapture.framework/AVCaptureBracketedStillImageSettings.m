@interface AVCaptureBracketedStillImageSettings
- (id)initSubclass;
@end

@implementation AVCaptureBracketedStillImageSettings

- (id)initSubclass
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureBracketedStillImageSettings;
  return [(AVCaptureBracketedStillImageSettings *)&v3 init];
}

@end