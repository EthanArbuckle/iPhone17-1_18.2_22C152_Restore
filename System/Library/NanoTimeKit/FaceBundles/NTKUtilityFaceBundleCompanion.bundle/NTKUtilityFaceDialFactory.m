@interface NTKUtilityFaceDialFactory
+ (id)_dialIdentifierForDevice:(id)a3;
+ (id)_getImageCache;
+ (id)_numbersIdentifierForStyle:(unint64_t)a3 typeface:(unint64_t)a4 device:(id)a5;
+ (id)_renderDialForDevice:(id)a3;
+ (id)_renderNumbersForStyle:(unint64_t)a3 typeface:(unint64_t)a4 device:(id)a5;
+ (id)dialImageForDevice:(id)a3;
+ (id)numbersImageForStyle:(unint64_t)a3 typeface:(unint64_t)a4 device:(id)a5;
@end

@implementation NTKUtilityFaceDialFactory

+ (id)dialImageForDevice:(id)a3
{
  id v3 = a3;
  v4 = +[NTKUtilityFaceDialFactory _getImageCache];
  v5 = +[NTKUtilityFaceDialFactory _dialIdentifierForDevice:v3];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_4E08;
  v10[3] = &unk_104A8;
  id v11 = v3;
  id v6 = v3;
  v7 = [v4 imageForKey:v5 generatingIfNecessaryWithBlock:v10];
  v8 = [v7 imageWithRenderingMode:2];

  return v8;
}

+ (id)numbersImageForStyle:(unint64_t)a3 typeface:(unint64_t)a4 device:(id)a5
{
  id v7 = a5;
  v8 = +[NTKUtilityFaceDialFactory _getImageCache];
  v9 = +[NTKUtilityFaceDialFactory _numbersIdentifierForStyle:a3 typeface:a4 device:v7];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_4F24;
  v13[3] = &unk_104D0;
  unint64_t v15 = a3;
  unint64_t v16 = a4;
  id v14 = v7;
  id v10 = v7;
  id v11 = [v8 imageForKey:v9 generatingIfNecessaryWithBlock:v13];

  return v11;
}

+ (id)_getImageCache
{
  if (qword_169F8 != -1) {
    dispatch_once(&qword_169F8, &stru_10510);
  }
  v2 = (void *)qword_16A00;

  return v2;
}

+ (id)_dialIdentifierForDevice:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"dial-%u", [a3 sizeClass]);
}

+ (id)_numbersIdentifierForStyle:(unint64_t)a3 typeface:(unint64_t)a4 device:(id)a5
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"numbers-%u-%u-%u", a3, a4, [a5 sizeClass]);
}

+ (id)_renderDialForDevice:(id)a3
{
  id v3 = a3;
  uint64_t v40 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  sub_52FC(v3, 0, &v21);
  [v3 screenScale];
  double v5 = v4 + v4;
  double v6 = *(double *)&v21;
  double v7 = *(double *)&v21 + *(double *)&v22;
  v8 = +[CALayer layer];
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, v7, v7);
  [v8 setContentsScale:v5];
  double v9 = (v6 - *((double *)&v21 + 1)) * 0.5;
  [v8 bounds];
  double v10 = CGRectGetWidth(v43) * 0.5;
  [v8 bounds];
  unint64_t v11 = 0;
  double v12 = CGRectGetHeight(v44) * 0.5;
  double v13 = *((double *)&v22 + 1);
  double v14 = *((double *)&v23 + 1);
  do
  {
    if (-858993459 * v11 >= 0x33333334)
    {
      unint64_t v15 = +[UIColor colorWithWhite:1.0 alpha:0.494117647];
      unint64_t v16 = _NTKUtilityTick(v11, v15, v14, v13, v9, v10, v12);
      [v8 addSublayer:v16];
      [v16 setContentsScale:v5];
    }
    ++v11;
  }
  while (v11 != 60);
  [v8 setMinificationFilter:kCAFilterTrilinear];
  [v8 frame];
  v42.width = v17;
  v42.height = v18;
  UIGraphicsBeginImageContextWithOptions(v42, 0, 0.0);
  [v8 renderInContext:UIGraphicsGetCurrentContext()];
  v19 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v19;
}

+ (id)_renderNumbersForStyle:(unint64_t)a3 typeface:(unint64_t)a4 device:(id)a5
{
  id v7 = a5;
  uint64_t v52 = 0;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  sub_52FC(v7, a4, &v33);
  [v7 screenScale];
  double v9 = v8 + v8;
  double v10 = *(double *)&v33;
  double v11 = *(double *)&v33 + *(double *)&v34;
  double v12 = +[CALayer layer];
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, v11, v11);
  [v12 setContentsScale:v9];
  double v13 = (v10 - *((double *)&v33 + 1)) * 0.5;
  [v12 bounds];
  double v14 = CGRectGetWidth(v55) * 0.5;
  [v12 bounds];
  double v16 = CGRectGetHeight(v56) * 0.5;
  double v17 = *((double *)&v34 + 1);
  double v18 = *(double *)&v35;
  double v19 = *((double *)&v36 + 1);
  double v20 = v13 - *((double *)&v34 + 1) * 0.5;
  unint64_t v21 = -5;
  do
  {
    if (a3 == 3)
    {
      long long v22 = _NTKUtilityMinuteLayer(v21 + 5, v19, v20, v14, v16, v15, a4, v7);
    }
    else
    {
      long long v23 = +[UIColor whiteColor];
      long long v22 = _NTKUtilityTick(v21 + 5, v23, v18, v17, v13, v14, v16);
    }
    [v12 addSublayer:v22];
    [v22 setContentsScale:v9];

    v21 += 5;
  }
  while (v21 < 0x37);
  if (a3)
  {
    unint64_t v24 = 0;
    double v25 = v13 - v17;
    double v26 = *((double *)&v44 + 1);
    double v27 = v25 - *(double *)&v36;
    do
    {
      if (a3 != 1 || v24 == 3 * ((1431655766 * (unint64_t)v24) >> 32))
      {
        long long v28 = _NTKUtilityHourLayer(v24, v26, v27, v14, v16, v15, a4);
        [v12 addSublayer:v28];
        [v28 setContentsScale:v9];
      }
      ++v24;
    }
    while (v24 != 12);
  }
  [v12 setMinificationFilter:kCAFilterTrilinear];
  [v12 frame];
  v54.width = v29;
  v54.height = v30;
  UIGraphicsBeginImageContextWithOptions(v54, 0, 0.0);
  [v12 renderInContext:UIGraphicsGetCurrentContext()];
  long long v31 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v31;
}

@end