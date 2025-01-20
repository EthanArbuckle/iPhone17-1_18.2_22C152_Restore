@interface DTKTraceTapMessage
+ (BOOL)supportsSecureCoding;
- (NSDictionary)sessionMetadata;
- (NSDictionary)triggerMetadata;
- (NSString)localFilePath;
- (unint64_t)coreCount;
- (unint64_t)logicalProcessorCore;
- (unint64_t)recordCount;
- (unint64_t)triggerCount;
- (unint64_t)triggerIndex;
- (unsigned)tapVersion;
- (void)setCoreCount:(unint64_t)a3;
- (void)setLocalFilePath:(id)a3;
- (void)setLogicalProcessorCore:(unint64_t)a3;
- (void)setRecordCount:(unint64_t)a3;
- (void)setSessionMetadata:(id)a3;
- (void)setTapVersion:(unsigned int)a3;
- (void)setTriggerCount:(unint64_t)a3;
- (void)setTriggerIndex:(unint64_t)a3;
- (void)setTriggerMetadata:(id)a3;
@end

@implementation DTKTraceTapMessage

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

- (NSDictionary)sessionMetadata
{
  v2 = [(DTTapMessage *)self plist];
  uint64_t v3 = [v2 objectForKey:@"sm"];

  return (NSDictionary *)v3;
}

- (void)setSessionMetadata:(id)a3
{
  id v4 = a3;
  id v6 = [(DTTapMessage *)self plist];
  id v5 = (void *)[v4 copy];

  [v6 setObject:v5 forKey:@"sm"];
}

- (unint64_t)coreCount
{
  v2 = [(DTTapMessage *)self plist];
  uint64_t v3 = [v2 objectForKey:@"cc"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)setCoreCount:(unint64_t)a3
{
  id v5 = [(DTTapMessage *)self plist];
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"cc"];
}

- (unint64_t)triggerCount
{
  v2 = [(DTTapMessage *)self plist];
  uint64_t v3 = [v2 objectForKey:@"tc"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)setTriggerCount:(unint64_t)a3
{
  id v5 = [(DTTapMessage *)self plist];
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"tc"];
}

- (unint64_t)triggerIndex
{
  v2 = [(DTTapMessage *)self plist];
  uint64_t v3 = [v2 objectForKey:@"ti"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)setTriggerIndex:(unint64_t)a3
{
  id v5 = [(DTTapMessage *)self plist];
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"ti"];
}

- (unint64_t)logicalProcessorCore
{
  v2 = [(DTTapMessage *)self plist];
  uint64_t v3 = [v2 objectForKey:@"lc"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)setLogicalProcessorCore:(unint64_t)a3
{
  id v5 = [(DTTapMessage *)self plist];
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"lc"];
}

- (unint64_t)recordCount
{
  v2 = [(DTTapMessage *)self plist];
  uint64_t v3 = [v2 objectForKey:@"rc"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)setRecordCount:(unint64_t)a3
{
  id v5 = [(DTTapMessage *)self plist];
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"rc"];
}

- (NSDictionary)triggerMetadata
{
  v2 = [(DTTapMessage *)self plist];
  uint64_t v3 = [v2 objectForKey:@"tm"];

  return (NSDictionary *)v3;
}

- (void)setTriggerMetadata:(id)a3
{
  id v4 = a3;
  id v6 = [(DTTapMessage *)self plist];
  id v5 = (void *)[v4 copy];

  [v6 setObject:v5 forKey:@"tm"];
}

- (NSString)localFilePath
{
  v2 = [(DTTapMessage *)self plist];
  uint64_t v3 = [v2 objectForKey:@"lfp"];

  return (NSString *)v3;
}

- (void)setLocalFilePath:(id)a3
{
  id v4 = a3;
  id v6 = [(DTTapMessage *)self plist];
  id v5 = (void *)[v4 copy];

  [v6 setObject:v5 forKey:@"lfp"];
}

@end