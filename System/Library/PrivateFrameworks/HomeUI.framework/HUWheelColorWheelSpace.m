@interface HUWheelColorWheelSpace
- ($01BB1521EC52D44A8E7628F5261DCEC8)colorForCoordinate:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinateForColor:(id)a3 isValid:(BOOL *)a4;
- (unint64_t)type;
@end

@implementation HUWheelColorWheelSpace

- (unint64_t)type
{
  return 0;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)colorForCoordinate:(id)a3
{
  double var1 = a3.var1;
  if (a3.var0 < 0.0 || a3.var0 > 1.0) {
    NSLog(&cfstr_InputCoordinat.isa, a2, *(void *)&a3.var0);
  }
  double v5 = 0.0;
  if (var1 >= 0.08) {
    double v5 = (var1 + -0.08) / 0.92;
  }
  pow(v5, 2.2);
  HFConvertHSBToRGB();
  double v7 = *((double *)&HUWheelColorInvalid + 1);
  double v6 = *(double *)&HUWheelColorInvalid;
  double v9 = unk_1BEA1A498;
  double v8 = 1.79769313e308;
  result.var3 = v9;
  result.var2 = v8;
  result.double var1 = v7;
  result.var0 = v6;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinateForColor:(id)a3 isValid:(BOOL *)a4
{
  HFConvertRGBToHSB();
  if (a4) {
    *a4 = 1;
  }
  double v5 = fmax(pow(0.0, 0.454545455), 0.08);
  double v6 = 0.0;
  result.double var1 = v5;
  result.var0 = v6;
  return result;
}

@end