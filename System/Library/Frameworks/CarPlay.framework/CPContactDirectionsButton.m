@interface CPContactDirectionsButton
+ (BOOL)supportsSecureCoding;
- (CPContactDirectionsButton)initWithHandler:(void *)handler;
@end

@implementation CPContactDirectionsButton

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPContactDirectionsButton)initWithHandler:(void *)handler
{
  v4.receiver = self;
  v4.super_class = (Class)CPContactDirectionsButton;
  return [(CPButton *)&v4 initWithImage:0 handler:handler];
}

@end