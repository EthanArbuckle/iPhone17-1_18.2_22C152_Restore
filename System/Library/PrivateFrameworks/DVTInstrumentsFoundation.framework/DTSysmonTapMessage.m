@interface DTSysmonTapMessage
+ (BOOL)supportsSecureCoding;
- (NSDictionary)runningMetadata;
- (id)sessionMetadata;
- (unsigned)tapVersion;
- (void)setRunningMetadata:(id)a3;
- (void)setSessionMetadata:(id)a3;
- (void)setTapVersion:(unsigned int)a3;
@end

@implementation DTSysmonTapMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)tapVersion
{
  v2 = [(DTTapMessage *)self plist];
  v3 = [v2 objectForKey:@"tv"];
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (void)setTapVersion:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(DTTapMessage *)self plist];
  unsigned int v4 = [NSNumber numberWithUnsignedInt:v3];
  [v5 setObject:v4 forKey:@"tv"];
}

- (id)sessionMetadata
{
  v2 = [(DTTapMessage *)self plist];
  uint64_t v3 = [v2 objectForKey:@"sm"];

  return v3;
}

- (void)setSessionMetadata:(id)a3
{
  id v4 = a3;
  id v6 = [(DTTapMessage *)self plist];
  id v5 = (void *)[v4 copy];

  [v6 setObject:v5 forKey:@"sm"];
}

- (NSDictionary)runningMetadata
{
  return self->_runningMetadata;
}

- (void)setRunningMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end