@interface ZOTNotGutterFrame
@end

@implementation ZOTNotGutterFrame

void __ZOTNotGutterFrame_block_invoke(id a1)
{
  ZOTMainScreenSize();
  double v2 = v1;
  double v4 = v3;
  float v5 = ZOTGutterDistance();
  *(double *)&uint64_t v6 = v5;
  double v7 = (float)(v5 + v5);
  ZOTNotGutterFrame_nonGutterFrame_0 = v6;
  ZOTNotGutterFrame_nonGutterFrame_1 = v6;
  *(double *)&ZOTNotGutterFrame_nonGutterFrame_2 = v2 - v7;
  *(double *)&ZOTNotGutterFrame_nonGutterFrame_3 = v4 - v7;
}

@end