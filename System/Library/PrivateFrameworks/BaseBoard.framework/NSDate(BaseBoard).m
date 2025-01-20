@interface NSDate(BaseBoard)
- (id)bs_dateByAddingDays:()BaseBoard;
@end

@implementation NSDate(BaseBoard)

- (id)bs_dateByAddingDays:()BaseBoard
{
  CFCalendarRef v5 = CFCalendarCopyCurrent();
  if (v5)
  {
    v6 = v5;
    [a1 timeIntervalSinceReferenceDate];
    CFAbsoluteTime at = v7;
    if (CFCalendarAddComponents(v6, &at, 0, "d", a3))
    {
      v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:at];
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end