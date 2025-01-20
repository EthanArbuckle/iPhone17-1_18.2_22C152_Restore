@interface NSString(SessionProducerConsumer)
+ (uint64_t)_commandTypeForConsumerWithSubTopic:()SessionProducerConsumer;
+ (uint64_t)_commandTypeForProducerWithSubTopic:()SessionProducerConsumer;
- (id)_sessionConsumerSubTopic;
- (id)_sessionProducerSubTopic;
@end

@implementation NSString(SessionProducerConsumer)

+ (uint64_t)_commandTypeForConsumerWithSubTopic:()SessionProducerConsumer
{
  return [NSString stringWithFormat:@"%@%@", @"SessionConsumer+", a3];
}

+ (uint64_t)_commandTypeForProducerWithSubTopic:()SessionProducerConsumer
{
  return [NSString stringWithFormat:@"%@%@", @"SessionProducer+", a3];
}

- (id)_sessionProducerSubTopic
{
  if ([a1 hasPrefix:@"SessionProducer+"])
  {
    uint64_t v2 = [a1 rangeOfString:@"SessionProducer+"];
    v4 = [a1 substringFromIndex:v2 + v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_sessionConsumerSubTopic
{
  if ([a1 hasPrefix:@"SessionConsumer+"])
  {
    uint64_t v2 = [a1 rangeOfString:@"SessionConsumer+"];
    v4 = [a1 substringFromIndex:v2 + v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end