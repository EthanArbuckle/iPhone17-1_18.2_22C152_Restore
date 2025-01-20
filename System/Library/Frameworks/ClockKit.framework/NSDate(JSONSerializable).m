@interface NSDate(JSONSerializable)
- (uint64_t)JSONObjectRepresentation;
- (uint64_t)initWithJSONObjectRepresentation:()JSONSerializable;
@end

@implementation NSDate(JSONSerializable)

- (uint64_t)initWithJSONObjectRepresentation:()JSONSerializable
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"must be a number. Invalid value: %@", v4 format];
  }
  [v4 doubleValue];
  uint64_t v5 = objc_msgSend(a1, "initWithTimeIntervalSinceReferenceDate:");

  return v5;
}

- (uint64_t)JSONObjectRepresentation
{
  v1 = NSNumber;
  [a1 timeIntervalSinceReferenceDate];

  return objc_msgSend(v1, "numberWithDouble:");
}

@end