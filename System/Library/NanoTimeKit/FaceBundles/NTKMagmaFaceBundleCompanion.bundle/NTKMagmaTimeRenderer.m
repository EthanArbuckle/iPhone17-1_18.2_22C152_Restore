@interface NTKMagmaTimeRenderer
+ ($F6FDA64D965730B2BB0321DC449E673D)renderTimeWithHour:(SEL)a3 minute:(id)a4 fontSize:(id)a5 lineSpacing:(double)a6;
+ (CGRect)_opticalBoundsFromFrame:(__CTFrame *)a3 context:(CGContext *)a4;
@end

@implementation NTKMagmaTimeRenderer

+ (CGRect)_opticalBoundsFromFrame:(__CTFrame *)a3 context:(CGContext *)a4
{
  v6 = CTFrameGetLines(a3);
  v7 = v6;
  if (v6 && [v6 count])
  {
    CGPoint v18 = CGPointZero;
    v19.location = 0;
    v19.length = 1;
    CTFrameGetLineOrigins(a3, v19, &v18);
    v8 = [v7 objectAtIndexedSubscript:0];
    CGRect ImageBounds = CTLineGetImageBounds(v8, a4);
    double x = ImageBounds.origin.x;
    CGFloat y = ImageBounds.origin.y;
    CGFloat width = ImageBounds.size.width;
    CGFloat height = ImageBounds.size.height;

    double v13 = x + v18.x;
  }
  else
  {
    double v13 = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }

  double v14 = v13;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.double x = v14;
  return result;
}

+ ($F6FDA64D965730B2BB0321DC449E673D)renderTimeWithHour:(SEL)a3 minute:(id)a4 fontSize:(id)a5 lineSpacing:(double)a6
{
  id v12 = a4;
  id v13 = a5;
  double v14 = +[CLKDevice currentDevice];
  [v14 screenScale];
  uint64_t v16 = v15;

  double v17 = +[CLKDevice currentDevice];
  CLKRoundForDevice();
  uint64_t v19 = v18;

  double v20 = CACurrentMediaTime();
  v21 = +[NTKVictoryLabel victoryFontWithSize:0 style:a6];
  if (!v21)
  {
    v22 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      sub_C258(v22);
    }
  }
  v23 = +[NTKVictoryLabel victoryFontWithSize:1 style:a6];
  if (!v23)
  {
    v24 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      sub_C1D4(v24);
    }
  }
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_9FD8;
  v36[3] = &unk_14690;
  id v25 = v12;
  id v37 = v25;
  id v26 = v13;
  id v38 = v26;
  uint64_t v39 = v19;
  double v40 = a7;
  uint64_t v41 = v16;
  id v42 = a2;
  v27 = objc_retainBlock(v36);
  double Ascent = CTFontGetAscent(v21);
  retstr->id var0 = 0;
  retstr->id var1 = 0;
  v29 = ((void (*)(void *, const __CTFont *, double *))v27[2])(v27, v21, &retstr->var3);
  id var0 = retstr->var0;
  retstr->id var0 = v29;

  v31 = ((void (*)(void *, void *, void))v27[2])(v27, v23, 0);
  id var1 = retstr->var1;
  retstr->id var1 = v31;

  retstr->var2 = Ascent;
  v33 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    CFTimeInterval v34 = CACurrentMediaTime();
    *(_DWORD *)buf = 134217984;
    double v44 = (v34 - v20) * 1000.0;
    _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "Magma time label rendered in %fms", buf, 0xCu);
  }

  return result;
}

@end