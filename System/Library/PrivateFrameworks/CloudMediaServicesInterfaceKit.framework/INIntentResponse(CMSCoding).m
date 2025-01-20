@interface INIntentResponse(CMSCoding)
- (id)cmsCoded;
@end

@implementation INIntentResponse(CMSCoding)

- (id)cmsCoded
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  [v2 setObject:@"IntentResponse" forKey:@"class"];
  v3 = [a1 userActivity];
  v4 = v3;
  if (v3) {
    [v3 cmsCoded];
  }
  else {
  v5 = [MEMORY[0x263EFF9D0] null];
  }
  [v2 setObject:v5 forKey:@"userActivity"];

  return v2;
}

@end