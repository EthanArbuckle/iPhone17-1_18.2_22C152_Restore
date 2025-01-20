@interface CPUIBaseTableCell
@end

@implementation CPUIBaseTableCell

uint64_t __35___CPUIBaseTableCell_disabledColor__block_invoke()
{
  disabledColor_disabled = [MEMORY[0x263F825C8] colorWithDynamicProvider:&__block_literal_global_4];
  return MEMORY[0x270F9A758]();
}

id __35___CPUIBaseTableCell_disabledColor__block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 1)
  {
    double v2 = 0.568627451;
    double v3 = 0.588235294;
    double v4 = 1.0;
    double v5 = 0.568627451;
  }
  else
  {
    double v2 = 0.603921569;
    double v5 = 0.6;
    double v3 = 0.615686275;
    double v4 = 1.0;
  }
  v6 = [MEMORY[0x263F825C8] colorWithRed:v2 green:v5 blue:v3 alpha:v4];
  return v6;
}

uint64_t __46___CPUIBaseTableCell_disabledHighlightedColor__block_invoke()
{
  disabledHighlightedColor_disabled = [MEMORY[0x263F825C8] colorWithDynamicProvider:&__block_literal_global_8];
  return MEMORY[0x270F9A758]();
}

id __46___CPUIBaseTableCell_disabledHighlightedColor__block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 1)
  {
    double v2 = 0.505882353;
    double v3 = 0.71372549;
    double v4 = 0.976470588;
  }
  else
  {
    double v2 = 0.337254902;
    double v3 = 0.537254902;
    double v4 = 0.639215686;
  }
  double v5 = [MEMORY[0x263F825C8] colorWithRed:v2 green:v3 blue:v4 alpha:1.0];
  return v5;
}

@end