@interface TDThemeLook
- (BOOL)supportsContrastAdjustment;
- (void)setSupportsContrastAdjustment:(BOOL)a3;
@end

@implementation TDThemeLook

- (void)setSupportsContrastAdjustment:(BOOL)a3
{
  if (*((unsigned char *)&self->super._identifier + 4) != a3)
  {
    [(TDThemeLook *)self willChangeValueForKey:@"supportsContrastAdjustment"];
    *((unsigned char *)&self->super._identifier + 4) = a3;
    [(TDThemeLook *)self didChangeValueForKey:@"supportsContrastAdjustment"];
  }
}

- (BOOL)supportsContrastAdjustment
{
  [(TDThemeLook *)self willAccessValueForKey:@"supportsContrastAdjustment"];
  char v3 = *((unsigned char *)&self->super._identifier + 4);
  [(TDThemeLook *)self didAccessValueForKey:@"supportsContrastAdjustment"];
  return v3;
}

@end