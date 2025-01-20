@interface NSTimeZone(JSONSerializable)
- (uint64_t)initWithJSONObjectRepresentation:()JSONSerializable;
@end

@implementation NSTimeZone(JSONSerializable)

- (uint64_t)initWithJSONObjectRepresentation:()JSONSerializable
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"must be a string. Invalid value: %@", v4 format];
  }
  uint64_t v5 = [a1 initWithName:v4];

  return v5;
}

@end