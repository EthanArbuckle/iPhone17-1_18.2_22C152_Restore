@interface GAXCircleShapeRecognizer
+ (id)smoothPathForFingerPath:(id)a3 probabilityOfMatch:(double *)a4;
@end

@implementation GAXCircleShapeRecognizer

+ (id)smoothPathForFingerPath:(id)a3 probabilityOfMatch:(double *)a4
{
  id v5 = a3;
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [v5 boundsCenter];
  double v15 = v14;
  double v17 = v16;
  v34.origin.x = v7;
  v34.origin.y = v9;
  v34.size.width = v11;
  v34.size.height = v13;
  double Width = CGRectGetWidth(v34);
  v35.origin.x = v7;
  v35.origin.y = v9;
  v35.size.width = v11;
  v35.size.height = v13;
  double v19 = (Width + CGRectGetHeight(v35)) * 0.5;
  double v20 = v19 * 0.5;
  if (v19 * 0.5 <= 0.0)
  {
    v22 = 0;
    double v25 = 0.0;
    if (!a4) {
      goto LABEL_8;
    }
  }
  else
  {
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v32[3] = 0;
    uint64_t v28 = 0;
    v29 = (double *)&v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1F8CC;
    v27[3] = &unk_5D890;
    *(double *)&v27[6] = v15;
    *(double *)&v27[7] = v17;
    v27[4] = v32;
    v27[5] = &v28;
    *(double *)&v27[8] = v19 * 0.5;
    *(double *)&v27[9] = v19;
    [v5 enumerateElementsUsingBlock:v27];
    double v21 = v29[3];
    if (v21 >= 0.2)
    {
      v22 = 0;
    }
    else
    {
      v22 = +[UIBezierPath bezierPath];
      for (unint64_t i = 0; i != 60; ++i)
      {
        __double2 v24 = __sincos_stret((double)i / 60.0 * 6.28318531);
        objc_msgSend(v22, "appendElementOfType:withSinglePoint:", 1, v15 + v20 * v24.__cosval, v17 + v20 * v24.__sinval);
      }
      [v22 closePath];
      double v21 = v29[3];
    }
    double v25 = v21 / -0.2 * 2.0 + 1.0;
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(v32, 8);
    if (!a4) {
      goto LABEL_8;
    }
  }
  *a4 = v25;
LABEL_8:

  return v22;
}

@end