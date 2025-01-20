@interface _MPUFallAnimatorDynamicSystem
- (CGRect)bounds;
@end

@implementation _MPUFallAnimatorDynamicSystem

- (CGRect)bounds
{
  v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

@end