@interface CCUIFeatures
+ (BOOL)isFeatureEnabled:(int64_t)a3;
- (CCUIFeatures)init;
@end

@implementation CCUIFeatures

+ (BOOL)isFeatureEnabled:(int64_t)a3
{
  type metadata accessor for Feature(0);
  v6[3] = v4;
  v6[4] = sub_1D834D160();
  v6[0] = a3;
  LOBYTE(a3) = sub_1D8382068();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return a3 & 1;
}

- (CCUIFeatures)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Features();
  return [(CCUIFeatures *)&v3 init];
}

@end