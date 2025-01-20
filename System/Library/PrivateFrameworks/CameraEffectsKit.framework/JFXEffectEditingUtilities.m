@interface JFXEffectEditingUtilities
+ (BOOL)canEditTextForEffect:(id)a3;
+ (BOOL)isFaceTrackingDataAvailable;
+ (BOOL)isStreamingMode;
+ (BOOL)makeOverlayTrackedMaintainingAppearance:(id)a3 atTime:(id *)a4 newTrackingType:(int64_t)a5 arMetadata:(id)a6 playableInterfaceOrientation:(int64_t)a7;
+ (BOOL)shouldAutoEditTextForEffect:(id)a3;
+ (BOOL)shouldDisableTextOutlineWhileEditingTextForEffectID:(id)a3;
+ (BOOL)shouldRenderTextWithMotionWhileEditingTextForEffectID:(id)a3;
+ (BOOL)shouldUseFullTransformWhileEditingTextForEffectID:(id)a3;
+ (CGPoint)JFX_closeButtonInsetForEffect:(id)a3 viewBounds:(CGRect)a4;
+ (CGPoint)JFX_convertPoint:(CGPoint)a3 fromSize:(CGSize)a4 toSize:(CGSize)a5 invertY:(BOOL)a6;
+ (CGPoint)nextNormalizedInsertionPointForOverlay:(id)a3 scaleRelativeToCenterSquare:(double)a4 atTime:(id *)a5 applyTracking:(BOOL)a6 withARMetadata:(id)a7 transformAnimation:(id)a8 playableMediaContentMode:(int)a9 playableInterfaceOrientation:(int64_t)a10;
+ (CGPoint)removeButtonPositionForEffect:(id)a3 atTime:(id *)a4 atPosterFrameRelativeToBounds:(CGRect)a5 viewCorrectionTransform:(CGAffineTransform *)a6;
+ (CGPoint)spacingBetweenCenterPointOfEffect:(id)a3 point:(CGPoint)a4 relativeToBounds:(CGRect)a5 atTime:(id *)a6;
+ (CGRect)JFX_compositionBounds;
+ (CGRect)JFX_currentFaceRectRelativeToBounds:(CGRect)a3 atTime:(id *)a4 faceAnchor:(id)a5 transformAnimation:(id)a6 playableMediaContentMode:(int)a7 playableInterfaceOrientation:(int64_t)a8 playableAspectRatio:(int64_t)a9 playableAspectRatioPreservationMode:(int64_t)a10;
+ (CGRect)JFX_rectAtNormalizedPointinCenteredSquareInFaceRect:(CGPoint)a3 faceAnchor:(id)a4 atTime:(id *)a5 scaleRelativeToCenterSquare:(double)a6 relativeToBounds:(CGRect)a7 transformAnimation:(id)a8 playableMediaContentMode:(int)a9 playableInterfaceOrientation:(int64_t)a10 playableAspectRatio:(int64_t)a11 playableAspectRatioPreservationMode:(int64_t)a12;
+ (CGRect)currentFaceRectRelativeToBounds:(CGRect)a3 atTime:(id *)a4 transformAnimation:(id)a5 playableMediaContentMode:(int)a6 playableInterfaceOrientation:(int64_t)a7 playableAspectRatio:(int64_t)a8 playableAspectRatioPreservationMode:(int64_t)a9;
+ (id)JFX_hitTestOverlays:(id)a3 atNormalizedPoint:(CGPoint)a4 atTime:(id *)a5 forcePosterFrame:(BOOL)a6 adjustForMinimumSize:(BOOL)a7 normalizedMinimumSize:(id)a8;
+ (id)hitTestOverlays:(id)a3 atPoint:(CGPoint)a4 relativeToBounds:(CGRect)a5 atTime:(id *)a6 adjustForMinimumSize:(BOOL)a7 normalizedMinimumSize:(id)a8;
+ (id)hitTestOverlaysAtPosterFrame:(id)a3 atNormalizedPoint:(CGPoint)a4 atTime:(id *)a5 adjustForMinimumSize:(BOOL)a6 normalizedMinimumSize:(id)a7;
+ (id)hitTestOverlaysAtPosterFrame:(id)a3 atPoint:(CGPoint)a4 relativeToBounds:(CGRect)a5 atTime:(id *)a6 adjustForMinimumSize:(BOOL)a7 normalizedMinimumSize:(id)a8;
+ (id)newTextEditingPropertiesForEffect:(id)a3 relativeTo:(CGRect)a4 atTime:(id *)a5 withNewText:(id)a6;
+ (id)newTextEditingPropertiesForEffect:(id)a3 relativeTo:(CGRect)a4 atTime:(id *)a5 withNewText:(id)a6 moveBeforeScalingToAvoidKeyboard:(BOOL)a7;
+ (id)normalizedInsertionPoints;
+ (id)textForEffect:(id)a3;
+ (id)trackedNormalizedInsertionPoints;
+ (int64_t)trackingTypeForOverlayPointIntersectionWithFaceRect:(CGPoint)a3 atTime:(id *)a4 relativeTo:(CGRect)a5 defaultTrackingType:(int64_t)a6 faceAnchor:(id)a7 transformAnimation:(id)a8 playableMediaContentMode:(int)a9 playableInterfaceOrientation:(int64_t)a10 playableAspectRatio:(int64_t)a11 playableAspectRatioPreservationMode:(int64_t)a12;
+ (unint64_t)JFX_bestTrackedInsertionPointIndexForOverlay:(id)a3 atTime:(id *)a4 insertionPoints:(id)a5 startingIndex:(unint64_t)a6 visibilityThreshold:(double)a7 scaleRelativeToCenterSquare:(double)a8 withARMetadata:(id)a9 transformAnimation:(id)a10 playableMediaContentMode:(int)a11 playableInterfaceOrientation:(int64_t)a12;
+ (unint64_t)insertionPointIndex;
+ (unint64_t)maximumTextLengthForEffect:(id)a3;
+ (unint64_t)nextInsertionPointIndex;
+ (void)JFX_ApplyTextFlipIfNeeded:(id)a3 transform:(CGAffineTransform *)a4;
+ (void)JFX_setTextRenderingEnabledForEffect:(id)a3 value:(BOOL)a4;
+ (void)addTransformToEffect:(id)a3 transform:(CGAffineTransform *)a4 relativeToBounds:(CGRect)a5 time:(id *)a6 restrictToBounds:(BOOL)a7;
+ (void)applyCameraTrackingTransformToOverlay:(id)a3 withARMetadata:(id)a4 playableInterfaceOrientation:(int64_t)a5;
+ (void)beginTextEditingForEffect:(id)a3;
+ (void)configureOverlayForInsertion:(id)a3 atNormalizedPoint:(CGPoint)a4 atTime:(id *)a5 isPositionRelativeToCenterSquare:(BOOL)a6 isPositionRelativeToFace:(BOOL)a7 scaleRelativeToCenterSquare:(double)a8 rotationAngle:(double)a9 applyTracking:(BOOL)a10 autoDetectTrackingType:(BOOL)a11 withARMetadata:(id)a12 previewViewCorrectionTransform:(CGAffineTransform *)a13 transformAnimation:(id)a14 playableMediaContentMode:(int)a15 playableInterfaceOrientation:(int64_t)a16 playableAspectRatio:(int64_t)a17 playableAspectRatioPreservationMode:(int64_t)a18;
+ (void)configureOverlayForInsertion:(id)a3 inRect:(CGRect)a4 atTime:(id *)a5 rotationAngle:(double)a6 applyTracking:(BOOL)a7 autoDetectTrackingType:(BOOL)a8 withARMetadata:(id)a9 previewViewCorrectionTransform:(CGAffineTransform *)a10 transformAnimation:(id)a11 playableMediaContentMode:(int)a12 playableInterfaceOrientation:(int64_t)a13 playableAspectRatio:(int64_t)a14 playableAspectRatioPreservationMode:(int64_t)a15;
+ (void)disableAnimationForEffects:(id)a3;
+ (void)enableAnimationForEffects:(id)a3 animationStartTime:(id *)a4;
+ (void)endTextEditingForEffect:(id)a3;
+ (void)setInsertionPointIndex:(unint64_t)a3;
+ (void)setStreamingMode:(BOOL)a3;
+ (void)suspendOverlayTrackingMaintainingAppearance:(id)a3 forViewBounds:(CGRect)a4 atTime:(id *)a5 arMetadata:(id)a6 playableInterfaceOrientation:(int64_t)a7;
+ (void)updateEffectText:(id)a3 newText:(id)a4;
+ (void)updateEffectToDefaultTextIfEmpty:(id)a3;
@end

@implementation JFXEffectEditingUtilities

+ (BOOL)isStreamingMode
{
  return s_isStreamingMode;
}

+ (void)setStreamingMode:(BOOL)a3
{
  s_isStreamingMode = a3;
}

+ (id)normalizedInsertionPoints
{
  if (normalizedInsertionPoints_onceToken != -1) {
    dispatch_once(&normalizedInsertionPoints_onceToken, &__block_literal_global_48);
  }
  v2 = (void *)normalizedInsertionPoints_s_normalizedInsertionPoints;
  return v2;
}

void __54__JFXEffectEditingUtilities_normalizedInsertionPoints__block_invoke()
{
  v6[4] = *MEMORY[0x263EF8340];
  v0 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", 0.6, 0.4);
  v6[0] = v0;
  v1 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", 0.4, 0.55);
  v6[1] = v1;
  v2 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", 0.4, 0.4);
  v6[2] = v2;
  v3 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", 0.6, 0.55);
  v6[3] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v5 = (void *)normalizedInsertionPoints_s_normalizedInsertionPoints;
  normalizedInsertionPoints_s_normalizedInsertionPoints = v4;
}

+ (id)trackedNormalizedInsertionPoints
{
  if (trackedNormalizedInsertionPoints_onceToken != -1) {
    dispatch_once(&trackedNormalizedInsertionPoints_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)trackedNormalizedInsertionPoints_s_trackedNormalizedInsertionPoints;
  return v2;
}

void __61__JFXEffectEditingUtilities_trackedNormalizedInsertionPoints__block_invoke()
{
  v6[4] = *MEMORY[0x263EF8340];
  v0 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", 1.05, -0.05);
  v6[0] = v0;
  v1 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", -0.05, 1.05);
  v6[1] = v1;
  v2 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", -0.05, -0.05);
  v6[2] = v2;
  v3 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", 1.05, 1.05);
  v6[3] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v5 = (void *)trackedNormalizedInsertionPoints_s_trackedNormalizedInsertionPoints;
  trackedNormalizedInsertionPoints_s_trackedNormalizedInsertionPoints = v4;
}

+ (unint64_t)insertionPointIndex
{
  return s_insertionPointIndex;
}

+ (void)setInsertionPointIndex:(unint64_t)a3
{
  s_insertionPointIndex = a3;
  uint64_t v4 = [a1 normalizedInsertionPoints];
  unint64_t v5 = [v4 count];

  if (v5 <= a3) {
    s_insertionPointIndex = 0;
  }
}

+ (unint64_t)nextInsertionPointIndex
{
  unint64_t v2 = s_insertionPointIndex++;
  unint64_t v3 = s_insertionPointIndex;
  uint64_t v4 = [a1 normalizedInsertionPoints];
  unint64_t v5 = [v4 count];

  if (v3 >= v5) {
    s_insertionPointIndex = 0;
  }
  return v2;
}

+ (CGPoint)nextNormalizedInsertionPointForOverlay:(id)a3 scaleRelativeToCenterSquare:(double)a4 atTime:(id *)a5 applyTracking:(BOOL)a6 withARMetadata:(id)a7 transformAnimation:(id)a8 playableMediaContentMode:(int)a9 playableInterfaceOrientation:(int64_t)a10
{
  BOOL v13 = a6;
  id v17 = a3;
  id v18 = a7;
  id v19 = a8;
  if (v17)
  {
    uint64_t v20 = [a1 nextInsertionPointIndex];
    v21 = [v18 faceAnchor];

    if (v13 && v21)
    {
      v22 = [a1 trackedNormalizedInsertionPoints];
      long long v31 = *(_OWORD *)&a5->var0;
      int64_t var3 = a5->var3;
      LODWORD(v30) = a9;
      uint64_t v20 = objc_msgSend(a1, "JFX_bestTrackedInsertionPointIndexForOverlay:atTime:insertionPoints:startingIndex:visibilityThreshold:scaleRelativeToCenterSquare:withARMetadata:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:", v17, &v31, v22, v20, v18, v19, 0.4, a4, v30, a10);
      [a1 setInsertionPointIndex:v20 + 1];
    }
    else
    {
      v22 = [a1 normalizedInsertionPoints];
    }
    v25 = [v22 objectAtIndexedSubscript:v20];
    [v25 CGPointValue];
    double v23 = v26;
    double v24 = v27;
  }
  else
  {
    double v23 = *MEMORY[0x263F00148];
    double v24 = *(double *)(MEMORY[0x263F00148] + 8);
  }

  double v28 = v23;
  double v29 = v24;
  result.y = v29;
  result.x = v28;
  return result;
}

+ (unint64_t)JFX_bestTrackedInsertionPointIndexForOverlay:(id)a3 atTime:(id *)a4 insertionPoints:(id)a5 startingIndex:(unint64_t)a6 visibilityThreshold:(double)a7 scaleRelativeToCenterSquare:(double)a8 withARMetadata:(id)a9 transformAnimation:(id)a10 playableMediaContentMode:(int)a11 playableInterfaceOrientation:(int64_t)a12
{
  id v18 = a3;
  id v19 = a5;
  id v20 = a9;
  id v57 = a10;
  v21 = [v20 faceAnchor];

  if (v21)
  {
    objc_msgSend(a1, "JFX_compositionBounds");
    double v53 = v23;
    double v54 = v22;
    double v51 = v25;
    double v52 = v24;
    uint64_t v26 = [v19 count];
    if (v26)
    {
      unint64_t v27 = v26;
      id v50 = a1;
      double v28 = 0.0;
      uint64_t v29 = v26;
      unint64_t v30 = a6;
      while (1)
      {
        double v58 = v28;
        id v31 = v19;
        v32 = [v19 objectAtIndexedSubscript:v30];
        [v32 CGPointValue];
        double v34 = v33;
        double v36 = v35;

        v37 = [v20 faceAnchor];
        uint64_t v38 = [v18 playableAspectRatio];
        uint64_t v39 = [v18 playableAspectRatioPreservationMode];
        long long v59 = *(_OWORD *)&a4->var0;
        int64_t var3 = a4->var3;
        objc_msgSend(v50, "JFX_rectAtNormalizedPointinCenteredSquareInFaceRect:faceAnchor:atTime:scaleRelativeToCenterSquare:relativeToBounds:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", v37, &v59, v57, a11, a12, v38, v34, v36, a8, v54, v53, v52, v51, v39);
        double v41 = v40;
        double v43 = v42;
        double v45 = v44;
        double v47 = v46;

        double v48 = CGRectPercentOfRectThatIntersectsRect(v41, v43, v45, v47, v54, v53, v52, v51);
        if (v48 > a7) {
          break;
        }
        double v28 = v58;
        if (v48 > v58)
        {
          double v28 = v48;
          a6 = v30;
        }
        if (v30 + 1 < v27) {
          ++v30;
        }
        else {
          unint64_t v30 = 0;
        }
        --v29;
        id v19 = v31;
        if (!v29) {
          goto LABEL_13;
        }
      }
      a6 = v30;
      id v19 = v31;
    }
  }
LABEL_13:

  return a6;
}

+ (CGRect)JFX_rectAtNormalizedPointinCenteredSquareInFaceRect:(CGPoint)a3 faceAnchor:(id)a4 atTime:(id *)a5 scaleRelativeToCenterSquare:(double)a6 relativeToBounds:(CGRect)a7 transformAnimation:(id)a8 playableMediaContentMode:(int)a9 playableInterfaceOrientation:(int64_t)a10 playableAspectRatio:(int64_t)a11 playableAspectRatioPreservationMode:(int64_t)a12
{
  double x = a3.x;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v26 = *a5;
  objc_msgSend(a1, "JFX_currentFaceRectRelativeToBounds:atTime:faceAnchor:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", &v26, a4, a8, *(void *)&a9, a10, a11, a7.origin.x, a7.origin.y, a7.size.width, a7.size.height, a12);
  double v17 = v16;
  double v19 = v18;
  if (v14 > v15) {
    double x = (x + (v14 / v15 + -1.0) * 0.5) / (v14 / v15);
  }
  double v20 = fmin(v14, v15) * a6;
  double v21 = v17 + CGRectMakeWithSizeAndCenterPoint(v20, v20, v14 * x);
  double v25 = v19 + v24;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v25;
  result.origin.double x = v21;
  return result;
}

+ (void)configureOverlayForInsertion:(id)a3 atNormalizedPoint:(CGPoint)a4 atTime:(id *)a5 isPositionRelativeToCenterSquare:(BOOL)a6 isPositionRelativeToFace:(BOOL)a7 scaleRelativeToCenterSquare:(double)a8 rotationAngle:(double)a9 applyTracking:(BOOL)a10 autoDetectTrackingType:(BOOL)a11 withARMetadata:(id)a12 previewViewCorrectionTransform:(CGAffineTransform *)a13 transformAnimation:(id)a14 playableMediaContentMode:(int)a15 playableInterfaceOrientation:(int64_t)a16 playableAspectRatio:(int64_t)a17 playableAspectRatioPreservationMode:(int64_t)a18
{
  BOOL v18 = a11;
  BOOL v66 = a10;
  BOOL v21 = a7;
  double y = a4.y;
  double x = a4.x;
  id v27 = a3;
  id v28 = a12;
  id v29 = a14;
  if (v27)
  {
    [v27 setPlayableAspectRatio:a17];
    [v27 setPlayableAspectRatioPreservationMode:a18];
    [v27 setTransformAnimation:v29];
    double v30 = multiplierForAspectRatio(a17);
    [v27 transformAnimation];
    v32 = id v31 = a1;
    [v32 setAspectRatio:v30];

    objc_msgSend(v31, "JFX_compositionBounds");
    double v36 = v35;
    double v38 = v37;
    double v39 = v33;
    double v40 = v34;
    if (!a6)
    {
      if (v33 <= v34)
      {
        if (v34 > v33) {
          double y = y * (v34 / v33) + (v34 / v33 + -1.0) * -0.5;
        }
      }
      else
      {
        double x = x * (v33 / v34) + (v33 / v34 + -1.0) * -0.5;
      }
    }
    double v41 = [v28 faceAnchor];

    if (v66 && v41 && v21)
    {
      double v42 = v31;
      double v43 = objc_opt_class();
      double v44 = [v28 faceAnchor];
      long long v67 = *(_OWORD *)&a5->var0;
      *(void *)&long long v68 = a5->var3;
      int64_t v45 = a18;
      objc_msgSend(v43, "JFX_rectAtNormalizedPointinCenteredSquareInFaceRect:faceAnchor:atTime:scaleRelativeToCenterSquare:relativeToBounds:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", v44, &v67, v29, a15, a16, a17, x, y, a8, v36, v38, v39, v40, a18);
      double v47 = v46;
      double v49 = v48;
      double v51 = v50;
      double v53 = v52;

      int64_t v54 = a17;
      BOOL v55 = v18;
      v56 = a13;
    }
    else
    {
      objc_msgSend(v27, "playableRectInOutputSize:", v39, v40);
      double v59 = fmin(v57, v58) * a8;
      if (v39 > v40) {
        double x = ((v39 / v40 + -1.0) * 0.5 + x) / (v39 / v40);
      }
      BOOL v55 = v18;
      double v42 = v31;
      double v47 = CGRectMakeWithSizeAndCenterPoint(v59, v59, v39 * x);
      double v49 = v60;
      double v51 = v61;
      double v53 = v62;
      v56 = a13;
      int64_t v45 = a18;
      int64_t v54 = a17;
    }
    long long v63 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    long long v64 = *(_OWORD *)&v56->c;
    long long v67 = *(_OWORD *)&v56->a;
    long long v68 = v64;
    long long v69 = *(_OWORD *)&v56->tx;
    long long v70 = v63;
    LODWORD(v65) = a15;
    objc_msgSend(v42, "configureOverlayForInsertion:inRect:atTime:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", v27, &v70, v66, v55, v28, &v67, v47, v49, v51, v53, a9, v29, v65, a16, v54,
      v45);
  }
}

+ (void)configureOverlayForInsertion:(id)a3 inRect:(CGRect)a4 atTime:(id *)a5 rotationAngle:(double)a6 applyTracking:(BOOL)a7 autoDetectTrackingType:(BOOL)a8 withARMetadata:(id)a9 previewViewCorrectionTransform:(CGAffineTransform *)a10 transformAnimation:(id)a11 playableMediaContentMode:(int)a12 playableInterfaceOrientation:(int64_t)a13 playableAspectRatio:(int64_t)a14 playableAspectRatioPreservationMode:(int64_t)a15
{
  BOOL v17 = a8;
  BOOL v18 = a7;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v26 = a3;
  id v27 = a9;
  id v28 = a11;
  if (v26)
  {
    BOOL v56 = v17;
    double v58 = x;
    [v26 setTransformAnimation:v28];
    double v29 = multiplierForAspectRatio(a14);
    double v30 = [v26 transformAnimation];
    [v30 setAspectRatio:v29];

    objc_msgSend(a1, "JFX_compositionBounds");
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    objc_msgSend(v26, "setRenderSize:", v35, v37);
    [v26 setPlayableAspectRatio:a14];
    [v26 setPlayableAspectRatioPreservationMode:a15];
    [v26 enablePresentationState:1];
    double v39 = [v26 renderEffect];
    v63[0] = kDefaultEffectPreviewAnimationRange;
    v63[1] = xmmword_234D62718;
    v63[2] = xmmword_234D62728;
    [v39 setEffectRange:v63];

    long long v40 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v62.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v62.c = v40;
    *(_OWORD *)&v62.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    if (a6 != 0.0) {
      CGAffineTransformMakeRotation(&v62, a6);
    }
    long long v41 = *(_OWORD *)&a10->c;
    *(_OWORD *)&v61.a = *(_OWORD *)&a10->a;
    *(_OWORD *)&v61.c = v41;
    *(_OWORD *)&v61.tCGFloat x = *(_OWORD *)&a10->tx;
    if (!CGAffineTransformIsIdentity(&v61))
    {
      CGAffineTransform t1 = v62;
      long long v42 = *(_OWORD *)&a10->c;
      *(_OWORD *)&t2.a = *(_OWORD *)&a10->a;
      *(_OWORD *)&t2.c = v42;
      *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&a10->tx;
      CGAffineTransformConcat(&v61, &t1, &t2);
      CGAffineTransform v62 = v61;
    }
    CGAffineTransform v61 = v62;
    double v43 = v58;
    if (!CGAffineTransformIsIdentity(&v61))
    {
      CGAffineTransform v61 = v62;
      *(_OWORD *)&t1.a = *(_OWORD *)&a5->var0;
      *(void *)&t1.c = a5->var3;
      objc_msgSend(a1, "addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:", v26, &v61, &t1, 0, v32, v34, v36, v38);
    }
    *(_OWORD *)&v61.a = *(_OWORD *)&a5->var0;
    *(void *)&v61.c = a5->var3;
    objc_msgSend(v26, "applyScaleToFitFrame:withComponentTime:relativeRect:restrictToBounds:", &v61, 1, v58, y, width, height, v32, v34, v36, v38);
    double v44 = [v27 faceAnchor];

    if (v18 && v44)
    {
      if (v56)
      {
        double CenterPoint = CGRectGetCenterPoint(v58, y, width, height);
        double v57 = v34;
        double v46 = v32;
        double v47 = y;
        double v48 = width;
        double v49 = height;
        double v51 = v50;
        double v52 = [v27 faceAnchor];
        *(_OWORD *)&v61.a = *(_OWORD *)&a5->var0;
        *(void *)&v61.c = a5->var3;
        double v53 = CenterPoint;
        double v54 = v51;
        double height = v49;
        double width = v48;
        double y = v47;
        double v32 = v46;
        double v34 = v57;
        double v43 = v58;
        uint64_t v55 = objc_msgSend(a1, "trackingTypeForOverlayPointIntersectionWithFaceRect:atTime:relativeTo:defaultTrackingType:faceAnchor:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", &v61, 2, v52, v28, a12, a13, v53, v54, v32, v57, v36, v38, a14, a15);
      }
      else
      {
        uint64_t v55 = 2;
      }
      *(_OWORD *)&v61.a = *(_OWORD *)&a5->var0;
      *(void *)&v61.c = a5->var3;
      [a1 makeOverlayTrackedMaintainingAppearance:v26 atTime:&v61 newTrackingType:v55 arMetadata:v27 playableInterfaceOrientation:a13];
      *(_OWORD *)&v61.a = *(_OWORD *)&a5->var0;
      *(void *)&v61.c = a5->var3;
      objc_msgSend(v26, "applyScaleToFitFrame:withComponentTime:relativeRect:restrictToBounds:", &v61, 1, v43, y, width, height, v32, v34, v36, v38);
    }
  }
}

+ (id)hitTestOverlays:(id)a3 atPoint:(CGPoint)a4 relativeToBounds:(CGRect)a5 atTime:(id *)a6 adjustForMinimumSize:(BOOL)a7 normalizedMinimumSize:(id)a8
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a6;
  v8 = objc_msgSend(a1, "JFX_hitTestOverlays:atNormalizedPoint:atTime:forcePosterFrame:adjustForMinimumSize:normalizedMinimumSize:", a3, &v10, 0, a7, a4.x / a5.size.width, a4.y / a5.size.height, a8.var0, a8.var1);
  return v8;
}

+ (id)hitTestOverlaysAtPosterFrame:(id)a3 atPoint:(CGPoint)a4 relativeToBounds:(CGRect)a5 atTime:(id *)a6 adjustForMinimumSize:(BOOL)a7 normalizedMinimumSize:(id)a8
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a6;
  v8 = objc_msgSend(a1, "JFX_hitTestOverlays:atNormalizedPoint:atTime:forcePosterFrame:adjustForMinimumSize:normalizedMinimumSize:", a3, &v10, 1, a7, a4.x / a5.size.width, a4.y / a5.size.height, a8.var0, a8.var1);
  return v8;
}

+ (id)hitTestOverlaysAtPosterFrame:(id)a3 atNormalizedPoint:(CGPoint)a4 atTime:(id *)a5 adjustForMinimumSize:(BOOL)a6 normalizedMinimumSize:(id)a7
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a5;
  v7 = objc_msgSend(a1, "JFX_hitTestOverlays:atNormalizedPoint:atTime:forcePosterFrame:adjustForMinimumSize:normalizedMinimumSize:", a3, &v9, 1, a6, a4.x, a4.y, a7.var0, a7.var1);
  return v7;
}

+ (id)JFX_hitTestOverlays:(id)a3 atNormalizedPoint:(CGPoint)a4 atTime:(id *)a5 forcePosterFrame:(BOOL)a6 adjustForMinimumSize:(BOOL)a7 normalizedMinimumSize:(id)a8
{
  double var1 = a8.var1;
  double var0 = a8.var0;
  BOOL v10 = a7;
  BOOL v11 = a6;
  double y = a4.y;
  double x = a4.x;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v15 = a3;
  if ([v15 count])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    double v16 = [v15 reverseObjectEnumerator];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v32 != v19) {
            objc_enumerationMutation(v16);
          }
          BOOL v21 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          double v22 = [v21 renderEffect];
          [v22 outputSize];
          double v24 = v23;
          double v26 = v25;

          long long v29 = *(_OWORD *)&a5->var0;
          int64_t var3 = a5->var3;
          if (objc_msgSend(v21, "hitTestPoint:atTime:forcePosterFrame:relativeTo:basisOrigin:adjustForMinimumSize:normalizedMinimumSize:", &v29, v11, 1, v10, x * v24, y * v26, 0.0, 0.0, v24, v26, var0, var1))
          {
            id v27 = v21;
            goto LABEL_12;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
    id v27 = 0;
LABEL_12:
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

+ (void)suspendOverlayTrackingMaintainingAppearance:(id)a3 forViewBounds:(CGRect)a4 atTime:(id *)a5 arMetadata:(id)a6 playableInterfaceOrientation:(int64_t)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v14 = a3;
  id v15 = a6;
  if ([v14 isCurrentlyTracking])
  {
    double v16 = [v14 trackingProps];
    uint64_t v17 = [v16 currentTrackingType];

    if (v17 == 1)
    {
      uint64_t v18 = [v15 faceAnchor];
      +[JFXFaceTrackingUtilities rollAngleFromFaceAnchor:v18 forInterfaceOrientation:a7];

      uint64_t v19 = [v14 renderEffect];
      uint64_t v20 = [v19 origin];

      BOOL v21 = [v14 renderEffect];
      [v21 outputSize];

      double v22 = CGRectMakeWithSize();
      long long v59 = *(_OWORD *)&a5->var0;
      *(void *)&long long v60 = a5->var3;
      [v14 effectCenterAtTime:&v59 forcePosterFrame:1 includeTransformAnimation:0 includePlayableAspectScale:0 relativeTo:v20 basisOrigin:v22];
      uint64_t v49 = v24;
      uint64_t v50 = v23;
      double v25 = [v14 faceTrackingTransform];
      double v26 = JFXMakeFaceTrackedEffectTransformFaceCamera(v25);
      [v14 setFaceTrackingTransform:v26];

      long long v59 = *(_OWORD *)&a5->var0;
      *(void *)&long long v60 = a5->var3;
      objc_msgSend(v14, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v59, 1, 1, 1, x, y, width, height);
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      [v14 setFaceTrackingTransform:v25];
      [v14 suspendTracking];
      long long v59 = *(_OWORD *)&a5->var0;
      *(void *)&long long v60 = a5->var3;
      objc_msgSend(v14, "applyScaleToFitFrame:withComponentTime:relativeRect:", &v59, v28, v30, v32, v34, x, y, width, height);
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      if (v14) {
        [v14 topLevelTransform];
      }
      __asm { FMOV            V0.2D, #1.0 }
      pv_simd_matrix_rotate();
      long long v66 = v58;
      long long v63 = v56;
      long long v64 = v57;
      long long v59 = v52;
      long long v60 = v53;
      *(void *)&long long v40 = v50;
      *((void *)&v40 + 1) = v49;
      long long v61 = v54;
      long long v62 = v55;
      long long v65 = v40;
      var40[4] = v56;
      var40[0] = v52;
      var40[1] = v53;
      var40[2] = v54;
      var40[3] = v55;
      [v14 setTopLevelTransform:var40];
    }
    else
    {
      long long v59 = *(_OWORD *)&a5->var0;
      *(void *)&long long v60 = a5->var3;
      objc_msgSend(v14, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v59, 1, 1, 1, x, y, width, height);
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      double v48 = v47;
      [v14 suspendTracking];
      long long v59 = *(_OWORD *)&a5->var0;
      *(void *)&long long v60 = a5->var3;
      objc_msgSend(v14, "applyScaleToFitFrame:withComponentTime:relativeRect:", &v59, v42, v44, v46, v48, x, y, width, height);
    }
  }
}

+ (BOOL)makeOverlayTrackedMaintainingAppearance:(id)a3 atTime:(id *)a4 newTrackingType:(int64_t)a5 arMetadata:(id)a6 playableInterfaceOrientation:(int64_t)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = [v12 trackingProps];
  uint64_t v15 = [v14 currentTrackingType];

  if (a5) {
    _ZF = v15 == a5;
  }
  else {
    _ZF = 1;
  }
  BOOL v17 = !_ZF;
  if (!_ZF)
  {
    objc_msgSend(a1, "JFX_compositionBounds");
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v26 = [v13 faceAnchor];
    +[JFXFaceTrackingUtilities rollAngleFromFaceAnchor:v26 forInterfaceOrientation:a7];
    double v28 = v27;

    if (v15)
    {
      *(_OWORD *)&STACK[0x8C0] = *(_OWORD *)&a4->var0;
      STACK[0x8D0] = a4->var3;
      objc_msgSend(v12, "effectCenterAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:", &STACK[0x8C0], 1, 1, 1, 1, v19, v21, v23, v25);
      double v30 = v29;
      double v32 = v31;
      *(_OWORD *)&STACK[0x930] = 0u;
      *(_OWORD *)&STACK[0x920] = 0u;
      *(_OWORD *)&STACK[0x910] = 0u;
      *(_OWORD *)&STACK[0x900] = 0u;
      *(_OWORD *)&STACK[0x8F0] = 0u;
      *(_OWORD *)&STACK[0x8D0] = 0u;
      *(_OWORD *)&STACK[0x8E0] = 0u;
      *(_OWORD *)&STACK[0x8C0] = 0u;
      if (v12)
      {
        *(_OWORD *)&STACK[0x840] = *(_OWORD *)&a4->var0;
        STACK[0x850] = a4->var3;
        objc_msgSend(v12, "transformAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:", &STACK[0x840], 1, 0, 1, 1, v19, v21, v23, v25);
      }
      double v33 = [v12 trackingProps];
      [v33 setTrackingType:a5];

      double v34 = [v12 faceTrackingTransform];

      if (!v34) {
        [a1 applyCameraTrackingTransformToOverlay:v12 withARMetadata:v13 playableInterfaceOrientation:a7];
      }
      float64x2_t v35 = 0uLL;
      *(_OWORD *)&STACK[0x8A0] = 0u;
      *(_OWORD *)&STACK[0x8B0] = 0u;
      *(_OWORD *)&STACK[0x880] = 0u;
      *(_OWORD *)&STACK[0x890] = 0u;
      *(_OWORD *)&STACK[0x860] = 0u;
      *(_OWORD *)&STACK[0x870] = 0u;
      float64x2_t v36 = 0uLL;
      *(_OWORD *)&STACK[0x840] = 0u;
      *(_OWORD *)&STACK[0x850] = 0u;
      if (v12)
      {
        *(_OWORD *)&STACK[0x7C0] = *(_OWORD *)&a4->var0;
        STACK[0x7D0] = a4->var3;
        objc_msgSend(v12, "transformAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:", &STACK[0x7C0], 1, 0, 1, 1, v19, v21, v23, v25);
        float64x2_t v36 = 0uLL;
        float64x2_t v37 = *(float64x2_t *)&STACK[0x870];
        float64x2_t v38 = *(float64x2_t *)&STACK[0x890];
        float64x2_t v35 = *(float64x2_t *)&STACK[0x8B0];
        float64x2_t v39 = vmulq_f64(*(float64x2_t *)&STACK[0x850], (float64x2_t)0);
      }
      else
      {
        float64x2_t v38 = 0uLL;
        float64x2_t v37 = 0uLL;
        float64x2_t v39 = 0uLL;
      }
      float64x2_t v43 = vaddq_f64(*(float64x2_t *)&STACK[0x930], vmlaq_f64(vmlaq_f64(vmulq_f64(*(float64x2_t *)&STACK[0x8D0], v36), v36, *(float64x2_t *)&STACK[0x8F0]), v36, *(float64x2_t *)&STACK[0x910]));
      float64x2_t v44 = vaddq_f64(v35, vmlaq_f64(vmlaq_f64(v39, v36, v37), v36, v38));
      double v45 = v43.f64[1];
      if (v43.f64[1] < 0.0000001 && v43.f64[1] > -0.0000001) {
        double v45 = 1.0;
      }
      double v47 = v43.f64[0] / v45;
      double v48 = v44.f64[1];
      if (v44.f64[1] < 0.0000001 && v44.f64[1] > -0.0000001) {
        double v48 = 1.0;
      }
      double v50 = v44.f64[0] / v48;
      BOOL v51 = v47 >= 0.0000001 || v47 <= -0.0000001;
      double v52 = v50 / v47;
      if (!v51) {
        double v52 = 1.0;
      }
      *(float64x2_t *)&STACK[0x7D0] = v36;
      *(float64x2_t *)&STACK[0x7E0] = v36;
      if (a5 == 2) {
        double v28 = -v28;
      }
      *(float64x2_t *)&STACK[0x7C0] = v36;
      CGAffineTransformMakeScale((CGAffineTransform *)&STACK[0x7C0], v52, v52);
      long long v120 = 0u;
      long long v121 = 0u;
      long long v119 = 0u;
      CGAffineTransformMakeRotation((CGAffineTransform *)&v119, v28);
      long long v117 = 0u;
      long long v118 = 0u;
      long long v53 = *(_OWORD *)&STACK[0x7D0];
      long long t1 = *(_OWORD *)&STACK[0x7C0];
      long long t1_16 = v53;
      long long t1_32 = *(_OWORD *)&STACK[0x7E0];
      long long v116 = 0u;
      long long t2 = v119;
      long long t2_16 = v120;
      long long t2_32 = v121;
      CGAffineTransformConcat((CGAffineTransform *)&v116, (CGAffineTransform *)&t1, (CGAffineTransform *)&t2);
      long long t1 = v116;
      long long t1_16 = v117;
      long long t1_32 = v118;
      long long t2 = *(_OWORD *)&a4->var0;
      *(void *)&long long t2_16 = a4->var3;
      objc_msgSend(a1, "addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:", v12, &t1, &t2, 0, v19, v21, v23, v25);
      long long t1 = *(_OWORD *)&a4->var0;
      *(void *)&long long t1_16 = a4->var3;
      objc_msgSend(v12, "effectCenterAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:", &t1, 1, 1, 1, 1, v19, v21, v23, v25);
      CGAffineTransformMakeTranslation(&v109, v30 - v54, v32 - v55);
      long long t1 = *(_OWORD *)&a4->var0;
      *(void *)&long long t1_16 = a4->var3;
      objc_msgSend(a1, "addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:", v12, &v109, &t1, 0, v19, v21, v23, v25);
    }
    else
    {
      long long v40 = [v12 renderEffect];
      [v40 outputSize];
      v42.f64[1] = v41;
      float64x2_t v108 = v42;

      if (v12)
      {
        [v12 topLevelTransform];
      }
      else
      {
        *(_OWORD *)&STACK[0x9B0] = 0u;
        *(_OWORD *)&STACK[0x9A0] = 0u;
        *(_OWORD *)&STACK[0x990] = 0u;
        *(_OWORD *)&STACK[0x980] = 0u;
        *(_OWORD *)&STACK[0x970] = 0u;
        *(_OWORD *)&STACK[0x960] = 0u;
        *(_OWORD *)&STACK[0x950] = 0u;
        *(_OWORD *)&STACK[0x940] = 0u;
      }
      __asm { FMOV            V0.2D, #0.5 }
      *(_OWORD *)&STACK[0x8C0] = *(_OWORD *)&a4->var0;
      STACK[0x8D0] = a4->var3;
      objc_msgSend(v12, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &STACK[0x8C0], 1, 1, 1, v19, v21, v23, v25);
      double v61 = v60;
      double v63 = v62;
      double v65 = v64;
      double v67 = v66;
      long long v68 = [v12 trackingProps];
      [v68 setTrackingType:a5];

      long long v69 = [v12 faceTrackingTransform];

      if (!v69) {
        [a1 applyCameraTrackingTransformToOverlay:v12 withARMetadata:v13 playableInterfaceOrientation:a7];
      }
      long long v70 = [v12 faceTrackingTransform];
      if (a5 == 1)
      {
        v71 = [v12 faceTrackingTransform];
        v72 = JFXMakeFaceTrackedEffectTransformFaceCamera(v71);
        [v12 setFaceTrackingTransform:v72];

        *(_OWORD *)&STACK[0x8C0] = *(_OWORD *)&a4->var0;
        STACK[0x8D0] = a4->var3;
        objc_msgSend(v12, "applyScaleToFitFrame:withComponentTime:relativeRect:", &STACK[0x8C0], v61, v63, v65, v67, v19, v21, v23, v25);
        [v12 setFaceTrackingTransform:v70];
      }
      else
      {
        *(_OWORD *)&STACK[0x8C0] = *(_OWORD *)&a4->var0;
        STACK[0x8D0] = a4->var3;
        objc_msgSend(v12, "applyScaleToFitFrame:withComponentTime:relativeRect:", &STACK[0x8C0], v61, v63, v65, v67, v19, v21, v23, v25);
      }
      DWORD2(v119) = 0;
      *(void *)&long long v119 = 0;
      v73 = [v12 faceTrackingTransform];
      [v73 transformForTrackingType:a5];
      v74 = [v12 faceTrackingTransform];
      [v74 cameraTransform];
      long long v106 = v76;
      long long v107 = v75;
      long long v104 = v78;
      long long v105 = v77;
      v79 = [v12 faceTrackingTransform];
      [v79 cameraProjection];
      __asm { FMOV            V4.4S, #-1.0 }
      float32x2_t v103 = vcvt_f32_f64(v108);
      long long v101 = v81;
      long long v102 = v82;
      long long v99 = v83;
      long long v100 = v84;
      pv_simd_matrix_unproject_to_plane();

      *(_OWORD *)&STACK[0x930] = 0u;
      *(_OWORD *)&STACK[0x920] = 0u;
      *(_OWORD *)&STACK[0x910] = 0u;
      *(_OWORD *)&STACK[0x900] = 0u;
      *(_OWORD *)&STACK[0x8F0] = 0u;
      *(_OWORD *)&STACK[0x8D0] = 0u;
      *(_OWORD *)&STACK[0x8E0] = 0u;
      *(_OWORD *)&STACK[0x8C0] = 0u;
      if (v12) {
        [v12 topLevelTransform];
      }
      if (a5 == 1)
      {
        long long v85 = *(_OWORD *)&STACK[0x910];
        *(_OWORD *)&STACK[0x800] = *(_OWORD *)&STACK[0x900];
        *(_OWORD *)&STACK[0x810] = v85;
        long long v86 = *(_OWORD *)&STACK[0x930];
        *(_OWORD *)&STACK[0x820] = *(_OWORD *)&STACK[0x920];
        *(_OWORD *)&STACK[0x830] = v86;
        long long v87 = *(_OWORD *)&STACK[0x8D0];
        *(_OWORD *)&STACK[0x7C0] = *(_OWORD *)&STACK[0x8C0];
        *(_OWORD *)&STACK[0x7D0] = v87;
        long long v88 = *(_OWORD *)&STACK[0x8F0];
        *(_OWORD *)&STACK[0x7E0] = *(_OWORD *)&STACK[0x8E0];
        *(_OWORD *)&STACK[0x7F0] = v88;
        STACK[0x7A8] = 0;
        STACK[0x7A0] = 0;
        __asm { FMOV            V1.2D, #1.0 }
        *(_OWORD *)&STACK[0x7B0] = _Q1;
        pv_simd_matrix_rotate();
        long long v90 = *(_OWORD *)&STACK[0x890];
        *(_OWORD *)&STACK[0x900] = *(_OWORD *)&STACK[0x880];
        *(_OWORD *)&STACK[0x910] = v90;
        long long v91 = *(_OWORD *)&STACK[0x8B0];
        *(_OWORD *)&STACK[0x920] = *(_OWORD *)&STACK[0x8A0];
        *(_OWORD *)&STACK[0x930] = v91;
        long long v92 = *(_OWORD *)&STACK[0x850];
        *(_OWORD *)&STACK[0x8C0] = *(_OWORD *)&STACK[0x840];
        *(_OWORD *)&STACK[0x8D0] = v92;
        long long v93 = *(_OWORD *)&STACK[0x870];
        *(_OWORD *)&STACK[0x8E0] = *(_OWORD *)&STACK[0x860];
        *(_OWORD *)&STACK[0x8F0] = v93;
      }
      *(float64x2_t *)&STACK[0x920] = vcvtq_f64_f32(*(float32x2_t *)&v119);
      long long v94 = *(_OWORD *)&STACK[0x910];
      long long v126 = *(_OWORD *)&STACK[0x900];
      long long v127 = v94;
      long long v95 = *(_OWORD *)&STACK[0x8D0];
      long long v122 = *(_OWORD *)&STACK[0x8C0];
      long long v123 = v95;
      long long v96 = *(_OWORD *)&STACK[0x8F0];
      long long v124 = *(_OWORD *)&STACK[0x8E0];
      long long v125 = v96;
      long long v97 = *(_OWORD *)&STACK[0x930];
      *(_OWORD *)&STACK[0x780] = *(_OWORD *)&STACK[0x920];
      *(_OWORD *)&STACK[0x790] = v97;
      objc_msgSend(v12, "setTopLevelTransform:", &v122, v107, v106, v105, v104, v99, v100, v101, v102, *(void *)&v103);
    }
  }

  return v17;
}

+ (void)applyCameraTrackingTransformToOverlay:(id)a3 withARMetadata:(id)a4 playableInterfaceOrientation:(int64_t)a5
{
  id v13 = a3;
  id v7 = a4;
  v8 = [v7 faceAnchor];

  if (v8)
  {
    +[JFXMediaSettings compositionSize];
    objc_msgSend(v13, "playableRectInOutputSize:");
    BOOL v11 = -[JFXFaceTrackingTransformCalculator initWithARMetaData:outputSize:playableInterfaceOrientation:]([JFXFaceTrackingTransformCalculator alloc], "initWithARMetaData:outputSize:playableInterfaceOrientation:", v7, a5, v9, v10);
    id v12 = [(JFXFaceTrackingTransformCalculator *)v11 calculateFaceTrackingTransform];
    [v13 setFaceTrackingTransform:v12];
  }
}

+ (CGPoint)JFX_convertPoint:(CGPoint)a3 fromSize:(CGSize)a4 toSize:(CGSize)a5 invertY:(BOOL)a6
{
  double v6 = a3.x / a4.width;
  double v7 = a3.y / a4.height;
  if (a6) {
    double v7 = 1.0 - v7;
  }
  double v8 = v6 * a5.width;
  double v9 = a5.height * v7;
  result.double y = v9;
  result.double x = v8;
  return result;
}

+ (int64_t)trackingTypeForOverlayPointIntersectionWithFaceRect:(CGPoint)a3 atTime:(id *)a4 relativeTo:(CGRect)a5 defaultTrackingType:(int64_t)a6 faceAnchor:(id)a7 transformAnimation:(id)a8 playableMediaContentMode:(int)a9 playableInterfaceOrientation:(int64_t)a10 playableAspectRatio:(int64_t)a11 playableAspectRatioPreservationMode:(int64_t)a12
{
  if (!a7) {
    return 0;
  }
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a4;
  objc_msgSend(a1, "JFX_currentFaceRectRelativeToBounds:atTime:faceAnchor:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", &v15, a7, a8, *(void *)&a9, a10, a11, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a12);
  v16.CGFloat x = x;
  v16.CGFloat y = y;
  if (CGRectContainsPoint(v17, v16)) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (CGPoint)JFX_closeButtonInsetForEffect:(id)a3 viewBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  [a3 closeButtonInset];
  double v9 = v8;
  double v11 = v10;
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double v12 = v9 * CGRectGetWidth(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double v13 = v11 * CGRectGetHeight(v17);
  double v14 = v12;
  result.CGFloat y = v13;
  result.CGFloat x = v14;
  return result;
}

+ (CGPoint)removeButtonPositionForEffect:(id)a3 atTime:(id *)a4 atPosterFrameRelativeToBounds:(CGRect)a5 viewCorrectionTransform:(CGAffineTransform *)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v13 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v13;
    uint64_t v15 = [v14 includeDropShadowWhenPositioningCloseButton];
    if (([a1 isFaceTrackingDataAvailable] & 1) == 0)
    {
      CGRect v16 = [v14 trackingProps];
      uint64_t v17 = [v16 currentTrackingType];

      if (v17)
      {
        double v18 = 1.79769313e308;
        double v19 = 1.79769313e308;
LABEL_35:

        goto LABEL_36;
      }
    }
    double v20 = (float64x2_t *)a6;
    double v21 = +[JFXEffectEditingUtilities textForEffect:v14];
    double v22 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    double v23 = v21;
    double v24 = [v21 stringByTrimmingCharactersInSet:v22];
    uint64_t v25 = [v24 length];

    if (!v25) {
      +[JFXEffectEditingUtilities updateEffectText:v14 newText:@"!"];
    }
    *(_OWORD *)&v73.a = *(_OWORD *)&a4->var0;
    *(void *)&v73.c = a4->var3;
    double v26 = +[JFXOverlayEffectFrame frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](JFXOverlayEffectFrame, "frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v14, 1, &v73, 1, v15, 0, width, height);
    double v27 = v26;
    if (v26) {
      [v26 cornerPoints];
    }
    else {
      memset(&v64, 0, sizeof(v64));
    }
    pv_bounding_CGRect(&v64);
    double v29 = v28;
    double v31 = v30;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    if (!v25) {
      +[JFXEffectEditingUtilities updateEffectText:v14 newText:v23];
    }
    objc_msgSend(a1, "JFX_closeButtonInsetForEffect:viewBounds:", v14, x, y, width, height);
    double v60 = v37;
    double v61 = v36;
    float64x2_t v38 = [v14 topLevelTransformObject];
    float64x2_t v39 = v38;
    if (v38)
    {
      [v38 SIMDFloat4x4];
      float64x2_t v41 = vcvtq_f64_f32(v40);
      float32x4_t v44 = (float32x4_t)vzip1q_s64(v43, v42);
      float64x2_t v45 = vcvt_hight_f64_f32(v44);
      float64x2_t v46 = vcvtq_f64_f32(*(float32x2_t *)v44.f32);
    }
    else
    {
      float64x2_t v41 = *(float64x2_t *)MEMORY[0x263F000D0];
      float64x2_t v45 = *(float64x2_t *)(MEMORY[0x263F000D0] + 16);
      float64x2_t v46 = *(float64x2_t *)(MEMORY[0x263F000D0] + 32);
    }
    long long v47 = *(_OWORD *)(MEMORY[0x263F617E0] + 80);
    long long v75 = *(_OWORD *)(MEMORY[0x263F617E0] + 64);
    long long v76 = v47;
    long long v48 = *(_OWORD *)(MEMORY[0x263F617E0] + 112);
    long long v77 = *(_OWORD *)(MEMORY[0x263F617E0] + 96);
    long long v78 = v48;
    long long v49 = *(_OWORD *)(MEMORY[0x263F617E0] + 16);
    *(_OWORD *)&v73.a = *MEMORY[0x263F617E0];
    *(_OWORD *)&v73.c = v49;
    long long v50 = *(_OWORD *)(MEMORY[0x263F617E0] + 48);
    *(_OWORD *)&v73.tdouble x = *(_OWORD *)(MEMORY[0x263F617E0] + 32);
    long long v74 = v50;
    float64x2_t v65 = v41;
    long long v66 = 0u;
    float64x2_t v67 = v45;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = xmmword_234D61140;
    float64x2_t v71 = v46;
    long long v72 = xmmword_234D61130;
    pv_transform_info_make();
    CGAffineTransformMakeScale(&v63, *(CGFloat *)&v75, *((CGFloat *)&v75 + 1));
    float64x2_t v62 = vaddq_f64(*(float64x2_t *)&v63.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v63.c, v60), *(float64x2_t *)&v63.a, v61));
    float64x2_t v51 = v20[1];
    *(float64x2_t *)&v73.a = *v20;
    *(float64x2_t *)&v73.c = v51;
    *(float64x2_t *)&v73.tdouble x = v20[2];
    if (CGAffineTransformIsIdentity(&v73))
    {
      float64x2_t v52 = v62;
LABEL_34:
      double v19 = v52.f64[0] + v29;
      double v18 = v52.f64[1] + v31;

      goto LABEL_35;
    }
    long double v53 = atan2(v20->f64[1], v20->f64[0]);
    for (double i = fmod(v53, 6.28318531); i < 0.0; double i = i + 6.28318531)
      ;
    if (i >= 0.785398263)
    {
      if (i < 1.57079643 || i < 2.35619459)
      {
        v81.origin.double x = v29;
        v81.origin.double y = v31;
        v81.size.double width = v33;
        v81.size.double height = v35;
        CGFloat MaxX = CGRectGetMaxX(v81);
        v82.origin.double x = v29;
        v82.origin.double y = v31;
        v82.size.double width = v33;
        v82.size.double height = v35;
        double MinY = CGRectGetMinY(v82);
      }
      else
      {
        if (i < 3.14159275 || i < 3.92699092)
        {
          v83.origin.double x = v29;
          v83.origin.double y = v31;
          v83.size.double width = v33;
          v83.size.double height = v35;
          double MinX = CGRectGetMaxX(v83);
        }
        else
        {
          if (i >= 4.71238908 && i >= 5.49778724) {
            goto LABEL_33;
          }
          v80.origin.double x = v29;
          v80.origin.double y = v31;
          v80.size.double width = v33;
          v80.size.double height = v35;
          double MinX = CGRectGetMinX(v80);
        }
        CGFloat MaxX = MinX;
        v84.origin.double x = v29;
        v84.origin.double y = v31;
        v84.size.double width = v33;
        v84.size.double height = v35;
        double MinY = CGRectGetMaxY(v84);
      }
      double v31 = MinY;
      double v29 = MaxX;
    }
LABEL_33:
    float64x2_t v52 = vaddq_f64(v20[2], vmlaq_n_f64(vmulq_laneq_f64(v20[1], v62, 1), *v20, v62.f64[0]));
    goto LABEL_34;
  }
  double v18 = 1.79769313e308;
  double v19 = 1.79769313e308;
LABEL_36:

  double v58 = v19;
  double v59 = v18;
  result.double y = v59;
  result.double x = v58;
  return result;
}

+ (CGPoint)spacingBetweenCenterPointOfEffect:(id)a3 point:(CGPoint)a4 relativeToBounds:(CGRect)a5 atTime:(id *)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v11 = a4.y;
  double v12 = a4.x;
  id v13 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    memset(&v20[1], 0, sizeof(PVCGPointQuad));
    if (v13)
    {
      v20[0].a = *(CGPoint *)&a6->var0;
      *(void *)&v20[0].b.double x = a6->var3;
      objc_msgSend(v13, "cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:", v20, 1, 1, 1, 1.0, 1.0, x, y, width, height);
    }
    v20[0] = v20[1];
    pv_CGPoint_get_quad_center(v20);
    double v15 = v12 - v14;
    double v17 = v11 - v16;
  }
  else
  {
    double v15 = *MEMORY[0x263F00148];
    double v17 = *(double *)(MEMORY[0x263F00148] + 8);
  }

  double v18 = v15;
  double v19 = v17;
  result.double y = v19;
  result.double x = v18;
  return result;
}

+ (void)addTransformToEffect:(id)a3 transform:(CGAffineTransform *)a4 relativeToBounds:(CGRect)a5 time:(id *)a6 restrictToBounds:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v15 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v15;
    double v17 = v16;
    if (v16)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v18 = *(_OWORD *)&a4->c;
      long long v21 = *(_OWORD *)&a4->a;
      long long v22 = v18;
      long long v23 = *(_OWORD *)&a4->tx;
      long long v24 = 0u;
      long long v19 = *(_OWORD *)&a6->var0;
      int64_t var3 = a6->var3;
      objc_msgSend(v16, "addTransform:withComponentTime:relativeTo:basisOrigin:restrictToBounds:", &v21, &v19, 1, v7, x, y, width, height);
      long long v21 = v24;
      long long v22 = v25;
      long long v23 = v26;
      objc_msgSend(a1, "JFX_ApplyTextFlipIfNeeded:transform:", v17, &v21);
    }
  }
}

+ (void)JFX_ApplyTextFlipIfNeeded:(id)a3 transform:(CGAffineTransform *)a4
{
  id v16 = a3;
  double v6 = atan2(a4->b, a4->a);
  int v7 = [v16 supportsFlippingText];
  int v8 = [v16 supportsFlippingTail];
  int v9 = v8;
  if ((v7 & 1) == 0 && !v8) {
    goto LABEL_29;
  }
  if ([a1 isStreamingMode])
  {
    double v10 = [v16 trackingProps];
    uint64_t v11 = [v10 currentTrackingType];

    if (v11 != 1)
    {
      int64_t v12 = +[JFXOrientationMonitor deviceInterfaceOrientation];
      switch(v12)
      {
        case 1:
          double v13 = 0.0;
          break;
        case 3:
          double v13 = 1.57079633;
          break;
        case 4:
          double v13 = -1.57079633;
          break;
        default:
          double v13 = 3.14159265;
          if (v12 != 2) {
            double v13 = 0.0;
          }
          break;
      }
      double v6 = v6 + v13;
    }
  }
  for (double i = fmod(v6, 6.28318531); i < 0.0; double i = i + 6.28318531)
    ;
  BOOL v15 = i < 4.71238898 && i > 1.57079633;
  if (v15)
  {
    if (v7) {
      [v16 setFlipText:1];
    }
    if ((v9 & 1) == 0) {
      goto LABEL_29;
    }
LABEL_28:
    [v16 setFlipTail:v15];
    goto LABEL_29;
  }
  if (v7) {
    [v16 setFlipText:0];
  }
  if (v9) {
    goto LABEL_28;
  }
LABEL_29:
}

+ (void)updateEffectText:(id)a3 newText:(id)a4
{
  id v7 = a3;
  unint64_t v5 = (__CFString *)a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v7;
    if (!v5 || ![(__CFString *)v5 length])
    {

      unint64_t v5 = @" ";
    }
    [v6 setString:v5 atIndex:0];
  }
}

+ (void)updateEffectToDefaultTextIfEmpty:(id)a3
{
  id v13 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v13;
    uint64_t v4 = [v3 strings];
    unint64_t v5 = [v4 firstObject];
    id v6 = [v5 string];

    id v7 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    int v8 = [v6 stringByTrimmingCharactersInSet:v7];
    uint64_t v9 = [v8 length];

    if (!v9)
    {
      double v10 = [v3 defaultAttributedString:0];
      uint64_t v11 = v10;
      if (v10)
      {
        int64_t v12 = [v10 string];
        [v3 setString:v12 atIndex:0];
      }
    }
  }
  MEMORY[0x270F9A758]();
}

+ (id)textForEffect:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = &stru_26E7CDB50;
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [v3 strings];
    id v6 = [v5 firstObject];
    uint64_t v7 = [v6 string];

    if (v7) {
      uint64_t v4 = (__CFString *)v7;
    }
  }

  return v4;
}

+ (void)JFX_setTextRenderingEnabledForEffect:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4) {
      [v5 endTextEditing];
    }
    else {
      [v5 beginTextEditing];
    }
  }
}

+ (void)beginTextEditingForEffect:(id)a3
{
  id v6 = a3;
  BOOL v4 = [v6 effectID];
  char v5 = [a1 shouldRenderTextWithMotionWhileEditingTextForEffectID:v4];

  if ((v5 & 1) == 0) {
    objc_msgSend(a1, "JFX_setTextRenderingEnabledForEffect:value:", v6, 0);
  }
}

+ (void)endTextEditingForEffect:(id)a3
{
  id v6 = a3;
  BOOL v4 = [v6 effectID];
  char v5 = [a1 shouldRenderTextWithMotionWhileEditingTextForEffectID:v4];

  if ((v5 & 1) == 0) {
    objc_msgSend(a1, "JFX_setTextRenderingEnabledForEffect:value:", v6, 1);
  }
}

+ (BOOL)canEditTextForEffect:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if ([v4 textBakedIn])
    {
      BOOL v5 = 0;
    }
    else
    {
      id v6 = [v4 defaultAttributedString:0];
      uint64_t v7 = [v6 string];
      BOOL v5 = [v7 length] != 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)shouldAutoEditTextForEffect:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) == 0 || ([v3 isEmoji] & 1) == 0;

  return v4;
}

+ (unint64_t)maximumTextLengthForEffect:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = [v3 maxCharacters];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

+ (id)newTextEditingPropertiesForEffect:(id)a3 relativeTo:(CGRect)a4 atTime:(id *)a5 withNewText:(id)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a5;
  return (id)objc_msgSend(a1, "newTextEditingPropertiesForEffect:relativeTo:atTime:withNewText:moveBeforeScalingToAvoidKeyboard:", a3, &v7, a6, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newTextEditingPropertiesForEffect:(id)a3 relativeTo:(CGRect)a4 atTime:(id *)a5 withNewText:(id)a6 moveBeforeScalingToAvoidKeyboard:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v14 = a3;
  id v15 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v18 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    id v16 = +[JFXEffectTextEditingProperties textEditingPropertiesWithTextEffect:withText:relativeTo:atTime:index:moveBeforeScalingToAvoidKeyboard:](JFXEffectTextEditingProperties, "textEditingPropertiesWithTextEffect:withText:relativeTo:atTime:index:moveBeforeScalingToAvoidKeyboard:", v14, v15, &v18, 0, v7, x, y, width, height);
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (BOOL)shouldRenderTextWithMotionWhileEditingTextForEffectID:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x263F61510]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F61518]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F61608]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F61610]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F615E8]] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:*MEMORY[0x263F61600]];
  }

  return v4;
}

+ (BOOL)shouldDisableTextOutlineWhileEditingTextForEffectID:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x263F615F0]];
}

+ (BOOL)shouldUseFullTransformWhileEditingTextForEffectID:(id)a3
{
  return 0;
}

+ (void)enableAnimationForEffects:(id)a3 animationStartTime:(id *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        [v10 enablePresentationState:0];
        if ([v10 type] == 2)
        {
          long long v20 = 0u;
          long long v21 = 0u;
          long long v19 = 0u;
          uint64_t v11 = [v10 renderEffect];
          int64_t v12 = v11;
          if (v11)
          {
            [v11 effectRange];
          }
          else
          {
            long long v20 = 0u;
            long long v21 = 0u;
            long long v19 = 0u;
          }

          *(void *)&long long v20 = a4->var3;
          long long v13 = *(_OWORD *)&a4->var0;
          long long v18 = v21;
          long long v19 = v13;
          long long v16 = v13;
          long long v17 = v20;
          id v14 = [v10 renderEffect];
          v15[0] = v16;
          v15[1] = v17;
          v15[2] = v18;
          [v14 setEffectRange:v15];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }
}

+ (void)disableAnimationForEffects:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) enablePresentationState:1];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (BOOL)isFaceTrackingDataAvailable
{
  unint64_t v2 = +[JFXVideoCameraController sharedInstance];
  char v3 = [v2 hasValidFaceData];

  return v3;
}

+ (CGRect)currentFaceRectRelativeToBounds:(CGRect)a3 atTime:(id *)a4 transformAnimation:(id)a5 playableMediaContentMode:(int)a6 playableInterfaceOrientation:(int64_t)a7 playableAspectRatio:(int64_t)a8 playableAspectRatioPreservationMode:(int64_t)a9
{
  uint64_t v12 = *(void *)&a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v19 = a5;
  long long v20 = +[JFXVideoCameraController sharedInstance];
  long long v21 = [v20 mostRecentARMetadata];
  long long v22 = [v21 faceAnchor];

  $3CC8671D27C23BF42ADDB32F2B5E48AE v35 = *a4;
  objc_msgSend(a1, "JFX_currentFaceRectRelativeToBounds:atTime:faceAnchor:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", &v35, v22, v19, v12, a7, a8, x, y, width, height, a9);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  double v31 = v24;
  double v32 = v26;
  double v33 = v28;
  double v34 = v30;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

+ (CGRect)JFX_currentFaceRectRelativeToBounds:(CGRect)a3 atTime:(id *)a4 faceAnchor:(id)a5 transformAnimation:(id)a6 playableMediaContentMode:(int)a7 playableInterfaceOrientation:(int64_t)a8 playableAspectRatio:(int64_t)a9 playableAspectRatioPreservationMode:(int64_t)a10
{
  uint64_t v12 = *(void *)&a7;
  double height = a3.size.height;
  double width = a3.size.width;
  id v17 = a6;
  id v18 = a5;
  double v19 = multiplierForAspectRatio(a9);
  int v20 = PVViewContentModeFromAspectRatioPreservationMode(a10);
  double v21 = 1.0;
  double v22 = width;
  double v23 = height;
  switch(v20)
  {
    case 0:
      goto LABEL_13;
    case 1:
      if (width <= height)
      {
        double v21 = height;
        if (height * v19 < width) {
          double v21 = width / v19;
        }
      }
      else
      {
        double v21 = width / v19;
        if (width / v19 < height) {
          double v21 = height;
        }
      }
      goto LABEL_7;
    case 2:
      double v21 = width / v19;
      if (width / v19 > height) {
        double v21 = height;
      }
LABEL_7:
      double v19 = v19 * v21;
      break;
    case 3:
      double v21 = height;
      goto LABEL_11;
    case 13:
      double v21 = width / v19;
LABEL_11:
      double v19 = width;
      break;
    case 14:
      double v19 = height * v19;
      double v21 = height;
      break;
    default:
      break;
  }
  double v22 = v19;
  double v23 = v21;
LABEL_13:
  double v57 = 0.0;
  double v58 = 0.0;
  +[JFXFaceTrackingUtilities faceRectInImageWithFaceAnchor:invertY:interfaceOrientation:imageResolution:](JFXFaceTrackingUtilities, "faceRectInImageWithFaceAnchor:invertY:interfaceOrientation:imageResolution:", v18, 1, a8, &v57, v21);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  if ((v57 <= -0.0000001 || v57 >= 0.0000001) && (v58 <= -0.0000001 || v58 >= 0.0000001))
  {
    double v36 = (width - v22) * 0.5;
    double v37 = (height - v23) * 0.5;
    double v38 = 1.0;
    double v39 = v57 / v58;
    double v40 = v22;
    double v41 = v23;
    switch((int)v12)
    {
      case 0:
        goto LABEL_35;
      case 1:
        if (v22 <= v23)
        {
          double v38 = v23;
          if (v23 * v39 < v22) {
            double v38 = v22 / v39;
          }
        }
        else
        {
          double v38 = v22 / v39;
          if (v22 / v39 < v23) {
            double v38 = v23;
          }
        }
        goto LABEL_33;
      case 2:
        double v38 = v22 / v39;
        if (v22 / v39 > v23) {
          double v38 = v23;
        }
LABEL_33:
        double v39 = v39 * v38;
        break;
      case 3:
        double v38 = v23;
        goto LABEL_30;
      case 13:
        double v38 = v22 / v39;
LABEL_30:
        double v39 = v22;
        break;
      case 14:
        double v39 = v23 * v39;
        double v38 = v23;
        break;
      default:
        break;
    }
    double v40 = v39;
    double v41 = v38;
LABEL_35:
    double v50 = v25;
    double v51 = v31;
    double v48 = v37 + 0.0;
    double v49 = v36 + 0.0;
    double x = (v22 - v40) * 0.5 + 0.0;
    double y = (v23 - v41) * 0.5 + 0.0;
    memset(&v56, 0, sizeof(v56));
    PVTransformAnimationInfoIdentity();
    *(_OWORD *)&v52.time.value = *(_OWORD *)&a4->var0;
    v52.time.epoch = a4->var3;
    if (objc_msgSend(MEMORY[0x263F61300], "getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:", v17, &v52, v12, 0, &v56, v22, v23))
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v53 = 0u;
      v59.double x = v22 * 0.5;
      v59.double y = v23 * 0.5;
      PVTransformAnimationInfo v52 = v56;
      CGAffineTransformFromPointWithPVAnimInfo((uint64_t *)&v53, &v52, v59);
      *(_OWORD *)&v52.time.value = v53;
      *(_OWORD *)&v52.time.epoch = v54;
      *(_OWORD *)&v52.translation.double y = v55;
      v60.origin.double x = (v22 - v40) * 0.5 + 0.0;
      v60.origin.double y = (v23 - v41) * 0.5 + 0.0;
      v60.size.double width = v40;
      v60.size.double height = v41;
      CGRect v61 = CGRectApplyAffineTransform(v60, (CGAffineTransform *)&v52);
      double x = v61.origin.x;
      double y = v61.origin.y;
      double v40 = v61.size.width;
      double v41 = v61.size.height;
    }
    v62.origin.double x = v40 * (v50 / v57);
    v62.origin.double y = v41 * (v27 / v58);
    v62.size.double width = v40 * (v29 / v57);
    v62.size.double height = v41 * (v51 / v58);
    CGRect v63 = CGRectOffset(v62, x, y);
    CGRect v64 = CGRectOffset(v63, v49, v48);
    CGFloat v32 = v64.origin.x;
    CGFloat v33 = v64.origin.y;
    CGFloat v34 = v64.size.width;
    CGFloat v35 = v64.size.height;
  }
  else
  {
    CGFloat v32 = *MEMORY[0x263F001A8];
    CGFloat v33 = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat v34 = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat v35 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v44 = v32;
  double v45 = v33;
  double v46 = v34;
  double v47 = v35;
  result.size.double height = v47;
  result.size.double width = v46;
  result.origin.double y = v45;
  result.origin.double x = v44;
  return result;
}

+ (CGRect)JFX_compositionBounds
{
  +[JFXMediaSettings compositionSize];
  double v2 = CGRectMakeWithSize();
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

@end