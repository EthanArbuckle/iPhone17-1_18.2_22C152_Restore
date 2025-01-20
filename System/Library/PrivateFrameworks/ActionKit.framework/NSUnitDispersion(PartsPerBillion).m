@interface NSUnitDispersion(PartsPerBillion)
+ (id)wf_partsPerBillion;
@end

@implementation NSUnitDispersion(PartsPerBillion)

+ (id)wf_partsPerBillion
{
  v0 = (void *)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:0.001];
  v1 = (void *)[objc_alloc(MEMORY[0x263F08C90]) initWithSymbol:@"ppb" converter:v0];

  return v1;
}

@end