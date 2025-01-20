@interface HMMOpenOpenInterval
- (id)negativeInfinityIntervalString;
- (id)positiveInfinityIntervalString;
- (id)standardIntervalString;
@end

@implementation HMMOpenOpenInterval

- (id)positiveInfinityIntervalString
{
  return @">%@";
}

- (id)negativeInfinityIntervalString
{
  return @"<%@";
}

- (id)standardIntervalString
{
  return @"(%@, %@)";
}

@end