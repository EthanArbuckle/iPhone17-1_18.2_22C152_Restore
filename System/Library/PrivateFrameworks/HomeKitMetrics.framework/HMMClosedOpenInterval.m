@interface HMMClosedOpenInterval
- (id)negativeInfinityIntervalString;
- (id)positiveInfinityIntervalString;
- (id)standardIntervalString;
@end

@implementation HMMClosedOpenInterval

- (id)positiveInfinityIntervalString
{
  return @"%@+";
}

- (id)negativeInfinityIntervalString
{
  return @"<%@";
}

- (id)standardIntervalString
{
  return @"[%@, %@");
}

@end