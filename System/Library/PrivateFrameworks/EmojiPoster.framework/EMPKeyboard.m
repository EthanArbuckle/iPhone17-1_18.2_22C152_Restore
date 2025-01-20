@interface EMPKeyboard
+ (CGSize)keyboardSizeForOrientation:(int64_t)a3;
@end

@implementation EMPKeyboard

+ (CGSize)keyboardSizeForOrientation:(int64_t)a3
{
  [MEMORY[0x263F828A0] keyboardSizeForInterfaceOrientation:a3];
  result.height = v4;
  result.width = v3;
  return result;
}

@end