@interface DTTapStatusMessage
+ (BOOL)supportsSecureCoding;
- (DTTapStatusMessage)initWithStatus:(unsigned int)a3 timestamp:(unint64_t)a4 notice:(id)a5 info:(id)a6;
- (NSDictionary)info;
- (NSString)notice;
- (unint64_t)timestamp;
- (unsigned)status;
- (void)setInfo:(id)a3;
- (void)setNotice:(id)a3;
- (void)setStatus:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation DTTapStatusMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DTTapStatusMessage)initWithStatus:(unsigned int)a3 timestamp:(unint64_t)a4 notice:(id)a5 info:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)DTTapStatusMessage;
  v12 = [(DTTapMessage *)&v15 initAsKind:8];
  v13 = v12;
  if (v12)
  {
    [(DTTapStatusMessage *)v12 setStatus:v8];
    [(DTTapStatusMessage *)v13 setTimestamp:a4];
    [(DTTapStatusMessage *)v13 setNotice:v10];
    if (v11) {
      [(DTTapStatusMessage *)v13 setInfo:v11];
    }
  }

  return v13;
}

- (unsigned)status
{
  v2 = [(DTTapMessage *)self plist];
  v3 = [v2 objectForKey:@"status"];
  unsigned int v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)setStatus:(unsigned int)a3
{
  id v5 = [(DTTapMessage *)self plist];
  unsigned int v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"status"];
}

- (unint64_t)timestamp
{
  v2 = [(DTTapMessage *)self plist];
  v3 = [v2 objectForKey:@"ts"];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (void)setTimestamp:(unint64_t)a3
{
  id v5 = [(DTTapMessage *)self plist];
  unint64_t v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [v5 setObject:v4 forKey:@"ts"];
}

- (NSString)notice
{
  v2 = [(DTTapMessage *)self plist];
  v3 = [v2 objectForKey:@"notice"];

  return (NSString *)v3;
}

- (void)setNotice:(id)a3
{
  id v4 = a3;
  id v6 = [(DTTapMessage *)self plist];
  id v5 = (void *)[v4 copy];

  [v6 setObject:v5 forKey:@"notice"];
}

- (NSDictionary)info
{
  v2 = [(DTTapMessage *)self plist];
  v3 = [v2 objectForKey:@"info"];

  return (NSDictionary *)v3;
}

- (void)setInfo:(id)a3
{
  id v4 = a3;
  id v6 = [(DTTapMessage *)self plist];
  id v5 = (void *)[v4 copy];

  [v6 setObject:v5 forKey:@"info"];
}

@end