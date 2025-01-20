@interface ZWDockedLensChromeBorderView
- (CAShapeLayer)chromeInnerBorderLayer;
- (CAShapeLayer)chromeOuterBorderLayer;
- (CAShapeLayer)touchStealerShapeLayer;
- (ZWDockedLensChromeBorderView)initWithFrame:(CGRect)a3;
- (id)innerBorderPathForCurrentDockPositionForBounds:(CGRect)a3;
- (id)outerBorderPathForCurrentDockPositionForBounds:(CGRect)a3;
- (int64_t)dockPosition;
- (void)layoutSubviews;
- (void)setChromeInnerBorderLayer:(id)a3;
- (void)setChromeOuterBorderLayer:(id)a3;
- (void)setDockPosition:(int64_t)a3;
- (void)setTouchStealerShapeLayer:(id)a3;
@end

@implementation ZWDockedLensChromeBorderView

- (ZWDockedLensChromeBorderView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)ZWDockedLensChromeBorderView;
  v3 = -[ZWDockedLensChromeBorderView initWithFrame:](&v21, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(ZWDockedLensChromeBorderView *)v3 layer];
    v6 = +[CAShapeLayer layer];
    [(ZWDockedLensChromeBorderView *)v4 setChromeInnerBorderLayer:v6];
    [v5 addSublayer:v6];
    id v7 = +[UIColor clearColor];
    objc_msgSend(v6, "setFillColor:", objc_msgSend(v7, "CGColor"));

    ZWLensInnerColor();
    id v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v8, "CGColor"));

    [v6 setLineWidth:ZWLensInnerBorderWidth()];
    v9 = +[CAFilter filterWithType:kCAFilterPlusL];
    [v6 setCompositingFilter:v9];

    v10 = +[CAShapeLayer layer];
    [(ZWDockedLensChromeBorderView *)v4 setChromeOuterBorderLayer:v10];
    [v5 addSublayer:v10];
    id v11 = +[UIColor clearColor];
    objc_msgSend(v10, "setFillColor:", objc_msgSend(v11, "CGColor"));

    ZWLensOuterColor();
    id v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v12, "CGColor"));

    [v10 setLineWidth:ZWLensOuterBorderWidth()];
    v13 = +[CAFilter filterWithType:kCAFilterPlusD];
    [v10 setCompositingFilter:v13];

    v14 = +[CAShapeLayer layer];
    [(ZWDockedLensChromeBorderView *)v4 setTouchStealerShapeLayer:v14];
    LODWORD(v15) = 1.0;
    [v14 setOpacity:v15];
    v16 = +[UIColor blackColor];
    id v17 = [v16 colorWithAlphaComponent:0.00392156863];
    objc_msgSend(v14, "setStrokeColor:", objc_msgSend(v17, "CGColor"));

    id v18 = +[UIColor clearColor];
    objc_msgSend(v14, "setFillColor:", objc_msgSend(v18, "CGColor"));

    [v14 setLineWidth:ZWZoomLensBorderThicknessForTouches()];
    v19 = [(ZWDockedLensChromeBorderView *)v4 layer];
    [v19 addSublayer:v14];
  }
  return v4;
}

- (void)layoutSubviews
{
  v41.receiver = self;
  v41.super_class = (Class)ZWDockedLensChromeBorderView;
  [(ZWDockedLensChromeBorderView *)&v41 layoutSubviews];
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(ZWDockedLensChromeBorderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(ZWDockedLensChromeBorderView *)self chromeInnerBorderLayer];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(ZWDockedLensChromeBorderView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(ZWDockedLensChromeBorderView *)self chromeOuterBorderLayer];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  [(ZWDockedLensChromeBorderView *)self bounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v29 = [(ZWDockedLensChromeBorderView *)self touchStealerShapeLayer];
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  [(ZWDockedLensChromeBorderView *)self bounds];
  +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
  id v30 = objc_claimAutoreleasedReturnValue();
  id v31 = [v30 CGPath];
  v32 = [(ZWDockedLensChromeBorderView *)self touchStealerShapeLayer];
  [v32 setPath:v31];

  [(ZWDockedLensChromeBorderView *)self bounds];
  v33 = [(ZWDockedLensChromeBorderView *)self outerBorderPathForCurrentDockPositionForBounds:"outerBorderPathForCurrentDockPositionForBounds:"];
  [(ZWDockedLensChromeBorderView *)self bounds];
  v34 = -[ZWDockedLensChromeBorderView innerBorderPathForCurrentDockPositionForBounds:](self, "innerBorderPathForCurrentDockPositionForBounds:");
  id v35 = v33;
  id v36 = [v35 CGPath];
  v37 = [(ZWDockedLensChromeBorderView *)self chromeOuterBorderLayer];
  [v37 setPath:v36];

  id v38 = v34;
  id v39 = [v38 CGPath];
  v40 = [(ZWDockedLensChromeBorderView *)self chromeInnerBorderLayer];
  [v40 setPath:v39];

  +[CATransaction commit];
}

- (id)innerBorderPathForCurrentDockPositionForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = objc_alloc_init((Class)UIBezierPath);
  double v9 = x + 2.0;
  double v10 = y + 2.0;
  double v11 = width + -4.0;
  double v12 = height + -4.0;
  switch([(ZWDockedLensChromeBorderView *)self dockPosition])
  {
    case 0:
      v44.origin.double x = v9;
      v44.origin.double y = v10;
      v44.size.double width = v11;
      v44.size.double height = v12;
      double MaxX = CGRectGetMaxX(v44);
      v45.origin.double x = v9;
      v45.origin.double y = v10;
      v45.size.double width = v11;
      v45.size.double height = v12;
      [v8 addArcWithCenter:1 radius:MaxX startAngle:CGRectGetMaxY(v45) endAngle:0.0 clockwise:0.0];
      v46.origin.double x = v9;
      v46.origin.double y = v10;
      v46.size.double width = v11;
      v46.size.double height = v12;
      CGFloat v14 = CGRectGetMidX(v46) + 25.0 + 1.0;
      v47.origin.double x = v9;
      v47.origin.double y = v10;
      v47.size.double width = v11;
      v47.size.double height = v12;
      objc_msgSend(v8, "addLineToPoint:", v14, CGRectGetMaxY(v47));
      v48.origin.double x = v9;
      v48.origin.double y = v10;
      v48.size.double width = v11;
      v48.size.double height = v12;
      CGFloat v15 = CGRectGetMidX(v48) + 25.0 + -6.5 + 1.0;
      v49.origin.double x = v9;
      v49.origin.double y = v10;
      v49.size.double width = v11;
      v49.size.double height = v12;
      objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v15, CGRectGetMaxY(v49) + 1.0, 6.5, 0.0, -1.57079633);
      v50.origin.double x = v9;
      v50.origin.double y = v10;
      v50.size.double width = v11;
      v50.size.double height = v12;
      CGFloat v16 = CGRectGetMidX(v50) + -25.0 + 6.5 + -1.0;
      v51.origin.double x = v9;
      v51.origin.double y = v10;
      v51.size.double width = v11;
      v51.size.double height = v12;
      objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v16, CGRectGetMaxY(v51) + 1.0, 6.5, -1.57079633, -3.14159265);
      v52.origin.double x = v9;
      v52.origin.double y = v10;
      v52.size.double width = v11;
      v52.size.double height = v12;
      CGFloat v17 = CGRectGetMidX(v52) + -25.0 + -1.0;
      v53.origin.double x = v9;
      v53.origin.double y = v10;
      v53.size.double width = v11;
      v53.size.double height = v12;
      objc_msgSend(v8, "addLineToPoint:", v17, CGRectGetMaxY(v53));
      v54.origin.double x = v9;
      v54.origin.double y = v10;
      v54.size.double width = v11;
      v54.size.double height = v12;
      CGFloat MinX = CGRectGetMinX(v54);
      v55.origin.double x = v9;
      v55.origin.double y = v10;
      v55.size.double width = v11;
      v55.size.double height = v12;
      double MaxY = CGRectGetMaxY(v55);
      goto LABEL_7;
    case 1:
      v56.origin.double x = v9;
      v56.origin.double y = v10;
      v56.size.double width = v11;
      v56.size.double height = v12;
      double v20 = CGRectGetMaxX(v56);
      v57.origin.double x = v9;
      v57.origin.double y = v10;
      v57.size.double width = v11;
      v57.size.double height = v12;
      objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v20, CGRectGetMaxY(v57), 0.0, 1.57079633, 3.14159265);
      v58.origin.double x = v9;
      v58.origin.double y = v10;
      v58.size.double width = v11;
      v58.size.double height = v12;
      double v21 = CGRectGetMaxX(v58);
      v59.origin.double x = v9;
      v59.origin.double y = v10;
      v59.size.double width = v11;
      v59.size.double height = v12;
      objc_msgSend(v8, "addLineToPoint:", v21, CGRectGetMidY(v59) + 25.0 + 1.0);
      v60.origin.double x = v9;
      v60.origin.double y = v10;
      v60.size.double width = v11;
      v60.size.double height = v12;
      CGFloat v22 = CGRectGetMaxX(v60) + 1.0;
      v61.origin.double x = v9;
      v61.origin.double y = v10;
      v61.size.double width = v11;
      v61.size.double height = v12;
      objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v22, CGRectGetMidY(v61) + 25.0 + -6.5 + 1.0, 6.5, 1.57079633, 3.14159265);
      v62.origin.double x = v9;
      v62.origin.double y = v10;
      v62.size.double width = v11;
      v62.size.double height = v12;
      CGFloat v23 = CGRectGetMaxX(v62) + 1.0;
      v63.origin.double x = v9;
      v63.origin.double y = v10;
      v63.size.double width = v11;
      v63.size.double height = v12;
      objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v23, CGRectGetMidY(v63) + -25.0 + 6.5 + -1.0, 6.5, 3.14159265, -1.57079633);
      v64.origin.double x = v9;
      v64.origin.double y = v10;
      v64.size.double width = v11;
      v64.size.double height = v12;
      double v24 = CGRectGetMaxX(v64);
      v65.origin.double x = v9;
      v65.origin.double y = v10;
      v65.size.double width = v11;
      v65.size.double height = v12;
      objc_msgSend(v8, "addLineToPoint:", v24, CGRectGetMidY(v65) + -25.0 + -1.0);
      v66.origin.double x = v9;
      v66.origin.double y = v10;
      v66.size.double width = v11;
      v66.size.double height = v12;
      CGFloat v25 = CGRectGetMaxX(v66);
      v67.origin.double x = v9;
      v67.origin.double y = v10;
      v67.size.double width = v11;
      v67.size.double height = v12;
      double MinY = CGRectGetMinY(v67);
      double v27 = v8;
      double v28 = v25;
      double v29 = 3.14159265;
      goto LABEL_5;
    case 2:
      v68.origin.double x = v9;
      v68.origin.double y = v10;
      v68.size.double width = v11;
      v68.size.double height = v12;
      double v30 = CGRectGetMinX(v68);
      v69.origin.double x = v9;
      v69.origin.double y = v10;
      v69.size.double width = v11;
      v69.size.double height = v12;
      [v8 addArcWithCenter:1 radius:v30 startAngle:CGRectGetMaxY(v69) endAngle:0.0 clockwise:1.57079633];
      v70.origin.double x = v9;
      v70.origin.double y = v10;
      v70.size.double width = v11;
      v70.size.double height = v12;
      double v31 = CGRectGetMinX(v70);
      v71.origin.double x = v9;
      v71.origin.double y = v10;
      v71.size.double width = v11;
      v71.size.double height = v12;
      objc_msgSend(v8, "addLineToPoint:", v31, CGRectGetMidY(v71) + 25.0 + 1.0);
      v72.origin.double x = v9;
      v72.origin.double y = v10;
      v72.size.double width = v11;
      v72.size.double height = v12;
      CGFloat v32 = CGRectGetMinX(v72) + -1.0;
      v73.origin.double x = v9;
      v73.origin.double y = v10;
      v73.size.double width = v11;
      v73.size.double height = v12;
      objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v32, CGRectGetMidY(v73) + 25.0 + -6.5 + 1.0, 6.5, 1.57079633, 0.0);
      v74.origin.double x = v9;
      v74.origin.double y = v10;
      v74.size.double width = v11;
      v74.size.double height = v12;
      CGFloat v33 = CGRectGetMinX(v74) + -1.0;
      v75.origin.double x = v9;
      v75.origin.double y = v10;
      v75.size.double width = v11;
      v75.size.double height = v12;
      objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v33, CGRectGetMidY(v75) + -25.0 + 6.5 + -1.0, 6.5, 0.0, -1.57079633);
      v76.origin.double x = v9;
      v76.origin.double y = v10;
      v76.size.double width = v11;
      v76.size.double height = v12;
      double v34 = CGRectGetMinX(v76);
      v77.origin.double x = v9;
      v77.origin.double y = v10;
      v77.size.double width = v11;
      v77.size.double height = v12;
      objc_msgSend(v8, "addLineToPoint:", v34, CGRectGetMidY(v77) + -25.0 + -1.0);
      v78.origin.double x = v9;
      v78.origin.double y = v10;
      v78.size.double width = v11;
      v78.size.double height = v12;
      CGFloat v35 = CGRectGetMinX(v78);
      v79.origin.double x = v9;
      v79.origin.double y = v10;
      v79.size.double width = v11;
      v79.size.double height = v12;
      double MinY = CGRectGetMinY(v79);
      double v27 = v8;
      double v28 = v35;
      double v29 = 3.14159265;
LABEL_5:
      double v36 = -1.57079633;
      goto LABEL_8;
    case 3:
      v80.origin.double x = v9;
      v80.origin.double y = v10;
      v80.size.double width = v11;
      v80.size.double height = v12;
      double v37 = CGRectGetMaxX(v80);
      v81.origin.double x = v9;
      v81.origin.double y = v10;
      v81.size.double width = v11;
      v81.size.double height = v12;
      [v8 addArcWithCenter:1 radius:v37 startAngle:CGRectGetMinY(v81) endAngle:0.0 clockwise:0.0];
      v82.origin.double x = v9;
      v82.origin.double y = v10;
      v82.size.double width = v11;
      v82.size.double height = v12;
      CGFloat v38 = CGRectGetMidX(v82) + 25.0 + 1.0;
      v83.origin.double x = v9;
      v83.origin.double y = v10;
      v83.size.double width = v11;
      v83.size.double height = v12;
      objc_msgSend(v8, "addLineToPoint:", v38, CGRectGetMinY(v83));
      v84.origin.double x = v9;
      v84.origin.double y = v10;
      v84.size.double width = v11;
      v84.size.double height = v12;
      CGFloat v39 = CGRectGetMidX(v84) + 25.0 + -6.5 + 1.0;
      v85.origin.double x = v9;
      v85.origin.double y = v10;
      v85.size.double width = v11;
      v85.size.double height = v12;
      objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v39, CGRectGetMinY(v85) + 1.0, 6.5, 0.0, -1.57079633);
      v86.origin.double x = v9;
      v86.origin.double y = v10;
      v86.size.double width = v11;
      v86.size.double height = v12;
      CGFloat v40 = CGRectGetMidX(v86) + -25.0 + 6.5 + -1.0;
      v87.origin.double x = v9;
      v87.origin.double y = v10;
      v87.size.double width = v11;
      v87.size.double height = v12;
      objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v40, CGRectGetMinY(v87) + 1.0, 6.5, -1.57079633, -3.14159265);
      v88.origin.double x = v9;
      v88.origin.double y = v10;
      v88.size.double width = v11;
      v88.size.double height = v12;
      CGFloat v41 = CGRectGetMidX(v88) + -25.0 + -1.0;
      v89.origin.double x = v9;
      v89.origin.double y = v10;
      v89.size.double width = v11;
      v89.size.double height = v12;
      objc_msgSend(v8, "addLineToPoint:", v41, CGRectGetMinY(v89));
      v90.origin.double x = v9;
      v90.origin.double y = v10;
      v90.size.double width = v11;
      v90.size.double height = v12;
      CGFloat MinX = CGRectGetMinX(v90);
      v91.origin.double x = v9;
      v91.origin.double y = v10;
      v91.size.double width = v11;
      v91.size.double height = v12;
      double MaxY = CGRectGetMinY(v91);
LABEL_7:
      double MinY = MaxY;
      double v36 = 3.14159265;
      double v27 = v8;
      double v28 = MinX;
      double v29 = 1.57079633;
LABEL_8:
      objc_msgSend(v27, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v28, MinY, 0.0, v29, v36);
      break;
    default:
      break;
  }

  return v8;
}

- (id)outerBorderPathForCurrentDockPositionForBounds:(CGRect)a3
{
  [(ZWDockedLensChromeBorderView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = +[UIBezierPath bezierPath];
  switch([(ZWDockedLensChromeBorderView *)self dockPosition])
  {
    case 0:
      v48.origin.double x = v5;
      v48.origin.double y = v7;
      v48.size.double width = v9;
      v48.size.double height = v11;
      double MaxX = CGRectGetMaxX(v48);
      v49.origin.double x = v5;
      v49.origin.double y = v7;
      v49.size.double width = v9;
      v49.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MaxX, CGRectGetMaxY(v49), 0.0, 0.0, 1.57079633);
      v50.origin.double x = v5;
      v50.origin.double y = v7;
      v50.size.double width = v9;
      v50.size.double height = v11;
      CGFloat v14 = CGRectGetMidX(v50) + 25.0 + -6.0 + -1.0;
      v51.origin.double x = v5;
      v51.origin.double y = v7;
      v51.size.double width = v9;
      v51.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v14, CGRectGetMaxY(v51), 6.0, 0.0, -1.57079633);
      v52.origin.double x = v5;
      v52.origin.double y = v7;
      v52.size.double width = v9;
      v52.size.double height = v11;
      CGFloat v15 = CGRectGetMidX(v52) + -25.0 + 6.0 + 1.0;
      v53.origin.double x = v5;
      v53.origin.double y = v7;
      v53.size.double width = v9;
      v53.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v15, CGRectGetMaxY(v53), 6.0, -1.57079633, 1.57079633);
      v54.origin.double x = v5;
      v54.origin.double y = v7;
      v54.size.double width = v9;
      v54.size.double height = v11;
      CGFloat v16 = CGRectGetMidX(v54) + 25.0 + -6.0 + -1.0;
      v55.origin.double x = v5;
      v55.origin.double y = v7;
      v55.size.double width = v9;
      v55.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v16, CGRectGetMaxY(v55), 6.0, 1.57079633, 0.0);
      v56.origin.double x = v5;
      v56.origin.double y = v7;
      v56.size.double width = v9;
      v56.size.double height = v11;
      CGFloat v17 = CGRectGetMidX(v56) + 25.0 + -6.0 + -1.0;
      v57.origin.double x = v5;
      v57.origin.double y = v7;
      v57.size.double width = v9;
      v57.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v17, CGRectGetMaxY(v57), 6.0, 0.0, -1.57079633);
      v58.origin.double x = v5;
      v58.origin.double y = v7;
      v58.size.double width = v9;
      v58.size.double height = v11;
      CGFloat v18 = CGRectGetMidX(v58) + -25.0 + 6.0 + 1.0;
      v59.origin.double x = v5;
      v59.origin.double y = v7;
      v59.size.double width = v9;
      v59.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v18, CGRectGetMaxY(v59), 6.0, -1.57079633, -3.14159265);
      v60.origin.double x = v5;
      v60.origin.double y = v7;
      v60.size.double width = v9;
      v60.size.double height = v11;
      CGFloat MinX = CGRectGetMinX(v60);
      v61.origin.double x = v5;
      v61.origin.double y = v7;
      v61.size.double width = v9;
      v61.size.double height = v11;
      double MaxY = CGRectGetMaxY(v61);
      goto LABEL_7;
    case 1:
      v62.origin.double x = v5;
      v62.origin.double y = v7;
      v62.size.double width = v9;
      v62.size.double height = v11;
      double v21 = CGRectGetMaxX(v62);
      v63.origin.double x = v5;
      v63.origin.double y = v7;
      v63.size.double width = v9;
      v63.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v21, CGRectGetMaxY(v63), 0.0, 1.57079633, 3.14159265);
      v64.origin.double x = v5;
      v64.origin.double y = v7;
      v64.size.double width = v9;
      v64.size.double height = v11;
      double v22 = CGRectGetMaxX(v64);
      v65.origin.double x = v5;
      v65.origin.double y = v7;
      v65.size.double width = v9;
      v65.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v22, CGRectGetMidY(v65) + 25.0 + -6.0 + -1.0, 6.0, 1.57079633, 0.0);
      v66.origin.double x = v5;
      v66.origin.double y = v7;
      v66.size.double width = v9;
      v66.size.double height = v11;
      double v23 = CGRectGetMaxX(v66);
      v67.origin.double x = v5;
      v67.origin.double y = v7;
      v67.size.double width = v9;
      v67.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v23, CGRectGetMidY(v67) + -25.0 + 6.0 + 1.0, 6.0, 0.0, 3.14159265);
      v68.origin.double x = v5;
      v68.origin.double y = v7;
      v68.size.double width = v9;
      v68.size.double height = v11;
      double v24 = CGRectGetMaxX(v68);
      v69.origin.double x = v5;
      v69.origin.double y = v7;
      v69.size.double width = v9;
      v69.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v24, CGRectGetMidY(v69) + 25.0 + -6.0 + -1.0, 6.0, 3.14159265, 1.57079633);
      v70.origin.double x = v5;
      v70.origin.double y = v7;
      v70.size.double width = v9;
      v70.size.double height = v11;
      double v25 = CGRectGetMaxX(v70);
      v71.origin.double x = v5;
      v71.origin.double y = v7;
      v71.size.double width = v9;
      v71.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v25, CGRectGetMidY(v71) + 25.0 + -6.0 + -1.0, 6.0, 1.57079633, 0.0);
      v72.origin.double x = v5;
      v72.origin.double y = v7;
      v72.size.double width = v9;
      v72.size.double height = v11;
      double v26 = CGRectGetMaxX(v72);
      v73.origin.double x = v5;
      v73.origin.double y = v7;
      v73.size.double width = v9;
      v73.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v26, CGRectGetMidY(v73) + -25.0 + 6.0 + 1.0, 6.0, 0.0, -1.57079633);
      v74.origin.double x = v5;
      v74.origin.double y = v7;
      v74.size.double width = v9;
      v74.size.double height = v11;
      double v27 = CGRectGetMaxX(v74);
      goto LABEL_5;
    case 2:
      v75.origin.double x = v5;
      v75.origin.double y = v7;
      v75.size.double width = v9;
      v75.size.double height = v11;
      double v28 = CGRectGetMinX(v75);
      v76.origin.double x = v5;
      v76.origin.double y = v7;
      v76.size.double width = v9;
      v76.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v28, CGRectGetMaxY(v76), 0.0, 1.57079633, 3.14159265);
      v77.origin.double x = v5;
      v77.origin.double y = v7;
      v77.size.double width = v9;
      v77.size.double height = v11;
      double v29 = CGRectGetMinX(v77);
      v78.origin.double x = v5;
      v78.origin.double y = v7;
      v78.size.double width = v9;
      v78.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v29, CGRectGetMidY(v78) + 25.0 + -6.0 + -1.0, 6.0, 1.57079633, 0.0);
      v79.origin.double x = v5;
      v79.origin.double y = v7;
      v79.size.double width = v9;
      v79.size.double height = v11;
      double v30 = CGRectGetMinX(v79);
      v80.origin.double x = v5;
      v80.origin.double y = v7;
      v80.size.double width = v9;
      v80.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v30, CGRectGetMidY(v80) + -25.0 + 6.0 + 1.0, 6.0, 0.0, 3.14159265);
      v81.origin.double x = v5;
      v81.origin.double y = v7;
      v81.size.double width = v9;
      v81.size.double height = v11;
      double v31 = CGRectGetMinX(v81);
      v82.origin.double x = v5;
      v82.origin.double y = v7;
      v82.size.double width = v9;
      v82.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v31, CGRectGetMidY(v82) + 25.0 + -6.0 + -1.0, 6.0, 3.14159265, 1.57079633);
      v83.origin.double x = v5;
      v83.origin.double y = v7;
      v83.size.double width = v9;
      v83.size.double height = v11;
      double v32 = CGRectGetMinX(v83);
      v84.origin.double x = v5;
      v84.origin.double y = v7;
      v84.size.double width = v9;
      v84.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v32, CGRectGetMidY(v84) + 25.0 + -6.0 + -1.0, 6.0, 1.57079633, 0.0);
      v85.origin.double x = v5;
      v85.origin.double y = v7;
      v85.size.double width = v9;
      v85.size.double height = v11;
      double v33 = CGRectGetMinX(v85);
      v86.origin.double x = v5;
      v86.origin.double y = v7;
      v86.size.double width = v9;
      v86.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v33, CGRectGetMidY(v86) + -25.0 + 6.0 + 1.0, 6.0, 0.0, -1.57079633);
      v87.origin.double x = v5;
      v87.origin.double y = v7;
      v87.size.double width = v9;
      v87.size.double height = v11;
      double v27 = CGRectGetMinX(v87);
LABEL_5:
      double v34 = v27;
      v88.origin.double x = v5;
      v88.origin.double y = v7;
      v88.size.double width = v9;
      v88.size.double height = v11;
      double MinY = CGRectGetMinY(v88);
      double v36 = 0.0;
      double v37 = v12;
      double v38 = v34;
      double v39 = 1.57079633;
      goto LABEL_8;
    case 3:
      v89.origin.double x = v5;
      v89.origin.double y = v7;
      v89.size.double width = v9;
      v89.size.double height = v11;
      double v40 = CGRectGetMaxX(v89);
      v90.origin.double x = v5;
      v90.origin.double y = v7;
      v90.size.double width = v9;
      v90.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v40, CGRectGetMinY(v90), 0.0, 0.0, 1.57079633);
      v91.origin.double x = v5;
      v91.origin.double y = v7;
      v91.size.double width = v9;
      v91.size.double height = v11;
      CGFloat v41 = CGRectGetMidX(v91) + 25.0 + -6.0 + -1.0;
      v92.origin.double x = v5;
      v92.origin.double y = v7;
      v92.size.double width = v9;
      v92.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v41, CGRectGetMinY(v92), 6.0, 0.0, -1.57079633);
      v93.origin.double x = v5;
      v93.origin.double y = v7;
      v93.size.double width = v9;
      v93.size.double height = v11;
      CGFloat v42 = CGRectGetMidX(v93) + -25.0 + 6.0 + 1.0;
      v94.origin.double x = v5;
      v94.origin.double y = v7;
      v94.size.double width = v9;
      v94.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v42, CGRectGetMinY(v94), 6.0, -1.57079633, 1.57079633);
      v95.origin.double x = v5;
      v95.origin.double y = v7;
      v95.size.double width = v9;
      v95.size.double height = v11;
      CGFloat v43 = CGRectGetMidX(v95) + 25.0 + -6.0 + -1.0;
      v96.origin.double x = v5;
      v96.origin.double y = v7;
      v96.size.double width = v9;
      v96.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v43, CGRectGetMinY(v96), 6.0, 1.57079633, 0.0);
      v97.origin.double x = v5;
      v97.origin.double y = v7;
      v97.size.double width = v9;
      v97.size.double height = v11;
      CGFloat v44 = CGRectGetMidX(v97) + 25.0 + -6.0 + -1.0;
      v98.origin.double x = v5;
      v98.origin.double y = v7;
      v98.size.double width = v9;
      v98.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v44, CGRectGetMinY(v98), 6.0, 0.0, -1.57079633);
      v99.origin.double x = v5;
      v99.origin.double y = v7;
      v99.size.double width = v9;
      v99.size.double height = v11;
      CGFloat v45 = CGRectGetMidX(v99) + -25.0 + 6.0 + 1.0;
      v100.origin.double x = v5;
      v100.origin.double y = v7;
      v100.size.double width = v9;
      v100.size.double height = v11;
      objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v45, CGRectGetMinY(v100), 6.0, -1.57079633, -3.14159265);
      v101.origin.double x = v5;
      v101.origin.double y = v7;
      v101.size.double width = v9;
      v101.size.double height = v11;
      CGFloat MinX = CGRectGetMinX(v101);
      v102.origin.double x = v5;
      v102.origin.double y = v7;
      v102.size.double width = v9;
      v102.size.double height = v11;
      double MaxY = CGRectGetMinY(v102);
LABEL_7:
      double MinY = MaxY;
      double v39 = 0.0;
      double v37 = v12;
      double v38 = MinX;
      double v36 = 1.57079633;
LABEL_8:
      objc_msgSend(v37, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v38, MinY, 0.0, v39, v36);
      break;
    default:
      break;
  }

  return v12;
}

- (int64_t)dockPosition
{
  return self->_dockPosition;
}

- (void)setDockPosition:(int64_t)a3
{
  self->_dockPosition = a3;
}

- (CAShapeLayer)chromeOuterBorderLayer
{
  return self->_chromeOuterBorderLayer;
}

- (void)setChromeOuterBorderLayer:(id)a3
{
}

- (CAShapeLayer)chromeInnerBorderLayer
{
  return self->_chromeInnerBorderLayer;
}

- (void)setChromeInnerBorderLayer:(id)a3
{
}

- (CAShapeLayer)touchStealerShapeLayer
{
  return self->_touchStealerShapeLayer;
}

- (void)setTouchStealerShapeLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchStealerShapeLayer, 0);
  objc_storeStrong((id *)&self->_chromeInnerBorderLayer, 0);

  objc_storeStrong((id *)&self->_chromeOuterBorderLayer, 0);
}

@end