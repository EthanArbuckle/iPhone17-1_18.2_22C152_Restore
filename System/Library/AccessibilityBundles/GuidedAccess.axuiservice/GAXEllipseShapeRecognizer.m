@interface GAXEllipseShapeRecognizer
+ (BOOL)needsRotatedFingerPathToMinimizeBoundsArea;
+ (id)smoothPathForFingerPath:(id)a3 probabilityOfMatch:(double *)a4;
@end

@implementation GAXEllipseShapeRecognizer

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
  v29.origin.x = v7;
  v29.origin.y = v9;
  v29.size.width = v11;
  v29.size.height = v13;
  double Width = CGRectGetWidth(v29);
  v30.origin.x = v7;
  v30.origin.y = v9;
  v30.size.width = v11;
  v30.size.height = v13;
  double Height = CGRectGetHeight(v30);
  v20 = 0;
  if (Width > 0.0 && Height > 0.0)
  {
    long long v21 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v27.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v27.c = v21;
    *(_OWORD *)&v27.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)&v26.a = *(_OWORD *)&v27.a;
    *(_OWORD *)&v26.c = v21;
    *(_OWORD *)&v26.tx = *(_OWORD *)&v27.tx;
    CGAffineTransformScale(&v27, &v26, Height / Width, 1.0);
    CGAffineTransform v25 = v27;
    CGAffineTransformTranslate(&v26, &v25, -v15, -v17);
    CGAffineTransform v27 = v26;
    id v22 = [v5 copy];
    CGAffineTransform v26 = v27;
    [v22 applyTransform:&v26];
    v20 = +[GAXCircleShapeRecognizer smoothPathForFingerPath:v22 probabilityOfMatch:a4];
    CGAffineTransform v26 = v27;
    CGAffineTransformInvert(&v24, &v26);
    [v20 applyTransform:&v24];
  }

  return v20;
}

+ (BOOL)needsRotatedFingerPathToMinimizeBoundsArea
{
  return 1;
}

@end