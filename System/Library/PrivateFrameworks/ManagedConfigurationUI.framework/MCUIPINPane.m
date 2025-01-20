@interface MCUIPINPane
- (unint64_t)style;
- (void)setStyle:(unint64_t)a3;
@end

@implementation MCUIPINPane

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    if (a3 == 1)
    {
      v4 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
      uint64_t v5 = (int)*MEMORY[0x1E4F92EE0];
      [*(id *)((char *)&self->super.super.super.super.super.isa + v5) setBackgroundColor:v4];

      v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v5);
      MCUILocalizedStringByDevice(@"PIN_MESSAGE_USER_ENROLLMENT");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      v7 = [MEMORY[0x1E4F42A30] MCUIBoldTitleFontWithSize:32.0];
      [v6 setTitle:v8 font:v7];
    }
  }
}

- (unint64_t)style
{
  return self->_style;
}

@end