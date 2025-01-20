@interface A:
- (NSDictionary)B;
- (uint64_t)B;
@end

@implementation A:

- (uint64_t)B
{
  uint64_t result = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a1, a2[2], a2[3], a2[4]);
  *a3 = result;
  return result;
}

- (NSDictionary)B
{
  return Dictionary._bridgeToObjectiveC()();
}

@end