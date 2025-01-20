@interface HMMOpenClosedInterval
- (id)negativeInfinityIntervalString;
- (id)positiveInfinityIntervalString;
- (id)standardIntervalString;
@end

@implementation HMMOpenClosedInterval

- (id)positiveInfinityIntervalString
{
  return @">%@";
}

- (id)negativeInfinityIntervalString
{
  return @"<=%@";
}

- (id)standardIntervalString
{
  return CFSTR("(%@, %@]");
}

@end