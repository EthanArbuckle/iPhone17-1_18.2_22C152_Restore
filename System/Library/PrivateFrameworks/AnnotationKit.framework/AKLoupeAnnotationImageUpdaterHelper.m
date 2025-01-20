@interface AKLoupeAnnotationImageUpdaterHelper
+ (CGAffineTransform)transformForFastPathLayer:(SEL)a3 ofLoupeAnnotation:(id)a4 onPageController:(id)a5;
+ (CGRect)magnifiedRectForUnmagnifiedRect:(CGRect)a3 ofLoupeAnnotation:(id)a4 onPageController:(id)a5;
+ (CGRect)unmagnifiedRectForMagnifiedRect:(CGRect)a3 ofLoupeAnnotation:(id)a4;
+ (void)updateFastPathImageOnLoupeAnnotation:(id)a3 withFastPathLayer:(id)a4 onPageController:(id)a5;
+ (void)updateModelImageOnLoupeAnnotation:(id)a3 onPageController:(id)a4;
@end

@implementation AKLoupeAnnotationImageUpdaterHelper

+ (CGRect)magnifiedRectForUnmagnifiedRect:(CGRect)a3 ofLoupeAnnotation:(id)a4 onPageController:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [a4 magnification];
  double v10 = v9;
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  double MidX = CGRectGetMidX(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.double width = width;
  v18.size.double height = height;
  CGFloat MidY = CGRectGetMidY(v18);
  double v13 = width / v10;
  double v14 = height / v10;
  double v15 = MidY - height / v10 * 0.5;
  double v16 = MidX - width / v10 * 0.5;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v16;
  return result;
}

+ (CGRect)unmagnifiedRectForMagnifiedRect:(CGRect)a3 ofLoupeAnnotation:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [a4 magnification];
  double v9 = v8;
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  double MidX = CGRectGetMidX(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  CGFloat MidY = CGRectGetMidY(v17);
  double v12 = width * v9;
  double v13 = height * v9;
  double v14 = MidY - height * v9 * 0.5;
  double v15 = MidX - width * v9 * 0.5;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v15;
  return result;
}

+ (void)updateModelImageOnLoupeAnnotation:(id)a3 onPageController:(id)a4
{
  v6 = off_268922A80;
  id v7 = a4;
  id v8 = a3;
  objc_setAssociatedObject(v8, v6, 0, (void *)0x301);
  [v8 rectangle];
  double v10 = v9;
  objc_msgSend(a1, "magnifiedRectForUnmagnifiedRect:ofLoupeAnnotation:onPageController:", v8, v7);
  double v12 = v10 / v11;
  objc_msgSend(v7, "convertRectFromModelToOverlay:");
  id v17 = (id)objc_msgSend(v7, "newContentSnapshotPDFDataAtScale:inRect:forLoupeAnnotation:", v8, v12, v13, v14, v15, v16);

  [v8 setImageData:v17];
}

+ (void)updateFastPathImageOnLoupeAnnotation:(id)a3 withFastPathLayer:(id)a4 onPageController:(id)a5
{
  uint64_t v181 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [v10 delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = [v10 pageIndex];
    double v13 = [v10 controller];
    double v14 = [v11 layerContainingQuickBackgroundForLoupeOnOverlayAtPageIndex:v12 forAnnotationController:v13];

    if (v14 && v9)
    {
      double v15 = [v10 overlayView];
      [v8 rectangle];
      double v17 = v16;
      double v159 = v19;
      double v160 = v18;
      double v158 = v20;
      objc_msgSend(a1, "magnifiedRectForUnmagnifiedRect:ofLoupeAnnotation:onPageController:", v8, v10);
      double v22 = v21;
      double v24 = v23;
      double v149 = v26;
      double v150 = v25;
      objc_msgSend(v10, "convertRectFromModelToOverlay:");
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      v35 = [v15 layer];
      objc_msgSend(v14, "convertRect:fromLayer:", v35, v28, v30, v32, v34);
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;

      +[AKGeometryHelper integralRect:withOptions:](AKGeometryHelper, "integralRect:withOptions:", 3840, v37, v39, v41, v43);
      double v47 = v46;
      double v49 = v48;
      double v50 = v44;
      double v152 = v24;
      double v153 = v22;
      if (vabdd_f64(v22, v24) >= 0.0005) {
        double v51 = v45;
      }
      else {
        double v51 = v44;
      }
      [v10 currentModelToScreenScaleFactor];
      double v147 = v52;
      v53 = [v15 window];
      v54 = [v53 screen];

      if (v54)
      {
        v55 = [v15 window];
        v56 = [v55 screen];
        [v56 scale];
        double v146 = v57;
      }
      else
      {
        v55 = [MEMORY[0x263F1C920] mainScreen];
        [v55 scale];
        double v146 = v58;
      }

      v59 = [v10 geometryHelper];
      CGFloat v151 = v17;
      objc_msgSend(v59, "screenPixelAlignedRectForRect:", v17, v160, v159, v158);
      double v144 = v61;
      double v145 = v60;

      long long v62 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
      long long v178 = *MEMORY[0x263F001A0];
      long long v179 = v62;
      v63 = +[AKFastLayerSnapshotHelper newFastSnapshotFromLayer:withSourceRect:acutalSnapshotRect:](AKFastLayerSnapshotHelper, "newFastSnapshotFromLayer:withSourceRect:acutalSnapshotRect:", v14, &v178, v47, v49, v50, v51);
      v157 = v15;
      v64 = [v15 layer];
      objc_msgSend(v64, "convertRect:fromLayer:", v14, v178, v179);
      double v66 = v65;
      double v68 = v67;
      double v70 = v69;
      double v72 = v71;

      objc_msgSend(v10, "convertRectFromOverlayToModel:", v66, v68, v70, v72);
      CGFloat v154 = v74;
      CGFloat v155 = v73;
      CGFloat v76 = v75;
      CGFloat v78 = v77;
      [v8 rectangle];
      CGFloat v80 = v79;
      CGFloat v82 = v81;
      CGFloat v84 = v83;
      CGFloat v86 = v85;
      [v8 magnification];
      CGFloat v88 = v87;
      v183.origin.CGFloat x = v80;
      v183.origin.CGFloat y = v82;
      v183.size.double width = v84;
      v183.size.double height = v86;
      double MidX = CGRectGetMidX(v183);
      v184.origin.CGFloat x = v80;
      v184.origin.CGFloat y = v82;
      v184.size.double width = v84;
      v184.size.double height = v86;
      double MidY = CGRectGetMidY(v184);
      long long v162 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&v177.a = *MEMORY[0x263F000D0];
      long long v163 = *(_OWORD *)&v177.a;
      *(_OWORD *)&v177.c = v162;
      *(_OWORD *)&v177.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      long long v161 = *(_OWORD *)&v177.tx;
      CGAffineTransformMakeTranslation(&t2, -MidX, -MidY);
      *(_OWORD *)&t1.a = v163;
      *(_OWORD *)&t1.c = v162;
      *(_OWORD *)&t1.tCGFloat x = v161;
      CGAffineTransformConcat(&v177, &t1, &t2);
      CGAffineTransformMakeScale(&v174, v88, v88);
      CGAffineTransform v173 = v177;
      CGAffineTransformConcat(&t1, &v173, &v174);
      CGAffineTransform v177 = t1;
      CGAffineTransformMakeTranslation(&v172, MidX, MidY);
      CGAffineTransform v173 = v177;
      CGAffineTransformConcat(&t1, &v173, &v172);
      CGAffineTransform v177 = t1;
      v185.origin.CGFloat y = v154;
      v185.origin.CGFloat x = v155;
      v185.size.double width = v76;
      v185.size.double height = v78;
      CGRect v186 = CGRectApplyAffineTransform(v185, &t1);
      objc_msgSend(v10, "convertRectFromModelToOverlay:", v186.origin.x, v186.origin.y, v186.size.width, v186.size.height);
      double v92 = v91;
      double v94 = v93;
      double v96 = v95;
      double v98 = v97;
      v99 = [v10 overlayView];
      v100 = [v99 layer];
      v101 = [v9 superlayer];
      objc_msgSend(v100, "convertRect:toLayer:", v101, v92, v94, v96, v98);
      double v103 = v102;
      double v105 = v104;
      double v107 = v106;
      double v109 = v108;

      objc_msgSend(v9, "setFrame:", v103, v105, v107, v109);
      v110 = [v9 mask];
      [v9 bounds];
      objc_msgSend(v110, "setFrame:");
      +[AKLoupeAnnotationRenderer innerClipRect:v8];
      objc_msgSend(v10, "convertRectFromModelToOverlay:");
      double v112 = v111;
      double v114 = v113;
      double v116 = v115;
      double v118 = v117;
      v119 = v157;
      v120 = [v157 layer];
      objc_msgSend(v120, "convertRect:toLayer:", v9, v112, v114, v116, v118);
      double v122 = v121;
      double v124 = v123;
      double v126 = v125;
      double v128 = v127;

      objc_msgSend(v9, "convertRect:toLayer:", v110, v122, v124, v126, v128);
      v129 = CGPathCreateWithEllipseInRect(v187, 0);
      [v110 setPath:v129];
      CGPathRelease(v129);

      if (v63)
      {
        id v156 = v9;
        double v130 = v147 * v146 * v144;
        double v148 = round(v147 * v146 * v145);
        CGFloat v131 = round(v130);
        [v9 setContents:v63];
        CGImageRelease(v63);
        v182.double width = v148;
        v182.double height = v131;
        UIGraphicsBeginImageContext(v182);
        CurrentContext = UIGraphicsGetCurrentContext();
        *(_OWORD *)&v177.a = v163;
        *(_OWORD *)&v177.c = v162;
        *(_OWORD *)&v177.tCGFloat x = v161;
        +[AKGeometryHelper verticalFlipTransformForRect:](AKGeometryHelper, "verticalFlipTransformForRect:", v150, v149, v153, v152);
        *(_OWORD *)&t1.a = v163;
        *(_OWORD *)&t1.c = v162;
        *(_OWORD *)&t1.tCGFloat x = v161;
        CGAffineTransformConcat(&v177, &t1, &v171);
        v188.origin.CGFloat x = v151;
        v188.origin.CGFloat y = v160;
        v188.size.double width = v159;
        v188.size.double height = v158;
        CGFloat v133 = -CGRectGetMidX(v188);
        v189.origin.CGFloat x = v151;
        v189.origin.CGFloat y = v160;
        v189.size.double width = v159;
        v189.size.double height = v158;
        CGFloat v134 = CGRectGetMidY(v189);
        CGAffineTransformMakeTranslation(&v170, v133, -v134);
        CGAffineTransform v173 = v177;
        CGAffineTransformConcat(&t1, &v173, &v170);
        CGAffineTransform v177 = t1;
        CGAffineTransformMakeScale(&v169, v148 / v153, v131 / v152);
        CGAffineTransform v173 = v177;
        CGAffineTransformConcat(&t1, &v173, &v169);
        CGAffineTransform v177 = t1;
        CGAffineTransformMakeTranslation(&v168, v148 * 0.5, v131 * 0.5);
        CGAffineTransform v173 = v177;
        CGAffineTransformConcat(&t1, &v173, &v168);
        CGAffineTransform v177 = t1;
        CGContextConcatCTM(CurrentContext, &t1);
        v135 = [v10 annotationsBeneathLoupe:v8];
        long long v164 = 0u;
        long long v165 = 0u;
        long long v166 = 0u;
        long long v167 = 0u;
        uint64_t v136 = [v135 countByEnumeratingWithState:&v164 objects:v180 count:16];
        if (v136)
        {
          uint64_t v137 = v136;
          uint64_t v138 = *(void *)v165;
          do
          {
            for (uint64_t i = 0; i != v137; ++i)
            {
              if (*(void *)v165 != v138) {
                objc_enumerationMutation(v135);
              }
              v140 = *(void **)(*((void *)&v164 + 1) + 8 * i);
              CGContextSaveGState(CurrentContext);
              [v140 integralDrawingBounds];
              CGFloat x = v190.origin.x;
              CGFloat y = v190.origin.y;
              if (!CGRectIsInfinite(v190)) {
                CGContextTranslateCTM(CurrentContext, x, y);
              }
              +[AKController renderAnnotation:v140 inContext:CurrentContext];
              CGContextRestoreGState(CurrentContext);
            }
            uint64_t v137 = [v135 countByEnumeratingWithState:&v164 objects:v180 count:16];
          }
          while (v137);
        }
        v143 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        objc_setAssociatedObject(v8, off_268922A80, v143, (void *)0x301);

        id v9 = v156;
        v119 = v157;
      }
      else
      {
        [a1 updateModelImageOnLoupeAnnotation:v8 onPageController:v10];
      }
    }
    else
    {
      [a1 updateModelImageOnLoupeAnnotation:v8 onPageController:v10];
    }
  }
  else
  {
    [a1 updateModelImageOnLoupeAnnotation:v8 onPageController:v10];
  }
}

+ (CGAffineTransform)transformForFastPathLayer:(SEL)a3 ofLoupeAnnotation:(id)a4 onPageController:(id)a5
{
  id v8 = a6;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_23767BE38;
  v22[3] = &unk_264CDB6A0;
  id v23 = v8;
  id v9 = v8;
  id v10 = a4;
  int64_t v11 = +[AKGeometryHelper exifOrientationWithConversionBlock:v22];
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  [v10 frame];
  double MidX = CGRectGetMidX(v24);
  [v10 frame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v25.origin.CGFloat x = v14;
  v25.origin.CGFloat y = v16;
  v25.size.double width = v18;
  v25.size.double height = v20;
  +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", v11, MidX, CGRectGetMidY(v25));

  return result;
}

@end