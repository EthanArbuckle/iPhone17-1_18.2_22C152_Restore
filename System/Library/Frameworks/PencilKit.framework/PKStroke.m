@interface PKStroke
+ ($F30B99E357B462A7BBD676CBC61D9025)averagePointForSynthesisFromSourceStrokes:(SEL)a3;
+ (CGRect)_calculateBounds:(id)a3 transform:(CGAffineTransform *)a4 ink:(id)a5 inkTransform:(CGAffineTransform *)a6 strokePath:(id)a7;
+ (PKCompressedStrokePoint)_compressStrokePoint:(SEL)a3 withTimestamp:(_PKStrokePoint *)a4;
+ (PKStroke)allocWithZone:(_NSZone *)a3;
+ (_PKStrokePoint)_decompressStrokePoint:(SEL)a3 withTimestamp:(PKCompressedStrokePoint *)a4;
+ (id)_commonGroupIDForStrokes:(id)a3;
+ (id)_createStrokesFromCHDrawing:(id)a3 transform:(CGAffineTransform *)a4 inputScale:(double)a5 sourceStrokes:(id)a6 strokeClass:(Class)a7 newInk:(id)a8 suggestedHeight:(double)a9 shouldSetSynthesizedFlag:(BOOL)a10;
+ (id)_snapToShape:(id)a3;
+ (id)_snapToShape:(id)a3 inputScale:(double)a4;
+ (id)_testStrokeFromPoints:(PKCompressedStrokePoint *)a3 length:(int64_t)a4 ink:(id)a5;
+ (id)copyStrokes:(id)a3 hidden:(BOOL)a4;
+ (id)sliceWithEraser:(const void *)a3 toClip:(id)a4;
+ (id)sliceWithEraser:(const void *)a3 toClip:(id)a4 clipType:(int)a5;
+ (int64_t)_asciiBitfieldIndexForX:(int64_t)a3 y:(int64_t)a4 width:(int64_t)a5;
+ (int64_t)_asciiDimensionForBoundsDimension:(double)a3;
+ (int64_t)_requiredContentVersionForStrokePath:(id)a3 ink:(id)a4;
+ (void)_applyPropertiesToNewStrokes:(id)a3 fromOldStrokes:(id)a4;
+ (void)_consumeRenderVertexes:(id)a3 ink:(id)a4 inkTransform:(CGAffineTransform *)a5 strokePath:(id)a6;
- ($F102CC200F6BE7F1479F71F6DC2C7351)_flags;
- (BOOL)_containsSamePointsAsStroke:(id)a3;
- (BOOL)_isBitmapEraserStroke;
- (BOOL)_isHidden;
- (BOOL)_isInProgressScribbleStroke;
- (BOOL)_isInternal;
- (BOOL)_isMaskedStroke;
- (BOOL)_isNewCopy;
- (BOOL)_isPastedStroke;
- (BOOL)_isSafeForStyleInventory;
- (BOOL)_isSharedStroke;
- (BOOL)_isSynthesizedInk;
- (BOOL)_newAsciiBitfield;
- (BOOL)_newAsciiBitfieldWithWidth:(int64_t)a3 height:(int64_t)a4;
- (BOOL)_pathHasAzimuthAngles;
- (BOOL)_pathHasClockwisePointOrdering;
- (BOOL)_shouldBeClippedAgainstLegacyCanvas;
- (BOOL)_visitVisibleSubstrokes:(id)a3 inDrawing:(id)a4;
- (BOOL)hasSubstrokes;
- (BOOL)intersectsClipperPath:(void *)a3;
- (BOOL)intersectsClosedStroke:(id)a3;
- (BOOL)intersectsClosedStrokeMasked:(id)a3;
- (BOOL)intersectsLineFrom:(CGPoint)a3 to:(CGPoint)a4 minThreshold:(double)a5;
- (BOOL)intersectsLineFromMasked:(CGPoint)a3 to:(CGPoint)a4 minThreshold:(double)a5;
- (BOOL)intersectsPoint:(CGPoint)a3;
- (BOOL)intersectsPoint:(CGPoint)a3 boundsOutset:(double)a4 minimumStrokeThreshold:(double)a5;
- (BOOL)intersectsPointMasked:(CGPoint)a3;
- (BOOL)intersectsPointMasked:(CGPoint)a3 boundsOutset:(double)a4 minimumStrokeThreshold:(double)a5;
- (BOOL)intersectsRect:(CGRect)a3;
- (BOOL)intersectsRectMasked:(CGRect)a3;
- (BOOL)isEqual:(id)a3;
- (CGAffineTransform)_inkTransform;
- (CGAffineTransform)_transform;
- (CGPath)_newPathRepresentation;
- (CGPath)newPathRepresentationMasked;
- (CGPath)newSelectionPathRepresentationWithPointsCount:(int *)a3;
- (CGPath)newSelectionPathRepresentationWithPointsCountMasked:(int *)a3;
- (CGPoint)_anchorPointForTexture;
- (CGPoint)_locationAtIndex:(unint64_t)a3;
- (CGPoint)_locationAtIndex:(unint64_t)a3 applyStrokeTransform:(BOOL)a4;
- (CGPoint)intersectionFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4;
- (CGRect)_calculateBounds;
- (CGRect)_untransformedBounds;
- (CGRect)renderBounds;
- (NSArray)maskedPathRanges;
- (NSUUID)_strokeDataUUID;
- (PKContentVersion)requiredContentVersion;
- (PKInk)ink;
- (PKStroke)init;
- (PKStroke)initWithArchive:(const void *)a3 error:(id *)a4;
- (PKStroke)initWithData:(id)a3 error:(id *)a4;
- (PKStroke)initWithData:(id)a3 id:(id)a4 flags:(id)a5 ink:(id)a6 transform:(CGAffineTransform *)a7 substrokes:(id)a8;
- (PKStroke)initWithData:(id)a3 id:(id)a4 hidden:(BOOL)a5 ink:(id)a6 transform:(CGAffineTransform *)a7 substrokes:(id)a8;
- (PKStroke)initWithInk:(PKInk *)ink strokePath:(PKStrokePath *)strokePath transform:(CGAffineTransform *)transform mask:(UIBezierPath *)mask;
- (PKStroke)initWithInk:(PKInk *)ink strokePath:(PKStrokePath *)strokePath transform:(CGAffineTransform *)transform mask:(UIBezierPath *)mask randomSeed:(uint32_t)randomSeed;
- (PKStroke)strokeWithInk:(id)a3;
- (PKStrokePath)path;
- (PKStrokeRenderMask)_renderMask;
- (UIBezierPath)mask;
- (double)_maxWidthForStroke;
- (double)_thresholdForPoint:(_PKStrokePoint *)a3;
- (double)_timestampAtIndex:(unint64_t)a3;
- (double)endTimestamp;
- (double)startTimestamp;
- (double)timestamp;
- (double)timestampAtIndex:(unint64_t)a3;
- (id)_ascii;
- (id)_clipPlane;
- (id)_groupID;
- (id)_initWithPath:(CGPath *)a3 ink:(id)a4 inputScale:(double)a5;
- (id)_initWithPath:(CGPath *)a3 ink:(id)a4 maxSegmentLength:(double)a5 inputScale:(double)a6 velocityForDistanceFunction:(id)a7;
- (id)_mergeWithStroke:(id)a3 inDrawing:(id)a4;
- (id)_newStrokeWithSubstrokes:(id)a3 inDrawing:(id)a4;
- (id)_renderGroupID;
- (id)_sliceWithSlicingBlock:(id)a3 inDrawing:(id)a4 newRootStroke:(id *)a5;
- (id)_strokeMask;
- (id)_strokeUUID;
- (id)_substrokeWithRange:(_NSRange)a3;
- (id)_substrokesInDrawing:(id)a3;
- (id)_updateStroke:(id)a3 inDrawing:(id)a4;
- (id)copyForMutation;
- (id)copyForSubstroke;
- (id)copyWithNewAnchorPointForTexture:(CGPoint)a3;
- (id)dataRepresentation;
- (id)debugQuickLookObject;
- (id)deltaTo:(id)a3;
- (id)description;
- (id)descriptionAtDepth:(int64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)parentStrokeForInsertionInDrawing:(id)a3;
- (id)sliceIdentifierForTStart:(double)a3 tEnd:(double)a4;
- (id)sliceWithEraser:(const void *)a3;
- (id)sliceWithMask:(const void *)a3;
- (id)strokeApplying:(id)a3;
- (int64_t)_inputType;
- (int64_t)_shapeType;
- (int64_t)_visibleSubstrokeCountInDrawing:(id)a3;
- (int64_t)compareToStroke:(id)a3;
- (uint32_t)randomSeed;
- (unint64_t)_pointsCount;
- (unint64_t)hash;
- (unique_ptr<std::vector<PKCompressedStrokePoint>,)_compressedStrokePoints;
- (void)_addVisibleSubstrokesTo:(id)a3 inDrawing:(id)a4;
- (void)_appendPointsOfInterestForSelection:(void *)a3;
- (void)_appendPointsOfInterestForSelection:(void *)a3 step:(double)a4;
- (void)_appendPointsOfInterestForSelectionMasked:(void *)a3;
- (void)_applyTransform:(CGAffineTransform *)a3;
- (void)_setBounds:(CGRect)a3;
- (void)_setClipPlane:(id)a3;
- (void)_setFlags:(id)a3;
- (void)_setGroupID:(id)a3;
- (void)_setHidden:(BOOL)a3;
- (void)_setInkTransform:(CGAffineTransform *)a3;
- (void)_setIsInProgressScribbleStroke:(BOOL)a3;
- (void)_setIsNewCopy:(BOOL)a3;
- (void)_setIsPastedStroke:(BOOL)a3;
- (void)_setIsSafeForStyleInventory:(BOOL)a3;
- (void)_setIsSharedStroke:(BOOL)a3;
- (void)_setIsSynthesizedInk:(BOOL)a3;
- (void)_setRandomSeed:(unsigned int)a3;
- (void)_setRenderGroupID:(id)a3;
- (void)_setShapeType:(int64_t)a3;
- (void)_setStrokeMask:(id)a3;
- (void)_setStrokeUUID:(id)a3;
- (void)_setTransform:(CGAffineTransform *)a3;
- (void)debugRender:(CGContext *)a3;
- (void)debugRenderMasked:(CGContext *)a3;
- (void)enumeratePointsWithDistanceStep:(double)a3 usingBlock:(id)a4;
- (void)enumeratePointsWithTimestep:(double)a3 usingBlock:(id)a4;
- (void)generateClipPaths:(void *)a3 transform:(CGAffineTransform *)a4;
- (void)generateClipperPath:(void *)a3;
- (void)generateMask;
- (void)interpolatePointDataWithStep:(double)a3 from:(double)a4 to:(double)a5 usingBlock:(id)a6;
- (void)interpolatePointDataWithStep:(double)a3 usingBlock:(id)a4;
- (void)newOutlinePaths;
- (void)saveToArchive:(void *)a3;
- (void)setInk:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation PKStroke

- (void)generateClipPaths:(void *)a3 transform:(CGAffineTransform *)a4
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  v7 = [(PKStroke *)self _clipPlane];
  if (!v7) {
    goto LABEL_106;
  }
  [(PKStroke *)self _untransformedBounds];
  CGRect v116 = CGRectInset(v115, -100.0, -100.0);
  CGFloat x = v116.origin.x;
  CGFloat y = v116.origin.y;
  CGFloat width = v116.size.width;
  CGFloat height = v116.size.height;
  CGFloat MinX = CGRectGetMinX(v116);
  v117.origin.CGFloat x = x;
  v117.origin.CGFloat y = y;
  v117.size.CGFloat width = width;
  v117.size.CGFloat height = height;
  *(CGFloat *)&long long v106 = MinX;
  *((void *)&v106 + 1) = CGRectGetMaxY(v117);
  v118.origin.CGFloat x = x;
  v118.origin.CGFloat y = y;
  v118.size.CGFloat width = width;
  v118.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v118);
  v119.origin.CGFloat x = x;
  v119.origin.CGFloat y = y;
  v119.size.CGFloat width = width;
  v119.size.CGFloat height = height;
  CGFloat v107 = MaxX;
  CGFloat MaxY = CGRectGetMaxY(v119);
  v120.origin.CGFloat x = x;
  v120.origin.CGFloat y = y;
  v120.size.CGFloat width = width;
  v120.size.CGFloat height = height;
  CGFloat v14 = CGRectGetMaxX(v120);
  v121.origin.CGFloat x = x;
  v121.origin.CGFloat y = y;
  v121.size.CGFloat width = width;
  v121.size.CGFloat height = height;
  CGFloat v109 = v14;
  CGFloat MinY = CGRectGetMinY(v121);
  v122.origin.CGFloat x = x;
  v122.origin.CGFloat y = y;
  v122.size.CGFloat width = width;
  v122.size.CGFloat height = height;
  CGFloat v15 = CGRectGetMinX(v122);
  v123.origin.CGFloat x = x;
  v123.origin.CGFloat y = y;
  v123.size.CGFloat width = width;
  v123.size.CGFloat height = height;
  CGFloat v111 = v15;
  CGFloat v112 = CGRectGetMinY(v123);
  long long v113 = v106;
  [v7 normal];
  double v17 = v16;
  double v19 = v18;
  uint64_t v20 = 0;
  __p = 0;
  v102 = 0;
  unint64_t v103 = 0;
  do
  {
    v21 = (double *)(&v106 + v20);
    double v23 = *v21;
    double v22 = v21[1];
    ++v20;
    v24 = (double *)(&v106 + v20);
    double v26 = *v24;
    double v25 = v24[1];
    objc_msgSend(v7, "distanceToPoint:", v23, v22);
    double v28 = v27;
    objc_msgSend(v7, "distanceToPoint:", v26, v25);
    if (v28 >= 0.0 && v29 < 0.0)
    {
      double v30 = 1.0 / sqrt((v25 - v22) * (v25 - v22) + (v26 - v23) * (v26 - v23));
      double v31 = (v26 - v23) * v30;
      double v32 = (v25 - v22) * v30;
      double v33 = v28 / (v19 * v32 + v31 * v17);
      double v26 = v23 - v31 * v33;
      double v25 = v22 - v32 * v33;
      v34 = v102;
      if ((unint64_t)v102 >= v103)
      {
        v45 = (double *)__p;
        uint64_t v51 = ((char *)v102 - (unsigned char *)__p) >> 4;
        unint64_t v52 = v51 + 1;
        if ((unint64_t)(v51 + 1) >> 60) {
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v53 = v103 - (void)__p;
        if ((uint64_t)(v103 - (void)__p) >> 3 > v52) {
          unint64_t v52 = v53 >> 3;
        }
        if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v49 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v49 = v52;
        }
        if (v49)
        {
          v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v103, v49);
          v45 = (double *)__p;
          v34 = v102;
        }
        else
        {
          v50 = 0;
        }
        v60 = (double *)&v50[16 * v51];
        double *v60 = v26;
        v60[1] = v25;
        v61 = v60;
        if (v34 != v45)
        {
          do
          {
            *((_OWORD *)v61 - 1) = *((_OWORD *)v34 - 1);
            v61 -= 2;
            v34 -= 2;
          }
          while (v34 != v45);
          goto LABEL_41;
        }
        goto LABEL_42;
      }
      goto LABEL_6;
    }
    if (v28 < 0.0 && v29 >= 0.0)
    {
      double v36 = 1.0 / sqrt((v25 - v22) * (v25 - v22) + (v26 - v23) * (v26 - v23));
      double v37 = (v26 - v23) * v36;
      double v38 = (v25 - v22) * v36;
      double v39 = v28 / (v19 * v38 + v37 * v17);
      double v40 = v23 - v37 * v39;
      double v41 = v22 - v38 * v39;
      v43 = v102;
      v42 = (double *)v103;
      if ((unint64_t)v102 >= v103)
      {
        v54 = (double *)__p;
        uint64_t v55 = ((char *)v102 - (unsigned char *)__p) >> 4;
        unint64_t v56 = v55 + 1;
        if ((unint64_t)(v55 + 1) >> 60) {
          goto LABEL_108;
        }
        uint64_t v57 = v103 - (void)__p;
        if ((uint64_t)(v103 - (void)__p) >> 3 > v56) {
          unint64_t v56 = v57 >> 3;
        }
        if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v58 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v58 = v56;
        }
        if (v58)
        {
          v59 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v103, v58);
          v54 = (double *)__p;
          v43 = v102;
        }
        else
        {
          v59 = 0;
        }
        v63 = (double *)&v59[16 * v55];
        double *v63 = v40;
        v63[1] = v41;
        v64 = v63;
        if (v43 != v54)
        {
          do
          {
            *((_OWORD *)v64 - 1) = *((_OWORD *)v43 - 1);
            v64 -= 2;
            v43 -= 2;
          }
          while (v43 != v54);
          v54 = (double *)__p;
        }
        v42 = (double *)&v59[16 * v58];
        v44 = v63 + 2;
        __p = v64;
        v102 = v63 + 2;
        unint64_t v103 = (unint64_t)v42;
        if (v54)
        {
          operator delete(v54);
          v42 = (double *)v103;
        }
      }
      else
      {
        double *v102 = v40;
        v43[1] = v41;
        v44 = v43 + 2;
      }
      v102 = v44;
      if (v44 < v42)
      {
        double *v44 = v26;
        v44[1] = v25;
        v35 = v44 + 2;
        goto LABEL_66;
      }
      v45 = (double *)__p;
      uint64_t v65 = ((char *)v44 - (unsigned char *)__p) >> 4;
      unint64_t v66 = v65 + 1;
      if ((unint64_t)(v65 + 1) >> 60) {
LABEL_108:
      }
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      uint64_t v67 = (char *)v42 - (unsigned char *)__p;
      if (v67 >> 3 > v66) {
        unint64_t v66 = v67 >> 3;
      }
      if ((unint64_t)v67 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v68 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v68 = v66;
      }
      if (v68)
      {
        v69 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v103, v68);
        v45 = (double *)__p;
        v44 = v102;
      }
      else
      {
        v69 = 0;
      }
      v70 = (double *)&v69[16 * v65];
      double *v70 = v26;
      v70[1] = v25;
      v71 = v70;
      if (v44 != v45)
      {
        do
        {
          *((_OWORD *)v71 - 1) = *((_OWORD *)v44 - 1);
          v71 -= 2;
          v44 -= 2;
        }
        while (v44 != v45);
        v45 = (double *)__p;
      }
      v62 = &v69[16 * v68];
      v35 = v70 + 2;
      __p = v71;
LABEL_64:
      v102 = v35;
      unint64_t v103 = (unint64_t)v62;
      if (v45) {
        operator delete(v45);
      }
      goto LABEL_66;
    }
    if (v28 >= 0.0 && v29 >= 0.0)
    {
      v34 = v102;
      if ((unint64_t)v102 >= v103)
      {
        v45 = (double *)__p;
        uint64_t v46 = ((char *)v102 - (unsigned char *)__p) >> 4;
        unint64_t v47 = v46 + 1;
        if ((unint64_t)(v46 + 1) >> 60) {
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v48 = v103 - (void)__p;
        if ((uint64_t)(v103 - (void)__p) >> 3 > v47) {
          unint64_t v47 = v48 >> 3;
        }
        if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v49 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v49 = v47;
        }
        if (v49)
        {
          v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v103, v49);
          v45 = (double *)__p;
          v34 = v102;
        }
        else
        {
          v50 = 0;
        }
        v60 = (double *)&v50[16 * v46];
        double *v60 = v26;
        v60[1] = v25;
        v61 = v60;
        if (v34 != v45)
        {
          do
          {
            *((_OWORD *)v61 - 1) = *((_OWORD *)v34 - 1);
            v61 -= 2;
            v34 -= 2;
          }
          while (v34 != v45);
LABEL_41:
          v45 = (double *)__p;
        }
LABEL_42:
        v62 = &v50[16 * v49];
        v35 = v60 + 2;
        __p = v61;
        goto LABEL_64;
      }
LABEL_6:
      double *v34 = v26;
      v34[1] = v25;
      v35 = v34 + 2;
LABEL_66:
      v102 = v35;
    }
  }
  while (v20 != 4);
  v73 = (double *)__p;
  v72 = v102;
  if (v102 != __p)
  {
    v95 = (uint64_t *)a3;
    v74 = 0;
    unint64_t v75 = 0;
    v98 = 0;
    v99 = 0;
    v100 = 0;
    float64x2_t v97 = (float64x2_t)vdupq_n_s64(0x4059000000000000uLL);
    do
    {
      int32x2_t v76 = vmovn_s64(vcvtq_s64_f64(vmulq_f64(vaddq_f64(*(float64x2_t *)&a4->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a4->c, v73[2 * v75 + 1]), *(float64x2_t *)&a4->a, v73[2 * v75])), v97)));
      *(void *)&long long v77 = v76.i32[0];
      *((void *)&v77 + 1) = v76.i32[1];
      long long v78 = v77;
      if (v74 >= v100)
      {
        long long v96 = v78;
        v79 = (char *)v98;
        unint64_t v80 = 0xAAAAAAAAAAAAAAABLL * ((v74 - (unsigned char *)v98) >> 3);
        unint64_t v81 = v80 + 1;
        if (v80 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * ((v100 - (unsigned char *)v98) >> 3) > v81) {
          unint64_t v81 = 0x5555555555555556 * ((v100 - (unsigned char *)v98) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((v100 - (unsigned char *)v98) >> 3) >= 0x555555555555555) {
          unint64_t v82 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v82 = v81;
        }
        if (v82)
        {
          v83 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v100, v82);
          v79 = (char *)v98;
          v74 = v99;
        }
        else
        {
          v83 = 0;
        }
        v84 = &v83[24 * v80];
        *(_OWORD *)v84 = v96;
        *((void *)v84 + 2) = 0x3F800000BF800000;
        v85 = v84;
        if (v74 != v79)
        {
          do
          {
            long long v86 = *(_OWORD *)(v74 - 24);
            *((void *)v85 - 1) = *((void *)v74 - 1);
            *(_OWORD *)(v85 - 24) = v86;
            v85 -= 24;
            v74 -= 24;
          }
          while (v74 != v79);
          v79 = (char *)v98;
        }
        v74 = v84 + 24;
        v98 = v85;
        v99 = v84 + 24;
        v100 = &v83[24 * v82];
        if (v79) {
          operator delete(v79);
        }
      }
      else
      {
        *(_OWORD *)v74 = v78;
        *((void *)v74 + 2) = 0x3F800000BF800000;
        v74 += 24;
      }
      v99 = v74;
      ++v75;
      v73 = (double *)__p;
    }
    while (v75 < ((char *)v102 - (unsigned char *)__p) >> 4);
    if (ClipperLib::Area((uint64_t *)&v98) >= 0.0 && v98 != v74)
    {
      v87 = v74 - 24;
      if (v74 - 24 > v98)
      {
        v88 = (char *)v98 + 24;
        do
        {
          long long v104 = *(_OWORD *)(v88 - 24);
          long long v89 = v104;
          uint64_t v105 = *((void *)v88 - 1);
          uint64_t v90 = v105;
          uint64_t v91 = *((void *)v87 + 2);
          *(_OWORD *)(v88 - 24) = *(_OWORD *)v87;
          *((void *)v88 - 1) = v91;
          *((void *)v87 + 2) = v90;
          *(_OWORD *)v87 = v89;
          v87 -= 24;
          BOOL v92 = v88 >= v87;
          v88 += 24;
        }
        while (!v92);
      }
    }
    unint64_t v93 = v95[1];
    if (v93 >= v95[2])
    {
      uint64_t v94 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v95, (uint64_t)&v98);
    }
    else
    {
      std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v95, (uint64_t)&v98);
      uint64_t v94 = v93 + 24;
    }
    v95[1] = v94;
    if (v98)
    {
      v99 = (char *)v98;
      operator delete(v98);
    }
    v72 = (double *)__p;
  }
  if (v72)
  {
    v102 = v72;
    operator delete(v72);
  }
LABEL_106:
}

- (BOOL)_shouldBeClippedAgainstLegacyCanvas
{
  if ([(PKStroke *)self _isHidden]) {
    return 0;
  }
  v3 = [(PKStroke *)self ink];
  v4 = [v3 identifier];
  char v5 = [v4 isEqualToString:@"com.apple.ink.eraser"];

  if (v5) {
    return 0;
  }
  [(PKStroke *)self _bounds];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  v13.size.CGFloat width = 1024.0;
  v13.size.CGFloat height = 768.0;
  v13.origin.CGFloat x = 0.0;
  v13.origin.CGFloat y = 0.0;
  CGRect v14 = CGRectIntersection(v11, v13);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  return !CGRectEqualToRect(v12, v14);
}

- (PKStroke)initWithData:(id)a3 error:(id *)a4
{
  id v4 = a3;
  PKCrash();
}

- (PKStroke)initWithArchive:(const void *)a3 error:(id *)a4
{
}

- (id)dataRepresentation
{
}

- (void)saveToArchive:(void *)a3
{
}

- (id)deltaTo:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (id)strokeApplying:(id)a3
{
  id v3 = a3;
  PKCrash();
}

+ ($F30B99E357B462A7BBD676CBC61D9025)averagePointForSynthesisFromSourceStrokes:(SEL)a3
{
  id v7 = a4;
  if ([v7 count])
  {
    char v5 = objc_alloc_init(PKAveragePointGenerator);
    -[PKAveragePointGenerator addStrokes:]((uint64_t)v5, v7);
    *(_OWORD *)&retstr->var11 = 0u;
    *(_OWORD *)&retstr->var13 = 0u;
    *(_OWORD *)&retstr->var7 = 0u;
    *(_OWORD *)&retstr->var9 = 0u;
    *(_OWORD *)&retstr->var3 = 0u;
    *(_OWORD *)&retstr->var5 = 0u;
    retstr->var0 = 0u;
    *(_OWORD *)&retstr->var1 = 0u;
    [(PKAveragePointGenerator *)(uint64_t)v5 currentInputPoint];
  }
  else
  {
    *(_OWORD *)&retstr->var7 = xmmword_1C48296D8;
    *(_OWORD *)&retstr->var9 = unk_1C48296E8;
    *(_OWORD *)&retstr->var11 = xmmword_1C48296F8;
    *(_OWORD *)&retstr->var13 = unk_1C4829708;
    retstr->var0 = ($047367E7237D93BB26E796C35D3A0ACE)PKInkingToolWidthCalcPoint;
    *(_OWORD *)&retstr->var1 = unk_1C48296A8;
    *(_OWORD *)&retstr->var3 = xmmword_1C48296B8;
    *(_OWORD *)&retstr->var5 = unk_1C48296C8;
  }

  return result;
}

+ (id)_createStrokesFromCHDrawing:(id)a3 transform:(CGAffineTransform *)a4 inputScale:(double)a5 sourceStrokes:(id)a6 strokeClass:(Class)a7 newInk:(id)a8 suggestedHeight:(double)a9 shouldSetSynthesizedFlag:(BOOL)a10
{
  v165[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v125 = a6;
  double v16 = (PKInk *)a8;
  v128 = v15;
  if (![v15 strokeCount])
  {
    id v124 = 0;
    goto LABEL_97;
  }
  CGRect v121 = v16;
  CGRect v120 = [v125 indexesOfObjectsPassingTest:&__block_literal_global_38];
  if ([v120 count])
  {
    uint64_t v17 = [v125 objectsAtIndexes:v120];

    double v18 = (void *)v17;
  }
  else
  {
    double v18 = v125;
  }
  id v125 = v18;
  double v19 = [v18 firstObject];
  uint64_t v20 = v19;
  if (v16 && v19)
  {
    id v21 = [a7 alloc];
    double v22 = [v20 _strokeData];
    [v20 transform];
    double v23 = [v20 mask];
    uint64_t v24 = [v21 initWithInk:v16 strokePath:v22 transform:v158 mask:v23];

    double v19 = (void *)v24;
    if (!v24) {
      goto LABEL_11;
    }
  }
  else if (!v19)
  {
LABEL_11:
    double v25 = [PKStrokePoint alloc];
    double v26 = -[PKStrokePoint initWithLocation:timeOffset:size:opacity:force:azimuth:altitude:](v25, "initWithLocation:timeOffset:size:opacity:force:azimuth:altitude:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 0.0, 3.0, 3.0, 1.0, 1.0, 0.0, 0);
    id v27 = [a7 alloc];
    double v28 = v16;
    if (!v16)
    {
      double v29 = [PKInk alloc];
      a7 = [MEMORY[0x1E4FB1618] blackColor];
      double v28 = [(PKInk *)v29 initWithInkType:@"com.apple.ink.monoline" color:a7];
    }
    double v30 = [PKStrokePath alloc];
    v165[0] = v26;
    double v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v165 count:1];
    double v32 = [MEMORY[0x1E4F1C9C8] now];
    double v33 = [(PKStrokePath *)v30 initWithControlPoints:v31 creationDate:v32];
    long long v34 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v157[0] = *MEMORY[0x1E4F1DAB8];
    v157[1] = v34;
    v157[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    uint64_t v35 = [v27 initWithInk:v28 strokePath:v33 transform:v157 mask:0];

    if (!v121)
    {
    }
    double v19 = (void *)v35;
  }
  v127 = v19;
  double v36 = [v19 path];
  if ([v36 count])
  {
    double v37 = [v127 ink];
    int v38 = [v37 _isFountainPenInk];

    int v123 = v38 ^ 1;
  }
  else
  {
    int v123 = 0;
  }

  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  +[PKStroke averagePointForSynthesisFromSourceStrokes:v125];
  id v124 = [MEMORY[0x1E4F1CA48] array];
  for (unint64_t i = 0; [v128 strokeCount] > i; ++i)
  {
    unint64_t v40 = [v128 pointCountForStrokeIndex:i];
    if (v40)
    {
      v147 = 0;
      __p = 0;
      v148 = 0;
      std::vector<CGPoint>::reserve(&__p, v40);
      for (uint64_t j = 0; j != v40; ++j)
      {
        [v128 pointForStrokeIndex:i pointIndex:j];
        float64x2_t v44 = vaddq_f64(*(float64x2_t *)&a4->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a4->c, v42), *(float64x2_t *)&a4->a, v43));
        v45 = v147;
        uint64_t v46 = (char *)__p;
        uint64_t v47 = v147 - (unsigned char *)__p;
        if (v147 == __p || *((double *)v147 - 2) != v44.f64[0] || *((double *)v147 - 1) != v44.f64[1])
        {
          float64x2_t v129 = v44;
          if (v147 >= v148)
          {
            uint64_t v49 = v47 >> 4;
            unint64_t v50 = (v47 >> 4) + 1;
            if (v50 >> 60) {
              std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v51 = v148 - (unsigned char *)__p;
            if ((v148 - (unsigned char *)__p) >> 3 > v50) {
              unint64_t v50 = v51 >> 3;
            }
            if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v52 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v52 = v50;
            }
            if (v52)
            {
              uint64_t v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v148, v52);
              v45 = v147;
              uint64_t v46 = (char *)__p;
            }
            else
            {
              uint64_t v53 = 0;
            }
            v54 = (float64x2_t *)&v53[16 * v49];
            float64x2_t *v54 = v129;
            uint64_t v48 = (char *)&v54[1];
            if (v45 != v46)
            {
              do
              {
                v54[-1] = *((float64x2_t *)v45 - 1);
                --v54;
                v45 -= 16;
              }
              while (v45 != v46);
              uint64_t v46 = (char *)__p;
            }
            __p = v54;
            v147 = v48;
            v148 = &v53[16 * v52];
            if (v46) {
              operator delete(v46);
            }
          }
          else
          {
            *(float64x2_t *)v147 = v44;
            uint64_t v48 = v45 + 16;
          }
          v147 = v48;
        }
      }
      uint64_t v55 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        unint64_t v56 = [v127 ink];
        uint64_t v57 = [v56 identifier];
        unint64_t v58 = [v127 ink];
        [v58 _weight];
        uint64_t v60 = v59;
        v61 = [v127 ink];
        int v62 = [v61 _weightIsUndefined];
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v57;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v60;
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = v62;
        _os_log_impl(&dword_1C44F8000, v55, OS_LOG_TYPE_INFO, "Synthesize stroke with ink: %@, weight: %g, undefined: %d", buf, 0x1Cu);
      }
      if (v123)
      {
        v130 = objc_alloc_init(PKAveragePointGenerator);
        if ([v125 count]) {
          -[PKAveragePointGenerator addStrokes:]((uint64_t)v130, v125);
        }
        else {
          -[PKAveragePointGenerator addStroke:]((uint64_t)v130, v127);
        }
        double v164 = 0.0;
        long long v163 = 0u;
        long long v162 = 0u;
        long long v161 = 0u;
        memset(buf, 0, sizeof(buf));
        [(PKAveragePointGenerator *)(uint64_t)v130 currentStrokePoint];
        unint64_t v93 = v147;
        uint64_t v94 = (char *)__p;
        unint64_t v95 = (v147 - (unsigned char *)__p) >> 4;
        std::vector<PKCompressedStrokePoint>::vector(&v144, v95);
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v97 = v96;
        if (v93 != v94)
        {
          uint64_t v98 = 0;
          uint64_t v99 = 0;
          unint64_t v100 = 0;
          if (v95 <= 1) {
            unint64_t v95 = 1;
          }
          if (*(double *)&buf[24] >= a9 * 0.142857143 + 2.0) {
            double v101 = a9 * 0.142857143 + 2.0;
          }
          else {
            double v101 = *(double *)&buf[24];
          }
          if (a9 <= 0.0) {
            double v102 = *(double *)&buf[24];
          }
          else {
            double v102 = v101;
          }
          do
          {
            v141.location = *(CGPoint *)((char *)__p + v98);
            v141.timestamp = v97 + (double)v100 * 0.00416666667;
            v141.radius = v102;
            *(_OWORD *)&v141.aspectRatio = v161;
            *(_OWORD *)&v141.force = v162;
            *(_OWORD *)&v141.altitude = v163;
            v141.radius2 = v164;
            PKCompressStrokePoint((PKCompressedStrokePoint *)&v141, v97, (float32x2_t *)v142);
            unint64_t v103 = (char *)v144 + v99;
            *unint64_t v103 = *(_OWORD *)v142;
            v103[1] = v143;
            ++v100;
            v99 += 32;
            v98 += 16;
          }
          while (v95 != v100);
        }
        long long v104 = [PKStrokePath alloc];
        uint64_t v105 = v144;
        long long v106 = v145;
        uint64_t v107 = [v127 _inputType];
        v108 = [MEMORY[0x1E4F29128] UUID];
        CGFloat v109 = [(PKStrokePath *)v104 initWithPoints:v105 count:(v106 - v105) >> 5 immutableCount:(v106 - v105) >> 5 inputType:v107 timestamp:v108 UUID:v97];

        id v110 = objc_alloc((Class)objc_opt_class());
        CGFloat v111 = [v127 ink];
        long long v112 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        v140[0] = *MEMORY[0x1E4F1DAB8];
        v140[1] = v112;
        v140[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        long long v113 = (void *)[v110 initWithInk:v111 strokePath:v109 transform:v140 mask:0];

        [v124 addObject:v113];
        if (v144)
        {
          v145 = v144;
          operator delete(v144);
        }
      }
      else
      {
        if (v127)
        {
          [v127 transform];
          double v64 = *((double *)&v137 + 1);
          double v63 = *(double *)&v137;
        }
        else
        {
          long long v138 = 0u;
          long long v139 = 0u;
          double v64 = 0.0;
          double v63 = 0.0;
          long long v137 = 0u;
        }
        v130 = objc_alloc_init(PKStrokeGenerator);
        uint64_t v65 = ((v147 - (unsigned char *)__p) >> 4) - 1;
        if ((v147 - (unsigned char *)__p) >> 4 == 1)
        {
          double v69 = 0.0;
        }
        else
        {
          double v68 = *(double *)__p;
          double v67 = *((double *)__p + 1);
          unint64_t v66 = (double *)((char *)__p + 24);
          double v69 = 0.0;
          do
          {
            double v70 = *(v66 - 1);
            double v71 = *v66;
            double v69 = v69 + sqrt((v67 - *v66) * (v67 - *v66) + (v68 - v70) * (v68 - v70));
            v66 += 2;
            double v67 = v71;
            double v68 = v70;
            --v65;
          }
          while (v65);
        }
        *((double *)&v151 + 1) = v69 / ((double)v40 * 0.00416666667 * a5);
        v136[4] = v153;
        v136[5] = v154;
        v136[6] = v155;
        v136[7] = v156;
        v136[0] = v149;
        v136[1] = v150;
        v136[2] = v151;
        v136[3] = v152;
        v72 = [(PKAveragePointGenerator *)v130 strokeFromPoints:&__p sourceStroke:v127 inputScale:v136 averageInputPoint:a5];
        v73 = v72;
        double v74 = sqrt(v64 * v64 + v63 * v63);
        if (fabs(v74 + -1.0) >= 0.00999999978)
        {
          v126 = v72;
          unint64_t v75 = [v72 _strokeData];
          unint64_t v76 = [v75 count];
          std::vector<PKCompressedStrokePoint>::vector(v142, v76);
          if (v76)
          {
            uint64_t v77 = 0;
            for (uint64_t k = 0; k != v76; ++k)
            {
              memset(buf, 0, sizeof(buf));
              if (v75)
              {
                [v75 _compressedPointAt:k];
                float v79 = *(float *)&buf[12];
              }
              else
              {
                float v79 = 0.0;
              }
              float v80 = (v79 + -2.0) * v74 + 2.0;
              *(float *)&buf[12] = v80;
              unint64_t v81 = (char *)v142[0] + v77;
              long long v82 = *(_OWORD *)&buf[16];
              *unint64_t v81 = *(_OWORD *)buf;
              v81[1] = v82;
              v77 += 32;
            }
          }
          v83 = [PKStrokePath alloc];
          v84 = v142[0];
          v85 = v142[1];
          uint64_t v86 = [v127 _inputType];
          [v126 timestamp];
          double v88 = v87;
          long long v89 = [MEMORY[0x1E4F29128] UUID];
          uint64_t v90 = [(PKStrokePath *)v83 initWithPoints:v84 count:(v85 - v84) >> 5 immutableCount:(v85 - v84) >> 5 inputType:v86 timestamp:v89 UUID:v88];

          id v91 = objc_alloc((Class)objc_opt_class());
          BOOL v92 = [v126 ink];
          if (v126) {
            [v126 transform];
          }
          else {
            memset(v135, 0, sizeof(v135));
          }
          v73 = (void *)[v91 initWithInk:v92 strokePath:v90 transform:v135 mask:0];

          if (v142[0])
          {
            v142[1] = v142[0];
            operator delete(v142[0]);
          }
        }
        [v124 addObject:v73];
      }
      if (__p)
      {
        v147 = (char *)__p;
        operator delete(__p);
      }
    }
  }
  if (a10)
  {
    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    id v114 = v124;
    uint64_t v115 = [v114 countByEnumeratingWithState:&v131 objects:v159 count:16];
    if (v115)
    {
      uint64_t v116 = *(void *)v132;
      do
      {
        for (uint64_t m = 0; m != v115; ++m)
        {
          if (*(void *)v132 != v116) {
            objc_enumerationMutation(v114);
          }
          [*(id *)(*((void *)&v131 + 1) + 8 * m) _setIsSynthesizedInk:1];
        }
        uint64_t v115 = [v114 countByEnumeratingWithState:&v131 objects:v159 count:16];
      }
      while (v115);
    }
  }
  double v16 = v121;
LABEL_97:

  return v124;
}

uint64_t __154__PKStroke_SynthesizeSupport___createStrokesFromCHDrawing_transform_inputScale_sourceStrokes_strokeClass_newInk_suggestedHeight_shouldSetSynthesizedFlag___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _isSynthesizedInk] ^ 1;
}

+ (PKStroke)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (PKStroke *)+[PKStroke allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___PKStroke;
    return (PKStroke *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (PKStroke)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKStroke;
  return [(PKStroke *)&v3 init];
}

- (id)_initWithPath:(CGPath *)a3 ink:(id)a4 inputScale:(double)a5
{
  return [(PKStroke *)self _initWithPath:a3 ink:a4 maxSegmentLength:0 inputScale:1.79769313e308 velocityForDistanceFunction:a5];
}

- (id)_initWithPath:(CGPath *)a3 ink:(id)a4 maxSegmentLength:(double)a5 inputScale:(double)a6 velocityForDistanceFunction:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  CGRect v14 = objc_alloc_init(PKStrokeGenerator);
  id v15 = [(PKStrokeGenerator *)v14 strokeFromPath:a3 ink:v12 inputScale:v13 maxSegmentLength:objc_opt_class() velocityForDistanceFunction:a6 strokeClass:a5];

  return v15;
}

- (PKStroke)initWithData:(id)a3 id:(id)a4 hidden:(BOOL)a5 ink:(id)a6 transform:(CGAffineTransform *)a7 substrokes:(id)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  unsigned int v18 = [v14 _legacyRandomSeed];
  long long v19 = *(_OWORD *)&a7->c;
  v22[0] = *(_OWORD *)&a7->a;
  v22[1] = v19;
  v22[2] = *(_OWORD *)&a7->tx;
  uint64_t v20 = [(PKStroke *)self initWithData:v14 id:v15 flags:v11 | (32 * v18) | 0x2000000000 ink:v16 transform:v22 substrokes:v17];

  return v20;
}

- (PKStroke)initWithData:(id)a3 id:(id)a4 flags:(id)a5 ink:(id)a6 transform:(CGAffineTransform *)a7 substrokes:(id)a8
{
  v9 = (void *)*(&a5.var0.var1 + 1);
  id v11 = a3;
  id v12 = a4;
  id v13 = v9;
  id v14 = a7;
  PKCrash();
}

- (PKStroke)initWithInk:(PKInk *)ink strokePath:(PKStrokePath *)strokePath transform:(CGAffineTransform *)transform mask:(UIBezierPath *)mask
{
  v10 = ink;
  id v11 = strokePath;
  id v12 = mask;
  long long v13 = *(_OWORD *)&transform->c;
  v16[0] = *(_OWORD *)&transform->a;
  v16[1] = v13;
  v16[2] = *(_OWORD *)&transform->tx;
  id v14 = [(PKStroke *)self initWithInk:v10 strokePath:v11 transform:v16 mask:v12 randomSeed:arc4random()];

  return v14;
}

- (PKStroke)initWithInk:(PKInk *)ink strokePath:(PKStrokePath *)strokePath transform:(CGAffineTransform *)transform mask:(UIBezierPath *)mask randomSeed:(uint32_t)randomSeed
{
  v9 = ink;
  v10 = strokePath;
  id v11 = mask;
  PKCrash();
}

- (id)parentStrokeForInsertionInDrawing:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (id)copyForMutation
{
}

- (id)copyForSubstroke
{
}

- (id)sliceIdentifierForTStart:(double)a3 tEnd:(double)a4
{
}

- (PKInk)ink
{
}

- (void)setInk:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (PKStroke)strokeWithInk:(id)a3
{
  id v4 = a3;
  char v5 = [(PKStroke *)self path];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v6 = objc_msgSend(v5, "regenerateStrokeWithInk:randomSeed:strokeClass:", v4, -[PKStroke randomSeed](self, "randomSeed"), objc_opt_class());
    [(PKStroke *)self transform];
    [v6 _setTransform:v11];
    id v7 = [(PKStroke *)self _strokeMask];
    [v6 _setStrokeMask:v7];
  }
  else
  {
    id v8 = objc_alloc((Class)objc_opt_class());
    [(PKStroke *)self transform];
    id v7 = [(PKStroke *)self mask];
    objc_super v6 = (void *)[v8 initWithInk:v4 strokePath:v5 transform:&v10 mask:v7];
  }

  return (PKStroke *)v6;
}

- (PKStrokePath)path
{
}

- (void)setPath:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (NSUUID)_strokeDataUUID
{
  v2 = [(PKStroke *)self path];
  id v3 = [v2 _strokeDataUUID];

  return (NSUUID *)v3;
}

- ($F102CC200F6BE7F1479F71F6DC2C7351)_flags
{
}

- (void)_setFlags:(id)a3
{
}

- (id)_groupID
{
}

- (void)_setGroupID:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (id)_renderGroupID
{
}

- (void)_setRenderGroupID:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (int64_t)_shapeType
{
}

- (void)_setShapeType:(int64_t)a3
{
}

- (BOOL)_isSynthesizedInk
{
  return ((unint64_t)[(PKStroke *)self _flags] >> 40) & 1;
}

- (void)_setIsSynthesizedInk:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PKStroke *)self _flags];
  uint64_t v6 = 0x10000000000;
  if (!v3) {
    uint64_t v6 = 0;
  }

  [(PKStroke *)self _setFlags:v5 & 0xFFFFFEFFFFFFFFFFLL | v6];
}

- (BOOL)_isSafeForStyleInventory
{
  return ((unint64_t)[(PKStroke *)self _flags] >> 42) & 1;
}

- (void)_setIsSafeForStyleInventory:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PKStroke *)self _flags];
  uint64_t v6 = 0x40000000000;
  if (!v3) {
    uint64_t v6 = 0;
  }

  [(PKStroke *)self _setFlags:v5 & 0xFFFFFBFFFFFFFFFFLL | v6];
}

- (BOOL)_isPastedStroke
{
  return ((unint64_t)[(PKStroke *)self _flags] >> 43) & 1;
}

- (void)_setIsPastedStroke:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PKStroke *)self _flags];
  uint64_t v6 = 0x80000000000;
  if (!v3) {
    uint64_t v6 = 0;
  }

  [(PKStroke *)self _setFlags:v5 & 0xFFFFF7FFFFFFFFFFLL | v6];
}

- (BOOL)_isSharedStroke
{
  return ((unint64_t)[(PKStroke *)self _flags] >> 44) & 1;
}

- (void)_setIsSharedStroke:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PKStroke *)self _flags];
  uint64_t v6 = 0x100000000000;
  if (!v3) {
    uint64_t v6 = 0;
  }

  [(PKStroke *)self _setFlags:v5 & 0xFFFFEFFFFFFFFFFFLL | v6];
}

- (BOOL)_isHidden
{
  return [(PKStroke *)self _flags] & 1;
}

- (void)_setHidden:(BOOL)a3
{
  unint64_t v4 = [(PKStroke *)self _flags] & 0xFFFFFFFFFFFFFFFELL | a3;

  [(PKStroke *)self _setFlags:v4];
}

- (BOOL)_isNewCopy
{
  return ((unint64_t)[(PKStroke *)self _flags] >> 4) & 1;
}

- (void)_setIsNewCopy:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PKStroke *)self _flags];
  uint64_t v6 = 16;
  if (!v3) {
    uint64_t v6 = 0;
  }

  [(PKStroke *)self _setFlags:v5 & 0xFFFFFFFFFFFFFFEFLL | v6];
}

- (BOOL)_isInProgressScribbleStroke
{
  return ((unint64_t)[(PKStroke *)self _flags] >> 38) & 1;
}

- (void)_setIsInProgressScribbleStroke:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PKStroke *)self _flags];
  uint64_t v6 = 0x4000000000;
  if (!v3) {
    uint64_t v6 = 0;
  }

  [(PKStroke *)self _setFlags:v5 & 0xFFFFFFBFFFFFFFFFLL | v6];
}

- (CGPath)_newPathRepresentation
{
  BOOL v3 = [(PKStroke *)self _strokeMask];

  if (v3)
  {
    return [(PKStroke *)self newPathRepresentationMasked];
  }
  else
  {
    uint64_t v5 = [(PKStroke *)self path];
    uint64_t v6 = (CGPath *)[v5 _newPathRepresentation];

    return v6;
  }
}

- (unint64_t)_pointsCount
{
  v2 = [(PKStroke *)self path];
  unint64_t v3 = [v2 _pointsCount];

  return v3;
}

- (void)_setRandomSeed:(unsigned int)a3
{
  unint64_t v4 = [(PKStroke *)self _flags] & 0xFFFFFFC00000001FLL | (32 * a3) | 0x2000000000;

  [(PKStroke *)self _setFlags:v4];
}

- (uint32_t)randomSeed
{
  if (([(PKStroke *)self _flags] & 0x2000000000) != 0)
  {
    return (unint64_t)[(PKStroke *)self _flags] >> 5;
  }
  else
  {
    unint64_t v3 = [(PKStroke *)self _strokeData];
    LODWORD(v4) = [v3 _legacyRandomSeed];
  }
  return v4;
}

- (id)_strokeMask
{
}

- (void)_setStrokeMask:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (PKStrokeRenderMask)_renderMask
{
  return 0;
}

- (BOOL)hasSubstrokes
{
}

- (UIBezierPath)mask
{
  v2 = [(PKStroke *)self _strokeMask];
  id v3 = [v2 bezierPath];

  return (UIBezierPath *)v3;
}

- (NSArray)maskedPathRanges
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PKStroke *)self _strokeMask];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v6 = (void *)[v3 centerlineSlices];
    id v7 = [v5 arrayWithCapacity:(uint64_t)(v6[1] - *v6) >> 4];
    id v8 = (double **)[v4 centerlineSlices];
    v9 = *v8;
    uint64_t v10 = v8[1];
    if (*v8 != v10)
    {
      do
      {
        id v11 = [[PKFloatRange alloc] initWithLowerBound:*v9 upperBound:v9[1]];
        [v7 addObject:v11];

        v9 += 2;
      }
      while (v9 != v10);
    }
  }
  else
  {
    id v12 = [PKFloatRange alloc];
    long long v13 = [(PKStroke *)self path];
    id v14 = -[PKFloatRange initWithLowerBound:upperBound:](v12, "initWithLowerBound:upperBound:", 0.0, (double)(unint64_t)([v13 count] - 1));
    v16[0] = v14;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  }

  return (NSArray *)v7;
}

- (id)_strokeUUID
{
}

- (void)_setStrokeUUID:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (unint64_t)hash
{
  v2 = [(PKStroke *)self _strokeUUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (double)timestamp
{
  v2 = [(PKStroke *)self path];
  [v2 _timestamp];
  double v4 = v3;

  return v4;
}

- (int64_t)_inputType
{
  v2 = [(PKStroke *)self path];
  int64_t v3 = [v2 _inputType];

  return v3;
}

- (BOOL)_isInternal
{
  int64_t v3 = [(PKStroke *)self ink];
  if ([v3 _isEraserInk])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(PKStroke *)self ink];
    if ([v5 _isLassoInk])
    {
      BOOL v4 = 1;
    }
    else
    {
      uint64_t v6 = [(PKStroke *)self _clipPlane];
      BOOL v4 = v6 != 0;
    }
  }

  return v4;
}

- (void)_setClipPlane:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (id)_clipPlane
{
}

+ (void)_consumeRenderVertexes:(id)a3 ink:(id)a4 inkTransform:(CGAffineTransform *)a5 strokePath:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  id v11 = [v9 behavior];
  id v12 = [v11 particleDescriptor];

  if (v12)
  {
    [v12 particleSize];
    [v12 particleRotation];
  }
  else
  {
    [v9 particleRotation];
  }

  operator new();
}

CGFloat __63__PKStroke__consumeRenderVertexes_ink_inkTransform_strokePath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = **(void **)(a1 + 40) + 88 * a2;
  CGFloat v33 = *(double *)(v7 + 8);
  CGFloat v34 = *(double *)(v7 + 16);
  double v8 = *(double *)(v7 + 40);
  double v30 = *(double *)(v7 + 32);
  double v31 = *(double *)(v7 + 24);
  CGFloat angle = *(double *)(v7 + 56);
  if (v6)
  {
    double v9 = *(double *)(v7 + 80);
    CGFloat a = *(double *)(a1 + 48);
    CGFloat b = *(double *)(a1 + 56);
    CGFloat c = *(double *)(a1 + 64);
    double d = *(double *)(a1 + 72);
    tCGFloat x = *(double *)(a1 + 80);
    tCGFloat y = *(double *)(a1 + 88);
    if ([v6 _isFountainPenInkV2])
    {
      double v16 = 0.0;
      if (v9 >= 0.0)
      {
        double v16 = v9;
        if (v9 > 1.0) {
          double v16 = 1.0;
        }
      }
      double d = 1.0 - v16 + d * (1.0 - (1.0 - v16));
    }
  }
  else
  {
    tCGFloat y = 0.0;
    tCGFloat x = 0.0;
    double d = 0.0;
    CGFloat c = 0.0;
    CGFloat b = 0.0;
    CGFloat a = 0.0;
  }
  if (*(unsigned char *)(a1 + 120))
  {
    t1.CGFloat a = a;
    t1.CGFloat b = b;
    t1.CGFloat c = c;
    t1.double d = d;
    t1.tCGFloat x = tx;
    t1.tCGFloat y = ty;
    CGAffineTransformMakeRotation(&t2, angle);
    CGAffineTransformConcat(&v43, &t1, &t2);
    CGFloat a = v43.a;
    CGFloat b = v43.b;
    CGFloat c = v43.c;
    double d = v43.d;
    tCGFloat x = v43.tx;
    tCGFloat y = v43.ty;
  }
  v40.CGFloat a = a;
  v40.CGFloat b = b;
  v40.CGFloat c = c;
  v40.double d = d;
  v40.tCGFloat x = tx;
  v40.tCGFloat y = ty;
  CGAffineTransformMakeTranslation(&v39, v33, v34);
  CGAffineTransformConcat(&v43, &v40, &v39);
  uint64_t v17 = 0;
  double v18 = v43.a;
  double v19 = v43.b;
  double v20 = v43.c;
  double v21 = v43.d;
  double v22 = v43.tx;
  double v23 = v43.ty;
  double v24 = *(double *)(a1 + 112);
  CGFloat v25 = v24 + v31 * v30 * *(double *)(a1 + 96);
  CGFloat v26 = v24 + v31 * *(double *)(a1 + 104);
  v43.CGFloat a = -v25;
  v43.CGFloat b = -v26;
  v43.CGFloat c = v25;
  v43.double d = -v26;
  v43.tCGFloat x = v25;
  v43.tCGFloat y = v26;
  double v44 = -v25;
  CGFloat v45 = v26;
  do
  {
    v5[2](v5, v22 + v20 * *(double *)((char *)&v43.b + v17) + v18 * *(double *)((char *)&v43.a + v17), v23 + v21 * *(double *)((char *)&v43.b + v17) + v19 * *(double *)((char *)&v43.a + v17));
    v17 += 16;
  }
  while (v17 != 64);
  if (v8 != 0.0)
  {
    memset(&v38, 0, sizeof(v38));
    CGAffineTransformMakeRotation(&v38, angle);
    CGAffineTransform v36 = v38;
    v35.CGFloat a = v18;
    v35.CGFloat b = v19;
    v35.CGFloat c = v20;
    v35.double d = v21;
    v35.tCGFloat x = v22;
    v35.tCGFloat y = v23;
    CGAffineTransformConcat(&v37, &v36, &v35);
    uint64_t v27 = 0;
    CGAffineTransform v38 = v37;
    do
    {
      __n128 v28 = (__n128)vaddq_f64(*(float64x2_t *)&v38.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v38.c, *(double *)((char *)&v43.b + v27) + 0.0), *(float64x2_t *)&v38.a, *(double *)((char *)&v43.a + v27) - v8));
      ((void (*)(void (**)(void, double, double), __n128, double))v5[2])(v5, v28, v28.n128_f64[1]);
      v27 += 16;
    }
    while (v27 != 64);
  }

  return v33;
}

- (CGRect)_calculateBounds
{
  if ([(PKStroke *)self hasSubstrokes])
  {
    double v3 = *MEMORY[0x1E4F1DB20];
    double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    uint64_t v7 = [(PKStroke *)self _strokeMask];
    [(PKStroke *)self _transform];
    double v8 = [(PKStroke *)self ink];
    [(PKStroke *)self _inkTransform];
    double v9 = [(PKStroke *)self path];
    +[PKStroke _calculateBounds:v7 transform:v19 ink:v8 inkTransform:&v18 strokePath:v9];
    double v3 = v10;
    double v4 = v11;
    double v5 = v12;
    double v6 = v13;
  }
  double v14 = v3;
  double v15 = v4;
  double v16 = v5;
  double v17 = v6;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

+ (CGRect)_calculateBounds:(id)a3 transform:(CGAffineTransform *)a4 ink:(id)a5 inkTransform:(CGAffineTransform *)a6 strokePath:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  double v14 = v13;
  if (v11)
  {
    long long v15 = *(_OWORD *)&a4->c;
    v61[0] = *(_OWORD *)&a4->a;
    v61[1] = v15;
    v61[2] = *(_OWORD *)&a4->tx;
    [v11 _boundsWithTransform:v61];
    CGFloat x = v16;
    CGFloat y = v18;
    CGFloat width = v20;
    CGFloat height = v22;
  }
  else if ([v13 count])
  {
    long long v24 = *(_OWORD *)&a4->c;
    long long v42 = *(_OWORD *)&a4->a;
    long long v43 = v24;
    long long v44 = *(_OWORD *)&a4->tx;
    uint64_t v57 = 0;
    unint64_t v58 = (double *)&v57;
    uint64_t v59 = 0x2020000000;
    uint64_t v60 = 0x7FEFFFFFFFFFFFFFLL;
    uint64_t v53 = 0;
    v54 = (double *)&v53;
    uint64_t v55 = 0x2020000000;
    unint64_t v56 = 0xFFEFFFFFFFFFFFFFLL;
    uint64_t v49 = 0;
    unint64_t v50 = (double *)&v49;
    uint64_t v51 = 0x2020000000;
    uint64_t v52 = 0x7FEFFFFFFFFFFFFFLL;
    uint64_t v45 = 0;
    uint64_t v46 = (double *)&v45;
    uint64_t v47 = 0x2020000000;
    unint64_t v48 = 0xFFEFFFFFFFFFFFFFLL;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PKStroke__calculateBounds_transform_ink_inkTransform_strokePath___block_invoke;
    aBlock[3] = &unk_1E64C7F20;
    aBlock[4] = &v57;
    aBlock[5] = &v53;
    aBlock[6] = &v49;
    aBlock[7] = &v45;
    CGFloat v25 = _Block_copy(aBlock);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __67__PKStroke__calculateBounds_transform_ink_inkTransform_strokePath___block_invoke_2;
    v39[3] = &unk_1E64C7F48;
    id v26 = v25;
    id v40 = v26;
    long long v27 = *(_OWORD *)&a6->c;
    v38[0] = *(_OWORD *)&a6->a;
    v38[1] = v27;
    v38[2] = *(_OWORD *)&a6->tx;
    +[PKStroke _consumeRenderVertexes:v39 ink:v12 inkTransform:v38 strokePath:v14];
    double v28 = v54[3];
    double v29 = v58[3];
    if (v28 >= v29 && (double v30 = v46[3], v31 = v50[3], v30 >= v31))
    {
      double v32 = v28 - v29;
      double v33 = v30 - v31;
      CGRect v62 = CGRectIntegral(*(CGRect *)&v29);
      CGFloat x = v62.origin.x;
      CGFloat y = v62.origin.y;
      CGFloat width = v62.size.width;
      CGFloat height = v62.size.height;
    }
    else
    {
      CGFloat x = *MEMORY[0x1E4F1DB20];
      CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }

    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v49, 8);
    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(&v57, 8);
  }
  else
  {
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v34 = x;
  double v35 = y;
  double v36 = width;
  double v37 = height;
  result.size.CGFloat height = v37;
  result.size.CGFloat width = v36;
  result.origin.CGFloat y = v35;
  result.origin.CGFloat x = v34;
  return result;
}

uint64_t __67__PKStroke__calculateBounds_transform_ink_inkTransform_strokePath___block_invoke(uint64_t result, double a2, double a3)
{
  double v3 = *(double *)(result + 96) + a3 * *(double *)(result + 80) + *(double *)(result + 64) * a2;
  double v4 = *(double *)(result + 104) + a3 * *(double *)(result + 88) + *(double *)(result + 72) * a2;
  uint64_t v5 = *(void *)(*(void *)(result + 32) + 8);
  double v6 = *(double *)(v5 + 24);
  if (v6 >= v3) {
    double v6 = v3;
  }
  *(double *)(v5 + 24) = v6;
  uint64_t v7 = *(void *)(*(void *)(result + 40) + 8);
  double v8 = *(double *)(v7 + 24);
  if (v8 < v3) {
    double v8 = v3;
  }
  *(double *)(v7 + 24) = v8;
  uint64_t v9 = *(void *)(*(void *)(result + 48) + 8);
  double v10 = *(double *)(v9 + 24);
  if (v10 >= v4) {
    double v10 = v4;
  }
  *(double *)(v9 + 24) = v10;
  uint64_t v11 = *(void *)(*(void *)(result + 56) + 8);
  if (*(double *)(v11 + 24) >= v4) {
    double v4 = *(double *)(v11 + 24);
  }
  *(double *)(v11 + 24) = v4;
  return result;
}

void __67__PKStroke__calculateBounds_transform_ink_inkTransform_strokePath___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  double v6 = a3;
  if (a2 >= 1)
  {
    uint64_t v5 = 0;
    do
      v6[2](v6, v5++, *(void *)(a1 + 32));
    while (a2 != v5);
  }
}

- (CGAffineTransform)_transform
{
}

- (CGAffineTransform)_inkTransform
{
  uint64_t v3 = MEMORY[0x1E4F1DAB8];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->CGFloat a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->CGFloat c = v4;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)(v3 + 32);
  return self;
}

- (void)_setTransform:(CGAffineTransform *)a3
{
}

- (void)_setInkTransform:(CGAffineTransform *)a3
{
}

- (void)_applyTransform:(CGAffineTransform *)a3
{
  [(PKStroke *)self _transform];
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.CGFloat a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.CGFloat c = v5;
  *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v9, &t1, &t2);
  CGAffineTransform v6 = v9;
  [(PKStroke *)self _setTransform:&v6];
}

- (id)_substrokesInDrawing:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (id)_newStrokeWithSubstrokes:(id)a3 inDrawing:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  PKCrash();
}

- (void)_setBounds:(CGRect)a3
{
}

- (CGRect)renderBounds
{
}

- (CGRect)_untransformedBounds
{
  memset(&v5, 0, sizeof(v5));
  [(PKStroke *)self _transform];
  CGAffineTransformInvert(&v5, &v4);
  [(PKStroke *)self _bounds];
  CGAffineTransform v3 = v5;
  return CGRectApplyAffineTransform(v6, &v3);
}

- (void)_appendPointsOfInterestForSelection:(void *)a3
{
}

- (void)_appendPointsOfInterestForSelection:(void *)a3 step:(double)a4
{
  uint64_t v7 = [(PKStroke *)self _strokeMask];

  if (v7)
  {
    [(PKStroke *)self _appendPointsOfInterestForSelectionMasked:a3];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__PKStroke__appendPointsOfInterestForSelection_step___block_invoke;
    v8[3] = &unk_1E64C7F70;
    v8[4] = self;
    v8[5] = a3;
    [(PKStroke *)self interpolatePointDataWithStep:v8 usingBlock:a4];
  }
}

void __53__PKStroke__appendPointsOfInterestForSelection_step___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7)
  {
    [v7 _transform];
    double v8 = v44;
    double v9 = v43;
    double v11 = v46;
    double v10 = v45;
    double v12 = v48;
    double v13 = v47;
    uint64_t v7 = *(void **)(a1 + 32);
  }
  else
  {
    double v12 = 0.0;
    double v11 = 0.0;
    double v8 = 0.0;
    double v13 = 0.0;
    double v10 = 0.0;
    double v9 = 0.0;
  }
  long long v42 = 0u;
  double v14 = [v7 path];
  long long v15 = v14;
  if (v14) {
    [v14 _compressedPointAt:(uint64_t)a4];
  }
  else {
    long long v42 = 0u;
  }
  double v16 = v13 + a3 * v10 + v9 * a2;
  double v17 = v12 + a3 * v11 + v8 * a2;

  LOWORD(v18) = 0;
  unint64_t v19 = 10.0;
  LOWORD(v19) = 0;
  double v20 = (double)v19 / 1000.0;
  double v21 = (double)v18 / 10.0 + *((float *)&v42 + 3);
  double v22 = 1.0;
  if (v20 >= 1.0) {
    double v22 = v20;
  }
  double v23 = v21 * v22;
  if (v23 >= 15.0) {
    double v24 = v23;
  }
  else {
    double v24 = 15.0;
  }
  double v25 = 0.0;
  do
  {
    __double2 v26 = __sincos_stret(v25);
    double v27 = v16 + v24 * v26.__cosval;
    double v28 = v17 + v24 * v26.__sinval;
    uint64_t v29 = *(void *)(a1 + 40);
    double v30 = *(double **)(v29 + 8);
    unint64_t v31 = *(void *)(v29 + 16);
    if ((unint64_t)v30 >= v31)
    {
      double v33 = *(double **)v29;
      uint64_t v34 = ((uint64_t)v30 - *(void *)v29) >> 4;
      unint64_t v35 = v34 + 1;
      if ((unint64_t)(v34 + 1) >> 60) {
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v36 = v31 - (void)v33;
      if (v36 >> 3 > v35) {
        unint64_t v35 = v36 >> 3;
      }
      if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v37 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v37 = v35;
      }
      if (v37)
      {
        CGAffineTransform v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>(v29 + 16, v37);
        double v33 = *(double **)v29;
        double v30 = *(double **)(v29 + 8);
      }
      else
      {
        CGAffineTransform v38 = 0;
      }
      CGAffineTransform v39 = (double *)&v38[16 * v34];
      *CGAffineTransform v39 = v27;
      v39[1] = v28;
      id v40 = v39;
      if (v30 != v33)
      {
        do
        {
          *((_OWORD *)v40 - 1) = *((_OWORD *)v30 - 1);
          v40 -= 2;
          v30 -= 2;
        }
        while (v30 != v33);
        double v33 = *(double **)v29;
      }
      double v32 = v39 + 2;
      *(void *)uint64_t v29 = v40;
      *(void *)(v29 + 8) = v39 + 2;
      *(void *)(v29 + 16) = &v38[16 * v37];
      if (v33) {
        operator delete(v33);
      }
    }
    else
    {
      *double v30 = v27;
      v30[1] = v28;
      double v32 = v30 + 2;
    }
    *(void *)(v29 + 8) = v32;
    double v25 = v25 + 0.392699082;
  }
  while (v25 < 6.28318531);
}

- (double)_maxWidthForStroke
{
  v2 = [(PKStroke *)self path];
  [v2 _maxWidth];
  double v4 = v3;

  return v4;
}

- (id)description
{
  return [(PKStroke *)self descriptionAtDepth:0];
}

- (id)descriptionAtDepth:(int64_t)a3
{
  double v4 = &stru_1F1FB2C00;
  CGAffineTransform v5 = [&stru_1F1FB2C00 stringByPaddingToLength:2 * a3 withString:@" " startingAtIndex:0];
  memset(&v17, 0, sizeof(v17));
  [(PKStroke *)self transform];
  CGAffineTransform v16 = v17;
  if (!CGAffineTransformIsIdentity(&v16))
  {
    if (*MEMORY[0x1E4F1DAB8] == v17.a
      && *(double *)(MEMORY[0x1E4F1DAB8] + 8) == v17.b
      && *(double *)(MEMORY[0x1E4F1DAB8] + 16) == v17.c)
    {
      double v8 = NSString;
      if (*(double *)(MEMORY[0x1E4F1DAB8] + 24) == v17.d)
      {
        [NSString stringWithFormat:@"transform=[%ld, %ld] ", (uint64_t)v17.tx, (uint64_t)v17.ty];
        double v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else
    {
      double v8 = NSString;
    }
    transforuint64_t m = v17;
    double v9 = NSStringFromCGAffineTransform(&transform);
    [v8 stringWithFormat:@"transform=%@ ", v9];
    double v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:
  double v10 = NSString;
  double v11 = [(PKStroke *)self ink];
  double v12 = [v11 identifier];
  double v13 = [v10 stringWithFormat:@"%@<PKStroke: %p %@ %@>", v5, self, v12, v4];

  return v13;
}

+ (int64_t)_asciiDimensionForBoundsDimension:(double)a3
{
  return (uint64_t)(a3 * 0.25);
}

- (id)_ascii
{
  [(PKStroke *)self bounds];
  uint64_t v4 = +[PKStroke _asciiDimensionForBoundsDimension:v3];
  [(PKStroke *)self bounds];
  uint64_t v6 = +[PKStroke _asciiDimensionForBoundsDimension:v5];
  uint64_t v7 = [(PKStroke *)self _newAsciiBitfieldWithWidth:v4 height:v6];
  double v8 = [MEMORY[0x1E4F28E78] string];
  if (v6 >= 1)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (v4 >= 1)
      {
        for (uint64_t j = 0; j != v4; ++j)
        {
          if (v7[+[PKStroke _asciiBitfieldIndexForX:j y:i width:v4]])double v11 = @"■"; {
          else
          }
            double v11 = @" ";
          double v12 = v11;
          [v8 appendString:v12];
        }
      }
      [v8 appendString:@"\n"];
    }
  }
  free(v7);

  return v8;
}

- (BOOL)_newAsciiBitfield
{
  [(PKStroke *)self bounds];
  int64_t v4 = +[PKStroke _asciiDimensionForBoundsDimension:v3];
  [(PKStroke *)self bounds];
  int64_t v6 = +[PKStroke _asciiDimensionForBoundsDimension:v5];

  return [(PKStroke *)self _newAsciiBitfieldWithWidth:v4 height:v6];
}

- (BOOL)_newAsciiBitfieldWithWidth:(int64_t)a3 height:(int64_t)a4
{
  int64_t v7 = a4 * a3;
  double v8 = malloc_type_calloc(a4 * a3, 1uLL, 0x100004077774924uLL);
  [(PKStroke *)self bounds];
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  [(PKStroke *)self bounds];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  if (v7 >= 1) {
    bzero(v8, v7);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __46__PKStroke__newAsciiBitfieldWithWidth_height___block_invoke;
  v18[3] = &__block_descriptor_88_e26_v40__0_CGPoint_dd_8d24_B32l;
  v18[4] = v14;
  v18[5] = v16;
  v18[6] = v10;
  v18[7] = v12;
  v18[8] = a3;
  v18[9] = a4;
  v18[10] = v8;
  [(PKStroke *)self interpolatePointDataWithStep:v18 usingBlock:1.0];
  return (BOOL *)v8;
}

int64_t __46__PKStroke__newAsciiBitfieldWithWidth_height___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  double v6 = (a2 - *(double *)(a1 + 32)) / *(double *)(a1 + 48) * (double)v4;
  double v7 = (a3 - *(double *)(a1 + 40)) / *(double *)(a1 + 56) * (double)v5;
  if (v4 - 1 >= ((uint64_t)v6 & ~((uint64_t)v6 >> 63))) {
    uint64_t v8 = (uint64_t)v6 & ~((uint64_t)v6 >> 63);
  }
  else {
    uint64_t v8 = v4 - 1;
  }
  uint64_t v9 = v5 - 1;
  if (v9 >= ((uint64_t)v7 & ~((uint64_t)v7 >> 63))) {
    uint64_t v10 = (uint64_t)v7 & ~((uint64_t)v7 >> 63);
  }
  else {
    uint64_t v10 = v9;
  }
  int64_t result = +[PKStroke _asciiBitfieldIndexForX:y:width:](PKStroke, "_asciiBitfieldIndexForX:y:width:", v8, v10);
  *(unsigned char *)(*(void *)(a1 + 80) + result) = 1;
  return result;
}

+ (int64_t)_asciiBitfieldIndexForX:(int64_t)a3 y:(int64_t)a4 width:(int64_t)a5
{
  return a3 + a5 * a4;
}

- (id)debugQuickLookObject
{
  double v3 = objc_alloc_init(PKDrawing);
  id v4 = [(PKDrawing *)v3 _addStroke:self];
  [(PKDrawing *)v3 bounds];
  uint64_t v5 = -[PKDrawing imageFromRect:scale:](v3, "imageFromRect:scale:");

  return v5;
}

- (int64_t)compareToStroke:(id)a3
{
  id v3 = a3;
  PKCrash();
}

+ (id)copyStrokes:(id)a3 hidden:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "_isHidden", (void)v14) == v4)
        {
          [v6 addObject:v11];
        }
        else
        {
          uint64_t v12 = (void *)[v11 copyForMutation];
          [v12 _setHidden:v4];
          [v6 addObject:v12];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v6;
}

- (id)_substrokeWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  double v6 = +[PKContentVersionUtility sharedUtility]();
  BOOL v7 = -[PKContentVersionUtility programLinkedOnOrAfterDawnburst]((BOOL)v6);

  id v8 = 0;
  if (location < [(PKStroke *)self _pointsCount])
  {
    unint64_t v9 = length + location + !v7 - 1;
    unint64_t v10 = v9 - location;
    if (v9 >= location)
    {
      if (v9 >= [(PKStroke *)self _pointsCount])
      {
        id v8 = 0;
      }
      else
      {
        unint64_t v11 = v10 + 1;
        std::vector<PKCompressedStrokePoint>::vector(__p, v10 + 1);
        if (v10 != -1)
        {
          uint64_t v12 = 0;
          unint64_t v13 = v10 + 1;
          do
          {
            long long v14 = [(PKStroke *)self path];
            long long v15 = v14;
            if (v14)
            {
              [v14 _compressedPointAt:location];
            }
            else
            {
              long long v25 = 0u;
              long long v26 = 0u;
            }
            long long v16 = (long long *)((char *)__p[0] + v12);
            *long long v16 = v25;
            v16[1] = v26;

            v12 += 32;
            ++location;
            --v13;
          }
          while (v13);
        }
        long long v17 = objc_msgSend(MEMORY[0x1E4F29128], "UUID", v25, v26);
        unint64_t v18 = [PKStrokePath alloc];
        uint64_t v19 = __p[0];
        double v20 = [(PKStroke *)self path];
        uint64_t v21 = [v20 _inputType];
        double v22 = [(PKStroke *)self path];
        [v22 _timestamp];
        double v23 = -[PKStrokePath initWithPoints:count:immutableCount:inputType:timestamp:UUID:](v18, "initWithPoints:count:immutableCount:inputType:timestamp:UUID:", v19, v11, v11, v21, v17);

        id v8 = [(PKStroke *)self copyForMutation];
        [v8 setPath:v23];

        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
    }
  }

  return v8;
}

- (CGPoint)_locationAtIndex:(unint64_t)a3
{
  [(PKStroke *)self _locationAtIndex:a3 applyStrokeTransform:1];
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (CGPoint)_locationAtIndex:(unint64_t)a3 applyStrokeTransform:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = [(PKStroke *)self path];
  [v7 locationAtIndex:a3];
  if (v4)
  {
    double v13 = v9;
    double v14 = v8;
    [(PKStroke *)self _transform];
    float64x2_t v15 = vaddq_f64(v18, vmlaq_n_f64(vmulq_n_f64(v17, v13), v16, v14));
    float64_t v10 = v15.f64[1];
  }
  else
  {
    v15.f64[0] = v8;
    float64_t v10 = v9;
  }

  double v11 = v15.f64[0];
  double v12 = v10;
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

- (void)enumeratePointsWithDistanceStep:(double)a3 usingBlock:(id)a4
{
  id v7 = a4;
  double v6 = [[PKStrokeProviderSlice alloc] initWithStroke:self tStart:0.0 tEnd:(double)[(PKStroke *)self _pointsCount]];
  [(PKStrokeProviderSlice *)v6 enumeratePointsWithDistanceStep:v7 usingBlock:a3];
}

- (void)enumeratePointsWithTimestep:(double)a3 usingBlock:(id)a4
{
  id v7 = a4;
  double v6 = [[PKStrokeProviderSlice alloc] initWithStroke:self tStart:0.0 tEnd:(double)[(PKStroke *)self _pointsCount]];
  [(PKStrokeProviderSlice *)v6 enumeratePointsWithTimestep:v7 usingBlock:a3];
}

- (double)timestampAtIndex:(unint64_t)a3
{
  BOOL v4 = [(PKStroke *)self path];
  [v4 timestampAtIndex:a3];
  double v6 = v5;

  return v6;
}

- (double)_timestampAtIndex:(unint64_t)a3
{
  [(PKStroke *)self timestampAtIndex:a3];
  double v5 = v4;
  double v6 = [(PKStroke *)self path];
  [v6 _timestamp];
  double v8 = v5 + v7;

  return v8;
}

- (BOOL)_containsSamePointsAsStroke:(id)a3
{
  id v4 = a3;
  [(PKStroke *)self _bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 _bounds];
  v29.origin.CGFloat x = v13;
  v29.origin.CGFloat y = v14;
  v29.size.CGFloat width = v15;
  v29.size.CGFloat height = v16;
  v28.origin.CGFloat x = v6;
  v28.origin.CGFloat y = v8;
  v28.size.CGFloat width = v10;
  v28.size.CGFloat height = v12;
  if (CGRectEqualToRect(v28, v29)
    && (unint64_t v17 = -[PKStroke _pointsCount](self, "_pointsCount"), v17 == [v4 _pointsCount]))
  {
    unint64_t v18 = 0;
    do
    {
      unint64_t v19 = [(PKStroke *)self _pointsCount];
      BOOL v20 = v19 <= v18;
      if (v19 <= v18) {
        break;
      }
      [(PKStroke *)self _locationAtIndex:v18];
      double v22 = v21;
      double v24 = v23;
      [v4 _locationAtIndex:v18];
      if (vabdd_f64(v22, v26) >= 0.01) {
        break;
      }
      ++v18;
    }
    while (vabdd_f64(v24, v25) < 0.01);
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (double)startTimestamp
{
  v2 = [(PKStroke *)self path];
  [v2 timestampAtIndex:0];
  double v4 = v3;

  return v4;
}

- (double)endTimestamp
{
  double v3 = [(PKStroke *)self path];
  objc_msgSend(v3, "timestampAtIndex:", -[PKStroke _pointsCount](self, "_pointsCount") - 1);
  double v5 = v4;

  return v5;
}

+ (int64_t)_requiredContentVersionForStrokePath:(id)a3 ink:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int64_t v7 = [v6 requiredContentVersion];
  if (v7 >= 3
    && [v6 _isFountainPenInk]
    && ![v5 hasAzimuthAngles])
  {
    int64_t v7 = 2;
  }

  return v7;
}

- (PKContentVersion)requiredContentVersion
{
  double v3 = [(PKStroke *)self _strokeData];
  double v4 = [(PKStroke *)self ink];
  PKContentVersion v5 = +[PKStroke _requiredContentVersionForStrokePath:v3 ink:v4];

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
}

- (CGPoint)intersectionFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v19[0] = a3;
  v19[1] = a4;
  uint64_t v12 = 0;
  CGFloat v13 = (double *)&v12;
  uint64_t v14 = 0x4012000000;
  CGFloat v15 = __Block_byref_object_copy__14;
  CGFloat v16 = __Block_byref_object_dispose__14;
  unint64_t v17 = "";
  int64x2_t v18 = vdupq_n_s64(0x7FF8000000000000uLL);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x4012000000;
  v11[3] = __Block_byref_object_copy__14;
  v11[4] = __Block_byref_object_dispose__14;
  v11[5] = "";
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__PKStroke_intersectionFromPoint_toPoint___block_invoke;
  v8[3] = &unk_1E64C7FB8;
  v8[4] = self;
  v8[5] = v9;
  v8[7] = &v12;
  v8[8] = v19;
  void v8[6] = v11;
  [(PKStroke *)self interpolatePointDataWithStep:v8 usingBlock:1.0];
  double v4 = v13[6];
  double v5 = v13[7];
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v12, 8);
  double v6 = v4;
  double v7 = v5;
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

void *__42__PKStroke_intersectionFromPoint_toPoint___block_invoke(uint64_t a1, unsigned char *a2, double a3, double a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CGPoint result = *(void **)(a1 + 32);
  if (result)
  {
    double v11 = a4;
    double v12 = a3;
    CGPoint result = (void *)[result _transform];
    a4 = v11;
    a3 = v12;
    float64x2_t v8 = v17;
    float64x2_t v7 = v18;
    float64x2_t v9 = v19;
  }
  else
  {
    float64x2_t v9 = 0uLL;
    float64x2_t v18 = 0u;
    float64x2_t v19 = 0u;
    float64x2_t v17 = 0u;
    float64x2_t v8 = 0uLL;
    float64x2_t v7 = 0uLL;
  }
  float64x2_t v10 = vaddq_f64(v9, vmlaq_n_f64(vmulq_n_f64(v7, a4), v8, a3));
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v15 = 0;
    v20[0] = *(_OWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 48);
    v20[1] = v10;
    float64x2_t v13 = v10;
    CGPoint result = (void *)DKDIntersectionOfLines(*(double **)(a1 + 64), (double *)v20, (double *)&v15, &v16, (double *)&v14, 0, 0);
    if (result)
    {
      *(_OWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 48) = v14;
      *a2 = 1;
    }
    float64x2_t v10 = v13;
  }
  *(float64x2_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 48) = v10;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

+ (id)_testStrokeFromPoints:(PKCompressedStrokePoint *)a3 length:(int64_t)a4 ink:(id)a5
{
  id v8 = a5;
  if (!v8)
  {
    float64x2_t v9 = [MEMORY[0x1E4FB1618] blackColor];
    id v8 = +[PKInk inkWithIdentifier:@"com.apple.ink.pen" color:v9 weight:-1.0];
  }
  float64x2_t v10 = [PKStrokePath alloc];
  double v11 = [MEMORY[0x1E4F29128] UUID];
  double v12 = [(PKStrokePath *)v10 initWithPoints:a3 count:a4 immutableCount:a4 inputType:0 timestamp:v11 UUID:0.0];

  id v13 = objc_alloc((Class)a1);
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v17[0] = *MEMORY[0x1E4F1DAB8];
  v17[1] = v14;
  v17[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  uint64_t v15 = (void *)[v13 initWithInk:v8 strokePath:v12 transform:v17 mask:0];

  return v15;
}

- (unique_ptr<std::vector<PKCompressedStrokePoint>,)_compressedStrokePoints
{
}

- (BOOL)_pathHasClockwisePointOrdering
{
  double v3 = [(PKStroke *)self path];
  unint64_t v4 = [(PKStroke *)self _pointsCount];
  unint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = 0;
    unint64_t v7 = v4 - 1;
    double v8 = 0.0;
    do
    {
      [v3 locationAtIndex:v6];
      double v10 = v9;
      double v12 = v11;
      if (v7 == v6) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = v6 + 1;
      }
      [v3 locationAtIndex:v13];
      ++v6;
      double v8 = v8 + v10 * v15 - v14 * v12;
    }
    while (v5 != v6);
    LOBYTE(v5) = v8 < 0.0;
  }

  return v5;
}

- (BOOL)_pathHasAzimuthAngles
{
  v2 = [(PKStroke *)self path];
  char v3 = [v2 hasAzimuthAngles];

  return v3;
}

+ (id)_commonGroupIDForStrokes:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    BOOL v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        double v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (v6)
        {
          double v10 = [v9 _groupID];
          double v11 = v10;
          if (!v10 || ([v10 isEqual:v6] & 1) == 0) {
            BOOL v5 = 0;
          }
        }
        else
        {
          uint64_t v12 = objc_msgSend(v9, "_groupID", (void)v16);
          BOOL v5 = v12 != 0;
          uint64_t v6 = (void *)v12;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);

    if (v5) {
      uint64_t v13 = v6;
    }
    else {
      uint64_t v13 = 0;
    }
  }
  else
  {

    uint64_t v6 = 0;
    uint64_t v13 = 0;
  }
  id v14 = v13;

  return v14;
}

+ (void)_applyPropertiesToNewStrokes:(id)a3 fromOldStrokes:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = +[PKStroke _commonGroupIDForStrokes:a4];
  if (v6)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "_setGroupID:", v6, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (BOOL)_isBitmapEraserStroke
{
  v2 = [(PKStroke *)self ink];
  id v3 = [v2 identifier];
  char v4 = [v3 isEqualToString:@"com.apple.ink.eraser"];

  return v4;
}

- (BOOL)_isMaskedStroke
{
  id v3 = [(PKStroke *)self _clipPlane];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(PKStroke *)self _renderMask];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (id)copyWithNewAnchorPointForTexture:(CGPoint)a3
{
}

- (CGPoint)_anchorPointForTexture
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

+ (id)_snapToShape:(id)a3
{
  return (id)[a1 _snapToShape:a3 inputScale:0.0];
}

+ (id)_snapToShape:(id)a3 inputScale:(double)a4
{
  id v5 = a3;
  if ([v5 count] == 1)
  {
    uint64_t v6 = objc_alloc_init(PKShapeDrawingController);
    id v7 = v6;
    if (v6) {
      v6->_shapeRecognitionOn = 1;
    }
    uint64_t v8 = [v5 firstObject];
    memset(v12, 0, sizeof(v12));
    uint64_t v9 = -[PKShapeDrawingController shapeFromStroke:inputScale:averageInputPoint:allowedShapeTypes:]((uint64_t)v7, v8, v12, 0, a4);

    if (v9)
    {
      uint64_t v10 = [v9 strokes];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)interpolatePointDataWithStep:(double)a3 usingBlock:(id)a4
{
  id v8 = a4;
  unint64_t v6 = [(PKStroke *)self _pointsCount];
  unint64_t v7 = v6 - 1;
  if (!v6) {
    unint64_t v7 = 0;
  }
  [(PKStroke *)self interpolatePointDataWithStep:v8 from:a3 to:0.0 usingBlock:(double)v7];
}

- (void)interpolatePointDataWithStep:(double)a3 from:(double)a4 to:(double)a5 usingBlock:(id)a6
{
  uint64_t v10 = (void (**)(id, unsigned char *, double, double, double))a6;
  long long v11 = [(PKStroke *)self _strokeData];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    char v31 = 0;
    unint64_t v13 = (unint64_t)a4;
    unint64_t v14 = (unint64_t)a5;
    if ((unint64_t)a4 <= (unint64_t)a5)
    {
      double v30 = a5 - (double)(unint64_t)a5;
      uint64_t v15 = (unint64_t)a4;
      do
      {
        if (v15 == v13) {
          double v16 = a4 - (double)(unint64_t)a4;
        }
        else {
          double v16 = 0.0;
        }
        if (v15 == v14 || (a3 >= 1.0 ? (BOOL v17 = v15 == v13) : (BOOL v17 = 1), v17))
        {
          double v19 = v30;
          if (v15 != v14) {
            double v19 = 1.0;
          }
          double v20 = v19 - v16;
          uint64_t v21 = vcvtpd_s64_f64(v20 / a3);
          if (v21 < 1) {
            double v22 = 0.0;
          }
          else {
            double v22 = v20 / (double)v21;
          }
          uint64_t v23 = v15 != v13;
          if (v23 <= v21)
          {
            do
            {
              double v24 = [(PKStroke *)self _strokeData];
              [v24 locationOnSegment:v15 t:v16 + v22 * (double)v23];
              double v26 = v25;
              double v28 = v27;

              v10[2](v10, &v31, v26, v28, v16 + v22 * (double)v23 + (double)v15);
              if (v31) {
                break;
              }
            }
            while (v23++ < v21);
          }
        }
        else
        {
          long long v18 = [(PKStroke *)self _strokeData];
          [v18 locationAtIndex:v15];
          ((void (*)(void (**)(id, unsigned char *, double, double, double), char *))v10[2])(v10, &v31);

          if (v31) {
            break;
          }
        }
        ++v15;
      }
      while (v15 <= v14);
    }
  }
}

- (void)debugRender:(CGContext *)a3
{
  if (![(PKStroke *)self hasSubstrokes])
  {
    id v5 = [(PKStroke *)self _strokeMask];

    if (v5)
    {
      [(PKStroke *)self debugRenderMasked:a3];
    }
    else
    {
      memset(&v17, 0, sizeof(v17));
      CGContextGetCTM(&v17, a3);
      CGContextSetLineWidth(a3, 2.0 / v17.a);
      if (![(PKStroke *)self _isHidden])
      {
        CGContextSetRGBStrokeColor(a3, 1.0, 0.0, 0.0, 0.5);
        [(PKStroke *)self _bounds];
        CGContextStrokeRect(a3, v19);
      }
      CGContextSetRGBStrokeColor(a3, 1.0, 0.578, 0.0, 1.0);
      Mutable = CGPathCreateMutable();
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x2020000000;
      char v16 = 1;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v12 = 0u;
      [(PKStroke *)self _transform];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      long long v8 = v12;
      v7[2] = __33__PKStroke_Slicing__debugRender___block_invoke;
      v7[3] = &unk_1E64C88A8;
      long long v9 = v13;
      long long v10 = v14;
      v7[4] = v15;
      long long v11 = Mutable;
      [(PKStroke *)self interpolatePointDataWithStep:v7 usingBlock:0.1];
      CGContextAddPath(a3, Mutable);
      CGContextStrokePath(a3);
      _Block_object_dispose(v15, 8);
    }
  }
}

void __33__PKStroke_Slicing__debugRender___block_invoke(uint64_t a1, double a2, double a3)
{
  double v5 = *(double *)(a1 + 72) + a3 * *(double *)(a1 + 56) + *(double *)(a1 + 40) * a2;
  double v6 = *(double *)(a1 + 80) + a3 * *(double *)(a1 + 64) + *(double *)(a1 + 48) * a2;
  int v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  long long v8 = *(CGPath **)(a1 + 88);
  if (v7)
  {
    CGPathMoveToPoint(v8, 0, v5, v6);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    CGPathAddLineToPoint(v8, 0, v5, v6);
  }
}

- (CGPath)newSelectionPathRepresentationWithPointsCount:(int *)a3
{
  double v5 = [(PKStroke *)self _strokeData];
  *a3 = vcvtd_n_s64_f64((double)(unint64_t)[v5 _pointsCount], 2uLL);

  return [(PKStroke *)self _newPathRepresentation];
}

- (void)newOutlinePaths
{
}

- (double)_thresholdForPoint:(_PKStrokePoint *)a3
{
  double aspectRatio = 1.0;
  if (a3->aspectRatio >= 1.0) {
    double aspectRatio = a3->aspectRatio;
  }
  double result = (a3->radius + a3->edgeWidth) * aspectRatio;
  if (result < 3.5) {
    return 3.5;
  }
  return result;
}

- (BOOL)intersectsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(PKStroke *)self _strokeMask];

  if (v6)
  {
    return -[PKStroke intersectsPointMasked:](self, "intersectsPointMasked:", x, y);
  }
  else
  {
    return -[PKStroke intersectsPoint:boundsOutset:minimumStrokeThreshold:](self, "intersectsPoint:boundsOutset:minimumStrokeThreshold:", x, y, 10.0, 10.0);
  }
}

- (BOOL)intersectsPoint:(CGPoint)a3 boundsOutset:(double)a4 minimumStrokeThreshold:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  long long v10 = [(PKStroke *)self _strokeMask];

  if (v10)
  {
    return -[PKStroke intersectsPointMasked:boundsOutset:minimumStrokeThreshold:](self, "intersectsPointMasked:boundsOutset:minimumStrokeThreshold:", x, y, a4, a5);
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    [(PKStroke *)self _bounds];
    CGRect v21 = CGRectInset(v20, -a4, -a4);
    v19.double x = x;
    v19.double y = y;
    if (CGRectContainsPoint(v21, v19))
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __73__PKStroke_Slicing__intersectsPoint_boundsOutset_minimumStrokeThreshold___block_invoke;
      v13[3] = &unk_1E64C88D0;
      *(double *)&v13[6] = a5;
      *(double *)&v13[7] = x;
      *(double *)&v13[8] = y;
      v13[4] = self;
      v13[5] = &v14;
      [(PKStroke *)self interpolatePointDataWithStep:v13 usingBlock:1.0];
    }
    char v12 = *((unsigned char *)v15 + 24);
    _Block_object_dispose(&v14, 8);
    return v12;
  }
}

uint64_t __73__PKStroke_Slicing__intersectsPoint_boundsOutset_minimumStrokeThreshold___block_invoke(uint64_t a1, unsigned char *a2, double a3, double a4, double a5)
{
  long long v9 = *(void **)(a1 + 32);
  if (v9)
  {
    [v9 _transform];
    double v10 = *((double *)&v31 + 1);
    double v11 = *(double *)&v31;
    double v13 = *((double *)&v32 + 1);
    double v12 = *(double *)&v32;
    double v14 = *((double *)&v33 + 1);
    double v15 = *(double *)&v33;
    long long v9 = *(void **)(a1 + 32);
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v31 = 0u;
    double v14 = 0.0;
    double v13 = 0.0;
    double v10 = 0.0;
    double v15 = 0.0;
    double v12 = 0.0;
    double v11 = 0.0;
  }
  uint64_t v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  uint64_t v16 = [v9 _strokeData];
  char v17 = v16;
  if (v16)
  {
    [v16 decompressedPointAt:(uint64_t)a5];
  }
  else
  {
    uint64_t v30 = 0;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
  }

  long long v18 = *(void **)(a1 + 32);
  v23[2] = v27;
  v23[3] = v28;
  v23[4] = v29;
  uint64_t v24 = v30;
  v23[0] = v25;
  v23[1] = v26;
  uint64_t result = [v18 _thresholdForPoint:v23];
  double v21 = fmax(v20, *(double *)(a1 + 48));
  if ((v14 + a4 * v13 + v10 * a3 - *(double *)(a1 + 64)) * (v14 + a4 * v13 + v10 * a3 - *(double *)(a1 + 64))
     + (v15 + a4 * v12 + v11 * a3 - *(double *)(a1 + 56)) * (v15 + a4 * v12 + v11 * a3 - *(double *)(a1 + 56)) < v21 * v21)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a2 = 1;
  }
  return result;
}

- (BOOL)intersectsLineFrom:(CGPoint)a3 to:(CGPoint)a4 minThreshold:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  double v11 = [(PKStroke *)self _strokeMask];

  if (v11)
  {
    return -[PKStroke intersectsLineFromMasked:to:minThreshold:](self, "intersectsLineFromMasked:to:minThreshold:", v9, v8, x, y, a5);
  }
  else
  {
    [(PKStroke *)self _bounds];
    CGRect v30 = CGRectInset(v29, -a5, -a5);
    CGFloat v13 = v30.origin.x;
    CGFloat v14 = v30.origin.y;
    CGFloat width = v30.size.width;
    CGFloat height = v30.size.height;
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    v28.double x = v9;
    v28.double y = v8;
    if (CGRectContainsPoint(v30, v28) || DKDLineIntersectsRect(x, y, v9, v8, v13, v14, width, height))
    {
      v22[0] = 0;
      v22[1] = v22;
      v22[2] = 0x4012000000;
      _OWORD v22[3] = __Block_byref_object_copy__18;
      v22[4] = __Block_byref_object_dispose__18;
      v22[5] = "";
      v20[0] = 0;
      v20[1] = v20;
      _OWORD v20[2] = 0x2020000000;
      char v21 = 0;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __56__PKStroke_Slicing__intersectsLineFrom_to_minThreshold___block_invoke;
      v18[3] = &unk_1E64C88F8;
      *(double *)&v18[8] = v9;
      *(double *)&v18[9] = v8;
      v18[4] = self;
      v18[5] = &v23;
      BOOL v19 = (y - v8) * (y - v8) + (x - v9) * (x - v9) > 1.0;
      *(double *)&v18[10] = x;
      *(double *)&void v18[11] = y;
      v18[6] = v20;
      v18[7] = v22;
      -[PKStroke interpolatePointDataWithStep:usingBlock:](self, "interpolatePointDataWithStep:usingBlock:", v18, 1.0, 0x2020000000);
      _Block_object_dispose(v20, 8);
      _Block_object_dispose(v22, 8);
    }
    char v17 = *((unsigned char *)v24 + 24);
    _Block_object_dispose(&v23, 8);
    return v17;
  }
}

uint64_t __56__PKStroke_Slicing__intersectsLineFrom_to_minThreshold___block_invoke(uint64_t a1, unsigned char *a2, double a3, double a4, double a5)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  double v8 = *(void **)(a1 + 32);
  if (v8)
  {
    [v8 _transform];
    long long v16 = v37;
    long long v18 = v36;
    long long v20 = v38;
    double v8 = *(void **)(a1 + 32);
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v18 = 0u;
    long long v20 = 0u;
    long long v36 = 0u;
    long long v16 = 0u;
  }
  uint64_t v35 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  double v9 = objc_msgSend(v8, "_strokeData", v16, v18, v20);
  double v10 = v9;
  if (v9)
  {
    [v9 decompressedPointAt:(uint64_t)a5];
  }
  else
  {
    uint64_t v35 = 0;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v30 = 0u;
  }

  double v11 = *(void **)(a1 + 32);
  v28[2] = v32;
  v28[3] = v33;
  v28[4] = v34;
  uint64_t v29 = v35;
  v28[0] = v30;
  v28[1] = v31;
  uint64_t result = [v11 _thresholdForPoint:v28];
  float64x2_t v13 = vaddq_f64(v21, vmlaq_n_f64(vmulq_n_f64(v17, a4), v19, a3));
  if ((v13.f64[1] - *(double *)(a1 + 72)) * (v13.f64[1] - *(double *)(a1 + 72))
     + (v13.f64[0] - *(double *)(a1 + 64)) * (v13.f64[0] - *(double *)(a1 + 64)) < v14 * v14)
    goto LABEL_8;
  if (*(unsigned char *)(a1 + 96) && *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v26 = 0;
    long long v15 = *(_OWORD *)(a1 + 64);
    v40[0] = *(_OWORD *)(a1 + 80);
    v40[1] = v15;
    v39[0] = *(_OWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 48);
    v39[1] = v13;
    float64x2_t v24 = v13;
    uint64_t result = DKDIntersectionOfLines((double *)v40, (double *)v39, (double *)&v26, &v27, v25, 0, 0);
    if (result)
    {
LABEL_8:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a2 = 1;
      return result;
    }
    float64x2_t v13 = v24;
  }
  *(float64x2_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 48) = v13;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

- (void)generateClipperPath:(void *)a3
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  [(PKStroke *)self _transform];
  std::vector<ClipperLib::IntPoint>::reserve((void **)a3, [(PKStroke *)self _pointsCount]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __41__PKStroke_Slicing__generateClipperPath___block_invoke;
  v21[3] = &__block_descriptor_88_e26_v40__0_CGPoint_dd_8d24_B32l;
  long long v22 = v26;
  long long v23 = v27;
  long long v24 = v28;
  uint64_t v25 = a3;
  [(PKStroke *)self interpolatePointDataWithStep:v21 usingBlock:1.0];
  double v5 = *(char **)a3;
  unint64_t v6 = *((void *)a3 + 1);
  if (v6 - *(void *)a3 == 24)
  {
    long long v20 = *(_OWORD *)(v5 + 8);
    uint64_t v7 = *(void *)v5 + 1;
    unint64_t v8 = *((void *)a3 + 2);
    if (v6 >= v8)
    {
      unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - (void)v5) >> 3);
      if (2 * v10 <= 2) {
        uint64_t v11 = 2;
      }
      else {
        uint64_t v11 = 2 * v10;
      }
      if (v10 >= 0x555555555555555) {
        unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v12 = v11;
      }
      float64x2_t v13 = std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)a3 + 16, v12);
      double v14 = (char *)(v13 + 3);
      long long v16 = (char *)&v13[3 * v15];
      v13[3] = v7;
      *((_OWORD *)v13 + 2) = v20;
      double v9 = (char *)(v13 + 6);
      long long v18 = *(char **)a3;
      float64x2_t v17 = (char *)*((void *)a3 + 1);
      if (v17 != *(char **)a3)
      {
        do
        {
          long long v19 = *(_OWORD *)(v17 - 24);
          *((void *)v14 - 1) = *((void *)v17 - 1);
          *(_OWORD *)(v14 - 24) = v19;
          v14 -= 24;
          v17 -= 24;
        }
        while (v17 != v18);
        float64x2_t v17 = *(char **)a3;
      }
      *(void *)a3 = v14;
      *((void *)a3 + 1) = v9;
      *((void *)a3 + 2) = v16;
      if (v17) {
        operator delete(v17);
      }
    }
    else
    {
      *(void *)unint64_t v6 = v7;
      *(_OWORD *)(v6 + 8) = v20;
      double v9 = (char *)(v6 + 24);
    }
    *((void *)a3 + 1) = v9;
  }
}

void __41__PKStroke_Slicing__generateClipperPath___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t v4 = *(void *)(a1 + 80);
  int32x2_t v5 = vmovn_s64(vcvtq_s64_f64(vmulq_f64(vaddq_f64(*(float64x2_t *)(a1 + 64), vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 48), a3), *(float64x2_t *)(a1 + 32), a2)), (float64x2_t)vdupq_n_s64(0x4059000000000000uLL))));
  *(void *)&long long v6 = v5.i32[0];
  *((void *)&v6 + 1) = v5.i32[1];
  long long v7 = v6;
  float v8 = a4;
  double v9 = *(_OWORD **)(v4 + 8);
  unint64_t v10 = *(void *)(v4 + 16);
  if ((unint64_t)v9 >= v10)
  {
    unint64_t v12 = *(_OWORD **)v4;
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v9 - *(void *)v4) >> 3);
    unint64_t v14 = v13 + 1;
    if (v13 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - (void)v12) >> 3);
    if (2 * v15 > v14) {
      unint64_t v14 = 2 * v15;
    }
    if (v15 >= 0x555555555555555) {
      unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16)
    {
      long long v22 = v7;
      float64x2_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>(v4 + 16, v16);
      long long v7 = v22;
      long long v18 = v17;
      unint64_t v12 = *(_OWORD **)v4;
      double v9 = *(_OWORD **)(v4 + 8);
    }
    else
    {
      long long v18 = 0;
    }
    long long v19 = &v18[24 * v13];
    long long v20 = &v18[24 * v16];
    *(_OWORD *)long long v19 = v7;
    *((float *)v19 + 4) = v8;
    *((_DWORD *)v19 + 5) = -1082130432;
    uint64_t v11 = v19 + 24;
    if (v9 != v12)
    {
      do
      {
        long long v21 = *(_OWORD *)((char *)v9 - 24);
        *((void *)v19 - 1) = *((void *)v9 - 1);
        *(_OWORD *)(v19 - 24) = v21;
        v19 -= 24;
        double v9 = (_OWORD *)((char *)v9 - 24);
      }
      while (v9 != v12);
      unint64_t v12 = *(_OWORD **)v4;
    }
    *(void *)uint64_t v4 = v19;
    *(void *)(v4 + 8) = v11;
    *(void *)(v4 + 16) = v20;
    if (v12) {
      operator delete(v12);
    }
  }
  else
  {
    _OWORD *v9 = v7;
    *((float *)v9 + 4) = v8;
    *((_DWORD *)v9 + 5) = -1082130432;
    uint64_t v11 = (char *)v9 + 24;
  }
  *(void *)(v4 + 8) = v11;
}

- (BOOL)intersectsClosedStroke:(id)a3
{
  id v4 = a3;
  int32x2_t v5 = [(PKStroke *)self _strokeMask];

  if (v5)
  {
    BOOL v6 = [(PKStroke *)self intersectsClosedStrokeMasked:v4];
  }
  else
  {
    __p = 0;
    double v9 = 0;
    uint64_t v10 = 0;
    [v4 generateClipperPath:&__p];
    BOOL v6 = [(PKStroke *)self intersectsClipperPath:&__p];
    if (__p)
    {
      double v9 = __p;
      operator delete(__p);
    }
  }

  return v6;
}

- (BOOL)intersectsClipperPath:(void *)a3
{
  long long v38 = 0;
  CGAffineTransform v39 = 0;
  uint64_t v40 = 0;
  [(PKStroke *)self generateClipperPath:&v38];
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  uint64_t v35 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v13 = &off_1F1FB03A8;
  long long v15 = 0u;
  long long v16 = 0u;
  long long __p = 0u;
  *(_OWORD *)unint64_t v14 = 0u;
  uint64_t v18 = 0;
  v19[0] = v19;
  v19[1] = v19;
  CGPoint v19[2] = 0;
  char v20 = 0;
  char v27 = 0;
  char v21 = 0;
  char v22 = 0;
  __int16 v31 = 0;
  uint64_t v23 = 0;
  long long v24 = off_1F1FB03F0;
  ClipperLib::ClipperBase::AddPath((uint64_t)&v14[-1] + (void)*(v13 - 3), (uint64_t)a3, 1, 1);
  memset(v9, 0, sizeof(v9));
  long long v8 = 0u;
  long long v7 = 0u;
  BOOL v6 = &unk_1F1FB0448;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  ClipperLib::Clipper::Execute((uint64_t)&v13, 0, &v6, 0, 0);
  unint64_t v4 = (unint64_t)(v11 - (void)v10) >> 3;
  if ((int)v4 >= 1) {
    LODWORD(v4) = v4 - (**((void **)&v8 + 1) != *v10);
  }
  ClipperLib::PolyTree::~PolyTree((ClipperLib::PolyTree *)&v6);
  std::__list_imp<long long>::clear(v19);
  if ((void)__p)
  {
    *((void *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  if (*((void *)&v15 + 1))
  {
    *(void *)&long long v16 = *((void *)&v15 + 1);
    operator delete(*((void **)&v15 + 1));
  }
  if (v14[0])
  {
    v14[1] = v14[0];
    operator delete(v14[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v24);
  if (v38)
  {
    CGAffineTransform v39 = v38;
    operator delete(v38);
  }
  return (int)v4 > 0;
}

- (BOOL)intersectsRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v8 = [(PKStroke *)self _strokeMask];

  if (v8)
  {
    return -[PKStroke intersectsRectMasked:](self, "intersectsRectMasked:", x, y, width, height);
  }
  else
  {
    long long __p = 0;
    unint64_t v14 = 0;
    uint64_t v15 = 0;
    float64x2_t v10 = *(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 16);
    v12[0] = *(float64x2_t *)MEMORY[0x1E4F1DAB8];
    v12[1] = v10;
    v12[2] = *(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 32);
    generateRectClipperPath(v12, (uint64_t)&__p, x, y, width, height);
    BOOL v11 = [(PKStroke *)self intersectsClipperPath:&__p];
    if (__p)
    {
      unint64_t v14 = __p;
      operator delete(__p);
    }
    return v11;
  }
}

- (id)_sliceWithSlicingBlock:(id)a3 inDrawing:(id)a4 newRootStroke:(id *)a5
{
  uint64_t v37 = (void (**)(id, PKStroke *))a3;
  id v8 = a4;
  double v9 = a5;
  id v38 = v8;
  float64x2_t v10 = self;
  objc_storeStrong(v9, self);
  if (![(PKStroke *)v10 hasSubstrokes])
  {
    long long v24 = v37[2](v37, v10);
    long long v25 = v24;
    if (v24 && [v24 count])
    {
      if ([v25 count] != 1) {
        goto LABEL_18;
      }
      long long v26 = [v25 firstObject];
      char v27 = [v26 _strokeUUID];
      uint64_t v28 = [(PKStroke *)v10 _strokeUUID];
      char v29 = [v27 isEqual:v28];

      if ((v29 & 1) == 0)
      {
LABEL_18:
        uint64_t v30 = [(PKStroke *)v10 _newStrokeWithSubstrokes:v25 inDrawing:v38];

        objc_storeStrong(v9, v30);
        id v31 = [v25 arrayByAddingObject:v30];
        float64x2_t v10 = v30;
LABEL_21:

        goto LABEL_26;
      }
    }
    else
    {
      id v32 = *v9;
      id *v9 = 0;
    }
    id v31 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_21;
  }
  BOOL v11 = [(PKStroke *)v10 _substrokesInDrawing:v38];
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v13 = [v11 count];
  if (v13 < 1)
  {
    float64x2_t v17 = 0;
  }
  else
  {
    uint64_t v36 = v10;
    uint64_t v35 = v9;
    uint64_t v14 = 0;
    char v15 = 0;
    char v16 = 0;
    float64x2_t v17 = 0;
    do
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v14, v35);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      id v39 = 0;
      long long v19 = [v18 _sliceWithSlicingBlock:v37 inDrawing:v38 newRootStroke:&v39];
      [v12 addObjectsFromArray:v19];
      v16 |= v39 != v18;
      BOOL v20 = v39 != 0;
      if ((v16 & 1) != 0 && !v17)
      {
        char v21 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
        float64x2_t v17 = v21;
        if (v14) {
          objc_msgSend(v21, "replaceObjectsInRange:withObjectsFromArray:range:", 0, 0, v11, 0, v14);
        }
      }
      if (v39) {
        objc_msgSend(v17, "addObject:");
      }
      v15 |= v20;

      ++v14;
    }
    while (v13 != v14);
    if (v16)
    {
      if ((v15 & 1) == 0)
      {
        uint64_t v34 = *v35;
        double *v35 = 0;

        id v31 = (id)MEMORY[0x1E4F1CBF0];
        float64x2_t v10 = v36;
        goto LABEL_25;
      }
      float64x2_t v10 = v36;
      uint64_t v22 = [(PKStroke *)v36 _newStrokeWithSubstrokes:v17 inDrawing:v38];
      [v12 addObject:v22];
      uint64_t v23 = *v35;
      double *v35 = (void *)v22;
    }
    else
    {
      float64x2_t v10 = v36;
    }
  }
  id v31 = v12;
LABEL_25:

LABEL_26:

  return v31;
}

- (int64_t)_visibleSubstrokeCountInDrawing:(id)a3
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__PKStroke_Slicing___visibleSubstrokeCountInDrawing___block_invoke;
  v5[3] = &unk_1E64C8920;
  v5[4] = &v6;
  [(PKStroke *)self _visitVisibleSubstrokes:v5 inDrawing:a3];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__PKStroke_Slicing___visibleSubstrokeCountInDrawing___block_invoke(uint64_t a1, void *a2)
{
  if (([a2 hasSubstrokes] & 1) == 0) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return 1;
}

- (void)_addVisibleSubstrokesTo:(id)a3 inDrawing:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PKStroke_Slicing___addVisibleSubstrokesTo_inDrawing___block_invoke;
  v8[3] = &unk_1E64C85E8;
  id v9 = v6;
  id v7 = v6;
  [(PKStroke *)self _visitVisibleSubstrokes:v8 inDrawing:a4];
}

uint64_t __55__PKStroke_Slicing___addVisibleSubstrokesTo_inDrawing___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 hasSubstrokes] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return 1;
}

- (BOOL)_visitVisibleSubstrokes:(id)a3 inDrawing:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = (uint64_t (**)(id, PKStroke *, unsigned char *))a3;
  id v7 = a4;
  unsigned __int8 v21 = 0;
  if (![(PKStroke *)self _isHidden]
    && ([(PKStroke *)self hasSubstrokes] || [(PKStroke *)self _pointsCount]))
  {
    int v9 = v6[2](v6, self, &v21);
    int v8 = v21;
    if (v21) {
      int v10 = 0;
    }
    else {
      int v10 = v9;
    }
    if (v10 == 1)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      BOOL v11 = -[PKStroke _substrokesInDrawing:](self, "_substrokesInDrawing:", v7, 0);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v18;
LABEL_11:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          unsigned __int8 v21 = [*(id *)(*((void *)&v17 + 1) + 8 * v14) _visitVisibleSubstrokes:v6 inDrawing:v7];
          if (v21) {
            break;
          }
          if (v12 == ++v14)
          {
            uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
            if (v12) {
              goto LABEL_11;
            }
            break;
          }
        }
      }

      int v8 = v21;
    }
  }
  else
  {
    int v8 = 0;
  }
  BOOL v15 = v8 != 0;

  return v15;
}

- (id)_updateStroke:(id)a3 inDrawing:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  PKCrash();
}

- (id)_mergeWithStroke:(id)a3 inDrawing:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  PKCrash();
}

- (void)_appendPointsOfInterestForSelectionMasked:(void *)a3
{
  long long v4 = 0u;
  long long v5 = 0u;
  long long v3 = 0u;
  [(PKStroke *)self _transform];
  operator new();
}

- (id)sliceWithEraser:(const void *)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v8[0] = self;
  long long v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  long long v5 = +[PKStroke sliceWithEraser:a3 toClip:v4 clipType:2];

  id v6 = [v5 objectAtIndexedSubscript:0];

  return v6;
}

- (id)sliceWithMask:(const void *)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v8[0] = self;
  long long v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  long long v5 = +[PKStroke sliceWithEraser:a3 toClip:v4 clipType:0];

  id v6 = [v5 objectAtIndexedSubscript:0];

  return v6;
}

+ (id)sliceWithEraser:(const void *)a3 toClip:(id)a4
{
  long long v4 = [a1 sliceWithEraser:a3 toClip:a4 clipType:2];

  return v4;
}

+ (id)sliceWithEraser:(const void *)a3 toClip:(id)a4 clipType:(int)a5
{
  v167[1] = *MEMORY[0x1E4F143B8];
  uint64_t v158 = 0;
  uint64_t v157 = 0;
  uint64_t v159 = 0;
  uint64_t v161 = 0;
  uint64_t v163 = 0;
  uint64_t v162 = 0;
  uint64_t v166 = 0;
  uint64_t v164 = 0;
  uint64_t v165 = 0;
  long long v154 = 0u;
  long long v155 = 0u;
  v142 = &off_1F1FB03A8;
  double v101 = (ClipperLib::ClipperBase *)&v153;
  long long v153 = off_1F1FB03F0;
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  uint64_t v147 = 0;
  v148[0] = v148;
  unint64_t v100 = v148;
  v148[1] = v148;
  v148[2] = 0;
  char v149 = 0;
  char v156 = 0;
  char v150 = 0;
  char v151 = 0;
  __int16 v160 = 0;
  long long v152 = ZFillCallback;
  id v112 = a4;
  uint64_t v105 = [v112 count];
  if (v105 >= 1)
  {
    for (uint64_t i = 0; i != v105; ++i)
    {
      id v7 = objc_msgSend(v112, "objectAtIndexedSubscript:", i, v100, v101);
      int v8 = v7;
      memset(v129, 0, 48);
      if (v7) {
        [v7 _transform];
      }
      CGAffineTransform v141 = *(CGAffineTransform *)v129;
      if (CGAffineTransformIsIdentity(&v141))
      {
        uint64_t v9 = (uint64_t)*(v142 - 3);
        int v10 = [v8 _strokeMask];
        ClipperLib::ClipperBase::AddPaths((uint64_t)&v142 + v9, (uint64_t *)[v10 maskPaths], 0, 1);
      }
      else
      {
        memset(&v140, 0, sizeof(v140));
        CGAffineTransformMakeScale(&t1, 0.01, 0.01);
        CGAffineTransform t2 = *(CGAffineTransform *)v129;
        CGAffineTransformConcat(&v139, &t1, &t2);
        CGAffineTransformMakeScale(&v136, 100.0, 100.0);
        CGAffineTransformConcat(&v140, &v139, &v136);
        BOOL v11 = [v8 _strokeMask];
        uint64_t v12 = (uint64_t *)[v11 maskPaths];

        uint64_t v13 = *v12;
        uint64_t v107 = v12[1];
        CGFloat v109 = v8;
        if (*v12 != v107)
        {
          do
          {
            memset(&v121, 0, 24);
            std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(&v121, *(const void **)v13, *(void *)(v13 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v13 + 8) - *(void *)v13) >> 3));
            uint64_t v14 = i;
            long long v134 = 0;
            long long __p = 0;
            v135 = 0;
            std::vector<ClipperLib::IntPoint>::reserve(&__p, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&v121.b - *(void *)&v121.a) >> 3));
            CGFloat a = v121.a;
            CGFloat b = v121.b;
            if (*(void *)&v121.a != *(void *)&v121.b)
            {
              long long v17 = v134;
              do
              {
                __int32 v19 = *(_DWORD *)(*(void *)&a + 16);
                __int32 v18 = *(_DWORD *)(*(void *)&a + 20);
                int64x2_t v20 = vcvtq_s64_f64(vaddq_f64(*(float64x2_t *)&v140.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v140.c, (double)*(uint64_t *)(*(void *)&a + 8)), *(float64x2_t *)&v140.a, (double)(uint64_t)**(void **)&a)));
                if (v17 >= v135)
                {
                  CGPoint point = (CGPoint)v20;
                  unsigned __int8 v21 = (int64x2_t *)__p;
                  unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * (((char *)v17 - (unsigned char *)__p) >> 3);
                  unint64_t v23 = v22 + 1;
                  if (v22 + 1 > 0xAAAAAAAAAAAAAAALL) {
                    std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
                  }
                  if (0x5555555555555556 * (((char *)v135 - (unsigned char *)__p) >> 3) > v23) {
                    unint64_t v23 = 0x5555555555555556 * (((char *)v135 - (unsigned char *)__p) >> 3);
                  }
                  if (0xAAAAAAAAAAAAAAABLL * (((char *)v135 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
                    unint64_t v24 = 0xAAAAAAAAAAAAAAALL;
                  }
                  else {
                    unint64_t v24 = v23;
                  }
                  if (v24)
                  {
                    long long v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v135, v24);
                    long long v17 = v134;
                    unsigned __int8 v21 = (int64x2_t *)__p;
                  }
                  else
                  {
                    long long v25 = 0;
                  }
                  long long v26 = &v25[24 * v22];
                  *(CGPoint *)long long v26 = point;
                  *((_DWORD *)v26 + 4) = v19;
                  *((_DWORD *)v26 + 5) = v18;
                  char v27 = v26;
                  if (v17 != v21)
                  {
                    do
                    {
                      long long v28 = *(long long *)((char *)&v17[-2] + 8);
                      *((void *)v27 - 1) = v17[-1].i64[1];
                      *(_OWORD *)(v27 - 24) = v28;
                      v27 -= 24;
                      long long v17 = (int64x2_t *)((char *)v17 - 24);
                    }
                    while (v17 != v21);
                    unsigned __int8 v21 = (int64x2_t *)__p;
                  }
                  long long v17 = (int64x2_t *)(v26 + 24);
                  long long __p = v27;
                  long long v134 = (int64x2_t *)(v26 + 24);
                  v135 = (int64x2_t *)&v25[24 * v24];
                  if (v21) {
                    operator delete(v21);
                  }
                }
                else
                {
                  *long long v17 = v20;
                  v17[1].i32[0] = v19;
                  v17[1].i32[1] = v18;
                  long long v17 = (int64x2_t *)((char *)v17 + 24);
                }
                long long v134 = v17;
                *(void *)&a += 24;
              }
              while (*(void *)&a != *(void *)&b);
            }
            int v8 = v109;
            ClipperLib::ClipperBase::AddPath((uint64_t)&v142 + (void)*(v142 - 3), (uint64_t)&__p, 0, 1);
            uint64_t i = v14;
            if (__p)
            {
              long long v134 = (int64x2_t *)__p;
              operator delete(__p);
            }
            if (*(void *)&v121.a)
            {
              v121.CGFloat b = v121.a;
              operator delete(*(void **)&v121.a);
            }
            v13 += 24;
          }
          while (v13 != v107);
        }
      }
    }
  }
  long long v134 = 0;
  long long __p = 0;
  v135 = 0;
  memset(&v129[8], 0, 61);
  *(void *)float64x2_t v129 = &unk_1F1FB0448;
  uint64_t v130 = 0;
  uint64_t v132 = 0;
  uint64_t v131 = 0;
  ClipperLib::Clipper::Execute((uint64_t)&v142, a5, (void **)v129, 0, 0);
  if (*(void *)&v129[40] == *(void *)&v129[32])
  {
    id v104 = 0;
  }
  else
  {
    unint64_t v29 = [v112 count];
    unint64_t v30 = v29;
    v126 = 0;
    v127 = 0;
    v128 = 0;
    *(void *)&v140.CGFloat a = &v126;
    LOBYTE(v140.b) = 0;
    if (v29)
    {
      if (v29 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      }
      id v31 = (char *)operator new(24 * v29);
      id v32 = &v31[24 * v30];
      v126 = v31;
      v128 = v32;
      bzero(v31, 24 * ((24 * v30 - 24) / 0x18) + 24);
      v127 = v32;
    }
    uint64_t v34 = *(uint64_t **)&v129[40];
    uint64_t v33 = *(uint64_t **)&v129[32];
    if (*(void *)&v129[32] != *(void *)&v129[40])
    {
      float64x2_t v110 = (float64x2_t)vdupq_n_s64(0x4059000000000000uLL);
      do
      {
        uint64_t v35 = 0;
        unint64_t v36 = 0;
        uint64_t v37 = *v33;
        pointCGFloat a = (CGPoint)vdivq_f64(vcvtq_f64_s64(*(int64x2_t *)*(void *)(*v33 + 8)), v110);
        while (v36 < objc_msgSend(v112, "count", v100))
        {
          id v38 = [v112 objectAtIndexedSubscript:v36];
          [v38 _bounds];
          CGRect v170 = CGRectInset(v169, -1.0, -1.0);
          CGFloat x = v170.origin.x;
          CGFloat y = v170.origin.y;
          CGFloat width = v170.size.width;
          CGFloat height = v170.size.height;

          v171.origin.CGFloat x = x;
          v171.origin.CGFloat y = y;
          v171.size.CGFloat width = width;
          v171.size.CGFloat height = height;
          if (CGRectContainsPoint(v171, pointa))
          {
            double v43 = (void **)&v126[v35];
            double v44 = *(void **)&v126[v35 + 8];
            unint64_t v45 = *(void *)&v126[v35 + 16];
            if ((unint64_t)v44 >= v45)
            {
              double v47 = (char *)*v43;
              uint64_t v48 = ((char *)v44 - (unsigned char *)*v43) >> 3;
              if ((unint64_t)(v48 + 1) >> 61) {
                std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v49 = v45 - (void)v47;
              unint64_t v50 = (uint64_t)(v45 - (void)v47) >> 2;
              if (v50 <= v48 + 1) {
                unint64_t v50 = v48 + 1;
              }
              if (v49 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v51 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v51 = v50;
              }
              if (v51) {
                uint64_t v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v126[v35 + 16], v51);
              }
              else {
                uint64_t v52 = 0;
              }
              uint64_t v53 = &v52[8 * v48];
              *(void *)uint64_t v53 = v37;
              double v46 = v53 + 8;
              uint64_t v55 = (char *)*v43;
              v54 = (char *)v43[1];
              if (v54 != *v43)
              {
                do
                {
                  uint64_t v56 = *((void *)v54 - 1);
                  v54 -= 8;
                  *((void *)v53 - 1) = v56;
                  v53 -= 8;
                }
                while (v54 != v55);
                v54 = (char *)*v43;
              }
              double *v43 = v53;
              v43[1] = v46;
              v43[2] = &v52[8 * v51];
              if (v54) {
                operator delete(v54);
              }
            }
            else
            {
              void *v44 = v37;
              double v46 = v44 + 1;
            }
            v43[1] = v46;
            break;
          }
          ++v36;
          v35 += 24;
        }
        ++v33;
      }
      while (v33 != v34);
    }
    id v104 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v127 - v126 >= 1)
    {
      uint64_t v57 = 0;
      int64_t v58 = (v127 - v126) / 0x18uLL;
      if (v58 <= 1) {
        int64_t v58 = 1;
      }
      int64_t v102 = v58;
      while (*(void *)&v126[24 * v57 + 8] == *(void *)&v126[24 * v57])
      {
        [v104 addObject:MEMORY[0x1E4F1CBF0]];
LABEL_116:
        if (++v57 == v102) {
          goto LABEL_117;
        }
      }
      pointCGFloat b = [v112 objectAtIndexedSubscript:v57];
      uint64_t v59 = v126;
      uint64_t v60 = (char **)&v126[24 * v57];
      if (v60[1] - *v60 == 8)
      {
        memset(&v140, 0, 24);
        std::vector<ClipperLib::PolyNode *>::__insert_with_size[abi:ne180100]<std::__wrap_iter<ClipperLib::PolyNode **>,std::__wrap_iter<ClipperLib::PolyNode **>>((void **)&v140, 0, *v60, v60[1], (v60[1] - *v60) >> 3);
        CGFloat v61 = v140.a;
        if ((uint64_t)(*(void *)&v140.b - *(void *)&v140.a) >= 1)
        {
          uint64_t v62 = 0;
          uint64_t v63 = (*(void *)&v140.b - *(void *)&v140.a) >> 3;
          while (2)
          {
            uint64_t v64 = *(void *)(*(void *)&v61 + 8 * v62);
            for (uint64_t j = *(void *)(v64 + 8); j != *(void *)(v64 + 16); j += 24)
            {
              if (*(float *)(j + 20) > 0.0)
              {
                if (v61 != 0.0)
                {
                  v140.CGFloat b = v61;
                  operator delete(*(void **)&v61);
                }
                uint64_t v59 = v126;
                goto LABEL_80;
              }
            }
            std::vector<ClipperLib::PolyNode *>::__insert_with_size[abi:ne180100]<std::__wrap_iter<ClipperLib::PolyNode **>,std::__wrap_iter<ClipperLib::PolyNode **>>((void **)&v140, *(uint64_t *)&v140.b, *(char **)(v64 + 32), *(char **)(v64 + 40), (uint64_t)(*(void *)(v64 + 40) - *(void *)(v64 + 32)) >> 3);
            CGFloat v61 = v140.a;
            v63 += (uint64_t)(*(void *)(*(void *)(*(void *)&v140.a + 8 * v62) + 40)
                           - *(void *)(*(void *)(*(void *)&v140.a + 8 * v62) + 32)) >> 3;
            if (++v62 < v63) {
              continue;
            }
            break;
          }
        }
        v167[0] = pointb;
        unint64_t v66 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v167, 1, v100);
        [v104 addObject:v66];

        CGFloat v67 = v140.a;
        if (!*(void *)&v140.a) {
          goto LABEL_115;
        }
        v140.CGFloat b = v140.a;
      }
      else
      {
LABEL_80:
        int v123 = 0;
        *(void *)id v124 = 0;
        uint64_t v125 = 0;
        std::vector<ClipperLib::PolyNode *>::__insert_with_size[abi:ne180100]<std::__wrap_iter<ClipperLib::PolyNode **>,std::__wrap_iter<ClipperLib::PolyNode **>>(&v123, 0, *(char **)&v59[24 * v57], *(char **)&v59[24 * v57 + 8], (uint64_t)(*(void *)&v59[24 * v57 + 8] - *(void *)&v59[24 * v57]) >> 3);
        BOOL v108 = *(void *)v124 - (void)v123 >= 9uLL && [pointb _shapeType] != 0;
        id v111 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if ((uint64_t)(*(void *)v124 - (void)v123) >= 1)
        {
          uint64_t v68 = 0;
          uint64_t v69 = (*(void *)v124 - (void)v123) >> 3;
          uint64_t v106 = v57;
          do
          {
            double v70 = objc_msgSend(pointb, "copyForSubstroke", v100);
            double v71 = objc_alloc_init(PKStrokeMask);
            [v70 _setStrokeMask:v71];
            if (v108)
            {
              [v70 _setGroupID:0];
              [v70 _setShapeType:0];
            }
            v72 = [(PKStrokeMask *)v71 maskPaths];
            v73 = v72;
            uint64_t v74 = *((void *)v123 + v68) + 8;
            unint64_t v75 = v72[1];
            if (v75 >= v72[2])
            {
              uint64_t v76 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v72, v74);
            }
            else
            {
              std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v72, v74);
              uint64_t v76 = v75 + 24;
            }
            v73[1] = v76;
            uint64_t v77 = *((void *)v123 + v68);
            long long v78 = *(uint64_t **)(v77 + 32);
            float v79 = *(uint64_t **)(v77 + 40);
            while (v78 != v79)
            {
              uint64_t v80 = *v78;
              unint64_t v81 = [(PKStrokeMask *)v71 maskPaths];
              long long v82 = v81;
              uint64_t v83 = v80 + 8;
              unint64_t v84 = v81[1];
              if (v84 >= v81[2])
              {
                uint64_t v85 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v81, v83);
              }
              else
              {
                std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v81, v83);
                uint64_t v85 = v84 + 24;
              }
              v82[1] = v85;
              std::vector<ClipperLib::PolyNode *>::__insert_with_size[abi:ne180100]<std::__wrap_iter<ClipperLib::PolyNode **>,std::__wrap_iter<ClipperLib::PolyNode **>>(&v123, *(uint64_t *)v124, *(char **)(v80 + 32), *(char **)(v80 + 40), (uint64_t)(*(void *)(v80 + 40) - *(void *)(v80 + 32)) >> 3);
              v69 += (uint64_t)(*(void *)(v80 + 40) - *(void *)(v80 + 32)) >> 3;
              ++v78;
            }
            [(PKStrokeMask *)v71 calculateCenterlineSlices:v70];
            uint64_t v57 = v106;
            uint64_t v86 = [(PKStrokeMask *)v71 maskPaths];
            double v87 = *(uint64_t **)v86;
            double v88 = *(uint64_t **)(v86 + 8);
            while (v87 != v88)
            {
              uint64_t v89 = *v87;
              uint64_t v90 = v87[1];
              while (v89 != v90)
              {
                *(_DWORD *)(v89 + 20) = -1082130432;
                v89 += 24;
              }
              v87 += 3;
            }
            memset(&v140, 0, sizeof(v140));
            if (pointb) {
              [pointb _transform];
            }
            CGAffineTransform v122 = v140;
            if (!CGAffineTransformIsIdentity(&v122))
            {
              memset(&v121, 0, sizeof(v121));
              CGAffineTransformMakeScale(&v118, 0.01, 0.01);
              CGAffineTransform v117 = v140;
              CGAffineTransformConcat(&v119, &v118, &v117);
              CGAffineTransformMakeScale(&v116, 100.0, 100.0);
              CGAffineTransformConcat(&v120, &v119, &v116);
              CGAffineTransformInvert(&v121, &v120);
              id v91 = [(PKStrokeMask *)v71 maskPaths];
              BOOL v92 = *v91;
              unint64_t v93 = v91[1];
              if (*v91 != v93)
              {
                float64x2_t v94 = *(float64x2_t *)&v121.a;
                float64x2_t v95 = *(float64x2_t *)&v121.c;
                float64x2_t v96 = *(float64x2_t *)&v121.tx;
                do
                {
                  double v97 = *v92;
                  uint64_t v98 = v92[1];
                  while (v97 != v98)
                  {
                    *double v97 = vcvtq_s64_f64(vaddq_f64(v96, vmlaq_n_f64(vmulq_n_f64(v95, (double)v97->i64[1]), v94, (double)v97->i64[0])));
                    double v97 = (int64x2_t *)((char *)v97 + 24);
                  }
                  v92 += 3;
                }
                while (v92 != v93);
              }
            }
            [v111 addObject:v70];

            ++v68;
          }
          while (v68 < v69);
        }
        objc_msgSend(v104, "addObject:", v111, v100);

        CGFloat v67 = *(double *)&v123;
        if (!v123) {
          goto LABEL_115;
        }
        *(void *)id v124 = v123;
      }
      operator delete(*(void **)&v67);
LABEL_115:

      goto LABEL_116;
    }
LABEL_117:
    *(void *)&v140.CGFloat a = &v126;
    std::vector<std::vector<ClipperLib::PolyNode *>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v140);
  }
  ClipperLib::PolyTree::~PolyTree((ClipperLib::PolyTree *)v129);
  *(void *)float64x2_t v129 = &__p;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)v129);
  std::__list_imp<long long>::clear(v100);
  if ((void)v146)
  {
    *((void *)&v146 + 1) = v146;
    operator delete((void *)v146);
  }
  if (*((void *)&v144 + 1))
  {
    *(void *)&long long v145 = *((void *)&v144 + 1);
    operator delete(*((void **)&v144 + 1));
  }
  if ((void)v143)
  {
    *((void *)&v143 + 1) = v143;
    operator delete((void *)v143);
  }
  ClipperLib::ClipperBase::~ClipperBase(v101);

  return v104;
}

- (CGPath)newPathRepresentationMasked
{
  Mutable = CGPathCreateMutable();
  long long v4 = [(PKStroke *)self _strokeMask];
  uint64_t v5 = [v4 maskPaths];

  id v6 = *(uint64_t ***)v5;
  for (uint64_t i = *(uint64_t ***)(v5 + 8); v6 != i; v6 += 3)
  {
    CGPathMoveToPoint(Mutable, 0, (double)**v6 / 100.0, (double)(*v6)[1] / 100.0);
    int v8 = *v6;
    uint64_t v9 = v6[1];
    while (v8 != v9)
    {
      uint64_t v10 = *v8;
      uint64_t v11 = v8[1];
      v8 += 3;
      CGPathAddLineToPoint(Mutable, 0, (double)v10 / 100.0, (double)v11 / 100.0);
    }
    CGPathCloseSubpath(Mutable);
  }
  return Mutable;
}

- (CGPath)newSelectionPathRepresentationWithPointsCountMasked:(int *)a3
{
}

- (void)debugRenderMasked:(CGContext *)a3
{
  CGContextSetRGBStrokeColor(a3, 0.0, 0.97, 0.0, 1.0);
  Mutable = CGPathCreateMutable();
  id v6 = [(PKStroke *)self _strokeMask];
  uint64_t v7 = [v6 maskPaths];

  int v8 = *(uint64_t ***)v7;
  for (uint64_t i = *(uint64_t ***)(v7 + 8); v8 != i; v8 += 3)
  {
    CGPathMoveToPoint(Mutable, 0, (double)**v8 / 100.0, (double)(*v8)[1] / 100.0);
    uint64_t v10 = *v8;
    uint64_t v11 = v8[1];
    while (v10 != v11)
    {
      uint64_t v12 = *v10;
      uint64_t v13 = v10[1];
      v10 += 3;
      CGPathAddLineToPoint(Mutable, 0, (double)v12 / 100.0, (double)v13 / 100.0);
    }
    CGPathCloseSubpath(Mutable);
  }
  CGContextSaveGState(a3);
  [(PKStroke *)self _transform];
  CGContextConcatCTM(a3, &transform);
  CGContextAddPath(a3, Mutable);
  CGContextStrokePath(a3);
  CGContextRestoreGState(a3);
  CGPathRelease(Mutable);
  CGContextSetRGBStrokeColor(a3, 1.0, 0.578, 0.0, 1.0);
  uint64_t v14 = [(PKStroke *)self _strokeMask];
  uint64_t v15 = [v14 centerlineSlices];

  long long v17 = *(double **)v15;
  for (uint64_t j = *(double **)(v15 + 8); v17 != j; v17 += 2)
  {
    double v18 = *v17;
    double v19 = v17[1];
    int64x2_t v20 = CGPathCreateMutable();
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    char v23 = 1;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __39__PKStroke_Slicing__debugRenderMasked___block_invoke;
    v21[3] = &unk_1E64C8948;
    void v21[4] = self;
    v21[5] = v22;
    v21[6] = v20;
    [(PKStroke *)self interpolatePointDataWithStep:v21 from:0.1 to:v18 usingBlock:v19];
    CGContextAddPath(a3, v20);
    CGContextStrokePath(a3);
    CGPathRelease(v20);
    _Block_object_dispose(v22, 8);
  }
}

void __39__PKStroke_Slicing__debugRenderMasked___block_invoke(void *a1, double a2, double a3)
{
  id v6 = (void *)a1[4];
  if (v6)
  {
    [v6 _transform];
    double v8 = v17;
    double v7 = v16;
    double v9 = v19;
    double v10 = v18;
    double v11 = v21;
    double v12 = v20;
  }
  else
  {
    double v11 = 0.0;
    double v9 = 0.0;
    double v8 = 0.0;
    double v12 = 0.0;
    double v10 = 0.0;
    double v7 = 0.0;
  }
  double v13 = v12 + a3 * v10 + v7 * a2;
  double v14 = v11 + a3 * v9 + v8 * a2;
  uint64_t v15 = (CGPath *)a1[6];
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    CGPathMoveToPoint(v15, 0, v13, v14);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
  }
  else
  {
    CGPathAddLineToPoint(v15, 0, v13, v14);
  }
}

- (void)generateMask
{
  long long v3 = [(PKStroke *)self _strokeMask];

  if (!v3)
  {
    long long v4 = objc_alloc_init(PKStrokeMask);
    [(PKStroke *)self _setStrokeMask:v4];
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x4812000000;
    v23[3] = __Block_byref_object_copy__7;
    v23[4] = __Block_byref_object_dispose__8;
    _OWORD v23[5] = "";
    long long v25 = 0;
    uint64_t v26 = 0;
    unint64_t v24 = 0;
    v19[0] = 0;
    v19[1] = v19;
    CGPoint v19[2] = 0x4812000000;
    v19[3] = __Block_byref_object_copy__7;
    void v19[4] = __Block_byref_object_dispose__8;
    v19[5] = "";
    double v21 = 0;
    uint64_t v22 = 0;
    long long __p = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __33__PKStroke_Slicing__generateMask__block_invoke_11;
    aBlock[3] = &unk_1E64C8990;
    aBlock[4] = v23;
    uint64_t v5 = _Block_copy(aBlock);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __33__PKStroke_Slicing__generateMask__block_invoke_2;
    float64x2_t v12[3] = &unk_1E64C89B8;
    double v16 = v23;
    double v17 = v19;
    id v6 = v5;
    id v14 = v6;
    id v15 = &__block_literal_global_47;
    double v7 = v4;
    double v13 = v7;
    double v8 = [(PKStroke *)self ink];
    [(PKStroke *)self _inkTransform];
    double v9 = [(PKStroke *)self path];
    +[PKStroke _consumeRenderVertexes:v12 ink:v8 inkTransform:&v11 strokePath:v9];

    double v10 = [(PKStrokeMask *)v7 maskPaths];
    ClipperLib::SimplifyPolygons(v10, v10, 1);

    _Block_object_dispose(v19, 8);
    if (__p)
    {
      double v21 = __p;
      operator delete(__p);
    }
    _Block_object_dispose(v23, 8);
    if (v24)
    {
      long long v25 = v24;
      operator delete(v24);
    }
  }
}

double __33__PKStroke_Slicing__generateMask__block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  unint64_t v3 = a2[1] - *a2;
  if ((uint64_t)v3 < 1)
  {
    double result = 0.0;
  }
  else
  {
    unint64_t v4 = v3 >> 4;
    if (v3 >> 4 <= 1) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = v3 >> 4;
    }
    uint64_t v6 = v2 + 16 * v4;
    double v8 = *(double *)(v6 - 16);
    double v7 = *(double *)(v6 - 8);
    double v9 = (double *)(v2 + 8);
    double v10 = 0.0;
    do
    {
      double v12 = *(v9 - 1);
      double v11 = *v9;
      double v10 = v10 + v12 * v7 - *v9 * v8;
      v9 += 2;
      double v8 = v12;
      double v7 = v11;
      --v5;
    }
    while (v5);
    double result = v10 * 0.5;
  }
  if (result < 0.0) {
    return -result;
  }
  return result;
}

void __33__PKStroke_Slicing__generateMask__block_invoke_11(uint64_t a1, double a2, double a3)
{
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = (double *)v5[7];
  unint64_t v7 = v5[8];
  if ((unint64_t)v6 >= v7)
  {
    double v9 = (double *)v5[6];
    uint64_t v10 = ((char *)v6 - (char *)v9) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v7 - (void)v9;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13)
    {
      id v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)(v5 + 8), v13);
      double v9 = (double *)v5[6];
      uint64_t v6 = (double *)v5[7];
    }
    else
    {
      id v14 = 0;
    }
    id v15 = (double *)&v14[16 * v10];
    double v16 = &v14[16 * v13];
    *id v15 = a2;
    v15[1] = a3;
    double v8 = v15 + 2;
    if (v6 != v9)
    {
      do
      {
        *((_OWORD *)v15 - 1) = *((_OWORD *)v6 - 1);
        v15 -= 2;
        v6 -= 2;
      }
      while (v6 != v9);
      double v9 = (double *)v5[6];
    }
    v5[6] = v15;
    v5[7] = v8;
    v5[8] = v16;
    if (v9) {
      operator delete(v9);
    }
  }
  else
  {
    *uint64_t v6 = a2;
    v6[1] = a3;
    double v8 = v6 + 2;
  }
  v5[7] = v8;
}

void __33__PKStroke_Slicing__generateMask__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a3;
  uint64_t v6 = v5;
  uint64_t v86 = a2 - 1;
  if (a2 >= 1)
  {
    uint64_t v7 = 0;
    double v8 = v5 + 16;
    double v9 = off_1E64C4000;
    float64x2_t v88 = (float64x2_t)vdupq_n_s64(0x4059000000000000uLL);
    do
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 56) = *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                              + 48);
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 56) = *(void *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                              + 48);
      (*((void (**)(char *, uint64_t, void))v6 + 2))(v6, v7, *(void *)(a1 + 40));
      if (v7 >= v86) {
        goto LABEL_64;
      }
      uint64_t v12 = v10;
      uint64_t v13 = v11;
      double v14 = (*((double (**)(char *, uint64_t, void))v6 + 2))(v6, v7 + 1, *(void *)(a1 + 40));
      uint64_t v16 = v15;
      double v17 = *(void **)(*(void *)(a1 + 64) + 8);
      double v18 = (char *)v17[7];
      unint64_t v19 = v17[8];
      if ((unint64_t)v18 >= v19)
      {
        double v21 = (char *)v17[6];
        uint64_t v22 = (v18 - v21) >> 4;
        unint64_t v23 = v22 + 1;
        if ((unint64_t)(v22 + 1) >> 60) {
          goto LABEL_95;
        }
        uint64_t v24 = v19 - (void)v21;
        if (v24 >> 3 > v23) {
          unint64_t v23 = v24 >> 3;
        }
        if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v25 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v25 = v23;
        }
        if (v25)
        {
          uint64_t v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)(v17 + 8), v25);
          double v21 = (char *)v17[6];
          double v18 = (char *)v17[7];
        }
        else
        {
          uint64_t v26 = 0;
        }
        char v27 = &v26[16 * v22];
        *(void *)char v27 = v12;
        *((void *)v27 + 1) = v13;
        long long v28 = v27;
        if (v18 != v21)
        {
          do
          {
            *((_OWORD *)v28 - 1) = *((_OWORD *)v18 - 1);
            v28 -= 16;
            v18 -= 16;
          }
          while (v18 != v21);
          double v21 = (char *)v17[6];
        }
        double v20 = v27 + 16;
        v17[6] = v28;
        v17[7] = v27 + 16;
        v17[8] = &v26[16 * v25];
        if (v21) {
          operator delete(v21);
        }
      }
      else
      {
        *(void *)double v18 = v12;
        *((void *)v18 + 1) = v13;
        double v20 = v18 + 16;
      }
      v17[7] = v20;
      unint64_t v29 = *(void **)(*(void *)(a1 + 64) + 8);
      unint64_t v30 = (char *)v29[7];
      unint64_t v31 = v29[8];
      if ((unint64_t)v30 >= v31)
      {
        uint64_t v33 = (char *)v29[6];
        uint64_t v34 = (v30 - v33) >> 4;
        unint64_t v35 = v34 + 1;
        if ((unint64_t)(v34 + 1) >> 60) {
LABEL_95:
        }
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        uint64_t v36 = v31 - (void)v33;
        if (v36 >> 3 > v35) {
          unint64_t v35 = v36 >> 3;
        }
        if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v37 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v37 = v35;
        }
        if (v37)
        {
          id v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)(v29 + 8), v37);
          uint64_t v33 = (char *)v29[6];
          unint64_t v30 = (char *)v29[7];
        }
        else
        {
          id v38 = 0;
        }
        id v39 = (double *)&v38[16 * v34];
        *id v39 = v14;
        *((void *)v39 + 1) = v16;
        uint64_t v40 = v39;
        if (v30 != v33)
        {
          do
          {
            *((_OWORD *)v40 - 1) = *((_OWORD *)v30 - 1);
            v40 -= 2;
            v30 -= 16;
          }
          while (v30 != v33);
          uint64_t v33 = (char *)v29[6];
        }
        id v32 = v39 + 2;
        v29[6] = v40;
        v29[7] = v39 + 2;
        v29[8] = &v38[16 * v37];
        if (v33) {
          operator delete(v33);
        }
      }
      else
      {
        *(double *)unint64_t v30 = v14;
        *((void *)v30 + 1) = v16;
        id v32 = v30 + 16;
      }
      v29[7] = v32;
      if (v7 + 2 >= a2)
      {
LABEL_64:
        uint64_t v62 = v7;
      }
      else
      {
        do
        {
          double v41 = (*((double (**)(char *))v6 + 2))(v6);
          double v43 = v41;
          uint64_t v44 = v42;
          unint64_t v45 = *(void **)(*(void *)(a1 + 64) + 8);
          double v46 = (double *)v45[7];
          unint64_t v47 = v45[8];
          if ((unint64_t)v46 >= v47)
          {
            unint64_t v49 = (double *)v45[6];
            uint64_t v50 = ((char *)v46 - (char *)v49) >> 4;
            unint64_t v51 = v50 + 1;
            if ((unint64_t)(v50 + 1) >> 60) {
              std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v52 = v47 - (void)v49;
            if (v52 >> 3 > v51) {
              unint64_t v51 = v52 >> 3;
            }
            if ((unint64_t)v52 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v53 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v53 = v51;
            }
            if (v53)
            {
              v54 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)(v45 + 8), v53);
              unint64_t v49 = (double *)v45[6];
              double v46 = (double *)v45[7];
            }
            else
            {
              v54 = 0;
            }
            uint64_t v55 = &v54[16 * v50];
            *(double *)uint64_t v55 = v43;
            *((void *)v55 + 1) = v44;
            uint64_t v56 = v55;
            if (v46 != v49)
            {
              do
              {
                *((_OWORD *)v56 - 1) = *((_OWORD *)v46 - 1);
                v56 -= 16;
                v46 -= 2;
              }
              while (v46 != v49);
              unint64_t v49 = (double *)v45[6];
            }
            uint64_t v48 = v55 + 16;
            v45[6] = v56;
            v45[7] = v55 + 16;
            v45[8] = &v54[16 * v53];
            if (v49) {
              operator delete(v49);
            }
          }
          else
          {
            *double v46 = v41;
            *((void *)v46 + 1) = v42;
            uint64_t v48 = v46 + 2;
          }
          v45[7] = v48;
          unint64_t v93 = 0;
          uint64_t v94 = 0;
          long long __p = 0;
          uint64_t v57 = *(void *)(*(void *)(a1 + 64) + 8);
          int64_t v58 = *(char **)(v57 + 48);
          uint64_t v59 = *(void *)(v57 + 56);
          uint64_t v60 = (void **)(v57 + 48);
          if ((unint64_t)(v59 - (void)v58) < 0x31)
          {
            if (&__p != v60) {
              std::vector<CGPoint>::__assign_with_size[abi:ne180100]<CGPoint*,CGPoint*>((char *)&__p, v58, v59, (v59 - (uint64_t)v58) >> 4);
            }
          }
          else
          {
            [(__objc2_class *)v9[1] convexHull:&__p forPoints:v60];
          }
          double v61 = (*(double (**)(void))(*(void *)(a1 + 48) + 16))();
          if (__p)
          {
            unint64_t v93 = (float64x2_t *)__p;
            operator delete(__p);
          }
          uint64_t v62 = v7 + 1;
          BOOL v63 = v61 <= 10.0 && v7 + 3 < a2;
          ++v7;
        }
        while (v63);
      }
      uint64_t v64 = v9;
      uint64_t v65 = v8;
      uint64_t v66 = a2;
      unint64_t v93 = 0;
      uint64_t v94 = 0;
      long long __p = 0;
      CGFloat v67 = v64;
      -[__objc2_class convexHull:forPoints:](v64[1], "convexHull:forPoints:", &__p, *(void *)(*(void *)(a1 + 56) + 8) + 48, v86);
      uint64_t v89 = 0;
      uint64_t v90 = 0;
      id v91 = 0;
      uint64_t v69 = (float64x2_t *)__p;
      uint64_t v68 = v93;
      if (__p != v93)
      {
        double v70 = 0;
        do
        {
          int32x2_t v71 = vmovn_s64(vcvtq_s64_f64(vmulq_f64(*v69, v88)));
          *(void *)&long long v72 = v71.i32[0];
          *((void *)&v72 + 1) = v71.i32[1];
          long long v73 = v72;
          if (v70 >= v91)
          {
            long long v87 = v73;
            uint64_t v74 = (char *)v89;
            unint64_t v75 = 0xAAAAAAAAAAAAAAABLL * ((v70 - (unsigned char *)v89) >> 3);
            unint64_t v76 = v75 + 1;
            if (v75 + 1 > 0xAAAAAAAAAAAAAAALL) {
              std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
            }
            if (0x5555555555555556 * ((v91 - (unsigned char *)v89) >> 3) > v76) {
              unint64_t v76 = 0x5555555555555556 * ((v91 - (unsigned char *)v89) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((v91 - (unsigned char *)v89) >> 3) >= 0x555555555555555) {
              unint64_t v77 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v77 = v76;
            }
            if (v77)
            {
              long long v78 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v91, v77);
              uint64_t v74 = (char *)v89;
              double v70 = v90;
            }
            else
            {
              long long v78 = 0;
            }
            float v79 = &v78[24 * v75];
            *(_OWORD *)float v79 = v87;
            *((void *)v79 + 2) = 0xBF80000000000000;
            uint64_t v80 = v79;
            if (v70 != v74)
            {
              do
              {
                long long v81 = *(_OWORD *)(v70 - 24);
                *((void *)v80 - 1) = *((void *)v70 - 1);
                *(_OWORD *)(v80 - 24) = v81;
                v80 -= 24;
                v70 -= 24;
              }
              while (v70 != v74);
              uint64_t v74 = (char *)v89;
            }
            double v70 = v79 + 24;
            uint64_t v89 = v80;
            uint64_t v90 = v79 + 24;
            id v91 = &v78[24 * v77];
            if (v74) {
              operator delete(v74);
            }
          }
          else
          {
            *(_OWORD *)double v70 = v73;
            *((void *)v70 + 2) = 0xBF80000000000000;
            v70 += 24;
          }
          uint64_t v90 = v70;
          ++v69;
        }
        while (v69 != v68);
      }
      long long v82 = (uint64_t *)[*(id *)(a1 + 32) maskPaths];
      uint64_t v83 = v82;
      unint64_t v84 = v82[1];
      if (v84 >= v82[2])
      {
        uint64_t v85 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v82, (uint64_t)&v89);
      }
      else
      {
        std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v82, (uint64_t)&v89);
        uint64_t v85 = v84 + 24;
      }
      a2 = v66;
      v83[1] = v85;
      double v8 = v65;
      if (v89)
      {
        uint64_t v90 = (char *)v89;
        operator delete(v89);
      }
      double v9 = v67;
      if (__p)
      {
        unint64_t v93 = (float64x2_t *)__p;
        operator delete(__p);
      }
      uint64_t v7 = v62 + 1;
    }
    while (v62 + 1 < a2);
  }
}

- (BOOL)intersectsPointMasked:(CGPoint)a3
{
  return -[PKStroke intersectsPointMasked:boundsOutset:minimumStrokeThreshold:](self, "intersectsPointMasked:boundsOutset:minimumStrokeThreshold:", a3.x, a3.y, 10.0, 0.0);
}

- (BOOL)intersectsPointMasked:(CGPoint)a3 boundsOutset:(double)a4 minimumStrokeThreshold:(double)a5
{
  [(PKStroke *)self _bounds];
  CGRect v48 = CGRectInset(v47, -a4, -a4);
  v46.CGFloat y = v15;
  v46.CGFloat x = v16;
  if (CGRectContainsPoint(v48, v46))
  {
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    uint64_t v44 = 0;
    uint64_t v45 = 0;
    uint64_t v43 = 0;
    long long v33 = 0u;
    long long v34 = 0u;
    double v21 = &off_1F1FB03A8;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long __p = 0u;
    uint64_t v26 = 0;
    v27[0] = v27;
    v27[1] = v27;
    v27[2] = 0;
    char v28 = 0;
    char v35 = 0;
    char v29 = 0;
    char v30 = 0;
    __int16 v39 = 0;
    uint64_t v31 = 0;
    id v32 = off_1F1FB03F0;
    memset(&v20, 0, sizeof(v20));
    [(PKStroke *)self _transform];
    CGAffineTransformInvert(&v20, &v19);
    int32x2_t v7 = vmovn_s64(vcvtq_s64_f64(vmulq_f64(vaddq_f64(*(float64x2_t *)&v20.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v20.c, v15), *(float64x2_t *)&v20.a, v16)), (float64x2_t)vdupq_n_s64(0x4059000000000000uLL))));
    *(void *)&long long v8 = v7.i32[0];
    *((void *)&v8 + 1) = v7.i32[1];
    long long v17 = v8;
    unint64_t v18 = 0xBF80000000000000;
    double v9 = [(PKStroke *)self _strokeMask];
    uint64_t v10 = (uint64_t *)[v9 maskPaths];

    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    if (*v10 == v12)
    {
      char v13 = 0;
    }
    else
    {
      char v13 = 0;
      do
      {
        v13 ^= ClipperLib::PointInPolygon(&v17, v11) != 0;
        v11 += 24;
      }
      while (v11 != v12);
    }
    std::__list_imp<long long>::clear(v27);
    if ((void)__p)
    {
      *((void *)&__p + 1) = __p;
      operator delete((void *)__p);
    }
    if (*((void *)&v23 + 1))
    {
      *(void *)&long long v24 = *((void *)&v23 + 1);
      operator delete(*((void **)&v23 + 1));
    }
    if ((void)v22)
    {
      *((void *)&v22 + 1) = v22;
      operator delete((void *)v22);
    }
    ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v32);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

- (BOOL)intersectsLineFromMasked:(CGPoint)a3 to:(CGPoint)a4 minThreshold:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  [(PKStroke *)self _bounds];
  CGRect v99 = CGRectInset(v98, -a5, -a5);
  CGFloat v11 = v99.origin.x;
  CGFloat v12 = v99.origin.y;
  CGFloat width = v99.size.width;
  CGFloat height = v99.size.height;
  v97.double x = v9;
  v97.double y = v8;
  if (!CGRectContainsPoint(v99, v97) && !DKDLineIntersectsRect(x, y, v9, v8, v11, v12, width, height)) {
    goto LABEL_57;
  }
  double v15 = (y - v8) * (y - v8) + (x - v9) * (x - v9);
  memset(&v95, 0, sizeof(v95));
  [(PKStroke *)self _transform];
  CGAffineTransformInvert(&v95, &v94);
  double c = v95.c;
  tdouble x = v95.tx;
  double v18 = v95.tx + v8 * v95.c + v95.a * v9;
  double v19 = v95.ty + v8 * v95.d + v95.b * v9;
  if (v15 > 1.0)
  {
    tdouble y = v95.ty;
    double b = v95.b;
    double d = v95.d;
    double a = v95.a;
    long long __p = 0;
    BOOL v92 = 0;
    unint64_t v93 = 0;
    std::vector<ClipperLib::IntPoint>::reserve(&__p, 2uLL);
    uint64_t v22 = (int)(v18 * 100.0);
    uint64_t v23 = (int)(v19 * 100.0);
    unint64_t v25 = v92;
    long long v24 = (char *)v93;
    if ((unint64_t)v92 >= v93)
    {
      id v32 = (char *)__p;
      unint64_t v33 = 0xAAAAAAAAAAAAAAABLL * ((v92 - (unsigned char *)__p) >> 3);
      unint64_t v34 = v33 + 1;
      if (v33 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * ((uint64_t)(v93 - (void)__p) >> 3) > v34) {
        unint64_t v34 = 0x5555555555555556 * ((uint64_t)(v93 - (void)__p) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v93 - (void)__p) >> 3) >= 0x555555555555555) {
        unint64_t v35 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v35 = v34;
      }
      if (v35)
      {
        uint64_t v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v93, v35);
        id v32 = (char *)__p;
        unint64_t v25 = v92;
      }
      else
      {
        uint64_t v36 = 0;
      }
      uint64_t v37 = &v36[24 * v33];
      long long v24 = &v36[24 * v35];
      *(void *)uint64_t v37 = v22;
      *((void *)v37 + 1) = v23;
      *((void *)v37 + 2) = 0xBF80000000000000;
      uint64_t v26 = v37 + 24;
      if (v25 != v32)
      {
        do
        {
          long long v38 = *(_OWORD *)(v25 - 24);
          *((void *)v37 - 1) = *((void *)v25 - 1);
          *(_OWORD *)(v37 - 24) = v38;
          v37 -= 24;
          v25 -= 24;
        }
        while (v25 != v32);
        id v32 = (char *)__p;
      }
      long long __p = v37;
      BOOL v92 = v26;
      unint64_t v93 = (unint64_t)v24;
      if (v32)
      {
        operator delete(v32);
        long long v24 = (char *)v93;
      }
    }
    else
    {
      *(void *)BOOL v92 = v22;
      *((void *)v25 + 1) = v23;
      *((void *)v25 + 2) = 0xBF80000000000000;
      uint64_t v26 = v25 + 24;
    }
    BOOL v92 = v26;
    uint64_t v39 = (int)((tx + y * c + a * x) * 100.0);
    uint64_t v40 = (int)((ty + y * d + b * x) * 100.0);
    if (v26 >= v24)
    {
      uint64_t v42 = (char *)__p;
      unint64_t v43 = 0xAAAAAAAAAAAAAAABLL * ((v26 - (unsigned char *)__p) >> 3);
      unint64_t v44 = v43 + 1;
      if (v43 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v45 = 0xAAAAAAAAAAAAAAABLL * ((v24 - (unsigned char *)__p) >> 3);
      if (2 * v45 > v44) {
        unint64_t v44 = 2 * v45;
      }
      if (v45 >= 0x555555555555555) {
        unint64_t v46 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v46 = v44;
      }
      if (v46)
      {
        CGRect v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v93, v46);
        uint64_t v42 = (char *)__p;
        uint64_t v26 = v92;
      }
      else
      {
        CGRect v47 = 0;
      }
      CGRect v48 = &v47[24 * v43];
      unint64_t v49 = &v47[24 * v46];
      *(void *)CGRect v48 = v39;
      *((void *)v48 + 1) = v40;
      *((void *)v48 + 2) = 0xBF80000000000000;
      uint64_t v41 = v48 + 24;
      if (v26 != v42)
      {
        do
        {
          long long v50 = *(_OWORD *)(v26 - 24);
          *((void *)v48 - 1) = *((void *)v26 - 1);
          *(_OWORD *)(v48 - 24) = v50;
          v48 -= 24;
          v26 -= 24;
        }
        while (v26 != v42);
        uint64_t v42 = (char *)__p;
      }
      long long __p = v48;
      BOOL v92 = v41;
      unint64_t v93 = (unint64_t)v49;
      if (v42) {
        operator delete(v42);
      }
    }
    else
    {
      *(void *)uint64_t v26 = v39;
      *((void *)v26 + 1) = v40;
      *((void *)v26 + 2) = 0xBF80000000000000;
      uint64_t v41 = v26 + 24;
    }
    BOOL v92 = v41;
    uint64_t v51 = *((void *)__p + 1);
    if (v51 == *((void *)__p + 4)) {
      *((void *)__p + 1) = v51 + 1;
    }
    uint64_t v81 = 0;
    uint64_t v82 = 0;
    uint64_t v83 = 0;
    uint64_t v85 = 0;
    uint64_t v86 = 0;
    uint64_t v87 = 0;
    uint64_t v89 = 0;
    uint64_t v90 = 0;
    uint64_t v88 = 0;
    long long v78 = 0u;
    long long v79 = 0u;
    uint64_t v66 = &off_1F1FB03A8;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    uint64_t v71 = 0;
    v72[0] = v72;
    v72[1] = v72;
    v72[2] = 0;
    char v73 = 0;
    char v80 = 0;
    char v74 = 0;
    char v75 = 0;
    __int16 v84 = 0;
    uint64_t v76 = 0;
    unint64_t v77 = off_1F1FB03F0;
    uint64_t v52 = (uint64_t)*(v66 - 3);
    unint64_t v53 = [(PKStroke *)self _strokeMask];
    ClipperLib::ClipperBase::AddPaths((uint64_t)&v66 + v52, (uint64_t *)[v53 maskPaths], 1, 1);

    memset(v65, 0, 29);
    long long v64 = 0u;
    long long v63 = 0u;
    uint64_t v62 = &unk_1F1FB0448;
    memset(&v65[5], 0, 24);
    memset(v61, 0, sizeof(v61));
    ClipperLib::Clipper::Execute((uint64_t)&v66, 2, &v62, 0, 0);
    if (v65[0] - *((void *)&v64 + 1) == 8
      && (v54 = *(void **)(**((void **)&v64 + 1) + 8),
          *(void *)(**((void **)&v64 + 1) + 16) - (void)v54 == 48))
    {
      uint64_t v55 = v54[1];
      uint64_t v56 = *((void *)__p + 1);
      if (*v54 == *(void *)__p && v55 == v56
        || (char v57 = 0, v54[3] == *(void *)__p)
        && v54[4] == v56
        && (char v57 = 0, *v54 == *((void *)__p + 3))
        && v55 == *((void *)__p + 4))
      {
        char v57 = 1;
      }
    }
    else
    {
      char v57 = 0;
    }
    float64x2_t v96 = (void **)v61;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v96);
    ClipperLib::PolyTree::~PolyTree((ClipperLib::PolyTree *)&v62);
    std::__list_imp<long long>::clear(v72);
    if ((void)v70)
    {
      *((void *)&v70 + 1) = v70;
      operator delete((void *)v70);
    }
    if (*((void *)&v68 + 1))
    {
      *(void *)&long long v69 = *((void *)&v68 + 1);
      operator delete(*((void **)&v68 + 1));
    }
    if ((void)v67)
    {
      *((void *)&v67 + 1) = v67;
      operator delete((void *)v67);
    }
    ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v77);
    if (__p)
    {
      BOOL v92 = (char *)__p;
      operator delete(__p);
    }
    if ((v57 & 1) == 0)
    {
      char v31 = 1;
      return v31 & 1;
    }
    goto LABEL_57;
  }
  uint64_t v66 = (uint64_t (**)(ClipperLib::Clipper *__hidden))(int)(v18 * 100.0);
  *(void *)&long long v67 = (int)(v19 * 100.0);
  *((void *)&v67 + 1) = 0xBF80000000000000;
  char v27 = [(PKStroke *)self _strokeMask];
  char v28 = (uint64_t *)[v27 maskPaths];

  uint64_t v29 = *v28;
  uint64_t v30 = v28[1];
  if (v29 == v30)
  {
LABEL_57:
    char v31 = 0;
    return v31 & 1;
  }
  char v31 = 0;
  do
  {
    v31 ^= ClipperLib::PointInPolygon(&v66, v29) != 0;
    v29 += 24;
  }
  while (v29 != v30);
  return v31 & 1;
}

- (BOOL)intersectsClosedStrokeMasked:(id)a3
{
  id v4 = a3;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  uint64_t v50 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v26 = &off_1F1FB03A8;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v31 = 0;
  v32[0] = v32;
  v32[1] = v32;
  v32[2] = 0;
  char v33 = 0;
  char v40 = 0;
  char v34 = 0;
  char v35 = 0;
  __int16 v44 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = off_1F1FB03F0;
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x4812000000;
  CGAffineTransform v20 = __Block_byref_object_copy__15;
  double v21 = __Block_byref_object_dispose__16;
  uint64_t v22 = "";
  long long v24 = 0;
  uint64_t v25 = 0;
  long long __p = 0;
  std::vector<ClipperLib::IntPoint>::reserve(&__p, [v4 _pointsCount]);
  memset(&v16, 0, sizeof(v16));
  [(PKStroke *)self _transform];
  CGAffineTransformInvert(&v16, &v15);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  CGAffineTransform v14 = v16;
  v13[2] = __50__PKStroke_Slicing__intersectsClosedStrokeMasked___block_invoke;
  v13[3] = &unk_1E64C89E0;
  v13[4] = &v17;
  [v4 interpolatePointDataWithStep:v13 usingBlock:1.0];
  ClipperLib::ClipperBase::AddPath((uint64_t)&v26 + (void)*(v26 - 3), (uint64_t)(v18 + 6), 0, 1);
  uint64_t v5 = (uint64_t)*(v26 - 3);
  uint64_t v6 = [(PKStroke *)self _strokeMask];
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v26 + v5, (uint64_t *)[v6 maskPaths], 1, 1);

  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  ClipperLib::Clipper::Execute((uint64_t)&v26, 0, &v10, 0, 0);
  uint64_t v8 = v10;
  uint64_t v7 = v11;
  uint64_t v51 = (void **)&v10;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v51);
  _Block_object_dispose(&v17, 8);
  if (__p)
  {
    long long v24 = __p;
    operator delete(__p);
  }
  std::__list_imp<long long>::clear(v32);
  if ((void)v30)
  {
    *((void *)&v30 + 1) = v30;
    operator delete((void *)v30);
  }
  if (*((void *)&v28 + 1))
  {
    *(void *)&long long v29 = *((void *)&v28 + 1);
    operator delete(*((void **)&v28 + 1));
  }
  if ((void)v27)
  {
    *((void *)&v27 + 1) = v27;
    operator delete((void *)v27);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v37);

  return v7 != v8;
}

void __50__PKStroke_Slicing__intersectsClosedStrokeMasked___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  int32x2_t v5 = vmovn_s64(vcvtq_s64_f64(vmulq_f64(vaddq_f64(*(float64x2_t *)(a1 + 72), vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 56), a3), *(float64x2_t *)(a1 + 40), a2)), (float64x2_t)vdupq_n_s64(0x4059000000000000uLL))));
  *(void *)&long long v6 = v5.i32[0];
  *((void *)&v6 + 1) = v5.i32[1];
  long long v7 = v6;
  float v8 = a4;
  double v9 = (char *)v4[7];
  unint64_t v10 = v4[8];
  if ((unint64_t)v9 >= v10)
  {
    uint64_t v12 = (char *)v4[6];
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v12) >> 3);
    unint64_t v14 = v13 + 1;
    if (v13 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - (void)v12) >> 3);
    if (2 * v15 > v14) {
      unint64_t v14 = 2 * v15;
    }
    if (v15 >= 0x555555555555555) {
      unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16)
    {
      long long v22 = v7;
      uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)(v4 + 8), v16);
      long long v7 = v22;
      double v18 = v17;
      uint64_t v12 = (char *)v4[6];
      double v9 = (char *)v4[7];
    }
    else
    {
      double v18 = 0;
    }
    uint64_t v19 = &v18[24 * v13];
    CGAffineTransform v20 = &v18[24 * v16];
    *(_OWORD *)uint64_t v19 = v7;
    *((float *)v19 + 4) = v8;
    *((_DWORD *)v19 + 5) = -1082130432;
    uint64_t v11 = v19 + 24;
    if (v9 != v12)
    {
      do
      {
        long long v21 = *(_OWORD *)(v9 - 24);
        *((void *)v19 - 1) = *((void *)v9 - 1);
        *(_OWORD *)(v19 - 24) = v21;
        v19 -= 24;
        v9 -= 24;
      }
      while (v9 != v12);
      uint64_t v12 = (char *)v4[6];
    }
    v4[6] = v19;
    v4[7] = v11;
    v4[8] = v20;
    if (v12) {
      operator delete(v12);
    }
  }
  else
  {
    *(_OWORD *)double v9 = v7;
    *((float *)v9 + 4) = v8;
    *((_DWORD *)v9 + 5) = -1082130432;
    uint64_t v11 = v9 + 24;
  }
  v4[7] = v11;
}

- (BOOL)intersectsRectMasked:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  uint64_t v47 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v24 = 0;
  uint64_t v25 = &off_1F1FB03A8;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v30 = 0;
  v31[0] = v31;
  v31[1] = v31;
  v31[2] = 0;
  char v32 = 0;
  char v39 = 0;
  char v33 = 0;
  char v34 = 0;
  __int16 v43 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = off_1F1FB03F0;
  long long v22 = 0;
  uint64_t v23 = 0;
  std::vector<ClipperLib::IntPoint>::reserve(&v22, 4uLL);
  memset(&v21, 0, sizeof(v21));
  [(PKStroke *)self _transform];
  CGAffineTransformInvert(&v21, &v20);
  long long __p = 0;
  double v18 = 0;
  uint64_t v19 = 0;
  v16[0] = *(float64x2_t *)&v21.a;
  v16[1] = *(float64x2_t *)&v21.c;
  void v16[2] = *(float64x2_t *)&v21.tx;
  generateRectClipperPath(v16, (uint64_t)&__p, x, y, width, height);
  ClipperLib::ClipperBase::AddPath((uint64_t)&v25 + (void)*(v25 - 3), (uint64_t)&v22, 0, 1);
  uint64_t v8 = (uint64_t)*(v25 - 3);
  double v9 = [(PKStroke *)self _strokeMask];
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v25 + v8, (uint64_t *)[v9 maskPaths], 1, 1);

  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  ClipperLib::Clipper::Execute((uint64_t)&v25, 0, &v13, 0, 0);
  uint64_t v11 = v13;
  uint64_t v10 = v14;
  uint64_t v50 = (void **)&v13;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v50);
  if (__p)
  {
    double v18 = __p;
    operator delete(__p);
  }
  if (v22)
  {
    uint64_t v23 = v22;
    operator delete(v22);
  }
  std::__list_imp<long long>::clear(v31);
  if ((void)v29)
  {
    *((void *)&v29 + 1) = v29;
    operator delete((void *)v29);
  }
  if (*((void *)&v27 + 1))
  {
    *(void *)&long long v28 = *((void *)&v27 + 1);
    operator delete(*((void **)&v27 + 1));
  }
  if ((void)v26)
  {
    *((void *)&v26 + 1) = v26;
    operator delete((void *)v26);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v36);
  return v10 != v11;
}

+ (PKCompressedStrokePoint)_compressStrokePoint:(SEL)a3 withTimestamp:(_PKStrokePoint *)a4
{
  long long v5 = *(_OWORD *)&a4->force;
  long long v9 = *(_OWORD *)&a4->aspectRatio;
  long long v10 = v5;
  long long v11 = *(_OWORD *)&a4->altitude;
  double radius2 = a4->radius2;
  long long v6 = *(_OWORD *)&a4->location.y;
  *(_OWORD *)&v8.var0.var0 = *(_OWORD *)&a4->timestamp;
  *(_OWORD *)&v8.var3 = v6;
  PKCompressStrokePoint(&v8, a5, (float32x2_t *)retstr);
  return result;
}

+ (_PKStrokePoint)_decompressStrokePoint:(SEL)a3 withTimestamp:(PKCompressedStrokePoint *)a4
{
  long long v5 = *(_OWORD *)&a4->var3;
  *(_OWORD *)&v7.var0.var0 = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&v7.var3 = v5;
  PKDecompressStrokePoint(&v7, a5, (uint64_t)retstr);
  return result;
}

@end