@interface UITextField(ABUIAdditions)
- (void)setAb_textAttributes:()ABUIAdditions;
@end

@implementation UITextField(ABUIAdditions)

- (void)setAb_textAttributes:()ABUIAdditions
{
  id v10 = a3;
  v4 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  v5 = [a1 font];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0) {
    [a1 setFont:v4];
  }
  v7 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FB0700]];
  if (v7)
  {
    v8 = [a1 textColor];
    char v9 = [v7 isEqual:v8];

    if ((v9 & 1) == 0) {
      [a1 setTextColor:v7];
    }
  }
}

@end