@interface AKFormFeatureDetector
+ (CGContext)_newBitmapFromCGPDFDocument:(CGPDFDocument *)a3;
+ (CGContext)_newBitmapInRect:(CGRect)a3 onPage:(id)a4 scale:(double)a5;
- ($F0CD3428A0DA0A278EE56C24FA6A9B79)_findVerticalEdgesAtPoint:(SEL)a3 extent:(CGPoint)a4 onPage:(int64_t)a5;
- (AKFormFeatureDetector)initWithDelegate:(id)a3;
- (AKFormFeatureDetectorDelegate)delegate;
- (BOOL)_floatPixelBufferForCGContext:(CGContext *)a3 imageBuffer:(vImage_Buffer *)a4;
- (CGRect)_findExtentForLineTop:(double)a3 lineBottom:(double)a4 x:(double)a5 onPage:(id)a6;
- (CGRect)_translateFeature:(id)a3 toPageOrigin:(CGPoint)a4;
- (float)_shiftScanAwayFromEdgeInPixels:(float *)a3;
- (float)_thresholdPixelStripIn:(float *)a3 withImageLenth:(int64_t)a4 thresholdValue:(float)a5 startingPtr:(float *)a6 withThresholdLength:(int64_t)a7;
- (id)_boxOnLine:(id)a3 atPoint:(CGPoint)a4;
- (id)_checkboxAtPoint:(CGPoint)a3 onPage:(id)a4 pageBitmap:(CGContext *)a5;
- (id)_defaultFeatureForPoint:(CGPoint)a3 onPage:(id)a4 snapToVerticalEdges:(BOOL)a5;
- (id)_featureAtPoint:(CGPoint)a3 onPage:(id)a4 mode:(int64_t)a5;
- (id)_formFieldAtPoint:(CGPoint)a3 onPage:(id)a4 enforceMaxWidth:(BOOL)a5 pageBitmap:(CGContext *)a6;
- (id)_lineAtPoint:(CGPoint)a3 onPage:(id)a4 useVerticalCenter:(BOOL)a5;
- (id)_snappedFormFieldForField:(id)a3;
- (id)featureAtPoint:(CGPoint)a3 onPage:(id)a4 mode:(int64_t)a5;
- (int64_t)_scanToEdgeOfFormFieldStartingAtPoint:(CGPoint)a3 withBitmapData:(float *)a4 width:(int64_t)a5 height:(int64_t)a6 bottomRowStartsAt:(float *)a7 bottomRowEndsAt:(float *)a8 withLineThickness:(int64_t)a9 gapWidthForDottedLines:(int64_t)a10 separatorHeights:(id)a11 andRegionHeight:(int64_t *)a12 trackAverageSpacingWidth:(int64_t *)a13 trackFarthestPossibleEdge:(int64_t *)a14 trackNumberOfSegments:(int64_t *)a15 trackNumberOfGapsForDottedLine:(int64_t *)a16 goingLeft:(BOOL)a17;
- (unint64_t)_findLineEdgeTypeOnLeft:(BOOL)a3 startingAt:(float *)a4 withPageLeftEdge:(float *)a5 withPageWidth:(int64_t)a6 andFormHeight:(unint64_t)a7;
- (void)_drawThresholdedBitmapForTestForPageBitmap:(CGContext *)a3 withPixels:(float *)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation AKFormFeatureDetector

- (AKFormFeatureDetector)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKFormFeatureDetector;
  v5 = [(AKFormFeatureDetector *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)dealloc
{
  AKLog(@"%s");
  v3.receiver = self;
  v3.super_class = (Class)AKFormFeatureDetector;
  -[AKFormFeatureDetector dealloc](&v3, sel_dealloc, "-[AKFormFeatureDetector dealloc]");
}

- (id)featureAtPoint:(CGPoint)a3 onPage:(id)a4 mode:(int64_t)a5
{
  return (id)MEMORY[0x270F9A6D0](self, sel__featureAtPoint_onPage_mode_);
}

- (id)_featureAtPoint:(CGPoint)a3 onPage:(id)a4 mode:(int64_t)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  +[AKGeometryHelper rectWithSize:centeredAtPoint:](AKGeometryHelper, "rectWithSize:centeredAtPoint:", 400.0, 400.0, x, y);
  double v11 = v10;
  double v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  uint64_t v18 = objc_msgSend((id)objc_opt_class(), "_newBitmapInRect:onPage:scale:", v9, v10, v12, v14, v16, 1.0);
  if (!v18)
  {
    v37.origin.double x = v11;
    v37.origin.double y = v13;
    v37.size.width = v15;
    v37.size.height = v17;
    v35 = j__NSStringFromCGRect(v37);
    AKLog(@"%@ unable to create bitmap of rect %@ from page controller: %@");

    v22 = 0;
    goto LABEL_30;
  }
  v19 = (CGContext *)v18;
  if ((unint64_t)(a5 - 1) <= 1)
  {
    uint64_t v20 = -[AKFormFeatureDetector _checkboxAtPoint:onPage:pageBitmap:](self, "_checkboxAtPoint:onPage:pageBitmap:", v9, v18, 200.0, 200.0);
    if (!v20)
    {
      uint64_t v21 = -[AKFormFeatureDetector _formFieldAtPoint:onPage:enforceMaxWidth:pageBitmap:](self, "_formFieldAtPoint:onPage:enforceMaxWidth:pageBitmap:", v9, 1, v19, 200.0, 200.0);
      if (v21)
      {
        v22 = (void *)v21;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v23 = [(AKFormFeatureDetector *)self _snappedFormFieldForField:v22];

          v22 = (void *)v23;
        }
        goto LABEL_11;
      }
      if (a5 == 2)
      {
        uint64_t v32 = -[AKFormFeatureDetector _defaultFeatureForPoint:onPage:snapToVerticalEdges:](self, "_defaultFeatureForPoint:onPage:snapToVerticalEdges:", v9, 1, x, y);
        goto LABEL_21;
      }
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  if ((unint64_t)(a5 - 3) > 1)
  {
    if (!a5)
    {
      uint64_t v32 = -[AKFormFeatureDetector _lineAtPoint:onPage:useVerticalCenter:](self, "_lineAtPoint:onPage:useVerticalCenter:", v9, 1, x, y);
LABEL_21:
      v22 = (void *)v32;
      goto LABEL_29;
    }
LABEL_13:
    v22 = 0;
    goto LABEL_29;
  }
  uint64_t v20 = -[AKFormFeatureDetector _checkboxAtPoint:onPage:pageBitmap:](self, "_checkboxAtPoint:onPage:pageBitmap:", v9, v18, x, y);
  if (!v20)
  {
    v24 = -[AKFormFeatureDetector _lineAtPoint:onPage:useVerticalCenter:](self, "_lineAtPoint:onPage:useVerticalCenter:", v9, 0, x, y);
    v25 = v24;
    if (v24)
    {
      [v24 rect];
      if (v26 >= 18.0)
      {
        uint64_t v33 = -[AKFormFeatureDetector _boxOnLine:atPoint:](self, "_boxOnLine:atPoint:", v25, x, y);
        goto LABEL_27;
      }
      if (a5 == 4)
      {
        v27 = self;
        double v28 = x;
        double v29 = y;
        id v30 = v9;
        uint64_t v31 = 0;
LABEL_24:
        uint64_t v33 = -[AKFormFeatureDetector _defaultFeatureForPoint:onPage:snapToVerticalEdges:](v27, "_defaultFeatureForPoint:onPage:snapToVerticalEdges:", v30, v31, v28, v29);
LABEL_27:
        v22 = (void *)v33;
        goto LABEL_28;
      }
    }
    else if (a5 == 4)
    {
      v27 = self;
      double v28 = x;
      double v29 = y;
      id v30 = v9;
      uint64_t v31 = 1;
      goto LABEL_24;
    }
    v22 = 0;
LABEL_28:

    goto LABEL_29;
  }
LABEL_10:
  v22 = (void *)v20;
LABEL_11:
  -[AKFormFeatureDetector _translateFeature:toPageOrigin:](self, "_translateFeature:toPageOrigin:", v22, v11, v13);
  objc_msgSend(v22, "setRect:");
LABEL_29:
  CGContextRelease(v19);
LABEL_30:

  return v22;
}

- (CGRect)_translateFeature:(id)a3 toPageOrigin:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [a3 rect];
  double v9 = x + v8;
  double v11 = y + v10;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.double y = v11;
  result.origin.double x = v9;
  return result;
}

- (id)_formFieldAtPoint:(CGPoint)a3 onPage:(id)a4 enforceMaxWidth:(BOOL)a5 pageBitmap:(CGContext *)a6
{
  BOOL v7 = a5;
  double y = a3.y;
  double x = a3.x;
  id v11 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_12;
  }
  [WeakRetained defaultFeatureSizeForPage:v11];
  double v14 = v13;
  CGFloat v15 = [v11 overlayView];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  v24 = a6;
  if (a6
    || (v24 = (CGContext *)objc_msgSend((id)objc_opt_class(), "_newBitmapInRect:onPage:scale:", v11, v17, v19, v21, v23, 1.0)) != 0)
  {
    size_t Width = CGBitmapContextGetWidth(v24);
    int64_t Height = CGBitmapContextGetHeight(v24);
    uint64_t v27 = vcvtmd_s64_f64(x);
    double v28 = 0;
    if (v27 >= 8 && (uint64_t)(Width - 8) > v27)
    {
      double v29 = floor(y);
      double v30 = (double)Height - v29;
      if (((uint64_t)v30 & 0x8000000000000000) == 0 && Height > (uint64_t)v30)
      {
        uint64_t v91 = v27 - 8;
        int64_t v100 = Height;
        uint64_t v97 = (uint64_t)v30;
        memset(v110, 0, 32);
        __int16 BitmapInfo = CGBitmapContextGetBitmapInfo(v24);
        if ((BitmapInfo & 0x100) != 0)
        {
          Data = (float *)CGBitmapContextGetData(v24);
          BOOL v32 = 1;
        }
        else
        {
          BOOL v32 = [(AKFormFeatureDetector *)self _floatPixelBufferForCGContext:v24 imageBuffer:v110];
          v34 = *(float **)&v110[0];
          if (!v32) {
            v34 = 0;
          }
          Data = v34;
        }
        double v28 = 0;
        if (v32)
        {
          if (Data)
          {
            __int16 v90 = BitmapInfo;
            BOOL v88 = v7;
            float v35 = Data[Width * v97 + v27] + -0.01;
            unint64_t v94 = 4 * Width * vcvtmd_s64_f64(v14);
            *(float *)&double v33 = v35;
            v36 = -[AKFormFeatureDetector _thresholdPixelStripIn:withImageLenth:thresholdValue:startingPtr:withThresholdLength:](self, "_thresholdPixelStripIn:withImageLenth:thresholdValue:startingPtr:withThresholdLength:", v33);
            v38 = &Data[Width * v97 + v91];
            v98 = &Data[v100 * Width];
            if (v38 < v98)
            {
              v39 = v36;
              v89 = WeakRetained;
              v86 = v24;
              v87 = a6;
              uint64_t v40 = 0;
              BOOL v41 = 0;
              char v42 = 0;
              uint64_t v43 = (uint64_t)v29;
              size_t v102 = Width;
              float v44 = 0.0;
              uint64_t v93 = (uint64_t)&Data[Width * v97 + v91];
              while (1)
              {
                if (v38 + 17 > v39)
                {
                  *(float *)&double v37 = v35;
                  v39 = [(AKFormFeatureDetector *)self _thresholdPixelStripIn:Data withImageLenth:v100 * Width thresholdValue:v39 startingPtr:v94 withThresholdLength:v37];
                }
                LODWORD(__C) = 0;
                vDSP_sve(v38, 1, (float *)&__C, 0x11uLL);
                if (v42)
                {
                  if (v40 >= 4)
                  {
                    if (v41)
                    {
LABEL_40:
                      uint64_t v85 = v43;
                      uint64_t v96 = v40;
                      uint64_t v108 = 0x7FFFFFFFFFFFFFFFLL;
                      uint64_t __C = 0;
                      uint64_t v107 = 0x7FFFFFFFFFFFFFFFLL;
                      uint64_t v105 = 0;
                      uint64_t v106 = 0;
                      uint64_t v104 = 0;
                      id v99 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                      char v47 = 0;
                      uint64_t v103 = 0x7FFFFFFFFFFFFFFFLL;
                      uint64_t v92 = (uint64_t)&Data[v97 * Width - 1 + Width];
                      uint64_t v48 = 4;
                      v49 = (char *)&Data[v97 * Width];
                      do
                      {
                        uint64_t v106 = 0x7FFFFFFFFFFFFFFFLL;
                        LOBYTE(v83) = 1;
                        int64_t v95 = -[AKFormFeatureDetector _scanToEdgeOfFormFieldStartingAtPoint:withBitmapData:width:height:bottomRowStartsAt:bottomRowEndsAt:withLineThickness:gapWidthForDottedLines:separatorHeights:andRegionHeight:trackAverageSpacingWidth:trackFarthestPossibleEdge:trackNumberOfSegments:trackNumberOfGapsForDottedLine:goingLeft:](self, "_scanToEdgeOfFormFieldStartingAtPoint:withBitmapData:width:height:bottomRowStartsAt:bottomRowEndsAt:withLineThickness:gapWidthForDottedLines:separatorHeights:andRegionHeight:trackAverageSpacingWidth:trackFarthestPossibleEdge:trackNumberOfSegments:trackNumberOfGapsForDottedLine:goingLeft:", Data, v102, v100, v49, v92, v40, x, y, v48, v99, &v106, &v103, &v108, &v105,
                                &__C,
                                v83);
                        LOBYTE(v84) = 0;
                        int64_t v50 = -[AKFormFeatureDetector _scanToEdgeOfFormFieldStartingAtPoint:withBitmapData:width:height:bottomRowStartsAt:bottomRowEndsAt:withLineThickness:gapWidthForDottedLines:separatorHeights:andRegionHeight:trackAverageSpacingWidth:trackFarthestPossibleEdge:trackNumberOfSegments:trackNumberOfGapsForDottedLine:goingLeft:](self, "_scanToEdgeOfFormFieldStartingAtPoint:withBitmapData:width:height:bottomRowStartsAt:bottomRowEndsAt:withLineThickness:gapWidthForDottedLines:separatorHeights:andRegionHeight:trackAverageSpacingWidth:trackFarthestPossibleEdge:trackNumberOfSegments:trackNumberOfGapsForDottedLine:goingLeft:", Data, v102, v100, v49, v92, v40, x, y, v48, v99, &v106, &v103, &v107, &v104,
                                &__C,
                                v84);
                        if (v47) {
                          break;
                        }
                        char v47 = 1;
                        uint64_t v48 = 6;
                      }
                      while (__C > 2);

                      id WeakRetained = v89;
                      char v51 = 0;
                      if (v103 == 0x7FFFFFFFFFFFFFFFLL)
                      {
                        size_t v52 = v102;
                        int64_t v53 = v95;
                      }
                      else
                      {
                        int64_t v53 = v95;
                        size_t v52 = v102;
                        if (v50 - v95 >= v103 - 2 && v50 - v95 <= v103 + 2)
                        {
                          if (v107 != 0x7FFFFFFFFFFFFFFFLL) {
                            int64_t v50 = v107;
                          }
                          if (v108 != 0x7FFFFFFFFFFFFFFFLL) {
                            int64_t v53 = v108;
                          }
                          char v51 = 1;
                        }
                      }
                      if (v50 == 0x7FFFFFFFFFFFFFFFLL) {
                        int64_t v55 = v52;
                      }
                      else {
                        int64_t v55 = v50;
                      }
                      if (v53 == 0x7FFFFFFFFFFFFFFFLL) {
                        uint64_t v56 = v91;
                      }
                      else {
                        uint64_t v56 = v53;
                      }
                      uint64_t v57 = v55 - v56;
                      if (v55 - v56 < 1) {
                        goto LABEL_96;
                      }
                      double v58 = (double)v56;
                      double v59 = (double)v57;
                      double v60 = (double)v106;
                      v112.origin.double x = (double)v56;
                      v112.origin.double y = (double)v85;
                      v112.size.width = (double)v57;
                      v112.size.height = (double)v106;
                      if (y > CGRectGetMaxY(v112) + 3.0) {
                        goto LABEL_96;
                      }
                      v113.origin.double x = (double)v56;
                      v113.origin.double y = (double)v85;
                      v113.size.width = v59;
                      v113.size.height = v60;
                      if (y < CGRectGetMinY(v113) + -3.0) {
                        goto LABEL_96;
                      }
                      if (v14 <= v60) {
                        double v61 = v14;
                      }
                      else {
                        double v61 = v60;
                      }
                      double v62 = floor(v61);
                      if (v62 * 2.5 >= v60) {
                        goto LABEL_73;
                      }
                      v114.origin.double x = (double)v56;
                      v114.origin.double y = (double)v85;
                      v114.size.width = v59;
                      v114.size.height = v60;
                      double v63 = CGRectGetMaxY(v114) - v62 + -3.0;
                      v115.origin.double x = (double)v56;
                      v115.origin.double y = (double)v85;
                      v115.size.width = v59;
                      v115.size.height = v60;
                      double v64 = v62 + CGRectGetMinY(v115) + 3.0;
                      if (y < v63 && y > v64) {
                        goto LABEL_96;
                      }
                      if (y < v63)
                      {
LABEL_73:
                        uint64_t v68 = 0;
                        int v66 = 1;
                        double v67 = (double)v85;
                        goto LABEL_74;
                      }
                      v116.origin.double x = (double)v56;
                      v116.origin.double y = (double)v85;
                      v116.size.width = v59;
                      v116.size.height = v60;
                      int v66 = 0;
                      double v67 = CGRectGetMaxY(v116) - v62;
                      uint64_t v97 = v100 - (uint64_t)v67;
                      uint64_t v68 = 2;
LABEL_74:
                      uint64_t v106 = (uint64_t)v62;
                      v117.origin.double x = (double)v56;
                      v117.origin.double y = v67;
                      v117.size.width = v59;
                      v117.size.height = v62;
                      if (y > CGRectGetMaxY(v117) + 3.0) {
                        goto LABEL_96;
                      }
                      v118.origin.double x = (double)v56;
                      v118.origin.double y = v67;
                      v118.size.width = v59;
                      v118.size.height = v62;
                      if (y < CGRectGetMinY(v118) + -3.0) {
                        goto LABEL_96;
                      }
                      v69 = (char *)&Data[v97 * v102];
                      unint64_t v70 = [(AKFormFeatureDetector *)self _findLineEdgeTypeOnLeft:1 startingAt:&v69[4 * v56] withPageLeftEdge:v69 withPageWidth:v102 andFormHeight:v106];
                      unint64_t v71 = [(AKFormFeatureDetector *)self _findLineEdgeTypeOnLeft:0 startingAt:&v69[4 * v55] withPageLeftEdge:v69 withPageWidth:v102 andFormHeight:v106];
                      BOOL v72 = v70 == 2 && v71 == 2;
                      int v73 = v72 ? 1 : v66;
                      if (v73 != 1) {
                        goto LABEL_96;
                      }
                      BOOL v74 = v71 == 1 || v70 == 1;
                      uint64_t v75 = 18;
                      if (v74) {
                        uint64_t v75 = 42;
                      }
                      if (v70 == 3) {
                        v75 -= 2;
                      }
                      if (v71 == 3) {
                        v75 -= 2;
                      }
                      char v76 = v59 < (double)v75 ? 1 : v51;
                      if (v76)
                      {
LABEL_96:
                        double v28 = 0;
                        v24 = v86;
                        a6 = v87;
                        goto LABEL_97;
                      }
                      v78 = +[AKFormFeature featureWithRect:onPage:](AKFormFeatureLine, "featureWithRect:onPage:", v11, v58, v67 - (double)v96, v59);
                      if (v88
                        && (objc_opt_respondsToSelector() & 1) != 0
                        && ([v89 maximumFeatureWidthForPage:v11], v79 < v59))
                      {
                        [v89 defaultFeatureSizeForPage:v11];
                        double v81 = v80;
                        double v82 = x + v80 * -0.0;
                        v68 |= 1uLL;
                      }
                      else
                      {
                        double v82 = v58;
                        double v81 = v59;
                      }
                      double v28 = +[AKFormFeatureBox boxWithRect:onPage:flags:baseline:](AKFormFeatureBox, "boxWithRect:onPage:flags:baseline:", v11, v68, v78, v82, v67, v81, v62);
                      objc_msgSend(v28, "setEnclosingRegionRect:", v58, (double)v85, v59, v60);
                    }
                    else
                    {
LABEL_45:
                      double v28 = 0;
                    }
                    v24 = v86;
                    a6 = v87;
                    __int16 v54 = v90;
                    id WeakRetained = v89;
                    goto LABEL_98;
                  }
                  if (*(float *)&__C >= 16.0) {
                    goto LABEL_40;
                  }
                  if (v44 != *(float *)&__C) {
                    goto LABEL_45;
                  }
                  BOOL v41 = *(float *)&__C == 0.0;
                  ++v40;
                  char v42 = 1;
                  float v44 = *(float *)&__C;
                }
                else
                {
                  LODWORD(v37) = __C;
                  if (*(float *)&__C <= 12.0)
                  {
                    if (v38 == (const float *)v93)
                    {
                      v46 = -[AKFormFeatureDetector _shiftScanAwayFromEdgeInPixels:](self, "_shiftScanAwayFromEdgeInPixels:", v93, v37);
                      if (v46)
                      {
                        char v42 = 0;
                        v38 = &v46[-Width];
                        v27 += ((uint64_t)v46 - v93) >> 2;
                        goto LABEL_35;
                      }
                      LODWORD(v37) = __C;
                    }
                    BOOL v41 = *(float *)&v37 == 0.0;
                    uint64_t v40 = 1;
                    float v44 = *(float *)&v37;
                    char v42 = 1;
                  }
                  else
                  {
                    if (*(float *)&__C > 17.0 || *(float *)&__C <= 12.0) {
                      goto LABEL_45;
                    }
                    char v42 = 0;
                    --v43;
                    ++v97;
                  }
                }
LABEL_35:
                v38 += Width;
                if (v38 >= v98) {
                  goto LABEL_45;
                }
              }
            }
            double v28 = 0;
LABEL_97:
            __int16 v54 = v90;
LABEL_98:
            if ((v54 & 0x100) == 0) {
              free(*(void **)&v110[0]);
            }
          }
        }
      }
    }
    if (!a6) {
      CGContextRelease(v24);
    }
  }
  else
  {
LABEL_12:
    double v28 = 0;
  }

  return v28;
}

- (unint64_t)_findLineEdgeTypeOnLeft:(BOOL)a3 startingAt:(float *)a4 withPageLeftEdge:(float *)a5 withPageWidth:(int64_t)a6 andFormHeight:(unint64_t)a7
{
  BOOL v11 = a3;
  float __C = 0.0;
  int64_t v12 = -a6;
  vDSP_sve(a4, -a6, &__C, a7);
  float v13 = __C;
  if (__C == 0.0) {
    return 2;
  }
  vDSP_Stride __I = v12;
  float v15 = (float)a7;
  float v16 = (float)a7 * 0.5;
  double v17 = &a5[a6];
  unint64_t v18 = 2 * a7;
  double v19 = a4 - 1;
  double v20 = a4 + 1;
  uint64_t v21 = -1;
  uint64_t v22 = 1;
  float v23 = __C;
  do
  {
    float v24 = (float)v18;
    BOOL v25 = v19 > a5 && v11;
    if (v25 || v17 > v20)
    {
      if (v11) {
        uint64_t v26 = v21;
      }
      else {
        uint64_t v26 = v22;
      }
      vDSP_sve(&a4[v26], __I, &__C, a7);
      if ((__C == v15 || __C == 0.0) && (float)(v24 - v23) < v16) {
        return 1;
      }
      float v23 = v23 + __C;
      if (__C == v15) {
        break;
      }
    }
    --v21;
    v18 += a7;
    --v19;
    ++v20;
    ++v22;
  }
  while (v21 != -4);
  if ((float)(v24 - v23) >= v16 && (float)(v24 - v23) < v15) {
    return 3;
  }
  else {
    return v13 < (float)(a7 - 1);
  }
}

- (int64_t)_scanToEdgeOfFormFieldStartingAtPoint:(CGPoint)a3 withBitmapData:(float *)a4 width:(int64_t)a5 height:(int64_t)a6 bottomRowStartsAt:(float *)a7 bottomRowEndsAt:(float *)a8 withLineThickness:(int64_t)a9 gapWidthForDottedLines:(int64_t)a10 separatorHeights:(id)a11 andRegionHeight:(int64_t *)a12 trackAverageSpacingWidth:(int64_t *)a13 trackFarthestPossibleEdge:(int64_t *)a14 trackNumberOfSegments:(int64_t *)a15 trackNumberOfGapsForDottedLine:(int64_t *)a16 goingLeft:(BOOL)a17
{
  double x = a3.x;
  id v22 = a11;
  float v23 = a7;
  BOOL v24 = a17;
  int64_t v25 = vcvtmd_s64_f64(x);
  int64_t v26 = *a13;
  int64_t v27 = *a14;
  int64_t v78 = *a16;
  id v79 = v22;
  int64_t v28 = *a12;
  double v29 = &a7[v25];
  BOOL v30 = v25 >= 0;
  if (!a17) {
    BOOL v30 = v29 <= a8;
  }
  BOOL v74 = a15;
  if (!v30)
  {
    int64_t v89 = 0;
    uint64_t v53 = 0;
    int64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_59;
  }
  uint64_t v31 = a8;
  char v32 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  int64_t v89 = 0;
  int64_t __N = a9;
  float v36 = (float)a9;
  uint64_t v38 = -1;
  if (!a17) {
    uint64_t v38 = 1;
  }
  uint64_t v88 = v38;
  uint64_t v87 = 4 * v38;
  vDSP_Stride v39 = a5;
  int64_t v40 = 4 * a5;
  uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
  int64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
  int64_t v43 = (int64_t)&v23[v25 - a5];
  double v80 = v23;
  double v81 = v31;
  while (v29 < a4 || v28 <= 0)
  {
    int64_t v50 = 0;
LABEL_26:
    if (v24) {
      uint64_t v51 = v35;
    }
    else {
      uint64_t v51 = -v35;
    }
    int64_t v52 = v25 + v51;
    if ((v32 & 1) == 0) {
      int64_t v42 = v52;
    }
    uint64_t v53 = v34 + 1;
    if (v34 > 2) {
      goto LABEL_59;
    }
    if (v34 <= 0)
    {
      if ((v32 & ((unint64_t)(v33 - 21) < 0xFFFFFFFFFFFFFFEFLL)) != 0
        || v26 != 0x7FFFFFFFFFFFFFFFLL && v33 < v26 - 2 && v33 > v26 + 2)
      {
        goto LABEL_59;
      }
      if ((v32 & (v26 == 0x7FFFFFFFFFFFFFFFLL)) == 1)
      {
        if (v24) {
          int64_t v26 = v27 - v25;
        }
        else {
          int64_t v26 = v25 - v27;
        }
      }
    }
    v89 += v32 & (v34 == 0);
    if (v41 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v83 = v35;
      int64_t v85 = v42;
      int64_t v58 = v26;
      int64_t v59 = v25;
      uint64_t v60 = v34 + 1;
      double v61 = objc_msgSend(NSNumber, "numberWithInteger:");
      [v79 addObject:v61];

      uint64_t v53 = v60;
      int64_t v40 = 4 * a5;
      float v23 = v80;
      vDSP_Stride v39 = a5;
      uint64_t v31 = v81;
      int64_t v25 = v59;
      int64_t v26 = v58;
      uint64_t v35 = v83;
      int64_t v42 = v85;
      BOOL v24 = a17;
    }
    a10 = 0;
    uint64_t v33 = 0;
    char v32 = 1;
    uint64_t v41 = v50;
    int64_t v27 = v25;
LABEL_54:
    double v29 = (const float *)((char *)v29 + v87);
    v25 += v88;
    BOOL v62 = v29 <= v31;
    if (v24) {
      BOOL v62 = v29 >= v23;
    }
    v43 += v87;
    uint64_t v34 = v53;
    if (!v62) {
      goto LABEL_59;
    }
  }
  int64_t v46 = 0;
  char v47 = 1;
  uint64_t v48 = (float *)v29;
  do
  {
    if ((v47 & 1) == 0 && *v48 <= 0.0) {
      break;
    }
    v48 -= a5;
    ++v46;
    if (v48 < a4) {
      break;
    }
    char v47 = 0;
  }
  while (v46 < v28);
  if ((unint64_t)v46 <= 8)
  {
    uint64_t v49 = 0;
    int64_t v50 = 0;
    do
    {
      if (*(const float *)((char *)v29 + v49) > 0.0) {
        break;
      }
      ++v50;
      if (v43 + v49 < (unint64_t)a4) {
        break;
      }
      v49 -= v40;
    }
    while (v50 < v28);
    goto LABEL_26;
  }
  uint64_t v54 = v41;
  uint64_t v76 = v33;
  int64_t v77 = v27;
  uint64_t v55 = v35;
  int64_t v82 = v25;
  int64_t v84 = v26;
  if (v28 >= v46) {
    int64_t v28 = v46;
  }
  __C[0] = 0.0;
  vDSP_sve(v29, v39, __C, __N);
  *(float *)&double v56 = __C[0];
  if (__C[0] < v36)
  {
    int64_t v57 = v78;
    if (v55 > 0) {
      int64_t v57 = v78 + 1;
    }
    int64_t v78 = v57;
    BOOL v24 = a17;
    int64_t v25 = v82;
    int64_t v26 = v84;
    float v23 = v80;
    uint64_t v31 = v81;
    uint64_t v41 = v54;
    if ((v32 & (v76 > 19)) == 1)
    {
      int64_t v27 = v77;
      if (!a17)
      {
        v65 = objc_msgSend(NSNumber, "numberWithInteger:", v54, v56);
        int v66 = [v79 containsObject:v65];

        int64_t v26 = v84;
        BOOL v24 = a17;
        if (v66) {
          int64_t v67 = v84;
        }
        else {
          int64_t v67 = 0;
        }
        int64_t v27 = v67 + v77;
      }
      goto LABEL_85;
    }
    uint64_t v35 = 0;
    uint64_t v33 = v76 + 1;
    goto LABEL_49;
  }
  uint64_t v35 = v55 + 1;
  BOOL v24 = a17;
  int64_t v25 = v82;
  int64_t v26 = v84;
  float v23 = v80;
  uint64_t v31 = v81;
  uint64_t v41 = v54;
  if (v55 + 1 < a10)
  {
    uint64_t v33 = 0;
LABEL_49:
    int64_t v27 = v77;
    uint64_t v53 = 0;
    vDSP_Stride v39 = a5;
    int64_t v40 = 4 * a5;
    goto LABEL_54;
  }
  if (a17) {
    int64_t v68 = a10;
  }
  else {
    int64_t v68 = -a10;
  }
  int64_t v69 = v68 + v82;
  if ((v32 & 1) == 0) {
    int64_t v42 = v69;
  }
  unint64_t v70 = objc_msgSend(NSNumber, "numberWithInteger:", v54, v56, a15);
  int v71 = [v79 containsObject:v70];

  if (v71 && v76 >= 5)
  {
    BOOL v24 = a17;
    int64_t v26 = v84;
    if (a17) {
      int64_t v72 = -v84;
    }
    else {
      int64_t v72 = v84;
    }
    int64_t v27 = v77 + v72;
  }
  else
  {
    int64_t v73 = v82;
    int64_t v26 = v84;
    if ((v32 & (v76 > 4) & (v76 < 20)) == 0) {
      int64_t v73 = v77;
    }
    if (v84 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
      int64_t v27 = v73;
    }
    else
    {
      int64_t v27 = v77;
    }
    BOOL v24 = a17;
  }
LABEL_85:
  uint64_t v53 = 0;
LABEL_59:
  *BOOL v74 = v89;
  if (v24) {
    uint64_t v63 = v53;
  }
  else {
    uint64_t v63 = -v53;
  }
  *a14 = v63 + v27;
  *a13 = v26;
  *a16 = v78;
  *a12 = v28;

  return v42;
}

- (float)_thresholdPixelStripIn:(float *)a3 withImageLenth:(int64_t)a4 thresholdValue:(float)a5 startingPtr:(float *)a6 withThresholdLength:(int64_t)a7
{
  float __B = a5;
  float __C = 1.0;
  BOOL v7 = &a3[a4];
  if (v7 <= a6) {
    return 0;
  }
  if (a6 >= a3) {
    double v8 = a6;
  }
  else {
    double v8 = a3;
  }
  int64_t v9 = v7 - v8;
  if (v9 >= a7) {
    vDSP_Length v10 = a7;
  }
  else {
    vDSP_Length v10 = v9;
  }
  BOOL v11 = &v8[v10];
  vDSP_vthrsc(v8, 1, &__B, &__C, v8, 1, v10);
  vDSP_vthres(v8, 1, &__C, v8, 1, v10);
  return v11;
}

- (void)_drawThresholdedBitmapForTestForPageBitmap:(CGContext *)a3 withPixels:(float *)a4
{
  size_t Width = CGBitmapContextGetWidth(a3);
  size_t Height = CGBitmapContextGetHeight(a3);
  size_t BitsPerComponent = CGBitmapContextGetBitsPerComponent(a3);
  size_t BytesPerRow = CGBitmapContextGetBytesPerRow(a3);
  ColorSpace = CGBitmapContextGetColorSpace(a3);
  uint32_t BitmapInfo = CGBitmapContextGetBitmapInfo(a3);
  int64_t v12 = CGBitmapContextCreate(a4, Width, Height, BitsPerComponent, BytesPerRow, ColorSpace, BitmapInfo);
  Image = CGBitmapContextCreateImage(v12);
  id v14 = [@"~/Desktop/testImage.pdf" stringByExpandingTildeInPath];
  [v14 cStringUsingEncoding:4];
  CGImageWriteToFile();

  CGImageRelease(Image);

  CGContextRelease(v12);
}

- (float)_shiftScanAwayFromEdgeInPixels:(float *)a3
{
  float __C = 0.0;
  vDSP_sve(a3, 1, &__C, 8uLL);
  float v6 = 0.0;
  id v4 = a3 + 8;
  vDSP_sve(a3 + 8, 1, &v6, 8uLL);
  if (v6 < 6.0) {
    return a3 - 9;
  }
  if (__C >= 6.0) {
    return 0;
  }
  return v4;
}

- (id)_snappedFormFieldForField:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    [v3 rect];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    double v10 = v9;
    double v12 = v11;
    float v13 = [v4 baseline];

    if (!v13)
    {
LABEL_5:
      id v28 = v4;
      goto LABEL_10;
    }
    id v14 = [v4 baseline];
    [v14 rect];
    double v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    CGFloat rect = v6;
    v37.origin.double x = v6;
    v37.origin.double y = v8;
    v37.size.width = v10;
    v37.size.height = v12;
    CGFloat v23 = v8;
    double MinX = CGRectGetMinX(v37);
    v38.origin.double x = v16;
    CGFloat rect_8 = v18;
    v38.origin.double y = v18;
    CGFloat v25 = v20;
    v38.size.width = v20;
    v38.size.height = v22;
    if (MinX <= CGRectGetMinX(v38) + 20.0)
    {
      double v26 = v23;
      uint64_t v29 = 4;
    }
    else
    {
      v39.origin.double x = rect;
      double v26 = v23;
      v39.origin.double y = v23;
      v39.size.width = v10;
      v39.size.height = v12;
      double MaxX = CGRectGetMaxX(v39);
      v40.origin.double x = v16;
      v40.origin.double y = rect_8;
      v40.size.width = v25;
      v40.size.height = v22;
      if (MaxX < CGRectGetMaxX(v40) + -20.0) {
        goto LABEL_5;
      }
      v41.origin.double x = v16;
      v41.origin.double y = rect_8;
      v41.size.width = v25;
      v41.size.height = v22;
      double v16 = CGRectGetMaxX(v41) - v10;
      uint64_t v29 = 8;
    }
    BOOL v30 = objc_msgSend(v4, "page", *(void *)&rect);
    uint64_t v31 = [v4 flags] | v29;
    char v32 = [v4 baseline];
    +[AKFormFeatureBox boxWithRect:onPage:flags:baseline:](AKFormFeatureBox, "boxWithRect:onPage:flags:baseline:", v30, v31, v32, v16, v26, v10, v12);
    id v28 = (id)objc_claimAutoreleasedReturnValue();

    [v4 enclosingRegionRect];
    objc_msgSend(v28, "setEnclosingRegionRect:");
  }
  else
  {
    id v28 = 0;
  }
LABEL_10:

  return v28;
}

- (BOOL)_floatPixelBufferForCGContext:(CGContext *)a3 imageBuffer:(vImage_Buffer *)a4
{
  Image = CGBitmapContextCreateImage(a3);
  CGColorSpaceRef ColorSpace = CGBitmapContextGetColorSpace(a3);
  CGBitmapInfo BitmapInfo = CGBitmapContextGetBitmapInfo(a3);
  int BitsPerPixel = CGBitmapContextGetBitsPerPixel(a3);
  int BitsPerComponent = CGBitmapContextGetBitsPerComponent(a3);
  size_t Width = CGBitmapContextGetWidth(a3);
  size_t v12 = CGBitmapContextGetWidth(a3);
  int v26 = 0;
  v21[0] = BitsPerComponent;
  v21[1] = BitsPerPixel;
  CGColorSpaceRef v22 = ColorSpace;
  CGBitmapInfo v23 = BitmapInfo;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  float v13 = malloc_type_calloc(v12, 4 * Width, 0x11C3DB1DuLL);
  memset(&src, 0, sizeof(src));
  uint64_t v14 = MEMORY[0x237E1E4C0](&src, v21, 0, Image, 256);
  if (v14)
  {
    NSLog(&cfstr_InBufferCreati.isa, v14);
    free(v13);
    BOOL v15 = 0;
  }
  else
  {
    dest.data = v13;
    dest.height = src.height;
    dest.width = src.width;
    dest.rowBytes = 4 * src.width;
    vImage_Error v16 = vImageConvert_Planar8toPlanarF(&src, &dest, 1.0, 0.0, 0x100u);
    BOOL v15 = v16 == 0;
    if (v16)
    {
      NSLog(&cfstr_OutBufferConve.isa, v16);
    }
    else
    {
      long long v17 = *(_OWORD *)&dest.width;
      *(_OWORD *)&a4->data = *(_OWORD *)&dest.data;
      *(_OWORD *)&a4->width = v17;
    }
  }
  CGImageRelease(Image);
  return v15;
}

- (id)_checkboxAtPoint:(CGPoint)a3 onPage:(id)a4 pageBitmap:(CGContext *)a5
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v9 = a4;
  double v10 = [v9 overlayView];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = a5;
  if (!a5)
  {
    double v19 = (CGContext *)objc_msgSend((id)objc_opt_class(), "_newBitmapInRect:onPage:scale:", v9, v12, v14, v16, v18, 1.0);
    if (!v19)
    {
      CGBitmapInfo v23 = 0;
      goto LABEL_17;
    }
  }
  size_t Width = CGBitmapContextGetWidth(v19);
  int64_t Height = CGBitmapContextGetHeight(v19);
  uint64_t v22 = vcvtmd_s64_f64(x);
  if (v22 < 20)
  {
    CGBitmapInfo v23 = 0;
  }
  else
  {
    CGBitmapInfo v23 = 0;
    if ((uint64_t)(Width - 20) > v22)
    {
      int64_t v24 = Height;
      double v25 = floor(y);
      uint64_t v26 = (uint64_t)((double)Height - v25);
      if (v26 >= 20 && Height - 20 > v26)
      {
        *(_OWORD *)uint64_t v49 = 0u;
        long long v50 = 0u;
        __int16 BitmapInfo = CGBitmapContextGetBitmapInfo(v19);
        if ((BitmapInfo & 0x100) != 0)
        {
          Data = (float *)CGBitmapContextGetData(v19);
          BOOL v28 = 1;
        }
        else
        {
          BOOL v28 = [(AKFormFeatureDetector *)self _floatPixelBufferForCGContext:v19 imageBuffer:v49];
          Data = v28 ? (float *)v49[0] : 0;
        }
        CGBitmapInfo v23 = 0;
        if (v28)
        {
          if (Data)
          {
            double v31 = Data[Width * v26 + v22] + -0.01;
            *(float *)&double v31 = v31;
            char v32 = &Data[Width * v26];
            [(AKFormFeatureDetector *)self _thresholdPixelStripIn:Data withImageLenth:v24 * Width thresholdValue:&v32[-40 * Width] startingPtr:80 * Width withThresholdLength:v31];
            uint64_t v33 = &v32[v22];
            vDSP_minvi(v33, -1, &__C, &__I, 0x15uLL);
            vDSP_minvi(v33, 1, &v60, &v56, 0x15uLL);
            vDSP_minvi(v33, -(uint64_t)Width, &v61, &v57, 0x15uLL);
            vDSP_minvi(v33, Width, &v62, &v58, 0x15uLL);
            float v48 = 0.0;
            vDSP_sve(&__C, 1, &v48, 4uLL);
            if (v48 == 0.0)
            {
              CGBitmapInfo v23 = 0;
              vDSP_Length v34 = ~__I;
              vDSP_Length v35 = ~v57 / Width;
              vDSP_Length __I = v34;
              vDSP_Length v36 = v58 / Width;
              vDSP_Length v57 = v35;
              v58 /= Width;
              int64_t v37 = v56 + v34;
              if (v56 + v34 - 2 <= 0x12)
              {
                uint64_t v38 = v36 + v35;
                if ((uint64_t)(v36 + v35) >= 2 && v38 <= 20 && v38 - v37 <= 2)
                {
                  vDSP_Length v39 = v26 - v35;
                  vDSP_Length v44 = v22 - v34;
                  uint64_t v45 = v36 + v35;
                  CGRect v40 = &Data[v39 * Width + v22 - v34];
                  float v41 = 0.0;
                  do
                  {
                    float __A = 0.0;
                    vDSP_sve(v40, 1, &__A, v37);
                    float v41 = v41 + __A;
                    v40 += Width;
                    --v38;
                  }
                  while (v38);
                  if (v37 * v45 != (uint64_t)v41) {
                    goto LABEL_32;
                  }
                  int64_t v42 = &Data[(v39 - 1) * Width + v44];
                  int64_t v43 = v42 - 1;
                  float v47 = 0.0;
                  vDSP_sve(v42, 1, &__A, v37);
                  vDSP_sve(&v43[Width + 1 + Width * v45], 1, &v52, v37);
                  vDSP_sve(v43, Width, &v53, v45 + 2);
                  vDSP_sve(&v43[v37 + 1], Width, &v54, v45 + 2);
                  vDSP_sve(&__A, 1, &v47, 4uLL);
                  if (v47 > 0.0) {
                    goto LABEL_32;
                  }
                  CGBitmapInfo v23 = +[AKFormFeatureCheckbox checkboxWithRect:onPage:](AKFormFeatureCheckbox, "checkboxWithRect:onPage:", v9, (double)(v22 - __I), v25 - (double)v58, (double)v37, (double)v45);
                }
              }
LABEL_33:
              if ((BitmapInfo & 0x100) == 0) {
                free(v49[0]);
              }
              goto LABEL_14;
            }
LABEL_32:
            CGBitmapInfo v23 = 0;
            goto LABEL_33;
          }
        }
      }
    }
  }
LABEL_14:
  if (!a5) {
    CGContextRelease(v19);
  }
LABEL_17:

  return v23;
}

- ($F0CD3428A0DA0A278EE56C24FA6A9B79)_findVerticalEdgesAtPoint:(SEL)a3 extent:(CGPoint)a4 onPage:(int64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  double v10 = (double)a5 * 0.0 + 20.0;
  vDSP_Length v11 = (uint64_t)(double)a5;
  id v12 = a6;
  double v13 = round(x);
  double v14 = (CGContext *)objc_msgSend((id)objc_opt_class(), "_newBitmapInRect:onPage:scale:", v12, v13 - (double)(uint64_t)v10, round(y), (double)(uint64_t)(v11 + (uint64_t)v10 - 1), 1.0, 1.0);

  if (v14)
  {
    *(_OWORD *)CGBitmapInfo v23 = 0u;
    long long v24 = 0u;
    __int16 BitmapInfo = CGBitmapContextGetBitmapInfo(v14);
    if ((BitmapInfo & 0x100) != 0)
    {
      Data = (char *)CGBitmapContextGetData(v14);
    }
    else
    {
      BOOL v17 = [(AKFormFeatureDetector *)self _floatPixelBufferForCGContext:v14 imageBuffer:v23];
      if (v17) {
        Data = (char *)v23[0];
      }
      else {
        Data = 0;
      }
      if (!v17)
      {
LABEL_16:
        CGContextRelease(v14);
        return result;
      }
    }
    if (Data)
    {
      vDSP_Length __I = 0;
      uint64_t __C = 0;
      vDSP_Length v20 = 0;
      double v19 = (const float *)&Data[4 * (uint64_t)v10 - 4];
      vDSP_minvi(v19, -1, (float *)&__C + 1, &__I, (uint64_t)v10);
      vDSP_Length __I = -(uint64_t)__I;
      vDSP_minvi(v19, 1, (float *)&__C, &v20, v11);
      if (*((float *)&__C + 1) < 0.25)
      {
        retstr->var0 = 1;
        retstr->var1 = v13 - (double)__I;
      }
      if (*(float *)&__C < 0.25)
      {
        retstr->var2 = 1;
        retstr->var3 = v13 + (double)v20;
      }
      if ((BitmapInfo & 0x100) == 0) {
        free(v23[0]);
      }
    }
    goto LABEL_16;
  }
  return result;
}

- (id)_lineAtPoint:(CGPoint)a3 onPage:(id)a4 useVerticalCenter:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a4;
  if (v5) {
    double v10 = 8.0;
  }
  else {
    double v10 = 16.0;
  }
  double v11 = round(x);
  double v12 = round(y);
  double v13 = (CGContext *)objc_msgSend((id)objc_opt_class(), "_newBitmapInRect:onPage:scale:", v9, v11 + -8.0, v12 - v10, 16.0, 16.0, 4.0);
  if (v13)
  {
    double v14 = v13;
    Data = (const float *)CGBitmapContextGetData(v13);
    uint64_t v16 = 0;
    do
    {
      vDSP_sve(Data, 1, &__A[v16], 0x40uLL);
      Data += 64;
      ++v16;
    }
    while ((v16 * 4) != 256);
    int v26 = 1065353216;
    float __B = 16.0;
    uint64_t v17 = 1;
    vDSP_vthrsc(__A, 1, &__B, (const float *)&v26, __D, 1, 0x40uLL);
    int v19 = 0;
    float v20 = __D[0];
    do
    {
      float v21 = __D[v17];
      if (v21 < v20 && v19 == 0)
      {
        int v19 = 1;
        int v18 = v17;
      }
      else if (v21 > v20 && v19 == 1)
      {
        [(AKFormFeatureDetector *)self _findExtentForLineTop:v9 lineBottom:v12 + 16.0 - v10 - (double)v18 * 0.25 x:v12 + 16.0 - v10 - (double)(int)v17 * 0.25 onPage:v11];
        long long v24 = +[AKFormFeature featureWithRect:onPage:](AKFormFeatureLine, "featureWithRect:onPage:", v9);
        goto LABEL_22;
      }
      ++v17;
      float v20 = v21;
    }
    while (v17 != 64);
    long long v24 = 0;
LABEL_22:
    CGContextRelease(v14);
  }
  else
  {
    long long v24 = 0;
  }

  return v24;
}

- (id)_defaultFeatureForPoint:(CGPoint)a3 onPage:(id)a4 snapToVerticalEdges:(BOOL)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [WeakRetained wantsDefaultFeatures]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [WeakRetained defaultFeatureSizeForPage:v9];
    double v12 = v11;
    double v14 = v13;
    if (a5)
    {
      -[AKFormFeatureDetector _findVerticalEdgesAtPoint:extent:onPage:](self, "_findVerticalEdgesAtPoint:extent:onPage:", (uint64_t)v11, v9, x, y);
      double v15 = v22;
      double v16 = v24 - v12;
      if (v23)
      {
        uint64_t v17 = 11;
      }
      else
      {
        double v16 = x + v12 * -0.0;
        uint64_t v17 = 3;
      }
      if (v21)
      {
        uint64_t v18 = 7;
      }
      else
      {
        double v15 = v16;
        uint64_t v18 = v17;
      }
    }
    else
    {
      double v15 = x + v11 * -0.0;
      uint64_t v18 = 3;
    }
    int v19 = +[AKFormFeatureBox boxWithRect:onPage:flags:baseline:](AKFormFeatureBox, "boxWithRect:onPage:flags:baseline:", v9, v18, 0, v15, y + v14 * -0.5, v12, v14);
  }
  else
  {
    int v19 = 0;
  }

  return v19;
}

- (id)_boxOnLine:(id)a3 atPoint:(CGPoint)a4
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    double v7 = [v5 page];
    [WeakRetained defaultFeatureSizeForPage:v7];
    double v9 = v8;
    [v5 rect];
    CGFloat x = v18.origin.x;
    CGFloat y = v18.origin.y;
    double width = v18.size.width;
    CGFloat height = v18.size.height;
    double MinX = CGRectGetMinX(v18);
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.double width = width;
    v19.size.CGFloat height = height;
    double v15 = +[AKFormFeatureBox boxWithRect:onPage:flags:baseline:](AKFormFeatureBox, "boxWithRect:onPage:flags:baseline:", v7, 0, v5, MinX, CGRectGetMaxY(v19), width, v9);
  }
  else
  {
    double v15 = 0;
  }

  return v15;
}

- (CGRect)_findExtentForLineTop:(double)a3 lineBottom:(double)a4 x:(double)a5 onPage:(id)a6
{
  id v9 = a6;
  double v10 = v9;
  double MinX = *MEMORY[0x263F001A8];
  double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v13 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
  if (v9)
  {
    double v50 = a5;
    double v15 = a3 - a4;
    double v16 = a3 - a4 + 2.0;
    uint64_t v17 = [v9 overlayView];
    [v17 bounds];
    double v19 = v18;

    unint64_t v20 = vcvtpd_u64_f64(v19);
    unint64_t v21 = vcvtpd_u64_f64(v16 * 4.0);
    if (v21 && v20 != 0)
    {
      DeviceGraCGFloat y = CGColorSpaceCreateDeviceGray();
      size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(DeviceGray);
      double v25 = (CGContext *)objc_msgSend((id)objc_opt_class(), "_newBitmapInRect:onPage:scale:", v10, 0.0, 0.0, (double)v20, (double)v21, 1.0);
      if (v25)
      {
        size_t v26 = NumberOfComponents * v20;
        v51.origin.CGFloat x = 0.0;
        double v12 = a4;
        v51.origin.CGFloat y = a4;
        v51.size.double width = v19;
        v51.size.CGFloat height = v16;
        double MinX = CGRectGetMinX(v51);
        v52.origin.CGFloat x = 0.0;
        v52.origin.CGFloat y = a4;
        v52.size.double width = v19;
        v52.size.CGFloat height = v16;
        double MaxX = CGRectGetMaxX(v52);
        Data = (char *)CGBitmapContextGetData(v25);
        unint64_t v29 = vcvtmd_u64_f64(v50);
        double v14 = v15;
        unint64_t v30 = vcvtpd_u64_f64(v15 * 4.0);
        if (v29 < v20)
        {
          unint64_t v31 = v29;
          while (1)
          {
            unint64_t v32 = 0;
            uint64_t v33 = Data;
            uint64_t v34 = 8;
            do
            {
              if (v33[v31] < 0xABu) {
                ++v32;
              }
              v33 += v26;
              --v34;
            }
            while (v34);
            if (v21 < 9)
            {
              uint64_t v35 = 0;
            }
            else
            {
              uint64_t v35 = 0;
              vDSP_Length v36 = &Data[8 * v26];
              unint64_t v37 = v21 - 8;
              do
              {
                if (v36[v31] > 0xDBu) {
                  ++v35;
                }
                v36 += v26;
                --v37;
              }
              while (v37);
            }
            if (v35 == v30 || v32 > 2) {
              break;
            }
            if (++v31 == v20) {
              goto LABEL_27;
            }
          }
          double MaxX = (double)v31;
        }
LABEL_27:
        if (v29)
        {
          while (1)
          {
            unint64_t v39 = 0;
            CGRect v40 = Data;
            uint64_t v41 = 8;
            do
            {
              if (v40[v29] < 0xABu) {
                ++v39;
              }
              v40 += v26;
              --v41;
            }
            while (v41);
            if (v21 < 9)
            {
              uint64_t v42 = 0;
            }
            else
            {
              uint64_t v42 = 0;
              int64_t v43 = &Data[8 * v26];
              unint64_t v44 = v21 - 8;
              do
              {
                if (v43[v29] > 0xDBu) {
                  ++v42;
                }
                v43 += v26;
                --v44;
              }
              while (v44);
            }
            if (v42 == v30 || v39 > 2) {
              break;
            }
            if (!--v29) {
              goto LABEL_46;
            }
          }
          double MinX = (double)v29 + 1.0;
        }
LABEL_46:
        double v13 = MaxX - MinX;
      }
      if (DeviceGray) {
        CGColorSpaceRelease(DeviceGray);
      }
      if (v25) {
        CGContextRelease(v25);
      }
    }
  }

  double v46 = MinX;
  double v47 = v12;
  double v48 = v13;
  double v49 = v14;
  result.size.CGFloat height = v49;
  result.size.double width = v48;
  result.origin.CGFloat y = v47;
  result.origin.CGFloat x = v46;
  return result;
}

+ (CGContext)_newBitmapInRect:(CGRect)a3 onPage:(id)a4 scale:(double)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  double v11 = [v10 controller];
  double v12 = [v11 delegate];
  objc_msgSend(v10, "convertRectFromModelToOverlay:", x, y, width, height);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  uint64_t v21 = [v10 pageIndex];

  CFDataRef v22 = (const __CFData *)objc_msgSend(v12, "newContentSnapshotPDFDataIncludingAdornments:atScale:inRect:onOverlayAtPageIndex:forAnnotationController:", 0, v21, v11, a5, v14, v16, v18, v20);
  CFDataRef v23 = v22;
  if (v22 && (double v24 = CGDataProviderCreateWithCFData(v22)) != 0)
  {
    double v25 = v24;
    CGPDFDocumentRef v26 = CGPDFDocumentCreateWithProvider(v24);
    if (v26)
    {
      int64_t v27 = v26;
      BOOL v28 = (CGContext *)[(id)objc_opt_class() _newBitmapFromCGPDFDocument:v26];
      CGPDFDocumentRelease(v27);
    }
    else
    {
      BOOL v28 = 0;
    }
    CGDataProviderRelease(v25);
  }
  else
  {
    BOOL v28 = 0;
  }

  return v28;
}

+ (CGContext)_newBitmapFromCGPDFDocument:(CGPDFDocument *)a3
{
  if (!a3) {
    return 0;
  }
  if (!CGPDFDocumentGetNumberOfPages(a3)) {
    return 0;
  }
  Page = CGPDFDocumentGetPage(a3, 1uLL);
  if (!Page) {
    return 0;
  }
  id v5 = Page;
  CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
  double x = BoxRect.origin.x;
  double y = BoxRect.origin.y;
  double width = BoxRect.size.width;
  double height = BoxRect.size.height;
  id v10 = j__NSStringFromCGRect(BoxRect);
  NSLog(&cfstr_PageBounds.isa, v10);

  size_t v11 = vcvtpd_u64_f64(width);
  size_t v12 = vcvtpd_u64_f64(height);
  if (!v11 || v12 == 0) {
    return 0;
  }
  DeviceGradouble y = CGColorSpaceCreateDeviceGray();
  size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(DeviceGray);
  double v18 = CGBitmapContextCreate(0, v11, v12, 8uLL, NumberOfComponents * v11, DeviceGray, 0);
  double v14 = v18;
  if (v18)
  {
    CGContextSetInterpolationQuality(v18, kCGInterpolationNone);
    CGContextSetShouldAntialias(v14, 0);
    CGContextSetAllowsAntialiasing(v14, 0);
    CGContextSetGrayFillColor(v14, 1.0, 1.0);
    v20.origin.double x = 0.0;
    v20.origin.double y = 0.0;
    v20.size.double width = (double)(unint64_t)ceil(width);
    v20.size.double height = (double)(unint64_t)ceil(height);
    CGContextFillRect(v14, v20);
    CGContextSaveGState(v14);
    CGContextScaleCTM(v14, 1.0, 1.0);
    CGContextTranslateCTM(v14, -x, -y);
    CGContextDrawPDFPage(v14, v5);
    CGContextRestoreGState(v14);
  }
  if (DeviceGray) {
    CGColorSpaceRelease(DeviceGray);
  }
  return v14;
}

- (AKFormFeatureDetectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKFormFeatureDetectorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end