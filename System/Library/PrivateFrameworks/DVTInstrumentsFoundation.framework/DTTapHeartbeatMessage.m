@interface DTTapHeartbeatMessage
+ (BOOL)supportsSecureCoding;
- (DTTapHeartbeatMessage)init;
- (unint64_t)heartbeatTime;
- (void)setHeartbeatTime:(unint64_t)a3;
@end

@implementation DTTapHeartbeatMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DTTapHeartbeatMessage)init
{
  v3.receiver = self;
  v3.super_class = (Class)DTTapHeartbeatMessage;
  return (DTTapHeartbeatMessage *)[(DTTapMessage *)&v3 initAsKind:8];
}

- (unint64_t)heartbeatTime
{
  v2 = [(DTTapMessage *)self plist];
  objc_super v3 = [v2 objectForKey:@"heart"];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (void)setHeartbeatTime:(unint64_t)a3
{
  id v5 = [(DTTapMessage *)self plist];
  unint64_t v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [v5 setObject:v4 forKey:@"heart"];
}

@end