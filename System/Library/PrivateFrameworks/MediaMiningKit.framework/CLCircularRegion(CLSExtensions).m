@interface CLCircularRegion(CLSExtensions)
- (double)clsHorizontalAccuracy;
- (void)setClsHorizontalAccuracy:()CLSExtensions;
@end

@implementation CLCircularRegion(CLSExtensions)

- (double)clsHorizontalAccuracy
{
  v1 = objc_getAssociatedObject(a1, "clsHorizontalAccuracy");
  v2 = v1;
  if (v1)
  {
    [v1 doubleValue];
    double v4 = v3;
  }
  else
  {
    double v4 = 0.0;
  }

  return v4;
}

- (void)setClsHorizontalAccuracy:()CLSExtensions
{
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "clsHorizontalAccuracy", v2, (void *)1);
}

@end