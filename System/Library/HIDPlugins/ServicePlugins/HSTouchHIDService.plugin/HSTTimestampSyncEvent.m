@interface HSTTimestampSyncEvent
+ (const)hsClassName;
- (int64_t)deviceTimestampOffsetMs;
@end

@implementation HSTTimestampSyncEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)84,(char)105,(char)109,(char)101,(char)115,(char)116,(char)97,(char)109,(char)112,(char)83,(char)121,(char)110,(char)99,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (int64_t)deviceTimestampOffsetMs
{
  return self->super.value;
}

@end