@interface HKHeartbeatSequenceSampleType
+ (id)heartbeatSequenceType;
- (Class)dataObjectClass;
@end

@implementation HKHeartbeatSequenceSampleType

+ (id)heartbeatSequenceType
{
  return +[HKObjectType dataTypeWithCode:119];
}

- (Class)dataObjectClass
{
  return (Class)objc_opt_class();
}

@end