@interface NSDate(Epoch)
+ (uint64_t)fm_dateFromEpoch:()Epoch;
- (uint64_t)fm_epoch;
- (uint64_t)fm_epochObject;
@end

@implementation NSDate(Epoch)

+ (uint64_t)fm_dateFromEpoch:()Epoch
{
  return [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)a3 / 1000.0];
}

- (uint64_t)fm_epoch
{
  [a1 timeIntervalSince1970];
  return (uint64_t)(v1 * 1000.0);
}

- (uint64_t)fm_epochObject
{
  double v1 = NSNumber;
  uint64_t v2 = objc_msgSend(a1, "fm_epoch");
  return [v1 numberWithLongLong:v2];
}

@end