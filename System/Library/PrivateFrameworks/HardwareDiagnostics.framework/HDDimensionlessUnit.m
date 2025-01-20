@interface HDDimensionlessUnit
+ (HDDimensionlessUnit)counts;
+ (HDDimensionlessUnit)errors;
+ (HDDimensionlessUnit)events;
+ (HDDimensionlessUnit)frames;
@end

@implementation HDDimensionlessUnit

+ (HDDimensionlessUnit)errors
{
  v2 = [[HDDimensionlessUnit alloc] initWithSymbol:@"error(s)"];
  return v2;
}

+ (HDDimensionlessUnit)counts
{
  v2 = [[HDDimensionlessUnit alloc] initWithSymbol:@"count(s)"];
  return v2;
}

+ (HDDimensionlessUnit)events
{
  v2 = [[HDDimensionlessUnit alloc] initWithSymbol:@"event(s)"];
  return v2;
}

+ (HDDimensionlessUnit)frames
{
  v2 = [[HDDimensionlessUnit alloc] initWithSymbol:@"frame(s)"];
  return v2;
}

@end