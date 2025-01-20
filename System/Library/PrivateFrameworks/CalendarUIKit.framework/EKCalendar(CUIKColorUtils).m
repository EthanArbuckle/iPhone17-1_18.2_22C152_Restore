@interface EKCalendar(CUIKColorUtils)
+ (id)displayColorForSymbolicName:()CUIKColorUtils;
- (id)displayColor;
- (id)platformColor;
@end

@implementation EKCalendar(CUIKColorUtils)

- (id)displayColor
{
  v2 = [a1 source];
  uint64_t v3 = [v2 sourceType];

  if (v3 == 6)
  {
    v4 = [MEMORY[0x1E4FB1618] systemBlueColor];
  }
  else
  {
    v5 = [a1 symbolicColorName];
    v4 = [a1 platformColor];
    if (v5 && ([v5 isEqualToString:*MEMORY[0x1E4FB82F8]] & 1) == 0)
    {
      uint64_t v6 = [(id)objc_opt_class() displayColorForSymbolicName:v5];

      v4 = (void *)v6;
    }
  }

  return v4;
}

- (id)platformColor
{
  v1 = (void *)[a1 CGColor];
  if (v1)
  {
    v1 = [MEMORY[0x1E4FB1618] colorWithCGColor:v1];
  }

  return v1;
}

+ (id)displayColorForSymbolicName:()CUIKColorUtils
{
  return CUIKSymbolicColorWithName(a3);
}

@end