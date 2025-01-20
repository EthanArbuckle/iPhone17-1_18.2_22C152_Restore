@interface ARUICountdownDefaultAnimation
+ (id)identifier;
- (id)description;
@end

@implementation ARUICountdownDefaultAnimation

+ (id)identifier
{
  return @"ARUICountdownDefaultTimeline";
}

- (id)description
{
  v2 = NSString;
  v3 = [(id)objc_opt_class() identifier];
  v4 = [v2 stringWithFormat:@"<ARUICountdownDefaultAnimation: %@>", v3];

  return v4;
}

@end