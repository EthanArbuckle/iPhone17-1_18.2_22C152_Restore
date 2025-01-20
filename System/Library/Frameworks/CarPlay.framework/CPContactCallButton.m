@interface CPContactCallButton
+ (BOOL)supportsSecureCoding;
- (CPContactCallButton)initWithHandler:(void *)handler;
@end

@implementation CPContactCallButton

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPContactCallButton)initWithHandler:(void *)handler
{
  v4.receiver = self;
  v4.super_class = (Class)CPContactCallButton;
  return [(CPButton *)&v4 initWithImage:0 handler:handler];
}

@end