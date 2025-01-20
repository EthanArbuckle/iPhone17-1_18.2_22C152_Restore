@interface NSValue(DKRenderPointAdditions)
+ (uint64_t)dk_valueWithRenderPoint:()DKRenderPointAdditions;
- (uint64_t)dk_renderPointValue;
@end

@implementation NSValue(DKRenderPointAdditions)

+ (uint64_t)dk_valueWithRenderPoint:()DKRenderPointAdditions
{
  return [MEMORY[0x263F08D40] value:a3 withObjCType:"{?={CGPoint=dd}ddd}"];
}

- (uint64_t)dk_renderPointValue
{
  return [a1 getValue:x8_0 size:40];
}

@end