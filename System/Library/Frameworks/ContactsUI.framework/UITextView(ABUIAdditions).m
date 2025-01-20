@interface UITextView(ABUIAdditions)
- (id)ab_textAttributes;
- (void)setAb_textAttributes:()ABUIAdditions;
@end

@implementation UITextView(ABUIAdditions)

- (void)setAb_textAttributes:()ABUIAdditions
{
  id v10 = a3;
  v4 = [v10 objectForKey:*MEMORY[0x1E4FB0700]];
  if (v4)
  {
    v5 = [a1 textColor];
    char v6 = [v4 isEqual:v5];

    if ((v6 & 1) == 0) {
      [a1 setTextColor:v4];
    }
  }
  v7 = [v10 objectForKey:*MEMORY[0x1E4FB06F8]];
  v8 = [a1 font];
  char v9 = [v8 isEqual:v7];

  if ((v9 & 1) == 0) {
    [a1 setFont:v7];
  }
}

- (id)ab_textAttributes
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = *MEMORY[0x1E4FB0700];
  v2 = [a1 textColor];
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E4FB06F8];
  v3 = [a1 font];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

@end