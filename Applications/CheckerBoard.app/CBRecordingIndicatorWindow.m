@interface CBRecordingIndicatorWindow
- (BOOL)isActive;
- (CBRecordingIndicatorWindow)initWithWindowScene:(id)a3 debugName:(id)a4;
@end

@implementation CBRecordingIndicatorWindow

- (CBRecordingIndicatorWindow)initWithWindowScene:(id)a3 debugName:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CBRecordingIndicatorWindow;
  return -[CBRecordingIndicatorWindow initWithWindowScene:](&v5, "initWithWindowScene:", a3, a4);
}

- (BOOL)isActive
{
  return 0;
}

@end