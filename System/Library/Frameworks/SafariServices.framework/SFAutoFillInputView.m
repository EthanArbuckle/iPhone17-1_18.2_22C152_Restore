@interface SFAutoFillInputView
@end

@implementation SFAutoFillInputView

id __83___SFAutoFillInputView_initWithHostString_credentialSource_suggestion_customTitle___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  v2 = [MEMORY[0x1E4FB1618] colorWithRed:0.314 green:0.333 blue:0.36 alpha:1.0];
  }

  return v2;
}

@end