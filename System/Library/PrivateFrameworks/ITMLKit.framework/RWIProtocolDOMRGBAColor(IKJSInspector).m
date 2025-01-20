@interface RWIProtocolDOMRGBAColor(IKJSInspector)
- (uint64_t)ik_color;
@end

@implementation RWIProtocolDOMRGBAColor(IKJSInspector)

- (uint64_t)ik_color
{
  v2 = (void *)MEMORY[0x1E4F428B8];
  double v3 = (double)(int)[a1 r] / 255.0;
  double v4 = (double)(int)[a1 g] / 255.0;
  double v5 = (double)(int)[a1 b] / 255.0;
  [a1 a];
  return [v2 colorWithRed:v3 green:v4 blue:v5 alpha:v6];
}

@end