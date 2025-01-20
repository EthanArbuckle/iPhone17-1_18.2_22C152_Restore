@interface HMMClosedClosedInterval
- (id)negativeInfinityIntervalString;
- (id)positiveInfinityIntervalString;
- (id)standardIntervalString;
@end

@implementation HMMClosedClosedInterval

- (id)positiveInfinityIntervalString
{
  return @"%@+";
}

- (id)negativeInfinityIntervalString
{
  return @"<=%@";
}

- (id)standardIntervalString
{
  return @"[%@, %@]";
}

@end