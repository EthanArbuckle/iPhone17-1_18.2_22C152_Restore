@interface BLSBacklightChangeSourceEventSuppressionMetadata(BLSHSuppressionEvent)
- (uint64_t)initWithSuppressionEvent:()BLSHSuppressionEvent;
@end

@implementation BLSBacklightChangeSourceEventSuppressionMetadata(BLSHSuppressionEvent)

- (uint64_t)initWithSuppressionEvent:()BLSHSuppressionEvent
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  uint64_t v6 = [v4 reason];

  return [a1 initWithType:v5 reason:v6];
}

@end