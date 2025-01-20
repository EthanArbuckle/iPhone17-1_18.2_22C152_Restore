@interface AKTextAnnotationRenderHelper
+ (BOOL)_hitTestPoint:(CGPoint)a3 againstActualTextForAnnotation:(id)a4 onPageController:(id)a5 contextForVisualDebugging:(CGContext *)a6;
+ (BOOL)hitTestPoint:(CGPoint)a3 againstActualTextForAnnotation:(id)a4 onPageController:(id)a5;
+ (CGSize)unconstrainedSizeForText:(id)a3;
+ (id)_sharedLayoutManager;
+ (void)getAnnotationRectangle:(CGRect *)a3 textBounds:(CGRect *)a4 containerSize:(CGSize *)a5 exclusionPaths:(id *)a6 isTextClipped:(BOOL *)a7 forAnnotation:(id)a8 onPageController:(id)a9 orInContext:(CGContext *)a10 shouldAlignToPixels:(BOOL)a11 optionalText:(id)a12 optionalCenter:(CGPoint)a13 optionalProposedRectangle:(CGRect)a14;
+ (void)renderAnnotationText:(id)a3 intoContext:(CGContext *)a4 isForScreen:(BOOL)a5 pageControllerOrNil:(id)a6;
@end

@implementation AKTextAnnotationRenderHelper

+ (void)getAnnotationRectangle:(CGRect *)a3 textBounds:(CGRect *)a4 containerSize:(CGSize *)a5 exclusionPaths:(id *)a6 isTextClipped:(BOOL *)a7 forAnnotation:(id)a8 onPageController:(id)a9 orInContext:(CGContext *)a10 shouldAlignToPixels:(BOOL)a11 optionalText:(id)a12 optionalCenter:(CGPoint)a13 optionalProposedRectangle:(CGRect)a14
{
  CGFloat height = a14.size.height;
  CGFloat width = a14.size.width;
  CGFloat y = a14.origin.y;
  CGFloat x = a14.origin.x;
  double v22 = a13.y;
  double v23 = a13.x;
  v191[1] = *MEMORY[0x263EF8340];
  id v25 = a8;
  id v26 = a9;
  id v27 = a12;
  v164 = a4;
  v165 = a5;
  v167 = a3;
  unint64_t v28 = (unint64_t)a3 | (unint64_t)a4 | (unint64_t)a5;
  BOOL v29 = v28 != 0;
  if (!v28 && !a6 && !a7)
  {
    v30 = 0;
    goto LABEL_142;
  }
  CGFloat v160 = x;
  CGFloat v169 = y;
  CGFloat v182 = width;
  double v31 = *MEMORY[0x263F001A8];
  double v32 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v34 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v33 = *(double *)(MEMORY[0x263F001A8] + 24);
  int v35 = [v25 conformsToAKRectangularAnnotationProtocol];
  v36 = (double *)MEMORY[0x263F00148];
  CGFloat v154 = v33;
  CGFloat v156 = v32;
  double v179 = v33;
  double v37 = v34;
  CGFloat v158 = v31;
  CGFloat rect1 = height;
  if (v35)
  {
    v211.origin.CGFloat x = v31;
    double v31 = v160;
    v192.origin.CGFloat x = v160;
    double v32 = y;
    v192.origin.CGFloat y = y;
    double v37 = v182;
    v192.size.CGFloat width = v182;
    v192.size.CGFloat height = height;
    v211.size.CGFloat height = v154;
    v211.origin.CGFloat y = v156;
    v211.size.CGFloat width = v34;
    if (CGRectEqualToRect(v192, v211))
    {
      [v25 rectangle];
      double v31 = v38;
      double v32 = v39;
      double v37 = v40;
      double v179 = v41;
      if (v23 != *v36 || v22 != v36[1])
      {
        double v180 = v22;
        CGFloat v43 = v38;
        CGFloat v44 = v39;
        double v45 = v23 - CGRectGetWidth(*(CGRect *)&v38) * 0.5;
        v193.origin.CGFloat x = v43;
        v193.origin.CGFloat y = v44;
        v193.size.CGFloat width = v37;
        v193.size.CGFloat height = v179;
        double v46 = v180 - CGRectGetHeight(v193) * 0.5;
        v194.origin.CGFloat x = v43;
        v194.origin.CGFloat y = v44;
        v194.size.CGFloat width = v37;
        v194.size.CGFloat height = v179;
        double txa = CGRectGetWidth(v194);
        v195.origin.CGFloat x = v43;
        double v22 = v180;
        v195.origin.CGFloat y = v44;
        v195.size.CGFloat width = v37;
        v195.size.CGFloat height = v179;
        double v179 = CGRectGetHeight(v195);
        double v37 = txa;
        double v31 = v45;
        double v32 = v46;
        +[AKAnnotationRenderer textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:](AKAnnotationRenderer, "textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:", v25, v27, v31, v46, txa, v179);
        goto LABEL_14;
      }
    }
    else
    {
      double v179 = height;
    }
  }
  +[AKAnnotationRenderer textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:](AKAnnotationRenderer, "textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:", v25, v27, v31, v32, v37, v179);
LABEL_14:
  double MidY = v48;
  tCGFloat x = v47;
  double v171 = v49;
  double v173 = v50;
  BOOL v51 = +[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:");
  if (v51)
  {
    v196.origin.CGFloat x = v31;
    v196.origin.CGFloat y = v32;
    v196.size.CGFloat width = v37;
    v196.size.CGFloat height = v179;
    tCGFloat x = CGRectGetMidX(v196);
    v197.origin.CGFloat x = v31;
    v197.origin.CGFloat y = v32;
    v197.size.CGFloat width = v37;
    v197.size.CGFloat height = v179;
    double MidY = CGRectGetMidY(v197);
    double v171 = 0.0;
    double v173 = 0.0;
  }
  v153 = v26;
  double MidX = v23;
  BOOL v53 = v22 != v36[1] || v23 != *v36;
  double v166 = v37;
  double v162 = v31;
  if (!v53)
  {
    int v54 = [v25 conformsToAKRectangularAnnotationProtocol];
    if (v54) {
      CGFloat v55 = v31;
    }
    else {
      CGFloat v55 = tx;
    }
    double v56 = v32;
    if (v54)
    {
      CGFloat v57 = v166;
    }
    else
    {
      double v32 = MidY;
      CGFloat v57 = v171;
    }
    if (v54) {
      CGFloat v58 = v179;
    }
    else {
      CGFloat v58 = v173;
    }
    v198.origin.CGFloat x = v55;
    v198.origin.CGFloat y = v32;
    v198.size.CGFloat width = v57;
    v198.size.CGFloat height = v58;
    double MidX = CGRectGetMidX(v198);
    v199.origin.CGFloat x = v55;
    v199.origin.CGFloat y = v32;
    double v32 = v56;
    double v37 = v166;
    v199.size.CGFloat width = v57;
    v199.size.CGFloat height = v58;
    double v22 = CGRectGetMidY(v199);
  }
  uint64_t v145 = [v25 originalExifOrientation];
  int64_t v144 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:");
  double v146 = MidX;
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", tx, MidY, v171, v173, MidX, v22);
  double v168 = v59;
  double v181 = v60;
  CGFloat rect = v61;
  double v63 = v62;
  v212.origin.CGFloat x = v158;
  v200.origin.CGFloat x = v160;
  v200.origin.CGFloat y = v169;
  v200.size.CGFloat width = v182;
  v200.size.CGFloat height = rect1;
  v212.size.CGFloat height = v154;
  v212.origin.CGFloat y = v156;
  v212.size.CGFloat width = v34;
  BOOL v64 = CGRectEqualToRect(v200, v212);
  BOOL v65 = v53 && v64;
  if (v53 && v64)
  {
    int v170 = 0;
    int rect1a = 0;
  }
  else
  {
    BOOL v66 = v64;
    int v170 = [v25 textIsFixedHeight];
    if (v66) {
      int v67 = [v25 textIsFixedWidth] | a11;
    }
    else {
      int v67 = 1;
    }
    int rect1a = v67;
  }
  v159 = a6;
  if (v27)
  {
    id v68 = v27;
  }
  else
  {
    id v68 = +[AKTextAnnotationAttributeHelper actualOrPlaceholderTextOfAnnotation:v25];
    if (!v68) {
      goto LABEL_41;
    }
  }
  if ([v68 length])
  {
    char v69 = 0;
    goto LABEL_42;
  }
LABEL_41:
  [v25 typingAttributes];
  v71 = id v70 = v25;
  id v72 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithString:@"|" attributes:v71];

  id v25 = v70;
  char v69 = 1;
  id v68 = v72;
LABEL_42:
  id v149 = v27;
  if ([v68 length]) {
    [v68 attributesAtIndex:0 effectiveRange:0];
  }
  else {
  uint64_t v73 = [v25 typingAttributes];
  }
  [v25 originalModelBaseScaleFactor];
  v157 = (void *)v73;
  v161 = +[AKTextAnnotationAttributeHelper typingAttributes:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "typingAttributes:byApplyingScaleFactor:", v73);
  [v25 originalModelBaseScaleFactor];
  id v74 = +[AKTextAnnotationAttributeHelper newTextStorage:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "newTextStorage:byApplyingScaleFactor:", v68);

  v75 = +[AKAnnotationRenderer newTextExclusionPathForAnnotation:withOptionalAnnotationRect:](AKAnnotationRenderer, "newTextExclusionPathForAnnotation:withOptionalAnnotationRect:", v25, v31, v32, v37, v179);
  v150 = a7;
  if (v75)
  {
    v76 = v75;
    if (CGPathIsEmpty(v75))
    {
      CGPathRelease(v76);
      v77 = 0;
      v78 = v159;
      goto LABEL_49;
    }
    Mutable = CGPathCreateMutable();
    memset(&m, 0, sizeof(m));
    +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", v145, MidX, v22);
    CGPathAddPath(Mutable, &m, v76);
    v203.origin.CGFloat x = v168;
    v203.origin.CGFloat y = v181;
    v203.size.CGFloat width = rect;
    v203.size.CGFloat height = v63;
    CGRect v204 = CGRectInset(v203, -1000.0, -1000.0);
    CGPathAddRect(Mutable, 0, v204);
    v77 = [MEMORY[0x263F1C478] bezierPathWithCGPath:Mutable];
    CGPathRelease(Mutable);
    memset(&v188, 0, sizeof(v188));
    v205.origin.CGFloat x = v168;
    v205.origin.CGFloat y = v181;
    v205.size.CGFloat width = rect;
    v205.size.CGFloat height = v63;
    CGFloat v86 = -CGRectGetMinX(v205);
    v206.origin.CGFloat x = v168;
    v206.origin.CGFloat y = v181;
    v206.size.CGFloat width = rect;
    v206.size.CGFloat height = v63;
    CGFloat MinY = CGRectGetMinY(v206);
    CGAffineTransformMakeTranslation(&v188, v86, -MinY);
    CGAffineTransformMakeScale(&t2, 1.0, -1.0);
    CGAffineTransform t1 = v188;
    CGAffineTransformConcat(&v187, &t1, &t2);
    CGAffineTransform v188 = v187;
    v207.origin.CGFloat x = v168;
    v207.origin.CGFloat y = v181;
    v207.size.CGFloat width = rect;
    v207.size.CGFloat height = v63;
    CGFloat v88 = CGRectGetHeight(v207);
    CGAffineTransformMakeTranslation(&v184, 0.0, v88);
    CGAffineTransform t1 = v188;
    CGAffineTransformConcat(&v187, &t1, &v184);
    CGAffineTransform v188 = v187;
    [v77 applyTransform:&v187];
    [v77 setUsesEvenOddFillRule:1];
    CGPathRelease(v76);
    v78 = v159;
    if (!v51) {
      goto LABEL_52;
    }
LABEL_49:
    v201.origin.CGFloat x = tx;
    v201.origin.CGFloat y = MidY;
    v201.size.CGFloat width = v171;
    v201.size.CGFloat height = v173;
    double MinX = CGRectGetMidX(v201);
    v202.origin.CGFloat x = tx;
    v202.origin.CGFloat y = MidY;
    v202.size.CGFloat width = v171;
    v202.size.CGFloat height = v173;
    double v79 = CGRectGetMidY(v202);
    v30 = 0;
    double v81 = *MEMORY[0x263F001B0];
    double v80 = *(double *)(MEMORY[0x263F001B0] + 8);
    double v82 = 0.0;
    char v83 = 1;
    double v84 = 0.0;
    id v26 = v153;
    if ((v69 & 1) == 0) {
      goto LABEL_129;
    }
    goto LABEL_130;
  }
  v77 = 0;
  v78 = v159;
  if (v51) {
    goto LABEL_49;
  }
LABEL_52:
  char v89 = rect1a ^ 1;
  if (!v153) {
    char v89 = 0;
  }
  if (v89)
  {
    [v153 maxPageRect];
    double v172 = v90;
  }
  else
  {
    v208.origin.CGFloat x = v168;
    v208.origin.CGFloat y = v181;
    v208.size.CGFloat width = rect;
    v208.size.CGFloat height = v63;
    double v172 = CGRectGetWidth(v208);
  }
  id v91 = a1;
  if (!v77)
  {
    [a1 unconstrainedSizeForText:v74];
    double v93 = v172;
    if (v172 >= v92) {
      double v93 = v92;
    }
    double v172 = v93;
  }
  char v152 = v69;
  id v142 = v25;
  double v143 = v32;
  BOOL v141 = v29;
  if (v65)
  {
    uint64_t v174 = 1;
  }
  else
  {
    uint64_t v94 = [v74 length];
    uint64_t v95 = *MEMORY[0x263F1C268];
    if (!v94
      || ([v74 attribute:*MEMORY[0x263F1C268] atIndex:0 effectiveRange:0],
          (v96 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v96 = [v161 objectForKey:v95];
      if (!v96)
      {
        v96 = [MEMORY[0x263F1C358] defaultParagraphStyle];
      }
    }
    uint64_t v174 = [v96 alignment];
  }
  int v97 = v170;
  id v140 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" attributes:v161];
  objc_msgSend(v91, "unconstrainedSizeForText:");
  double v99 = v98;
  CGFloat v155 = v63;
  double v100 = v98 * floor(v63 / v98);
  v101 = [v91 _sharedLayoutManager];
  v102 = [v101 textContainers];
  v103 = [v102 objectAtIndex:0];

  objc_msgSend(v103, "akSetContainerSize:", v172, 10000000.0);
  [v103 setExclusionPaths:MEMORY[0x263EFFA68]];
  v176 = [MEMORY[0x263EFF9C0] set];
  char v83 = 0;
  char v104 = 0;
  uint64_t v105 = 9;
  double v82 = v99;
  while (1)
  {
    double v79 = v22 + v82 * -0.5;
    if (v77)
    {
      v30 = (void *)[v77 copy];
      memset(&m, 0, sizeof(m));
      CGAffineTransformMakeTranslation(&m, v168 - (v146 + v172 * -0.5), v181 - v79);
      CGAffineTransform v188 = m;
      [v30 applyTransform:&v188];
      v191[0] = v30;
      v106 = [MEMORY[0x263EFF8C0] arrayWithObjects:v191 count:1];
      [v103 setExclusionPaths:v106];

LABEL_71:
      double MinX = v146 + v172 * -0.5;
      goto LABEL_72;
    }
    if (v174 == 2)
    {
      v210.origin.CGFloat x = v168;
      v210.origin.CGFloat y = v181;
      v210.size.CGFloat width = rect;
      v210.size.CGFloat height = v155;
      v30 = 0;
      double MinX = CGRectGetMaxX(v210) - v172;
    }
    else
    {
      if (v174)
      {
        v30 = 0;
        goto LABEL_71;
      }
      v209.origin.CGFloat x = v168;
      v209.origin.CGFloat y = v181;
      v209.size.CGFloat width = rect;
      v209.size.CGFloat height = v155;
      double MinX = CGRectGetMinX(v209);
      v30 = 0;
    }
LABEL_72:
    if (v83) {
      goto LABEL_101;
    }
    double v107 = v22;
    [v74 addLayoutManager:v101];
    [v101 glyphRangeForTextContainer:v103];
    [v101 usedRectForTextContainer:v103];
    double v109 = v108;
    [v74 removeLayoutManager:v101];
    if (vabdd_f64(v82 / v99, ceil(v109 / v99)) < 0.0005)
    {
      int v110 = 1;
      double v111 = v82;
      goto LABEL_92;
    }
    if (v82 >= v109)
    {
      if (v104)
      {
        int v110 = 1;
        double v111 = v82;
        char v104 = 1;
        goto LABEL_92;
      }
      char v104 = 0;
      unint64_t v115 = vcvtpd_u64_f64((v82 - v109) / v99);
      if (v115 <= 1) {
        unint64_t v115 = 1;
      }
      double v111 = v82 - (double)v115 * v99;
LABEL_90:
      v116 = [NSNumber numberWithDouble:v111];
      [v176 addObject:v116];

      int v110 = 0;
      goto LABEL_91;
    }
    unint64_t v112 = vcvtpd_u64_f64((v109 - v82) / v99);
    if (v112 <= 1) {
      unint64_t v112 = 1;
    }
    double v111 = v82 + (double)v112 * v99;
    v113 = [NSNumber numberWithDouble:v111];
    char v114 = [v176 containsObject:v113];

    if ((v114 & 1) == 0) {
      goto LABEL_90;
    }
    int v110 = 0;
    char v104 = 1;
LABEL_91:
    int v97 = v170;
LABEL_92:
    if ((v110 & v97 & (v111 > v100)) != 0) {
      char v83 = 1;
    }
    if (!v105 || (v110 & !((v110 & v97) & (v111 > v100))) != 0) {
      break;
    }
    if ((v110 & v97 & (v111 > v100)) != 0) {
      double v82 = v100;
    }
    else {
      double v82 = v111;
    }

    --v105;
    double v22 = v107;
  }
  double v22 = v107;
LABEL_101:
  double v117 = 0.0;
  id v25 = v142;
  char v118 = v152;
  double v84 = v172;
  if (!v141)
  {
    double v80 = 0.0;
    double v81 = 0.0;
    double v179 = 0.0;
    double v143 = 0.0;
    double v128 = 0.0;
LABEL_127:
    v137 = v140;
    goto LABEL_128;
  }
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v145, MinX, v79, v172, v82, v146, v22);
  double v79 = v120;
  double v84 = v121;
  double v82 = v122;
  if (a11)
  {
    v123 = v142;
    +[AKGeometryHelper renderingAlignedTextRectForRect:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:](AKGeometryHelper, "renderingAlignedTextRectForRect:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:", v153, a10, v142);
    double MinX = v124;
    double v79 = v125;
    double v84 = v126;
    double v82 = v127;
  }
  else
  {
    double MinX = v119;
    v123 = v142;
  }
  BOOL v129 = +[AKGeometryHelper exifOrientationHasReversedAxes:v144];
  if (v129) {
    double v80 = v84;
  }
  else {
    double v80 = v82;
  }
  if (v129) {
    double v81 = v82;
  }
  else {
    double v81 = v84;
  }
  if (!v167)
  {
    double v179 = 0.0;
    double v143 = 0.0;
    double v128 = 0.0;
LABEL_126:
    id v25 = v123;
    char v118 = v152;
    goto LABEL_127;
  }
  BOOL v130 = v129;
  int v131 = v97 ^ 1;
  int v132 = rect1a ^ 1;
  if ((v131 & 1) == 0 && !v132)
  {
    double v117 = v166;
    goto LABEL_125;
  }
  +[AKAnnotationRenderer rectangleForAnnotation:withTextBounds:](AKAnnotationRenderer, "rectangleForAnnotation:withTextBounds:", v123, MinX, v79, v84, v82);
  if ((v130 | v132) != 1)
  {
    double v179 = v136;
    double v117 = v166;
    double v143 = v134;
LABEL_125:
    double v128 = v162;
    goto LABEL_126;
  }
  v137 = v140;
  if (v131 | !v130)
  {
    double v128 = v133;
    double v117 = v135;
    int v138 = v130 | v131;
    char v118 = v152;
    if (v138 == 1 && (!v130 || !rect1a))
    {
      double v179 = v136;
      double v143 = v134;
    }
    id v25 = v123;
  }
  else
  {
    double v179 = v136;
    double v117 = v166;
    double v143 = v134;
    double v128 = v162;
    id v25 = v123;
    char v118 = v152;
  }
LABEL_128:

  double v166 = v117;
  double v162 = v128;
  id v26 = v153;
  v78 = v159;
  double v32 = v143;
  if (v118)
  {
LABEL_130:
    char v83 = 0;
    goto LABEL_131;
  }
LABEL_129:
  if (![v74 length]) {
    goto LABEL_130;
  }
LABEL_131:

  if (v167)
  {
    v167->origin.CGFloat x = v162;
    v167->origin.CGFloat y = v32;
    v167->size.CGFloat width = v166;
    v167->size.CGFloat height = v179;
  }
  id v27 = v149;
  if (v164)
  {
    v164->origin.CGFloat x = MinX;
    v164->origin.CGFloat y = v79;
    v164->size.CGFloat width = v84;
    v164->size.CGFloat height = v82;
  }
  if (v165)
  {
    v165->CGFloat width = ceil(v81);
    v165->CGFloat height = ceil(v80);
  }
  if (!v78)
  {
LABEL_140:
    if (!v150) {
      goto LABEL_142;
    }
LABEL_141:
    BOOL *v150 = v83 & 1;
    goto LABEL_142;
  }
  if (v30)
  {
    v190 = v30;
    id v139 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v190 count:1];
    id *v78 = v139;

    goto LABEL_140;
  }
  id *v78 = 0;
  if (v150) {
    goto LABEL_141;
  }
LABEL_142:
}

+ (BOOL)hitTestPoint:(CGPoint)a3 againstActualTextForAnnotation:(id)a4 onPageController:(id)a5
{
  return MEMORY[0x270F9A6D0](a1, sel__hitTestPoint_againstActualTextForAnnotation_onPageController_contextForVisualDebugging_);
}

+ (BOOL)_hitTestPoint:(CGPoint)a3 againstActualTextForAnnotation:(id)a4 onPageController:(id)a5 contextForVisualDebugging:(CGContext *)a6
{
  double y = a3.y;
  double x = a3.x;
  id v11 = a4;
  id v12 = a5;
  v13 = +[AKTextAnnotationAttributeHelper actualOrPlaceholderTextOfAnnotation:v11];
  if (![v13 length])
  {
    if ([v11 isMemberOfClass:objc_opt_class()])
    {
      v36 = [v11 typingAttributes];
      [v11 originalModelBaseScaleFactor];
      double v37 = +[AKTextAnnotationAttributeHelper typingAttributes:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "typingAttributes:byApplyingScaleFactor:", v36);

      id v38 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithString:@"AAAA" attributes:v37];
      +[AKAnnotationRenderer textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:](AKAnnotationRenderer, "textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:", v11, v38, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      v75.double x = x;
      v75.double y = y;
      BOOL v35 = CGRectContainsPoint(v78, v75);

      goto LABEL_23;
    }
LABEL_12:
    BOOL v35 = 0;
    goto LABEL_23;
  }
  memset(&v71, 0, sizeof(v71));
  double v69 = 0.0;
  double v70 = 0.0;
  id v68 = 0;
  LOBYTE(v57) = 0;
  +[AKTextAnnotationRenderHelper getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:](AKTextAnnotationRenderHelper, "getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:", 0, &v71, &v69, &v68, 0, v11, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24), v12, 0, v57, v13);
  id v14 = v68;
  if ([v11 conformsToAKRotatableAnnotationProtocol])
  {
    memset(&m, 0, sizeof(m));
    [v11 rotationAngle];
    +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", *(_OWORD *)&v71.origin, *(_OWORD *)&v71.size, v15);
    CGAffineTransform v65 = m;
    CGAffineTransformInvert(&t1, &v65);
    CGAffineTransform m = t1;
    double v16 = y * t1.d + t1.b * x;
    double x = t1.tx + y * t1.c + t1.a * x;
    double y = t1.ty + v16;
  }
  v74.double x = x;
  v74.double y = y;
  if (!CGRectContainsPoint(v71, v74))
  {

    goto LABEL_12;
  }
  if ([v14 count]
    && ([v14 firstObject],
        v17 = objc_claimAutoreleasedReturnValue(),
        v18 = (const CGPath *)[v17 newCGPathForPlatformBezierPath],
        v17,
        v18))
  {
    uint64_t v19 = [v11 originalExifOrientation];
    int64_t v20 = +[AKGeometryHelper inverseExifOrientation:v19];
    double MidX = CGRectGetMidX(v71);
    double MidY = CGRectGetMidY(v71);
    +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v19, *(_OWORD *)&v71.origin, *(_OWORD *)&v71.size, MidX, MidY);
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    long long v30 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&m.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&m.c = v30;
    *(_OWORD *)&m.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    *(CGFloat *)&long long v30 = v25;
    CGFloat Height = CGRectGetHeight(*(CGRect *)&v22);
    CGAffineTransformMakeTranslation(&t2, 0.0, -Height);
    CGAffineTransform t1 = m;
    CGAffineTransformConcat(&m, &t1, &t2);
    CGAffineTransformMakeScale(&v63, 1.0, -1.0);
    CGAffineTransform v65 = m;
    CGAffineTransformConcat(&t1, &v65, &v63);
    CGAffineTransform m = t1;
    memset(&t1, 0, sizeof(t1));
    v76.origin.double x = v23;
    v76.origin.double y = v25;
    v76.size.CGFloat width = v27;
    v76.size.CGFloat height = v29;
    CGFloat MinX = CGRectGetMinX(v76);
    v77.origin.double x = v23;
    v77.origin.double y = v25;
    v77.size.CGFloat width = v27;
    v77.size.CGFloat height = v29;
    CGFloat MinY = CGRectGetMinY(v77);
    CGAffineTransformMakeTranslation(&t1, MinX, MinY);
    CGAffineTransform v62 = m;
    CGAffineTransform v61 = t1;
    CGAffineTransformConcat(&v65, &v62, &v61);
    CGAffineTransform m = v65;
    memset(&v65, 0, sizeof(v65));
    +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", v20, MidX, MidY);
    CGAffineTransform v61 = m;
    CGAffineTransform v60 = v65;
    CGAffineTransformConcat(&v62, &v61, &v60);
    CGAffineTransform m = v62;
    Mutable = CGPathCreateMutable();
    CGPathAddPath(Mutable, &m, v18);
    CGPathRelease(v18);
    v72.double x = x;
    v72.double y = y;
    if (CGPathContainsPoint(Mutable, 0, v72, 1))
    {
      CGPathRelease(Mutable);
      BOOL v35 = 0;
    }
    else
    {
      id v40 = v13;
      double v41 = [a1 _sharedLayoutManager];
      v42 = [v41 textContainers];
      CGFloat v43 = [v42 objectAtIndex:0];

      objc_msgSend(v43, "akSetContainerSize:", v69, v70);
      [v43 setExclusionPaths:v14];
      [v40 addLayoutManager:v41];
      [v41 glyphRangeForTextContainer:v43];
      [v41 usedRectForTextContainer:v43];
      CGFloat v45 = v44;
      CGFloat v47 = v46;
      CGFloat v49 = v48;
      CGFloat v51 = v50;
      [v40 removeLayoutManager:v41];
      v79.origin.double x = v45;
      v79.origin.double y = v47;
      v79.size.CGFloat width = v49;
      v79.size.CGFloat height = v51;
      CGPathRef v52 = CGPathCreateWithRect(v79, &m);
      if (v52)
      {
        BOOL v53 = v52;
        if (a6)
        {
          [MEMORY[0x263F1C550] blueColor];
          id v59 = v40;
          id v54 = objc_claimAutoreleasedReturnValue();
          CGContextSetFillColorWithColor(a6, (CGColorRef)[v54 CGColor]);

          CGContextAddPath(a6, v53);
          CGContextFillPath(a6);
          id v55 = [MEMORY[0x263F1C550] redColor];
          CGContextSetFillColorWithColor(a6, (CGColorRef)[v55 CGColor]);

          id v40 = v59;
          CGContextAddPath(a6, Mutable);
          CGContextEOFillPath(a6);
        }
        v73.double x = x;
        v73.double y = y;
        BOOL v35 = CGPathContainsPoint(v53, 0, v73, 0);
        CGPathRelease(v53);
      }
      else
      {
        BOOL v35 = 0;
      }
      CGPathRelease(Mutable);
    }
  }
  else
  {
    if (a6)
    {
      id v39 = [MEMORY[0x263F1C550] blueColor];
      CGContextSetFillColorWithColor(a6, (CGColorRef)[v39 CGColor]);

      CGContextFillRect(a6, v71);
    }
    BOOL v35 = 1;
  }

LABEL_23:
  return v35;
}

+ (CGSize)unconstrainedSizeForText:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [a1 _sharedLayoutManager];
    v6 = [v5 textContainers];
    v7 = [v6 objectAtIndex:0];

    objc_msgSend(v7, "akSetContainerSize:", 10000000.0, 10000000.0);
    [v7 setExclusionPaths:MEMORY[0x263EFFA68]];
    [v4 addLayoutManager:v5];
    [v5 glyphRangeForTextContainer:v7];
    [v5 usedRectForTextContainer:v7];
    double v9 = v8;
    double v11 = v10;
    [v4 removeLayoutManager:v5];
  }
  else
  {
    double v9 = *MEMORY[0x263F001B0];
    double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  double v12 = v9;
  double v13 = v11;
  result.CGFloat height = v13;
  result.CGFloat width = v12;
  return result;
}

+ (void)renderAnnotationText:(id)a3 intoContext:(CGContext *)a4 isForScreen:(BOOL)a5 pageControllerOrNil:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  if (!v7 || ([v10 isEditingText] & 1) == 0)
  {
    double v12 = +[AKTextAnnotationAttributeHelper actualOrPlaceholderTextOfAnnotation:v10];
    if ([v12 length])
    {
      if (v7) {
        id v13 = v11;
      }
      else {
        id v13 = 0;
      }
      if (v7) {
        id v14 = 0;
      }
      else {
        id v14 = a4;
      }
      long long v46 = 0u;
      *(_OWORD *)CGFloat v47 = 0u;
      double v44 = 0.0;
      double v45 = 0.0;
      id v43 = 0;
      LOBYTE(v31) = 1;
      +[AKTextAnnotationRenderHelper getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:](AKTextAnnotationRenderHelper, "getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:", 0, &v46, &v44, &v43, 0, v10, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24), v13, v14, v31, v12);
      id v15 = v43;
      if (v44 > 0.5 && v45 > 0.5)
      {
        UIGraphicsPushContext(a4);
        CGContextSaveGState(a4);
        CGContextSetShouldSmoothFonts(a4, 0);
        CGContextSetShouldSubpixelPositionFonts(a4, 1);
        CGContextSetShouldSubpixelQuantizeFonts(a4, 1);
        double v16 = [a1 _sharedLayoutManager];
        v17 = [v16 textContainers];
        v18 = [v17 firstObject];

        objc_msgSend(v18, "akSetContainerSize:", v44, v45);
        [v18 setExclusionPaths:v15];
        [v10 originalModelBaseScaleFactor];
        id v19 = +[AKTextAnnotationAttributeHelper newTextStorage:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "newTextStorage:byApplyingScaleFactor:", v12);
        [v19 addLayoutManager:v16];
        uint64_t v20 = [v16 glyphRangeForTextContainer:v18];
        if (v21)
        {
          uint64_t v35 = v21;
          uint64_t v36 = v20;
          double y = *((double *)&v46 + 1);
          double x = *(double *)&v46;
          CGFloat height = v47[1];
          CGFloat width = v47[0];
          if ([v10 conformsToAKRectangularAnnotationProtocol])
          {
            [v10 rectangle];
            v51.origin.double x = v26;
            v51.origin.double y = v27;
            v51.size.CGFloat width = v28;
            v51.size.CGFloat height = v29;
            v48.origin.double x = x;
            v48.origin.double y = y;
            v48.size.CGFloat width = width;
            v48.size.CGFloat height = height;
            CGRect v49 = CGRectIntersection(v48, v51);
            double x = v49.origin.x;
            double y = v49.origin.y;
            CGFloat width = v49.size.width;
            CGFloat height = v49.size.height;
          }
          v50.origin.double x = x;
          v50.origin.double y = y;
          v50.size.CGFloat width = width;
          v50.size.CGFloat height = height;
          CGContextClipToRect(a4, v50);
          int64_t v30 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", [v10 originalExifOrientation]);
          long long v34 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
          *(_OWORD *)&v42.a = *MEMORY[0x263F000D0];
          long long v33 = *(_OWORD *)&v42.a;
          *(_OWORD *)&v42.c = v34;
          *(_OWORD *)&v42.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
          long long v32 = *(_OWORD *)&v42.tx;
          CGAffineTransformMakeTranslation(&t2, -*(double *)&v46, -*((double *)&v46 + 1));
          *(_OWORD *)&t1.a = v33;
          *(_OWORD *)&t1.c = v34;
          *(_OWORD *)&t1.tdouble x = v32;
          CGAffineTransformConcat(&v42, &t1, &t2);
          +[AKGeometryHelper affineTransformRecenteringAboutOriginForExifOrientation:v30 withOriginalSize:*(_OWORD *)v47];
          CGAffineTransform v38 = v42;
          CGAffineTransformConcat(&t1, &v38, &v39);
          CGAffineTransform v42 = t1;
          CGAffineTransformMakeTranslation(&v37, *(CGFloat *)&v46, *((CGFloat *)&v46 + 1));
          CGAffineTransform v38 = v42;
          CGAffineTransformConcat(&t1, &v38, &v37);
          CGAffineTransform v42 = t1;
          CGContextConcatCTM(a4, &t1);
          CGContextTranslateCTM(a4, 0.0, *((CGFloat *)&v46 + 1));
          CGContextTranslateCTM(a4, 0.0, v45);
          CGContextScaleCTM(a4, 1.0, -1.0);
          CGContextTranslateCTM(a4, 0.0, -*((double *)&v46 + 1));
          objc_msgSend(v16, "drawGlyphsForGlyphRange:atPoint:", v36, v35, x, y);
        }
        [v19 removeLayoutManager:v16];
        CGContextRestoreGState(a4);
        UIGraphicsPopContext();
      }
    }
  }
}

+ (id)_sharedLayoutManager
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  v3 = [v2 threadDictionary];

  id v4 = [v3 objectForKey:@"com.apple.AnnotationKit.AKTextAnnotationRenderHelper.sharedLayoutManager"];
  if (!v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x263F1C378]), "initWithSize:", 10000000.0, 10000000.0);
    id v4 = objc_alloc_init(AKTextLayoutManager);
    [v5 setWidthTracksTextView:0];
    [v5 setHeightTracksTextView:0];
    [v5 setLineFragmentPadding:0.0];
    [(AKTextLayoutManager *)v4 addTextContainer:v5];
    [v3 setObject:v4 forKey:@"com.apple.AnnotationKit.AKTextAnnotationRenderHelper.sharedLayoutManager"];
  }

  return v4;
}

@end