@interface PKInkProperties
+ ($01BB1521EC52D44A8E7628F5261DCEC8)controlPointsForFunctionType:(unint64_t)a3;
+ ($F24F406B2B787EFB06265DBA3D28CBD5)rangeForInkProperty:(unint64_t)a3;
+ ($F24F406B2B787EFB06265DBA3D28CBD5)rangeForInput:(unint64_t)a3;
+ (BOOL)bezierControlPoints:(id)a3 isEqual:(id)a4;
+ (double)defaultValueForInput:(unint64_t)a3;
+ (id)arrayForBezierControlPoints:(id)a3;
+ (id)blendModeNames;
+ (id)functionNames;
+ (id)inkPropertyNames;
+ (id)inkTypeNames;
+ (id)inputMaskNames;
+ (id)inputNames;
+ (unint64_t)functionTypeForBezierControlPoints:(id)a3;
+ (unint64_t)functionTypeForName:(id)a3;
@end

@implementation PKInkProperties

+ (id)inputNames
{
  return &unk_1F200F1A0;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)rangeForInkProperty:(unint64_t)a3
{
  double v3 = 1.0;
  if (a3 <= 3) {
    double v3 = dbl_1C482A548[a3];
  }
  double v4 = 0.0;
  result.var1 = v3;
  result.var0 = v4;
  return result;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)rangeForInput:(unint64_t)a3
{
  unint64_t v3 = a3 - 1;
  if (a3 - 1 > 6)
  {
    double v5 = 1.0;
    double v4 = 0.0;
  }
  else
  {
    double v4 = dbl_1C482A568[v3];
    double v5 = dbl_1C482A5A0[v3];
  }
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

+ (double)defaultValueForInput:(unint64_t)a3
{
  double result = 0.0;
  if (a3 - 1 <= 3) {
    return dbl_1C482A5D8[a3 - 1];
  }
  return result;
}

+ (id)blendModeNames
{
  return &unk_1F200ECE8;
}

+ (id)inkTypeNames
{
  return &unk_1F200ED00;
}

+ (id)inkPropertyNames
{
  return &unk_1F200F150;
}

+ (id)inputMaskNames
{
  return &unk_1F200F178;
}

+ (id)functionNames
{
  return &unk_1F200F1C8;
}

+ (unint64_t)functionTypeForName:(id)a3
{
  id v3 = a3;
  double v4 = +[PKInkProperties functionNames];
  double v5 = [v4 objectForKeyedSubscript:v3];

  unint64_t v6 = [v5 integerValue];
  return v6;
}

+ ($01BB1521EC52D44A8E7628F5261DCEC8)controlPointsForFunctionType:(unint64_t)a3
{
  unint64_t v3 = a3 - 1;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  if (a3 - 1 <= 4)
  {
    double v5 = dbl_1C482A5F8[v3];
    double v6 = dbl_1C482A620[v3];
    double v4 = 1.0;
    double v7 = dbl_1C482A648[v3];
  }
  result.var3 = v4;
  result.var2 = v5;
  result.var1 = v6;
  result.var0 = v7;
  return result;
}

+ (unint64_t)functionTypeForBezierControlPoints:(id)a3
{
  double var3 = a3.var3;
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  unint64_t v7 = 2;
  +[PKInkProperties controlPointsForFunctionType:2];
  if (!+[PKInkProperties bezierControlPoints:isEqual:](PKInkProperties, "bezierControlPoints:isEqual:", var0, var1, var2, var3, v8, v9, v10, v11))
  {
    unint64_t v7 = 3;
    +[PKInkProperties controlPointsForFunctionType:3];
    if (!+[PKInkProperties bezierControlPoints:isEqual:](PKInkProperties, "bezierControlPoints:isEqual:", var0, var1, var2, var3, v12, v13, v14, v15))
    {
      unint64_t v7 = 5;
      +[PKInkProperties controlPointsForFunctionType:5];
      if (!+[PKInkProperties bezierControlPoints:isEqual:](PKInkProperties, "bezierControlPoints:isEqual:", var0, var1, var2, var3, v16, v17, v18, v19))
      {
        unint64_t v7 = 4;
        +[PKInkProperties controlPointsForFunctionType:4];
        if (!+[PKInkProperties bezierControlPoints:isEqual:](PKInkProperties, "bezierControlPoints:isEqual:", var0, var1, var2, var3, v20, v21, v22, v23))
        {
          +[PKInkProperties controlPointsForFunctionType:1];
          return +[PKInkProperties bezierControlPoints:isEqual:](PKInkProperties, "bezierControlPoints:isEqual:", var0, var1, var2, var3, v24, v25, v26, v27);
        }
      }
    }
  }
  return v7;
}

+ (BOOL)bezierControlPoints:(id)a3 isEqual:(id)a4
{
  if (a3.var0 != a4.var0 && vabdd_f64(a3.var0, a4.var0) >= fabs(a4.var0 * 0.000000999999997)
    || a3.var1 != a4.var1 && vabdd_f64(a3.var1, a4.var1) >= fabs(a4.var1 * 0.000000999999997)
    || a3.var2 != a4.var2 && vabdd_f64(a3.var2, a4.var2) >= fabs(a4.var2 * 0.000000999999997))
  {
    return 0;
  }
  if (a3.var3 == a4.var3) {
    return 1;
  }
  return vabdd_f64(a3.var3, a4.var3) < fabs(a4.var3 * 0.000000999999997);
}

+ (id)arrayForBezierControlPoints:(id)a3
{
  double var3 = a3.var3;
  double var2 = a3.var2;
  double var1 = a3.var1;
  v12[4] = *MEMORY[0x1E4F143B8];
  double v6 = [NSNumber numberWithDouble:a3.var0];
  v12[0] = v6;
  unint64_t v7 = [NSNumber numberWithDouble:var1];
  v12[1] = v7;
  double v8 = [NSNumber numberWithDouble:var2];
  v12[2] = v8;
  double v9 = [NSNumber numberWithDouble:var3];
  v12[3] = v9;
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];

  return v10;
}

@end