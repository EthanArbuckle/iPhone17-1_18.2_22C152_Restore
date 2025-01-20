@interface EKCalendar(MobileCal)
- (id)uiColor;
@end

@implementation EKCalendar(MobileCal)

- (id)uiColor
{
  v1 = (void *)[a1 CGColor];
  if (v1)
  {
    v1 = [MEMORY[0x1E4FB1618] colorWithCGColor:v1];
  }

  return v1;
}

@end