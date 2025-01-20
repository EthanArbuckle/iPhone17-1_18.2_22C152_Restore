@interface NTKSiderealDialView
- (NTKSiderealDialView)initWithFrame:(CGRect)a3 dialDiameter:(double)a4 device:(id)a5;
- (id)_replicatorLayerWithCenter:(CGPoint)a3 bounds:(CGRect)a4 dialDiameter:(double)a5 instanceCount:(int64_t)a6 instanceRotation:(double)a7 tickOpacity:(double)a8 tickSize:(CGSize)a9 tickCornerRadius:(double)a10;
@end

@implementation NTKSiderealDialView

- (NTKSiderealDialView)initWithFrame:(CGRect)a3 dialDiameter:(double)a4 device:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v84 = a5;
  v91.receiver = self;
  v91.super_class = (Class)NTKSiderealDialView;
  v90 = -[NTKSiderealDialView initWithFrame:](&v91, "initWithFrame:", x, y, width, height);
  if (!v90) {
    goto LABEL_12;
  }
  id v10 = v84;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_35A38);
  id WeakRetained = objc_loadWeakRetained(&qword_35A40);
  if (WeakRetained)
  {
    id v12 = objc_loadWeakRetained(&qword_35A40);
    if (v12 == v10)
    {
      id v13 = [v10 version];
      BOOL v14 = v13 == (id)qword_35A48;

      if (v14) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v15 = objc_storeWeak(&qword_35A40, v10);
  qword_35A48 = (uint64_t)[v10 version];

  sub_188CC(v16, (uint64_t)v10);
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_35A38);
  double v17 = *(double *)&qword_359E8;
  double v85 = *(double *)&qword_359F0;
  uint64_t v77 = qword_35A00;
  double v78 = *(double *)&qword_359F8;
  uint64_t v79 = qword_35A10;
  double v80 = *(double *)&qword_35A08;
  double v82 = *(double *)&qword_35A18;
  double v83 = *(double *)&qword_359E0;
  uint64_t v81 = qword_35A20;
  double v18 = *(double *)&qword_35A28;
  double v19 = *(double *)&qword_35A30;

  [(NTKSiderealDialView *)v90 setUserInteractionEnabled:0];
  v20 = [(NTKSiderealDialView *)v90 layer];
  [v20 setAllowsGroupOpacity:1];

  id v21 = objc_alloc((Class)UIView);
  [(NTKSiderealDialView *)v90 bounds];
  v22 = (UIView *)objc_msgSend(v21, "initWithFrame:");
  hourContainerView = v90->_hourContainerView;
  v90->_hourContainerView = v22;

  [(NTKSiderealDialView *)v90 addSubview:v90->_hourContainerView];
  v89 = objc_opt_new();
  [v89 setNumberStyle:0];
  v24 = +[NSLocale currentLocale];
  [v89 setLocale:v24];

  [v89 setFormatWidth:2];
  [v89 setPaddingCharacter:@"0"];
  v92[0] = &off_2DD00;
  v25 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 1.0, 0.0);
  v93[0] = v25;
  v92[1] = &off_2DD18;
  v87 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 1.0, 0.0);
  v93[1] = v87;
  v92[2] = &off_2DD30;
  v26 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v18, 0.0);
  v93[2] = v26;
  v92[3] = &off_2DD48;
  v27 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 1.0, 0.0);
  v93[3] = v27;
  v92[4] = &off_2DD60;
  v28 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 0.0, v19);
  v93[4] = v28;
  v92[5] = &off_2DD78;
  v29 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", -0.5, 0.0);
  v93[5] = v29;
  v92[6] = &off_2DD90;
  v30 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", -1.0, 0.0);
  v93[6] = v30;
  v92[7] = &off_2DDA8;
  v31 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 0.0, 1.0);
  v93[7] = v31;
  v32 = +[NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:8];

  [(NTKSiderealDialView *)v90 bounds];
  CLKRectGetCenter();
  double v86 = v34;
  double v88 = v33;
  double v35 = v17 * 0.5;
  double v36 = CGRectZero.origin.y;
  double v38 = CGRectZero.size.width;
  double v37 = CGRectZero.size.height;
  unint64_t v39 = 1;
  for (uint64_t i = 2; i != 26; i += 2)
  {
    id v41 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, v36, v38, v37);
    v42 = +[CLKFont systemFontOfSize:v85 weight:UIFontWeightSemibold];
    [v41 setFont:v42];

    v43 = +[NSNumber numberWithUnsignedInteger:i];
    v44 = [v89 stringFromNumber:v43];
    [v41 setText:v44];

    v45 = sub_18684();
    [v41 setTextColor:v45];

    [v41 sizeToFit];
    __double2 v46 = __sincos_stret((double)v39 * 0.523598776 + 1.57079633);
    v47 = +[NSNumber numberWithUnsignedInteger:i];
    v48 = [v32 objectForKeyedSubscript:v47];

    double v49 = round(v88 + v35 * v46.__cosval);
    double v50 = round(v86 + v35 * v46.__sinval);
    if (v48)
    {
      [v48 CGPointValue];
      double v49 = v49 + v51;
      double v50 = v50 + v52;
    }
    objc_msgSend(v41, "setCenter:", v49, v50);
    [(UIView *)v90->_hourContainerView addSubview:v41];

    ++v39;
  }
  v53 = [(NTKSiderealDialView *)v90 layer];
  [(NTKSiderealDialView *)v90 bounds];
  double v55 = v54;
  double v57 = v56;
  double v59 = v58;
  double v61 = v60;
  CLKDegreesToRadians();
  v63 = -[NTKSiderealDialView _replicatorLayerWithCenter:bounds:dialDiameter:instanceCount:instanceRotation:tickOpacity:tickSize:tickCornerRadius:](v90, "_replicatorLayerWithCenter:bounds:dialDiameter:instanceCount:instanceRotation:tickOpacity:tickSize:tickCornerRadius:", 144, v88, v86, v55, v57, v59, v61, v83, v62, 0x3FE0000000000000, *(void *)&v82, v81, v82 * 0.5);
  [v53 addSublayer:v63];

  v64 = [(NTKSiderealDialView *)v90 layer];
  [(NTKSiderealDialView *)v90 bounds];
  v69 = -[NTKSiderealDialView _replicatorLayerWithCenter:bounds:dialDiameter:instanceCount:instanceRotation:tickOpacity:tickSize:tickCornerRadius:](v90, "_replicatorLayerWithCenter:bounds:dialDiameter:instanceCount:instanceRotation:tickOpacity:tickSize:tickCornerRadius:", 24, v88, v86, v65, v66, v67, v68, v83, 0.261799388, 0x3FF0000000000000, *(void *)&v80, v79, v80 * 0.5);
  [v64 addSublayer:v69];

  v70 = [(NTKSiderealDialView *)v90 layer];
  [(NTKSiderealDialView *)v90 bounds];
  v75 = -[NTKSiderealDialView _replicatorLayerWithCenter:bounds:dialDiameter:instanceCount:instanceRotation:tickOpacity:tickSize:tickCornerRadius:](v90, "_replicatorLayerWithCenter:bounds:dialDiameter:instanceCount:instanceRotation:tickOpacity:tickSize:tickCornerRadius:", 12, v88, v86, v71, v72, v73, v74, v83, 0.523598776, 0x3FF0000000000000, *(void *)&v78, v77, v78 * 0.5);
  [v70 addSublayer:v75];

LABEL_12:
  return v90;
}

- (id)_replicatorLayerWithCenter:(CGPoint)a3 bounds:(CGRect)a4 dialDiameter:(double)a5 instanceCount:(int64_t)a6 instanceRotation:(double)a7 tickOpacity:(double)a8 tickSize:(CGSize)a9 tickCornerRadius:(double)a10
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v16 = a3.y;
  double v17 = a3.x;
  double v18 = objc_opt_new();
  [v18 setFillMode:kCAFillModeBoth];
  objc_msgSend(v18, "setPosition:", v17, v16);
  objc_msgSend(v18, "setBounds:", x, y, width, height);
  [v18 setInstanceCount:a6];
  sub_18684();
  id v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setInstanceColor:", objc_msgSend(v19, "CGColor"));

  CATransform3DMakeRotation(&v25, a7, 0.0, 0.0, 1.0);
  [v18 setInstanceTransform:&v25];
  v20 = objc_opt_new();
  sub_18684();
  id v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBackgroundColor:", objc_msgSend(v21, "CGColor"));

  objc_msgSend(v20, "setBounds:", 0.0, 0.0, a10, v27);
  HIDWORD(v22) = HIDWORD(a8);
  *(float *)&double v22 = a8;
  [v20 setOpacity:v22];
  [v20 setCornerRadius:v28];
  objc_msgSend(v20, "setPosition:", v17, v16 - a5 * 0.5 + v27 * 0.5 + 1.0);
  [v18 addSublayer:v20];

  return v18;
}

- (void).cxx_destruct
{
}

@end