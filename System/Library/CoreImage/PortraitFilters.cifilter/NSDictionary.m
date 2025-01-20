@interface NSDictionary
- (CGRect)coreImageROIrect;
- (float)imageHeightScale;
- (float)imageWidthScale;
- (int)sanityCheckStatus;
- (void)setCoreImageROIrect:(CGRect)a3;
- (void)setImageHeightScale:(float)a3;
- (void)setImageWidthScale:(float)a3;
- (void)setSanityCheckStatus:(int)a3;
@end

@implementation NSDictionary

- (int)sanityCheckStatus
{
  id AssociatedObject = objc_getAssociatedObject(self, off_8C8B0);

  return [AssociatedObject intValue];
}

- (void)setSanityCheckStatus:(int)a3
{
  v4 = +[NSNumber numberWithInt:*(void *)&a3];

  objc_setAssociatedObject(self, off_8C8B0, v4, (char *)&dword_0 + 1);
}

- (float)imageWidthScale
{
  id AssociatedObject = objc_getAssociatedObject(self, off_8C8B8);

  [AssociatedObject floatValue];
  return result;
}

- (void)setImageWidthScale:(float)a3
{
  v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  objc_setAssociatedObject(self, off_8C8B8, v4, (char *)&dword_0 + 1);
}

- (float)imageHeightScale
{
  id AssociatedObject = objc_getAssociatedObject(self, off_8C8C0);

  [AssociatedObject floatValue];
  return result;
}

- (void)setImageHeightScale:(float)a3
{
  v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  objc_setAssociatedObject(self, off_8C8C0, v4, (char *)&dword_0 + 1);
}

- (CGRect)coreImageROIrect
{
  id AssociatedObject = objc_getAssociatedObject(self, &off_8C8C8);

  [AssociatedObject rectValue];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setCoreImageROIrect:(CGRect)a3
{
  double v4 = +[NSValue valueWithRect:](NSValue, "valueWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  objc_setAssociatedObject(self, &off_8C8C8, v4, (char *)&dword_0 + 1);
}

@end