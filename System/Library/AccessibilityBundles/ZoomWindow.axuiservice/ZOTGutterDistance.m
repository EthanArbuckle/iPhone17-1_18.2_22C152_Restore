@interface ZOTGutterDistance
@end

@implementation ZOTGutterDistance

void __ZOTGutterDistance_block_invoke(id a1)
{
  double v1 = 120.0;
  if (!ZOTIsWildcat) {
    double v1 = 80.0;
  }
  ZOTGutterDistance__GutterDistance = *(void *)&v1;
  *(double *)&ZOTGutterDistance__GutterDistance = ZOTMainScreenScaleFactor() * v1;
}

@end