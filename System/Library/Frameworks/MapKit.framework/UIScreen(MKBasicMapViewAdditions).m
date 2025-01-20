@interface UIScreen(MKBasicMapViewAdditions)
- (id)_mapkit_display;
@end

@implementation UIScreen(MKBasicMapViewAdditions)

- (id)_mapkit_display
{
  v2 = [MEMORY[0x1E4F42D90] mainScreen];

  if (v2 == a1)
  {
    v8 = [MEMORY[0x1E4F39B60] mainDisplay];
  }
  else
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
    v4 = [a1 displayLinkWithTarget:v3 selector:sel_isEqual_];

    v5 = [v4 display];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [MEMORY[0x1E4F39B60] mainDisplay];
    }
    v8 = v7;
  }

  return v8;
}

@end