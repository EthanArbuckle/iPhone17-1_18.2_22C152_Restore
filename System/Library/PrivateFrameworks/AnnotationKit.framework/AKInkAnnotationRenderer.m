@interface AKInkAnnotationRenderer
+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5;
+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4;
+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3;
+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3;
+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6;
@end

@implementation AKInkAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  [a3 rectangle];

  return CGRectInset(*(CGRect *)&v3, -1.0, -1.0);
}

+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3
{
  double v3 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  CGContextSaveGState(a4);
  [a1 _transformContextToModelCoordinates:a4 forAnnotation:v10 forDisplay:v7 pageControllerOrNil:v11];

  v12 = [v10 drawing];
  v13 = v12;
  if (v12)
  {
    v14 = [v12 strokes];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      [v13 bounds];
      double v108 = v17;
      double v111 = v16;
      double v105 = v18;
      double v112 = v19;
      [v10 rectangle];
      CGFloat x = v121.origin.x;
      CGFloat y = v121.origin.y;
      CGFloat width = v121.size.width;
      CGFloat height = v121.size.height;
      double MidX = CGRectGetMidX(v121);
      v122.origin.CGFloat x = x;
      v122.origin.CGFloat y = y;
      v122.size.CGFloat width = width;
      v122.size.CGFloat height = height;
      double MidY = CGRectGetMidY(v122);
      uint64_t v26 = [v10 originalExifOrientation];
      CGFloat v27 = x;
      double v28 = y;
      double v29 = width;
      double v30 = height;
      if (v26 != 1)
      {
        memset(&v120, 0, sizeof(v120));
        +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", +[AKGeometryHelper inverseExifOrientation:v26], MidX, MidY);
        CGAffineTransform transform = v120;
        CGContextConcatCTM(a4, &transform);
        CGAffineTransform transform = v120;
        v123.origin.CGFloat x = x;
        v123.origin.CGFloat y = y;
        v123.size.CGFloat width = width;
        v123.size.CGFloat height = height;
        CGRect v124 = CGRectApplyAffineTransform(v123, &transform);
        *(CGRect *)(&v28 - 1) = CGRectStandardize(v124);
        CGFloat v27 = v31;
      }
      double v93 = MidX;
      CGFloat rect_16 = v28;
      CGFloat rect_24 = v29;
      CGFloat v98 = v30;
      double v92 = MidY;
      memset(&v120, 0, sizeof(v120));
      CGContextGetCTM(&v120, a4);
      v117[0] = MEMORY[0x263EF8330];
      v117[1] = 3221225472;
      v117[2] = sub_2376714F0;
      v117[3] = &unk_264CDB600;
      CGAffineTransform v118 = v120;
      int64_t v32 = +[AKGeometryHelper exifOrientationWithConversionBlock:v117];
      CGAffineTransform transform = v120;
      v125.origin.CGFloat x = x;
      v125.origin.CGFloat y = y;
      v125.size.CGFloat width = width;
      v125.size.CGFloat height = height;
      CGRect v126 = CGRectApplyAffineTransform(v125, &transform);
      CGRect v127 = CGRectStandardize(v126);
      CGRect v128 = CGRectIntegral(v127);
      double v100 = v128.size.height;
      double v102 = v128.size.width;
      CGAffineTransform transform = v120;
      v128.origin.CGFloat x = 0.0;
      v128.origin.CGFloat y = 0.0;
      v128.size.CGFloat width = 1.0;
      v128.size.CGFloat height = 1.0;
      CGRect v129 = CGRectApplyAffineTransform(v128, &transform);
      CGFloat v33 = v129.origin.x;
      CGFloat v34 = v129.origin.y;
      CGFloat v35 = v129.size.width;
      CGFloat v36 = v129.size.height;
      double v37 = CGRectGetWidth(v129);
      v130.origin.CGFloat x = v33;
      v130.origin.CGFloat y = v34;
      v130.size.CGFloat width = v35;
      v130.size.CGFloat height = v36;
      double v38 = CGRectGetHeight(v130);
      if (v37 >= v38) {
        double v38 = v37;
      }
      double rect_8 = v38;
      v131.origin.CGFloat x = v27;
      v131.origin.CGFloat y = rect_16;
      v131.size.CGFloat width = rect_24;
      v131.size.CGFloat height = v98;
      double v39 = CGRectGetWidth(v131);
      v132.origin.CGFloat x = v111;
      v132.origin.CGFloat y = v108;
      v132.size.CGFloat width = v105;
      v132.size.CGFloat height = v112;
      double v40 = v39 / CGRectGetWidth(v132);
      v133.origin.CGFloat x = v27;
      v133.origin.CGFloat y = rect_16;
      v133.size.CGFloat width = rect_24;
      v133.size.CGFloat height = v98;
      double v41 = CGRectGetHeight(v133);
      v134.origin.CGFloat x = v111;
      v134.origin.CGFloat y = v108;
      v134.size.CGFloat width = v105;
      v134.size.CGFloat height = v112;
      double v42 = v41 / CGRectGetHeight(v134);
      if (v40 < v42) {
        double v42 = v40;
      }
      double v43 = rect_8 * v42;
      int Type = CGContextGetType();
      if (Type == 6 || Type == 1)
      {
        double v45 = v43 * 4.16666667;
        double v46 = v102 * 4.16666667;
        double v47 = v100 * 4.16666667;
      }
      else
      {
        double v45 = v43;
        double v47 = v100;
        double v46 = v102;
      }
      if (v46 >= v47) {
        double v48 = v46;
      }
      else {
        double v48 = v47;
      }
      +[AKInkRendererHelper maxRenderingSize];
      double v50 = v49;
      BOOL v51 = v48 <= v49;
      double v52 = v45 * (v49 / v48);
      if (v51) {
        double v53 = v45;
      }
      else {
        double v53 = v52;
      }
      v54 = +[AKInkRendererHelper renderDrawing:clippedToStrokeSpaceRect:scale:](AKInkRendererHelper, "renderDrawing:clippedToStrokeSpaceRect:scale:", v13, v111, v108, v105, v112, v53);
      if (v54)
      {
        memset(&transform, 0, sizeof(transform));
        CGAffineTransformMakeScale(&transform, v43, v43);
        CGAffineTransform v116 = transform;
        v135.origin.CGFloat x = v111;
        v135.origin.CGFloat y = v108;
        v135.size.CGFloat width = v105;
        v135.size.CGFloat height = v112;
        CGRect v136 = CGRectApplyAffineTransform(v135, &v116);
        CGFloat v55 = v136.origin.x;
        double v113 = v48;
        CGFloat v56 = v136.origin.y;
        CGFloat v57 = v136.size.width;
        CGFloat v58 = v136.size.height;
        CGRect v137 = CGRectIntegral(v136);
        CGFloat v106 = v137.origin.y;
        CGFloat v109 = v137.origin.x;
        CGFloat v103 = v137.size.width;
        CGFloat v59 = v137.size.height;
        memset(&v116, 0, sizeof(v116));
        +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", v32, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
        CGAffineTransform v115 = v116;
        v138.origin.CGFloat x = v55;
        v138.origin.CGFloat y = v56;
        v138.size.CGFloat width = v57;
        v138.size.CGFloat height = v58;
        CGRect v139 = CGRectApplyAffineTransform(v138, &v115);
        CGFloat v60 = v139.origin.x;
        CGFloat v101 = v139.origin.y;
        CGFloat v61 = v139.size.width;
        CGFloat v62 = v139.size.height;
        CGAffineTransform v115 = v116;
        v139.origin.CGFloat y = v106;
        v139.origin.CGFloat x = v109;
        v139.size.CGFloat width = v103;
        v139.size.CGFloat height = v59;
        CGRect v140 = CGRectApplyAffineTransform(v139, &v115);
        CGFloat rect_24a = v140.origin.x;
        CGFloat v63 = v140.origin.y;
        CGFloat v64 = v140.size.width;
        CGFloat v65 = v140.size.height;
        double v107 = round(v140.size.width);
        double v110 = round(v140.size.height);
        CGFloat v104 = v120.tx + v92 * v120.c + v120.a * v93;
        CGFloat v99 = v120.ty + v92 * v120.d + v120.b * v93;
        double v66 = CGRectGetMidX(v140);
        v141.origin.CGFloat x = v60;
        v141.origin.CGFloat y = v101;
        v141.size.CGFloat width = v61;
        v141.size.CGFloat height = v62;
        double v67 = v66 - CGRectGetMidX(v141);
        v142.origin.CGFloat x = rect_24a;
        v142.origin.CGFloat y = v63;
        v142.size.CGFloat width = v64;
        v142.size.CGFloat height = v65;
        double v68 = CGRectGetMidY(v142);
        v143.origin.CGFloat x = v60;
        v143.origin.CGFloat y = v101;
        v143.size.CGFloat width = v61;
        v143.size.CGFloat height = v62;
        double v69 = v99 + v68 - CGRectGetMidY(v143);
        long double v70 = fmod(v107, 2.0);
        double v71 = round(v104 + v67 + 0.5) + -0.5;
        double v72 = round(v104 + v67);
        if (v70 == 0.0) {
          double v73 = v72;
        }
        else {
          double v73 = v71;
        }
        long double v74 = fmod(v110, 2.0);
        double v75 = round(v69 + 0.5) + -0.5;
        double v76 = round(v69);
        if (v74 == 0.0) {
          double v77 = v76;
        }
        else {
          double v77 = v75;
        }
        +[AKGeometryHelper rectWithSize:centeredAtPoint:](AKGeometryHelper, "rectWithSize:centeredAtPoint:", v107, v110, v73, v77);
        CGFloat v79 = v78;
        CGFloat v81 = v80;
        CGFloat v83 = v82;
        CGFloat v85 = v84;
        CGAffineTransform v114 = v120;
        memset(&v115, 0, sizeof(v115));
        CGAffineTransformInvert(&v115, &v114);
        CGAffineTransform v114 = v115;
        v144.origin.CGFloat x = v79;
        v144.origin.CGFloat y = v81;
        v144.size.CGFloat width = v83;
        v144.size.CGFloat height = v85;
        CGRect v145 = CGRectApplyAffineTransform(v144, &v114);
        CGFloat v86 = v145.origin.x;
        CGFloat v87 = v145.origin.y;
        CGFloat v88 = v145.size.width;
        CGFloat v89 = v145.size.height;
        if (v113 <= v50) {
          CGInterpolationQuality v90 = kCGInterpolationNone;
        }
        else {
          CGInterpolationQuality v90 = kCGInterpolationHigh;
        }
        CGContextSetInterpolationQuality(a4, v90);
        v91 = (CGImage *)[v54 akCGImage];
        v146.origin.CGFloat x = v86;
        v146.origin.CGFloat y = v87;
        v146.size.CGFloat width = v88;
        v146.size.CGFloat height = v89;
        CGContextDrawImage(a4, v146, v91);
      }
    }
  }
  CGContextRestoreGState(a4);
}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  return 0;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  return 0;
}

@end