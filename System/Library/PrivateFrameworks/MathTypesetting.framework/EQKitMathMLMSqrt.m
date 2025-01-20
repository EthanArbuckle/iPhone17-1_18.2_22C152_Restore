@interface EQKitMathMLMSqrt
- (BOOL)schemataAutomaticSourceAttribution;
- (id)schemataIndex;
- (id)schemataRadicand;
@end

@implementation EQKitMathMLMSqrt

- (id)schemataRadicand
{
  return self->super.mChild;
}

- (id)schemataIndex
{
  return 0;
}

- (BOOL)schemataAutomaticSourceAttribution
{
  return 0;
}

@end