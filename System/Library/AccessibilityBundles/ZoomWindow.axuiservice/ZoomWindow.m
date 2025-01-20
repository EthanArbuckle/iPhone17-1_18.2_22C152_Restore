BOOL ZWUseVibrantBlendModes()
{
  void *v0;
  char *v1;
  BOOL v2;

  v0 = +[UIDevice currentDevice];
  v1 = (char *)[v0 _graphicsQuality];

  v2 = !UIAccessibilityIsReduceTransparencyEnabled();
  return v1 != (unsigned char *)&dword_8 + 2 && v2;
}

double ZWConvertPointInScreenPixelsToViewCoordinates(void *a1, double a2, double a3)
{
  id v5 = a1;
  v6 = [v5 window];
  v7 = [v6 screen];
  [v7 scale];
  double v9 = v8;

  objc_msgSend(v5, "zw_convertPointFromScreenCoordinates:", a2 / v9, a3 / v9);
  double v11 = v10;

  return v11;
}

double ZWConvertPointInScreenPixelsToScreenCoordinates(double a1, double a2, double a3)
{
  return a1 / a3;
}

id ZWLocString(void *a1)
{
  uint64_t v1 = ZWLocString_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&ZWLocString_onceToken, &__block_literal_global_341);
  }
  v3 = +[NSBundle bundleForClass:ZWLocString_principalClass];
  v4 = [v3 localizedStringForKey:v2 value:&stru_796A0 table:@"ZoomWindow"];

  return v4;
}

double ZWZoomLensBorderThicknessForTouches()
{
  return 30.0;
}

id ZWLensInnerColor()
{
  if (ZWUseVibrantBlendModes() && AXDeviceIsPhone())
  {
    v0 = +[UIColor colorWithRed:0.564705882 green:0.564705882 blue:0.619607843 alpha:1.0];
  }
  else
  {
    v0 = +[UIColor colorWithWhite:1.0 alpha:0.7];
  }

  return v0;
}

id ZWLensOuterColor()
{
  if (ZWUseVibrantBlendModes() && AXDeviceIsPhone())
  {
    v0 = +[UIColor colorWithRed:0.494117647 green:0.494117647 blue:0.552941176 alpha:1.0];
  }
  else
  {
    v0 = +[UIColor colorWithWhite:0.0 alpha:0.7];
  }

  return v0;
}

double ZWLensInnerBorderWidth()
{
  return 2.0;
}

double ZWLensOuterBorderWidth()
{
  return 2.0;
}

double ZWLensCornerRadius()
{
  return 10.0;
}

UIColor *ZWSlugDefaultRingColor()
{
  return +[UIColor whiteColor];
}

UIColor *ZWSlugRepositioningRingColor()
{
  return +[UIColor systemBlueColor];
}

UIColor *ZWMenuButtonSelectedColor()
{
  return +[UIColor systemBlueColor];
}

double ZWDefaultFadeAnimationDuration()
{
  return 0.2;
}

double ZWDefaultZoomAnimationDuration()
{
  return 0.2;
}

double ZWZoomEdgeSlackAmount()
{
  return 10.0;
}

id ZWOuterLensBorderForBounds(char a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v10 = +[UIBezierPath bezierPath];
  v39.origin.x = a2;
  v39.origin.y = a3;
  v39.size.width = a4;
  v39.size.height = a5;
  double MinX = CGRectGetMinX(v39);
  double v12 = MinX;
  if (a1)
  {
    v40.origin.x = a2;
    v40.origin.y = a3;
    v40.size.width = a4;
    v40.size.height = a5;
    [v10 addArcWithCenter:1 radius:v12 startAngle:CGRectGetMinY(v40) endAngle:11.0 clockwise:0.0];
    v41.origin.x = a2;
    v41.origin.y = a3;
    v41.size.width = a4;
    v41.size.height = a5;
    CGFloat v13 = CGRectGetMinX(v41) + 11.0;
    v42.origin.x = a2;
    v42.origin.y = a3;
    v42.size.width = a4;
    v42.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v13, CGRectGetMinY(v42));
    v43.origin.x = a2;
    v43.origin.y = a3;
    v43.size.width = a4;
    v43.size.height = a5;
    double MidX = CGRectGetMidX(v43);
    v44.origin.x = a2;
    v44.origin.y = a3;
    v44.size.width = a4;
    v44.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, CGRectGetMinY(v44), 11.0, -3.14159265, 3.14159265);
    v45.origin.x = a2;
    v45.origin.y = a3;
    v45.size.width = a4;
    v45.size.height = a5;
    CGFloat v15 = CGRectGetMidX(v45) + 11.0;
    v46.origin.x = a2;
    v46.origin.y = a3;
    v46.size.width = a4;
    v46.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v15, CGRectGetMinY(v46));
    v47.origin.x = a2;
    v47.origin.y = a3;
    v47.size.width = a4;
    v47.size.height = a5;
    double MaxX = CGRectGetMaxX(v47);
    v48.origin.x = a2;
    v48.origin.y = a3;
    v48.size.width = a4;
    v48.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MaxX, CGRectGetMinY(v48), 11.0, -3.14159265, 3.14159265);
    v49.origin.x = a2;
    v49.origin.y = a3;
    v49.size.width = a4;
    v49.size.height = a5;
    double v17 = CGRectGetMaxX(v49);
    v50.origin.x = a2;
    v50.origin.y = a3;
    v50.size.width = a4;
    v50.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v17, CGRectGetMinY(v50) + 11.0);
    v51.origin.x = a2;
    v51.origin.y = a3;
    v51.size.width = a4;
    v51.size.height = a5;
    double v18 = CGRectGetMaxX(v51);
    v52.origin.x = a2;
    v52.origin.y = a3;
    v52.size.width = a4;
    v52.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v18, CGRectGetMidY(v52), 11.0, -1.57079633, 4.71238898);
    v53.origin.x = a2;
    v53.origin.y = a3;
    v53.size.width = a4;
    v53.size.height = a5;
    double v19 = CGRectGetMaxX(v53);
    v54.origin.x = a2;
    v54.origin.y = a3;
    v54.size.width = a4;
    v54.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v19, CGRectGetMidY(v54) + 11.0);
    v55.origin.x = a2;
    v55.origin.y = a3;
    v55.size.width = a4;
    v55.size.height = a5;
    double v20 = CGRectGetMaxX(v55);
    v56.origin.x = a2;
    v56.origin.y = a3;
    v56.size.width = a4;
    v56.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v20, CGRectGetMaxY(v56), 11.0, -1.57079633, 4.71238898);
    v57.origin.x = a2;
    v57.origin.y = a3;
    v57.size.width = a4;
    v57.size.height = a5;
    CGFloat v21 = CGRectGetMaxX(v57) + -11.0;
    v58.origin.x = a2;
    v58.origin.y = a3;
    v58.size.width = a4;
    v58.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v21, CGRectGetMaxY(v58));
    v59.origin.x = a2;
    v59.origin.y = a3;
    v59.size.width = a4;
    v59.size.height = a5;
    double v22 = CGRectGetMidX(v59);
    v60.origin.x = a2;
    v60.origin.y = a3;
    v60.size.width = a4;
    v60.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v22, CGRectGetMaxY(v60), 11.0, 0.0, 6.28318531);
    v61.origin.x = a2;
    v61.origin.y = a3;
    v61.size.width = a4;
    v61.size.height = a5;
    CGFloat v23 = CGRectGetMidX(v61) + -11.0;
    v62.origin.x = a2;
    v62.origin.y = a3;
    v62.size.width = a4;
    v62.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v23, CGRectGetMaxY(v62));
    v63.origin.x = a2;
    v63.origin.y = a3;
    v63.size.width = a4;
    v63.size.height = a5;
    double v24 = CGRectGetMinX(v63);
    v64.origin.x = a2;
    v64.origin.y = a3;
    v64.size.width = a4;
    v64.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v24, CGRectGetMaxY(v64), 11.0, 0.0, 6.28318531);
    v65.origin.x = a2;
    v65.origin.y = a3;
    v65.size.width = a4;
    v65.size.height = a5;
    double v25 = CGRectGetMinX(v65);
    v66.origin.x = a2;
    v66.origin.y = a3;
    v66.size.width = a4;
    v66.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v25, CGRectGetMaxY(v66) + -11.0);
    v67.origin.x = a2;
    v67.origin.y = a3;
    v67.size.width = a4;
    v67.size.height = a5;
    double v26 = CGRectGetMinX(v67);
    v68.origin.x = a2;
    v68.origin.y = a3;
    v68.size.width = a4;
    v68.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v26, CGRectGetMidY(v68), 11.0, 1.57079633, 7.85398163);
    v69.origin.x = a2;
    v69.origin.y = a3;
    v69.size.width = a4;
    v69.size.height = a5;
    double v27 = CGRectGetMinX(v69);
    v70.origin.x = a2;
    v70.origin.y = a3;
    v70.size.width = a4;
    v70.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v27, CGRectGetMidY(v70) + -11.0);
  }
  else
  {
    double v28 = MinX + 11.0;
    v71.origin.x = a2;
    v71.origin.y = a3;
    v71.size.width = a4;
    v71.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v28, CGRectGetMinY(v71) + 11.0, 11.0);
    v72.origin.x = a2;
    v72.origin.y = a3;
    v72.size.width = a4;
    v72.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, CGRectGetMaxX(v72) + -11.0, 11.0, 11.0, -1.57079633, 0.0);
    v73.origin.x = a2;
    v73.origin.y = a3;
    v73.size.width = a4;
    v73.size.height = a5;
    CGFloat v29 = CGRectGetMaxX(v73) + -11.0;
    v74.origin.x = a2;
    v74.origin.y = a3;
    v74.size.width = a4;
    v74.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v29, CGRectGetMaxY(v74) + -11.0, 11.0, 0.0, 1.57079633);
    v75.origin.x = a2;
    v75.origin.y = a3;
    v75.size.width = a4;
    v75.size.height = a5;
    CGFloat v30 = CGRectGetMidX(v75) + 25.0 + -6.0 + -1.0;
    v76.origin.x = a2;
    v76.origin.y = a3;
    v76.size.width = a4;
    v76.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v30, CGRectGetMaxY(v76), 6.0, 0.0, -1.57079633);
    v77.origin.x = a2;
    v77.origin.y = a3;
    v77.size.width = a4;
    v77.size.height = a5;
    CGFloat v31 = CGRectGetMidX(v77) + -25.0 + 6.0 + 1.0;
    v78.origin.x = a2;
    v78.origin.y = a3;
    v78.size.width = a4;
    v78.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v31, CGRectGetMaxY(v78), 6.0, -1.57079633, 1.57079633);
    v79.origin.x = a2;
    v79.origin.y = a3;
    v79.size.width = a4;
    v79.size.height = a5;
    CGFloat v32 = CGRectGetMidX(v79) + 25.0 + -6.0 + -1.0;
    v80.origin.x = a2;
    v80.origin.y = a3;
    v80.size.width = a4;
    v80.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v32, CGRectGetMaxY(v80), 6.0, 1.57079633, 0.0);
    v81.origin.x = a2;
    v81.origin.y = a3;
    v81.size.width = a4;
    v81.size.height = a5;
    CGFloat v33 = CGRectGetMidX(v81) + 25.0 + -6.0 + -1.0;
    v82.origin.x = a2;
    v82.origin.y = a3;
    v82.size.width = a4;
    v82.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v33, CGRectGetMaxY(v82), 6.0, 0.0, -1.57079633);
    v83.origin.x = a2;
    v83.origin.y = a3;
    v83.size.width = a4;
    v83.size.height = a5;
    CGFloat v34 = CGRectGetMidX(v83) + -25.0 + 6.0 + 1.0;
    v84.origin.x = a2;
    v84.origin.y = a3;
    v84.size.width = a4;
    v84.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v34, CGRectGetMaxY(v84), 6.0, -1.57079633, -3.14159265);
    v85.origin.x = a2;
    v85.origin.y = a3;
    v85.size.width = a4;
    v85.size.height = a5;
    CGFloat v35 = CGRectGetMinX(v85) + 11.0;
    v86.origin.x = a2;
    v86.origin.y = a3;
    v86.size.width = a4;
    v86.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v35, CGRectGetMaxY(v86) + -11.0, 11.0, 1.57079633, 3.14159265);
  }
  v87.origin.x = a2;
  v87.origin.y = a3;
  v87.size.width = a4;
  v87.size.height = a5;
  double v36 = CGRectGetMinX(v87);
  v88.origin.x = a2;
  v88.origin.y = a3;
  v88.size.width = a4;
  v88.size.height = a5;
  objc_msgSend(v10, "addLineToPoint:", v36, CGRectGetMinY(v88) + 11.0);

  return v10;
}

id ZWInnerLensBorderForBounds(char a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v10 = objc_alloc_init((Class)UIBezierPath);
  double v11 = v10;
  if (a1)
  {
    id v12 = v10;
    v36.origin.x = a2;
    v36.origin.y = a3;
    v36.size.width = a4;
    v36.size.height = a5;
    double MinX = CGRectGetMinX(v36);
    v37.origin.x = a2;
    v37.origin.y = a3;
    v37.size.width = a4;
    v37.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, MinX, CGRectGetMinY(v37), 13.0, 1.44079633, 0.13);
    v38.origin.x = a2;
    v38.origin.y = a3;
    v38.size.width = a4;
    v38.size.height = a5;
    double MidX = CGRectGetMidX(v38);
    v39.origin.x = a2;
    v39.origin.y = a3;
    v39.size.width = a4;
    v39.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, MidX, CGRectGetMinY(v39), 13.0, -3.27159265, 0.13);
    v40.origin.x = a2;
    v40.origin.y = a3;
    v40.size.width = a4;
    v40.size.height = a5;
    double MaxX = CGRectGetMaxX(v40);
    v41.origin.x = a2;
    v41.origin.y = a3;
    v41.size.width = a4;
    v41.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, MaxX, CGRectGetMinY(v41), 13.0, -3.27159265, 1.70079633);
    v42.origin.x = a2;
    v42.origin.y = a3;
    v42.size.width = a4;
    v42.size.height = a5;
    double v16 = CGRectGetMaxX(v42);
    v43.origin.x = a2;
    v43.origin.y = a3;
    v43.size.width = a4;
    v43.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v16, CGRectGetMidY(v43), 13.0, -1.70079633, 1.70079633);
    v44.origin.x = a2;
    v44.origin.y = a3;
    v44.size.width = a4;
    v44.size.height = a5;
    double v17 = CGRectGetMaxX(v44);
    v45.origin.x = a2;
    v45.origin.y = a3;
    v45.size.width = a4;
    v45.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v17, CGRectGetMaxY(v45), 13.0, -1.70079633, -3.01159265);
    v46.origin.x = a2;
    v46.origin.y = a3;
    v46.size.width = a4;
    v46.size.height = a5;
    double v18 = CGRectGetMidX(v46);
    v47.origin.x = a2;
    v47.origin.y = a3;
    v47.size.width = a4;
    v47.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v18, CGRectGetMaxY(v47), 13.0, -0.13, -3.01159265);
    v48.origin.x = a2;
    v48.origin.y = a3;
    v48.size.width = a4;
    v48.size.height = a5;
    double v19 = CGRectGetMinX(v48);
    v49.origin.x = a2;
    v49.origin.y = a3;
    v49.size.width = a4;
    v49.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v19, CGRectGetMaxY(v49), 13.0, -0.13, -1.44079633);
    v50.origin.x = a2;
    v50.origin.y = a3;
    v50.size.width = a4;
    v50.size.height = a5;
    double v20 = CGRectGetMinX(v50);
    v51.origin.x = a2;
    v51.origin.y = a3;
    v51.size.width = a4;
    v51.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v20, CGRectGetMidY(v51), 13.0, 1.44079633, -1.44079633);
    [v12 closePath];
  }
  else
  {
    CGFloat v21 = a5 + -4.0;
    CGFloat v22 = a4 + -4.0;
    CGFloat v23 = a3 + 2.0;
    CGFloat v24 = a2 + 2.0;
    v52.origin.x = v24;
    v52.origin.y = v23;
    v52.size.width = v22;
    v52.size.height = v21;
    CGFloat v25 = CGRectGetMinX(v52) + 9.0;
    v53.origin.x = v24;
    v53.origin.y = v23;
    v53.size.width = v22;
    v53.size.height = v21;
    +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v25, CGRectGetMinY(v53) + 9.0, 9.0);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    v54.origin.x = v24;
    v54.origin.y = v23;
    v54.size.width = v22;
    v54.size.height = v21;
    CGFloat v26 = CGRectGetMaxX(v54) + -9.0;
    v55.origin.x = v24;
    v55.origin.y = v23;
    v55.size.width = v22;
    v55.size.height = v21;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v26, CGRectGetMinY(v55) + 9.0, 9.0, -1.57079633, 0.0);
    v56.origin.x = v24;
    v56.origin.y = v23;
    v56.size.width = v22;
    v56.size.height = v21;
    CGFloat v27 = CGRectGetMaxX(v56) + -9.0;
    v57.origin.x = v24;
    v57.origin.y = v23;
    v57.size.width = v22;
    v57.size.height = v21;
    [v12 addArcWithCenter:1 radius:v27 startAngle:CGRectGetMaxY(v57) + -9.0 endAngle:9.0 clockwise:0.0];
    v58.origin.x = v24;
    v58.origin.y = v23;
    v58.size.width = v22;
    v58.size.height = v21;
    CGFloat v28 = CGRectGetMidX(v58) + 25.0 + 1.0;
    v59.origin.x = v24;
    v59.origin.y = v23;
    v59.size.width = v22;
    v59.size.height = v21;
    objc_msgSend(v12, "addLineToPoint:", v28, CGRectGetMaxY(v59));
    v60.origin.x = v24;
    v60.origin.y = v23;
    v60.size.width = v22;
    v60.size.height = v21;
    CGFloat v29 = CGRectGetMidX(v60) + 25.0 + -6.5 + 1.0;
    v61.origin.x = v24;
    v61.origin.y = v23;
    v61.size.width = v22;
    v61.size.height = v21;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v29, CGRectGetMaxY(v61) + 1.0, 6.5, 0.0, -1.57079633);
    v62.origin.x = v24;
    v62.origin.y = v23;
    v62.size.width = v22;
    v62.size.height = v21;
    CGFloat v30 = CGRectGetMidX(v62) + -25.0 + 6.5 + -1.0;
    v63.origin.x = v24;
    v63.origin.y = v23;
    v63.size.width = v22;
    v63.size.height = v21;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v30, CGRectGetMaxY(v63) + 1.0, 6.5, -1.57079633, -3.14159265);
    v64.origin.x = v24;
    v64.origin.y = v23;
    v64.size.width = v22;
    v64.size.height = v21;
    CGFloat v31 = CGRectGetMidX(v64) + -25.0 + -1.0;
    v65.origin.x = v24;
    v65.origin.y = v23;
    v65.size.width = v22;
    v65.size.height = v21;
    objc_msgSend(v12, "addLineToPoint:", v31, CGRectGetMaxY(v65));
    v66.origin.x = v24;
    v66.origin.y = v23;
    v66.size.width = v22;
    v66.size.height = v21;
    CGFloat v32 = CGRectGetMinX(v66) + 9.0;
    v67.origin.x = v24;
    v67.origin.y = v23;
    v67.size.width = v22;
    v67.size.height = v21;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v32, CGRectGetMaxY(v67) + -9.0, 9.0, 1.57079633, 3.14159265);
    v68.origin.x = v24;
    v68.origin.y = v23;
    v68.size.width = v22;
    v68.size.height = v21;
    double v33 = CGRectGetMinX(v68);
    v69.origin.x = v24;
    v69.origin.y = v23;
    v69.size.width = v22;
    v69.size.height = v21;
    objc_msgSend(v12, "addLineToPoint:", v33, CGRectGetMinY(v69) + 9.0);
  }

  return v12;
}

id ZWResizeGrabberPath(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  id v8 = objc_alloc_init((Class)UIBezierPath);
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.width = a3;
  v19.size.height = a4;
  double MinX = CGRectGetMinX(v19);
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MinX, CGRectGetMinY(v20), 10.0, -3.14159265, 3.14159265);
  [v8 closePath];
  v21.origin.x = a1;
  v21.origin.y = a2;
  v21.size.width = a3;
  v21.size.height = a4;
  double MidX = CGRectGetMidX(v21);
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, CGRectGetMinY(v22), 10.0, -3.14159265, 3.14159265);
  [v8 closePath];
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  double MaxX = CGRectGetMaxX(v23);
  v24.origin.x = a1;
  v24.origin.y = a2;
  v24.size.width = a3;
  v24.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MaxX, CGRectGetMinY(v24), 10.0, -3.14159265, 3.14159265);
  [v8 closePath];
  v25.origin.x = a1;
  v25.origin.y = a2;
  v25.size.width = a3;
  v25.size.height = a4;
  double v12 = CGRectGetMinX(v25);
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v12, CGRectGetMidY(v26), 10.0, -3.14159265, 3.14159265);
  [v8 closePath];
  v27.origin.x = a1;
  v27.origin.y = a2;
  v27.size.width = a3;
  v27.size.height = a4;
  double v13 = CGRectGetMaxX(v27);
  v28.origin.x = a1;
  v28.origin.y = a2;
  v28.size.width = a3;
  v28.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v13, CGRectGetMidY(v28), 10.0, -3.14159265, 3.14159265);
  [v8 closePath];
  v29.origin.x = a1;
  v29.origin.y = a2;
  v29.size.width = a3;
  v29.size.height = a4;
  double v14 = CGRectGetMinX(v29);
  v30.origin.x = a1;
  v30.origin.y = a2;
  v30.size.width = a3;
  v30.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v14, CGRectGetMaxY(v30), 10.0, -3.14159265, 3.14159265);
  [v8 closePath];
  v31.origin.x = a1;
  v31.origin.y = a2;
  v31.size.width = a3;
  v31.size.height = a4;
  double v15 = CGRectGetMidX(v31);
  v32.origin.x = a1;
  v32.origin.y = a2;
  v32.size.width = a3;
  v32.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v15, CGRectGetMaxY(v32), 10.0, -3.14159265, 3.14159265);
  [v8 closePath];
  v33.origin.x = a1;
  v33.origin.y = a2;
  v33.size.width = a3;
  v33.size.height = a4;
  double v16 = CGRectGetMaxX(v33);
  v34.origin.x = a1;
  v34.origin.y = a2;
  v34.size.width = a3;
  v34.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v16, CGRectGetMaxY(v34), 10.0, -3.14159265, 3.14159265);
  [v8 closePath];

  return v8;
}

uint64_t ZWLaserIsEnabled()
{
  if (ZWLaserIsEnabled_onceToken != -1) {
    dispatch_once(&ZWLaserIsEnabled_onceToken, &__block_literal_global_355);
  }
  return ZWLaserIsEnabled__LaserEnabled;
}

void ZWSetTestingScreenSize(double a1, double a2)
{
  TestingScreenSize_0 = *(void *)&a1;
  TestingScreenSize_1 = *(void *)&a2;
}

double ZWGetTestingScreenSize()
{
  return *(double *)&TestingScreenSize_0;
}

void sub_8844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_89D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1290C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)&STACK[0x300]);
  _Unwind_Resume(a1);
}

void sub_13A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_13D20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_15544(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_16170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _appTransitionOccurred(uint64_t a1, void *a2)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(a2, "zoomRootViewControllers", 0);
  v3 = [v2 allValues];

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) handleSubstantialAppTransition];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void sub_229C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v28 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_26EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void _handleAccessibilitySystemServerDied(void *a1)
{
  [a1 _accessibilitySystemServerDied];
}

id _handleAccessibilityRuntimeEvent(uint64_t a1, uint64_t a2, int a3, uint64_t a4, void *a5)
{
  if (a3 == 1044) {
    return [a5 _handleUpdateElementVisualsNotification];
  }
  if (a3 == 1053) {
    return [a5 _handleNativeFocusItemChangedNotification:a4];
  }
  return result;
}

void sub_2F384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v17 - 144));
  _Unwind_Resume(a1);
}

void sub_313C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_3BF20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_3FCCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_3FDF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_3FF1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_40024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_4012C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_4188C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Unwind_Resume(a1);
}

void sub_45FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id LocString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSBundle bundleWithIdentifier:@"com.apple.ZoomTouch.axbundle"];
  v3 = [v2 localizedStringForKey:v1 value:v1 table:@"ZoomStrings"];

  return v3;
}

uint64_t ZOTInitializeUtilities()
{
  uint64_t result = AXDeviceIsPad();
  ZOTIsWildcat = result;
  return result;
}

uint64_t ZOTTimeSinceBoot()
{
  v0 = +[NSDate date];
  [v0 timeIntervalSince1970];
  uint64_t v2 = (uint64_t)v1 - ZOTSystemBootTime();

  return v2;
}

uint64_t ZOTSystemBootTime()
{
  uint64_t result = ZOTSystemBootTime___boottime;
  if (!ZOTSystemBootTime___boottime)
  {
    int v4 = 0;
    v2[1] = 0;
    *(void *)v3 = 0x1500000001;
    size_t v1 = 16;
    v2[0] = 0;
    if (sysctl(v3, 2u, v2, &v1, 0, 0) == -1) {
      uint64_t result = 0;
    }
    else {
      uint64_t result = v2[0];
    }
    ZOTSystemBootTime___boottime = result;
  }
  return result;
}

void ZOTSetUnitTestScaleFactor(double a1)
{
  ZOTUnitTestScaleFactor = *(void *)&a1;
}

double ZOTMainScreenScaleFactor()
{
  double result = *(double *)&ZOTUnitTestScaleFactor;
  if (*(double *)&ZOTUnitTestScaleFactor <= 0.0)
  {
    uint64_t v1 = ZOTTimeSinceBoot();
    double result = 1.0;
    if (v1 >= 60)
    {
      if (ZOTMainScreenScaleFactor_onceToken != -1) {
        dispatch_once(&ZOTMainScreenScaleFactor_onceToken, &__block_literal_global_7);
      }
      return *(double *)&ZOTMainScreenScaleFactor_kZOTMainScreenScaleFactor;
    }
  }
  return result;
}

void ZOTUpdateDeviceOrientation()
{
}

id ZOTEventMeetsOrbThreshold(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 handInfo];
  v3 = [v2 paths];
  int v4 = [v3 firstPath];
  [v4 orbValue];
  double v6 = v5;
  AXForceTouchThresholdPeek();
  if (v7 < v6 && ZOTEventRealFingerCount(v1) == 1 && AXForceTouchAvailableAndEnabled())
  {
    long long v8 = +[AXSettings sharedInstance];
    id v9 = [v8 zoomPeekZoomEnabled];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t ZOTEventRealFingerCount(void *a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = objc_msgSend(a1, "handInfo", 0);
  uint64_t v2 = [v1 paths];

  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) pathIdentity]) {
          ++v5;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

double ZOTFlipDenormalizedPoint(double a1)
{
  return a1;
}

void ZOTDispatchEventThreadWithDelay(void *a1, void *a2, float a3)
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __ZOTDispatchEventThreadWithDelay_block_invoke;
  v9[3] = &unk_79600;
  id v10 = a1;
  id v11 = a2;
  float v12 = a3;
  id v5 = v11;
  id v6 = v10;
  double v7 = objc_retainBlock(v9);
  id v8 = [v7 copy];
  [v6 performSelector:"zotRunBlock:" onThread:v6 withObject:v8 waitUntilDone:0];
}

void __ZOTDispatchEventThreadWithDelay_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) copy];
  [v2 performSelector:"zotRunBlock:" withObject:v3 afterDelay:*(float *)(a1 + 48)];
}

void ZOTDispatchEventThread(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 copy];
  [v3 performSelector:"zotRunBlock:" onThread:v3 withObject:v4 waitUntilDone:0];
}

double ZOTNormalizeValue(double a1)
{
  ZOTMainScreenSize();
  return a1 / v2;
}

double ZOTDenormalizeValue(double a1)
{
  ZOTMainScreenSize();
  return v2 * a1;
}

double ZOTNormalizePoint(double a1)
{
  ZOTMainScreenSize();
  return a1 / v2;
}

double ZOTDenormalizePoint(double a1)
{
  ZOTMainScreenSize();
  return a1 * v2;
}

double ZOTConvertVectorToScreenStandard(uint64_t a1, double a2)
{
  double v2 = 180.0;
  float v3 = a2 * 3.14159265 / 180.0;
  double result = v3 / 0.0174532925;
  switch(a1)
  {
    case 4:
      double v2 = 270.0;
      goto LABEL_7;
    case 3:
      double v2 = 90.0;
      goto LABEL_7;
    case 2:
LABEL_7:
      double result = result + v2;
      break;
  }
  double v5 = 360.0;
  if (result <= 360.0)
  {
    if (result >= 0.0) {
      return result;
    }
  }
  else
  {
    double v5 = -360.0;
  }
  return result + v5;
}

double ZOTAlignDistanceAlongAngle(double result, double a2, double a3)
{
  if (a3 >= 45.0)
  {
    double v3 = 90.0;
    if (a3 < 90.0)
    {
LABEL_3:
      double v4 = (v3 - a3) / 45.0;
      return result * v4;
    }
    double v5 = 135.0;
    if (a3 < 135.0) {
      goto LABEL_5;
    }
    if (a3 >= 180.0 && a3 >= 225.0)
    {
      double v3 = 270.0;
      if (a3 < 270.0) {
        goto LABEL_3;
      }
      double v5 = 315.0;
      if (a3 < 315.0)
      {
LABEL_5:
        double v4 = (v5 - a3) / -45.0 + 1.0;
        return result * v4;
      }
    }
  }
  return result;
}

double ZOTCalculateDistanceForAngle(double a1)
{
  ZOTMainScreenSize();
  double v3 = v2 / ZOTMainScreenScaleFactor();
  if (a1 >= 90.0)
  {
    if (a1 >= 180.0)
    {
      if (a1 >= 270.0) {
        double v4 = -v3;
      }
      else {
        double v4 = v3;
      }
      double v3 = -v3;
    }
    else
    {
      double v4 = v3;
    }
  }
  else
  {
    double v4 = -v3;
  }

  return ZOTAlignDistanceAlongAngle(v4, v3, a1);
}

double ZOTNormalizeVelocity(double a1)
{
  double v1 = 2300.0;
  if (a1 <= 2300.0)
  {
    double v1 = a1;
    if (a1 < 125.0) {
      double v1 = 125.0;
    }
  }
  return v1 / 2175.0;
}

void ZOTDistanceForTimeAndVelocityWithMaxDistance(double a1)
{
}

void ZOTSetGutterDistanceForUnitTests(double a1)
{
  _UnitTestGutterDistance = *(void *)&a1;
}

float ZOTGutterDistance()
{
  uint64_t v0 = _UnitTestGutterDistance;
  if (*(double *)&_UnitTestGutterDistance <= 0.0)
  {
    if (ZOTGutterDistance_onceToken != -1) {
      dispatch_once(&ZOTGutterDistance_onceToken, &__block_literal_global_287);
    }
    uint64_t v0 = ZOTGutterDistance__GutterDistance;
  }
  return *(double *)&v0;
}

double ZOTNotGutterFrame()
{
  if (ZOTNotGutterFrame_onceToken != -1) {
    dispatch_once(&ZOTNotGutterFrame_onceToken, &__block_literal_global_289);
  }
  return *(double *)&ZOTNotGutterFrame_nonGutterFrame_0;
}

uint64_t ZOTShouldStartAutopan(double *a1, BOOL *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14)
{
  BOOL v24 = a5 != 0.0 && a8 > 1.0;
  if (v24 && !*a2)
  {
    double v26 = 0.0;
  }
  else
  {
    SCRCMathGetDistanceBetweenPoints();
    if (!ZOTIsWildcat)
    {
      uint64_t result = 0;
      *a2 = 0;
      return result;
    }
    double v26 = v25;
    BOOL v27 = CGPointZero.x != a6;
    if (CGPointZero.y != a7) {
      BOOL v27 = 1;
    }
    if (v25 <= 0.0700000003) {
      BOOL v27 = 0;
    }
    *a2 = v27;
    if (!v27) {
      return 0;
    }
  }
  int v29 = _AXSVoiceOverTouchEnabled();
  float v30 = ZOTGutterDistance();
  if (v29) {
    float v30 = v30 / 3.0;
  }
  double v31 = v30 / ZOTMainScreenScaleFactor();
  if (a3 >= a11 + v31)
  {
    if (a3 <= a11 + a13 - v31)
    {
      uint64_t v36 = 0;
      double v35 = 0.0;
      goto LABEL_27;
    }
    double v32 = a11 + a13 - a3;
  }
  else
  {
    double v32 = a3 - a11;
  }
  double v33 = ZOTGutterDistance();
  if (ZOTIsWildcat) {
    double v34 = pow(v32 / v33, -1.2) * 1.5 / 10.0;
  }
  else {
    double v34 = (v33 - v32) / v33;
  }
  double v35 = (v34 + 0.0) * ZOTMainScreenScaleFactor() + 0.0;
  uint64_t v36 = 1;
LABEL_27:
  if (a4 >= a12 + v31)
  {
    if (a4 <= a12 + a14 - v31) {
      goto LABEL_35;
    }
    double v37 = a12 + a14 - a4;
  }
  else
  {
    double v37 = a4 - a12;
  }
  double v38 = ZOTGutterDistance();
  if (ZOTIsWildcat) {
    double v39 = pow(v37 / v38, -1.2) * 1.5 / 10.0;
  }
  else {
    double v39 = (v38 - v37) / v38;
  }
  double v35 = v35 + (v39 + 0.0) * ZOTMainScreenScaleFactor();
  ++v36;
LABEL_35:
  if (*a2)
  {
    double v40 = v26 + -0.0700000003;
    if (v26 > 0.899999976) {
      double v40 = 0.819999976;
    }
    long double v41 = pow(v40, 3.0) * 1000.0;
    double v35 = v41 * ZOTMainScreenScaleFactor();
    ++v36;
  }
  else if (!v36)
  {
    uint64_t result = 0;
    double v42 = 0.0;
    goto LABEL_41;
  }
  double v42 = v35 / (double)v36;
  uint64_t result = 1;
LABEL_41:
  *a1 = v42;
  return result;
}

uint64_t ZOTScreenRegionForPoint(int a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double v13 = 0.0;
  if (a1)
  {
    double v14 = ZOTGutterDistance();
    float v15 = v14 / ZOTMainScreenScaleFactor();
    double v13 = v15;
  }
  if (a2 >= a4 + a6 - v13) {
    unsigned int v16 = 2;
  }
  else {
    unsigned int v16 = 0;
  }
  if (a2 > a4 + v13) {
    uint64_t result = v16;
  }
  else {
    uint64_t result = 1;
  }
  if (a3 <= a5 + v13) {
    return result | 4;
  }
  if (a3 >= a5 + a7 - v13) {
    return result | 8;
  }
  return result;
}

uint64_t ZOTScreenRegionForRelativePushPan(uint64_t a1)
{
  SCRCMathGetVectorAndDistanceForPoints();
  switch(a1)
  {
    case 4:
      double v2 = 0.0;
      double v3 = 90.0;
LABEL_8:
      double v2 = v2 + v3;
      goto LABEL_10;
    case 3:
      double v2 = 0.0;
      double v3 = -90.0;
      goto LABEL_8;
    case 2:
      double v2 = 0.0 + -180.0;
      if (0.0 + -180.0 >= 0.0) {
        goto LABEL_10;
      }
      double v3 = 360.0;
      goto LABEL_8;
  }
  double v2 = 0.0;
LABEL_10:
  double v4 = 360.0;
  if (v2 < 0.0)
  {
LABEL_13:
    double v2 = v2 + v4;
    goto LABEL_14;
  }
  if (v2 > 360.0)
  {
    double v4 = -360.0;
    goto LABEL_13;
  }
LABEL_14:
  if (v2 >= 0.0 && v2 <= 90.0)
  {
    if (v2 < 35.0)
    {
      uint64_t result = 4;
LABEL_26:
      BOOL v9 = 1;
      goto LABEL_27;
    }
    BOOL v6 = v2 <= 55.0;
    unsigned int v7 = 6;
    unsigned int v8 = 2;
LABEL_23:
    if (v6) {
      uint64_t result = v7;
    }
    else {
      uint64_t result = v8;
    }
    goto LABEL_26;
  }
  if (v2 <= 90.0 || v2 > 180.0)
  {
    if (v2 <= 180.0 || v2 > 270.0)
    {
      uint64_t result = 0;
      BOOL v9 = 1;
      if (v2 > 270.0 && v2 <= 360.0)
      {
        if (v2 >= 305.0)
        {
          BOOL v6 = v2 <= 325.0;
          unsigned int v7 = 5;
          unsigned int v8 = 4;
          goto LABEL_23;
        }
        BOOL v9 = 1;
        uint64_t result = 1;
      }
    }
    else if (v2 >= 215.0)
    {
      BOOL v9 = v2 > 235.0;
      if (v2 > 235.0) {
        uint64_t result = 1;
      }
      else {
        uint64_t result = 9;
      }
    }
    else
    {
      BOOL v9 = 0;
      uint64_t result = 8;
    }
  }
  else
  {
    if (v2 < 125.0)
    {
      uint64_t result = 2;
      goto LABEL_26;
    }
    BOOL v9 = 0;
    if (v2 <= 145.0) {
      uint64_t result = 10;
    }
    else {
      uint64_t result = 8;
    }
  }
LABEL_27:
  if (ZOTIsWildcat)
  {
    if (a1 == 4)
    {
      if (v9) {
        int v13 = ((result >> 1) | (2 * result)) & 9;
      }
      else {
        int v13 = ((result >> 1) | (2 * result)) & 9 | 4;
      }
      return v13 & 0xFFFFFFFD | (2 * (result & 1));
    }
    else if (a1 != 3)
    {
      int v10 = ((2 * result) | (result >> 2)) & 5;
      if (!v9) {
        v10 |= 2u;
      }
      unsigned int v11 = v10 & 0xFFFFFFF7 | (8 * (result & 1));
      unsigned int v12 = (result >> 1) & 2 | !v9 & 0xFFFFFFF3 | (4 * (result & 3));
      if (a1 == 2) {
        return v12;
      }
      else {
        return v11;
      }
    }
  }
  return result;
}

void sub_49910(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_4C660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_4D04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AXColorizeFormatLog()
{
  return _AXColorizeFormatLog();
}

uint64_t AXDebugDescriptionForAXHandEventType()
{
  return _AXDebugDescriptionForAXHandEventType();
}

uint64_t AXDeviceGetMainScreenScaleFactor()
{
  return _AXDeviceGetMainScreenScaleFactor();
}

uint64_t AXDeviceHasHomeButton()
{
  return _AXDeviceHasHomeButton();
}

uint64_t AXDeviceHasJindo()
{
  return _AXDeviceHasJindo();
}

uint64_t AXDeviceIsPad()
{
  return _AXDeviceIsPad();
}

uint64_t AXDeviceIsPhone()
{
  return _AXDeviceIsPhone();
}

uint64_t AXDeviceIsPhoneIdiom()
{
  return _AXDeviceIsPhoneIdiom();
}

uint64_t AXDeviceIsTV()
{
  return _AXDeviceIsTV();
}

uint64_t AXForceTouchAvailableAndEnabled()
{
  return _AXForceTouchAvailableAndEnabled();
}

uint64_t AXForceTouchThresholdPeek()
{
  return _AXForceTouchThresholdPeek();
}

uint64_t AXInCheckerBoardScenario()
{
  return _AXInCheckerBoardScenario();
}

uint64_t AXInPreboardScenario()
{
  return _AXInPreboardScenario();
}

uint64_t AXIsInternalInstall()
{
  return _AXIsInternalInstall();
}

uint64_t AXLogAssertions()
{
  return _AXLogAssertions();
}

uint64_t AXLoggerForFacility()
{
  return _AXLoggerForFacility();
}

uint64_t AXNormalizePoint()
{
  return _AXNormalizePoint();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return _AXOSLogLevelFromAXLogLevel();
}

AXError AXObserverAddNotification(AXObserverRef observer, AXUIElementRef element, CFStringRef notification, void *refcon)
{
  return _AXObserverAddNotification(observer, element, notification, refcon);
}

AXError AXObserverCreate(pid_t application, AXObserverCallback callback, AXObserverRef *outObserver)
{
  return _AXObserverCreate(application, callback, outObserver);
}

CFRunLoopSourceRef AXObserverGetRunLoopSource(AXObserverRef observer)
{
  return _AXObserverGetRunLoopSource(observer);
}

AXError AXObserverRemoveNotification(AXObserverRef observer, AXUIElementRef element, CFStringRef notification)
{
  return _AXObserverRemoveNotification(observer, element, notification);
}

uint64_t AXOverrideRequestingClientType()
{
  return _AXOverrideRequestingClientType();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return _AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t AXPerformBlockOnMainThread()
{
  return _AXPerformBlockOnMainThread();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return _AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t AXPerformBlockSynchronouslyOnMainThread()
{
  return _AXPerformBlockSynchronouslyOnMainThread();
}

uint64_t AXUIConvertRectFromContextToScreenSpace()
{
  return _AXUIConvertRectFromContextToScreenSpace();
}

AXError AXUIElementGetPid(AXUIElementRef element, pid_t *pid)
{
  return _AXUIElementGetPid(element, pid);
}

CFTypeID AXUIElementGetTypeID(void)
{
  return _AXUIElementGetTypeID();
}

uint64_t AXUIElementRegisterSystemWideServerDeathCallback()
{
  return _AXUIElementRegisterSystemWideServerDeathCallback();
}

uint64_t AXUILocalizedTitleForDockPosition()
{
  return _AXUILocalizedTitleForDockPosition();
}

uint64_t AXUILocalizedTitleForZoomLensEffect()
{
  return _AXUILocalizedTitleForZoomLensEffect();
}

uint64_t AXUILocalizedTitleForZoomLensMode()
{
  return _AXUILocalizedTitleForZoomLensMode();
}

uint64_t AXUIZoomControllerColor()
{
  return _AXUIZoomControllerColor();
}

uint64_t AXZoomAllLensEffects()
{
  return _AXZoomAllLensEffects();
}

uint64_t AXZoomDockPositions()
{
  return _AXZoomDockPositions();
}

uint64_t AXZoomLensDefault()
{
  return _AXZoomLensDefault();
}

uint64_t AXZoomUserSelectableLensModes()
{
  return _AXZoomUserSelectableLensModes();
}

uint64_t AX_CGRectBySubtractingRect()
{
  return _AX_CGRectBySubtractingRect();
}

uint64_t AX_CGRectGetCenter()
{
  return _AX_CGRectGetCenter();
}

void AudioServicesPlaySystemSound(SystemSoundID inSystemSoundID)
{
}

uint64_t BKSHIDServicesCancelTouchesOnMainDisplay()
{
  return _BKSHIDServicesCancelTouchesOnMainDisplay();
}

uint64_t BKSHIDServicesExcludeCAContextsFromHitTestingForZoomSenders()
{
  return _BKSHIDServicesExcludeCAContextsFromHitTestingForZoomSenders();
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return _CATransform3DMakeAffineTransform(retstr, m);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return _CATransform3DMakeTranslation(retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DScale(retstr, t, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return _CATransform3DTranslate(retstr, t, tx, ty, tz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return _CGAffineTransformRotate(retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
}

BOOL CGPathEqualToPath(CGPathRef path1, CGPathRef path2)
{
  return _CGPathEqualToPath(path1, path2);
}

CGPoint CGPointFromString(NSString *string)
{
  CGPoint v3 = _CGPointFromString(string);
  double y = v3.y;
  double x = v3.x;
  result.double y = y;
  result.double x = x;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectContainsRect(rect1, rect2);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

uint64_t IOHIDEventGetSenderID()
{
  return _IOHIDEventGetSenderID();
}

uint64_t IOHIDEventSetTimeStamp()
{
  return _IOHIDEventSetTimeStamp();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSRect NSRectFromString(NSString *aString)
{
  return _NSRectFromString(aString);
}

uint64_t NSRequestConcreteImplementation()
{
  return _NSRequestConcreteImplementation();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return _NSStringFromPoint(aPoint);
}

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

uint64_t SBSSystemApertureRootWindowRequestPortalSource()
{
  return _SBSSystemApertureRootWindowRequestPortalSource();
}

uint64_t SCRCMathClearAverage()
{
  return _SCRCMathClearAverage();
}

uint64_t SCRCMathGetAverage()
{
  return _SCRCMathGetAverage();
}

uint64_t SCRCMathGetDistanceBetweenPoints()
{
  return _SCRCMathGetDistanceBetweenPoints();
}

uint64_t SCRCMathGetVectorAndDistanceForPoints()
{
  return _SCRCMathGetVectorAndDistanceForPoints();
}

uint64_t SCRCMathUpdateAverage()
{
  return _SCRCMathUpdateAverage();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  return _UIAccessibilityConvertFrameToScreenCoordinates(rect, view);
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return _UIAccessibilityIsBoldTextEnabled();
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return _UIAccessibilityIsInvertColorsEnabled();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return _UIAccessibilityIsReduceMotionEnabled();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return _UIAccessibilityIsReduceTransparencyEnabled();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UIRectInset()
{
  return _UIRectInset();
}

uint64_t ZOOMLogCommon()
{
  return _ZOOMLogCommon();
}

uint64_t ZOOMLogEvents()
{
  return _ZOOMLogEvents();
}

uint64_t ZOTDeviceRotation()
{
  return _ZOTDeviceRotation();
}

uint64_t ZOTMainScreenSize()
{
  return _ZOTMainScreenSize();
}

uint64_t _AXAssert()
{
  return __AXAssert();
}

uint64_t _AXAssertIsMainThread()
{
  return __AXAssertIsMainThread();
}

uint64_t _AXLogWithFacility()
{
  return __AXLogWithFacility();
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return __AXSApplicationAccessibilityEnabled();
}

uint64_t _AXSApplicationAccessibilitySetEnabled()
{
  return __AXSApplicationAccessibilitySetEnabled();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return __AXSAssistiveTouchScannerEnabled();
}

uint64_t _AXSCanDisableApplicationAccessibility()
{
  return __AXSCanDisableApplicationAccessibility();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return __AXSFullKeyboardAccessEnabled();
}

uint64_t _AXSKeyRepeatDelay()
{
  return __AXSKeyRepeatDelay();
}

uint64_t _AXSKeyRepeatEnabled()
{
  return __AXSKeyRepeatEnabled();
}

uint64_t _AXSKeyRepeatInterval()
{
  return __AXSKeyRepeatInterval();
}

uint64_t _AXSPointerScaleWithZoomLevelEnabled()
{
  return __AXSPointerScaleWithZoomLevelEnabled();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return __AXSVoiceOverTouchEnabled();
}

uint64_t _AXSZoomSpeakUnderFingerEnabled()
{
  return __AXSZoomSpeakUnderFingerEnabled();
}

uint64_t _AXSZoomTouchEnabled()
{
  return __AXSZoomTouchEnabled();
}

uint64_t _AXSZoomTouchSetToggledByPreferenceSwitch()
{
  return __AXSZoomTouchSetToggledByPreferenceSwitch();
}

uint64_t _AXSZoomTouchToggledByPreferenceSwitch()
{
  return __AXSZoomTouchToggledByPreferenceSwitch();
}

uint64_t _AXStringForArgs()
{
  return __AXStringForArgs();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

long double atan2(long double __y, long double __x)
{
  return _atan2(__y, __x);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

long double exp(long double __x)
{
  return _exp(__x);
}

long double log(long double __x)
{
  return _log(__x);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return [a1 CGPointValue];
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return [a1 CGRectValue];
}

id objc_msgSend_HIDEventReceiveThread(void *a1, const char *a2, ...)
{
  return [a1 HIDEventReceiveThread];
}

id objc_msgSend_HIDTime(void *a1, const char *a2, ...)
{
  return [a1 HIDTime];
}

id objc_msgSend_ThreeFingerDoubleTap(void *a1, const char *a2, ...)
{
  return [a1 ThreeFingerDoubleTap];
}

id objc_msgSend_ThreeFingerFlickDown(void *a1, const char *a2, ...)
{
  return [a1 ThreeFingerFlickDown];
}

id objc_msgSend_ThreeFingerFlickLeft(void *a1, const char *a2, ...)
{
  return [a1 ThreeFingerFlickLeft];
}

id objc_msgSend_ThreeFingerFlickRight(void *a1, const char *a2, ...)
{
  return [a1 ThreeFingerFlickRight];
}

id objc_msgSend_ThreeFingerFlickUp(void *a1, const char *a2, ...)
{
  return [a1 ThreeFingerFlickUp];
}

id objc_msgSend_ThreeFingerQuadrupleTap(void *a1, const char *a2, ...)
{
  return [a1 ThreeFingerQuadrupleTap];
}

id objc_msgSend_ThreeFingerSingleTap(void *a1, const char *a2, ...)
{
  return [a1 ThreeFingerSingleTap];
}

id objc_msgSend_ThreeFingerTripleTap(void *a1, const char *a2, ...)
{
  return [a1 ThreeFingerTripleTap];
}

id objc_msgSend__accessibilityRuntimeNotifications(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityRuntimeNotifications];
}

id objc_msgSend__accessibilitySystemServerDied(void *a1, const char *a2, ...)
{
  return [a1 _accessibilitySystemServerDied];
}

id objc_msgSend__addFingerInformation(void *a1, const char *a2, ...)
{
  return [a1 _addFingerInformation];
}

id objc_msgSend__allowsFingerDistanceToAffectZoom(void *a1, const char *a2, ...)
{
  return [a1 _allowsFingerDistanceToAffectZoom];
}

id objc_msgSend__applyInitialLayoutConstraints(void *a1, const char *a2, ...)
{
  return [a1 _applyInitialLayoutConstraints];
}

id objc_msgSend__applyTitleLabelColor(void *a1, const char *a2, ...)
{
  return [a1 _applyTitleLabelColor];
}

id objc_msgSend__beginAutomovingZoomLens(void *a1, const char *a2, ...)
{
  return [a1 _beginAutomovingZoomLens];
}

id objc_msgSend__clearState(void *a1, const char *a2, ...)
{
  return [a1 _clearState];
}

id objc_msgSend__collapseNonactiveGrabbers(void *a1, const char *a2, ...)
{
  return [a1 _collapseNonactiveGrabbers];
}

id objc_msgSend__contextId(void *a1, const char *a2, ...)
{
  return [a1 _contextId];
}

id objc_msgSend__cornerRadiusForExpandedRing(void *a1, const char *a2, ...)
{
  return [a1 _cornerRadiusForExpandedRing];
}

id objc_msgSend__determineSuitableLensFrame(void *a1, const char *a2, ...)
{
  return [a1 _determineSuitableLensFrame];
}

id objc_msgSend__didBeginInteractingWithSlug(void *a1, const char *a2, ...)
{
  return [a1 _didBeginInteractingWithSlug];
}

id objc_msgSend__didFinishInteractingWithSlug(void *a1, const char *a2, ...)
{
  return [a1 _didFinishInteractingWithSlug];
}

id objc_msgSend__dimAfterDelay(void *a1, const char *a2, ...)
{
  return [a1 _dimAfterDelay];
}

id objc_msgSend__disableZoomWindowHitTesting(void *a1, const char *a2, ...)
{
  return [a1 _disableZoomWindowHitTesting];
}

id objc_msgSend__elementForFocus(void *a1, const char *a2, ...)
{
  return [a1 _elementForFocus];
}

id objc_msgSend__enableSmartZoomIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _enableSmartZoomIfNeeded];
}

id objc_msgSend__enableZoomWindowHitTesting(void *a1, const char *a2, ...)
{
  return [a1 _enableZoomWindowHitTesting];
}

id objc_msgSend__endAutomovingZoomLens(void *a1, const char *a2, ...)
{
  return [a1 _endAutomovingZoomLens];
}

id objc_msgSend__eventPostTimerCallback(void *a1, const char *a2, ...)
{
  return [a1 _eventPostTimerCallback];
}

id objc_msgSend__exitStandbyIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _exitStandbyIfNecessary];
}

id objc_msgSend__grabberEtchPathForCurrentEdge(void *a1, const char *a2, ...)
{
  return [a1 _grabberEtchPathForCurrentEdge];
}

id objc_msgSend__graphicsQuality(void *a1, const char *a2, ...)
{
  return [a1 _graphicsQuality];
}

id objc_msgSend__handleUpdateElementVisualsNotification(void *a1, const char *a2, ...)
{
  return [a1 _handleUpdateElementVisualsNotification];
}

id objc_msgSend__inSpeakUnderFingerMode(void *a1, const char *a2, ...)
{
  return [a1 _inSpeakUnderFingerMode];
}

id objc_msgSend__initializeAccessibility(void *a1, const char *a2, ...)
{
  return [a1 _initializeAccessibility];
}

id objc_msgSend__initializeZoomSettingsIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _initializeZoomSettingsIfNeeded];
}

id objc_msgSend__isZoomedToMinimum(void *a1, const char *a2, ...)
{
  return [a1 _isZoomedToMinimum];
}

id objc_msgSend__lensDefaultSize(void *a1, const char *a2, ...)
{
  return [a1 _lensDefaultSize];
}

id objc_msgSend__lensDragMultiplier(void *a1, const char *a2, ...)
{
  return [a1 _lensDragMultiplier];
}

id objc_msgSend__lensMaximumSize(void *a1, const char *a2, ...)
{
  return [a1 _lensMaximumSize];
}

id objc_msgSend__lensMinimumSize(void *a1, const char *a2, ...)
{
  return [a1 _lensMinimumSize];
}

id objc_msgSend__loadZoomTouchExtras(void *a1, const char *a2, ...)
{
  return [a1 _loadZoomTouchExtras];
}

id objc_msgSend__maxDockHeight(void *a1, const char *a2, ...)
{
  return [a1 _maxDockHeight];
}

id objc_msgSend__maxDockWidth(void *a1, const char *a2, ...)
{
  return [a1 _maxDockWidth];
}

id objc_msgSend__menuDidDisappear(void *a1, const char *a2, ...)
{
  return [a1 _menuDidDisappear];
}

id objc_msgSend__menuOptionArray(void *a1, const char *a2, ...)
{
  return [a1 _menuOptionArray];
}

id objc_msgSend__minimumZoomIndistinguishableFromStandbyMode(void *a1, const char *a2, ...)
{
  return [a1 _minimumZoomIndistinguishableFromStandbyMode];
}

id objc_msgSend__panBackwardOnMainDisplay(void *a1, const char *a2, ...)
{
  return [a1 _panBackwardOnMainDisplay];
}

id objc_msgSend__panForwardOnMainDisplay(void *a1, const char *a2, ...)
{
  return [a1 _panForwardOnMainDisplay];
}

id objc_msgSend__panGestureIsRecognizing(void *a1, const char *a2, ...)
{
  return [a1 _panGestureIsRecognizing];
}

id objc_msgSend__pipLensIsNearBottomOfScreen(void *a1, const char *a2, ...)
{
  return [a1 _pipLensIsNearBottomOfScreen];
}

id objc_msgSend__pipLensIsNearRightOfScreen(void *a1, const char *a2, ...)
{
  return [a1 _pipLensIsNearRightOfScreen];
}

id objc_msgSend__pipLensIsNearTopOfScreen(void *a1, const char *a2, ...)
{
  return [a1 _pipLensIsNearTopOfScreen];
}

id objc_msgSend__prepareToHandleZoomLevelAdjustmentViaGesture(void *a1, const char *a2, ...)
{
  return [a1 _prepareToHandleZoomLevelAdjustmentViaGesture];
}

id objc_msgSend__registerForAccessibilityRuntimeNotifications(void *a1, const char *a2, ...)
{
  return [a1 _registerForAccessibilityRuntimeNotifications];
}

id objc_msgSend__reloadMenuOptions(void *a1, const char *a2, ...)
{
  return [a1 _reloadMenuOptions];
}

id objc_msgSend__reloadTableData(void *a1, const char *a2, ...)
{
  return [a1 _reloadTableData];
}

id objc_msgSend__removeAllSystemGestureDisablingAssertions(void *a1, const char *a2, ...)
{
  return [a1 _removeAllSystemGestureDisablingAssertions];
}

id objc_msgSend__removeFullscreenSystemGestureDisablingAssertions(void *a1, const char *a2, ...)
{
  return [a1 _removeFullscreenSystemGestureDisablingAssertions];
}

id objc_msgSend__removeHomeGestureDisablingAssertion(void *a1, const char *a2, ...)
{
  return [a1 _removeHomeGestureDisablingAssertion];
}

id objc_msgSend__removePIPSystemGestureDisablingAssertions(void *a1, const char *a2, ...)
{
  return [a1 _removePIPSystemGestureDisablingAssertions];
}

id objc_msgSend__rezoomDueToAppTransitionIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _rezoomDueToAppTransitionIfNeeded];
}

id objc_msgSend__rezoomDueToDockIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _rezoomDueToDockIfNeeded];
}

id objc_msgSend__sceneIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _sceneIdentifier];
}

id objc_msgSend__scheduleTapTimeout(void *a1, const char *a2, ...)
{
  return [a1 _scheduleTapTimeout];
}

id objc_msgSend__scheduleTrackpadTapTimeout(void *a1, const char *a2, ...)
{
  return [a1 _scheduleTrackpadTapTimeout];
}

id objc_msgSend__screenSizeForCurrentOrientation(void *a1, const char *a2, ...)
{
  return [a1 _screenSizeForCurrentOrientation];
}

id objc_msgSend__setBackgroundStyleWithInvertColors(void *a1, const char *a2, ...)
{
  return [a1 _setBackgroundStyleWithInvertColors];
}

id objc_msgSend__setupZoomGreyObservers(void *a1, const char *a2, ...)
{
  return [a1 _setupZoomGreyObservers];
}

id objc_msgSend__shouldBlockShowControlCenterGesture(void *a1, const char *a2, ...)
{
  return [a1 _shouldBlockShowControlCenterGesture];
}

id objc_msgSend__shouldBlockShowNotificationGesture(void *a1, const char *a2, ...)
{
  return [a1 _shouldBlockShowNotificationGesture];
}

id objc_msgSend__shouldDisableLensEffectsForStandbyMode(void *a1, const char *a2, ...)
{
  return [a1 _shouldDisableLensEffectsForStandbyMode];
}

id objc_msgSend__shouldReverseLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 _shouldReverseLayoutDirection];
}

id objc_msgSend__shouldRoundLensCorners(void *a1, const char *a2, ...)
{
  return [a1 _shouldRoundLensCorners];
}

id objc_msgSend__shouldShowZoomAlert(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowZoomAlert];
}

id objc_msgSend__showingOrHidingControllerWillBegin(void *a1, const char *a2, ...)
{
  return [a1 _showingOrHidingControllerWillBegin];
}

id objc_msgSend__showingOrHidingControllerWillEnd(void *a1, const char *a2, ...)
{
  return [a1 _showingOrHidingControllerWillEnd];
}

id objc_msgSend__slugNormalizedPositionForCurrentPosition(void *a1, const char *a2, ...)
{
  return [a1 _slugNormalizedPositionForCurrentPosition];
}

id objc_msgSend__smartZoomFocusedElementIsBeingSampled(void *a1, const char *a2, ...)
{
  return [a1 _smartZoomFocusedElementIsBeingSampled];
}

id objc_msgSend__speakFocusedElement(void *a1, const char *a2, ...)
{
  return [a1 _speakFocusedElement];
}

id objc_msgSend__toggleStealingSingleFingerPanning(void *a1, const char *a2, ...)
{
  return [a1 _toggleStealingSingleFingerPanning];
}

id objc_msgSend__toggleZoomOnMainDisplay(void *a1, const char *a2, ...)
{
  return [a1 _toggleZoomOnMainDisplay];
}

id objc_msgSend__toggleZoomStandby(void *a1, const char *a2, ...)
{
  return [a1 _toggleZoomStandby];
}

id objc_msgSend__unregisterForAccessibilityRuntimeNotifications(void *a1, const char *a2, ...)
{
  return [a1 _unregisterForAccessibilityRuntimeNotifications];
}

id objc_msgSend__unzoomDueToAppTransitionIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _unzoomDueToAppTransitionIfNeeded];
}

id objc_msgSend__updateAccessibilityHint(void *a1, const char *a2, ...)
{
  return [a1 _updateAccessibilityHint];
}

id objc_msgSend__updateControllerColor(void *a1, const char *a2, ...)
{
  return [a1 _updateControllerColor];
}

id objc_msgSend__updateControllerThickness(void *a1, const char *a2, ...)
{
  return [a1 _updateControllerThickness];
}

id objc_msgSend__updateEventUIContextForSpeakFingerStateChange(void *a1, const char *a2, ...)
{
  return [a1 _updateEventUIContextForSpeakFingerStateChange];
}

id objc_msgSend__updateGestures(void *a1, const char *a2, ...)
{
  return [a1 _updateGestures];
}

id objc_msgSend__updateLensLayout(void *a1, const char *a2, ...)
{
  return [a1 _updateLensLayout];
}

id objc_msgSend__updateMinimapStatus(void *a1, const char *a2, ...)
{
  return [a1 _updateMinimapStatus];
}

id objc_msgSend__updateSliderPosition(void *a1, const char *a2, ...)
{
  return [a1 _updateSliderPosition];
}

id objc_msgSend__updateSystemGestureDisablingAssertions(void *a1, const char *a2, ...)
{
  return [a1 _updateSystemGestureDisablingAssertions];
}

id objc_msgSend__updateSystemGestureDisablingAssertionsForFullscreenZoom(void *a1, const char *a2, ...)
{
  return [a1 _updateSystemGestureDisablingAssertionsForFullscreenZoom];
}

id objc_msgSend__updateSystemGestureDisablingAssertionsForPipLensPosition(void *a1, const char *a2, ...)
{
  return [a1 _updateSystemGestureDisablingAssertionsForPipLensPosition];
}

id objc_msgSend__updateZoomHandGesturesActionCustomizations(void *a1, const char *a2, ...)
{
  return [a1 _updateZoomHandGesturesActionCustomizations];
}

id objc_msgSend__updateZoomListeners(void *a1, const char *a2, ...)
{
  return [a1 _updateZoomListeners];
}

id objc_msgSend__updateZoomRegionPositionAndSize(void *a1, const char *a2, ...)
{
  return [a1 _updateZoomRegionPositionAndSize];
}

id objc_msgSend__watchUIInverted(void *a1, const char *a2, ...)
{
  return [a1 _watchUIInverted];
}

id objc_msgSend__zoomLevelMultiplier(void *a1, const char *a2, ...)
{
  return [a1 _zoomLevelMultiplier];
}

id objc_msgSend__zoomRegionOnDockReplicatorEdge(void *a1, const char *a2, ...)
{
  return [a1 _zoomRegionOnDockReplicatorEdge];
}

id objc_msgSend__zoomSenderIdentifierData(void *a1, const char *a2, ...)
{
  return [a1 _zoomSenderIdentifierData];
}

id objc_msgSend_accessibilityData(void *a1, const char *a2, ...)
{
  return [a1 accessibilityData];
}

id objc_msgSend_accessibilityRuntimeObserver(void *a1, const char *a2, ...)
{
  return [a1 accessibilityRuntimeObserver];
}

id objc_msgSend_activeApplicationOrientation(void *a1, const char *a2, ...)
{
  return [a1 activeApplicationOrientation];
}

id objc_msgSend_activeGrabber(void *a1, const char *a2, ...)
{
  return [a1 activeGrabber];
}

id objc_msgSend_activeLensViewController(void *a1, const char *a2, ...)
{
  return [a1 activeLensViewController];
}

id objc_msgSend_activeResizeHandle(void *a1, const char *a2, ...)
{
  return [a1 activeResizeHandle];
}

id objc_msgSend_activeZoomMode(void *a1, const char *a2, ...)
{
  return [a1 activeZoomMode];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowsZoomOrb(void *a1, const char *a2, ...)
{
  return [a1 allowsZoomOrb];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return [a1 alpha];
}

id objc_msgSend_altitude(void *a1, const char *a2, ...)
{
  return [a1 altitude];
}

id objc_msgSend_anyFingerDown(void *a1, const char *a2, ...)
{
  return [a1 anyFingerDown];
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return [a1 appearance];
}

id objc_msgSend_application(void *a1, const char *a2, ...)
{
  return [a1 application];
}

id objc_msgSend_applyAccessibilityDataToCreatorHIDEvent(void *a1, const char *a2, ...)
{
  return [a1 applyAccessibilityDataToCreatorHIDEvent];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_averageLocation(void *a1, const char *a2, ...)
{
  return [a1 averageLocation];
}

id objc_msgSend_axElement(void *a1, const char *a2, ...)
{
  return [a1 axElement];
}

id objc_msgSend_axuiService(void *a1, const char *a2, ...)
{
  return [a1 axuiService];
}

id objc_msgSend_azimuth(void *a1, const char *a2, ...)
{
  return [a1 azimuth];
}

id objc_msgSend_backdropGrabberMaskLayer(void *a1, const char *a2, ...)
{
  return [a1 backdropGrabberMaskLayer];
}

id objc_msgSend_backdropLayer(void *a1, const char *a2, ...)
{
  return [a1 backdropLayer];
}

id objc_msgSend_backdropMaskShapeLayer(void *a1, const char *a2, ...)
{
  return [a1 backdropMaskShapeLayer];
}

id objc_msgSend_backdropRect(void *a1, const char *a2, ...)
{
  return [a1 backdropRect];
}

id objc_msgSend_backdropResizingMaskLayer(void *a1, const char *a2, ...)
{
  return [a1 backdropResizingMaskLayer];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return [a1 bezierPath];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bottomChromeGrabberDragConstraint(void *a1, const char *a2, ...)
{
  return [a1 bottomChromeGrabberDragConstraint];
}

id objc_msgSend_bottomChromeGrabberView(void *a1, const char *a2, ...)
{
  return [a1 bottomChromeGrabberView];
}

id objc_msgSend_bottomTriangleRadiusDistanceConstraint(void *a1, const char *a2, ...)
{
  return [a1 bottomTriangleRadiusDistanceConstraint];
}

id objc_msgSend_bottomTriangleView(void *a1, const char *a2, ...)
{
  return [a1 bottomTriangleView];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_brailleInputUIIsShowing(void *a1, const char *a2, ...)
{
  return [a1 brailleInputUIIsShowing];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_buttonView(void *a1, const char *a2, ...)
{
  return [a1 buttonView];
}

id objc_msgSend_cachedValuesSerialQueue(void *a1, const char *a2, ...)
{
  return [a1 cachedValuesSerialQueue];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_carouselLockActive(void *a1, const char *a2, ...)
{
  return [a1 carouselLockActive];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_chordChanged(void *a1, const char *a2, ...)
{
  return [a1 chordChanged];
}

id objc_msgSend_chromeInnerBorderLayer(void *a1, const char *a2, ...)
{
  return [a1 chromeInnerBorderLayer];
}

id objc_msgSend_chromeOuterBorderLayer(void *a1, const char *a2, ...)
{
  return [a1 chromeOuterBorderLayer];
}

id objc_msgSend_circleLayer(void *a1, const char *a2, ...)
{
  return [a1 circleLayer];
}

id objc_msgSend_circlePivotHeightConstraint(void *a1, const char *a2, ...)
{
  return [a1 circlePivotHeightConstraint];
}

id objc_msgSend_circlePivotOffsetXConstraint(void *a1, const char *a2, ...)
{
  return [a1 circlePivotOffsetXConstraint];
}

id objc_msgSend_circlePivotOffsetYConstraint(void *a1, const char *a2, ...)
{
  return [a1 circlePivotOffsetYConstraint];
}

id objc_msgSend_circlePivotWidthConstraint(void *a1, const char *a2, ...)
{
  return [a1 circlePivotWidthConstraint];
}

id objc_msgSend_circlePivotingView(void *a1, const char *a2, ...)
{
  return [a1 circlePivotingView];
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return [a1 cleanup];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_closePath(void *a1, const char *a2, ...)
{
  return [a1 closePath];
}

id objc_msgSend_collapsingRingHeightConstraint(void *a1, const char *a2, ...)
{
  return [a1 collapsingRingHeightConstraint];
}

id objc_msgSend_collapsingRingWidthConstraint(void *a1, const char *a2, ...)
{
  return [a1 collapsingRingWidthConstraint];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return [a1 constant];
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return [a1 containerView];
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return [a1 contentOffset];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return [a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_contextId(void *a1, const char *a2, ...)
{
  return [a1 contextId];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_cornerRadius(void *a1, const char *a2, ...)
{
  return [a1 cornerRadius];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_creatorHIDEvent(void *a1, const char *a2, ...)
{
  return [a1 creatorHIDEvent];
}

id objc_msgSend_currentAlertID(void *a1, const char *a2, ...)
{
  return [a1 currentAlertID];
}

id objc_msgSend_currentApplications(void *a1, const char *a2, ...)
{
  return [a1 currentApplications];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_darkGrayColor(void *a1, const char *a2, ...)
{
  return [a1 darkGrayColor];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return [a1 dataSource];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_deactivatedAppIDs(void *a1, const char *a2, ...)
{
  return [a1 deactivatedAppIDs];
}

id objc_msgSend_debugFocusView(void *a1, const char *a2, ...)
{
  return [a1 debugFocusView];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultEventProcessor(void *a1, const char *a2, ...)
{
  return [a1 defaultEventProcessor];
}

id objc_msgSend_defaultTickLayer(void *a1, const char *a2, ...)
{
  return [a1 defaultTickLayer];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deltaFromInitialTouch(void *a1, const char *a2, ...)
{
  return [a1 deltaFromInitialTouch];
}

id objc_msgSend_deltaFromLastPanEvent(void *a1, const char *a2, ...)
{
  return [a1 deltaFromLastPanEvent];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifier];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didEndAnimation(void *a1, const char *a2, ...)
{
  return [a1 didEndAnimation];
}

id objc_msgSend_didStartAnimation(void *a1, const char *a2, ...)
{
  return [a1 didStartAnimation];
}

id objc_msgSend_dimTimer(void *a1, const char *a2, ...)
{
  return [a1 dimTimer];
}

id objc_msgSend_disableControlCenterAssertionFullscreenLens(void *a1, const char *a2, ...)
{
  return [a1 disableControlCenterAssertionFullscreenLens];
}

id objc_msgSend_disableControlCenterAssertionPIPLens(void *a1, const char *a2, ...)
{
  return [a1 disableControlCenterAssertionPIPLens];
}

id objc_msgSend_disableHomeGestureAssertion(void *a1, const char *a2, ...)
{
  return [a1 disableHomeGestureAssertion];
}

id objc_msgSend_disableNotificationCenterAssertionFullscreenLens(void *a1, const char *a2, ...)
{
  return [a1 disableNotificationCenterAssertionFullscreenLens];
}

id objc_msgSend_disableNotificationCenterAssertionPIPLens(void *a1, const char *a2, ...)
{
  return [a1 disableNotificationCenterAssertionPIPLens];
}

id objc_msgSend_disableSmartZoom(void *a1, const char *a2, ...)
{
  return [a1 disableSmartZoom];
}

id objc_msgSend_dispatchEntireEventQueue(void *a1, const char *a2, ...)
{
  return [a1 dispatchEntireEventQueue];
}

id objc_msgSend_displayConfiguration(void *a1, const char *a2, ...)
{
  return [a1 displayConfiguration];
}

id objc_msgSend_displayCornerRadius(void *a1, const char *a2, ...)
{
  return [a1 displayCornerRadius];
}

id objc_msgSend_displayID(void *a1, const char *a2, ...)
{
  return [a1 displayID];
}

id objc_msgSend_displayIdentity(void *a1, const char *a2, ...)
{
  return [a1 displayIdentity];
}

id objc_msgSend_displayLinkTimer(void *a1, const char *a2, ...)
{
  return [a1 displayLinkTimer];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_dockBackdropLayer(void *a1, const char *a2, ...)
{
  return [a1 dockBackdropLayer];
}

id objc_msgSend_dockPosition(void *a1, const char *a2, ...)
{
  return [a1 dockPosition];
}

id objc_msgSend_dockPositionIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 dockPositionIdentifiers];
}

id objc_msgSend_dockPositionIsTransitioning(void *a1, const char *a2, ...)
{
  return [a1 dockPositionIsTransitioning];
}

id objc_msgSend_dockReplicatorLayer(void *a1, const char *a2, ...)
{
  return [a1 dockReplicatorLayer];
}

id objc_msgSend_dockReplicatorView(void *a1, const char *a2, ...)
{
  return [a1 dockReplicatorView];
}

id objc_msgSend_dockShift(void *a1, const char *a2, ...)
{
  return [a1 dockShift];
}

id objc_msgSend_dockSize(void *a1, const char *a2, ...)
{
  return [a1 dockSize];
}

id objc_msgSend_dockSizeUpdateTimer(void *a1, const char *a2, ...)
{
  return [a1 dockSizeUpdateTimer];
}

id objc_msgSend_dockedBorderView(void *a1, const char *a2, ...)
{
  return [a1 dockedBorderView];
}

id objc_msgSend_dockedDelegate(void *a1, const char *a2, ...)
{
  return [a1 dockedDelegate];
}

id objc_msgSend_dockedLensView(void *a1, const char *a2, ...)
{
  return [a1 dockedLensView];
}

id objc_msgSend_dockedLensViewController(void *a1, const char *a2, ...)
{
  return [a1 dockedLensViewController];
}

id objc_msgSend_dockedViewBottomConstraint(void *a1, const char *a2, ...)
{
  return [a1 dockedViewBottomConstraint];
}

id objc_msgSend_dockedViewLeftConstraint(void *a1, const char *a2, ...)
{
  return [a1 dockedViewLeftConstraint];
}

id objc_msgSend_dockedViewRightConstraint(void *a1, const char *a2, ...)
{
  return [a1 dockedViewRightConstraint];
}

id objc_msgSend_dockedViewTopConstraint(void *a1, const char *a2, ...)
{
  return [a1 dockedViewTopConstraint];
}

id objc_msgSend_doubleTapGesture(void *a1, const char *a2, ...)
{
  return [a1 doubleTapGesture];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dummyScrollView(void *a1, const char *a2, ...)
{
  return [a1 dummyScrollView];
}

id objc_msgSend_dummyScrollViewContentSize(void *a1, const char *a2, ...)
{
  return [a1 dummyScrollViewContentSize];
}

id objc_msgSend_dummyScrollViewDefaultOffset(void *a1, const char *a2, ...)
{
  return [a1 dummyScrollViewDefaultOffset];
}

id objc_msgSend_dummyScrollViewOffsetForSlug(void *a1, const char *a2, ...)
{
  return [a1 dummyScrollViewOffsetForSlug];
}

id objc_msgSend_dummyScrollViewPanGestureRecognizer(void *a1, const char *a2, ...)
{
  return [a1 dummyScrollViewPanGestureRecognizer];
}

id objc_msgSend_effectBackdropLayer(void *a1, const char *a2, ...)
{
  return [a1 effectBackdropLayer];
}

id objc_msgSend_effectReplicatorLayer(void *a1, const char *a2, ...)
{
  return [a1 effectReplicatorLayer];
}

id objc_msgSend_effectView(void *a1, const char *a2, ...)
{
  return [a1 effectView];
}

id objc_msgSend_effectiveZoomViewFrame(void *a1, const char *a2, ...)
{
  return [a1 effectiveZoomViewFrame];
}

id objc_msgSend_enableNaturalScrolling(void *a1, const char *a2, ...)
{
  return [a1 enableNaturalScrolling];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_etchLayer(void *a1, const char *a2, ...)
{
  return [a1 etchLayer];
}

id objc_msgSend_eventDelegate(void *a1, const char *a2, ...)
{
  return [a1 eventDelegate];
}

id objc_msgSend_eventManager(void *a1, const char *a2, ...)
{
  return [a1 eventManager];
}

id objc_msgSend_eventSenderIdentifier(void *a1, const char *a2, ...)
{
  return [a1 eventSenderIdentifier];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_explorerElements(void *a1, const char *a2, ...)
{
  return [a1 explorerElements];
}

id objc_msgSend_externalDisplayDelegates(void *a1, const char *a2, ...)
{
  return [a1 externalDisplayDelegates];
}

id objc_msgSend_externalDisplayZoomDelegates(void *a1, const char *a2, ...)
{
  return [a1 externalDisplayZoomDelegates];
}

id objc_msgSend_externalWindowScenes(void *a1, const char *a2, ...)
{
  return [a1 externalWindowScenes];
}

id objc_msgSend_fakeLaserVC(void *a1, const char *a2, ...)
{
  return [a1 fakeLaserVC];
}

id objc_msgSend_filledTrackLayer(void *a1, const char *a2, ...)
{
  return [a1 filledTrackLayer];
}

id objc_msgSend_fingerContainerView(void *a1, const char *a2, ...)
{
  return [a1 fingerContainerView];
}

id objc_msgSend_fingerController(void *a1, const char *a2, ...)
{
  return [a1 fingerController];
}

id objc_msgSend_fingerCount(void *a1, const char *a2, ...)
{
  return [a1 fingerCount];
}

id objc_msgSend_fingerModels(void *a1, const char *a2, ...)
{
  return [a1 fingerModels];
}

id objc_msgSend_fingerWasLiftedInSpeakUnderFingerMode(void *a1, const char *a2, ...)
{
  return [a1 fingerWasLiftedInSpeakUnderFingerMode];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstPath(void *a1, const char *a2, ...)
{
  return [a1 firstPath];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_focusElement(void *a1, const char *a2, ...)
{
  return [a1 focusElement];
}

id objc_msgSend_focusRect(void *a1, const char *a2, ...)
{
  return [a1 focusRect];
}

id objc_msgSend_focusedApps(void *a1, const char *a2, ...)
{
  return [a1 focusedApps];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_frameForResizeDrag(void *a1, const char *a2, ...)
{
  return [a1 frameForResizeDrag];
}

id objc_msgSend_fullscreenEventHandler(void *a1, const char *a2, ...)
{
  return [a1 fullscreenEventHandler];
}

id objc_msgSend_fullscreenLensViewController(void *a1, const char *a2, ...)
{
  return [a1 fullscreenLensViewController];
}

id objc_msgSend_fullscreenZoomDidAutopanUnitTestCallback(void *a1, const char *a2, ...)
{
  return [a1 fullscreenZoomDidAutopanUnitTestCallback];
}

id objc_msgSend_generationCount(void *a1, const char *a2, ...)
{
  return [a1 generationCount];
}

id objc_msgSend_getLastSpeakUnderFingerPhrase(void *a1, const char *a2, ...)
{
  return [a1 getLastSpeakUnderFingerPhrase];
}

id objc_msgSend_globalDevicePreferences(void *a1, const char *a2, ...)
{
  return [a1 globalDevicePreferences];
}

id objc_msgSend_grabberEdge(void *a1, const char *a2, ...)
{
  return [a1 grabberEdge];
}

id objc_msgSend_grabberLayer(void *a1, const char *a2, ...)
{
  return [a1 grabberLayer];
}

id objc_msgSend_grabberOverlayLayer(void *a1, const char *a2, ...)
{
  return [a1 grabberOverlayLayer];
}

id objc_msgSend_grabberViews(void *a1, const char *a2, ...)
{
  return [a1 grabberViews];
}

id objc_msgSend_greenColor(void *a1, const char *a2, ...)
{
  return [a1 greenColor];
}

id objc_msgSend_handEventType(void *a1, const char *a2, ...)
{
  return [a1 handEventType];
}

id objc_msgSend_handInfo(void *a1, const char *a2, ...)
{
  return [a1 handInfo];
}

id objc_msgSend_handleAppActivationAnimationDelay(void *a1, const char *a2, ...)
{
  return [a1 handleAppActivationAnimationDelay];
}

id objc_msgSend_handleAppDeactivationAnimationDelay(void *a1, const char *a2, ...)
{
  return [a1 handleAppDeactivationAnimationDelay];
}

id objc_msgSend_handleAppSwitcherRevealAnimationDelay(void *a1, const char *a2, ...)
{
  return [a1 handleAppSwitcherRevealAnimationDelay];
}

id objc_msgSend_handleCarouselLockBegan(void *a1, const char *a2, ...)
{
  return [a1 handleCarouselLockBegan];
}

id objc_msgSend_handleCarouselLockEnded(void *a1, const char *a2, ...)
{
  return [a1 handleCarouselLockEnded];
}

id objc_msgSend_handleDeviceReturnedToClockAtIdle(void *a1, const char *a2, ...)
{
  return [a1 handleDeviceReturnedToClockAtIdle];
}

id objc_msgSend_handleDeviceWasUnlocked(void *a1, const char *a2, ...)
{
  return [a1 handleDeviceWasUnlocked];
}

id objc_msgSend_handleDeviceWillWake(void *a1, const char *a2, ...)
{
  return [a1 handleDeviceWillWake];
}

id objc_msgSend_handleDragWillEnd(void *a1, const char *a2, ...)
{
  return [a1 handleDragWillEnd];
}

id objc_msgSend_handleDragWillStart(void *a1, const char *a2, ...)
{
  return [a1 handleDragWillStart];
}

id objc_msgSend_handleFluidSwitcherGestureWillBegin(void *a1, const char *a2, ...)
{
  return [a1 handleFluidSwitcherGestureWillBegin];
}

id objc_msgSend_handleHomeButtonWasPressed(void *a1, const char *a2, ...)
{
  return [a1 handleHomeButtonWasPressed];
}

id objc_msgSend_handleLockButtonWasPressed(void *a1, const char *a2, ...)
{
  return [a1 handleLockButtonWasPressed];
}

id objc_msgSend_handleSubstantialAppTransition(void *a1, const char *a2, ...)
{
  return [a1 handleSubstantialAppTransition];
}

id objc_msgSend_hardwareIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hardwareIdentifier];
}

id objc_msgSend_hidPostThread(void *a1, const char *a2, ...)
{
  return [a1 hidPostThread];
}

id objc_msgSend_hidePointerAssertion(void *a1, const char *a2, ...)
{
  return [a1 hidePointerAssertion];
}

id objc_msgSend_hitTestCategoryAssertion(void *a1, const char *a2, ...)
{
  return [a1 hitTestCategoryAssertion];
}

id objc_msgSend_hitTestsAsOpaque(void *a1, const char *a2, ...)
{
  return [a1 hitTestsAsOpaque];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_idleSlugOpacity(void *a1, const char *a2, ...)
{
  return [a1 idleSlugOpacity];
}

id objc_msgSend_idleTouchTimer(void *a1, const char *a2, ...)
{
  return [a1 idleTouchTimer];
}

id objc_msgSend_ignoreLogging(void *a1, const char *a2, ...)
{
  return [a1 ignoreLogging];
}

id objc_msgSend_impactOccurred(void *a1, const char *a2, ...)
{
  return [a1 impactOccurred];
}

id objc_msgSend_inSpeakUnderFingerMode(void *a1, const char *a2, ...)
{
  return [a1 inSpeakUnderFingerMode];
}

id objc_msgSend_inStandbyMode(void *a1, const char *a2, ...)
{
  return [a1 inStandbyMode];
}

id objc_msgSend_initialFingerCount(void *a1, const char *a2, ...)
{
  return [a1 initialFingerCount];
}

id objc_msgSend_initialize(void *a1, const char *a2, ...)
{
  return [a1 initialize];
}

id objc_msgSend_instanceTransform(void *a1, const char *a2, ...)
{
  return [a1 instanceTransform];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 interfaceOrientation];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isActiveLensTransitioning(void *a1, const char *a2, ...)
{
  return [a1 isActiveLensTransitioning];
}

id objc_msgSend_isAnyDisplayZoomedIn(void *a1, const char *a2, ...)
{
  return [a1 isAnyDisplayZoomedIn];
}

id objc_msgSend_isAutomovingLens(void *a1, const char *a2, ...)
{
  return [a1 isAutomovingLens];
}

id objc_msgSend_isBrailleInputUIShowing(void *a1, const char *a2, ...)
{
  return [a1 isBrailleInputUIShowing];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isDockVisible(void *a1, const char *a2, ...)
{
  return [a1 isDockVisible];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isInDockResizingMode(void *a1, const char *a2, ...)
{
  return [a1 isInDockResizingMode];
}

id objc_msgSend_isInLensResizingMode(void *a1, const char *a2, ...)
{
  return [a1 isInLensResizingMode];
}

id objc_msgSend_isInPanZoomingMode(void *a1, const char *a2, ...)
{
  return [a1 isInPanZoomingMode];
}

id objc_msgSend_isInUserRepositioningMode(void *a1, const char *a2, ...)
{
  return [a1 isInUserRepositioningMode];
}

id objc_msgSend_isKeyboardVisible(void *a1, const char *a2, ...)
{
  return [a1 isKeyboardVisible];
}

id objc_msgSend_isMainDisplay(void *a1, const char *a2, ...)
{
  return [a1 isMainDisplay];
}

id objc_msgSend_isMainDisplayZoomedIn(void *a1, const char *a2, ...)
{
  return [a1 isMainDisplayZoomedIn];
}

id objc_msgSend_isOrbPanning(void *a1, const char *a2, ...)
{
  return [a1 isOrbPanning];
}

id objc_msgSend_isPending(void *a1, const char *a2, ...)
{
  return [a1 isPending];
}

id objc_msgSend_isPressed(void *a1, const char *a2, ...)
{
  return [a1 isPressed];
}

id objc_msgSend_isSpeaking(void *a1, const char *a2, ...)
{
  return [a1 isSpeaking];
}

id objc_msgSend_isStylus(void *a1, const char *a2, ...)
{
  return [a1 isStylus];
}

id objc_msgSend_isTouchEventWeCareAbout(void *a1, const char *a2, ...)
{
  return [a1 isTouchEventWeCareAbout];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_isZoomLensVisible(void *a1, const char *a2, ...)
{
  return [a1 isZoomLensVisible];
}

id objc_msgSend_isZoomSlugVisible(void *a1, const char *a2, ...)
{
  return [a1 isZoomSlugVisible];
}

id objc_msgSend_islandPortalLayer(void *a1, const char *a2, ...)
{
  return [a1 islandPortalLayer];
}

id objc_msgSend_kbContext(void *a1, const char *a2, ...)
{
  return [a1 kbContext];
}

id objc_msgSend_keyPath(void *a1, const char *a2, ...)
{
  return [a1 keyPath];
}

id objc_msgSend_keyRepeatTimer(void *a1, const char *a2, ...)
{
  return [a1 keyRepeatTimer];
}

id objc_msgSend_keyboardFrame(void *a1, const char *a2, ...)
{
  return [a1 keyboardFrame];
}

id objc_msgSend_keyboardHideTimer(void *a1, const char *a2, ...)
{
  return [a1 keyboardHideTimer];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_laserEnabled(void *a1, const char *a2, ...)
{
  return [a1 laserEnabled];
}

id objc_msgSend_laserZoomPanningStyle(void *a1, const char *a2, ...)
{
  return [a1 laserZoomPanningStyle];
}

id objc_msgSend_lastHoveredView(void *a1, const char *a2, ...)
{
  return [a1 lastHoveredView];
}

id objc_msgSend_lastKeyboardCommand(void *a1, const char *a2, ...)
{
  return [a1 lastKeyboardCommand];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastOrbLocation(void *a1, const char *a2, ...)
{
  return [a1 lastOrbLocation];
}

id objc_msgSend_lastPointerLocation(void *a1, const char *a2, ...)
{
  return [a1 lastPointerLocation];
}

id objc_msgSend_lastScrollTrapOffset(void *a1, const char *a2, ...)
{
  return [a1 lastScrollTrapOffset];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_layoutSubviews(void *a1, const char *a2, ...)
{
  return [a1 layoutSubviews];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_leftChromeGrabberDragConstraint(void *a1, const char *a2, ...)
{
  return [a1 leftChromeGrabberDragConstraint];
}

id objc_msgSend_leftChromeGrabberView(void *a1, const char *a2, ...)
{
  return [a1 leftChromeGrabberView];
}

id objc_msgSend_leftTriangleRadiusDistanceConstraint(void *a1, const char *a2, ...)
{
  return [a1 leftTriangleRadiusDistanceConstraint];
}

id objc_msgSend_leftTriangleView(void *a1, const char *a2, ...)
{
  return [a1 leftTriangleView];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lensAutopanner(void *a1, const char *a2, ...)
{
  return [a1 lensAutopanner];
}

id objc_msgSend_lensChromeView(void *a1, const char *a2, ...)
{
  return [a1 lensChromeView];
}

id objc_msgSend_lensDragXConstraint(void *a1, const char *a2, ...)
{
  return [a1 lensDragXConstraint];
}

id objc_msgSend_lensDragYConstraint(void *a1, const char *a2, ...)
{
  return [a1 lensDragYConstraint];
}

id objc_msgSend_lensEffect(void *a1, const char *a2, ...)
{
  return [a1 lensEffect];
}

id objc_msgSend_lensEffectIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 lensEffectIdentifiers];
}

id objc_msgSend_lensHeightConstraint(void *a1, const char *a2, ...)
{
  return [a1 lensHeightConstraint];
}

id objc_msgSend_lensModeDidChange(void *a1, const char *a2, ...)
{
  return [a1 lensModeDidChange];
}

id objc_msgSend_lensResizingHandlesLayer(void *a1, const char *a2, ...)
{
  return [a1 lensResizingHandlesLayer];
}

id objc_msgSend_lensResizingHandlesShowing(void *a1, const char *a2, ...)
{
  return [a1 lensResizingHandlesShowing];
}

id objc_msgSend_lensTransitionUnitTestCallback(void *a1, const char *a2, ...)
{
  return [a1 lensTransitionUnitTestCallback];
}

id objc_msgSend_lensWidthConstraint(void *a1, const char *a2, ...)
{
  return [a1 lensWidthConstraint];
}

id objc_msgSend_lensZoomView(void *a1, const char *a2, ...)
{
  return [a1 lensZoomView];
}

id objc_msgSend_lifetimeFingerCount(void *a1, const char *a2, ...)
{
  return [a1 lifetimeFingerCount];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return [a1 load];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_longPress(void *a1, const char *a2, ...)
{
  return [a1 longPress];
}

id objc_msgSend_longPressGesture(void *a1, const char *a2, ...)
{
  return [a1 longPressGesture];
}

id objc_msgSend_longPressGestureRecognizer(void *a1, const char *a2, ...)
{
  return [a1 longPressGestureRecognizer];
}

id objc_msgSend_magneticLocation(void *a1, const char *a2, ...)
{
  return [a1 magneticLocation];
}

id objc_msgSend_mainAccessQueue(void *a1, const char *a2, ...)
{
  return [a1 mainAccessQueue];
}

id objc_msgSend_mainDisplayDelegate(void *a1, const char *a2, ...)
{
  return [a1 mainDisplayDelegate];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_makeHorizontal(void *a1, const char *a2, ...)
{
  return [a1 makeHorizontal];
}

id objc_msgSend_makeVertical(void *a1, const char *a2, ...)
{
  return [a1 makeVertical];
}

id objc_msgSend_mask(void *a1, const char *a2, ...)
{
  return [a1 mask];
}

id objc_msgSend_maskLayer(void *a1, const char *a2, ...)
{
  return [a1 maskLayer];
}

id objc_msgSend_maximumFramesPerSecond(void *a1, const char *a2, ...)
{
  return [a1 maximumFramesPerSecond];
}

id objc_msgSend_maximumValue(void *a1, const char *a2, ...)
{
  return [a1 maximumValue];
}

id objc_msgSend_menuViewController(void *a1, const char *a2, ...)
{
  return [a1 menuViewController];
}

id objc_msgSend_minimapView(void *a1, const char *a2, ...)
{
  return [a1 minimapView];
}

id objc_msgSend_minimumValue(void *a1, const char *a2, ...)
{
  return [a1 minimumValue];
}

id objc_msgSend_moveCursorToCurrentFakeCursorLocation(void *a1, const char *a2, ...)
{
  return [a1 moveCursorToCurrentFakeCursorLocation];
}

id objc_msgSend_nativeFocusElement(void *a1, const char *a2, ...)
{
  return [a1 nativeFocusElement];
}

id objc_msgSend_nextFocusedItem(void *a1, const char *a2, ...)
{
  return [a1 nextFocusedItem];
}

id objc_msgSend_offsetZoomWindow(void *a1, const char *a2, ...)
{
  return [a1 offsetZoomWindow];
}

id objc_msgSend_offsetZoomWindowFromFinger(void *a1, const char *a2, ...)
{
  return [a1 offsetZoomWindowFromFinger];
}

id objc_msgSend_orbValue(void *a1, const char *a2, ...)
{
  return [a1 orbValue];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return [a1 orderedSet];
}

id objc_msgSend_outerBorderLayer(void *a1, const char *a2, ...)
{
  return [a1 outerBorderLayer];
}

id objc_msgSend_page(void *a1, const char *a2, ...)
{
  return [a1 page];
}

id objc_msgSend_panGesture(void *a1, const char *a2, ...)
{
  return [a1 panGesture];
}

id objc_msgSend_panGestureRecognizer(void *a1, const char *a2, ...)
{
  return [a1 panGestureRecognizer];
}

id objc_msgSend_panOffsetXBeforeTransition(void *a1, const char *a2, ...)
{
  return [a1 panOffsetXBeforeTransition];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathIdentity(void *a1, const char *a2, ...)
{
  return [a1 pathIdentity];
}

id objc_msgSend_pathIndex(void *a1, const char *a2, ...)
{
  return [a1 pathIndex];
}

id objc_msgSend_pathIndexMask(void *a1, const char *a2, ...)
{
  return [a1 pathIndexMask];
}

id objc_msgSend_pathLocation(void *a1, const char *a2, ...)
{
  return [a1 pathLocation];
}

id objc_msgSend_pathProximity(void *a1, const char *a2, ...)
{
  return [a1 pathProximity];
}

id objc_msgSend_paths(void *a1, const char *a2, ...)
{
  return [a1 paths];
}

id objc_msgSend_pathsIncludingMayBeginEvents(void *a1, const char *a2, ...)
{
  return [a1 pathsIncludingMayBeginEvents];
}

id objc_msgSend_pipDelegate(void *a1, const char *a2, ...)
{
  return [a1 pipDelegate];
}

id objc_msgSend_pipLensEdgeMask(void *a1, const char *a2, ...)
{
  return [a1 pipLensEdgeMask];
}

id objc_msgSend_pipLensViewController(void *a1, const char *a2, ...)
{
  return [a1 pipLensViewController];
}

id objc_msgSend_pointerButtonClickCount(void *a1, const char *a2, ...)
{
  return [a1 pointerButtonClickCount];
}

id objc_msgSend_pointerButtonMask(void *a1, const char *a2, ...)
{
  return [a1 pointerButtonMask];
}

id objc_msgSend_pointerControllerInfo(void *a1, const char *a2, ...)
{
  return [a1 pointerControllerInfo];
}

id objc_msgSend_pointerEventStream(void *a1, const char *a2, ...)
{
  return [a1 pointerEventStream];
}

id objc_msgSend_pointerIsAbsolute(void *a1, const char *a2, ...)
{
  return [a1 pointerIsAbsolute];
}

id objc_msgSend_pointerX(void *a1, const char *a2, ...)
{
  return [a1 pointerX];
}

id objc_msgSend_pointerY(void *a1, const char *a2, ...)
{
  return [a1 pointerY];
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return [a1 popoverPresentationController];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return [a1 position];
}

id objc_msgSend_preferredLensModesDidChange(void *a1, const char *a2, ...)
{
  return [a1 preferredLensModesDidChange];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_previousResizeBounds(void *a1, const char *a2, ...)
{
  return [a1 previousResizeBounds];
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return [a1 principalClass];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return [a1 raise];
}

id objc_msgSend_reachabilityOffset(void *a1, const char *a2, ...)
{
  return [a1 reachabilityOffset];
}

id objc_msgSend_reachabilityScaleFactor(void *a1, const char *a2, ...)
{
  return [a1 reachabilityScaleFactor];
}

id objc_msgSend_record(void *a1, const char *a2, ...)
{
  return [a1 record];
}

id objc_msgSend_redirectPointerAssertion(void *a1, const char *a2, ...)
{
  return [a1 redirectPointerAssertion];
}

id objc_msgSend_redirectPointerLocation(void *a1, const char *a2, ...)
{
  return [a1 redirectPointerLocation];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return [a1 removeAllAnimations];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperlayer];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_requestPortalInfo(void *a1, const char *a2, ...)
{
  return [a1 requestPortalInfo];
}

id objc_msgSend_resetEventQueue(void *a1, const char *a2, ...)
{
  return [a1 resetEventQueue];
}

id objc_msgSend_resizeElements(void *a1, const char *a2, ...)
{
  return [a1 resizeElements];
}

id objc_msgSend_rightChromeGrabberDragConstraint(void *a1, const char *a2, ...)
{
  return [a1 rightChromeGrabberDragConstraint];
}

id objc_msgSend_rightChromeGrabberView(void *a1, const char *a2, ...)
{
  return [a1 rightChromeGrabberView];
}

id objc_msgSend_rightTriangleRadiusDistanceConstraint(void *a1, const char *a2, ...)
{
  return [a1 rightTriangleRadiusDistanceConstraint];
}

id objc_msgSend_rightTriangleView(void *a1, const char *a2, ...)
{
  return [a1 rightTriangleView];
}

id objc_msgSend_roundedLensCorners(void *a1, const char *a2, ...)
{
  return [a1 roundedLensCorners];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 safeAreaInsets];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_sampleRect(void *a1, const char *a2, ...)
{
  return [a1 sampleRect];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return [a1 screen];
}

id objc_msgSend_screenBackdropLayer(void *a1, const char *a2, ...)
{
  return [a1 screenBackdropLayer];
}

id objc_msgSend_screenReplicatorLayer(void *a1, const char *a2, ...)
{
  return [a1 screenReplicatorLayer];
}

id objc_msgSend_screenReplicatorView(void *a1, const char *a2, ...)
{
  return [a1 screenReplicatorView];
}

id objc_msgSend_screenShift(void *a1, const char *a2, ...)
{
  return [a1 screenShift];
}

id objc_msgSend_screenshotActionHandlerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 screenshotActionHandlerIdentifier];
}

id objc_msgSend_scrollAccelAmount(void *a1, const char *a2, ...)
{
  return [a1 scrollAccelAmount];
}

id objc_msgSend_scrollAmount(void *a1, const char *a2, ...)
{
  return [a1 scrollAmount];
}

id objc_msgSend_scrollBeganWhileSnarfingScrolls(void *a1, const char *a2, ...)
{
  return [a1 scrollBeganWhileSnarfingScrolls];
}

id objc_msgSend_scrollEvent(void *a1, const char *a2, ...)
{
  return [a1 scrollEvent];
}

id objc_msgSend_scrollTrapView(void *a1, const char *a2, ...)
{
  return [a1 scrollTrapView];
}

id objc_msgSend_securePayAssertionActive(void *a1, const char *a2, ...)
{
  return [a1 securePayAssertionActive];
}

id objc_msgSend_sendUserEventOccurred(void *a1, const char *a2, ...)
{
  return [a1 sendUserEventOccurred];
}

id objc_msgSend_senderID(void *a1, const char *a2, ...)
{
  return [a1 senderID];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setNativeFocus(void *a1, const char *a2, ...)
{
  return [a1 setNativeFocus];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedDisplayManager(void *a1, const char *a2, ...)
{
  return [a1 sharedDisplayManager];
}

id objc_msgSend_sharedEventManager(void *a1, const char *a2, ...)
{
  return [a1 sharedEventManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_shouldSuppressKeyCommandHUD(void *a1, const char *a2, ...)
{
  return [a1 shouldSuppressKeyCommandHUD];
}

id objc_msgSend_shouldUseContinuousCornerRadius(void *a1, const char *a2, ...)
{
  return [a1 shouldUseContinuousCornerRadius];
}

id objc_msgSend_shouldUseRoundedRect(void *a1, const char *a2, ...)
{
  return [a1 shouldUseRoundedRect];
}

id objc_msgSend_showHideGroup(void *a1, const char *a2, ...)
{
  return [a1 showHideGroup];
}

id objc_msgSend_showHideQueue(void *a1, const char *a2, ...)
{
  return [a1 showHideQueue];
}

id objc_msgSend_showOrbZoomToggleOff(void *a1, const char *a2, ...)
{
  return [a1 showOrbZoomToggleOff];
}

id objc_msgSend_showOrbZoomToggleOn(void *a1, const char *a2, ...)
{
  return [a1 showOrbZoomToggleOn];
}

id objc_msgSend_showZoomDisabledAlertIfAppropriate(void *a1, const char *a2, ...)
{
  return [a1 showZoomDisabledAlertIfAppropriate];
}

id objc_msgSend_showZoomEnabledAlertIfAppropriate(void *a1, const char *a2, ...)
{
  return [a1 showZoomEnabledAlertIfAppropriate];
}

id objc_msgSend_showingResizeHandles(void *a1, const char *a2, ...)
{
  return [a1 showingResizeHandles];
}

id objc_msgSend_singleTapGesture(void *a1, const char *a2, ...)
{
  return [a1 singleTapGesture];
}

id objc_msgSend_slugAppearanceState(void *a1, const char *a2, ...)
{
  return [a1 slugAppearanceState];
}

id objc_msgSend_slugRingBottomConstraint(void *a1, const char *a2, ...)
{
  return [a1 slugRingBottomConstraint];
}

id objc_msgSend_slugRingDragXConstraint(void *a1, const char *a2, ...)
{
  return [a1 slugRingDragXConstraint];
}

id objc_msgSend_slugRingDragYConstraint(void *a1, const char *a2, ...)
{
  return [a1 slugRingDragYConstraint];
}

id objc_msgSend_slugRingLeadingConstraint(void *a1, const char *a2, ...)
{
  return [a1 slugRingLeadingConstraint];
}

id objc_msgSend_slugRingTopConstraint(void *a1, const char *a2, ...)
{
  return [a1 slugRingTopConstraint];
}

id objc_msgSend_slugRingTrailingConstraint(void *a1, const char *a2, ...)
{
  return [a1 slugRingTrailingConstraint];
}

id objc_msgSend_slugRingView(void *a1, const char *a2, ...)
{
  return [a1 slugRingView];
}

id objc_msgSend_slugRingViewBoundsInScreenCoordinates(void *a1, const char *a2, ...)
{
  return [a1 slugRingViewBoundsInScreenCoordinates];
}

id objc_msgSend_slugViewController(void *a1, const char *a2, ...)
{
  return [a1 slugViewController];
}

id objc_msgSend_smartZoom(void *a1, const char *a2, ...)
{
  return [a1 smartZoom];
}

id objc_msgSend_snarfingWheelEventsForPan(void *a1, const char *a2, ...)
{
  return [a1 snarfingWheelEventsForPan];
}

id objc_msgSend_sourceContextID(void *a1, const char *a2, ...)
{
  return [a1 sourceContextID];
}

id objc_msgSend_sourceLayerRenderID(void *a1, const char *a2, ...)
{
  return [a1 sourceLayerRenderID];
}

id objc_msgSend_speakContent(void *a1, const char *a2, ...)
{
  return [a1 speakContent];
}

id objc_msgSend_speakFingerImageView(void *a1, const char *a2, ...)
{
  return [a1 speakFingerImageView];
}

id objc_msgSend_speakFingerState(void *a1, const char *a2, ...)
{
  return [a1 speakFingerState];
}

id objc_msgSend_speakUnderFingerModeStarted(void *a1, const char *a2, ...)
{
  return [a1 speakUnderFingerModeStarted];
}

id objc_msgSend_standByLongPressDuration(void *a1, const char *a2, ...)
{
  return [a1 standByLongPressDuration];
}

id objc_msgSend_standbyFinishedTransitioningUnitTestCallback(void *a1, const char *a2, ...)
{
  return [a1 standbyFinishedTransitioningUnitTestCallback];
}

id objc_msgSend_standbyModeDidChange(void *a1, const char *a2, ...)
{
  return [a1 standbyModeDidChange];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stringForCurrentDockPosition(void *a1, const char *a2, ...)
{
  return [a1 stringForCurrentDockPosition];
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return [a1 sublayers];
}

id objc_msgSend_superlayer(void *a1, const char *a2, ...)
{
  return [a1 superlayer];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_synthesizer(void *a1, const char *a2, ...)
{
  return [a1 synthesizer];
}

id objc_msgSend_systemApplication(void *a1, const char *a2, ...)
{
  return [a1 systemApplication];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_systemWideElement(void *a1, const char *a2, ...)
{
  return [a1 systemWideElement];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_tapGestureRecognizer(void *a1, const char *a2, ...)
{
  return [a1 tapGestureRecognizer];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return [a1 time];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_toggleStandbyOnNextCommandChange(void *a1, const char *a2, ...)
{
  return [a1 toggleStandbyOnNextCommandChange];
}

id objc_msgSend_toggleZoomMenu(void *a1, const char *a2, ...)
{
  return [a1 toggleZoomMenu];
}

id objc_msgSend_toggleZoomRegionButton(void *a1, const char *a2, ...)
{
  return [a1 toggleZoomRegionButton];
}

id objc_msgSend_toggleZoomRegionVisibility(void *a1, const char *a2, ...)
{
  return [a1 toggleZoomRegionVisibility];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_topChromeGrabberDragConstraint(void *a1, const char *a2, ...)
{
  return [a1 topChromeGrabberDragConstraint];
}

id objc_msgSend_topChromeGrabberView(void *a1, const char *a2, ...)
{
  return [a1 topChromeGrabberView];
}

id objc_msgSend_topTriangleRadiusDistanceConstraint(void *a1, const char *a2, ...)
{
  return [a1 topTriangleRadiusDistanceConstraint];
}

id objc_msgSend_topTriangleView(void *a1, const char *a2, ...)
{
  return [a1 topTriangleView];
}

id objc_msgSend_touchStealLayer(void *a1, const char *a2, ...)
{
  return [a1 touchStealLayer];
}

id objc_msgSend_touchStealerShapeLayer(void *a1, const char *a2, ...)
{
  return [a1 touchStealerShapeLayer];
}

id objc_msgSend_touchTrapView(void *a1, const char *a2, ...)
{
  return [a1 touchTrapView];
}

id objc_msgSend_trackpadHandEvent(void *a1, const char *a2, ...)
{
  return [a1 trackpadHandEvent];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_transducerType(void *a1, const char *a2, ...)
{
  return [a1 transducerType];
}

id objc_msgSend_triangle(void *a1, const char *a2, ...)
{
  return [a1 triangle];
}

id objc_msgSend_triangleLayer(void *a1, const char *a2, ...)
{
  return [a1 triangleLayer];
}

id objc_msgSend_triedToRezoomForDockTransition(void *a1, const char *a2, ...)
{
  return [a1 triedToRezoomForDockTransition];
}

id objc_msgSend_triedToToggleStandbyDuringAnimation(void *a1, const char *a2, ...)
{
  return [a1 triedToToggleStandbyDuringAnimation];
}

id objc_msgSend_tripleTapGesture(void *a1, const char *a2, ...)
{
  return [a1 tripleTapGesture];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uiElement(void *a1, const char *a2, ...)
{
  return [a1 uiElement];
}

id objc_msgSend_unfilledTrackLayer(void *a1, const char *a2, ...)
{
  return [a1 unfilledTrackLayer];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateUIForSpeakFingerStateChange(void *a1, const char *a2, ...)
{
  return [a1 updateUIForSpeakFingerStateChange];
}

id objc_msgSend_usage(void *a1, const char *a2, ...)
{
  return [a1 usage];
}

id objc_msgSend_userEventOccurred(void *a1, const char *a2, ...)
{
  return [a1 userEventOccurred];
}

id objc_msgSend_userInteractionHasBecomeIdle(void *a1, const char *a2, ...)
{
  return [a1 userInteractionHasBecomeIdle];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceLayoutDirection];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_userIsInteractingWithLens(void *a1, const char *a2, ...)
{
  return [a1 userIsInteractingWithLens];
}

id objc_msgSend_userIsInteractingWithMenu(void *a1, const char *a2, ...)
{
  return [a1 userIsInteractingWithMenu];
}

id objc_msgSend_userIsInteractingWithSlug(void *a1, const char *a2, ...)
{
  return [a1 userIsInteractingWithSlug];
}

id objc_msgSend_userIsMovingLens(void *a1, const char *a2, ...)
{
  return [a1 userIsMovingLens];
}

id objc_msgSend_userManuallyExitedSpeakUnderFingerMode(void *a1, const char *a2, ...)
{
  return [a1 userManuallyExitedSpeakUnderFingerMode];
}

id objc_msgSend_userMovedKeyboardLens(void *a1, const char *a2, ...)
{
  return [a1 userMovedKeyboardLens];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return [a1 viewIfLoaded];
}

id objc_msgSend_visibleElements(void *a1, const char *a2, ...)
{
  return [a1 visibleElements];
}

id objc_msgSend_wakeSlug(void *a1, const char *a2, ...)
{
  return [a1 wakeSlug];
}

id objc_msgSend_weakObjectsPointerArray(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsPointerArray];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_willBeUpdated(void *a1, const char *a2, ...)
{
  return [a1 willBeUpdated];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_zoomAlertManager(void *a1, const char *a2, ...)
{
  return [a1 zoomAlertManager];
}

id objc_msgSend_zoomAlwaysUseWindowedZoomForTyping(void *a1, const char *a2, ...)
{
  return [a1 zoomAlwaysUseWindowedZoomForTyping];
}

id objc_msgSend_zoomAutopannerShouldPanWithAcceleration(void *a1, const char *a2, ...)
{
  return [a1 zoomAutopannerShouldPanWithAcceleration];
}

id objc_msgSend_zoomBackdropLayer(void *a1, const char *a2, ...)
{
  return [a1 zoomBackdropLayer];
}

id objc_msgSend_zoomControllerColor(void *a1, const char *a2, ...)
{
  return [a1 zoomControllerColor];
}

id objc_msgSend_zoomCurrentLensEffect(void *a1, const char *a2, ...)
{
  return [a1 zoomCurrentLensEffect];
}

id objc_msgSend_zoomCurrentLensEffectDidChange(void *a1, const char *a2, ...)
{
  return [a1 zoomCurrentLensEffectDidChange];
}

id objc_msgSend_zoomCurrentLensMode(void *a1, const char *a2, ...)
{
  return [a1 zoomCurrentLensMode];
}

id objc_msgSend_zoomDebugShowExternalFocusRect(void *a1, const char *a2, ...)
{
  return [a1 zoomDebugShowExternalFocusRect];
}

id objc_msgSend_zoomDelegate(void *a1, const char *a2, ...)
{
  return [a1 zoomDelegate];
}

id objc_msgSend_zoomFactor(void *a1, const char *a2, ...)
{
  return [a1 zoomFactor];
}

id objc_msgSend_zoomFactorUpdateTimer(void *a1, const char *a2, ...)
{
  return [a1 zoomFactorUpdateTimer];
}

id objc_msgSend_zoomFollowsFocus(void *a1, const char *a2, ...)
{
  return [a1 zoomFollowsFocus];
}

id objc_msgSend_zoomFrame(void *a1, const char *a2, ...)
{
  return [a1 zoomFrame];
}

id objc_msgSend_zoomHandGesturesActionCustomizations(void *a1, const char *a2, ...)
{
  return [a1 zoomHandGesturesActionCustomizations];
}

id objc_msgSend_zoomHandGesturesEnabled(void *a1, const char *a2, ...)
{
  return [a1 zoomHandGesturesEnabled];
}

id objc_msgSend_zoomIdleSlugOpacity(void *a1, const char *a2, ...)
{
  return [a1 zoomIdleSlugOpacity];
}

id objc_msgSend_zoomInImageView(void *a1, const char *a2, ...)
{
  return [a1 zoomInImageView];
}

id objc_msgSend_zoomInStandby(void *a1, const char *a2, ...)
{
  return [a1 zoomInStandby];
}

id objc_msgSend_zoomIsAnimating(void *a1, const char *a2, ...)
{
  return [a1 zoomIsAnimating];
}

id objc_msgSend_zoomIsAnimatingDueToStandbyToggle(void *a1, const char *a2, ...)
{
  return [a1 zoomIsAnimatingDueToStandbyToggle];
}

id objc_msgSend_zoomIsAnimatingDueToTransition(void *a1, const char *a2, ...)
{
  return [a1 zoomIsAnimatingDueToTransition];
}

id objc_msgSend_zoomLensFrameUpdateTimer(void *a1, const char *a2, ...)
{
  return [a1 zoomLensFrameUpdateTimer];
}

id objc_msgSend_zoomLevel(void *a1, const char *a2, ...)
{
  return [a1 zoomLevel];
}

id objc_msgSend_zoomLevelSlider(void *a1, const char *a2, ...)
{
  return [a1 zoomLevelSlider];
}

id objc_msgSend_zoomMenuVisibilityChangedUnitTestCallback(void *a1, const char *a2, ...)
{
  return [a1 zoomMenuVisibilityChangedUnitTestCallback];
}

id objc_msgSend_zoomModeIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 zoomModeIdentifiers];
}

id objc_msgSend_zoomMovementDidEnd(void *a1, const char *a2, ...)
{
  return [a1 zoomMovementDidEnd];
}

id objc_msgSend_zoomOutImageView(void *a1, const char *a2, ...)
{
  return [a1 zoomOutImageView];
}

id objc_msgSend_zoomPanOffset(void *a1, const char *a2, ...)
{
  return [a1 zoomPanOffset];
}

id objc_msgSend_zoomPanOffsetUpdateTimer(void *a1, const char *a2, ...)
{
  return [a1 zoomPanOffsetUpdateTimer];
}

id objc_msgSend_zoomPeekZoomEnabled(void *a1, const char *a2, ...)
{
  return [a1 zoomPeekZoomEnabled];
}

id objc_msgSend_zoomPeekZoomEverEnabled(void *a1, const char *a2, ...)
{
  return [a1 zoomPeekZoomEverEnabled];
}

id objc_msgSend_zoomPreferencesWereInitialized(void *a1, const char *a2, ...)
{
  return [a1 zoomPreferencesWereInitialized];
}

id objc_msgSend_zoomPreferredCurrentDockPosition(void *a1, const char *a2, ...)
{
  return [a1 zoomPreferredCurrentDockPosition];
}

id objc_msgSend_zoomPreferredCurrentLensMode(void *a1, const char *a2, ...)
{
  return [a1 zoomPreferredCurrentLensMode];
}

id objc_msgSend_zoomPreferredMaximumZoomScale(void *a1, const char *a2, ...)
{
  return [a1 zoomPreferredMaximumZoomScale];
}

id objc_msgSend_zoomRegionFrame(void *a1, const char *a2, ...)
{
  return [a1 zoomRegionFrame];
}

id objc_msgSend_zoomRegionOnScreenReplicatorEdge(void *a1, const char *a2, ...)
{
  return [a1 zoomRegionOnScreenReplicatorEdge];
}

id objc_msgSend_zoomRegionVisible(void *a1, const char *a2, ...)
{
  return [a1 zoomRegionVisible];
}

id objc_msgSend_zoomReplicatorLayer(void *a1, const char *a2, ...)
{
  return [a1 zoomReplicatorLayer];
}

id objc_msgSend_zoomRepositionsForKeyboard(void *a1, const char *a2, ...)
{
  return [a1 zoomRepositionsForKeyboard];
}

id objc_msgSend_zoomRootVC(void *a1, const char *a2, ...)
{
  return [a1 zoomRootVC];
}

id objc_msgSend_zoomRootViewControllers(void *a1, const char *a2, ...)
{
  return [a1 zoomRootViewControllers];
}

id objc_msgSend_zoomScale(void *a1, const char *a2, ...)
{
  return [a1 zoomScale];
}

id objc_msgSend_zoomShouldFollowFocus(void *a1, const char *a2, ...)
{
  return [a1 zoomShouldFollowFocus];
}

id objc_msgSend_zoomShouldShowSlug(void *a1, const char *a2, ...)
{
  return [a1 zoomShouldShowSlug];
}

id objc_msgSend_zoomShowWhileMirroring(void *a1, const char *a2, ...)
{
  return [a1 zoomShowWhileMirroring];
}

id objc_msgSend_zoomShowedBanner(void *a1, const char *a2, ...)
{
  return [a1 zoomShowedBanner];
}

id objc_msgSend_zoomSlugDoubleTapAction(void *a1, const char *a2, ...)
{
  return [a1 zoomSlugDoubleTapAction];
}

id objc_msgSend_zoomSlugNormalizedPosition(void *a1, const char *a2, ...)
{
  return [a1 zoomSlugNormalizedPosition];
}

id objc_msgSend_zoomSlugPositionUpdateTimer(void *a1, const char *a2, ...)
{
  return [a1 zoomSlugPositionUpdateTimer];
}

id objc_msgSend_zoomSlugSingleTapAction(void *a1, const char *a2, ...)
{
  return [a1 zoomSlugSingleTapAction];
}

id objc_msgSend_zoomSlugTapAndSlideToAdjustZoomLevelEnabled(void *a1, const char *a2, ...)
{
  return [a1 zoomSlugTapAndSlideToAdjustZoomLevelEnabled];
}

id objc_msgSend_zoomSlugTripleTapAction(void *a1, const char *a2, ...)
{
  return [a1 zoomSlugTripleTapAction];
}

id objc_msgSend_zoomTrackpadGestureEnabled(void *a1, const char *a2, ...)
{
  return [a1 zoomTrackpadGestureEnabled];
}

id objc_msgSend_zoomViewBottomConstraint(void *a1, const char *a2, ...)
{
  return [a1 zoomViewBottomConstraint];
}

id objc_msgSend_zoomViewLeftConstraint(void *a1, const char *a2, ...)
{
  return [a1 zoomViewLeftConstraint];
}

id objc_msgSend_zoomViewRightConstraint(void *a1, const char *a2, ...)
{
  return [a1 zoomViewRightConstraint];
}

id objc_msgSend_zoomViewTopConstraint(void *a1, const char *a2, ...)
{
  return [a1 zoomViewTopConstraint];
}

id objc_msgSend_zoomWasUnzoomedDueToAppTransition(void *a1, const char *a2, ...)
{
  return [a1 zoomWasUnzoomedDueToAppTransition];
}

id objc_msgSend_zoomWindowFrame(void *a1, const char *a2, ...)
{
  return [a1 zoomWindowFrame];
}

id objc_msgSend_zoomedInLongPressDuration(void *a1, const char *a2, ...)
{
  return [a1 zoomedInLongPressDuration];
}

id objc_msgSend_zw_convertRectToScreenCoordinates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zw_convertRectToScreenCoordinates:");
}