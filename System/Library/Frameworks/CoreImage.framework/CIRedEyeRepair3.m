@interface CIRedEyeRepair3
+ ($807B2EF8CC2A3BA0CBD71F9CA1C0D669)settingsWithOptions:(SEL)a3;
+ ($A3B2E143E1A03423F9FC703C010436DC)bitmapRectWithImageSubRectangle:(CGRect)a3 settings:(id *)a4;
+ (CGRect)supportRectangleWithFaceArray:(id)a3 options:(id)a4;
+ (CGRect)supportRectangleWithRepair:(id)a3 imageSize:(CGSize)a4;
+ (float)yawAngleWithFaceDictionary:(id)a3;
+ (int)bitmapRect:(id *)a3 point:(CGPoint *)a4 polygon:(CGPoint)a5[8] andDistMatrix:(float)a6[4] forEye:(int)a7 inFaceDictionary:(id)a8 settings:(id *)a9;
+ (int)faceContext:(id *)a3 withFaceArray:(id)a4 index:(int)a5 settings:(id *)a6;
+ (void)insertIntoConnectionHopper:(id *)a3 index1:(int)a4 drop1:(int)a5 index2:(int)a6 drop2:(int)a7 score:(float)a8;
+ (void)insertIntoThreadHopper:(id *)a3 index:(int)a4 recChannel:(float)a5 hue:(float)a6 saturation:(float)a7 luminance:(float)a8 shapeMetricTotal:(float)a9 xPosition:(float)a10;
- ($000CCD7ED2ADA2E18343834BA3C2DAF0)focusStatsWithBitmap:(id *)a3 IOD:(float)a4;
- ($07A02DD24AF34610473D9D0940B06C4B)repairMap;
- ($A3B2E143E1A03423F9FC703C010436DC)bitmapRectWithDictionaryRectArray:(id)a3;
- ($A3B2E143E1A03423F9FC703C010436DC)globalBitmapRectWithDictionaryRectArray:(id)a3;
- ($A3B2E143E1A03423F9FC703C010436DC)repairRect;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)RGBtoHSV:(id)a3;
- (BOOL)edgePoint:(CGPoint *)a3 withBitmap:(id *)a4 center:(CGPoint)a5 perp:(CGPoint)a6;
- (BOOL)gatherFaceStatistics:(id *)a3;
- (BOOL)hopperElement:(id *)a3 isMoreScleraThanElement:(id *)a4;
- (BOOL)initGridWithBitmap:(id *)a3 scale:(int)a4;
- (BOOL)isBlurryWithFocusStats:(id)a3;
- (BOOL)isConvex:(id *)a3;
- (BOOL)openRepairDictionary:(id)a3 convexHull:(id *)a4 facts:(id *)a5;
- (BOOL)trimConcaveFromHull:(id *)a3;
- (BOOL)trimEndPointFromHull:(id *)a3;
- (BOOL)trimStartPointFromHull:(id *)a3;
- (BOOL)unpackToGlobalRepairDictionary:(id)a3 convexHull:(id *)a4 facts:(id *)a5;
- (CGAffineTransform)inverseImageTransformForOrientation:(SEL)a3;
- (CGPoint)bitmapPointWithDictionaryPoint:(CGPoint)a3;
- (CGPoint)bitmapPointWithDictionaryPointArray:(id)a3;
- (CGPoint)centroidWithConvexHull:(id *)a3;
- (CGPoint)dictionaryPointWithBitmapPoint:(CGPoint)a3;
- (CGPoint)dictionaryPointWithGlobalBitmapPoint:(CGPoint)a3;
- (CGPoint)globalBitmapPointWithDictionaryPoint:(CGPoint)a3;
- (CGPoint)globalBitmapPointWithDictionaryPointArray:(id)a3;
- (CGPoint)leftHandedTransform:(CGAffineTransform *)a3 ofPoint:(CGPoint)a4;
- (CGPoint)threadCentroid:(id *)a3;
- (CIRedEyeRepair3)initWithExternalBuffer:(char *)a3 subRectangle:(CGRect)a4 rowBytes:(unint64_t)a5 options:(id)a6;
- (double)next12BitRandom;
- (float)threadSignedArea:(id *)a3 centroid:(CGPoint)a4;
- (id)dictionaryPointArrayWithBitmapPoint:(CGPoint)a3;
- (id)dictionaryPointArrayWithEyeBitmapPoint:(CGPoint)a3;
- (id)dictionaryPointArrayWithGlobalBitmapPoint:(CGPoint)a3;
- (id)dictionaryRectArrayWithBitmapRect:(id)a3;
- (id)dictionaryRectArrayWithGlobalBitmapRect:(id)a3;
- (id)mutableCopyOfArray:(id)a3;
- (id)repairArray;
- (id)repairWithSide:(int)a3;
- (id)stringWithRER3Error:(int)a3;
- (int)addPoint:(CGPoint)a3 toHull:(id *)a4;
- (int)addPoint:(CGPoint)a3 toShapePoints:(id *)a4;
- (int)analyzeMask:(id *)a3 usingConvexHull:(id *)a4 producingOptimizedMask:(id *)a5;
- (int)attemptClosureOfThreadIndex:(int)a3;
- (int)closeThreadIndex:(int)a3 usingVectorField:(id *)a4;
- (int)color:(id *)a3 underConvexHull:(id *)a4 saturated:(id *)a5;
- (int)connectThreads:(int)a3 drop1:(int)a4 and:(int)a5 drop2:(int)a6;
- (int)connectThreadsInGrid;
- (int)convexHull:(id *)a3 ofOriented:(BOOL)a4 shape:(id *)a5;
- (int)convexHull:(id *)a3 ofOriented:(BOOL)a4 threadIndex:(int)a5;
- (int)copyGridInto:(id *)a3 transform:(CGAffineTransform *)a4 height:(int)a5;
- (int)copyShape:(id *)a3 into:(id *)a4 transform:(CGAffineTransform *)a5 height:(int)a6;
- (int)executeRepairWithRepairDictionary:(id)a3;
- (int)findThreadsInGrid;
- (int)gatherThreadInfo:(id *)a3;
- (int)improvedShape:(id *)a3 withShape:(id *)a4;
- (int)initHull:(id *)a3 withOrientation:(BOOL)a4;
- (int)initShapePoints:(id *)a3 withMaxPoints:(int)a4;
- (int)insertPoint:(CGPoint)a3 andDirection:(CGPoint)a4 intoGrid:(BOOL)a5;
- (int)linkUpPointIndex:(int)a3 toPointIndex:(int)a4;
- (int)lookForPoint:(CGPoint *)a3 onLine:(id)a4 nearestPoint:(CGPoint)a5;
- (int)newShape:(id *)a3;
- (int)newShape:(id *)a3 byInterpolatingBetweenCheckpoints:(id)a4[100] nc:(int)a5 usingVectorField:(id *)a6;
- (int)newThread:(id *)a3;
- (int)nextPointIndexWithPointIndex:(int)a3;
- (int)packGlobalRepairDictionary:(id *)a3 withConvexHull:(id *)a4 facts:(id *)a5;
- (int)prepareBitmapsWithString:(char *)a3;
- (int)prepareMasksWithConvexHull:(id *)a3;
- (int)prepareTransformWithEyeIndex:(int)a3;
- (int)prominenceConvexHull:(id *)a3 facts:(id *)a4;
- (int)recognizeThreadsWinningThreadIndex:(int *)a3 info:(id *)a4;
- (int)renderConvexHull:(id *)a3 distance:(float)a4 fieldToBitmap:(id *)a5;
- (int)renderEyePolygonToBitmap:(id *)a3;
- (int)renderHull:(id *)a3 toBitmap:(id *)a4;
- (int)repairDictionary:(id *)a3 withEyeIndex:(int)a4;
- (int)replacePointAndDirection:(int)a3;
- (int)saveRepairDictionary:(id *)a3 withConvexHull:(id *)a4 facts:(id *)a5;
- (int)shape:(id *)a3 withThreadAtIndex:(int)a4 centroid:(CGPoint)a5;
- (int)transformRepairArray:(CGAffineTransform *)a3;
- (int)updateWithFaceIndex:(int)a3;
- (int)updatedCheckpoint:(CGPoint *)a3 withCheckpoint:(CGPoint)a4 checkpointIndex:(int)a5 angle:(float)a6 width:(int)a7 height:(int)a8 inChannel:(id *)a9 threadIndex:(int)a10 returningEdgeWidth:(float *)a11;
- (int)widenedHull:(id *)a3 withHull:(id *)a4 by:(float)a5;
- (void)autoRepairWithFaceArray:(id)a3;
- (void)computeLengthsAnglesAndDeltaAnglesForShape:(id *)a3;
- (void)condenseFourChannelRecognitionMap:(id *)a3 intoOneChanneMap:(id *)a4;
- (void)dealloc;
- (void)executeRepair:(id)a3;
- (void)forAllGridPointsNear:(int)a3 withinRadius:(float)a4 do:(void *)a5 context:(void *)a6;
- (void)forAllGridThreadsNear:(CGPoint)a3 withinRadius:(float)a4 do:(void *)a5 context:(void *)a6;
- (void)initBitmaps;
- (void)magnitudeMap:(id *)a3 fromGabor:(id *)a4;
- (void)measureHull:(id *)a3 majorAxis:(CGPoint *)a4 majorTo:(CGPoint *)a5 majorDiameter:(float *)a6 minorAxis:(CGPoint *)a7 minorTo:(CGPoint *)a8 minorDiameter:(float *)a9;
- (void)point:(CGPoint)a3 toGridRow:(int *)a4 column:(int *)a5;
- (void)printConnectionHopper:(id *)a3 message:(char *)a4;
- (void)printFaceArray;
- (void)printThreadWithIndex:(int)a3;
- (void)printThreadsOnlyClosed:(BOOL)a3 message:(char *)a4;
- (void)putThreadAtIndex:(int)a3;
- (void)regressionWithPointIndex:(int)a3;
- (void)removeRedundantPointsFromShape:(id *)a3 closerThan:(float)a4;
- (void)removeSmallBumpsFromShape:(id *)a3 center:(CGPoint)a4 threshold:(float)a5;
- (void)removeSpikesFromShape:(id *)a3;
- (void)removeThreadAtIndex:(int)a3;
- (void)repairExternalBuffer;
- (void)setInspector:(id)a3;
- (void)slidingWindowAnalysisOfShape:(id *)a3 into:(id *)a4;
- (void)start12BitRandom:(int)a3;
- (void)swapHopperElement:(id *)a3 withElement:(id *)a4;
- (void)termBitmaps;
- (void)termGrid;
- (void)termHull:(id *)a3;
- (void)termShapePoints:(id *)a3;
- (void)transformConvexHull:(id *)a3 withTransform:(CGAffineTransform *)a4;
- (void)transformGlobalsWithTransform:(CGAffineTransform *)a3;
@end

@implementation CIRedEyeRepair3

- (void)setInspector:(id)a3
{
  self->inspector = (RedEyeInspector3 *)a3;
}

+ ($A3B2E143E1A03423F9FC703C010436DC)bitmapRectWithImageSubRectangle:(CGRect)a3 settings:(id *)a4
{
  float width = a3.size.width;
  uint64_t v5 = (uint64_t)rintf(width);
  float height = a3.size.height;
  float x = a3.origin.x;
  uint64_t v8 = (uint64_t)rintf(x);
  float y = a3.origin.y;
  uint64_t v10 = (uint64_t)rintf(y);
  unint64_t BitmapRect = makeBitmapRect(v8, (int)(float)(a4->var4 - (float)(int)(v10 + (uint64_t)rintf(height))), (v8 + v5), (int)(float)(a4->var4 - (float)(int)v10));
  result.var2 = v12;
  result.var3 = HIDWORD(v12);
  result.var0 = BitmapRect;
  result.var1 = HIDWORD(BitmapRect);
  return result;
}

+ (float)yawAngleWithFaceDictionary:(id)a3
{
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyeX"), "floatValue");
  float v5 = v4;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyeY"), "floatValue");
  float v7 = v6;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyeX"), "floatValue");
  float v9 = v8;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyeY"), "floatValue");
  float v11 = v10;
  float v12 = (float)(v5 + v9) * 0.5;
  float v13 = (float)(v7 + v10) * 0.5;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"mouthCenterX"), "floatValue");
  float v15 = v14;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"mouthCenterY"), "floatValue");
  float v17 = v16;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"noseTipX"), "floatValue");
  float v19 = v18;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"noseTipY"), "floatValue");
  float v20 = 1.0 / sqrtf((float)((float)(v17 - v13) * (float)(v17 - v13)) + (float)((float)(v15 - v12) * (float)(v15 - v12)));
  float v22 = (float)((float)((float)(v21 - v17) * (float)-(float)((float)(v15 - v12) * v20))
              + (float)((float)(v19 - v15) * (float)((float)(v17 - v13) * v20)))
      / (float)((float)((float)(v11 - v17) * (float)-(float)((float)(v15 - v12) * v20))
              + (float)((float)(v9 - v15) * (float)((float)(v17 - v13) * v20)));
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyeLeftX"), "floatValue");
  float v24 = v23;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyeLeftY"), "floatValue");
  float v26 = v25;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyeRightX"), "floatValue");
  float v28 = v27;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyeRightY"), "floatValue");
  float v30 = v29;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyeLeftX"), "floatValue");
  float v32 = v31;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyeLeftY"), "floatValue");
  float v34 = v33;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyeRightX"), "floatValue");
  float v36 = v35;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyeRightY"), "floatValue");
  float v38 = atan((1.0- (float)(sqrtf((float)((float)(v37 - v34) * (float)(v37 - v34)) + (float)((float)(v36 - v32)* (float)(v36 - v32)))/ sqrtf((float)((float)(v30 - v26) * (float)(v30 - v26)) + (float)((float)(v28 - v24)* (float)(v28 - v24)))))* 5.5)* 32.0;
  float v39 = sin(v22 * 1.3) * 45.0;
  return (float)((float)(v39 + v38) * 0.5) * 3.14159265 / 180.0;
}

+ (int)bitmapRect:(id *)a3 point:(CGPoint *)a4 polygon:(CGPoint)a5[8] andDistMatrix:(float)a6[4] forEye:(int)a7 inFaceDictionary:(id)a8 settings:(id *)a9
{
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", @"leftEyeX"), "floatValue");
  float v16 = v15;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", @"leftEyeY"), "floatValue");
  float v18 = v17;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", @"rightEyeX"), "floatValue");
  float v20 = v19;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", @"rightEyeY"), "floatValue");
  float v22 = v21 - v18;
  +[CIRedEyeRepair3 yawAngleWithFaceDictionary:a8];
  float v24 = sqrt((float)((float)(v22 * v22) + (float)((float)(v20 - v16) * (float)(v20 - v16)))) / cos(v23);
  if (v24 < 200.0) {
    a9->uint64_t var7 = 0;
  }
  a9->var24 = v24;
  if (a7)
  {
    if (a7 != 1) {
      return 53;
    }
    v96 = a3;
    v97 = a4;
    v116 = @"rightEyelidSWY";
    v118 = a9;
    v112 = @"rightEyelidLowerY";
    v114 = @"rightEyelidSWX";
    v108 = @"rightEyelidSEY";
    v110 = @"rightEyelidLowerX";
    v104 = @"rightEyeRightY";
    v106 = @"rightEyelidSEX";
    v100 = @"rightEyelidNEY";
    v102 = @"rightEyeRightX";
    v98 = @"rightEyelidNEX";
    float v25 = @"rightEyelidUpperY";
    float v26 = @"rightEyelidUpperX";
    float v27 = @"rightEyelidNWY";
    float v28 = @"rightEyelidNWX";
    float v29 = @"rightEyeLeftY";
    float v30 = @"rightEyeLeftX";
    float v31 = @"rightEyeY";
    float v32 = @"rightEyeX";
  }
  else
  {
    v96 = a3;
    v97 = a4;
    v116 = @"leftEyelidSWY";
    v118 = a9;
    v112 = @"leftEyelidLowerY";
    v114 = @"leftEyelidSWX";
    v108 = @"leftEyelidSEY";
    v110 = @"leftEyelidLowerX";
    v104 = @"leftEyeRightY";
    v106 = @"leftEyelidSEX";
    v100 = @"leftEyelidNEY";
    v102 = @"leftEyeRightX";
    v98 = @"leftEyelidNEX";
    float v25 = @"leftEyelidUpperY";
    float v26 = @"leftEyelidUpperX";
    float v27 = @"leftEyelidNWY";
    float v28 = @"leftEyelidNWX";
    float v29 = @"leftEyeLeftY";
    float v30 = @"leftEyeLeftX";
    float v31 = @"leftEyeY";
    float v32 = @"leftEyeX";
  }
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v32), "floatValue");
  float v93 = v33;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v31), "floatValue");
  float v92 = v34;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v30), "floatValue");
  float v36 = v35;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v29), "floatValue");
  float v38 = v37;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v28), "floatValue");
  float v95 = v39;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v27), "floatValue");
  float v94 = v40;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v26), "floatValue");
  float v119 = v41;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v25), "floatValue");
  float v43 = v42;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v98), "floatValue");
  float v99 = v44;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v100), "floatValue");
  float v101 = v45;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v102), "floatValue");
  float v47 = v46;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v104), "floatValue");
  float v49 = v48;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v106), "floatValue");
  float v107 = v50;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v108), "floatValue");
  float v109 = v51;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v110), "floatValue");
  float v53 = v52;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v112), "floatValue");
  float v55 = v54;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v114), "floatValue");
  float v105 = v56;
  objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", v116), "floatValue");
  float v103 = v57;
  float v115 = v47;
  float v58 = v47 - v36;
  float v113 = v49;
  float v59 = v49 - v38;
  float v60 = atan2((float)-v59, (float)(v47 - v36));
  float v61 = sqrtf((float)(v59 * v59) + (float)(v58 * v58));
  float v111 = v53;
  float v117 = v43;
  float v62 = vabds_f32((float)((float)((float)(v53 - v36) * v59) - (float)(v58 * (float)(v55 - v38))) / v61, (float)((float)((float)(v119 - v36) * v59) - (float)(v58 * (float)(v43 - v38))) / v61);
  float v63 = (float)(v61 * 0.5) / v62;
  __double2 v64 = __sincos_stret(v60);
  float sinval = v64.__sinval;
  float cosval = v64.__cosval;
  *a6 = cosval;
  a6[1] = -sinval;
  a6[2] = v63 * sinval;
  a6[3] = v63 * cosval;
  uint64_t var7 = v118->var7;
  if (var7 > 3) {
    return 17;
  }
  int result = 0;
  float v69 = flt_1939559C0[var7];
  float v70 = flt_1939559D0[var7];
  float v71 = v62 * 1.8;
  float v72 = v61 * 1.3;
  float v73 = 1.0 / fmaxf(v61, 0.00001);
  float v74 = -(float)(v58 * v73);
  v118->var23 = v69;
  double v75 = v72 * 0.5;
  double v76 = (float)(v58 * v73);
  double v77 = v93 - v75 * v76;
  double v78 = v71 * 0.5;
  double v79 = (float)(v59 * v73);
  double v80 = v77 - v78 * v79;
  double v81 = v92 - v75 * v79;
  double v82 = v74;
  double v83 = v81 - v78 * v82;
  *(double *)v84.i64 = v93 + v75 * v76;
  double v85 = *(double *)v84.i64 - v78 * v79;
  double v86 = v92 + v75 * v79;
  double v87 = v86 - v78 * v82;
  double v88 = v77 + v78 * v79;
  double v89 = v81 + v78 * v82;
  double v90 = *(double *)v84.i64 + v78 * v79;
  double v91 = v86 + v78 * v82;
  *(float *)&double v86 = v80;
  v84.f32[0] = v85;
  *(float *)&double v82 = v88;
  *(float *)&double v90 = v90;
  *(float *)&double v80 = fminf(*(float *)&v86, fminf(v84.f32[0], fminf(*(float *)&v82, *(float *)&v90)));
  *(float *)&double v86 = fmaxf(*(float *)&v86, fmaxf(v84.f32[0], fmaxf(*(float *)&v82, *(float *)&v90)));
  *(float *)&double v90 = v83;
  v84.f32[0] = v87;
  *(float *)&double v82 = v89;
  *(float *)&double v91 = v91;
  *(float *)&double v88 = fminf(*(float *)&v90, fminf(v84.f32[0], fminf(*(float *)&v82, *(float *)&v91)));
  *(float *)&double v91 = fmaxf(*(float *)&v90, fmaxf(v84.f32[0], fmaxf(*(float *)&v82, *(float *)&v91)));
  v84.f32[0] = floorf(*(float *)&v88 * v69);
  v84.i32[1] = ceilf(*(float *)&v91 * v69);
  v84.i64[1] = __PAIR64__(COERCE_UNSIGNED_INT(ceilf(*(float *)&v86 * v69)), COERCE_UNSIGNED_INT(floorf(*(float *)&v80 * v69)));
  *(int32x4_t *)v96 = vcvtq_s32_f32(vrndxq_f32(vmulq_n_f32(v84, v70)));
  v97->float x = v93;
  v97->float y = v92;
  a5->float x = v36;
  a5->float y = v38;
  a5[1].float x = v95;
  a5[1].float y = v94;
  a5[2].float x = v119;
  a5[2].float y = v117;
  a5[3].float x = v99;
  a5[3].float y = v101;
  a5[4].float x = v115;
  a5[4].float y = v113;
  a5[5].float x = v107;
  a5[5].float y = v109;
  a5[6].float x = v111;
  a5[6].float y = v55;
  a5[7].float x = v105;
  a5[7].float y = v103;
  return result;
}

+ (int)faceContext:(id *)a3 withFaceArray:(id)a4 index:(int)a5 settings:(id *)a6
{
  memset(__src, 0, 376);
  uint64_t v8 = [a4 objectAtIndexedSubscript:a5];
  int result = +[CIRedEyeRepair3 bitmapRect:&__src[3] point:&__src[1] polygon:&__src[7] andDistMatrix:&__src[5] forEye:0 inFaceDictionary:v8 settings:a6];
  if (!result)
  {
    int result = +[CIRedEyeRepair3 bitmapRect:&__src[4] point:&__src[2] polygon:&__src[15] andDistMatrix:&__src[6] forEye:1 inFaceDictionary:v8 settings:a6];
    if (!result)
    {
      uint64_t v10 = unionBitmapRects(__src[3].i64[0], __src[3].i64[1], __src[4].i64[0]);
      uint64_t v11 = 0;
      v13.i64[0] = __PAIR64__(v12, v10);
      __src[0].i64[0] = v10;
      __src[0].i64[1] = v12;
      int32x4_t v14 = vzip1q_s32(v13, v13);
      v15.f64[0] = (double)(int)v12;
      *(double *)__src[1].i64 = *(double *)__src[1].i64 - (double)(int)v12;
      *(double *)&__src[1].i64[1] = *(double *)&__src[1].i64[1] - (double)(int)v10;
      *(double *)__src[2].i64 = *(double *)__src[2].i64 - (double)(int)v12;
      *(double *)&__src[2].i64[1] = *(double *)&__src[2].i64[1] - (double)(int)v10;
      __src[3] = vsubq_s32(__src[3], v14);
      __src[4] = vsubq_s32(__src[4], v14);
      v15.f64[1] = (double)(int)v10;
      do
      {
        float v16 = &__src[v11];
        float64x2_t v17 = vsubq_f64((float64x2_t)__src[v11 + 8], v15);
        v16[7] = (int32x4_t)vsubq_f64((float64x2_t)__src[v11 + 7], v15);
        v16[8] = (int32x4_t)v17;
        float64x2_t v18 = vsubq_f64((float64x2_t)__src[v11 + 16], v15);
        v16[15] = (int32x4_t)vsubq_f64((float64x2_t)__src[v11 + 15], v15);
        v16[16] = (int32x4_t)v18;
        v11 += 2;
      }
      while (v11 != 8);
      memcpy(a3, __src, sizeof($D2F1EEE81460CAADED5780BC7E7DFC63));
      return 0;
    }
  }
  return result;
}

+ ($807B2EF8CC2A3BA0CBD71F9CA1C0D669)settingsWithOptions:(SEL)a3
{
  *(void *)&retstr->var26 = 0;
  *(_OWORD *)&retstr->var25.c = 0u;
  *(_OWORD *)&retstr->var25.tfloat x = 0u;
  *(_OWORD *)&retstr->var21 = 0u;
  *(_OWORD *)&retstr->var25.a = 0u;
  *(_OWORD *)&retstr->var18.origin.float y = 0u;
  *(_OWORD *)&retstr->var18.size.float height = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  float v6 = (void *)[a4 objectForKeyedSubscript:@"downsampleType"];
  if (v6) {
    int v7 = [v6 intValue];
  }
  else {
    int v7 = 1;
  }
  retstr->uint64_t var7 = v7;
  uint64_t v8 = (void *)[a4 objectForKeyedSubscript:@"downsampleOversizeX"];
  if (v8) {
    [v8 floatValue];
  }
  else {
    float v9 = 1.3;
  }
  retstr->var8 = v9;
  uint64_t v10 = (void *)[a4 objectForKeyedSubscript:@"downsampleOversizeY"];
  if (v10) {
    [v10 floatValue];
  }
  else {
    float v11 = 1.8;
  }
  retstr->var9 = v11;
  uint64_t v12 = (void *)[a4 objectForKeyedSubscript:@"gradientChannel"];
  if (v12) {
    int v13 = [v12 intValue];
  }
  else {
    int v13 = 6;
  }
  retstr->var10 = v13;
  int32x4_t v14 = (void *)[a4 objectForKeyedSubscript:@"edgeFindingChannel"];
  if (v14) {
    int v15 = [v14 intValue];
  }
  else {
    int v15 = 6;
  }
  retstr->var11 = v15;
  float v16 = (void *)[a4 objectForKeyedSubscript:@"minMagnitude"];
  if (v16) {
    [v16 floatValue];
  }
  else {
    float v17 = 0.1;
  }
  retstr->var12 = v17;
  float64x2_t v18 = (void *)[a4 objectForKeyedSubscript:@"regressionRadius"];
  if (v18) {
    [v18 floatValue];
  }
  else {
    float v19 = 2.5;
  }
  retstr->var13 = v19;
  float v20 = (void *)[a4 objectForKeyedSubscript:@"capture"];
  if (v20) {
    [v20 floatValue];
  }
  else {
    float v21 = 3.14;
  }
  retstr->var14 = v21;
  float v22 = (void *)[a4 objectForKeyedSubscript:@"alignmentTolerance"];
  if (v22) {
    [v22 floatValue];
  }
  else {
    float v23 = 0.72;
  }
  retstr->var15 = v23;
  float v24 = (void *)[a4 objectForKeyedSubscript:@"connectThreshold"];
  if (v24) {
    [v24 floatValue];
  }
  else {
    float v25 = 7.0;
  }
  retstr->var16 = v25;
  float v26 = (void *)[a4 objectForKeyedSubscript:@"forceFail"];
  if (v26) {
    LOBYTE(v26) = [v26 BOOLValue];
  }
  retstr->var17 = (char)v26;
  float v27 = (void *)[a4 objectForKeyedSubscript:@"orientation"];
  if (v27) {
    int v28 = [v27 intValue];
  }
  else {
    int v28 = 1;
  }
  retstr->var19 = v28;
  float v29 = (void *)[a4 objectForKeyedSubscript:@"imageExtent"];
  if (v29)
  {
    float v30 = v29;
    objc_msgSend((id)objc_msgSend(v29, "objectAtIndexedSubscript:", 0), "floatValue");
    double v32 = v31;
    objc_msgSend((id)objc_msgSend(v30, "objectAtIndexedSubscript:", 1), "floatValue");
    double v34 = v33;
    objc_msgSend((id)objc_msgSend(v30, "objectAtIndexedSubscript:", 2), "floatValue");
    double v36 = v35;
    objc_msgSend((id)objc_msgSend(v30, "objectAtIndexedSubscript:", 3), "floatValue");
    double v38 = v37;
  }
  else
  {
    double v32 = 0.0;
    double v34 = 0.0;
    double v36 = 0.0;
    double v38 = 0.0;
  }
  retstr->var18.origin.float x = v32;
  retstr->var18.origin.float y = v34;
  retstr->var18.size.float width = v36;
  retstr->var18.size.float height = v38;
  uint64_t v39 = [a4 objectForKeyedSubscript:@"cameraModel"];
  if (v39) {
    float v40 = (__CFString *)v39;
  }
  else {
    float v40 = @"Unknown";
  }
  int result = ($807B2EF8CC2A3BA0CBD71F9CA1C0D669 *)[(__CFString *)v40 isEqualToString:@"iPhone X"];
  if (result)
  {
    int v42 = 1;
  }
  else
  {
    int result = ($807B2EF8CC2A3BA0CBD71F9CA1C0D669 *)[(__CFString *)v40 isEqualToString:@"iPhone 4"];
    if ((result & 1) != 0
      || (int result = ($807B2EF8CC2A3BA0CBD71F9CA1C0D669 *)[(__CFString *)v40 isEqualToString:@"iPhone"], result))
    {
      int v42 = 2;
    }
    else
    {
      int result = ($807B2EF8CC2A3BA0CBD71F9CA1C0D669 *)[(__CFString *)v40 containsString:@"KODAK"];
      if (result) {
        int v42 = 3;
      }
      else {
        int v42 = 4;
      }
    }
  }
  retstr->var20 = v42;
  float v43 = v36;
  float v44 = v38;
  retstr->var0 = v43;
  retstr->var1 = v44;
  retstr->var2 = 1.0 / v43;
  retstr->var3 = 1.0 / v44;
  float v45 = (float)(uint64_t)rintf(v44);
  retstr->var4 = v45;
  retstr->var26 = (int)v45;
  return result;
}

- (int)updateWithFaceIndex:(int)a3
{
  self->S.faceIndedouble x = a3;
  int result = +[CIRedEyeRepair3 faceContext:&self->FC withFaceArray:self->faceArray index:*(void *)&a3 settings:&self->S];
  if (!result)
  {
    double x = self->S.inputImageExtent.origin.x;
    double y = self->S.inputImageExtent.origin.y;
    double height = self->S.inputImageExtent.size.height;
    int minrow = self->FC.FR.minrow;
    int maxrow = self->FC.FR.maxrow;
    int mincol = self->FC.FR.mincol;
    int maxcol = self->FC.FR.maxcol;
    self->ioffdouble x = mincol;
    self->ioffdouble y = minrow;
    self->ROIRect.origin.double x = x + (float)mincol;
    self->ROIRect.origin.double y = y + height - (float)maxrow;
    self->ROIRect.size.float width = (float)(maxcol - mincol);
    self->ROIRect.size.double height = (float)(maxrow - minrow);
  }
  return result;
}

- (void)repairExternalBuffer
{
  unint64_t v2 = *(void *)&self->repairRect.minrow;
  unint64_t v3 = HIDWORD(v2);
  uint64_t v4 = *(void *)&self->repairRect.mincol;
  BOOL v5 = SHIDWORD(v4) <= (int)v4 || SHIDWORD(v2) <= (int)v2;
  if (v5 || __PAIR64__(HIDWORD(v2) - (int)v2, HIDWORD(v4) - (int)v4) != *(void *)&self->repairMap.width) {
    return;
  }
  p_repairMap = &self->repairMap;
  uint64_t v41 = 0;
  memset(v40, 0, sizeof(v40));
  if (self->FC.FR.mincol > (int)v4
    || self->FC.FR.minrow > (int)v2
    || self->FC.FR.maxcol < SHIDWORD(v4)
    || self->FC.FR.maxrow < SHIDWORD(v2))
  {
    unint64_t v8 = offsetBitmapRect(*(void *)&self->FC.FR.minrow, *(void *)&self->FC.FR.mincol, -(int)v4, -(int)v2);
    uint64_t v10 = v9;
    unint64_t v11 = offsetBitmapRect(v2, v4, -(int)v4, -(int)v2);
    uint64_t v12 = intersectBitmapRects(v8, v10, v11);
    uint64_t v14 = v12;
    uint64_t v15 = v13;
    if (SHIDWORD(v13) <= (int)v13 || SHIDWORD(v12) <= (int)v12) {
      return;
    }
    constructSliceBitmap((uint64_t)&self->repairMap, (uint64_t)v40, v12, v13);
    unint64_t v17 = offsetBitmapRect(v14, v15, v4, v2);
    uint64_t v4 = v18;
    unint64_t v3 = HIDWORD(v17);
    p_repairMap = ($F19D4DADCC5A4AF414AA3A0637C491CF *)v40;
    LODWORD(v2) = v17;
  }
  if (self->subRectangle.mincol <= (int)v4
    && (int)v2 >= self->subRectangle.minrow
    && self->subRectangle.maxcol >= SHIDWORD(v4)
    && (int)v3 <= self->subRectangle.maxrow)
  {
    baseAddress = p_repairMap->baseAddress;
    uint64_t samplesPerPixel = p_repairMap->samplesPerPixel;
    int width = p_repairMap->width;
    p_int height = &p_repairMap->height;
    int height = p_repairMap->height;
    uint64_t v24 = p_height[1];
    int v25 = offsetBitmapRect(v2 | (v3 << 32), v4, -self->FC.FR.mincol, -self->FC.FR.minrow);
    if (height >= 1)
    {
      int v27 = 0;
      uint64_t rowSamples = self->fullBitmap.rowSamples;
      uint64_t v29 = self->fullBitmap.samplesPerPixel;
      float v30 = (unsigned __int8 *)(baseAddress + 1);
      float v31 = &self->fullBitmap.baseAddress[(int)rowSamples * (uint64_t)v25 + 2 + (int)v29 * (uint64_t)v26];
      do
      {
        if (width >= 1)
        {
          double v32 = v31;
          float v33 = v30;
          int v34 = width;
          do
          {
            int v35 = v33[2] | (v33[2] << 8);
            int v36 = *(v32 - 1);
            int v37 = *v32;
            int v38 = (*v33 - v36) * v35 + 0x8000;
            int v39 = (*(v33 - 1) - v37) * v35 + 0x8000;
            *(v32 - 2) += ((v33[1] - *(v32 - 2)) * v35 + 0x8000) >> 16;
            *(v32 - 1) = v36 + BYTE2(v38);
            *double v32 = v37 + BYTE2(v39);
            v33 += samplesPerPixel;
            v32 += v29;
            --v34;
          }
          while (v34);
        }
        ++v27;
        v30 += v24;
        v31 += rowSamples;
      }
      while (v27 != height);
    }
  }
}

- ($07A02DD24AF34610473D9D0940B06C4B)repairMap
{
  return ($07A02DD24AF34610473D9D0940B06C4B *)&self->repairMap;
}

- ($A3B2E143E1A03423F9FC703C010436DC)repairRect
{
  uint64_t v2 = *(void *)&self->repairRect.mincol;
  uint64_t v3 = *(void *)&self->repairRect.minrow;
  result.var2 = v2;
  result.var3 = HIDWORD(v2);
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  return result;
}

- (CGPoint)bitmapPointWithDictionaryPoint:(CGPoint)a3
{
  float v3 = a3.x * self->S.xf;
  float yf = self->S.yf;
  float v5 = a3.y * yf;
  double v6 = (float)(v3 - (float)self->ioffx);
  double v7 = (float)((float)(yf - v5) - (float)self->ioffy);
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGPoint)globalBitmapPointWithDictionaryPoint:(CGPoint)a3
{
  float v3 = a3.x * self->S.xf;
  float yf = self->S.yf;
  float v5 = a3.y * yf;
  double v6 = v3;
  double v7 = (float)(yf - v5);
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGPoint)bitmapPointWithDictionaryPointArray:(id)a3
{
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "floatValue");
  float v6 = v5 * self->S.xf;
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "floatValue");
  float v8 = (float)(self->S.yf - (float)(v7 * self->S.yf)) - (float)self->ioffy;
  double v9 = (float)(v6 - (float)self->ioffx);
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGPoint)globalBitmapPointWithDictionaryPointArray:(id)a3
{
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "floatValue");
  float v6 = v5 * self->S.xf;
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "floatValue");
  float v8 = self->S.yf - (float)(v7 * self->S.yf);
  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGPoint)dictionaryPointWithBitmapPoint:(CGPoint)a3
{
  float v3 = a3.x + (float)self->ioffx;
  float v4 = a3.y + (float)self->ioffy;
  double v5 = (float)(self->S.xfi * v3);
  double v6 = (float)(self->S.yfi * (float)(self->S.yf - v4));
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (CGPoint)dictionaryPointWithGlobalBitmapPoint:(CGPoint)a3
{
  float x = a3.x;
  float y = a3.y;
  double v5 = (float)(self->S.xfi * x);
  double v6 = (float)((float)(self->S.yf - y) * self->S.yfi);
  result.float y = v6;
  result.float x = v5;
  return result;
}

- (id)dictionaryPointArrayWithEyeBitmapPoint:(CGPoint)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 136;
  if (!self->S.side) {
    uint64_t v3 = 120;
  }
  uint64_t v4 = 144;
  if (!self->S.side) {
    uint64_t v4 = 128;
  }
  CGFloat v5 = a3.x + (float)(self->FC.FR.mincol + *(_DWORD *)((char *)&self->super.isa + v4));
  *(float *)&CGFloat v5 = v5;
  float v6 = a3.y + (float)(self->FC.FR.minrow + *(_DWORD *)((char *)&self->super.isa + v3));
  *(float *)&CGFloat v5 = self->S.xfi * *(float *)&v5;
  float v7 = self->S.yfi * (float)(self->S.yf - v6);
  v10[0] = [NSNumber numberWithFloat:v5];
  *(float *)&double v8 = v7;
  v10[1] = [NSNumber numberWithFloat:v8];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
}

- (id)dictionaryPointArrayWithBitmapPoint:(CGPoint)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  CGFloat v3 = a3.x + (float)self->FC.FR.mincol;
  *(float *)&CGFloat v3 = v3;
  float v4 = a3.y + (float)self->FC.FR.minrow;
  *(float *)&CGFloat v3 = self->S.xfi * *(float *)&v3;
  float v5 = self->S.yfi * (float)(self->S.yf - v4);
  v8[0] = [NSNumber numberWithFloat:v3];
  *(float *)&double v6 = v5;
  v8[1] = [NSNumber numberWithFloat:v6];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
}

- (id)dictionaryPointArrayWithGlobalBitmapPoint:(CGPoint)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  *(float *)&a3.float x = a3.x;
  float y = a3.y;
  *(float *)&a3.float x = self->S.xfi * *(float *)&a3.x;
  float v4 = (float)(self->S.yf - y) * self->S.yfi;
  v7[0] = [NSNumber numberWithFloat:a3.x];
  *(float *)&double v5 = v4;
  v7[1] = [NSNumber numberWithFloat:v5];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
}

- ($A3B2E143E1A03423F9FC703C010436DC)bitmapRectWithDictionaryRectArray:(id)a3
{
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "floatValue");
  uint64_t v6 = (uint64_t)rintf(v5 * self->S.xf);
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "floatValue");
  uint64_t v8 = (uint64_t)rintf(v7 * self->S.yf);
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "floatValue");
  uint64_t v10 = (uint64_t)rintf(v9 * self->S.xf);
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 3), "floatValue");
  unint64_t BitmapRect = makeBitmapRect(v6, (int)(float)(self->S.ify - (float)(int)((uint64_t)rintf(v11 * self->S.yf) + v8)), (v10 + v6), (int)(float)(self->S.ify - (float)(int)v8));
  uint64_t v14 = -self->ioffx;
  int v15 = -self->ioffy;

  unint64_t v16 = offsetBitmapRect(BitmapRect, v13, v14, v15);
  result.var2 = v17;
  result.var3 = HIDWORD(v17);
  result.var0 = v16;
  result.var1 = HIDWORD(v16);
  return result;
}

- ($A3B2E143E1A03423F9FC703C010436DC)globalBitmapRectWithDictionaryRectArray:(id)a3
{
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "floatValue");
  uint64_t v6 = (uint64_t)rintf(v5 * self->S.xf);
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "floatValue");
  uint64_t v8 = (uint64_t)rintf(v7 * self->S.yf);
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "floatValue");
  uint64_t v10 = (uint64_t)rintf(v9 * self->S.xf);
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 3), "floatValue");
  uint64_t v12 = (uint64_t)rintf(v11 * self->S.yf);
  iffloat y = self->S.ify;

  unint64_t BitmapRect = makeBitmapRect(v6, (int)(float)(ify - (float)(v12 + v8)), (v10 + v6), (int)(float)(ify - (float)(int)v8));
  result.var2 = v15;
  result.var3 = HIDWORD(v15);
  result.var0 = BitmapRect;
  result.var1 = HIDWORD(BitmapRect);
  return result;
}

- (id)dictionaryRectArrayWithBitmapRect:(id)a3
{
  v13[4] = *MEMORY[0x1E4F143B8];
  float xfi = self->S.xfi;
  *(float *)&double v3 = xfi * (float)(self->ioffx + a3.var2);
  float yfi = self->S.yfi;
  float v6 = yfi * (float)(int)(float)(self->S.ify - (float)(self->ioffy + a3.var1));
  float v7 = xfi * (float)(a3.var3 - a3.var2);
  float v8 = yfi * (float)(a3.var1 - a3.var0);
  v13[0] = [NSNumber numberWithFloat:v3];
  *(float *)&double v9 = v6;
  v13[1] = [NSNumber numberWithFloat:v9];
  *(float *)&double v10 = v7;
  v13[2] = [NSNumber numberWithFloat:v10];
  *(float *)&double v11 = v8;
  v13[3] = [NSNumber numberWithFloat:v11];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
}

- (id)dictionaryRectArrayWithGlobalBitmapRect:(id)a3
{
  v13[4] = *MEMORY[0x1E4F143B8];
  float xfi = self->S.xfi;
  *(float *)&double v3 = xfi * (float)a3.var2;
  float yfi = self->S.yfi;
  float v6 = yfi * (float)(int)(float)(self->S.ify - (float)a3.var1);
  float v7 = xfi * (float)(a3.var3 - a3.var2);
  float v8 = yfi * (float)(a3.var1 - a3.var0);
  v13[0] = [NSNumber numberWithFloat:v3];
  *(float *)&double v9 = v6;
  v13[1] = [NSNumber numberWithFloat:v9];
  *(float *)&double v10 = v7;
  v13[2] = [NSNumber numberWithFloat:v10];
  *(float *)&double v11 = v8;
  v13[3] = [NSNumber numberWithFloat:v11];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
}

- (int)saveRepairDictionary:(id *)a3 withConvexHull:(id *)a4 facts:(id *)a5
{
  v103[4] = *MEMORY[0x1E4F143B8];
  [(CIRedEyeRepair3 *)self centroidWithConvexHull:a4];
  id v9 = -[CIRedEyeRepair3 dictionaryPointArrayWithEyeBitmapPoint:](self, "dictionaryPointArrayWithEyeBitmapPoint:");
  id v10 = -[CIRedEyeRepair3 dictionaryRectArrayWithGlobalBitmapRect:](self, "dictionaryRectArrayWithGlobalBitmapRect:", *(void *)&self->FC.FR.minrow, *(void *)&self->FC.FR.mincol);
  if (!v10) {
    return 8;
  }
  id v11 = v10;
  id v12 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.leftEye.x, self->FC.leftEye.y);
  if (!v12) {
    return 8;
  }
  id v13 = v12;
  id v14 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.rightEye.x, self->FC.rightEye.y);
  if (!v14) {
    return 8;
  }
  id v15 = v14;
  id v16 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.LPoly[0].x, self->FC.LPoly[0].y);
  if (!v16) {
    return 8;
  }
  id v17 = v16;
  id v18 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.LPoly[1].x, self->FC.LPoly[1].y);
  if (!v18) {
    return 8;
  }
  id v19 = v18;
  id v20 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.LPoly[2].x, self->FC.LPoly[2].y);
  if (!v20) {
    return 8;
  }
  id v92 = v20;
  id v21 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.LPoly[3].x, self->FC.LPoly[3].y);
  if (!v21) {
    return 8;
  }
  id v91 = v21;
  id v22 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.LPoly[4].x, self->FC.LPoly[4].y);
  if (!v22) {
    return 8;
  }
  id v90 = v22;
  id v23 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.LPoly[5].x, self->FC.LPoly[5].y);
  if (!v23) {
    return 8;
  }
  id v89 = v23;
  id v24 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.LPoly[6].x, self->FC.LPoly[6].y);
  if (!v24) {
    return 8;
  }
  id v88 = v24;
  id v25 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.LPoly[7].x, self->FC.LPoly[7].y);
  if (!v25) {
    return 8;
  }
  id v87 = v25;
  id v26 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.RPoly[0].x, self->FC.RPoly[0].y);
  if (!v26) {
    return 8;
  }
  id v86 = v26;
  id v27 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.RPoly[1].x, self->FC.RPoly[1].y);
  if (!v27) {
    return 8;
  }
  id v85 = v27;
  id v28 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.RPoly[2].x, self->FC.RPoly[2].y);
  if (!v28) {
    return 8;
  }
  id v84 = v28;
  id v29 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.RPoly[3].x, self->FC.RPoly[3].y);
  if (!v29) {
    return 8;
  }
  id v83 = v29;
  id v30 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.RPoly[4].x, self->FC.RPoly[4].y);
  if (!v30) {
    return 8;
  }
  id v82 = v30;
  id v31 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.RPoly[5].x, self->FC.RPoly[5].y);
  if (!v31) {
    return 8;
  }
  id v81 = v31;
  id v32 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.RPoly[6].x, self->FC.RPoly[6].y);
  if (!v32) {
    return 8;
  }
  id v80 = v32;
  id v79 = -[CIRedEyeRepair3 dictionaryPointArrayWithBitmapPoint:](self, "dictionaryPointArrayWithBitmapPoint:", self->FC.RPoly[7].x, self->FC.RPoly[7].y);
  if (!v79) {
    return 8;
  }
  id v78 = -[CIRedEyeRepair3 dictionaryRectArrayWithBitmapRect:](self, "dictionaryRectArrayWithBitmapRect:", *(void *)&self->FC.LR.minrow, *(void *)&self->FC.LR.mincol);
  if (!v78) {
    return 8;
  }
  id v77 = -[CIRedEyeRepair3 dictionaryRectArrayWithBitmapRect:](self, "dictionaryRectArrayWithBitmapRect:", *(void *)&self->FC.RR.minrow, *(void *)&self->FC.RR.mincol);
  if (!v77) {
    return 8;
  }
  *(float *)&double v33 = self->FC.leftDistMatrix[0];
  v103[0] = [NSNumber numberWithFloat:v33];
  *(float *)&double v34 = self->FC.leftDistMatrix[1];
  v103[1] = [NSNumber numberWithFloat:v34];
  *(float *)&double v35 = self->FC.leftDistMatrix[2];
  v103[2] = [NSNumber numberWithFloat:v35];
  *(float *)&double v36 = self->FC.leftDistMatrix[3];
  v103[3] = [NSNumber numberWithFloat:v36];
  uint64_t v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:4];
  if (!v76) {
    return 8;
  }
  *(float *)&double v37 = self->FC.rightDistMatrix[0];
  v102[0] = [NSNumber numberWithFloat:v37];
  *(float *)&double v38 = self->FC.rightDistMatrix[1];
  v102[1] = [NSNumber numberWithFloat:v38];
  *(float *)&double v39 = self->FC.rightDistMatrix[2];
  v102[2] = [NSNumber numberWithFloat:v39];
  *(float *)&double v40 = self->FC.rightDistMatrix[3];
  v102[3] = [NSNumber numberWithFloat:v40];
  uint64_t v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:4];
  if (!v41) {
    return 8;
  }
  v100[0] = @"faceRect";
  v100[1] = @"leftEye";
  v101[0] = v11;
  v101[1] = v13;
  v100[2] = @"rightEye";
  v100[3] = @"leftPoly0";
  v101[2] = v15;
  v101[3] = v17;
  v100[4] = @"leftPoly1";
  v100[5] = @"leftPoly2";
  v101[4] = v19;
  v101[5] = v92;
  v100[6] = @"leftPoly3";
  v100[7] = @"leftPoly4";
  v101[6] = v91;
  v101[7] = v90;
  v100[8] = @"leftPoly5";
  v100[9] = @"leftPoly6";
  v101[8] = v89;
  v101[9] = v88;
  v100[10] = @"leftPoly7";
  v100[11] = @"rightPoly0";
  v101[10] = v87;
  v101[11] = v86;
  v100[12] = @"rightPoly1";
  v100[13] = @"rightPoly2";
  v101[12] = v85;
  v101[13] = v84;
  v100[14] = @"rightPoly3";
  v100[15] = @"rightPoly4";
  v101[14] = v83;
  v101[15] = v82;
  v100[16] = @"rightPoly5";
  v100[17] = @"rightPoly6";
  v101[16] = v81;
  v101[17] = v80;
  v100[18] = @"rightPoly7";
  v100[19] = @"leftRect";
  v101[18] = v79;
  v101[19] = v78;
  v100[20] = @"rightRect";
  v100[21] = @"leftDistMatrix";
  v101[20] = v77;
  v101[21] = v76;
  v100[22] = @"rightDistMatrix";
  v101[22] = v41;
  uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:23];
  if (!v42) {
    return 8;
  }
  uint64_t v43 = v42;
  uint64_t v44 = [MEMORY[0x1E4F1CA48] array];
  if (!v44) {
    return 8;
  }
  float v45 = (void *)v44;
  if (a4->var1 >= 1)
  {
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    do
    {
      objc_msgSend(v45, "addObject:", -[CIRedEyeRepair3 dictionaryPointArrayWithEyeBitmapPoint:](self, "dictionaryPointArrayWithEyeBitmapPoint:", a4->var3[v46].x, a4->var3[v46].y));
      ++v47;
      ++v46;
    }
    while (v47 < a4->var1);
  }
  v98[0] = @"counterClockwise";
  v99[0] = [NSNumber numberWithBool:a4->var0];
  v98[1] = @"nPoints";
  v99[1] = [NSNumber numberWithInt:a4->var1];
  v98[2] = @"maxPoints";
  uint64_t v48 = [NSNumber numberWithInt:a4->var2];
  v98[3] = @"hullBody";
  v99[2] = v48;
  v99[3] = v45;
  uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:4];
  if (!v49) {
    return 8;
  }
  uint64_t v50 = v49;
  v96[0] = @"downsampleType";
  v97[0] = [NSNumber numberWithInt:self->S.downsampleType];
  v96[1] = @"downsampleOversizeX";
  *(float *)&double v51 = self->S.downsampleOversizeX;
  v97[1] = [NSNumber numberWithFloat:v51];
  v96[2] = @"downsampleOversizeY";
  *(float *)&double v52 = self->S.downsampleOversizeY;
  v97[2] = [NSNumber numberWithFloat:v52];
  v96[3] = @"gradientChannel";
  v97[3] = [NSNumber numberWithInt:self->S.gradientChannel];
  v96[4] = @"edgeFindingChannel";
  v97[4] = [NSNumber numberWithInt:self->S.edgeFindingChannel];
  v96[5] = @"minMagnitude";
  *(float *)&double v53 = self->S.minMagnitude;
  v97[5] = [NSNumber numberWithFloat:v53];
  v96[6] = @"regressionRadius";
  *(float *)&double v54 = self->S.regressionRadius;
  v97[6] = [NSNumber numberWithFloat:v54];
  v96[7] = @"capture";
  *(float *)&double v55 = self->S.capture;
  v97[7] = [NSNumber numberWithFloat:v55];
  v96[8] = @"alignmentTolerance";
  *(float *)&double v56 = self->S.alignmentTolerance;
  v97[8] = [NSNumber numberWithFloat:v56];
  v96[9] = @"connectThreshold";
  *(float *)&double v57 = self->S.connectThreshold;
  v97[9] = [NSNumber numberWithFloat:v57];
  v96[10] = @"faceIndex";
  v97[10] = [NSNumber numberWithInt:self->S.faceIndex];
  v96[11] = @"side";
  v97[11] = [NSNumber numberWithInt:self->S.side];
  v96[12] = @"scale";
  *(float *)&double v58 = self->S.scale;
  v97[12] = [NSNumber numberWithFloat:v58];
  v96[13] = @"IOD";
  *(float *)&double v59 = self->S.IOD;
  v97[13] = [NSNumber numberWithFloat:v59];
  v96[14] = @"transform";
  v95[0] = [NSNumber numberWithDouble:self->S.transform.a];
  v95[1] = [NSNumber numberWithDouble:self->S.transform.b];
  v95[2] = [NSNumber numberWithDouble:self->S.transform.c];
  v95[3] = [NSNumber numberWithDouble:self->S.transform.d];
  v95[4] = [NSNumber numberWithDouble:self->S.transform.tx];
  v95[5] = [NSNumber numberWithDouble:self->S.transform.ty];
  v97[14] = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:6];
  v96[15] = @"height";
  v97[15] = [NSNumber numberWithInt:self->S.height];
  uint64_t v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:16];
  if (!v60) {
    return 8;
  }
  v93[0] = @"context";
  v93[1] = @"convexHull";
  v94[0] = v43;
  v94[1] = v50;
  v94[2] = v60;
  v93[2] = @"settings";
  v93[3] = @"xf";
  *(float *)&double v61 = self->S.xf;
  v94[3] = [NSNumber numberWithFloat:v61];
  v93[4] = @"yf";
  *(float *)&double v62 = self->S.yf;
  v94[4] = [NSNumber numberWithFloat:v62];
  v93[5] = @"ioffx";
  v94[5] = [NSNumber numberWithInt:self->S.ioffx];
  v93[6] = @"ioffy";
  v94[6] = [NSNumber numberWithInt:self->S.ioffy];
  v93[7] = @"px";
  v94[7] = [v9 objectAtIndexedSubscript:0];
  v93[8] = @"py";
  v94[8] = [v9 objectAtIndexedSubscript:1];
  v93[9] = @"pointX";
  v94[9] = [v9 objectAtIndexedSubscript:0];
  v93[10] = @"pointY";
  v94[10] = [v9 objectAtIndexedSubscript:1];
  v93[11] = @"skinval";
  *(float *)&double v63 = self->M.skinval;
  v94[11] = [NSNumber numberWithFloat:v63];
  v93[12] = @"avgLuminance";
  *(float *)&double v64 = self->M.avgLuminance;
  v94[12] = [NSNumber numberWithFloat:v64];
  v93[13] = @"minLuminance";
  *(float *)&double v65 = self->M.minLuminance;
  v94[13] = [NSNumber numberWithFloat:v65];
  v93[14] = @"maxLuminance";
  *(float *)&double v66 = self->M.maxLuminance;
  v94[14] = [NSNumber numberWithFloat:v66];
  v93[15] = @"darkPercent";
  *(float *)&double v67 = self->M.darkPercent;
  v94[15] = [NSNumber numberWithFloat:v67];
  v93[16] = @"clipPercent";
  *(float *)&double v68 = self->M.clipPercent;
  v94[16] = [NSNumber numberWithFloat:v68];
  v93[17] = @"variance";
  v94[17] = [NSNumber numberWithDouble:self->FS.variance];
  v93[18] = @"nNonZero";
  v94[18] = [NSNumber numberWithInt:self->FS.nNonZero];
  v93[19] = @"xPosition";
  *(float *)&double v69 = a5->var6;
  v94[19] = [NSNumber numberWithFloat:v69];
  v93[20] = @"hue";
  *(float *)&double v70 = a5->var7;
  v94[20] = [NSNumber numberWithFloat:v70];
  v93[21] = @"saturation";
  *(float *)&double v71 = a5->var8;
  v94[21] = [NSNumber numberWithFloat:v71];
  v93[22] = @"luminance";
  *(float *)&double v72 = a5->var9;
  v94[22] = [NSNumber numberWithFloat:v72];
  uint64_t v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:23];
  if (!v73) {
    return 8;
  }
  float v74 = (void *)v73;
  int result = 0;
  *a3 = v74;
  return result;
}

- (int)packGlobalRepairDictionary:(id *)a3 withConvexHull:(id *)a4 facts:(id *)a5
{
  v103[4] = *MEMORY[0x1E4F143B8];
  [(CIRedEyeRepair3 *)self centroidWithConvexHull:a4];
  id v9 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:");
  id v10 = -[CIRedEyeRepair3 dictionaryRectArrayWithGlobalBitmapRect:](self, "dictionaryRectArrayWithGlobalBitmapRect:", *(void *)&self->FC.FR.minrow, *(void *)&self->FC.FR.mincol);
  if (!v10) {
    return 8;
  }
  id v11 = v10;
  id v12 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.leftEye.x, self->FC.leftEye.y);
  if (!v12) {
    return 8;
  }
  id v13 = v12;
  id v14 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.rightEye.x, self->FC.rightEye.y);
  if (!v14) {
    return 8;
  }
  id v15 = v14;
  id v16 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.LPoly[0].x, self->FC.LPoly[0].y);
  if (!v16) {
    return 8;
  }
  id v17 = v16;
  id v18 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.LPoly[1].x, self->FC.LPoly[1].y);
  if (!v18) {
    return 8;
  }
  id v19 = v18;
  id v20 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.LPoly[2].x, self->FC.LPoly[2].y);
  if (!v20) {
    return 8;
  }
  id v92 = v20;
  id v21 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.LPoly[3].x, self->FC.LPoly[3].y);
  if (!v21) {
    return 8;
  }
  id v91 = v21;
  id v22 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.LPoly[4].x, self->FC.LPoly[4].y);
  if (!v22) {
    return 8;
  }
  id v90 = v22;
  id v23 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.LPoly[5].x, self->FC.LPoly[5].y);
  if (!v23) {
    return 8;
  }
  id v89 = v23;
  id v24 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.LPoly[6].x, self->FC.LPoly[6].y);
  if (!v24) {
    return 8;
  }
  id v88 = v24;
  id v25 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.LPoly[7].x, self->FC.LPoly[7].y);
  if (!v25) {
    return 8;
  }
  id v87 = v25;
  id v26 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.RPoly[0].x, self->FC.RPoly[0].y);
  if (!v26) {
    return 8;
  }
  id v86 = v26;
  id v27 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.RPoly[1].x, self->FC.RPoly[1].y);
  if (!v27) {
    return 8;
  }
  id v85 = v27;
  id v28 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.RPoly[2].x, self->FC.RPoly[2].y);
  if (!v28) {
    return 8;
  }
  id v84 = v28;
  id v29 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.RPoly[3].x, self->FC.RPoly[3].y);
  if (!v29) {
    return 8;
  }
  id v83 = v29;
  id v30 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.RPoly[4].x, self->FC.RPoly[4].y);
  if (!v30) {
    return 8;
  }
  id v82 = v30;
  id v31 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.RPoly[5].x, self->FC.RPoly[5].y);
  if (!v31) {
    return 8;
  }
  id v81 = v31;
  id v32 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.RPoly[6].x, self->FC.RPoly[6].y);
  if (!v32) {
    return 8;
  }
  id v80 = v32;
  id v79 = -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", self->FC.RPoly[7].x, self->FC.RPoly[7].y);
  if (!v79) {
    return 8;
  }
  id v78 = -[CIRedEyeRepair3 dictionaryRectArrayWithGlobalBitmapRect:](self, "dictionaryRectArrayWithGlobalBitmapRect:", *(void *)&self->FC.LR.minrow, *(void *)&self->FC.LR.mincol);
  if (!v78) {
    return 8;
  }
  id v77 = -[CIRedEyeRepair3 dictionaryRectArrayWithGlobalBitmapRect:](self, "dictionaryRectArrayWithGlobalBitmapRect:", *(void *)&self->FC.RR.minrow, *(void *)&self->FC.RR.mincol);
  if (!v77) {
    return 8;
  }
  *(float *)&double v33 = self->FC.leftDistMatrix[0];
  v103[0] = [NSNumber numberWithFloat:v33];
  *(float *)&double v34 = self->FC.leftDistMatrix[1];
  v103[1] = [NSNumber numberWithFloat:v34];
  *(float *)&double v35 = self->FC.leftDistMatrix[2];
  v103[2] = [NSNumber numberWithFloat:v35];
  *(float *)&double v36 = self->FC.leftDistMatrix[3];
  v103[3] = [NSNumber numberWithFloat:v36];
  uint64_t v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:4];
  if (!v76) {
    return 8;
  }
  *(float *)&double v37 = self->FC.rightDistMatrix[0];
  v102[0] = [NSNumber numberWithFloat:v37];
  *(float *)&double v38 = self->FC.rightDistMatrix[1];
  v102[1] = [NSNumber numberWithFloat:v38];
  *(float *)&double v39 = self->FC.rightDistMatrix[2];
  v102[2] = [NSNumber numberWithFloat:v39];
  *(float *)&double v40 = self->FC.rightDistMatrix[3];
  v102[3] = [NSNumber numberWithFloat:v40];
  uint64_t v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:4];
  if (!v41) {
    return 8;
  }
  v100[0] = @"faceRect";
  v100[1] = @"leftEye";
  v101[0] = v11;
  v101[1] = v13;
  v100[2] = @"rightEye";
  v100[3] = @"leftPoly0";
  v101[2] = v15;
  v101[3] = v17;
  v100[4] = @"leftPoly1";
  v100[5] = @"leftPoly2";
  v101[4] = v19;
  v101[5] = v92;
  v100[6] = @"leftPoly3";
  v100[7] = @"leftPoly4";
  v101[6] = v91;
  v101[7] = v90;
  v100[8] = @"leftPoly5";
  v100[9] = @"leftPoly6";
  v101[8] = v89;
  v101[9] = v88;
  v100[10] = @"leftPoly7";
  v100[11] = @"rightPoly0";
  v101[10] = v87;
  v101[11] = v86;
  v100[12] = @"rightPoly1";
  v100[13] = @"rightPoly2";
  v101[12] = v85;
  v101[13] = v84;
  v100[14] = @"rightPoly3";
  v100[15] = @"rightPoly4";
  v101[14] = v83;
  v101[15] = v82;
  v100[16] = @"rightPoly5";
  v100[17] = @"rightPoly6";
  v101[16] = v81;
  v101[17] = v80;
  v100[18] = @"rightPoly7";
  v100[19] = @"leftRect";
  v101[18] = v79;
  v101[19] = v78;
  v100[20] = @"rightRect";
  v100[21] = @"leftDistMatrix";
  v101[20] = v77;
  v101[21] = v76;
  v100[22] = @"rightDistMatrix";
  v101[22] = v41;
  uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:23];
  if (!v42) {
    return 8;
  }
  uint64_t v43 = v42;
  uint64_t v44 = [MEMORY[0x1E4F1CA48] array];
  if (!v44) {
    return 8;
  }
  float v45 = (void *)v44;
  if (a4->var1 >= 1)
  {
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    do
    {
      objc_msgSend(v45, "addObject:", -[CIRedEyeRepair3 dictionaryPointArrayWithGlobalBitmapPoint:](self, "dictionaryPointArrayWithGlobalBitmapPoint:", a4->var3[v46].x, a4->var3[v46].y));
      ++v47;
      ++v46;
    }
    while (v47 < a4->var1);
  }
  v98[0] = @"counterClockwise";
  v99[0] = [NSNumber numberWithBool:a4->var0];
  v98[1] = @"nPoints";
  v99[1] = [NSNumber numberWithInt:a4->var1];
  v98[2] = @"maxPoints";
  uint64_t v48 = [NSNumber numberWithInt:a4->var2];
  v98[3] = @"hullBody";
  v99[2] = v48;
  v99[3] = v45;
  uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:4];
  if (!v49) {
    return 8;
  }
  uint64_t v50 = v49;
  v96[0] = @"downsampleType";
  v97[0] = [NSNumber numberWithInt:self->S.downsampleType];
  v96[1] = @"downsampleOversizeX";
  *(float *)&double v51 = self->S.downsampleOversizeX;
  v97[1] = [NSNumber numberWithFloat:v51];
  v96[2] = @"downsampleOversizeY";
  *(float *)&double v52 = self->S.downsampleOversizeY;
  v97[2] = [NSNumber numberWithFloat:v52];
  v96[3] = @"gradientChannel";
  v97[3] = [NSNumber numberWithInt:self->S.gradientChannel];
  v96[4] = @"edgeFindingChannel";
  v97[4] = [NSNumber numberWithInt:self->S.edgeFindingChannel];
  v96[5] = @"minMagnitude";
  *(float *)&double v53 = self->S.minMagnitude;
  v97[5] = [NSNumber numberWithFloat:v53];
  v96[6] = @"regressionRadius";
  *(float *)&double v54 = self->S.regressionRadius;
  v97[6] = [NSNumber numberWithFloat:v54];
  v96[7] = @"capture";
  *(float *)&double v55 = self->S.capture;
  v97[7] = [NSNumber numberWithFloat:v55];
  v96[8] = @"alignmentTolerance";
  *(float *)&double v56 = self->S.alignmentTolerance;
  v97[8] = [NSNumber numberWithFloat:v56];
  v96[9] = @"connectThreshold";
  *(float *)&double v57 = self->S.connectThreshold;
  v97[9] = [NSNumber numberWithFloat:v57];
  v96[10] = @"faceIndex";
  v97[10] = [NSNumber numberWithInt:self->S.faceIndex];
  v96[11] = @"side";
  v97[11] = [NSNumber numberWithInt:self->S.side];
  v96[12] = @"scale";
  *(float *)&double v58 = self->S.scale;
  v97[12] = [NSNumber numberWithFloat:v58];
  v96[13] = @"IOD";
  *(float *)&double v59 = self->S.IOD;
  v97[13] = [NSNumber numberWithFloat:v59];
  v96[14] = @"transform";
  v95[0] = [NSNumber numberWithDouble:self->S.transform.a];
  v95[1] = [NSNumber numberWithDouble:self->S.transform.b];
  v95[2] = [NSNumber numberWithDouble:self->S.transform.c];
  v95[3] = [NSNumber numberWithDouble:self->S.transform.d];
  v95[4] = [NSNumber numberWithDouble:self->S.transform.tx];
  v95[5] = [NSNumber numberWithDouble:self->S.transform.ty];
  v97[14] = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:6];
  v96[15] = @"height";
  v97[15] = [NSNumber numberWithInt:self->S.height];
  uint64_t v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:16];
  if (!v60) {
    return 8;
  }
  v93[0] = @"context";
  v93[1] = @"convexHull";
  v94[0] = v43;
  v94[1] = v50;
  v94[2] = v60;
  v93[2] = @"settings";
  v93[3] = @"xf";
  *(float *)&double v61 = self->S.xf;
  v94[3] = [NSNumber numberWithFloat:v61];
  v93[4] = @"yf";
  *(float *)&double v62 = self->S.yf;
  v94[4] = [NSNumber numberWithFloat:v62];
  v93[5] = @"ioffx";
  v94[5] = [NSNumber numberWithInt:self->S.ioffx];
  v93[6] = @"ioffy";
  v94[6] = [NSNumber numberWithInt:self->S.ioffy];
  v93[7] = @"px";
  v94[7] = [v9 objectAtIndexedSubscript:0];
  v93[8] = @"py";
  v94[8] = [v9 objectAtIndexedSubscript:1];
  v93[9] = @"pointX";
  v94[9] = [v9 objectAtIndexedSubscript:0];
  v93[10] = @"pointY";
  v94[10] = [v9 objectAtIndexedSubscript:1];
  v93[11] = @"skinval";
  *(float *)&double v63 = self->M.skinval;
  v94[11] = [NSNumber numberWithFloat:v63];
  v93[12] = @"avgLuminance";
  *(float *)&double v64 = self->M.avgLuminance;
  v94[12] = [NSNumber numberWithFloat:v64];
  v93[13] = @"minLuminance";
  *(float *)&double v65 = self->M.minLuminance;
  v94[13] = [NSNumber numberWithFloat:v65];
  v93[14] = @"maxLuminance";
  *(float *)&double v66 = self->M.maxLuminance;
  v94[14] = [NSNumber numberWithFloat:v66];
  v93[15] = @"darkPercent";
  *(float *)&double v67 = self->M.darkPercent;
  v94[15] = [NSNumber numberWithFloat:v67];
  v93[16] = @"clipPercent";
  *(float *)&double v68 = self->M.clipPercent;
  v94[16] = [NSNumber numberWithFloat:v68];
  v93[17] = @"variance";
  v94[17] = [NSNumber numberWithDouble:self->FS.variance];
  v93[18] = @"nNonZero";
  v94[18] = [NSNumber numberWithInt:self->FS.nNonZero];
  v93[19] = @"xPosition";
  *(float *)&double v69 = a5->var6;
  v94[19] = [NSNumber numberWithFloat:v69];
  v93[20] = @"hue";
  *(float *)&double v70 = a5->var7;
  v94[20] = [NSNumber numberWithFloat:v70];
  v93[21] = @"saturation";
  *(float *)&double v71 = a5->var8;
  v94[21] = [NSNumber numberWithFloat:v71];
  v93[22] = @"luminance";
  *(float *)&double v72 = a5->var9;
  v94[22] = [NSNumber numberWithFloat:v72];
  uint64_t v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:23];
  if (!v73) {
    return 8;
  }
  float v74 = (void *)v73;
  int result = 0;
  *a3 = v74;
  return result;
}

- (BOOL)unpackToGlobalRepairDictionary:(id)a3 convexHull:(id *)a4 facts:(id *)a5
{
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"xf"), "floatValue");
  self->S.xf = v9;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"yf"), "floatValue");
  self->S.float yf = v10;
  self->S.float xfi = 1.0 / self->S.xf;
  self->S.float yfi = 1.0 / v10;
  self->S.iffloat y = (float)(int)rintf(v10);
  self->S.iofffloat x = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"ioffx"), "intValue");
  self->S.iofffloat y = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"ioffy"), "intValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"skinval"), "floatValue");
  self->M.skinval = v11;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"avgLuminance"), "floatValue");
  self->M.avgLuminance = v12;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"minLuminance"), "floatValue");
  self->M.minLuminance = v13;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"maxLuminance"), "floatValue");
  self->M.maxLuminance = v14;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"darkPercent"), "floatValue");
  self->M.darkPercent = v15;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"clipPercent"), "floatValue");
  self->M.clipPercent = v16;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"xPosition"), "floatValue");
  a5->var6 = v17;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"hue"), "floatValue");
  a5->uint64_t var7 = v18;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"saturation"), "floatValue");
  a5->var8 = v19;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"luminance"), "floatValue");
  a5->var9 = v20;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"variance"), "doubleValue");
  self->FS.variance = v21;
  self->FS.nNonZero = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"nNonZero"), "intValue");
  id v22 = (void *)[a3 objectForKeyedSubscript:@"context"];
  if (!v22) {
    goto LABEL_37;
  }
  id v23 = v22;
  uint64_t v24 = [v22 objectForKeyedSubscript:@"faceRect"];
  if (!v24) {
    goto LABEL_37;
  }
  uint64_t v25 = v24;
  uint64_t v26 = [v23 objectForKeyedSubscript:@"leftEye"];
  if (!v26) {
    goto LABEL_37;
  }
  uint64_t v27 = v26;
  uint64_t v28 = [v23 objectForKeyedSubscript:@"rightEye"];
  if (!v28) {
    goto LABEL_37;
  }
  uint64_t v29 = v28;
  uint64_t v30 = [v23 objectForKeyedSubscript:@"leftPoly0"];
  if (!v30) {
    goto LABEL_37;
  }
  uint64_t v31 = v30;
  uint64_t v32 = [v23 objectForKeyedSubscript:@"leftPoly1"];
  if (!v32) {
    goto LABEL_37;
  }
  uint64_t v33 = v32;
  uint64_t v34 = [v23 objectForKeyedSubscript:@"leftPoly2"];
  if (!v34) {
    goto LABEL_37;
  }
  uint64_t v35 = v34;
  uint64_t v36 = [v23 objectForKeyedSubscript:@"leftPoly3"];
  if (!v36) {
    goto LABEL_37;
  }
  uint64_t v164 = v36;
  uint64_t v37 = [v23 objectForKeyedSubscript:@"leftPoly4"];
  if (!v37) {
    goto LABEL_37;
  }
  uint64_t v163 = v37;
  uint64_t v38 = [v23 objectForKeyedSubscript:@"leftPoly5"];
  if (!v38) {
    goto LABEL_37;
  }
  uint64_t v162 = v38;
  uint64_t v39 = [v23 objectForKeyedSubscript:@"leftPoly6"];
  if (!v39) {
    goto LABEL_37;
  }
  uint64_t v161 = v39;
  uint64_t v40 = [v23 objectForKeyedSubscript:@"leftPoly7"];
  if (!v40) {
    goto LABEL_37;
  }
  uint64_t v160 = v40;
  uint64_t v41 = [v23 objectForKeyedSubscript:@"rightPoly0"];
  if (!v41) {
    goto LABEL_37;
  }
  uint64_t v159 = v41;
  uint64_t v42 = [v23 objectForKeyedSubscript:@"rightPoly1"];
  if (!v42) {
    goto LABEL_37;
  }
  uint64_t v158 = v42;
  uint64_t v43 = [v23 objectForKeyedSubscript:@"rightPoly2"];
  if (!v43) {
    goto LABEL_37;
  }
  uint64_t v157 = v43;
  uint64_t v44 = [v23 objectForKeyedSubscript:@"rightPoly3"];
  if (!v44) {
    goto LABEL_37;
  }
  uint64_t v156 = v44;
  uint64_t v45 = [v23 objectForKeyedSubscript:@"rightPoly4"];
  if (!v45) {
    goto LABEL_37;
  }
  uint64_t v155 = v45;
  uint64_t v46 = [v23 objectForKeyedSubscript:@"rightPoly5"];
  if (!v46) {
    goto LABEL_37;
  }
  uint64_t v153 = v46;
  uint64_t v154 = [v23 objectForKeyedSubscript:@"rightPoly6"];
  if (!v154) {
    goto LABEL_37;
  }
  uint64_t v47 = [v23 objectForKeyedSubscript:@"rightPoly7"];
  if (!v47) {
    goto LABEL_37;
  }
  uint64_t v151 = v35;
  uint64_t v152 = v47;
  uint64_t v48 = [v23 objectForKeyedSubscript:@"leftRect"];
  if (!v48) {
    goto LABEL_37;
  }
  uint64_t v49 = v48;
  uint64_t v150 = [v23 objectForKeyedSubscript:@"rightRect"];
  if (!v150) {
    goto LABEL_37;
  }
  v149 = (void *)[v23 objectForKeyedSubscript:@"leftDistMatrix"];
  if (!v149) {
    goto LABEL_37;
  }
  v147 = (void *)[v23 objectForKeyedSubscript:@"rightDistMatrix"];
  if (!v147) {
    goto LABEL_37;
  }
  uint64_t v50 = (void *)[a3 objectForKeyedSubscript:@"convexHull"];
  if (!v50) {
    goto LABEL_37;
  }
  double v51 = v50;
  v148 = (void *)[v50 objectForKeyedSubscript:@"hullBody"];
  if (!v148) {
    goto LABEL_37;
  }
  double v52 = (void *)[a3 objectForKeyedSubscript:@"settings"];
  double v53 = v52;
  if (!v52) {
    return (char)v53;
  }
  uint64_t v145 = [v52 objectForKeyedSubscript:@"transform"];
  if (!v145) {
    goto LABEL_37;
  }
  *(void *)&self->FC.FR.int minrow = [(CIRedEyeRepair3 *)self globalBitmapRectWithDictionaryRectArray:v25];
  *(void *)&self->FC.FR.int mincol = v54;
  [(CIRedEyeRepair3 *)self globalBitmapPointWithDictionaryPointArray:v27];
  self->FC.leftEye.float x = v55;
  self->FC.leftEye.float y = v56;
  [(CIRedEyeRepair3 *)self globalBitmapPointWithDictionaryPointArray:v29];
  self->FC.rightEye.float x = v57;
  self->FC.rightEye.float y = v58;
  [(CIRedEyeRepair3 *)self globalBitmapPointWithDictionaryPointArray:v31];
  self->FC.LPoly[0].float x = v59;
  self->FC.LPoly[0].float y = v60;
  [(CIRedEyeRepair3 *)self globalBitmapPointWithDictionaryPointArray:v33];
  self->FC.LPoly[1].float x = v61;
  self->FC.LPoly[1].float y = v62;
  [(CIRedEyeRepair3 *)self globalBitmapPointWithDictionaryPointArray:v151];
  self->FC.LPoly[2].float x = v63;
  self->FC.LPoly[2].float y = v64;
  [(CIRedEyeRepair3 *)self globalBitmapPointWithDictionaryPointArray:v164];
  self->FC.LPoly[3].float x = v65;
  self->FC.LPoly[3].float y = v66;
  [(CIRedEyeRepair3 *)self globalBitmapPointWithDictionaryPointArray:v163];
  self->FC.LPoly[4].float x = v67;
  self->FC.LPoly[4].float y = v68;
  [(CIRedEyeRepair3 *)self globalBitmapPointWithDictionaryPointArray:v162];
  self->FC.LPoly[5].float x = v69;
  self->FC.LPoly[5].float y = v70;
  [(CIRedEyeRepair3 *)self globalBitmapPointWithDictionaryPointArray:v161];
  self->FC.LPoly[6].float x = v71;
  self->FC.LPoly[6].float y = v72;
  [(CIRedEyeRepair3 *)self globalBitmapPointWithDictionaryPointArray:v160];
  self->FC.LPoly[7].float x = v73;
  self->FC.LPoly[7].float y = v74;
  [(CIRedEyeRepair3 *)self globalBitmapPointWithDictionaryPointArray:v159];
  self->FC.RPoly[0].float x = v75;
  self->FC.RPoly[0].float y = v76;
  [(CIRedEyeRepair3 *)self globalBitmapPointWithDictionaryPointArray:v158];
  self->FC.RPoly[1].float x = v77;
  self->FC.RPoly[1].float y = v78;
  [(CIRedEyeRepair3 *)self globalBitmapPointWithDictionaryPointArray:v157];
  self->FC.RPoly[2].float x = v79;
  self->FC.RPoly[2].float y = v80;
  [(CIRedEyeRepair3 *)self globalBitmapPointWithDictionaryPointArray:v156];
  self->FC.RPoly[3].float x = v81;
  self->FC.RPoly[3].float y = v82;
  [(CIRedEyeRepair3 *)self globalBitmapPointWithDictionaryPointArray:v155];
  self->FC.RPoly[4].float x = v83;
  self->FC.RPoly[4].float y = v84;
  [(CIRedEyeRepair3 *)self globalBitmapPointWithDictionaryPointArray:v153];
  self->FC.RPoly[5].float x = v85;
  self->FC.RPoly[5].float y = v86;
  [(CIRedEyeRepair3 *)self globalBitmapPointWithDictionaryPointArray:v154];
  self->FC.RPoly[6].float x = v87;
  self->FC.RPoly[6].float y = v88;
  [(CIRedEyeRepair3 *)self globalBitmapPointWithDictionaryPointArray:v152];
  self->FC.RPoly[7].float x = v89;
  self->FC.RPoly[7].float y = v90;
  *(void *)&self->FC.LR.int minrow = [(CIRedEyeRepair3 *)self globalBitmapRectWithDictionaryRectArray:v49];
  *(void *)&self->FC.LR.int mincol = v91;
  *(void *)&self->FC.RR.int minrow = [(CIRedEyeRepair3 *)self globalBitmapRectWithDictionaryRectArray:v150];
  *(void *)&self->FC.RR.int mincol = v92;
  objc_msgSend((id)objc_msgSend(v149, "objectAtIndexedSubscript:", 0), "floatValue");
  self->FC.leftDistMatrix[0] = v93;
  objc_msgSend((id)objc_msgSend(v149, "objectAtIndexedSubscript:", 1), "floatValue");
  self->FC.leftDistMatrix[1] = v94;
  objc_msgSend((id)objc_msgSend(v149, "objectAtIndexedSubscript:", 2), "floatValue");
  self->FC.leftDistMatrix[2] = v95;
  objc_msgSend((id)objc_msgSend(v149, "objectAtIndexedSubscript:", 3), "floatValue");
  self->FC.leftDistMatrix[3] = v96;
  objc_msgSend((id)objc_msgSend(v147, "objectAtIndexedSubscript:", 0), "floatValue");
  self->FC.rightDistMatrix[0] = v97;
  objc_msgSend((id)objc_msgSend(v147, "objectAtIndexedSubscript:", 1), "floatValue");
  self->FC.rightDistMatrix[1] = v98;
  objc_msgSend((id)objc_msgSend(v147, "objectAtIndexedSubscript:", 2), "floatValue");
  self->FC.rightDistMatrix[2] = v99;
  objc_msgSend((id)objc_msgSend(v147, "objectAtIndexedSubscript:", 3), "floatValue");
  self->FC.rightDistMatrix[3] = v100;
  self->S.iofffloat x = self->FC.FR.mincol;
  self->S.iofffloat y = self->FC.FR.minrow;
  float v101 = malloc_type_malloc(0x18uLL, 0x10200409093602BuLL);
  if (!v101)
  {
LABEL_37:
    LOBYTE(v53) = 0;
    return (char)v53;
  }
  v102 = v101;
  *float v101 = objc_msgSend((id)objc_msgSend(v51, "objectForKeyedSubscript:", @"counterClockwise"), "BOOLValue");
  *((_DWORD *)v102 + 1) = objc_msgSend((id)objc_msgSend(v51, "objectForKeyedSubscript:", @"nPoints"), "intValue");
  int v103 = objc_msgSend((id)objc_msgSend(v51, "objectForKeyedSubscript:", @"maxPoints"), "intValue");
  *((_DWORD *)v102 + 2) = v103;
  v104 = malloc_type_malloc(16 * v103, 0x1000040451B5BE8uLL);
  *((void *)v102 + 2) = v104;
  if (!v104)
  {
    free(v102);
    goto LABEL_37;
  }
  bzero(v104, 16 * *((int *)v102 + 2));
  if (*((int *)v102 + 1) >= 1)
  {
    uint64_t v105 = 0;
    uint64_t v106 = 0;
    do
    {
      float v107 = (void *)(*((void *)v102 + 2) + v105);
      -[CIRedEyeRepair3 globalBitmapPointWithDictionaryPointArray:](self, "globalBitmapPointWithDictionaryPointArray:", objc_msgSend(v148, "objectAtIndexedSubscript:", v106, v145));
      *float v107 = v108;
      v107[1] = v109;
      ++v106;
      v105 += 16;
    }
    while (v106 < *((int *)v102 + 1));
  }
  v110 = objc_msgSend(v53, "objectForKeyedSubscript:", @"downsampleType", v145);
  if (v110) {
    int v111 = [v110 intValue];
  }
  else {
    int v111 = 1;
  }
  self->S.downsampleType = v111;
  float v113 = (void *)[v53 objectForKeyedSubscript:@"downsampleOversizeX"];
  if (v113) {
    [v113 floatValue];
  }
  else {
    float v114 = 1.3;
  }
  self->S.downsampleOversizeX = v114;
  float v115 = (void *)[v53 objectForKeyedSubscript:@"downsampleOversizeY"];
  if (v115) {
    [v115 floatValue];
  }
  else {
    float v116 = 1.8;
  }
  self->S.downsampleOversizeY = v116;
  float v117 = (void *)[v53 objectForKeyedSubscript:@"gradientChannel"];
  if (v117) {
    int v118 = [v117 intValue];
  }
  else {
    int v118 = 6;
  }
  self->S.gradientChannel = v118;
  float v119 = (void *)[v53 objectForKeyedSubscript:@"edgeFindingChannel"];
  if (v119) {
    int v120 = [v119 intValue];
  }
  else {
    int v120 = 6;
  }
  self->S.edgeFindingChannel = v120;
  v121 = (void *)[v53 objectForKeyedSubscript:@"minMagnitude"];
  if (v121) {
    [v121 floatValue];
  }
  else {
    float v122 = 0.1;
  }
  self->S.minMagnitude = v122;
  v123 = (void *)[v53 objectForKeyedSubscript:@"regressionRadius"];
  if (v123) {
    [v123 floatValue];
  }
  else {
    float v124 = 2.5;
  }
  self->S.regressionRadius = v124;
  v125 = (void *)[v53 objectForKeyedSubscript:@"capture"];
  if (v125) {
    [v125 floatValue];
  }
  else {
    float v126 = 3.14;
  }
  self->S.capture = v126;
  v127 = (void *)[v53 objectForKeyedSubscript:@"alignmentTolerance"];
  if (v127) {
    [v127 floatValue];
  }
  else {
    float v128 = 0.72;
  }
  self->S.alignmentTolerance = v128;
  v129 = (void *)[v53 objectForKeyedSubscript:@"connectThreshold"];
  if (v129) {
    [v129 floatValue];
  }
  else {
    float v130 = 7.0;
  }
  self->S.connectThreshold = v130;
  v131 = (void *)[v53 objectForKeyedSubscript:@"faceIndex"];
  if (v131) {
    LODWORD(v131) = [v131 intValue];
  }
  self->S.faceIndefloat x = (int)v131;
  v132 = (void *)[v53 objectForKeyedSubscript:@"side"];
  if (v132) {
    LODWORD(v132) = [v132 intValue];
  }
  self->S.side = (int)v132;
  v133 = (void *)[v53 objectForKeyedSubscript:@"scale"];
  if (v133) {
    [v133 floatValue];
  }
  else {
    float v134 = 1.0;
  }
  self->S.scale = v134;
  v135 = (void *)[v53 objectForKeyedSubscript:@"IOD"];
  if (v135) {
    [v135 floatValue];
  }
  else {
    float v136 = 100.0;
  }
  self->S.IOD = v136;
  v137 = (void *)[v53 objectForKeyedSubscript:@"height"];
  if (v137) {
    int v138 = [v137 intValue];
  }
  else {
    int v138 = 3024;
  }
  self->S.int height = v138;
  objc_msgSend((id)objc_msgSend(v146, "objectAtIndexedSubscript:", 0), "floatValue");
  self->S.transform.a = v139;
  LOBYTE(v53) = 1;
  objc_msgSend((id)objc_msgSend(v146, "objectAtIndexedSubscript:", 1), "floatValue");
  self->S.transform.b = v140;
  objc_msgSend((id)objc_msgSend(v146, "objectAtIndexedSubscript:", 2), "floatValue");
  self->S.transform.c = v141;
  objc_msgSend((id)objc_msgSend(v146, "objectAtIndexedSubscript:", 3), "floatValue");
  self->S.transform.d = v142;
  objc_msgSend((id)objc_msgSend(v146, "objectAtIndexedSubscript:", 4), "floatValue");
  self->S.transform.tfloat x = v143;
  objc_msgSend((id)objc_msgSend(v146, "objectAtIndexedSubscript:", 5), "floatValue");
  self->S.transform.tfloat y = v144;
  *a4 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v102;
  return (char)v53;
}

- (BOOL)openRepairDictionary:(id)a3 convexHull:(id *)a4 facts:(id *)a5
{
  uint64_t v29 = 0;
  BOOL v7 = [(CIRedEyeRepair3 *)self unpackToGlobalRepairDictionary:a3 convexHull:&v29 facts:a5];
  if (v7)
  {
    uint64_t v9 = 0;
    v8.i64[0] = *(void *)&self->S.ioffx;
    int32x4_t v10 = vrev64q_s32(v8);
    int32x4_t v11 = vzip1q_s32(v10, v10);
    v12.i64[0] = v8.i32[0];
    v12.i64[1] = v8.i32[1];
    float64x2_t v13 = vcvtq_f64_s64(v12);
    self->FC.leftEye = (CGPoint)vsubq_f64((float64x2_t)self->FC.leftEye, v13);
    self->FC.rightEye = (CGPoint)vsubq_f64((float64x2_t)self->FC.rightEye, v13);
    float64x2_t v14 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v13.f64[0], 0);
    float64x2_t v15 = (float64x2_t)vdupq_laneq_s64((int64x2_t)v13, 1);
    do
    {
      float v16 = &self->FC.LPoly[v9];
      float64x2x2_t v30 = vld2q_f64(&v16->x);
      v32.val[0] = vsubq_f64(v30.val[0], v14);
      v32.val[1] = vsubq_f64(v30.val[1], v15);
      vst2q_f64(&v16->x, v32);
      float v17 = &self->FC.RPoly[v9];
      float64x2x2_t v31 = vld2q_f64(&v17->x);
      v32.val[0] = vsubq_f64(v31.val[0], v14);
      v32.val[1] = vsubq_f64(v31.val[1], v15);
      vst2q_f64(&v17->x, v32);
      v9 += 2;
    }
    while (v9 != 8);
    $2B11B063D4FF7ECB26AB90748407DBDB LR = self->FC.LR;
    self->FC.$2B11B063D4FF7ECB26AB90748407DBDB LR = ($2B11B063D4FF7ECB26AB90748407DBDB)vsubq_s32((int32x4_t)LR, v11);
    $2B11B063D4FF7ECB26AB90748407DBDB RR = self->FC.RR;
    self->FC.$2B11B063D4FF7ECB26AB90748407DBDB RR = ($2B11B063D4FF7ECB26AB90748407DBDB)vsubq_s32((int32x4_t)RR, v11);
    float v20 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v29;
    uint64_t v21 = *(unsigned int *)(v29 + 4);
    if ((int)v21 >= 1)
    {
      int mincol = LR.mincol;
      int side = self->S.side;
      if (side) {
        int mincol = RR.mincol;
      }
      double v24 = (double)mincol;
      int minrow = LR.minrow;
      if (side) {
        int minrow = RR.minrow;
      }
      uint64_t v26 = (double *)(*(void *)(v29 + 16) + 8);
      do
      {
        double v27 = *v26 - (double)minrow;
        *(v26 - 1) = *(v26 - 1) - v24;
        *uint64_t v26 = v27;
        v26 += 2;
        --v21;
      }
      while (v21);
    }
    *a4 = v20;
  }
  return v7;
}

- (CIRedEyeRepair3)initWithExternalBuffer:(char *)a3 subRectangle:(CGRect)a4 rowBytes:(unint64_t)a5 options:(id)a6
{
  int v7 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  self->repairMap.baseAddress = 0;
  self->faceBitmap.baseAddress = 0;
  self->repairs = 0;
  +[CIRedEyeRepair3 settingsWithOptions:a6];
  long long v14 = v32;
  *(_OWORD *)&self->S.transform.a = v31;
  *(_OWORD *)&self->S.transform.c = v14;
  *(_OWORD *)&self->S.transform.tdouble x = v33;
  *(void *)&self->S.double height = v34;
  long long v15 = v28;
  *(_OWORD *)&self->S.connectThreshold = v27;
  *(_OWORD *)&self->S.inputImageExtent.origin.double y = v15;
  long long v16 = v30;
  *(_OWORD *)&self->S.inputImageExtent.size.double height = v29;
  *(_OWORD *)&self->S.faceIndedouble x = v16;
  long long v17 = v24;
  *(_OWORD *)&self->S.xf = v23;
  *(_OWORD *)&self->S.ifdouble y = v17;
  long long v18 = v26;
  *(_OWORD *)&self->S.downsampleOversizeX = v25;
  *(_OWORD *)&self->S.minMagnitude = v18;
  self->repairs = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] array];
  uint64_t v19 = +[CIRedEyeRepair3 bitmapRectWithImageSubRectangle:settings:](CIRedEyeRepair3, "bitmapRectWithImageSubRectangle:settings:", &self->S, x, y, width, height);
  *(void *)&self->subRectangle.int minrow = v19;
  *(void *)&self->subRectangle.int mincol = v20;
  constructBitmap((uint64_t)&self->fullBitmap, (uint64_t)a3, HIDWORD(v20) - v20, HIDWORD(v19) - v19, 4, 1, v7, 100.0);
  if ([a6 objectForKeyedSubscript:@"inspector"]) {
    -[CIRedEyeRepair3 setInspector:](self, "setInspector:", [a6 objectForKeyedSubscript:@"inspector"]);
  }
  v22.receiver = self;
  v22.super_class = (Class)CIRedEyeRepair3;
  return [(CIRedEyeRepair3 *)&v22 init];
}

- (void)dealloc
{
  if (self->faceBitmap.baseAddress) {
    termBitmap((void **)&self->faceBitmap.baseAddress);
  }
  if (self->repairMap.baseAddress) {
    termBitmap((void **)&self->repairMap.baseAddress);
  }

  self->repairs = 0;
  v3.receiver = self;
  v3.super_class = (Class)CIRedEyeRepair3;
  [(CIRedEyeRepair3 *)&v3 dealloc];
}

+ (CGRect)supportRectangleWithRepair:(id)a3 imageSize:(CGSize)a4
{
  float width = a4.width;
  float height = a4.height;
  float v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"context"), "objectForKeyedSubscript:", @"faceRect");
  objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", 0), "floatValue");
  double v8 = rintf(v7 * width);
  objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", 1), "floatValue");
  double v10 = rintf(v9 * height);
  objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", 2), "floatValue");
  double v12 = rintf(v11 * width);
  objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", 3), "floatValue");
  double v14 = rintf(v13 * height);
  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  result.size.float height = v14;
  result.size.float width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

+ (CGRect)supportRectangleWithFaceArray:(id)a3 options:(id)a4
{
  uint64_t v20 = 0;
  memset(v19, 0, sizeof(v19));
  uint64_t v18 = 0;
  +[CIRedEyeRepair3 settingsWithOptions:](CIRedEyeRepair3, "settingsWithOptions:", a4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0);
  int v5 = [a3 count];
  int v6 = v5;
  if (!v5)
  {
LABEL_10:
    double v12 = *MEMORY[0x1E4F1DB20];
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    goto LABEL_13;
  }
  if (v5 >= 1)
  {
    uint64_t v7 = 0;
    LODWORD(v8) = 0;
    LODWORD(v9) = 0;
    uint64_t v10 = 0;
    while (1)
    {
      LODWORD(v17) = v10;
      if (+[CIRedEyeRepair3 faceContext:v19 withFaceArray:a3 index:v10 settings:&v16])
      {
        goto LABEL_10;
      }
      if (v10)
      {
        unint64_t v9 = unionBitmapRects(v9 | ((unint64_t)v8 << 32), v7, *(uint64_t *)&v19[0]);
        uint64_t v7 = v11;
      }
      else
      {
        uint64_t v7 = *((void *)&v19[0] + 1);
        unint64_t v9 = *(void *)&v19[0];
      }
      unint64_t v8 = HIDWORD(v9);
      uint64_t v10 = (v10 + 1);
      if (v6 == v10) {
        goto LABEL_12;
      }
    }
  }
  LODWORD(v9) = 0;
  LODWORD(v8) = 0;
  uint64_t v7 = 0;
LABEL_12:
  double v12 = (double)(int)v7;
  double v13 = (double)((int)v18 - (int)v8);
  double v14 = (double)(HIDWORD(v7) - (int)v7);
  double v15 = (double)((int)v8 - (int)v9);
LABEL_13:
  result.size.float height = v15;
  result.size.float width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGAffineTransform)inverseImageTransformForOrientation:(SEL)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  float xf = self->S.xf;
  if (a4 <= 4) {
    float yf = self->S.xf;
  }
  else {
    float yf = self->S.yf;
  }
  if (a4 <= 4) {
    float xf = self->S.yf;
  }
  v12[0] = 0x3FF0000000000000;
  v12[1] = 0;
  v12[2] = 0;
  v12[3] = 0x3FF0000000000000;
  v12[4] = 0;
  v12[5] = 0;
  v12[6] = 0xBFF0000000000000;
  v12[7] = 0;
  v12[8] = 0;
  v12[9] = 0x3FF0000000000000;
  *(double *)&v12[10] = yf;
  long long v13 = xmmword_193953160;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  unint64_t v16 = 0xBFF0000000000000;
  double v17 = yf;
  double v18 = xf;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v19 = 0x3FF0000000000000;
  long long v22 = xmmword_193951E50;
  long long v24 = xmmword_193953160;
  long long v25 = xmmword_193951E50;
  double v23 = xf;
  double v26 = xf;
  double v27 = yf;
  long long v28 = xmmword_193953160;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v29 = 0x3FF0000000000000;
  double v32 = yf;
  long long v33 = xmmword_193953170;
  long long v36 = 0u;
  long long v35 = 0u;
  uint64_t v34 = 0x3FF0000000000000;
  uint64_t v37 = 0x3FF0000000000000;
  long long v38 = xmmword_193951E50;
  double v39 = xf;
  uint64_t v40 = 0;
  if ((a4 - 9) >= 0xFFFFFFF8) {
    int v6 = a4 - 1;
  }
  else {
    int v6 = 0;
  }
  uint64_t v7 = (long long *)&v12[6 * v6];
  long long v8 = v7[2];
  long long v9 = *v7;
  *(_OWORD *)&v11.c = v7[1];
  *(_OWORD *)&v11.tdouble x = v8;
  *(_OWORD *)&v11.a = v9;
  return CGAffineTransformInvert(retstr, &v11);
}

- (void)printFaceArray
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  int v3 = [(NSArray *)self->faceArray count];
  if (v3 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = v3;
    do
    {
      id v6 = [(NSArray *)self->faceArray objectAtIndexedSubscript:v4];
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"leftEyeX"), "floatValue");
      float v8 = v7;
      double v9 = v7;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"leftEyeY"), "floatValue");
      float v11 = v10;
      double v12 = v10;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"rightEyeX"), "floatValue");
      float v14 = v13;
      double v15 = v13;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"rightEyeY"), "floatValue");
      float v17 = v16;
      double v18 = v16;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"mouthCenterX"), "floatValue");
      float v70 = v19;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"mouthCenterY"), "floatValue");
      float v68 = v20;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"centerX"), "floatValue");
      float v66 = v21;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"centerY"), "floatValue");
      float v64 = v22;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"noseBridgeX"), "floatValue");
      float v71 = v23;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"noseBridgeY"), "floatValue");
      float v69 = v24;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"noseTipX"), "floatValue");
      float v67 = v25;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"noseTipY"), "floatValue");
      float v65 = v26;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"leftEyeLeftX"), "floatValue");
      float v63 = v27;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"leftEyeLeftY"), "floatValue");
      float v62 = v28;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"leftEyelidUpperX"), "floatValue");
      float v61 = v29;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"leftEyelidUpperY"), "floatValue");
      float v60 = v30;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"leftEyeRightX"), "floatValue");
      float v58 = v31;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"leftEyeRightY"), "floatValue");
      float v56 = v32;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"leftEyelidLowerX"), "floatValue");
      float v54 = v33;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"leftEyelidLowerY"), "floatValue");
      float v52 = v34;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"rightEyeLeftX"), "floatValue");
      float v59 = v35;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"rightEyeLeftY"), "floatValue");
      float v57 = v36;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"rightEyelidUpperX"), "floatValue");
      float v55 = v37;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"rightEyelidUpperY"), "floatValue");
      float v53 = v38;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"rightEyeRightX"), "floatValue");
      float v51 = v39;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"rightEyeRightY"), "floatValue");
      float v50 = v40;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"rightEyelidLowerX"), "floatValue");
      float v49 = v41;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"rightEyelidLowerY"), "floatValue");
      float v48 = v42;
      snprintf(__str, 0x100uLL, "face %d   left (%.1f, %.1f) right (%.1f, %.1f) IOD %.1f", ++v4, v9, v12, v15, v18, sqrtf((float)((float)(v17 - v11) * (float)(v17 - v11)) + (float)((float)(v14 - v8) * (float)(v14 - v8))));
      uint64_t v43 = ci_logger_render();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        CGFloat v73 = __str;
        _os_log_debug_impl(&dword_193671000, v43, OS_LOG_TYPE_DEBUG, "%s\n", buf, 0xCu);
      }
      if (self->printFaceArrayLevel >= 2)
      {
        snprintf(__str, 0x100uLL, "face %d   mouth (%.1f, %.1f) center (%.1f, %.1f)", v4, v70, v68, v66, v64);
        uint64_t v44 = ci_logger_render();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          CGFloat v73 = __str;
          _os_log_debug_impl(&dword_193671000, v44, OS_LOG_TYPE_DEBUG, "%s\n", buf, 0xCu);
        }
        snprintf(__str, 0x100uLL, "face %d   nose bridge (%.1f, %.1f) tip (%.1f, %.1f)", v4, v71, v69, v67, v65);
        uint64_t v45 = ci_logger_render();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          CGFloat v73 = __str;
          _os_log_debug_impl(&dword_193671000, v45, OS_LOG_TYPE_DEBUG, "%s\n", buf, 0xCu);
        }
        if (self->printFaceArrayLevel >= 3)
        {
          snprintf(__str, 0x100uLL, "face %d   left eye l (%.1f, %.1f) u (%.1f, %.1f) r (%.1f, %.1f) d (%.1f, %.1f)", v4, v63, v62, v61, v60, v58, v56, v54, v52);
          uint64_t v46 = ci_logger_render();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            CGFloat v73 = __str;
            _os_log_debug_impl(&dword_193671000, v46, OS_LOG_TYPE_DEBUG, "%s\n", buf, 0xCu);
          }
          snprintf(__str, 0x100uLL, "face %d   right eye l (%.1f, %.1f) u (%.1f, %.1f) r (%.1f, %.1f) d (%.1f, %.1f)", v4, v59, v57, v55, v53, v51, v50, v49, v48);
          uint64_t v47 = ci_logger_render();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            CGFloat v73 = __str;
            _os_log_debug_impl(&dword_193671000, v47, OS_LOG_TYPE_DEBUG, "%s\n", buf, 0xCu);
          }
        }
      }
    }
    while (v5 != v4);
  }
}

- (void)autoRepairWithFaceArray:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  self->faceArradouble y = (NSArray *)a3;
  int v4 = [a3 count];
  if (self->printFaceArrayLevel >= 1) {
    [(CIRedEyeRepair3 *)self printFaceArray];
  }

  uint64_t v5 = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] array];
  self->failureCauses = v5;
  if (v4)
  {
    if (v4 >= 1)
    {
      uint64_t v6 = 0;
      p_S = &self->S;
      while (1)
      {
        self->S.faceIndedouble x = v6;
        uint64_t v7 = [(CIRedEyeRepair3 *)self updateWithFaceIndex:v6];
        if (v7) {
          break;
        }
        if (self->S.IOD < 54.0)
        {
          failureCauses = self->failureCauses;
          id v9 = (id)objc_msgSend(NSString, "stringWithFormat:", @"red-eye correction was prevented: (face %d) features too small to resolve properly", (v6 + 1));
          goto LABEL_10;
        }
        initBitmap((uint64_t)&self->faceBitmap, self->FC.FR.maxcol - self->FC.FR.mincol, self->FC.FR.maxrow - self->FC.FR.minrow, 4, 1, 100.0);
        if (self->faceBitmap.baseAddress)
        {
          unint64_t v10 = offsetBitmapRect(*(void *)&self->FC.FR.minrow, *(void *)&self->FC.FR.mincol, -self->subRectangle.mincol, -self->subRectangle.minrow);
          copySliceOfBitmapToBitmap((int *)&self->fullBitmap, &self->faceBitmap.baseAddress, v10, v11);
          [(CIRedEyeRepair3 *)self gatherFaceStatistics:&self->M];
          inspector = self->inspector;
          if (inspector) {
            [(RedEyeInspector3 *)inspector getFaceStatistics:&self->M];
          }
          *(void *)&v45[0] = 0;
          id v46 = 0;
          uint64_t v13 = [(CIRedEyeRepair3 *)self repairDictionary:v45 withEyeIndex:0];
          uint64_t v14 = [(CIRedEyeRepair3 *)self repairDictionary:&v46 withEyeIndex:1];
          float v15 = 0.0;
          float v16 = 0.0;
          float v17 = 0.0;
          float v18 = 0.0;
          float v19 = 0.0;
          if (!v13)
          {
            objc_msgSend((id)objc_msgSend(*(id *)&v45[0], "objectForKeyedSubscript:", @"xPosition"), "floatValue");
            float v16 = v20;
            objc_msgSend((id)objc_msgSend(*(id *)&v45[0], "objectForKeyedSubscript:", @"hue"), "floatValue");
            float v17 = v21;
            objc_msgSend((id)objc_msgSend(*(id *)&v45[0], "objectForKeyedSubscript:", @"saturation"), "floatValue");
            float v18 = v22;
            objc_msgSend((id)objc_msgSend(*(id *)&v45[0], "objectForKeyedSubscript:", @"luminance"), "floatValue");
            float v19 = v23;
          }
          float v24 = 0.0;
          float v25 = 0.0;
          float v26 = 0.0;
          if (!v14)
          {
            objc_msgSend((id)objc_msgSend(v46, "objectForKeyedSubscript:", @"xPosition"), "floatValue");
            float v15 = v27;
            objc_msgSend((id)objc_msgSend(v46, "objectForKeyedSubscript:", @"hue"), "floatValue");
            float v24 = v28;
            objc_msgSend((id)objc_msgSend(v46, "objectForKeyedSubscript:", @"saturation"), "floatValue");
            float v25 = v29;
            objc_msgSend((id)objc_msgSend(v46, "objectForKeyedSubscript:", @"luminance"), "floatValue");
            float v26 = v30;
          }
          float v31 = self->inspector;
          if (!v31) {
            goto LABEL_26;
          }
          [(RedEyeInspector3 *)v31 getIdentifyingString:&v47 settings:p_S];
          if (v13 && v14) {
            goto LABEL_29;
          }
          printf("%s ", (const char *)&v47);
          if (v13)
          {
            if (v14) {
              goto LABEL_25;
            }
LABEL_64:
            printf("R[xp %.3f hue %.3f sat %.3f lum %.1f] ", v15, v24, v25, v26);
          }
          else
          {
            printf("L[xp %.3f hue %.3f sat %.3f lum %.1f] ", v16, v17, v18, v19);
            if (!v14) {
              goto LABEL_64;
            }
          }
LABEL_25:
          putchar(10);
LABEL_26:
          if (!v13)
          {
            double v35 = v17;
            if (v17 <= 0.384 || v35 >= 0.426 || v18 >= 0.3 || v18 <= 0.118 || v19 <= 100.0 || fabsf(v16) <= 0.075)
            {
              uint64_t v13 = 0;
              if (v17 >= 0.75) {
                goto LABEL_27;
              }
              if (v35 <= 0.64) {
                goto LABEL_27;
              }
              if (v19 <= 190.0) {
                goto LABEL_27;
              }
              float v36 = self->inspector;
              uint64_t v13 = 61;
              if (!v36) {
                goto LABEL_27;
              }
              float v37 = "%s (L) prevent shine repair\n";
            }
            else
            {
              float v36 = self->inspector;
              uint64_t v13 = 60;
              if (!v36) {
                goto LABEL_27;
              }
              float v37 = "%s (L) prevent sclera repair\n";
            }
            [(RedEyeInspector3 *)v36 getIdentifyingString:&v47 settings:p_S];
            printf(v37, &v47);
          }
LABEL_27:
          if (!v14)
          {
            double v38 = v24;
            if (v24 <= 0.384 || v38 >= 0.426 || v25 >= 0.3 || v25 <= 0.118 || v26 <= 100.0 || fabsf(v15) <= 0.075)
            {
              uint64_t v14 = 0;
              if (v24 >= 0.75) {
                goto LABEL_28;
              }
              if (v38 <= 0.64) {
                goto LABEL_28;
              }
              if (v26 <= 190.0) {
                goto LABEL_28;
              }
              float v39 = self->inspector;
              uint64_t v14 = 61;
              if (!v39) {
                goto LABEL_28;
              }
              float v40 = "%s (R) prevent shine repair\n";
            }
            else
            {
              float v39 = self->inspector;
              uint64_t v14 = 60;
              if (!v39) {
                goto LABEL_28;
              }
              float v40 = "%s (R) prevent sclera repair\n";
            }
            [(RedEyeInspector3 *)v39 getIdentifyingString:&v47 settings:p_S];
            printf(v40, &v47);
          }
LABEL_28:
          if (v13)
          {
LABEL_29:
            float v32 = self->failureCauses;
            id v33 = [(CIRedEyeRepair3 *)self stringWithRER3Error:v13];
            repairs = v32;
          }
          else
          {
            repairs = self->repairs;
            id v33 = *(id *)&v45[0];
          }
          [(NSMutableArray *)repairs addObject:v33];
          if (v14)
          {
            float v41 = self->failureCauses;
            id v42 = [(CIRedEyeRepair3 *)self stringWithRER3Error:v14];
            uint64_t v43 = v41;
          }
          else
          {
            uint64_t v43 = self->repairs;
            id v42 = v46;
          }
          [(NSMutableArray *)v43 addObject:v42];
          termBitmap((void **)&self->faceBitmap.baseAddress);
          self->faceBitmap.baseAddress = 0;
        }
LABEL_11:
        uint64_t v6 = (v6 + 1);
        if (v4 == v6) {
          goto LABEL_66;
        }
      }
      failureCauses = self->failureCauses;
      id v9 = [(CIRedEyeRepair3 *)self stringWithRER3Error:v7];
LABEL_10:
      [(NSMutableArray *)failureCauses addObject:v9];
      goto LABEL_11;
    }
  }
  else
  {
    -[NSMutableArray addObject:](v5, "addObject:", [NSString stringWithFormat:@"red-eye correction was prevented: no face detected"]);
    if (!self->S.forceFail) {
      return;
    }
  }
LABEL_66:
  if (self->S.orientation != 1)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v47 = 0u;
    -[CIRedEyeRepair3 inverseImageTransformForOrientation:](self, "inverseImageTransformForOrientation:");
    v45[0] = v47;
    v45[1] = v48;
    v45[2] = v49;
    [(CIRedEyeRepair3 *)self transformRepairArray:v45];
  }
}

- (id)repairWithSide:(int)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  repairs = self->repairs;
  uint64_t v6 = [(NSMutableArray *)repairs countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v16;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v16 != v8) {
      objc_enumerationMutation(repairs);
    }
    unint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
    int v11 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", @"rf"), "intValue");
    int v12 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", @"re"), "intValue");
    if (v11 == self->S.faceIndex && v12 == a3) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [(NSMutableArray *)repairs countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)mutableCopyOfArray:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = 0;
    uint64_t v3 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:&v7];
    if (v3)
    {
      int v4 = (void *)[MEMORY[0x1E4F28F98] propertyListWithData:v3 options:1 format:0 error:&v7];
      if (v4) {
        return v4;
      }
    }
    uint64_t v6 = (void *)[v7 localizedDescription];
    objc_msgSend(v6, "getCString:maxLength:encoding:", v8, 128, objc_msgSend(NSString, "defaultCStringEncoding"));
    printf("mutableCopyOfArray: %s\n", v8);
  }
  return 0;
}

- (CGPoint)leftHandedTransform:(CGAffineTransform *)a3 ofPoint:(CGPoint)a4
{
  if (a3->a != 0.0)
  {
    double d = a3->d;
    goto LABEL_5;
  }
  double d = a3->d;
  if (d != 0.0)
  {
LABEL_5:
    float yf = self->S.yf;
    float xf = yf;
    goto LABEL_6;
  }
  float yf = self->S.yf;
  float xf = self->S.xf;
LABEL_6:
  CGFloat v7 = yf - a4.y;
  CGFloat v8 = a3->tx + v7 * a3->c + a3->a * a4.x;
  double v9 = xf - (a3->ty + v7 * d + a3->b * a4.x);
  double v10 = v8;
  result.double y = v9;
  result.double x = v10;
  return result;
}

- (void)transformGlobalsWithTransform:(CGAffineTransform *)a3
{
  double mincol = (double)self->FC.FR.mincol;
  double minrow = (double)self->FC.FR.minrow;
  double maxcol = (double)self->FC.FR.maxcol;
  double maxrow = (double)self->FC.FR.maxrow;
  long long v9 = *(_OWORD *)&a3->c;
  long long v58 = *(_OWORD *)&a3->a;
  long long v59 = v9;
  long long v60 = *(_OWORD *)&a3->tx;
  -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", &v58, mincol, minrow);
  double v11 = v10;
  double v13 = v12;
  long long v14 = *(_OWORD *)&a3->c;
  long long v58 = *(_OWORD *)&a3->a;
  long long v59 = v14;
  long long v60 = *(_OWORD *)&a3->tx;
  -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", &v58, maxcol, maxrow);
  float v15 = v11;
  *(float *)&double v16 = v16;
  self->FC.FR.double mincol = (int)rintf(fminf(v15, *(float *)&v16));
  self->FC.FR.double maxcol = (int)rintf(fmaxf(v15, *(float *)&v16));
  *(float *)&double v16 = v13;
  *(float *)&double v17 = v17;
  self->FC.FR.double minrow = (int)rintf(fminf(*(float *)&v16, *(float *)&v17));
  self->FC.FR.double maxrow = (int)rintf(fmaxf(*(float *)&v16, *(float *)&v17));
  long long v18 = *(_OWORD *)&a3->c;
  long long v58 = *(_OWORD *)&a3->a;
  long long v59 = v18;
  long long v60 = *(_OWORD *)&a3->tx;
  -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", &v58, self->FC.leftEye.x, self->FC.leftEye.y);
  self->FC.leftEye.double x = v19;
  self->FC.leftEye.double y = v20;
  long long v21 = *(_OWORD *)&a3->c;
  long long v58 = *(_OWORD *)&a3->a;
  long long v59 = v21;
  long long v60 = *(_OWORD *)&a3->tx;
  -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", &v58, self->FC.rightEye.x, self->FC.rightEye.y);
  self->FC.rightEye.double x = v22;
  self->FC.rightEye.double y = v23;
  for (uint64_t i = 184; i != 312; i += 16)
  {
    float v25 = (char *)self + i;
    long long v26 = *(_OWORD *)&a3->c;
    long long v58 = *(_OWORD *)&a3->a;
    long long v59 = v26;
    long long v60 = *(_OWORD *)&a3->tx;
    -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", &v58, *(double *)((char *)&self->super.isa + i), *(double *)((char *)&self->inspector + i));
    *(void *)float v25 = v27;
    *((void *)v25 + 1) = v28;
    long long v29 = *(_OWORD *)&a3->c;
    long long v58 = *(_OWORD *)&a3->a;
    long long v59 = v29;
    long long v60 = *(_OWORD *)&a3->tx;
    -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", &v58, *((double *)v25 + 16), *((double *)v25 + 17));
    *((void *)v25 + 16) = v30;
    *((void *)v25 + 17) = v31;
  }
  double v32 = (double)self->FC.LR.mincol;
  double v33 = (double)self->FC.LR.minrow;
  double v34 = (double)self->FC.LR.maxcol;
  double v35 = (double)self->FC.LR.maxrow;
  long long v36 = *(_OWORD *)&a3->c;
  long long v58 = *(_OWORD *)&a3->a;
  long long v59 = v36;
  long long v60 = *(_OWORD *)&a3->tx;
  -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", &v58, v32, v33);
  double v38 = v37;
  double v40 = v39;
  long long v41 = *(_OWORD *)&a3->c;
  long long v58 = *(_OWORD *)&a3->a;
  long long v59 = v41;
  long long v60 = *(_OWORD *)&a3->tx;
  -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", &v58, v34, v35);
  float v42 = v38;
  *(float *)&double v43 = v43;
  self->FC.LR.double mincol = (int)rintf(fminf(v42, *(float *)&v43));
  self->FC.LR.double maxcol = (int)rintf(fmaxf(v42, *(float *)&v43));
  *(float *)&double v43 = v40;
  *(float *)&double v44 = v44;
  self->FC.LR.double minrow = (int)rintf(fminf(*(float *)&v43, *(float *)&v44));
  self->FC.LR.double maxrow = (int)rintf(fmaxf(*(float *)&v43, *(float *)&v44));
  double v45 = (double)self->FC.RR.mincol;
  double v46 = (double)self->FC.RR.minrow;
  double v47 = (double)self->FC.RR.maxcol;
  double v48 = (double)self->FC.RR.maxrow;
  long long v49 = *(_OWORD *)&a3->c;
  long long v58 = *(_OWORD *)&a3->a;
  long long v59 = v49;
  long long v60 = *(_OWORD *)&a3->tx;
  -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", &v58, v45, v46);
  double v51 = v50;
  double v53 = v52;
  long long v54 = *(_OWORD *)&a3->c;
  long long v58 = *(_OWORD *)&a3->a;
  long long v59 = v54;
  long long v60 = *(_OWORD *)&a3->tx;
  -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", &v58, v47, v48);
  float v55 = v51;
  *(float *)&double v56 = v56;
  self->FC.RR.double mincol = (int)rintf(fminf(v55, *(float *)&v56));
  self->FC.RR.double maxcol = (int)rintf(fmaxf(v55, *(float *)&v56));
  *(float *)&double v56 = v53;
  *(float *)&double v57 = v57;
  self->FC.RR.double minrow = (int)rintf(fminf(*(float *)&v56, *(float *)&v57));
  self->FC.RR.double maxrow = (int)rintf(fmaxf(*(float *)&v56, *(float *)&v57));
}

- (void)transformConvexHull:(id *)a3 withTransform:(CGAffineTransform *)a4
{
  if (a3->var1 >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    do
    {
      long long v9 = &a3->var3[v7];
      long long v10 = *(_OWORD *)&a4->c;
      v13[0] = *(_OWORD *)&a4->a;
      v13[1] = v10;
      v13[2] = *(_OWORD *)&a4->tx;
      -[CIRedEyeRepair3 leftHandedTransform:ofPoint:](self, "leftHandedTransform:ofPoint:", v13, v9->x, v9->y);
      v9->double x = v11;
      v9->double y = v12;
      ++v8;
      ++v7;
    }
    while (v8 < a3->var1);
  }
}

- (int)transformRepairArray:(CGAffineTransform *)a3
{
  int v5 = [(NSMutableArray *)self->repairs count];
  BOOL v6 = a3->a == 0.0 && a3->d == 0.0;
  if (v5 < 1) {
    return 0;
  }
  uint64_t v7 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  memset(v20, 0, sizeof(v20));
  int v21 = 0;
  p_size = &self->S.inputImageExtent.size;
  uint64_t v9 = v5;
  float32x2_t v10 = 0;
  float yf = 0.0;
  float xf = 0.0;
  while ([(CIRedEyeRepair3 *)self unpackToGlobalRepairDictionary:[(NSMutableArray *)self->repairs objectAtIndexedSubscript:v7] convexHull:&v23 facts:v20])
  {
    long long v13 = *(_OWORD *)&a3->c;
    long long v17 = *(_OWORD *)&a3->a;
    long long v18 = v13;
    long long v19 = *(_OWORD *)&a3->tx;
    [(CIRedEyeRepair3 *)self transformGlobalsWithTransform:&v17];
    long long v14 = *(_OWORD *)&a3->c;
    long long v17 = *(_OWORD *)&a3->a;
    long long v18 = v14;
    long long v19 = *(_OWORD *)&a3->tx;
    [(CIRedEyeRepair3 *)self transformConvexHull:v23 withTransform:&v17];
    if (v6)
    {
      float xf = self->S.xf;
      float yf = self->S.yf;
      float32x2_t v10 = vcvt_f32_f64(*(float64x2_t *)p_size);
      self->S.float yf = xf;
      self->S.float xf = yf;
      self->S.float xfi = 1.0 / yf;
      self->S.float yfi = 1.0 / xf;
      self->S.ifdouble y = (float)(uint64_t)rintf(xf);
      int8x16_t v15 = (int8x16_t)vcvtq_f64_f32(v10);
      *(int8x16_t *)p_size = vextq_s8(v15, v15, 8uLL);
    }
    int result = [(CIRedEyeRepair3 *)self packGlobalRepairDictionary:&v22 withConvexHull:v23 facts:v20];
    if (result) {
      return result;
    }
    [(NSMutableArray *)self->repairs replaceObjectAtIndex:v7 withObject:v22];
    if (v6)
    {
      self->S.float yf = yf;
      self->S.float xf = xf;
      self->S.float xfi = 1.0 / xf;
      self->S.float yfi = 1.0 / yf;
      self->S.ifdouble y = (float)(uint64_t)rintf(yf);
      *(float64x2_t *)p_size = vcvtq_f64_f32(v10);
    }
    if (v9 == ++v7) {
      return 0;
    }
  }
  return 1;
}

- (id)repairArray
{
  id v2 = [(CIRedEyeRepair3 *)self mutableCopyOfArray:self->repairs];

  return v2;
}

- (id)stringWithRER3Error:(int)a3
{
  if ((a3 - 1) > 0x3C) {
    uint64_t v3 = "unknown error code";
  }
  else {
    uint64_t v3 = off_1E5772B60[a3 - 1];
  }
  return (id)[NSString stringWithCString:v3 encoding:30];
}

- (void)executeRepair:(id)a3
{
  self->failureCauses = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [(CIRedEyeRepair3 *)self executeRepairWithRepairDictionary:a3];
  if (v5)
  {
    failureCauses = self->failureCauses;
    id v7 = [(CIRedEyeRepair3 *)self stringWithRER3Error:v5];
    [(NSMutableArray *)failureCauses addObject:v7];
  }
}

- (void)magnitudeMap:(id *)a3 fromGabor:(id *)a4
{
  int var2 = a4->var2;
  if (var2 >= 1)
  {
    int v5 = 0;
    int var1 = a4->var1;
    uint64_t var6 = a3->var6;
    uint64_t var3 = a3->var3;
    var0 = a3->var0;
    float32x2_t v10 = a4->var0;
    uint64_t v11 = 4 * a4->var3;
    uint64_t v12 = 4 * a4->var6;
    do
    {
      if (var1 >= 1)
      {
        int v13 = var1;
        uint64_t v14 = 8;
        int8x16_t v15 = var0;
        do
        {
          *int8x16_t v15 = (int)(float)(*(float *)&v10[v14] * 255.0);
          v15 += var6;
          v14 += v12;
          --v13;
        }
        while (v13);
      }
      ++v5;
      var0 += var3;
      v10 += v11;
    }
    while (v5 != var2);
  }
}

- (void)condenseFourChannelRecognitionMap:(id *)a3 intoOneChanneMap:(id *)a4
{
  bzero(a4->var0, a4->var5);
  int var2 = a3->var2;
  if (var2 >= 1)
  {
    int v7 = 0;
    int var1 = a3->var1;
    uint64_t var6 = a4->var6;
    uint64_t var3 = a4->var3;
    var0 = a4->var0;
    uint64_t v12 = a3->var6;
    uint64_t v13 = a3->var3;
    uint64_t v14 = a3->var0;
    do
    {
      if (var1 >= 1)
      {
        int v15 = var1;
        double v16 = var0;
        long long v17 = v14;
        do
        {
          *double v16 = *v17;
          v17 += v12;
          v16 += var6;
          --v15;
        }
        while (v15);
      }
      ++v7;
      v14 += v13;
      var0 += var3;
    }
    while (v7 != var2);
  }
}

- (int)initShapePoints:(id *)a3 withMaxPoints:(int)a4
{
  BOOL v6 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(48 * a4, 0x1000040EED21634uLL);
  a3->int var2 = v6;
  if (!v6) {
    return 29;
  }
  int result = 0;
  a3->var0 = 0;
  a3->int var1 = a4;
  return result;
}

- (int)addPoint:(CGPoint)a3 toShapePoints:(id *)a4
{
  int var0 = a4->var0;
  if (a4->var0 >= a4->var1) {
    return 30;
  }
  int result = 0;
  BOOL v6 = (char *)a4->var2 + 48 * var0;
  *(CGPoint *)BOOL v6 = a3;
  *((void *)v6 + 2) = 0;
  *((_DWORD *)v6 + 6) = 0;
  a4->int var0 = var0 + 1;
  return result;
}

- (void)termShapePoints:(id *)a3
{
  *(void *)&a3->int var0 = 0;
  a3->int var2 = 0;
}

- (int)copyShape:(id *)a3 into:(id *)a4 transform:(CGAffineTransform *)a5 height:(int)a6
{
  long long v10 = *(_OWORD *)&a3->var3;
  *(_OWORD *)&a4->int var0 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&a4->uint64_t var3 = v10;
  a4->int var2 = 0;
  uint64_t v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(48 * a3->var0, 0x1000040EED21634uLL);
  a4->int var2 = v11;
  if (!v11) {
    return 31;
  }
  memmove(v11, a3->var2, 48 * a3->var0);
  int var0 = a4->var0;
  a4->int var1 = a4->var0;
  if (var0 >= 1)
  {
    int var2 = a4->var2;
    do
    {
      double v14 = (float)a6 - *((double *)var2 + 1);
      double v15 = *(double *)var2 + 0.5;
      *(double *)int var2 = v15;
      *((double *)var2 + 1) = v14;
      *(float64x2_t *)int var2 = vaddq_f64(*(float64x2_t *)&a5->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a5->c, v14), *(float64x2_t *)&a5->a, v15));
      int var2 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var2 + 48);
      --var0;
    }
    while (var0);
  }
  return 0;
}

- (BOOL)initGridWithBitmap:(id *)a3 scale:(int)a4
{
  int v4 = (a3->var1 + a4 - 1) / a4;
  p_G = &self->G;
  int v6 = (a3->var2 + a4 - 1) / a4;
  self->G.uint64_t width = v4;
  self->G.int height = v6;
  self->G.scaleFactor = 1.0 / (float)a4;
  int v7 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(8 * v6 * v4, 0x100004000313F17uLL);
  p_G->gridouble d = v7;
  if (v7)
  {
    p_G->maxPoints = 500;
    uint64_t v8 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(0xBB80uLL, 0x1000040565EDBD2uLL);
    p_G->points = v8;
    if (v8)
    {
      __memset_chk();
      p_G->nPoints = 0;
      int height = p_G->height;
      if (height >= 1)
      {
        gridouble d = p_G->grid;
        uint64_t width = p_G->width;
        do
        {
          if ((int)width >= 1)
          {
            memset(grid, 255, 8 * width);
            gridouble d = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)grid + 8 * (width - 1) + 8);
          }
          --height;
        }
        while (height);
      }
      p_G->nextNetNumber = 1;
      p_G->maxThreads = 200;
      uint64_t v12 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(0x4B00uLL, 0x1000040DB95C216uLL);
      p_G->threads = v12;
      if (v12)
      {
        __memset_chk();
        p_G->nThreads = 0;
        p_G->maxShapes = 20;
        uint64_t v13 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(0x280uLL, 0x1020040A150DD5AuLL);
        p_G->shapes = v13;
        if (v13)
        {
          __memset_chk();
          p_G->nShapes = 0;
          LOBYTE(v7) = 1;
          return (char)v7;
        }
        free(p_G->threads);
        p_G->threads = 0;
      }
      free(p_G->points);
      p_G->points = 0;
    }
    free(p_G->grid);
    LOBYTE(v7) = 0;
    p_G->gridouble d = 0;
  }
  return (char)v7;
}

- (void)termGrid
{
  p_G = &self->G;
  free(self->G.grid);
  p_G->gridouble d = 0;
  free(p_G->points);
  p_G->points = 0;
  free(p_G->threads);
  p_G->threads = 0;
  shapes = p_G->shapes;
  if (p_G->nShapes >= 1)
  {
    int v5 = 0;
    do
    {
      [(CIRedEyeRepair3 *)self termShapePoints:shapes];
      ++v5;
      shapes = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)shapes + 32);
    }
    while (v5 < p_G->nShapes);
    shapes = p_G->shapes;
  }
  free(shapes);
  p_G->shapes = 0;
}

- (void)point:(CGPoint)a3 toGridRow:(int *)a4 column:(int *)a5
{
  double scaleFactor = self->G.scaleFactor;
  int v6 = vcvtmd_s64_f64(a3.y * scaleFactor);
  if (v6 < 0)
  {
    int v6 = 0;
  }
  else
  {
    int height = self->G.height;
    if (height <= v6) {
      int v6 = height - 1;
    }
  }
  signed int v8 = vcvtmd_s64_f64(a3.x * scaleFactor);
  if (v8 < 0)
  {
    int v10 = 0;
  }
  else
  {
    int width = self->G.width;
    if (width <= v8) {
      int v10 = width - 1;
    }
    else {
      int v10 = v8;
    }
  }
  *a4 = v6;
  *a5 = v10;
}

- (int)insertPoint:(CGPoint)a3 andDirection:(CGPoint)a4 intoGrid:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  p_G = &self->G;
  int nPoints = self->G.nPoints;
  int maxPoints = self->G.maxPoints;
  if (nPoints >= maxPoints)
  {
    double v15 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(96 * maxPoints + 19200, 0x1000040565EDBD2uLL);
    if (!v15) {
      return 19;
    }
    points = v15;
    memmove(v15, p_G->points, 96 * p_G->nPoints);
    free(p_G->points);
    p_G->points = points;
    int nPoints = p_G->nPoints;
    p_G->maxPoints += 200;
  }
  else
  {
    points = self->G.points;
  }
  uint64_t v22 = 0;
  p_G->int nPoints = nPoints + 1;
  double v16 = (double *)((char *)points + 96 * nPoints);
  if (v5)
  {
    -[CIRedEyeRepair3 point:toGridRow:column:](self, "point:toGridRow:column:", (char *)&v22 + 4, &v22, v9, v8);
    long long v17 = (int *)((char *)p_G->grid + 8 * (int)v22 + 8 * p_G->width * HIDWORD(v22));
    int v18 = *v17;
  }
  else
  {
    long long v17 = 0;
    int v18 = -1;
  }
  int result = 0;
  CGFloat v20 = (char *)points + 96 * nPoints;
  *((_DWORD *)v20 + 16) = v18;
  *double v16 = v9;
  v16[1] = v8;
  *((CGFloat *)v20 + 2) = x;
  *((CGFloat *)v20 + 3) = y;
  *(void *)(v20 + 68) = -1;
  int nextNetNumber = p_G->nextNetNumber;
  *((_DWORD *)v20 + 19) = 0;
  *((_DWORD *)v20 + 20) = nextNetNumber;
  p_G->int nextNetNumber = nextNetNumber + 1;
  if (v5)
  {
    int result = 0;
    *long long v17 = nPoints;
  }
  return result;
}

- (int)newThread:(id *)a3
{
  p_G = &self->G;
  int nThreads = self->G.nThreads;
  int maxThreads = self->G.maxThreads;
  if (nThreads < maxThreads)
  {
    threads = self->G.threads;
LABEL_5:
    int result = 0;
    p_G->int nThreads = nThreads + 1;
    *a3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)threads + 96 * nThreads);
    return result;
  }
  double v8 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(96 * maxThreads + 9600, 0x1000040DB95C216uLL);
  if (v8)
  {
    threads = v8;
    memmove(v8, p_G->threads, 96 * p_G->nThreads);
    free(p_G->threads);
    p_G->threads = threads;
    int nThreads = p_G->nThreads;
    p_G->maxThreads += 100;
    goto LABEL_5;
  }
  return 36;
}

- (int)newShape:(id *)a3
{
  p_G = &self->G;
  int nShapes = self->G.nShapes;
  int maxShapes = self->G.maxShapes;
  if (nShapes < maxShapes)
  {
    shapes = self->G.shapes;
LABEL_5:
    int result = 0;
    p_G->int nShapes = nShapes + 1;
    *a3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)shapes + 32 * nShapes);
    return result;
  }
  double v8 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(32 * (maxShapes + 10), 0x1020040A150DD5AuLL);
  if (v8)
  {
    shapes = v8;
    memmove(v8, p_G->shapes, 32 * p_G->nShapes);
    free(p_G->shapes);
    p_G->shapes = shapes;
    int nShapes = p_G->nShapes;
    p_G->maxShapes += 10;
    goto LABEL_5;
  }
  return 34;
}

- (int)connectThreads:(int)a3 drop1:(int)a4 and:(int)a5 drop2:(int)a6
{
  threads = self->G.threads;
  double v8 = (char *)threads + 96 * a3;
  int v11 = *((_DWORD *)v8 + 1);
  double v9 = v8 + 4;
  int v10 = v11;
  points = self->G.points;
  uint64_t v13 = v11;
  if (a4 >= 1)
  {
    do
    {
      double v14 = (char *)points + 96 * v13;
      int v15 = *((_DWORD *)v14 + 18);
      *((_DWORD *)v14 + 18) = -1;
      uint64_t v13 = v15;
      *((_DWORD *)points + 24 * v15 + 17) = -1;
      --a4;
    }
    while (a4);
    int v10 = v15;
  }
  int v16 = *((_DWORD *)threads + 24 * a5);
  uint64_t v17 = v16;
  if (a6 >= 1)
  {
    do
    {
      int v18 = (char *)points + 96 * v17;
      int v19 = *((_DWORD *)v18 + 17);
      *((_DWORD *)v18 + 17) = -1;
      uint64_t v17 = v19;
      *((_DWORD *)points + 24 * v19 + 18) = -1;
      --a6;
    }
    while (a6);
    int v16 = v19;
  }
  CGFloat v20 = (char *)threads + 96 * a3;
  *((_DWORD *)points + 24 * (int)v13 + 17) = v16;
  *((_DWORD *)points + 24 * (int)v17 + 18) = v10;
  int v21 = (char *)threads + 96 * a5;
  *double v9 = *((_DWORD *)v21 + 1);
  [(CIRedEyeRepair3 *)self removeThreadAtIndex:*(void *)&a5];
  v21[24] = 0;

  return [(CIRedEyeRepair3 *)self gatherThreadInfo:v20];
}

- (void)putThreadAtIndex:(int)a3
{
  uint64_t v11 = 0;
  p_G = &self->G;
  BOOL v5 = (int *)((char *)self->G.threads + 96 * a3);
  int v6 = (double *)((char *)self->G.points + 96 * *v5);
  -[CIRedEyeRepair3 point:toGridRow:column:](self, "point:toGridRow:column:", (char *)&v11 + 4, &v11, *v6, v6[1]);
  uint64_t v7 = (uint64_t)p_G->grid + 8 * (int)v11 + 8 * p_G->width * HIDWORD(v11);
  int v10 = *(_DWORD *)(v7 + 4);
  double v8 = (int *)(v7 + 4);
  int v9 = v10;
  v5[7] = v10;
  v5[8] = -1;
  if (v10 != -1) {
    *((_DWORD *)p_G->threads + 24 * v9 + 8) = a3;
  }
  *double v8 = a3;
}

- (void)removeThreadAtIndex:(int)a3
{
  uint64_t v13 = 0;
  p_G = &self->G;
  threads = self->G.threads;
  BOOL v5 = (char *)threads + 96 * a3;
  int v8 = *((_DWORD *)v5 + 8);
  uint64_t v7 = v5 + 32;
  int v6 = v8;
  if (v8 == -1)
  {
    uint64_t v11 = (int *)((char *)threads + 96 * a3);
    uint64_t v12 = (double *)((char *)self->G.points + 96 * *v11);
    -[CIRedEyeRepair3 point:toGridRow:column:](self, "point:toGridRow:column:", (char *)&v13 + 4, &v13, *v12, v12[1]);
    int v10 = v11[7];
    *((_DWORD *)p_G->grid + 2 * (int)v13 + 2 * p_G->width * HIDWORD(v13) + 1) = v10;
  }
  else
  {
    int v9 = (char *)threads + 96 * a3;
    *((_DWORD *)threads + 24 * v6 + 7) = *((_DWORD *)v9 + 7);
    int v10 = *((_DWORD *)v9 + 7);
  }
  if (v10 != -1) {
    *((_DWORD *)p_G->threads + 24 * v10 + 8) = *v7;
  }
}

- (int)lookForPoint:(CGPoint *)a3 onLine:(id)a4 nearestPoint:(CGPoint)a5
{
  if (a4.var0 == 0.0 && a4.var1 == 0.0) {
    return 37;
  }
  int result = 0;
  float v6 = a5.y * a4.var0 + (float)-a4.var1 * a5.x;
  BOOL v7 = a4.var0 == 0.0;
  float v8 = (float)(a4.var1 * a4.var1) + (float)(a4.var0 * a4.var0);
  float v9 = (float)-(float)((float)(a4.var1 * v6) + (float)(a4.var0 * a4.var2)) / v8;
  float v10 = (float)-(float)(a4.var2 + (float)(a4.var0 * v9)) / a4.var1;
  float v11 = (float)((float)(a4.var2 * (float)-a4.var1) + (float)(a4.var0 * v6)) / v8;
  float v12 = (float)-(float)(a4.var2 + (float)(a4.var1 * v11)) / a4.var0;
  if (v7)
  {
    float v12 = v9;
    float v13 = v10;
  }
  else
  {
    float v13 = v11;
  }
  a3->CGFloat x = v12;
  a3->CGFloat y = v13;
  return result;
}

- (void)forAllGridPointsNear:(int)a3 withinRadius:(float)a4 do:(void *)a5 context:(void *)a6
{
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  p_G = &self->G;
  float v12 = (double *)((char *)self->G.points + 96 * a3);
  double v13 = *v12;
  double v14 = v12[1];
  double v15 = a4;
  -[CIRedEyeRepair3 point:toGridRow:column:](self, "point:toGridRow:column:", (char *)&v29 + 4, (char *)&v28 + 4, *v12 - a4, v14 - a4);
  -[CIRedEyeRepair3 point:toGridRow:column:](self, "point:toGridRow:column:", &v29, &v28, *v12 + v15, v12[1] + v15);
  int v16 = v29;
  int v17 = HIDWORD(v29);
  if (SHIDWORD(v29) <= (int)v29)
  {
    float v18 = a4 * a4;
    int v19 = v28;
    do
    {
      int v20 = HIDWORD(v28);
      if (SHIDWORD(v28) <= v19)
      {
        do
        {
          int v21 = *((_DWORD *)p_G->grid + 2 * v20 + 2 * p_G->width * v17);
          if (v21 != -1)
          {
            do
            {
              points = p_G->points;
              int v23 = v21;
              if (v21 != a3)
              {
                float v24 = (double *)((char *)points + 96 * v21);
                float v25 = *v24 - v13;
                float v26 = v24[1] - v14;
                if ((float)((float)(v26 * v26) + (float)(v25 * v25)) <= v18) {
                  ((void (*)(void *, void))a5)(a6, v21);
                }
              }
              int v21 = *((_DWORD *)points + 24 * v23 + 16);
            }
            while (v21 != -1);
            int v19 = v28;
          }
          BOOL v27 = v20++ < v19;
        }
        while (v27);
        int v16 = v29;
      }
      BOOL v27 = v17++ < v16;
    }
    while (v27);
  }
}

- (void)forAllGridThreadsNear:(CGPoint)a3 withinRadius:(float)a4 do:(void *)a5 context:(void *)a6
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  double v12 = a4;
  -[CIRedEyeRepair3 point:toGridRow:column:](self, "point:toGridRow:column:", (char *)&v26 + 4, (char *)&v25 + 4, a3.x - a4, a3.y - a4);
  -[CIRedEyeRepair3 point:toGridRow:column:](self, "point:toGridRow:column:", &v26, &v25, x + v12, y + v12);
  int v13 = v26;
  int v14 = HIDWORD(v26);
  if (SHIDWORD(v26) <= (int)v26)
  {
    float v15 = a4 * a4;
    int v16 = v25;
    do
    {
      int v17 = HIDWORD(v25);
      if (SHIDWORD(v25) <= v16)
      {
        do
        {
          int v18 = *((_DWORD *)self->G.grid + 2 * v17 + 2 * self->G.width * v14 + 1);
          if (v18 != -1)
          {
            do
            {
              threads = self->G.threads;
              int v20 = v18;
              int v21 = (double *)((char *)self->G.points + 96 * *((int *)threads + 24 * v18));
              float v22 = *v21 - x;
              float v23 = v21[1] - y;
              if ((float)((float)(v23 * v23) + (float)(v22 * v22)) <= v15) {
                ((void (*)(void *, void))a5)(a6, v18);
              }
              int v18 = *((_DWORD *)threads + 24 * v20 + 7);
            }
            while (v18 != -1);
            int v16 = v25;
          }
          BOOL v24 = v17++ < v16;
        }
        while (v24);
        int v13 = v26;
      }
      BOOL v24 = v14++ < v13;
    }
    while (v24);
  }
}

- (int)replacePointAndDirection:(int)a3
{
  long long v14 = 0uLL;
  points = self->G.points;
  float v8 = (char *)points + 96 * a3;
  float v9 = (float *)(v8 + 84);
  LODWORD(v3) = *((_DWORD *)v8 + 21);
  LODWORD(v4) = *((_DWORD *)v8 + 22);
  LODWORD(v5) = *((_DWORD *)v8 + 23);
  int result = -[CIRedEyeRepair3 lookForPoint:onLine:nearestPoint:](self, "lookForPoint:onLine:nearestPoint:", &v14, v3, v4, v5, *(double *)v8, *((double *)v8 + 1));
  if (!result)
  {
    float v11 = (char *)points + 96 * a3;
    *((_OWORD *)v11 + 2) = *(_OWORD *)v8;
    *(_OWORD *)float v8 = v14;
    float v12 = *((float *)v11 + 22);
    float v13 = *v9;
    if (*((double *)v11 + 3) * (float)-*v9 + v12 * *((double *)v11 + 2) >= 0.0) {
      float v13 = -*v9;
    }
    else {
      float v12 = -v12;
    }
    *((_OWORD *)v11 + 3) = *((_OWORD *)v11 + 1);
    *((double *)v11 + 2) = v12;
    *((double *)v11 + 3) = v13;
  }
  return result;
}

- (int)linkUpPointIndex:(int)a3 toPointIndex:(int)a4
{
  points = self->G.points;
  double v5 = (char *)points + 96 * a4;
  int v8 = *((_DWORD *)v5 + 19);
  float v6 = v5 + 76;
  int v7 = v8;
  int v9 = *((_DWORD *)points + 24 * a3 + 19);
  if (v8 > v9 + 1) {
    return 0;
  }
  float v10 = (char *)points + 96 * a4;
  int v13 = *((_DWORD *)v10 + 20);
  float v12 = v10 + 80;
  int v11 = v13;
  long long v14 = (char *)points + 96 * a3;
  int v17 = *((_DWORD *)v14 + 20);
  float v15 = (int *)(v14 + 80);
  int v16 = v17;
  if (v11 == v17) {
    return 0;
  }
  int v18 = (char *)points + 96 * a4;
  int v21 = *((_DWORD *)v18 + 18);
  int v19 = (int *)(v18 + 72);
  int v20 = v21;
  if (v21 != -1)
  {
    *((_DWORD *)points + 24 * v20 + 17) = -1;
    goto LABEL_5;
  }
  if (v7 <= 0)
  {
LABEL_5:
    *((_DWORD *)points + 24 * a3 + 17) = a4;
    *int v19 = a3;
    *float v6 = v9 + 1;
    *float v12 = v16;
    int v22 = *((_DWORD *)points + 24 * a4 + 17);
    if (v22 != -1)
    {
      int v23 = v9 + 2;
      do
      {
        BOOL v24 = (_DWORD *)((char *)points + 96 * v22);
        int v25 = *v15;
        v24[19] = v23;
        v24[20] = v25;
        int v22 = v24[17];
        ++v23;
      }
      while (v22 != -1);
    }
    return 0;
  }
  return 38;
}

- (int)copyGridInto:(id *)a3 transform:(CGAffineTransform *)a4 height:(int)a5
{
  p_G = &self->G;
  memmove(a3, &self->G, 0x50uLL);
  a3->uint64_t var3 = 0;
  a3->uint64_t var6 = 0;
  int v9 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(8 * a3->var1 * a3->var0, 0x100004000313F17uLL);
  a3->uint64_t var3 = v9;
  if (v9)
  {
    memmove(v9, p_G->grid, 8 * a3->var1 * a3->var0);
    float v10 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(96 * a3->var4, 0x1000040565EDBD2uLL);
    a3->uint64_t var6 = v10;
    if (v10)
    {
      memmove(v10, p_G->points, 96 * a3->var4);
      int var4 = a3->var4;
      a3->var5 = var4;
      if (var4 >= 1)
      {
        uint64_t var6 = a3->var6;
        double v13 = (float)a5;
        do
        {
          double v14 = v13 - *((double *)var6 + 1);
          double v15 = *(double *)var6 + 0.5;
          *(double *)uint64_t var6 = v15;
          *((double *)var6 + 1) = v14;
          *(float64x2_t *)uint64_t var6 = vaddq_f64(*(float64x2_t *)&a4->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a4->c, v14), *(float64x2_t *)&a4->a, v15));
          double v16 = v13 - *((double *)var6 + 5);
          double v17 = *((double *)var6 + 4) + 0.5;
          *((double *)var6 + 4) = v17;
          *((double *)var6 + 5) = v16;
          *((float64x2_t *)var6 + 2) = vaddq_f64(*(float64x2_t *)&a4->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a4->c, v16), *(float64x2_t *)&a4->a, v17));
          LODWORD(v17) = *((_DWORD *)var6 + 22);
          double v18 = *((float *)var6 + 21);
          float v19 = *((float *)var6 + 23) + v18 * -0.5 + (float)(*(float *)&v17 * (float)a5);
          *(float *)&double v18 = v19 * a4->a - a4->tx * v18 + *(float *)&v17 * a4->ty;
          *((float *)var6 + 22) = -*(float *)&v17;
          *((_DWORD *)var6 + 23) = LODWORD(v18);
          uint64_t var6 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var6 + 96);
          --var4;
        }
        while (var4);
      }
      int v20 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(96 * a3->var8, 0x1000040DB95C216uLL);
      a3->var10 = v20;
      if (v20)
      {
        memmove(v20, p_G->threads, 96 * a3->var8);
        a3->var9 = a3->var8;
        int v21 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(32 * a3->var11, 0x1020040A150DD5AuLL);
        a3->var13 = v21;
        if (v21)
        {
          memmove(v21, p_G->shapes, 32 * a3->var11);
          int var11 = a3->var11;
          if (var11 < 1)
          {
            int result = 0;
            a3->var12 = var11;
            return result;
          }
          var13 = a3->var13;
          BOOL v24 = (void *)((char *)var13 + 8);
          int v25 = a3->var11;
          do
          {
            *BOOL v24 = 0;
            v24 += 4;
            --v25;
          }
          while (v25);
          a3->var12 = var11;
          int v26 = 0;
          BOOL v27 = (const void **)((char *)p_G->shapes + 8);
          while (1)
          {
            uint64_t v28 = malloc_type_malloc(48 * *(_DWORD *)var13, 0x1000040EED21634uLL);
            *((void *)var13 + 1) = v28;
            if (!v28) {
              break;
            }
            uint64_t v30 = *v27;
            v27 += 4;
            uint64_t v29 = v30;
            uint64_t v31 = *(_DWORD *)var13;
            var13 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var13 + 32);
            memmove(v28, v29, 48 * v31);
            int result = 0;
            if (++v26 >= a3->var11) {
              return result;
            }
          }
          double v33 = a3->var13;
          int v34 = a3->var11;
          if (v34 >= 1)
          {
            int v35 = 0;
            long long v36 = (void **)((char *)v33 + 8);
            do
            {
              if (*v36)
              {
                free(*v36);
                *long long v36 = 0;
                int v34 = a3->var11;
              }
              ++v35;
              v36 += 4;
            }
            while (v35 < v34);
            double v33 = a3->var13;
          }
          free(v33);
          a3->var13 = 0;
        }
        free(a3->var10);
        a3->var10 = 0;
      }
      free(a3->var6);
      a3->uint64_t var6 = 0;
    }
    free(a3->var3);
    a3->uint64_t var3 = 0;
  }
  return 39;
}

- (int)nextPointIndexWithPointIndex:(int)a3
{
  double v3 = (char *)self->G.points + 96 * a3;
  *(float *)&uint64_t v5 = (float)(self->S.capture * self->S.capture) + 1.0;
  HIDWORD(v5) = -1;
  -[CIRedEyeRepair3 forAllGridPointsNear:withinRadius:do:context:](self, "forAllGridPointsNear:withinRadius:do:context:", *(_OWORD *)v3, *((_OWORD *)v3 + 1), *(void *)(v3 + 84), __PAIR64__(LODWORD(self->S.alignmentTolerance), *((_DWORD *)v3 + 23)), v5);
  return v6;
}

- (void)regressionWithPointIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  points = self->G.points;
  float64x2_t v7 = *((float64x2_t *)points + 6 * a3);
  int32x2_t v21 = (int32x2_t)vcvt_f32_f64(v7);
  float32x4_t v20 = vcvt_hight_f32_f64(v21, v7);
  int v22 = 1;
  p_S = &self->S;
  *(float *)v7.f64 = self->S.regressionRadius;
  [(CIRedEyeRepair3 *)self forAllGridPointsNear:*(void *)&a3 withinRadius:regressionMeanAction do:&v20 context:v7.f64[0]];
  *(float *)&double v9 = 1.0 / (float)v22;
  float v10 = *(float *)v21.i32 * *(float *)&v9;
  float v11 = *(float *)&v21.i32[1] * *(float *)&v9;
  if ((float)(v20.f32[2] - v20.f32[0]) <= (float)(v20.f32[3] - v20.f32[1]))
  {
    float v17 = *(float *)v21.i32 * *(float *)&v9;
    float v18 = *(float *)&v21.i32[1] * *(float *)&v9;
    uint64_t v19 = 0;
    *(float *)&double v9 = p_S->regressionRadius;
    [(CIRedEyeRepair3 *)self forAllGridPointsNear:v3 withinRadius:regressionVerticalAction do:&v17 context:v9];
    float v14 = 0.0;
    if (*(float *)&v19 != 0.0) {
      float v14 = *((float *)&v19 + 1) / *(float *)&v19;
    }
    float v13 = v10 - (float)(v14 * v11);
    float v12 = -1.0;
  }
  else
  {
    float v17 = *(float *)v21.i32 * *(float *)&v9;
    float v18 = *(float *)&v21.i32[1] * *(float *)&v9;
    uint64_t v19 = 0;
    *(float *)&double v9 = p_S->regressionRadius;
    [(CIRedEyeRepair3 *)self forAllGridPointsNear:v3 withinRadius:regressionHorizontalAction do:&v17 context:v9];
    float v12 = 0.0;
    if (*(float *)&v19 != 0.0) {
      float v12 = *((float *)&v19 + 1) / *(float *)&v19;
    }
    float v13 = v11 - (float)(v12 * v10);
    float v14 = -1.0;
  }
  double v15 = (float *)((char *)points + 96 * a3);
  float v16 = 1.0 / sqrtf((float)(v14 * v14) + (float)(v12 * v12));
  v15[21] = v12 * v16;
  v15[22] = v14 * v16;
  v15[23] = v13 * v16;
}

- (int)initHull:(id *)a3 withOrientation:(BOOL)a4
{
  int v6 = 24;
  float64x2_t v7 = (char *)malloc_type_malloc(0x18uLL, 0x10200409093602BuLL);
  if (v7)
  {
    int v8 = v7;
    *float64x2_t v7 = a4;
    *(void *)(v7 + 4) = 0x4000000000;
    double v9 = malloc_type_malloc(0x400uLL, 0x1000040451B5BE8uLL);
    *((void *)v8 + 2) = v9;
    if (v9)
    {
      bzero(v9, 0x400uLL);
      int v6 = 0;
      *a3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v8;
    }
    else
    {
      free(v8);
      return 24;
    }
  }
  return v6;
}

- (void)termHull:(id *)a3
{
  free(a3->var3);

  free(a3);
}

- (int)addPoint:(CGPoint)a3 toHull:(id *)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  int var1 = a4->var1;
  int var2 = a4->var2;
  if (var1 < var2)
  {
    uint64_t var3 = a4->var3;
LABEL_5:
    int result = 0;
    a4->int var1 = var1 + 1;
    p_CGFloat x = &var3[var1].x;
    *p_CGFloat x = x;
    p_x[1] = y;
    return result;
  }
  float v10 = (CGPoint *)malloc_type_malloc(16 * (var2 + 32), 0x1000040451B5BE8uLL);
  if (v10)
  {
    uint64_t var3 = v10;
    memmove(v10, a4->var3, 16 * a4->var1);
    free(a4->var3);
    a4->uint64_t var3 = var3;
    int var1 = a4->var1;
    a4->var2 += 32;
    goto LABEL_5;
  }
  return 50;
}

- (BOOL)trimConcaveFromHull:(id *)a3
{
  int var1 = a3->var1;
  if (var1 < 3) {
    return 0;
  }
  uint64_t var3 = a3->var3;
  p_CGFloat x = &var3[var1 - 3].x;
  double v6 = *p_x;
  double v7 = p_x[1];
  int v8 = &var3[var1 - 2].x;
  double v9 = v8[1];
  unsigned int v10 = var1 - 1;
  float v11 = &var3[v10].x;
  double v12 = v11[1];
  *(float *)&double v6 = *v8 - v6;
  *(float *)&double v7 = v9 - v7;
  float v13 = *v11 - *v8;
  *(float *)&double v9 = v12 - v9;
  if (a3->var0 == (float)((float)(*(float *)&v6 * *(float *)&v9) - (float)(*(float *)&v7 * v13)) < 0.0) {
    return 0;
  }
  *int v8 = *v11;
  v8[1] = v12;
  BOOL result = 1;
  a3->int var1 = v10;
  return result;
}

- (BOOL)trimEndPointFromHull:(id *)a3
{
  int var1 = a3->var1;
  if (var1 < 3) {
    return 0;
  }
  uint64_t var3 = a3->var3;
  p_CGFloat x = &var3[var1 - 2].x;
  double v6 = *p_x;
  double v7 = p_x[1];
  unsigned int v8 = var1 - 1;
  double v9 = &var3[v8].x;
  double v10 = v9[1];
  *(float *)&double v6 = *v9 - v6;
  *(float *)&double v7 = v10 - v7;
  float v11 = var3->x - *v9;
  *(float *)&double v10 = var3->y - v10;
  if (a3->var0 == (float)((float)(*(float *)&v6 * *(float *)&v10) - (float)(*(float *)&v7 * v11)) < 0.0) {
    return 0;
  }
  a3->int var1 = v8;
  return 1;
}

- (BOOL)trimStartPointFromHull:(id *)a3
{
  int var1 = a3->var1;
  if (var1 < 3) {
    return 0;
  }
  uint64_t var3 = a3->var3;
  p_CGFloat x = &var3[var1 - 1].x;
  double y = var3->y;
  float v7 = var3->x - *p_x;
  float v8 = y - p_x[1];
  float v9 = var3[1].x - var3->x;
  *(float *)&double y = var3[1].y - y;
  if (a3->var0 == (float)((float)(v7 * *(float *)&y) - (float)(v8 * v9)) < 0.0) {
    return 0;
  }
  uint64_t v11 = 0;
  uint64_t v12 = 1;
  do
  {
    a3->var3[v11] = a3->var3[v11 + 1];
    ++v12;
    uint64_t v13 = a3->var1;
    ++v11;
  }
  while (v12 < v13);
  a3->int var1 = v13 - 1;
  return 1;
}

- (BOOL)isConvex:(id *)a3
{
  unint64_t var1 = a3->var1;
  if ((int)var1 < 1)
  {
    return 1;
  }
  else
  {
    uint64_t v4 = 0;
    BOOL v5 = 0;
    uint64_t v6 = (var1 - 1);
    unint64_t v7 = 1;
    do
    {
      if (v4 * 16)
      {
        uint64_t var3 = a3->var3;
        float v9 = &var3[v4];
        p_CGFloat x = &var3[v4 - 1].x;
        p_double y = &var3[v4 - 1].y;
        uint64_t v12 = &var3[v4].y;
        uint64_t v13 = (uint64_t)&var3[v4 + 1].y;
        if ((var1 - 1) == v4)
        {
          p_CGFloat x = &var3[(int)var1 - 2].x;
          p_double y = p_x + 1;
          float v9 = &var3[v6];
          uint64_t v12 = &v9->y;
          float v14 = &var3->y;
        }
        else
        {
          uint64_t var3 = (CGPoint *)((char *)var3 + v4 * 16 + 16);
          float v14 = (double *)v13;
        }
      }
      else
      {
        float v9 = a3->var3;
        p_CGFloat x = &v9[v6].x;
        p_double y = p_x + 1;
        uint64_t v12 = &v9->y;
        uint64_t var3 = v9 + 1;
        float v14 = &v9[1].y;
      }
      float v15 = v9->x - *p_x;
      float v16 = *v12 - *p_y;
      float v17 = var3->x - v9->x;
      float v18 = *v14 - *v12;
      if (a3->var0 != (float)((float)(v15 * v18) - (float)(v16 * v17)) < 0.0) {
        break;
      }
      BOOL v5 = v7 >= var1;
      ++v4;
      ++v7;
    }
    while (var1 != v4);
  }
  return v5;
}

- (int)convexHull:(id *)a3 ofOriented:(BOOL)a4 threadIndex:(int)a5
{
  uint64_t v12 = 0;
  int result = [(CIRedEyeRepair3 *)self initHull:&v12 withOrientation:a4];
  if (!result)
  {
    threads = self->G.threads;
    if (*((unsigned char *)threads + 96 * a5 + 24))
    {
      points = self->G.points;
      int v11 = *((_DWORD *)threads + 24 * a5);
      int result = -[CIRedEyeRepair3 addPoint:toHull:](self, "addPoint:toHull:", v12, *((double *)points + 12 * v11), *((double *)points + 12 * v11 + 1));
      if (!result)
      {
        while (1)
        {
          int v11 = *((_DWORD *)points + 24 * v11 + 17);
          if (v11 == -1) {
            break;
          }
          points = self->G.points;
          int result = -[CIRedEyeRepair3 addPoint:toHull:](self, "addPoint:toHull:", v12, *((double *)points + 12 * v11), *((double *)points + 12 * v11 + 1));
          if (result) {
            return result;
          }
          while ([(CIRedEyeRepair3 *)self trimConcaveFromHull:v12])
            ;
        }
        do
        {
          while ([(CIRedEyeRepair3 *)self trimEndPointFromHull:v12])
            ;
        }
        while ([(CIRedEyeRepair3 *)self trimStartPointFromHull:v12]);
        if ([(CIRedEyeRepair3 *)self isConvex:v12])
        {
          int result = 0;
          *a3 = v12;
        }
        else
        {
          [(CIRedEyeRepair3 *)self termHull:v12];
          return 40;
        }
      }
    }
    else
    {
      [(CIRedEyeRepair3 *)self termHull:v12];
      return 41;
    }
  }
  return result;
}

- (int)convexHull:(id *)a3 ofOriented:(BOOL)a4 shape:(id *)a5
{
  uint64_t v13 = 0;
  int result = [(CIRedEyeRepair3 *)self initHull:&v13 withOrientation:a4];
  if (!result)
  {
    int var2 = a5->var2;
    int result = -[CIRedEyeRepair3 addPoint:toHull:](self, "addPoint:toHull:", v13, *(double *)var2, *((double *)var2 + 1));
    if (!result)
    {
      if (a5->var0 < 2)
      {
        do
        {
LABEL_8:
          while ([(CIRedEyeRepair3 *)self trimEndPointFromHull:v13])
            ;
        }
        while ([(CIRedEyeRepair3 *)self trimStartPointFromHull:v13]);
        int result = 0;
        *a3 = v13;
      }
      else
      {
        int v10 = 1;
        while (1)
        {
          double v11 = *((double *)var2 + 6);
          double v12 = *((double *)var2 + 7);
          int var2 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var2 + 48);
          int result = -[CIRedEyeRepair3 addPoint:toHull:](self, "addPoint:toHull:", v13, v11, v12);
          if (result) {
            break;
          }
          while ([(CIRedEyeRepair3 *)self trimConcaveFromHull:v13])
            ;
          if (++v10 >= a5->var0) {
            goto LABEL_8;
          }
        }
      }
    }
  }
  return result;
}

- (void)measureHull:(id *)a3 majorAxis:(CGPoint *)a4 majorTo:(CGPoint *)a5 majorDiameter:(float *)a6 minorAxis:(CGPoint *)a7 minorTo:(CGPoint *)a8 minorDiameter:(float *)a9
{
  uint64_t var3 = a3->var3;
  uint64_t var1 = a3->var1;
  uint64_t v11 = var1 - 1;
  p_double x = &var3[var1 - 1].x;
  double v13 = *p_x;
  double v14 = p_x[1];
  double x = var3->x;
  double y = var3->y;
  p_double y = &var3[1].y;
  float v18 = 0.0;
  int v19 = -1;
  do
  {
    float v20 = fabs(x * (*p_y - v14) + v13 * (y - *p_y) + *(p_y - 1) * (v14 - y)) * 0.5;
    ++v19;
    p_y += 2;
    BOOL v21 = v18 < v20;
    float v18 = v20;
  }
  while (v21);
  if ((int)var1 <= v19)
  {
    double v33 = 0.0;
    float v27 = -10000.0;
    double v32 = 0.0;
    float v24 = 10000.0;
    double v31 = 0.0;
    double v30 = 0.0;
    double v29 = 0.0;
    double v28 = 0.0;
    double v26 = 0.0;
    double v25 = 0.0;
  }
  else
  {
    unint64_t v22 = 0;
    unint64_t v23 = v19;
    float v24 = 10000.0;
    double v25 = 0.0;
    double v26 = 0.0;
    float v27 = -10000.0;
    double v28 = 0.0;
    double v29 = 0.0;
    double v30 = 0.0;
    double v31 = 0.0;
    double v32 = 0.0;
    double v33 = 0.0;
    do
    {
      int v34 = &var3[v22 + 1].x;
      double v35 = *v34;
      double v36 = v34[1];
      uint64_t v37 = v19;
      double v38 = &var3[v19].x;
      double v39 = *v38;
      double v40 = v38[1];
      float v41 = fabs(v35 * (v40 - y) + x * (v36 - v40) + *v38 * (y - v36)) * 0.5;
      if (v19 <= (int)v11) {
        int v42 = var1 - 1;
      }
      else {
        int v42 = v19;
      }
      if (v11 > v19) {
        uint64_t v37 = var1 - 1;
      }
      uint64_t v43 = v37 - v19;
      double v44 = &var3[v19-- + 1].y;
      while (1)
      {
        float v45 = v39 - x;
        float v46 = v40 - y;
        float v47 = (float)(v46 * v46) + (float)(v45 * v45);
        if (v47 < v24)
        {
          float v24 = v47;
          double v33 = x;
          double v32 = y;
          double v29 = v39;
          double v28 = v40;
        }
        if (v47 > v27)
        {
          float v27 = v47;
          double v31 = x;
          double v30 = y;
          double v26 = v39;
          double v25 = v40;
        }
        if (!v43) {
          break;
        }
        double v39 = *(v44 - 1);
        double v40 = *v44;
        float v48 = fabs(v35 * (*v44 - y) + x * (v36 - *v44) + v39 * (y - v36)) * 0.5;
        ++v19;
        --v43;
        v44 += 2;
        BOOL v21 = v41 < v48;
        float v41 = v48;
        if (!v21) {
          goto LABEL_19;
        }
      }
      int v19 = v42;
LABEL_19:
      if (v22 >= v23) {
        break;
      }
      ++v22;
      double y = v36;
      double x = v35;
    }
    while (v19 < (int)var1);
  }
  a4->double x = v31;
  a4->double y = v30;
  a5->double x = v26;
  a5->double y = v25;
  *a6 = sqrtf(v27);
  a7->double x = v33;
  a7->double y = v32;
  a8->double x = v29;
  a8->double y = v28;
  *a9 = sqrtf(v24);
}

- (int)renderHull:(id *)a3 toBitmap:(id *)a4
{
  size_t var1 = a4->var1;
  size_t var2 = a4->var2;
  DeviceGradouble y = CGColorSpaceCreateDeviceGray();
  if (!DeviceGray) {
    return 10;
  }
  float v9 = DeviceGray;
  int v10 = CGBitmapContextCreate(a4->var0, var1, var2, 8uLL, a4->var4, DeviceGray, 0);
  CGColorSpaceRelease(v9);
  if (!v10) {
    return 42;
  }
  CGContextSetRGBFillColor(v10, 0.0, 0.0, 0.0, 1.0);
  CGContextBeginPath(v10);
  CGContextMoveToPoint(v10, 0.0, 0.0);
  CGContextAddLineToPoint(v10, (double)var1, 0.0);
  CGContextAddLineToPoint(v10, (double)var1, (double)var2);
  CGContextAddLineToPoint(v10, 0.0, (double)var2);
  CGContextAddLineToPoint(v10, 0.0, 0.0);
  CGContextClosePath(v10);
  CGContextFillPath(v10);
  CGContextSetRGBFillColor(v10, 1.0, 1.0, 1.0, 1.0);
  CGContextBeginPath(v10);
  if (a3->var1 <= 0)
  {
    double v13 = (float)(var2 - 1);
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    double v13 = (float)(var2 - 1);
    do
    {
      double v14 = &a3->var3[v11];
      double v15 = v14->x + 0.5;
      double v16 = v13 - v14->y + 0.5;
      if (v11 * 16) {
        CGContextAddLineToPoint(v10, v15, v16);
      }
      else {
        CGContextMoveToPoint(v10, v15, v16);
      }
      ++v12;
      ++v11;
    }
    while (v12 < a3->var1);
  }
  CGContextAddLineToPoint(v10, a3->var3->x + 0.5, v13 - a3->var3->y + 0.5);
  CGContextClosePath(v10);
  CGContextFillPath(v10);
  CGContextRelease(v10);
  return 0;
}

- (int)widenedHull:(id *)a3 withHull:(id *)a4 by:(float)a5
{
  double v35 = 0;
  int v9 = [(CIRedEyeRepair3 *)self initHull:&v35 withOrientation:0];
  if (!v9)
  {
    unint64_t var1 = a4->var1;
    if ((int)var1 < 1)
    {
LABEL_15:
      int v9 = 0;
      *a3 = v35;
    }
    else
    {
      unint64_t v11 = 0;
      float v34 = 0.0;
      uint64_t v33 = 0;
      uint64_t v31 = 0;
      uint64_t v12 = 1;
      float v32 = 0.0;
      while (1)
      {
        if (v11) {
          uint64_t v13 = 0;
        }
        else {
          uint64_t v13 = (int)var1;
        }
        uint64_t v14 = v13 + v11++;
        if (v11 >= var1) {
          int v15 = var1;
        }
        else {
          int v15 = 0;
        }
        uint64_t var3 = a4->var3;
        float v17 = &var3[v14];
        double x = v17[-1].x;
        double y = v17[-1].y;
        double v20 = var3[v12 - 1].x;
        double v21 = var3[v12 - 1].y;
        p_double x = &var3[v12 - v15].x;
        double v23 = *p_x;
        double v24 = p_x[1];
        int v25 = lineEquationThroughTwoPoints((float *)&v33, x, y, v20, v21);
        if (v25 || (int v25 = lineEquationThroughTwoPoints((float *)&v31, v20, v21, v23, v24)) != 0)
        {
          int v9 = v25;
          [(CIRedEyeRepair3 *)self termHull:v35];
          return v9;
        }
        float v26 = (float)(*(float *)&v33 * *((float *)&v31 + 1)) - (float)(*(float *)&v31 * *((float *)&v33 + 1));
        float v27 = (float)((float)(*((float *)&v33 + 1) * (float)(v32 + a5))
                    - (float)(*((float *)&v31 + 1) * (float)(v34 + a5)))
            / v26;
        float v28 = (float)((float)(*(float *)&v31 * (float)(v34 + a5)) - (float)(*(float *)&v33 * (float)(v32 + a5))) / v26;
        float v34 = (float)(v34 + a5) - a5;
        float v32 = (float)(v32 + a5) - a5;
        int v29 = -[CIRedEyeRepair3 addPoint:toHull:](self, "addPoint:toHull:", v35, v27, v28);
        if (v29) {
          return v29;
        }
        ++v12;
        if (var1 == v11) {
          goto LABEL_15;
        }
      }
    }
  }
  return v9;
}

- (int)renderConvexHull:(id *)a3 distance:(float)a4 fieldToBitmap:(id *)a5
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  uint64_t v112 = 0;
  long long v110 = 0u;
  long long v111 = 0u;
  int var0 = a5->var0;
  int var2 = a5->var2;
  uint64_t var3 = a5->var3;
  int var6 = a5->var6;
  int var1 = a5->var1;
  initBitmap((uint64_t)&v110, var1, var2, var6, 1, 100.0);
  if (!(void)v110) {
    return 45;
  }
  int v14 = [(CIRedEyeRepair3 *)self renderHull:a3 toBitmap:&v110];
  if (!v14)
  {
    int v15 = (unsigned __int8 *)v110;
    uint64_t v16 = (int)v111;
    uint64_t v17 = SHIDWORD(v111);
    uint64_t v109 = var0;
    bzero(var0, a5->var5);
    float v18 = a3;
    uint64_t v19 = a3->var1;
    double v20 = (float *)malloc_type_malloc(12 * v19, 0x10000403E1C8BA9uLL);
    if (v20)
    {
      uint64_t v106 = v16;
      int v107 = var1;
      uint64_t v21 = 0;
      uint64_t v22 = var6;
      int v23 = 1;
      uint64_t v108 = v20;
      double v24 = v20;
      while ((v19 & ~((int)v19 >> 31)) != v21)
      {
        if ((int)v19 <= v23) {
          int v25 = v19;
        }
        else {
          int v25 = 0;
        }
        int v26 = lineEquationThroughTwoPoints(v24, v18->var3[v21].x, v18->var3[v21].y, v18->var3[v23 - v25].x, v18->var3[v23 - v25].y);
        ++v21;
        v24 += 3;
        ++v23;
        if (v26)
        {
          int v14 = v26;
          termBitmap((void **)&v110);
          free(v108);
          return v14;
        }
      }
      float v28 = v15;
      int v29 = v18;
      double v30 = v109;
      if ((int)v19 < 1)
      {
LABEL_75:
        free(v108);
        if (var2 >= 1)
        {
          for (int i = 0; i != var2; ++i)
          {
            if (v107 >= 1)
            {
              int v103 = v107;
              v104 = v28;
              uint64_t v105 = v30;
              do
              {
                if (*v104 >= 0x79u) {
                  *uint64_t v105 = -1;
                }
                v105 += v22;
                v104 += v17;
                --v103;
              }
              while (v103);
            }
            v30 += var3;
            v28 += v106;
          }
        }
        termBitmap((void **)&v110);
        return 0;
      }
      else
      {
        uint64_t v31 = 0;
        while (1)
        {
          uint64_t v32 = v31 ? 0 : v19;
          uint64_t v33 = v31 + v32;
          uint64_t v34 = v31 + 1;
          int v35 = v31 + 1 >= v19 ? v19 : 0;
          double v36 = &v108[3 * v33];
          float v37 = *(v36 - 3);
          float v38 = *(v36 - 2);
          double v39 = &v108[3 * v31];
          float v40 = *v39;
          float v41 = v39[1];
          float v42 = v37 - *v39;
          float v43 = v38 - v41;
          float v44 = sqrtf((float)(v43 * v43) + (float)(v42 * v42));
          if (v44 == 0.0) {
            break;
          }
          int v45 = v34 - v35;
          float v46 = &v108[3 * ((int)v34 - v35)];
          float v47 = *v46;
          float v48 = v46[1];
          float v49 = v40 - *v46;
          float v50 = v41 - v48;
          float v51 = sqrtf((float)(v50 * v50) + (float)(v49 * v49));
          if (v51 == 0.0) {
            break;
          }
          double v52 = v29->var3;
          p_double x = &v52[v31].x;
          long long v54 = &v52[v45].x;
          double v55 = *v54;
          float v56 = *p_x;
          if (*v54 >= v56)
          {
            float v57 = *p_x;
            if (*v54 > v56) {
              float v56 = v55;
            }
          }
          else
          {
            float v57 = v55;
          }
          double v58 = v54[1];
          float v59 = p_x[1];
          if (v58 >= v59)
          {
            float v60 = p_x[1];
            if (v58 > v59) {
              float v59 = v58;
            }
          }
          else
          {
            float v60 = v58;
          }
          float v61 = *(v36 - 1);
          float v62 = v39[2];
          float v63 = v46[2];
          float v64 = 1.0 / v44;
          float v65 = v42 * v64;
          float v66 = v43 * v64;
          float v67 = (float)(v61 - v62) * v64;
          float v68 = v62 - v63;
          float v69 = 1.0 / v51;
          float v70 = v62 + a4;
          float v71 = v63 + a4;
          float v72 = (float)(v41 * (float)(v63 + a4)) - (float)(v48 * v70);
          float v73 = (float)(v40 * v48) - (float)(v47 * v41);
          float v74 = v72 / v73;
          float v75 = (float)((float)(v47 * v70) - (float)(v40 * v71)) / v73;
          float v76 = v70 - a4;
          float v77 = (float)(v38 * (float)((float)(v70 - a4) + a4)) - (float)(v41 * (float)(v61 + a4));
          float v78 = (float)(v37 * v41) - (float)(v40 * v38);
          float v79 = v77 / v78;
          float v80 = (float)((float)(v40 * (float)(v61 + a4)) - (float)(v37 * (float)((float)(v70 - a4) + a4))) / v78;
          if (v74 > v56) {
            float v81 = v74;
          }
          else {
            float v81 = v56;
          }
          if (v74 >= v57) {
            float v56 = v81;
          }
          else {
            float v57 = v74;
          }
          if (v75 > v59) {
            float v82 = v75;
          }
          else {
            float v82 = v59;
          }
          if (v75 < v60)
          {
            float v83 = v59;
          }
          else
          {
            float v75 = v60;
            float v83 = v82;
          }
          if (v79 > v56) {
            float v84 = v79;
          }
          else {
            float v84 = v56;
          }
          if (v79 >= v57) {
            float v85 = v57;
          }
          else {
            float v85 = v79;
          }
          if (v79 >= v57) {
            float v56 = v84;
          }
          if (v80 > v83) {
            float v86 = v80;
          }
          else {
            float v86 = v83;
          }
          if (v80 < v75)
          {
            float v87 = v83;
          }
          else
          {
            float v80 = v75;
            float v87 = v86;
          }
          signed int v88 = vcvtps_s32_f32(v56);
          int v89 = vcvtms_s32_f32(v80);
          signed int v90 = vcvtps_s32_f32(v87);
          v113[0] = -v40;
          v113[1] = -v41;
          float v91 = (float)(v76 + a4) - a4;
          int v92 = v89 & ~(v89 >> 31);
          if (var2 < v90) {
            signed int v90 = var2;
          }
          if (v107 < v88) {
            signed int v88 = v107;
          }
          v113[2] = -v91;
          v113[3] = v65;
          v113[4] = v66;
          v113[5] = v67;
          v113[6] = v40;
          v113[7] = v41;
          v113[8] = v91 + a4;
          v113[9] = -(float)(v49 * v69);
          v113[10] = -(float)(v50 * v69);
          v113[11] = -(float)(v68 * v69);
          if (v92 < v90)
          {
            int v93 = vcvtms_s32_f32(v85);
            int v94 = v93 & ~(v93 >> 31);
            float v95 = &v109[(int)var3 * (uint64_t)v92];
            do
            {
              if (v94 < v88)
              {
                float v96 = &v95[v94 * (int)v22];
                int v97 = v94;
                do
                {
                  uint64_t v98 = 0;
                  float v99 = (float)v97;
                  while ((float)(v113[v98 + 2] + (float)((float)(v113[v98 + 1] * (float)v92) + (float)(v113[v98] * v99))) > 0.0)
                  {
                    v98 += 3;
                    if ((v98 * 4) == 48)
                    {
                      float v100 = (1.0
                            - (float)((float)((float)((float)((float)-v41 * (float)v92) + (float)(v113[0] * v99)) - v91)
                                    / a4))
                           * 255.0;
                      int v101 = (int)rintf(v100);
                      if (v101 >= 255) {
                        int v101 = 255;
                      }
                      char *v96 = v101 & ~(v101 >> 31);
                      break;
                    }
                  }
                  ++v97;
                  v96 += v22;
                }
                while (v97 != v88);
              }
              ++v92;
              v95 += var3;
            }
            while (v92 != v90);
          }
          uint64_t v31 = v34;
          if (v34 == v19) {
            goto LABEL_75;
          }
        }
        termBitmap((void **)&v110);
        free(v108);
        return 44;
      }
    }
    else
    {
      termBitmap((void **)&v110);
      return 46;
    }
  }
  return v14;
}

- (CGPoint)centroidWithConvexHull:(id *)a3
{
  int var1 = a3->var1;
  float v4 = 0.0;
  if (var1 < 1)
  {
    float32x2_t v11 = 0;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t var3 = a3->var3;
    float32x2_t v7 = 0;
    do
      float32x2_t v7 = vcvt_f32_f64(vaddq_f64((float64x2_t)var3[v5++], vcvtq_f64_f32(v7)));
    while (var1 != v5);
    int v8 = 0;
    float64x2_t v9 = vcvtq_f64_f32(vmul_n_f32(v7, 1.0 / (float)var1));
    int v10 = var3 + 1;
    float32x2_t v11 = 0;
    float v4 = 0.0;
    float64x2_t v12 = (float64x2_t)vdupq_n_s64(0x3FD5555551C112DAuLL);
    do
    {
      if (v8 >= var1 - 1) {
        uint64_t v13 = a3->var3;
      }
      else {
        uint64_t v13 = v10;
      }
      float64x2_t v14 = (float64x2_t)v10[-1];
      float32x2_t v15 = vcvt_f32_f64(vmulq_f64(vaddq_f64(vaddq_f64(v14, *(float64x2_t *)v13), v9), v12));
      float64x2_t v16 = vsubq_f64(v14, v9);
      float v17 = v16.f64[0];
      *(float *)v16.f64 = v16.f64[1];
      float64x2_t v18 = vsubq_f64(*(float64x2_t *)v13, v9);
      float v19 = v18.f64[0];
      *(float *)v18.f64 = v18.f64[1];
      *(float *)v16.f64 = fabsf((float)((float)(v17 * *(float *)v18.f64) - (float)(*(float *)v16.f64 * v19)) * 0.5);
      float32x2_t v11 = vmla_n_f32(v11, v15, *(float *)v16.f64);
      float v4 = v4 + *(float *)v16.f64;
      ++v8;
      ++v10;
    }
    while (var1 != v8);
  }
  float64x2_t v20 = vcvtq_f64_f32(vmul_n_f32(v11, 1.0 / v4));
  double v21 = v20.f64[1];
  result.double x = v20.f64[0];
  result.double y = v21;
  return result;
}

- (int)analyzeMask:(id *)a3 usingConvexHull:(id *)a4 producingOptimizedMask:(id *)a5
{
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  inspector = self->inspector;
  if (inspector) {
    int v10 = [(RedEyeInspector3 *)inspector debuggingThisFaceAndEye:&self->S];
  }
  else {
    int v10 = 0;
  }
  int var1 = a4->var1;
  if (!var1) {
    return 3;
  }
  [(CIRedEyeRepair3 *)self centroidWithConvexHull:a4];
  double v13 = v12;
  double v15 = v14;
  float64x2_t v16 = (char *)malloc_type_malloc(80 * var1, 0x10000404E27CAF5uLL);
  if (!v16) {
    return 4;
  }
  float v17 = v16;
  v149 = v16;
  int v150 = var1;
  if (var1 >= 1)
  {
    v146 = a5;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    uint64_t var3 = a4->var3;
    int v23 = v16;
    while (1)
    {
      double x = var3->x;
      double y = var3->y;
      *((void *)v23 + 2) = *(void *)&var3->x;
      *((double *)v23 + 3) = y;
      int v26 = lineEquationThroughTwoPoints((float *)v23, v13, v15, x, y);
      if (v26) {
        goto LABEL_120;
      }
      float v27 = x - v13;
      float v28 = y - v15;
      *((double *)v23 + 4) = v27;
      *((double *)v23 + 5) = v28;
      if (v10) {
        printf("sector %d:\n", v18);
      }
      int v151 = v20;
      float v29 = sqrtf((float)(v28 * v28) + (float)(v27 * v27));
      double v30 = v29;
      float v31 = 1.0 / v29;
      float v32 = v31 * v27;
      float v33 = v31 * v28;
      float v34 = v30 * 0.8;
      float v35 = fminf(v34, 4.0);
      int v36 = (int)rintf(v35 + v35);
      double v37 = x - (float)(v32 * v35);
      double v38 = y - (float)(v33 * v35);
      float v39 = v37;
      *(float *)&double v30 = v38;
      unsigned int v40 = bilinearLookup((uint64_t)a3, v39, *(float *)&v30);
      unsigned int v41 = v40;
      *((_DWORD *)v23 + 12) = v40;
      *(void *)(v23 + 52) = v40;
      if (v36 < 2)
      {
        signed int v49 = 0;
        int v51 = v40;
        int v50 = v40;
        if (!v10) {
          goto LABEL_24;
        }
      }
      else
      {
        double v42 = v32;
        double v43 = v33;
        int v44 = v36 - 1;
        do
        {
          double v37 = v37 + v42;
          double v38 = v38 + v43;
          float v45 = v37;
          float v46 = v38;
          int v47 = bilinearLookup((uint64_t)a3, v45, v46);
          int v48 = v47;
          if (v10) {
            printf("%d ", v47);
          }
          signed int v49 = *((_DWORD *)v23 + 14);
          if ((int)(v41 - v48) > v49)
          {
            *((_DWORD *)v23 + 14) = v41 - v48;
            signed int v49 = v41 - v48;
          }
          int v50 = *((_DWORD *)v23 + 13);
          if (v48 > v50)
          {
            *((_DWORD *)v23 + 13) = v48;
            int v50 = v48;
          }
          int v51 = *((_DWORD *)v23 + 12);
          if (v48 < v51)
          {
            *((_DWORD *)v23 + 12) = v48;
            int v51 = v48;
          }
          unsigned int v41 = v48;
          --v44;
        }
        while (v44);
        if (!v10) {
          goto LABEL_24;
        }
      }
      printf(" -- max %d min %d grad %d\n", v50, v51, v49);
      int v51 = *((_DWORD *)v23 + 12);
      int v50 = *((_DWORD *)v23 + 13);
      signed int v49 = *((_DWORD *)v23 + 14);
LABEL_24:
      int var1 = v150;
      double v52 = (float)(v50 - v51);
      float v53 = 255.0 / (v52 * 0.8);
      *(float *)&double v52 = -(((float)v51 + v52 * 0.1) * v53);
      *((float *)v23 + 15) = v53;
      *((_DWORD *)v23 + 16) = LODWORD(v52);
      v19 += v49;
      v21 += v50;
      int v20 = v51 + v151;
      ++v18;
      ++var3;
      v23 += 80;
      if (v18 == v150)
      {
        float v55 = (float)v21;
        float v56 = (float)v19;
        float v57 = (float)v20;
        float v17 = v149;
        a5 = v146;
        goto LABEL_31;
      }
    }
  }
  float v55 = 0.0;
  float v57 = 0.0;
  float v56 = 0.0;
LABEL_31:
  float v58 = v55 / (float)var1;
  if (v10) {
    printf("max average %.1f min average %.1f max gradient %.1f\n", v58, (float)(v57 / (float)var1), (float)(v56 / (float)var1));
  }
  if (var1 >= 1)
  {
    float v59 = (int *)(v17 + 76);
    int v60 = var1;
    do
    {
      float v61 = *((float *)v59 - 4);
      float v62 = *((float *)v59 - 3);
      int v63 = (int)rintf(v62 + (float)(v58 * v61));
      if (v63 >= 255) {
        int v63 = 255;
      }
      *float v59 = v63 & ~(v63 >> 31);
      *((float *)v59 - 2) = v61;
      *((float *)v59 - 1) = v62;
      v59 += 20;
      --v60;
    }
    while (v60);
    int v64 = 0;
    float v65 = v17 + 156;
    uint64_t v66 = -1;
    float v67 = v17;
    do
    {
      if (*((int *)v67 + 19) <= 199 && var1 != 1)
      {
        int v69 = -1;
        uint64_t v70 = v66;
        while (1)
        {
          int v71 = var1 & ((v64 + v69) >> 31);
          uint64_t v72 = v70 + v71;
          if (*(int *)&v17[80 * v72 + 76] > 200) {
            break;
          }
          --v69;
          --v70;
          if (!(var1 + v69)) {
            goto LABEL_60;
          }
        }
        if (var1 + v69)
        {
          if (var1 == 1)
          {
            int v73 = v64 + v71 + v69;
            int v74 = 1;
          }
          else
          {
            int v74 = 1;
            float v75 = v65;
            while (1)
            {
              int v76 = v64 + v74 >= var1 ? var1 : 0;
              if (*(int *)&v75[-80 * v76] > 200) {
                break;
              }
              v75 += 80;
              if (var1 == ++v74) {
                goto LABEL_60;
              }
            }
            int v73 = v64 - v76 + v74;
          }
          if (v74 != var1) {
            *(float32x2_t *)(v67 + 68) = vmla_n_f32(*(float32x2_t *)&v17[80 * v72 + 60], vsub_f32(*(float32x2_t *)&v17[80 * v73 + 60], *(float32x2_t *)&v17[80 * v72 + 60]), (float)-(float)v69 / (float)(v74 - v69));
          }
        }
      }
LABEL_60:
      ++v64;
      v67 += 80;
      ++v66;
      v65 += 80;
    }
    while (v64 != var1);
    float v77 = v17 + 68;
    int v78 = var1;
    do
    {
      *(v77 - 1) = *v77;
      v77 += 10;
      --v78;
    }
    while (v78);
  }
  int var0 = a3->var0;
  uint64_t var6 = a3->var6;
  uint64_t v81 = a3->var3;
  int var2 = a3->var2;
  int v145 = a3->var1;
  uint64_t v82 = a5->var3;
  uint64_t v83 = a5->var6;
  float v140 = a5->var0;
  float v141 = var0;
  bzero(a5->var0, a5->var5);
  if (var1 < 1)
  {
LABEL_119:
    free(v149);
    return 0;
  }
  else
  {
    int v84 = 0;
    float v85 = v13;
    float v86 = v15;
    double v87 = v85;
    double v88 = v86;
    __asm { FMOV            V0.2D, #5.0 }
    float64x2_t v143 = _Q0;
    int v93 = v149;
    int v142 = v10;
    while (1)
    {
      if (v84 + 1 == var1) {
        int v94 = 0;
      }
      else {
        int v94 = v84 + 1;
      }
      float v95 = &v149[80 * v94];
      double v96 = *((double *)v93 + 2) + *((double *)v93 + 4) * 5.0;
      double v97 = *((double *)v93 + 3) + *((double *)v93 + 5) * 5.0;
      float64x2_t v98 = vmlaq_f64(*((float64x2_t *)v95 + 1), v143, *((float64x2_t *)v95 + 2));
      float v99 = v96;
      if (v96 > v87) {
        float v100 = v96;
      }
      else {
        float v100 = v85;
      }
      if (v96 < v87)
      {
        float v101 = v85;
      }
      else
      {
        float v99 = v85;
        float v101 = v100;
      }
      if (v97 > v88) {
        float v102 = v97;
      }
      else {
        float v102 = v86;
      }
      if (v97 < v88) {
        float v103 = v97;
      }
      else {
        float v103 = v86;
      }
      if (v97 < v88) {
        float v104 = v86;
      }
      else {
        float v104 = v102;
      }
      double v105 = v99;
      if (v98.f64[0] > v101) {
        float v106 = v98.f64[0];
      }
      else {
        float v106 = v101;
      }
      if (v98.f64[0] < v105) {
        float v107 = v98.f64[0];
      }
      else {
        float v107 = v99;
      }
      if (v98.f64[0] >= v105) {
        float v101 = v106;
      }
      int v152 = v84 + 1;
      int v147 = v84;
      int v148 = v94;
      if (v98.f64[1] >= v103)
      {
        if (v98.f64[1] > v104) {
          float v104 = v98.f64[1];
        }
      }
      else
      {
        float v103 = v98.f64[1];
      }
      signed int v108 = vcvtps_s32_f32(v101);
      signed int v109 = vcvtps_s32_f32(v104);
      int v110 = var2 >= v109 ? v109 : var2;
      int v111 = v145 >= v108 ? v108 : v145;
      uint64_t v153 = *(void *)v93;
      float v154 = *((float *)v93 + 2);
      float v156 = *((float *)v95 + 2);
      float32x2_t v155 = *(float32x2_t *)v95;
      float32x2_t v155 = vneg_f32(v155);
      float v156 = -v156;
      int v26 = lineEquationThroughTwoPoints(&v157, v96, v97, v98.f64[0], v98.f64[1]);
      if (v26) {
        break;
      }
      int var1 = v150;
      if (v142)
      {
        printf("sector %d ", v147);
        float v112 = *((float *)v93 + 15);
        float v113 = *((float *)v93 + 16);
        int v114 = (int)rintf(v113 + (float)(v58 * v112));
        if (v114 >= 255) {
          int v114 = 255;
        }
        printf("factor %.3f offset %.3f max sample %d\n", v112, v113, v114 & ~(v114 >> 31));
      }
      int v115 = vcvtms_s32_f32(v103);
      int v116 = v115 & ~(v115 >> 31);
      if (v116 < v110)
      {
        int v117 = vcvtms_s32_f32(v107);
        int v118 = v117 & ~(v117 >> 31);
        float v119 = &v140[(int)v82 * (uint64_t)v116];
        int v120 = &v141[(int)v81 * (uint64_t)v116];
        float v121 = *((float *)&v153 + 1);
        float v122 = v154;
        float32x2_t v123 = v155;
        float v124 = v156;
        v125 = &v149[80 * v148];
        float v126 = (float *)(v125 + 60);
        v127 = (float *)(v125 + 64);
        do
        {
          if (v118 < v111)
          {
            float v128 = &v119[(int)v83 * (uint64_t)v118];
            v129 = &v120[(int)var6 * (uint64_t)v118];
            int v130 = v118;
            do
            {
              uint64_t v131 = 0;
              float v132 = (float)v130;
              while ((float)(*(float *)((char *)&v153 + v131 + 8)
                            + (float)((float)(*(float *)((char *)&v153 + v131 + 4) * (float)v116)
                                    + (float)(*(float *)((char *)&v153 + v131) * v132))) > 0.0)
              {
                v131 += 12;
                if (v131 == 36)
                {
                  float v133 = (float)(v122 + (float)((float)(v121 * (float)v116) + (float)(*(float *)&v153 * v132)))
                       / (float)((float)(v122 + (float)((float)(v121 * (float)v116) + (float)(*(float *)&v153 * v132)))
                               + (float)(v124 + (float)((float)(v123.f32[1] * (float)v116) + (float)(v123.f32[0] * v132))));
                  float v134 = *((float *)v93 + 16);
                  float v135 = *((float *)v93 + 15) + (float)(v133 * (float)(*v126 - *((float *)v93 + 15)));
                  *(float *)&unsigned int v136 = *v127 - v134;
                  float v137 = v134 + (float)(v133 * *(float *)&v136);
                  LOBYTE(v136) = *v129;
                  int v138 = (int)rintf(v137 + (float)((float)v136 * v135));
                  if (v138 >= 255) {
                    int v138 = 255;
                  }
                  *float v128 = v138 & ~(v138 >> 31);
                  break;
                }
              }
              ++v130;
              v129 += var6;
              v128 += v83;
            }
            while (v130 != v111);
          }
          ++v116;
          v120 += v81;
          v119 += v82;
        }
        while (v116 != v110);
      }
      v93 += 80;
      int v84 = v152;
      if (v152 == v150) {
        goto LABEL_119;
      }
    }
LABEL_120:
    int v54 = v26;
    free(v149);
  }
  return v54;
}

- (BOOL)edgePoint:(CGPoint *)a3 withBitmap:(id *)a4 center:(CGPoint)a5 perp:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double v9 = a5.y;
  double v10 = a5.x;
  uint64_t v11 = 0;
  v66[22] = *MEMORY[0x1E4F143B8];
  uint64_t v63 = 0;
  v64[0] = 0;
  double v12 = a5.x + a6.x * -7.0;
  p_uint64_t samplesPerPixel = &self->fullBitmap.samplesPerPixel;
  double v14 = a5.y + a6.y * -7.0;
  do
  {
    float v15 = v14;
    float v16 = v12;
    bilinearARGB8LookupComponents((uint64_t)a4, (_DWORD *)&v63 + 1, v64, (_DWORD *)v64 + 1, &v63, v16, v15);
    switch(p_samplesPerPixel[124])
    {
      case 1:
        int v18 = v64[0];
        int v17 = HIDWORD(v64[0]);
        int v19 = 1202 * LODWORD(v64[0]) + 2660 * HIDWORD(v64[0]) + 234 * HIDWORD(v63);
        goto LABEL_13;
      case 2:
        int v18 = v64[0];
        int v17 = HIDWORD(v64[0]);
        int v23 = 257 * HIDWORD(v64[0]) * LODWORD(v64[0]) - 13107 * HIDWORD(v63) + 0x8000;
        int v24 = v23 >> 16;
        goto LABEL_11;
      case 3:
        int v18 = v64[0];
        int v17 = HIDWORD(v64[0]);
        int v23 = ((2 * HIDWORD(v64[0])) | 1) - (LODWORD(v64[0]) + HIDWORD(v63));
        int v24 = v23 >> 1;
LABEL_11:
        int v22 = v24 & ~(v23 >> 31);
        break;
      case 4:
        int v18 = v64[0];
        int v17 = HIDWORD(v64[0]);
        int v19 = 2404 * LODWORD(v64[0]) + 1225 * HIDWORD(v64[0]) + 467 * HIDWORD(v63);
LABEL_13:
        int v22 = (v19 + 2048) >> 12;
        break;
      case 5:
        int v18 = v64[0];
        int v17 = HIDWORD(v64[0]);
        int v22 = HIDWORD(v64[0]);
        break;
      case 6:
        int v18 = v64[0];
        int v17 = HIDWORD(v64[0]);
        int v25 = ((1638 * ((257 * HIDWORD(v63) * ((257 * HIDWORD(v64[0]) * LODWORD(v64[0])) >> 16)) >> 16) + 2048) >> 12)
            + ((-4915 * LODWORD(v64[0]) + (HIDWORD(v64[0]) << 13) + 1229) >> 12);
        if (v25 >= 255) {
          int v25 = 255;
        }
        goto LABEL_45;
      case 7:
        int v18 = v64[0];
        int v17 = HIDWORD(v64[0]);
        if (10 * HIDWORD(v64[0]) <= 2295) {
          int v27 = 2295;
        }
        else {
          int v27 = 10 * HIDWORD(v64[0]);
        }
        int v28 = 10 * LODWORD(v64[0]);
        if (10 * LODWORD(v64[0]) <= 2295) {
          int v28 = 2295;
        }
        int v29 = v28 - 2295;
        int v30 = 5 * HIDWORD(v63);
        if (5 * HIDWORD(v63) <= 1020) {
          int v30 = 1020;
        }
        int v31 = ((257 * v30 - 262140) * (((257 * v27 - 589815) * v29) >> 16)) >> 16;
        int v26 = 257
            * ((HIDWORD(v64[0]) - HIDWORD(v63)) & ~((HIDWORD(v64[0]) - HIDWORD(v63)) >> 31))
            * ((2570
              * HIDWORD(v64[0])
              * ((HIDWORD(v64[0]) - LODWORD(v64[0])) & ~((HIDWORD(v64[0]) - LODWORD(v64[0])) >> 31))) >> 16);
        int v22 = (v31 + (v26 >> 16)) & ~((v31 + (v26 >> 16)) >> 31);
        goto LABEL_42;
      case 8:
        int v18 = v64[0];
        int v17 = HIDWORD(v64[0]);
        if (SHIDWORD(v64[0]) <= SLODWORD(v64[0])) {
          int v32 = v64[0];
        }
        else {
          int v32 = HIDWORD(v64[0]);
        }
        if (SHIDWORD(v64[0]) >= SLODWORD(v64[0])) {
          int v33 = v64[0];
        }
        else {
          int v33 = HIDWORD(v64[0]);
        }
        if (SHIDWORD(v63) > v32) {
          int v32 = HIDWORD(v63);
        }
        if (SHIDWORD(v63) < v33) {
          int v33 = HIDWORD(v63);
        }
        int v34 = v32 - v33;
        int v35 = v32 + v33;
        if (v35 > 255) {
          int v35 = 510 - v35;
        }
        if (v35 <= 1) {
          int v35 = 1;
        }
        int v36 = 255 * v34 / v35;
        if (v36 >= 255) {
          int v36 = 255;
        }
        int v37 = 257
            * v34
            * ((257
              * ((2404 * LODWORD(v64[0]) + 1225 * HIDWORD(v64[0]) + 467 * HIDWORD(v63) + 2048) >> 12)
              * ((257 * ((257 * HIDWORD(v64[0]) * LODWORD(v64[0])) >> 16) * v36) >> 16)) >> 16);
        int v22 = (__int16)(v37 >> 14) & ~((4 * v37) >> 31);
LABEL_42:
        if (v22 >= 255) {
          int v22 = 255;
        }
        break;
      case 9:
        int v18 = v64[0];
        int v17 = HIDWORD(v64[0]);
        int v25 = HIDWORD(v64[0]) - (LODWORD(v64[0]) + ((257 * HIDWORD(v64[0]) * LODWORD(v64[0])) >> 16));
LABEL_45:
        int v22 = v25 & ~(v25 >> 31);
        break;
      default:
        int v18 = v64[0];
        int v17 = HIDWORD(v64[0]);
        int v20 = -4915 * LODWORD(v64[0]) + (HIDWORD(v64[0]) << 13);
        unsigned int v21 = (v20 + 1229) >> 12;
        if (v21 >= 0xFF) {
          unsigned int v21 = 255;
        }
        if (v20 >= -1229) {
          int v22 = v21;
        }
        else {
          int v22 = 0;
        }
        break;
    }
    double v38 = (int *)&v64[v11 + 1];
    *double v38 = v22;
    v38[1] = v17;
    int v39 = HIDWORD(v63);
    v38[2] = v18;
    v38[3] = v39;
    double v12 = x + v16;
    double v14 = y + v15;
    v11 += 2;
  }
  while (v11 != 30);
  int v40 = 0;
  int v41 = 0;
  int v42 = 0;
  int v43 = 0;
  int v44 = v65;
  float v45 = v66;
  int v46 = -1;
  for (int i = 2; i != 13; ++i)
  {
    int v48 = *(v45 - 16) + ((6144 * *(v45 - 12) + 2048) >> 12);
    int v49 = *(v45 - 4);
    int v50 = *v45 + ((6144 * v49 + 2048) >> 12);
    if (v50 > v48 && v50 - v48 > v43)
    {
      int v41 = v44 + ((6144 * v44 + 2048) >> 12);
      int v43 = v50 - v48;
      int v42 = *(v45 - 16) + ((6144 * *(v45 - 12) + 2048) >> 12);
      int v40 = *v45 + ((6144 * v49 + 2048) >> 12);
      int v46 = i;
    }
    v45 += 4;
    int v44 = v49;
  }
  if (v46 == -1)
  {
    double v55 = 0.0;
    double v56 = 0.0;
  }
  else
  {
    float v51 = (float)v40;
    float v52 = (float)v41;
    float v53 = (float)((float)v42 + (float)v40) * 0.5;
    if ((float)v41 >= (float)v42)
    {
      float v57 = 0.0;
      if (v53 > v52) {
        float v57 = (float)(v53 - v52) / (float)(v51 - v52);
      }
      float v58 = (float)((float)(v53 - (float)v42) / (float)(v52 - (float)v42)) + -1.0;
      if (v53 < v52) {
        float v59 = (float)((float)(v53 - (float)v42) / (float)(v52 - (float)v42)) + -1.0;
      }
      else {
        float v59 = v57;
      }
      if (v52 > v51) {
        float v54 = v58;
      }
      else {
        float v54 = v59;
      }
    }
    else
    {
      float v54 = (float)(v53 - v52) / (float)(v51 - v52);
    }
    double v60 = (float)(v54 + (float)(v46 - 7));
    double v55 = v10 + v60 * x;
    double v56 = v9 + v60 * y;
  }
  BOOL result = v46 != -1;
  a3->double x = v55;
  a3->double y = v56;
  return result;
}

+ (void)insertIntoConnectionHopper:(id *)a3 index1:(int)a4 drop1:(int)a5 index2:(int)a6 drop2:(int)a7 score:(float)a8
{
  uint64_t var0 = a3->var0;
  if ((int)var0 < 1)
  {
    LODWORD(v9) = 0;
LABEL_9:
    if ((int)var0 <= 18) {
      int v11 = var0 - 1;
    }
    else {
      int v11 = 18;
    }
    if (v11 >= (int)v9)
    {
      uint64_t v12 = v11 + 1;
      double v13 = &a3->var1[v11 + 1];
      do
      {
        *(_OWORD *)&v13->uint64_t var0 = *(_OWORD *)&v13[-1].var0;
        v13->int var4 = v13[-1].var4;
        --v13;
        --v12;
      }
      while (v12 > v9);
      LODWORD(var0) = a3->var0;
    }
    double v14 = (char *)a3 + 20 * v9;
    *((_DWORD *)v14 + 1) = a4;
    *((_DWORD *)v14 + 2) = a5;
    *((_DWORD *)v14 + 3) = a6;
    *((_DWORD *)v14 + 4) = a7;
    *((float *)v14 + 5) = a8;
    if ((int)var0 < 20) {
      int v15 = var0 + 1;
    }
    else {
      int v15 = 20;
    }
    a3->uint64_t var0 = v15;
    return;
  }
  uint64_t v9 = 0;
  p_int var4 = &a3->var1[0].var4;
  while (*p_var4 <= a8)
  {
    ++v9;
    p_var4 += 5;
    if (var0 == v9)
    {
      LODWORD(v9) = a3->var0;
      break;
    }
  }
  if (v9 <= 0x13) {
    goto LABEL_9;
  }
}

- (void)printConnectionHopper:(id *)a3 message:(char *)a4
{
  printf("\n%s -- hopper with %d elements total\n", a4, a3->var0);
  if (a3->var0 >= 1)
  {
    int v5 = 0;
    uint64_t v6 = 4;
    do
    {
      printf("  element %d i %3d/%d j %3d/%d score %5.3f\n", v5++, *(int *)((char *)&a3->var0 + v6), *(int *)((char *)&a3->var1[0].var0 + v6), *(int *)((char *)&a3->var1[0].var1 + v6), *(int *)((char *)&a3->var1[0].var2 + v6), *(float *)((char *)&a3->var1[0].var3 + v6));
      v6 += 20;
    }
    while (v5 < a3->var0);
  }
}

- (void)printThreadWithIndex:(int)a3
{
  threads = self->G.threads;
  if (*((unsigned char *)threads + 96 * a3 + 24))
  {
    printf("  ");
    if (*((unsigned char *)threads + 96 * a3 + 25)) {
      printf("closed ");
    }
    printf("thread %3d start %4d end %4d %3d points length %5.1f turn %6.1f");
  }
  else
  {
    printf("attempt to print invalid thread %d\n");
  }
}

- (void)printThreadsOnlyClosed:(BOOL)a3 message:(char *)a4
{
  BOOL v4 = a3;
  p_G = &self->G;
  printf("\n%s -- %d threads total\n", a4, self->G.nThreads);
  int nThreads = p_G->nThreads;
  if (nThreads >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = (char *)p_G->threads + 25;
    do
    {
      if (*(v9 - 1) && (!v4 || *v9))
      {
        [(CIRedEyeRepair3 *)self printThreadWithIndex:v8];
        putchar(10);
        int nThreads = p_G->nThreads;
      }
      v9 += 96;
      uint64_t v8 = (v8 + 1);
    }
    while ((int)v8 < nThreads);
  }
}

- (int)gatherThreadInfo:(id *)a3
{
  if (!a3->var6) {
    return 35;
  }
  points = self->G.points;
  int var0 = a3->var0;
  uint64_t v6 = (char *)points + 96 * a3->var0;
  a3->var5 = *((_DWORD *)v6 + 20);
  int v7 = *((_DWORD *)v6 + 17);
  if (v7 == -1)
  {
    float v16 = 0.0;
    unsigned int v11 = 1;
    float v15 = 0.0;
  }
  else
  {
    uint64_t v8 = (double *)((char *)points + 96 * var0);
    double v9 = *v8;
    double v10 = v8[1];
    unsigned int v11 = 1;
    float v12 = 0.0;
    float v13 = 1.0;
    float v14 = 0.0;
    float v15 = 0.0;
    float v16 = 0.0;
    do
    {
      double v17 = v9;
      double v18 = v10;
      int v19 = (double *)((char *)points + 96 * v7);
      double v9 = *v19;
      double v10 = v19[1];
      *(float *)&double v17 = *v19 - v17;
      *(float *)&double v18 = v10 - v18;
      float v20 = sqrtf((float)(*(float *)&v18 * *(float *)&v18) + (float)(*(float *)&v17 * *(float *)&v17));
      float v21 = v13 / fmaxf(v20, 0.00001);
      float v22 = v21 * *(float *)&v17;
      float v23 = v21 * *(float *)&v18;
      if (v11 >= 2)
      {
        long double v24 = asin((float)((float)(v14 * v23) - (float)(v22 * v12)));
        float v13 = 1.0;
        float v15 = v24 + v15;
      }
      float v16 = v16 + v20;
      ++v11;
      int v7 = *((_DWORD *)points + 24 * v7 + 17);
      float v12 = v23;
      float v14 = v22;
    }
    while (v7 != -1);
  }
  int result = 0;
  a3->int var2 = v11;
  a3->uint64_t var3 = v16;
  a3->int var4 = v15;
  return result;
}

- (int)findThreadsInGrid
{
  p_G = &self->G;
  self->G.int nThreads = 0;
  int nPoints = self->G.nPoints;
  if (nPoints < 1) {
    return 0;
  }
  uint64_t v5 = 0;
  float v13 = 0;
  p_double y = &self->FC.rightEye.y;
  while (1)
  {
    points = p_G->points;
    if (*((_DWORD *)points + 24 * v5 + 18) == -1)
    {
      int v8 = *((_DWORD *)points + 24 * v5 + 17);
      if (v8 != -1) {
        break;
      }
    }
LABEL_4:
    if (++v5 >= nPoints) {
      return 0;
    }
  }
  uint64_t v9 = v5;
  do
  {
    int v10 = v8;
    if (*((_DWORD *)points + 24 * v9 + 20) != *((_DWORD *)points + 24 * v5 + 20)) {
      return 33;
    }
    uint64_t v9 = v8;
    int v8 = *((_DWORD *)points + 24 * v8 + 17);
  }
  while (v8 != -1);
  int result = [(CIRedEyeRepair3 *)self newThread:&v13];
  if (!result)
  {
    float v12 = v13;
    *float v13 = v5;
    v12[1] = v10;
    *((_WORD *)v12 + 12) = 1;
    *((CGFloat *)v12 + 11) = p_y[62];
    int result = -[CIRedEyeRepair3 gatherThreadInfo:](self, "gatherThreadInfo:");
    if (!result)
    {
      int nPoints = p_G->nPoints;
      goto LABEL_4;
    }
  }
  return result;
}

- (int)connectThreadsInGrid
{
  memset(v44, 0, sizeof(v44));
  long long v43 = 0u;
  p_G = &self->G;
  if (self->G.nThreads >= 1)
  {
    uint64_t v3 = self;
    uint64_t v4 = 0;
    do
    {
      [(CIRedEyeRepair3 *)v3 putThreadAtIndex:v4];
      uint64_t v4 = (v4 + 1);
      int nThreads = p_G->nThreads;
    }
    while ((int)v4 < nThreads);
    if (nThreads >= 1)
    {
      p_double mincol = &v3->subRectangle.mincol;
      double v38 = v3;
      int v39 = &v3->subRectangle.mincol;
      while (1)
      {
        int v8 = 0;
        int v42 = 0;
        threads = p_G->threads;
        do
        {
          if (*((unsigned char *)threads + 24) && !*((unsigned char *)threads + 25))
          {
            int v10 = (double *)((char *)p_G->points + 96 * *((int *)threads + 1));
            v41[1] = threads;
            v41[0] = v8;
            v41[2] = v10;
            v41[3] = p_G;
            v41[4] = &v42;
            *(float *)&double v5 = *((float *)p_mincol + 124) + *((float *)p_mincol + 124);
            -[CIRedEyeRepair3 forAllGridThreadsNear:withinRadius:do:context:](v3, "forAllGridThreadsNear:withinRadius:do:context:", threadSearchAction, v41, *v10, v10[1], v5);
            int nThreads = p_G->nThreads;
          }
          ++v8;
          threads = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)threads + 96);
        }
        while (v8 < nThreads);
        int v11 = v42;
        if (v42 >= 1) {
          break;
        }
        if (!v42) {
          return 0;
        }
LABEL_50:
        int result = 0;
        int nThreads = p_G->nThreads;
        uint64_t v3 = v38;
        if (nThreads < 1) {
          return result;
        }
      }
      uint64_t v12 = 0;
      char v40 = 0;
      while (1)
      {
        float v13 = *((float *)v44 + 5 * v12);
        if (v13 > *((float *)p_mincol + 124) && (v40 & 1) == 0) {
          break;
        }
        float v14 = &v42 + 5 * v12;
        uint64_t v15 = v14[1];
        float v16 = p_G->threads;
        if (!*((unsigned char *)v16 + 96 * (int)v15 + 24)) {
          return 49;
        }
        uint64_t v17 = v14[3];
        if (!*((unsigned char *)v16 + 96 * (int)v17 + 24)) {
          return 49;
        }
        uint64_t v18 = v14[2];
        points = p_G->points;
        uint64_t v20 = *((int *)v16 + 24 * (int)v15 + 1);
        int v21 = v18;
        if ((int)v18 >= 1)
        {
          do
          {
            LODWORD(v20) = *((_DWORD *)points + 24 * v20 + 18);
            --v21;
          }
          while (v21);
        }
        uint64_t v22 = v14[4];
        uint64_t v23 = *((int *)v16 + 24 * (int)v17);
        int v24 = v22;
        if ((int)v22 >= 1)
        {
          do
          {
            LODWORD(v23) = *((_DWORD *)points + 24 * v23 + 17);
            --v24;
          }
          while (v24);
        }
        float v25 = pointToPointScore((uint64_t)points + 96 * (int)v20, (uint64_t)points + 96 * (int)v23);
        if (v25 != v13 || v25 == -1.0 || v25 == -2.0)
        {
          uint64_t v28 = v12 + 1;
          char v40 = 1;
          p_double mincol = v39;
        }
        else
        {
          if (v15 == v17)
          {
            *((unsigned char *)v16 + 96 * (int)v15 + 25) = 1;
          }
          else
          {
            int result = [(CIRedEyeRepair3 *)v38 connectThreads:v15 drop1:v18 and:v17 drop2:v22];
            if (result) {
              return result;
            }
            int v11 = v42;
          }
          p_double mincol = v39;
          uint64_t v28 = v12 + 1;
          if (v12 + 1 < v11)
          {
            int v30 = v12 + 1;
            do
            {
              int v31 = &v42 + 5 * v30;
              int v34 = v31[1];
              int v32 = v31 + 1;
              int v33 = v34;
              if (v34 == v15 || *((_DWORD *)&v43 + 5 * v30 + 2) == v17)
              {
                int v35 = v12 + 2;
                if ((int)v12 + 2 < v11)
                {
                  uint64_t v36 = v35;
                  int v37 = (char *)&v44[-1] + 20 * v35;
                  do
                  {
                    *(_OWORD *)(v37 - 20) = *(_OWORD *)v37;
                    *((_DWORD *)v37 - 1) = *((_DWORD *)v37 + 4);
                    ++v36;
                    int v11 = v42;
                    v37 += 20;
                  }
                  while (v36 < v42);
                }
                int v42 = --v11;
              }
              else
              {
                if (v33 == v17) {
                  *int v32 = v15;
                }
                LODWORD(v12) = v30;
              }
              int v30 = v12 + 1;
            }
            while ((int)v12 + 1 < v11);
          }
        }
        int v11 = v42;
        uint64_t v12 = v28;
        if (v28 >= v42)
        {
          if (v42) {
            goto LABEL_50;
          }
          return 0;
        }
      }
    }
  }
  return 0;
}

- (void)initBitmaps
{
  self->PB.O.baseAddress = 0;
  self->PB.OO.baseAddress = 0;
  self->PB.EP.baseAddress = 0;
  self->PB.D.baseAddress = 0;
  self->PB.G.baseAddress = 0;
  self->PB.M.baseAddress = 0;
  self->PB.S.baseAddress = 0;
  self->PB.P.baseAddress = 0;
}

- (void)termBitmaps
{
  p_PB = &self->PB;
  uint64_t v3 = &self->PB;
  baseAddress = v3->O.baseAddress;
  p_baseAddress = (void **)&v3->O.baseAddress;
  if (baseAddress) {
    termBitmap(p_baseAddress);
  }
  if (p_PB->OO.baseAddress) {
    termBitmap((void **)&p_PB->OO.baseAddress);
  }
  if (p_PB->EP.baseAddress) {
    termBitmap((void **)&p_PB->EP.baseAddress);
  }
  if (p_PB->D.baseAddress) {
    termBitmap((void **)&p_PB->D.baseAddress);
  }
  if (p_PB->G.baseAddress) {
    termBitmap((void **)&p_PB->G.baseAddress);
  }
  if (p_PB->M.baseAddress) {
    termBitmap((void **)&p_PB->M.baseAddress);
  }
  if (p_PB->S.baseAddress) {
    termBitmap((void **)&p_PB->S.baseAddress);
  }
  if (p_PB->P.baseAddress)
  {
    termBitmap((void **)&p_PB->P.baseAddress);
  }
}

- (void)removeRedundantPointsFromShape:(id *)a3 closerThan:(float)a4
{
  float v4 = a4 * a4;
  int var2 = a3->var2;
  uint64_t var0 = a3->var0;
  if ((int)var0 >= 1)
  {
    uint64_t v7 = 0;
    int v8 = 0;
    uint64_t v9 = a3->var2;
    while (1)
    {
      if (!v7) {
        goto LABEL_7;
      }
      int v10 = (double *)((char *)var2 + 48 * v8);
      float v11 = *(double *)v9 - *(v10 - 6);
      float v12 = *((double *)v9 + 1) - *(v10 - 5);
      if ((float)((float)(v12 * v12) + (float)(v11 * v11)) > v4) {
        break;
      }
LABEL_8:
      ++v7;
      uint64_t v9 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v9 + 48);
      if (var0 == v7) {
        goto LABEL_11;
      }
    }
    if (v7 != v8)
    {
      long long v13 = *(_OWORD *)v9;
      long long v14 = *((_OWORD *)v9 + 2);
      *((_OWORD *)v10 + 1) = *((_OWORD *)v9 + 1);
      *((_OWORD *)v10 + 2) = v14;
      *(_OWORD *)int v10 = v13;
    }
LABEL_7:
    ++v8;
    goto LABEL_8;
  }
  int v8 = 0;
LABEL_11:
  uint64_t v15 = (double *)((char *)var2 + 48 * v8);
  float v16 = *(double *)var2 - *(v15 - 6);
  float v17 = *((double *)var2 + 1) - *(v15 - 5);
  a3->uint64_t var0 = v8 - ((float)((float)(v17 * v17) + (float)(v16 * v16)) <= v4);
  -[CIRedEyeRepair3 computeLengthsAnglesAndDeltaAnglesForShape:](self, "computeLengthsAnglesAndDeltaAnglesForShape:");
}

- (void)computeLengthsAnglesAndDeltaAnglesForShape:(id *)a3
{
  int var0 = a3->var0;
  if (a3->var0 >= 1)
  {
    int v5 = 0;
    int var2 = a3->var2;
    do
    {
      if (v5 == var0 - 1) {
        uint64_t v7 = (double *)a3->var2;
      }
      else {
        uint64_t v7 = (double *)((char *)var2 + 48);
      }
      computeLengthAndAngle((uint64_t)var2, v7);
      ++v5;
      int var2 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var2 + 48);
      int var0 = a3->var0;
    }
    while (v5 < a3->var0);
    if (var0 >= 1)
    {
      int v8 = 0;
      uint64_t v9 = a3->var2;
      int v10 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v9 + 48 * var0);
      while (1)
      {
        float v11 = v8 ? v9 : v10;
        float v12 = *((float *)v9 + 5) - *((float *)v11 - 7);
        double v13 = v12;
        if (v12 < -3.14159265) {
          break;
        }
        if (v13 >= 3.14159265)
        {
          double v14 = v13 + -6.28318531;
          goto LABEL_16;
        }
LABEL_17:
        *((float *)v9 + 6) = v12;
        ++v8;
        uint64_t v9 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v9 + 48);
        if (var0 == v8) {
          return;
        }
      }
      double v14 = v13 + 6.28318531;
LABEL_16:
      float v12 = v14;
      goto LABEL_17;
    }
  }
}

- (void)removeSmallBumpsFromShape:(id *)a3 center:(CGPoint)a4 threshold:(float)a5
{
  int var0 = a3->var0;
  if (a3->var0 >= 1)
  {
    double y = a4.y;
    int v10 = 0;
    int var2 = a3->var2;
    uint64_t v12 = (uint64_t)var2;
    do
    {
      if (var0 >= 4)
      {
        unsigned int v13 = var0 - 1;
        if (v10 == var0 - 1) {
          double v14 = var2;
        }
        else {
          double v14 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v12 + 48);
        }
        uint64_t v15 = (double *)((char *)var2 + 48 * var0);
        if (v10) {
          uint64_t v15 = (double *)v12;
        }
        uint64_t v16 = (var0 - 2);
        if (v10 >= (int)v16) {
          float v17 = (double *)((char *)var2 + 48 * v10 + -48 * v16);
        }
        else {
          float v17 = (double *)(v12 + 96);
        }
        LODWORD(a4.x) = *(_DWORD *)(v12 + 24);
        LODWORD(a4.y) = *((_DWORD *)v14 + 6);
        if (*(float *)&a4.x < 0.0 != *(float *)&a4.y < 0.0)
        {
          float v18 = fabsf(*(float *)&a4.x) + fabsf(*(float *)&a4.y);
          a4.double x = fabsf(*(float *)&a4.x + *(float *)&a4.y);
          a4.double y = v18 * 0.333333;
          if (a4.y > a4.x)
          {
            double v19 = *(v15 - 6);
            double v20 = *(v15 - 5) - y;
            double v21 = *(double *)(v12 + 8) - y;
            double v22 = *((double *)v14 + 1) - y;
            double v23 = v17[1] - y;
            a4.double x = (*(double *)v12 + *(double *)v14) * 0.5;
            a4.double y = (v21 + v22) * 0.5;
            float v24 = (*(double *)v14 - *(double *)v12) * (v21 + v22) * 0.5
                + (*(double *)v12 - v19) * (v20 + v21) * 0.5
                + (*v17 - *(double *)v14) * (v22 + v23) * 0.5;
            *(float *)&double v19 = (*v17 - a4.x) * (v23 + a4.y - y) * 0.5 + (a4.x - v19) * (v20 + a4.y - y) * 0.5;
            if (vabds_f32(*(float *)&v19, v24) < a5)
            {
              *(CGPoint *)uint64_t v12 = a4;
              computeLengthAndAngle((uint64_t)(v15 - 6), (double *)v12);
              computeLengthAndAngle(v12, v17);
              if (v10 == v13)
              {
                memmove(var2, (char *)var2 + 48, 48 * v10--);
                v12 -= 48;
              }
              else if (v10 + 1 < var0)
              {
                float v25 = (char *)var2 + 48 * v10 + 48;
                int v26 = v10;
                do
                {
                  int v27 = (CGPoint *)((char *)var2 + 48 * v26);
                  a4 = *(CGPoint *)v25;
                  *(CGPoint *)&a4.double y = (CGPoint)*((_OWORD *)v25 + 1);
                  CGPoint v28 = (CGPoint)*((_OWORD *)v25 + 2);
                  v27[1] = *(CGPoint *)&a4.y;
                  v27[2] = v28;
                  *int v27 = a4;
                  ++v26;
                  v25 += 48;
                }
                while (v13 != v26);
              }
              --a3->var0;
              int v29 = (float *)((char *)var2 + 48 * v13);
              uint64_t v30 = (uint64_t)&v29[12 * v10 - 24];
              if (v10 >= 2) {
                uint64_t v30 = v12 - 96;
              }
              if (v10) {
                int v29 = (float *)v12;
              }
              int v31 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v12 + 48);
              if (v10 == v16) {
                int v31 = var2;
              }
              float v32 = *(v29 - 7);
              *(v29 - 6) = v32 - *(float *)(v30 + 20);
              LODWORD(a4.y) = *(_DWORD *)(v12 + 20);
              *(float *)(v12 + 24) = *(float *)&a4.y - v32;
              *(float *)&a4.double x = *((float *)v31 + 5) - *(float *)&a4.y;
              *((_DWORD *)v31 + 6) = LODWORD(a4.x);
              --v10;
              v12 -= 48;
              --var0;
            }
          }
        }
      }
      ++v10;
      v12 += 48;
    }
    while (v10 < var0);
  }

  -[CIRedEyeRepair3 computeLengthsAnglesAndDeltaAnglesForShape:](self, "computeLengthsAnglesAndDeltaAnglesForShape:", a3, a4.x, a4.y);
}

- (void)removeSpikesFromShape:(id *)a3
{
  unsigned int v5 = 0;
LABEL_2:
  LODWORD(var0) = a3->var0;
  if (a3->var0 >= 1)
  {
    int var2 = a3->var2;
    int v8 = -2;
    int v9 = 2;
    int v10 = 3;
    float v11 = var2;
    do
    {
      float v12 = 0.0;
      int v13 = v9;
      int v14 = v8;
      do
      {
        unsigned int v15 = ((v14 & ~(v14 >> 31)) + v13 - ((v14 & ~(v14 >> 31)) + v13 != 0)) / var0;
        if ((v14 & ~(v14 >> 31)) + v13) {
          ++v15;
        }
        int v16 = v14 + var0 * v15;
        do
        {
          int v17 = v16;
          BOOL v18 = __OFSUB__(v16, var0);
          v16 -= var0;
        }
        while (v16 < 0 == v18);
        float v19 = fabsf(*((float *)var2 + 12 * v17 + 6));
        if (v19 > v12) {
          float v12 = v19;
        }
        ++v14;
        --v13;
      }
      while (v14 != v10);
      *((float *)v11 + 11) = v12;
      float v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v11 + 48);
      ++v8;
      --v9;
      BOOL v43 = v10++ == var0 + 2;
    }
    while (!v43);
    int v20 = 0;
    char v21 = 0;
    while (1)
    {
      int v22 = v20 - 2;
      int v23 = (v22 & ~(v22 >> 31)) + 2;
      if (v23 == v20) {
        int v24 = v20;
      }
      else {
        int v24 = v20 + 1;
      }
      unsigned int v25 = v23 - v24;
      if (var0 <= 1) {
        unsigned int v26 = 1;
      }
      else {
        unsigned int v26 = var0;
      }
      float v27 = *((float *)var2 + 6);
      if (v23 == v20) {
        int v28 = v25 / v26;
      }
      else {
        int v28 = v25 / v26 + 1;
      }
      if (v20 <= 0) {
        int v29 = var0;
      }
      else {
        int v29 = 0;
      }
      int v30 = v20 + v29 - 1;
      int v31 = a3->var2;
      float v32 = (float *)((char *)v31 + 48 * v30);
      float v33 = *((float *)v31 + 12 * (v22 + var0 * v28) + 6);
      int v34 = v20 + 1;
      if (v20 + 1 >= (int)var0) {
        int v35 = var0;
      }
      else {
        int v35 = 0;
      }
      float v36 = *((float *)v31 + 12 * (v34 - v35) + 6);
      int v37 = var0 + v20 + 2;
      do
        v37 -= var0;
      while (v37 >= (int)var0);
      float v38 = fabsf(v27);
      float v39 = *((float *)v31 + 12 * v37 + 6);
      BOOL v40 = vabds_f32(v27, v32[6]) > 1.0;
      if (vabds_f32(v27, v33) > 1.0) {
        BOOL v40 = 1;
      }
      BOOL v41 = vabds_f32(v27, v36) > 1.0;
      if (vabds_f32(v27, v39) > 1.0) {
        BOOL v41 = 1;
      }
      if (v38 <= 1.57079633)
      {
        if (v38 <= 1.0) {
          goto LABEL_46;
        }
        int v42 = v40 && v41;
      }
      else
      {
        int v42 = 1;
      }
      BOOL v43 = v38 != *((float *)var2 + 11) || v42 == 0;
      if (!v43)
      {
        if (v34 < (int)var0)
        {
          uint64_t v44 = v34;
          uint64_t v45 = 48 * v20;
          do
          {
            int v46 = (_OWORD *)((char *)a3->var2 + v45);
            long long v47 = v46[4];
            *int v46 = v46[3];
            v46[1] = v47;
            v46[2] = v46[5];
            ++v44;
            uint64_t var0 = a3->var0;
            v45 += 48;
          }
          while (v44 < var0);
        }
        LODWORD(var0) = var0 - 1;
        a3->uint64_t var0 = var0;
        int var2 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var2 - 48);
        char v21 = 1;
        goto LABEL_51;
      }
LABEL_46:
      ++v20;
LABEL_51:
      int var2 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var2 + 48);
      if (v20 >= (int)var0)
      {
        if (v21)
        {
          [(CIRedEyeRepair3 *)self computeLengthsAnglesAndDeltaAnglesForShape:a3];
          if (v5++ < 2) {
            goto LABEL_2;
          }
        }
        return;
      }
    }
  }
}

- (void)slidingWindowAnalysisOfShape:(id *)a3 into:(id *)a4
{
  uint64_t v4 = 0;
  int var0 = a3->var0;
  uint64_t v6 = 28;
  do
  {
    int v7 = var0 >> ++v4;
    if ((var0 >> v4) > 1)
    {
      int v10 = v7 >> 1;
      int var2 = a3->var2;
      if (v7 < 0)
      {
        float v15 = 0.0;
      }
      else
      {
        int v12 = -v10;
        if (v10 >= 0) {
          int v13 = v10;
        }
        else {
          int v13 = -v10;
        }
        int v14 = v13 + 1;
        float v15 = 0.0;
        do
        {
          if (v12 >= var0) {
            int v16 = var0;
          }
          else {
            int v16 = 0;
          }
          if (v12 >= 0) {
            int v17 = -v16;
          }
          else {
            int v17 = var0;
          }
          float v15 = v15 + *((float *)var2 + 12 * v17 + 12 * v12++ + 6);
        }
        while (v14 != v12);
      }
      if (var0 >= 1)
      {
        int v18 = var0 - v10;
        float v19 = (float *)((char *)var2 + v6);
        int v20 = var0;
        do
        {
          *float v19 = v15;
          v19 += 12;
          float v21 = v15 - *((float *)var2 + 12 * v18 + 6);
          if (v18 + 1 == var0) {
            int v18 = 0;
          }
          else {
            ++v18;
          }
          if (v10 + 1 == var0) {
            int v10 = 0;
          }
          else {
            ++v10;
          }
          float v15 = v21 + *((float *)var2 + 12 * v10 + 6);
          --v20;
        }
        while (v20);
      }
    }
    else if (var0 >= 1)
    {
      int v8 = a3->var2;
      int v9 = var0;
      do
      {
        *(_DWORD *)((char *)v8 + v6) = 0;
        int v8 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v8 + 48);
        --v9;
      }
      while (v9);
    }
    v6 += 4;
  }
  while (v4 != 4);
  uint64_t v22 = 0;
  float v23 = 1.0 / (float)var0;
  int v24 = (float *)((char *)a3->var2 + 28);
  do
  {
    unsigned int v25 = (_DWORD *)&a4->var0[v22];
    *unsigned int v25 = 0;
    v25[8] = 0;
    unsigned int v26 = (float *)(v25 + 8);
    v25[4] = 0;
    float v27 = (float *)(v25 + 4);
    v25[12] = 0;
    int v28 = v25 + 12;
    if (a3->var0 >= 1)
    {
      int v29 = 0;
      int v30 = 0;
      float v32 = 0.0;
      float v33 = v24;
      float v34 = 0.0;
      float v35 = 0.0;
      while (1)
      {
        float v36 = *v33;
        if (*v33 < 0.0) {
          *int v28 = ++v29;
        }
        if (v30)
        {
          if (v36 >= v34)
          {
            int v37 = v26;
            float v38 = v36;
            if (v36 <= v32) {
              goto LABEL_42;
            }
            goto LABEL_41;
          }
          int v37 = v27;
          float v38 = v32;
        }
        else
        {
          *float v27 = v36;
          int v37 = v26;
          float v38 = v36;
        }
        float v34 = v36;
LABEL_41:
        *int v37 = v36;
        float v32 = v38;
LABEL_42:
        float v31 = 3.14159265 / (float)(1 << v22);
        float v35 = vabds_f32(v36, v31) + v35;
        a4->var0[v22] = v35;
        ++v30;
        v33 += 12;
        if (v30 >= a3->var0) {
          goto LABEL_47;
        }
      }
    }
    float v35 = 0.0;
LABEL_47:
    a4->var0[v22++] = v23 * v35;
    ++v24;
  }
  while (v22 != 4);
}

- (int)updatedCheckpoint:(CGPoint *)a3 withCheckpoint:(CGPoint)a4 checkpointIndex:(int)a5 angle:(float)a6 width:(int)a7 height:(int)a8 inChannel:(id *)a9 threadIndex:(int)a10 returningEdgeWidth:(float *)a11
{
  double y = a4.y;
  double x = a4.x;
  v140[4] = *MEMORY[0x1E4F143B8];
  memset(v140, 0, 30);
  uint64_t v136 = 0;
  memset(v135, 0, sizeof(v135));
  if (self->inspector) {
    char v18 = [(RedEyeInspector3 *)self->inspector debuggingThisFaceAndEye:&self->S andThreadIndex:*(void *)&a10];
  }
  else {
    char v18 = 0;
  }
  int var0 = a9->var0;
  uint64_t var3 = a9->var3;
  uint64_t var6 = a9->var6;
  __double2 v23 = __sincos_stret(a6);
  float cosval = v23.__cosval;
  float sinval = v23.__sinval;
  float v26 = (float)a7 * 0.5;
  float v27 = (float)a8 * 0.5;
  double v28 = (float)(v26 * cosval);
  double v29 = (float)(v27 * sinval);
  double v30 = x + v28 + v29;
  float v120 = sinval;
  double v31 = (float)(v26 * sinval);
  float v123 = cosval;
  double v32 = (float)-(float)(cosval * v27);
  double v33 = y + v31 + v32;
  double v34 = x + v28 - v29;
  double v35 = y + v31 - v32;
  double v36 = x - v28;
  float v37 = v30;
  float v38 = v33;
  if (v34 >= v37)
  {
    float v39 = v30;
    if (v34 > v37) {
      float v37 = v34;
    }
  }
  else
  {
    float v39 = v34;
  }
  double v40 = y - v31;
  double v41 = v36 - v29;
  double v124 = x;
  if (v35 >= v38)
  {
    float v42 = v33;
    if (v35 > v38) {
      float v38 = v35;
    }
  }
  else
  {
    float v42 = v35;
  }
  double v43 = v40 - v32;
  if (v41 >= v39)
  {
    if (v41 > v37) {
      float v37 = v41;
    }
  }
  else
  {
    float v39 = v41;
  }
  double v44 = v36 + v29;
  double v121 = y;
  if (v43 >= v42)
  {
    if (v43 > v38) {
      float v38 = v43;
    }
  }
  else
  {
    float v42 = v43;
  }
  double v45 = v40 + v32;
  if (v44 >= v39)
  {
    if (v44 > v37) {
      float v37 = v44;
    }
  }
  else
  {
    float v39 = v44;
  }
  if (v45 >= v42)
  {
    if (v45 > v38) {
      float v38 = v45;
    }
  }
  else
  {
    float v42 = v45;
  }
  float v132 = 0.0;
  uint64_t v131 = 0;
  LODWORD(v22) = vcvtms_s32_f32(v39);
  unint64_t BitmapRect = makeBitmapRect(v22, vcvtms_s32_f32(v42), vcvtms_s32_f32(v37) + 1, vcvtms_s32_f32(v38) + 1);
  int v48 = BitmapRect;
  unint64_t v49 = v47 & 0xFFFFFFFF00000000;
  if ((v47 & 0x80000000) == 0) {
    unint64_t v49 = v47;
  }
  int var1 = a9->var1;
  if (var1 >= SHIDWORD(v49)) {
    unint64_t v51 = v49;
  }
  else {
    unint64_t v51 = v49 | ((unint64_t)var1 << 32);
  }
  if (a9->var2 >= SHIDWORD(BitmapRect)) {
    int var2 = HIDWORD(BitmapRect);
  }
  else {
    int var2 = a9->var2;
  }
  int result = lineEquationThroughTwoPoints((float *)&v131, v30, v33, v34, v35);
  if (!result)
  {
    float v130 = 0.0;
    uint64_t v129 = 0;
    int result = lineEquationThroughTwoPoints((float *)&v129, v34, v35, v41, v43);
    if (!result)
    {
      float v128 = 0.0;
      uint64_t v127 = 0;
      int result = lineEquationThroughTwoPoints((float *)&v127, v41, v43, v44, v45);
      if (!result)
      {
        float v126 = 0.0;
        uint64_t v125 = 0;
        int result = lineEquationThroughTwoPoints((float *)&v125, v44, v45, v30, v33);
        if (!result)
        {
          int v54 = v48 & ~(v48 >> 31);
          if (a8 >= 1)
          {
            bzero(v137, 4 * a8);
            bzero(v139, 4 * a8);
          }
          if (v54 < var2)
          {
            uint64_t v55 = v131;
            double v56 = &var0[(int)var3 * (uint64_t)v54];
            float v57 = v132;
            uint64_t v58 = v129;
            float v59 = v130;
            uint64_t v60 = v127;
            float v61 = v128;
            uint64_t v62 = v125;
            float v63 = v126;
            do
            {
              if ((int)v51 < SHIDWORD(v51))
              {
                uint64_t v64 = (int)var6 * (uint64_t)(int)v51;
                int v65 = v51;
                do
                {
                  float v66 = (float)v65;
                  if ((float)(v57
                             + (float)((float)(*((float *)&v55 + 1) * (float)v54) + (float)(*(float *)&v55 * (float)v65))) > 0.0)
                  {
                    float v67 = v59 + (float)((float)(*((float *)&v58 + 1) * (float)v54) + (float)(*(float *)&v58 * v66));
                    if (v67 > 0.0
                      && (float)(v61
                               + (float)((float)(*((float *)&v60 + 1) * (float)v54) + (float)(*(float *)&v60 * v66))) > 0.0
                      && (float)(v63
                               + (float)((float)(*((float *)&v62 + 1) * (float)v54) + (float)(*(float *)&v62 * v66))) > 0.0)
                    {
                      int v68 = vcvtms_s32_f32(v67);
                      if ((v68 & 0x80000000) == 0 && v68 < a8)
                      {
                        int v69 = v56[v64];
                        ++v137[v68];
                        v139[v68] += v69;
                      }
                    }
                  }
                  ++v65;
                  v64 += var6;
                }
                while (HIDWORD(v51) != v65);
              }
              ++v54;
              v56 += var3;
            }
            while (v54 != var2);
          }
          if (a8 < 1) {
            return 58;
          }
          uint64_t v70 = v135;
          int v71 = v137;
          uint64_t v72 = v139;
          uint64_t v73 = a8;
          do
          {
            int v74 = *v72++;
            int v75 = v74;
            int v76 = *v71++;
            *v70++ = (float)v75 / (float)v76;
            --v73;
          }
          while (v73);
          LOBYTE(v140[0]) = 0;
          if (a8 >= 2)
          {
            uint64_t v77 = a8 - 1;
            int v78 = &v138;
            float v79 = &v135[1];
            float v80 = (float *)&v134;
            uint64_t v81 = (char *)v140 + 1;
            do
            {
              if (*(v78 - 1) && *v78)
              {
                *uint64_t v81 = 1;
                *float v80 = fmaxf(*(v79 - 1) - *v79, 0.0);
              }
              else
              {
                *uint64_t v81 = 0;
              }
              ++v78;
              ++v79;
              ++v80;
              ++v81;
              --v77;
            }
            while (v77);
          }
          uint64_t v82 = 0;
          float v83 = 0.0;
          float v84 = 0.0;
          do
          {
            if (*((unsigned char *)v140 + v82))
            {
              float v85 = v133[v82];
              float v84 = v84 + v85;
              float v83 = v83 + (float)((float)(int)v82 * v85);
            }
            ++v82;
          }
          while (a8 != v82);
          if (v84 == 0.0)
          {
            return 58;
          }
          else
          {
            uint64_t v86 = 0;
            float v87 = 0.0;
            float v88 = v83 / v84;
            do
            {
              if (*((unsigned char *)v140 + v86)) {
                float v87 = v87
              }
                    + (float)((float)((float)((float)(int)v86 - v88) * (float)((float)(int)v86 - v88)) * v133[v86]);
              ++v86;
            }
            while (a8 != v86);
            float v89 = sqrtf(v87 / v84);
            *a11 = v89;
            float v90 = -1.0;
            float v91 = 0.0;
            int v92 = v135;
            int v93 = (unsigned __int8 *)v140;
            float v94 = 256.0;
            uint64_t v95 = a8;
            do
            {
              if (*v93++)
              {
                float v97 = *v92;
                if (*v92 < v94) {
                  float v94 = *v92;
                }
                if (v97 > v90) {
                  float v90 = *v92;
                }
                float v91 = v91 + v97;
              }
              ++v92;
              --v95;
            }
            while (v95);
            int v98 = 0;
            int v99 = 0;
            float v100 = 0.0;
            float v101 = v135;
            float v102 = (unsigned __int8 *)v140;
            float v103 = 0.0;
            uint64_t v104 = a8;
            float v105 = v91 / (float)a8;
            do
            {
              if (*v102++)
              {
                float v107 = *v101;
                if (*v101 >= v105)
                {
                  float v100 = v100 + v107;
                  ++v99;
                }
                else
                {
                  float v103 = v103 + v107;
                  ++v98;
                }
              }
              ++v101;
              --v104;
            }
            while (v104);
            float v108 = v103 / (float)v98;
            float v109 = v100 / (float)v99;
            if (v18)
            {
              double v110 = v108;
              printf("checkpoint %d bins (min %.2f max %.2f avg %.2f low avg %.2f high avg %.2f)\n", a5, v94, v90, v105, v108, v109);
              uint64_t v111 = 0;
              do
              {
                if (*((unsigned char *)v140 + v111))
                {
                  float v112 = v135[v111];
                  printf("  %6.2f", v112);
                  printf(" |");
                  if (v111)
                  {
                    int v113 = (int)rintf(v135[(v111 - 1)] - v112);
                    if (v113 >= 1)
                    {
                      do
                      {
                        putchar(42);
                        --v113;
                      }
                      while (v113);
                    }
                  }
                  putchar(10);
                }
                ++v111;
              }
              while (v111 != a8);
              printf("mean = %.2f SD = %.2f\n", v88, v89);
            }
            else
            {
              double v110 = v108;
            }
            float v114 = -(float)((float)a8 * 0.5);
            if (a8 >= 2)
            {
              uint64_t v115 = 0;
              float v116 = v110 + (float)(v109 - v108) * 0.2;
              do
              {
                if (*((unsigned char *)v140 + v115))
                {
                  float v117 = v135[v115++];
                  float v118 = v135[v115];
                  if (v117 > v116 && v118 <= v116)
                  {
                    float v114 = v114 + (float)((float)(v116 - v117) / (float)(v118 - v117));
                    break;
                  }
                }
                else
                {
                  ++v115;
                }
                float v114 = v114 + 1.0;
              }
              while (v115 != a8 - 1);
            }
            int result = 0;
            a3->double x = v124 + (float)(v114 * v120);
            a3->double y = v121 + (float)(v114 * (float)-v123);
          }
        }
      }
    }
  }
  return result;
}

- (int)newShape:(id *)a3 byInterpolatingBetweenCheckpoints:(id)a4[100] nc:(int)a5 usingVectorField:(id *)a6
{
  $79F3AD277E97AF61B58637F04D775907 *__attribute__((__org_arrdim(0,100))) v8 = a4;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (a5 < 1)
  {
    int v13 = 0;
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v11 = 0;
    LODWORD(v12) = 0;
    int v13 = 0;
    $79F3AD277E97AF61B58637F04D775907 *__attribute__((__org_arrdim(0,100))) v14 = a4;
    do
    {
      if (++v11 >= (unint64_t)a5) {
        int v15 = a5;
      }
      else {
        int v15 = 0;
      }
      int v16 = &v14[-v15];
      float v17 = v14->var0.x - v16[1].var0.x;
      float v18 = v14->var0.y - v16[1].var0.y;
      double v19 = sqrt((float)((float)(v18 * v18) + (float)(v17 * v17)));
      *(float *)&double v19 = v19 + v19 + v19 + v19;
      signed int v20 = vcvtps_s32_f32(*(float *)&v19);
      if (v13 <= v20) {
        int v13 = v20;
      }
      uint64_t v12 = (v12 + v20);
      ++v14;
    }
    while (a5 != v11);
  }
  float v21 = (float64x2_t *)malloc_type_malloc(16 * v13, 0x1000040451B5BE8uLL);
  if (!v21) {
    return 27;
  }
  uint64_t v22 = v21;
  uint64_t v55 = 0;
  int v23 = [(CIRedEyeRepair3 *)self newShape:&v55];
  if (!v23)
  {
    int v23 = [(CIRedEyeRepair3 *)self initShapePoints:v55 withMaxPoints:v12];
    if (!v23)
    {
      if (a5 < 1)
      {
LABEL_37:
        free(v22);
        int v24 = 0;
        *a3 = v55;
        return v24;
      }
      uint64_t v25 = 0;
      unint64_t v51 = &v22->f64[1];
      float v52 = a3;
      float v53 = v8;
      while (1)
      {
        p_double x = &v8[v25].var0.x;
        double v27 = *p_x;
        double v28 = p_x[1];
        int v23 = -[CIRedEyeRepair3 addPoint:toShapePoints:](self, "addPoint:toShapePoints:", v55, *p_x, v28, v51);
        if (v23) {
          break;
        }
        if (++v25 >= (unint64_t)a5) {
          int v29 = a5;
        }
        else {
          int v29 = 0;
        }
        uint64_t v30 = (int)v25 - v29;
        float64x2_t var0 = (float64x2_t)v8[v30].var0;
        float v32 = v27 - var0.f64[0];
        double y = v8[v30].var0.y;
        float v34 = v28 - y;
        float v35 = (float)(v34 * v34) + (float)(v32 * v32);
        double v36 = sqrt(v35);
        *(float *)&double v36 = v36 + v36 + v36 + v36;
        LODWORD(v8) = vcvtps_s32_f32(*(float *)&v36);
        if (v13 < (int)v8) {
          goto LABEL_39;
        }
        if ((int)v8 < 1) {
          goto LABEL_28;
        }
        float v37 = 0;
        int v38 = -1;
        float v39 = v51;
        float64x2_t v54 = var0;
        do
        {
          float v40 = v27;
          float v41 = v28;
          bilinearFloat4LookupComponents((uint64_t)a6, v56, v40, v41);
          float v42 = 6.28318531 - v56[3];
          __double2 v43 = __sincos_stret(v42);
          float64x2_t var0 = v54;
          double v27 = v27 + v43.__cosval * 0.5;
          double v28 = v28 + v43.__sinval * 0.5;
          *(v39 - 1) = v27;
          *float v39 = v28;
          float v44 = v54.f64[0] - v27;
          float v45 = y - v28;
          float v46 = (float)(v45 * v45) + (float)(v44 * v44);
          if (v46 < v35)
          {
            int v38 = (int)v37;
            float v35 = v46;
          }
          float v37 = ($79F3AD277E97AF61B58637F04D775907 *)((char *)v37 + 1);
          v39 += 2;
        }
        while (v8 != v37);
        if (v38 == -1) {
LABEL_28:
        }
          int v38 = 1;
        if (v38 >= (int)v8)
        {
LABEL_39:
          free(v22);
          return 27;
        }
        $79F3AD277E97AF61B58637F04D775907 *__attribute__((__org_arrdim(0,100))) v8 = v53;
        if (v38 >= 1)
        {
          uint64_t v47 = 0;
          float64x2_t v48 = vsubq_f64(var0, v22[v38]);
          do
          {
            v22[v47] = vmlaq_n_f64(v22[v47], v48, (float)((float)(1.0 / (float)v38) * (float)(int)v47));
            ++v47;
          }
          while (v38 != v47);
          uint64_t v49 = 0;
          while (!-[CIRedEyeRepair3 addPoint:toShapePoints:](self, "addPoint:toShapePoints:", v55, v22[v49].f64[0], v22[v49].f64[1]))
          {
            if (v38 == ++v49) {
              goto LABEL_36;
            }
          }
          free(v22);
          return 28;
        }
LABEL_36:
        a3 = v52;
        if (v25 == a5) {
          goto LABEL_37;
        }
      }
    }
  }
  int v24 = v23;
  free(v22);
  return v24;
}

- (int)improvedShape:(id *)a3 withShape:(id *)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  uint64_t v68 = 0;
  p_PB = &self->PB;
  p_G = &self->PB.G;
  inspector = self->inspector;
  if (inspector
    && [(RedEyeInspector3 *)inspector debuggingThisFaceAndEye:&self->S andThreadIndex:a4->var5])
  {
    [(RedEyeInspector3 *)self->inspector getIdentifyingString:v70 settings:&self->S];
    printf("\n%s %3d with %d points\n", v70, a4->var5, a4->var0);
    int v9 = 1;
  }
  else
  {
    int v9 = 0;
  }
  p_D = &p_PB->D;
  int var0 = a4->var0;
  if (a4->var0 < 1)
  {
    int v22 = 0;
    float v14 = 0.0;
    goto LABEL_23;
  }
  int v11 = 0;
  int v12 = 0;
  int var2 = a4->var2;
  float v14 = 0.0;
  do
  {
    float v15 = *((float *)var2 + 4);
    float v16 = *(double *)var2;
    float v17 = *((double *)var2 + 1);
    bilinearFloat4LookupComponents((uint64_t)p_G, v73, v16, v17);
    float v18 = 6.28318531 - v74 - *((float *)var2 + 5);
    double v19 = v18;
    if (v18 >= 3.14159265)
    {
      double v20 = v19 + -6.28318531;
    }
    else
    {
      if (v19 >= -3.14159265) {
        goto LABEL_12;
      }
      double v20 = v19 + 6.28318531;
    }
    float v18 = v20;
LABEL_12:
    if (fabsf(v18) < 0.17453)
    {
      if (v11 <= 99)
      {
        float v21 = &v70[24 * v11];
        *(_OWORD *)float v21 = *(_OWORD *)var2;
        *((_DWORD *)v21 + 4) = v12;
        *((_DWORD *)v21 + 5) = 0;
        ++v11;
      }
      if (v9)
      {
        printf("  %d\n", v12);
        int var0 = a4->var0;
      }
    }
    float v14 = v14 + v15;
    ++v12;
    int var2 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var2 + 48);
  }
  while (v12 < var0);
  int v22 = v11;
  if (v11 > 0)
  {
    uint64_t v23 = 0;
    uint64_t v24 = 20;
    do
    {
      *(float *)&v70[v24] = checkpointScore(v23++, (uint64_t)v70, v11, (uint64_t)a4);
      v24 += 24;
    }
    while (v11 != v23);
  }
  while (1)
  {
LABEL_23:
    uint64_t v25 = v22;
    if (v22 < 1)
    {
      int v27 = -1;
      double v32 = v14;
    }
    else
    {
      uint64_t v26 = 0;
      int v27 = -1;
      double v28 = (float *)v72;
      float v29 = v14;
      do
      {
        float v30 = *v28;
        v28 += 6;
        float v31 = v30;
        if (v30 < v29)
        {
          int v27 = v26;
          float v29 = v31;
        }
        ++v26;
      }
      while (v22 != v26);
      double v32 = v29;
    }
    BOOL v33 = v14 * 0.1 <= v32 || v22 <= 1;
    BOOL v34 = !v33;
    if (v22 <= 10 && !v34) {
      break;
    }
    int v35 = v27 + 1;
    if (v27 + 1 < v22)
    {
      double v36 = &v70[24 * v35];
      do
      {
        float v37 = &v70[24 * v35 - 24];
        long long v38 = *(_OWORD *)v36;
        *((void *)v37 + 2) = *((void *)v36 + 2);
        *(_OWORD *)float v37 = v38;
        ++v35;
        v36 += 24;
      }
      while (v22 != v35);
    }
    --v22;
    if (v27 <= 0) {
      int v39 = v25 - 1;
    }
    else {
      int v39 = 0;
    }
    *(float *)&v72[3 * v27 - 3 + 3 * v39] = checkpointScore(v27 + v39 - 1, (uint64_t)v70, v22, (uint64_t)a4);
    if (v27 >= v22) {
      int v40 = v25 - 1;
    }
    else {
      int v40 = 0;
    }
    *(float *)&v72[3 * (v27 - v40)] = checkpointScore(v27 - v40, (uint64_t)v70, v22, (uint64_t)a4);
  }
  if (v9)
  {
    [(RedEyeInspector3 *)self->inspector getIdentifyingString:v69 settings:&self->S];
    printf("\n%s %3d with %d points and %d checkpoints\n", v69, a4->var5, a4->var0, v22);
    if (v22 >= 1)
    {
      float v41 = v71;
      uint64_t v42 = v22;
      do
      {
        printf("  %d (%.1f, %.1f)\n", *((_DWORD *)v41 + 2), *((double *)v41 - 1), *(double *)v41);
        v41 += 24;
        --v42;
      }
      while (v42);
    }
  }
  if (v22 > 1)
  {
    uint64_t v44 = 0;
    float v45 = v14 * 0.41;
    double v46 = v45;
    float v47 = v46 * 0.4;
    int v48 = (int)rintf(v47);
    if (v48 <= 3) {
      int v48 = 3;
    }
    float v49 = v46 * 0.8;
    int v50 = (int)rintf(v49);
    if (v48 >= 0xA) {
      uint64_t v51 = 10;
    }
    else {
      uint64_t v51 = v48;
    }
    if (v50 <= 6) {
      unsigned int v52 = 6;
    }
    else {
      unsigned int v52 = v50;
    }
    if (v52 >= 0x1E) {
      uint64_t v53 = 30;
    }
    else {
      uint64_t v53 = v52;
    }
    float v67 = 0.0;
    float v54 = 0.0;
    for (int i = v70; ; i += 24)
    {
      double v56 = *(double *)i;
      double v57 = *((double *)i + 1);
      float v58 = *(double *)i;
      float v59 = v57;
      bilinearFloat4LookupComponents((uint64_t)p_G, v73, v58, v59);
      *(float *)&double v60 = 6.28318531 - v74;
      int result = -[CIRedEyeRepair3 updatedCheckpoint:withCheckpoint:checkpointIndex:angle:width:height:inChannel:threadIndex:returningEdgeWidth:](self, "updatedCheckpoint:withCheckpoint:checkpointIndex:angle:width:height:inChannel:threadIndex:returningEdgeWidth:", i, v44, v51, v53, p_D, a4->var5, v56, v57, v60, &v67);
      if (result) {
        break;
      }
      float v54 = v54 + v67;
      if (v25 == ++v44)
      {
        if (v9)
        {
          [(RedEyeInspector3 *)self->inspector getIdentifyingString:v69 settings:&self->S];
          printf("\n%s after update %3d with %d points and %d checkpoints\n", v69, a4->var5, a4->var0, v25);
          float v61 = v71;
          uint64_t v62 = v25;
          do
          {
            printf("  %d (%.1f, %.1f)\n", *((_DWORD *)v61 + 2), *((double *)v61 - 1), *(double *)v61);
            v61 += 24;
            --v62;
          }
          while (v62);
          printf("edge width %.2f\n", (float)(v54 / (float)(int)v25));
        }
        int var5 = a4->var5;
        int result = [(CIRedEyeRepair3 *)self newShape:&v68 byInterpolatingBetweenCheckpoints:v70 nc:v25 usingVectorField:p_G];
        if (!result)
        {
          [(CIRedEyeRepair3 *)self computeLengthsAnglesAndDeltaAnglesForShape:v68];
          int result = 0;
          uint64_t v64 = v68;
          *(void *)(v68 + 16) = *(void *)&self->S.faceIndex;
          *(_DWORD *)(v64 + 24) = var5;
          *a3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v64;
        }
        return result;
      }
    }
  }
  else
  {
    int result = 0;
    *a3 = 0;
  }
  return result;
}

- (int)shape:(id *)a3 withThreadAtIndex:(int)a4 centroid:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  p_G = &self->G;
  threads = self->G.threads;
  inspector = self->inspector;
  if (inspector) {
    char v13 = [(RedEyeInspector3 *)inspector debuggingThisFaceAndEye:&self->S andThreadIndex:*(void *)&a4];
  }
  else {
    char v13 = 0;
  }
  int v27 = 0;
  uint64_t v28 = 0;
  int result = [(CIRedEyeRepair3 *)self newShape:&v28];
  if (!result)
  {
    int result = [(CIRedEyeRepair3 *)self initShapePoints:v28 withMaxPoints:*((unsigned int *)threads + 24 * a4 + 2)];
    if (!result)
    {
      uint64_t v15 = v28;
      *(void *)(v28 + 16) = *(void *)&self->S.faceIndex;
      *(_DWORD *)(v15 + 24) = a4;
      uint64_t v16 = (uint64_t)p_G->points + 96 * *((int *)threads + 24 * a4);
      int v17 = *(_DWORD *)(v16 + 68);
      if (v17 == -1)
      {
LABEL_10:
        int result = -[CIRedEyeRepair3 addPoint:toShapePoints:](self, "addPoint:toShapePoints:", v15, *(double *)v16, *(double *)(v16 + 8));
        if (!result)
        {
          if (*(_DWORD *)v28 == *(_DWORD *)(v28 + 4))
          {
            if (*(int *)v28 < 2) {
              return 48;
            }
            LODWORD(v19) = 1050790593;
            -[CIRedEyeRepair3 removeRedundantPointsFromShape:closerThan:](self, "removeRedundantPointsFromShape:closerThan:", v19);
            if (v13)
            {
              puts("\nbefore");
              if (*(int *)v28 >= 1)
              {
                int v21 = 0;
                uint64_t v22 = *(void *)(v28 + 8);
                do
                {
                  printf("%3d (%5.1f, %5.1f) %6.4f %6.1f° del %6.1f\n", v21++, *(double *)v22, *(double *)(v22 + 8), *(float *)(v22 + 16), *(float *)(v22 + 20) * 180.0 / 3.14159265, *(float *)(v22 + 24) * 180.0 / 3.14159265);
                  v22 += 48;
                }
                while (v21 < *(_DWORD *)v28);
              }
            }
            *(float *)&double v20 = self->S.scale * 1.5 * self->S.scale;
            [(CIRedEyeRepair3 *)self removeSmallBumpsFromShape:x center:y threshold:v20];
            if (*(int *)v28 > 1)
            {
              -[CIRedEyeRepair3 removeSpikesFromShape:](self, "removeSpikesFromShape:");
              uint64_t v23 = v28;
              shapes = p_G->shapes;
              int result = [(CIRedEyeRepair3 *)self improvedShape:&v27 withShape:v28];
              if (!result)
              {
                uint64_t v25 = v27;
                if (v27)
                {
                  uint64_t v26 = (uint64_t)p_G->shapes + 32 * ((v23 - (uint64_t)shapes) >> 5);
                  *(_DWORD *)(v26 + 24) = -1;
                  *(void *)(v26 + 16) = -1;
                }
                else
                {
                  uint64_t v25 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v28;
                }
                int result = 0;
                *a3 = v25;
              }
            }
            else
            {
              return 48;
            }
          }
          else
          {
            return 47;
          }
        }
      }
      else
      {
        while (1)
        {
          points = p_G->points;
          int result = -[CIRedEyeRepair3 addPoint:toShapePoints:](self, "addPoint:toShapePoints:", v28, *(double *)v16, *(double *)(v16 + 8));
          if (result) {
            break;
          }
          uint64_t v16 = (uint64_t)points + 96 * v17;
          int v17 = *(_DWORD *)(v16 + 68);
          if (v17 == -1)
          {
            uint64_t v15 = v28;
            goto LABEL_10;
          }
        }
      }
    }
  }
  return result;
}

- (int)closeThreadIndex:(int)a3 usingVectorField:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  inspector = self->inspector;
  if (inspector
    && [(RedEyeInspector3 *)inspector debuggingThisFaceAndEye:&self->S andThreadIndex:*(void *)&a3])
  {
    putchar(10);
  }
  int v10 = (int *)((char *)self->G.threads + 96 * a3);
  points = self->G.points;
  uint64_t v12 = 96 * *v10;
  char v13 = (double *)((char *)points + 96 * v10[1]);
  double v14 = *v13;
  double v15 = v13[1];
  float v16 = *v13 - v5;
  float64x2_t v42 = *(float64x2_t *)((char *)points + v12);
  double v17 = *(double *)((char *)points + v12 + 8);
  float v18 = v15 - v42.f64[1];
  float v19 = (float)(v18 * v18) + (float)(v16 * v16);
  double v20 = sqrt(v19);
  *(float *)&double v20 = v20 + v20 + v20 + v20;
  LODWORD(v4) = vcvtps_s32_f32(*(float *)&v20);
  int v21 = (double *)malloc_type_malloc(32 * v4, 0x1000040451B5BE8uLL);
  if (!v21) {
    return 20;
  }
  uint64_t v22 = (float64x2_t *)v21;
  if ((int)v4 < 1) {
    goto LABEL_21;
  }
  uint64_t v23 = 0;
  uint64_t v24 = v21 + 1;
  LODWORD(v25) = -1;
  do
  {
    float v26 = v14;
    float v27 = v15;
    bilinearFloat4LookupComponents((uint64_t)a4, v43, v26, v27);
    double v14 = v14 + v43[0] * 0.5;
    double v15 = v15 + v43[1] * 0.5;
    *(v24 - 1) = v14;
    *uint64_t v24 = v15;
    float v28 = v42.f64[0] - v14;
    float v29 = v17 - v15;
    float v30 = (float)(v29 * v29) + (float)(v28 * v28);
    if (v30 >= v19) {
      uint64_t v25 = v25;
    }
    else {
      uint64_t v25 = v23;
    }
    if (v30 < v19) {
      float v19 = v30;
    }
    ++v23;
    v24 += 2;
  }
  while (v4 != v23);
  if (v25 == -1)
  {
LABEL_21:
    int v40 = 21;
  }
  else if ((int)v25 < 1)
  {
LABEL_20:
    int v40 = 0;
  }
  else
  {
    uint64_t v31 = 0;
    float64x2_t v32 = vsubq_f64(v42, v22[(int)v25]);
    do
    {
      v22[v31] = vmlaq_n_f64(v22[v31], v32, (float)((float)(1.0 / (float)(int)v25) * (float)(int)v31));
      ++v31;
    }
    while (v25 != v31);
    BOOL v33 = (double *)v22;
    while (1)
    {
      int v34 = -[CIRedEyeRepair3 insertPoint:andDirection:intoGrid:](self, "insertPoint:andDirection:intoGrid:", 0, *v33, v33[1], v33[2 * (int)v4], v33[2 * (int)v4 + 1], *(_OWORD *)&v42);
      if (v34) {
        break;
      }
      uint64_t v35 = self->G.nPoints - 1;
      double v36 = self->G.points;
      float v37 = (char *)self->G.threads + 96 * a3;
      int v38 = *((_DWORD *)v37 + 1);
      *((_DWORD *)v36 + 24 * v38 + 17) = v35;
      int v39 = (char *)v36 + 96 * v35;
      *((_DWORD *)v39 + 17) = -1;
      *((_DWORD *)v39 + 18) = v38;
      LODWORD(v39) = *((_DWORD *)v37 + 2) + 1;
      *((_DWORD *)v37 + 1) = v35;
      *((_DWORD *)v37 + 2) = v39;
      v33 += 2;
      if (!--v25) {
        goto LABEL_20;
      }
    }
    int v40 = v34;
  }
  free(v22);
  return v40;
}

- (int)attemptClosureOfThreadIndex:(int)a3
{
  p_G = &self->G;
  threads = self->G.threads;
  double v5 = (int *)((char *)threads + 96 * a3);
  if (!*((unsigned char *)v5 + 24)) {
    return 22;
  }
  uint64_t v6 = *(void *)&a3;
  inspector = self->inspector;
  if (inspector
    && [(RedEyeInspector3 *)inspector debuggingThisFaceAndEye:&self->S andThreadIndex:*(void *)&a3])
  {
    [(CIRedEyeRepair3 *)self printThreadWithIndex:v6];
    putchar(10);
    uint64_t v10 = (uint64_t)p_G->points + 96 * *v5;
    printf("  0 %d (%.2f, %.2f)\n", *v5, *(double *)v10, *(double *)(v10 + 8));
    int v11 = *(_DWORD *)(v10 + 68);
    if (v11 != -1)
    {
      int v12 = 1;
      do
      {
        uint64_t v13 = (uint64_t)p_G->points + 96 * v11;
        printf("  %d %d (%.2f, %.2f)\n", v12++, v11, *(double *)v13, *(double *)(v13 + 8));
        int v11 = *(_DWORD *)(v13 + 68);
      }
      while (v11 != -1);
    }
    putchar(10);
  }
  points = p_G->points;
  int v15 = *v5;
  int v16 = *v5;
  double v17 = (double *)((char *)points + 96 * *v5);
  float v18 = (char *)threads + 96 * a3;
  int v21 = *((_DWORD *)v18 + 1);
  float v19 = (int *)(v18 + 4);
  int v20 = v21;
  uint64_t v22 = (char *)points + 96 * v21;
  double v23 = *(double *)v22;
  double v24 = *((double *)v22 + 1);
  double v25 = *v17;
  double v26 = v17[1];
  float v27 = *(double *)v22 - *v17;
  float v28 = v24 - v26;
  float v29 = sqrtf((float)(v28 * v28) + (float)(v27 * v27));
  int v32 = *((_DWORD *)v22 + 18);
  float v30 = (int *)(v22 + 72);
  int v31 = v32;
  if (v32 == -1)
  {
    int v34 = v20;
    int v33 = v20;
  }
  else
  {
    do
    {
      int v33 = v31;
      int v34 = v31;
      uint64_t v35 = (double *)((char *)points + 96 * v31);
      float v36 = v23 - *v35;
      float v37 = v24 - v35[1];
      if (sqrtf((float)(v37 * v37) + (float)(v36 * v36)) > v29) {
        break;
      }
      int v31 = *((_DWORD *)points + 24 * v34 + 18);
    }
    while (v31 != -1);
  }
  if (*((_DWORD *)points + 24 * v34 + 18) == -1) {
    int v39 = v33;
  }
  else {
    int v39 = *((_DWORD *)points + 24 * v34 + 18);
  }
  int v40 = (char *)points + 96 * v16;
  int v43 = *((_DWORD *)v40 + 17);
  float64x2_t v42 = (int *)(v40 + 68);
  int v41 = v43;
  if (v43 == -1)
  {
    char v59 = 0;
    float v52 = v29;
    goto LABEL_34;
  }
  LOBYTE(v44) = v15 != v39;
  float v45 = (float *)((char *)threads + 96 * a3 + 12);
  int v46 = -1;
  float v47 = 0.0;
  float v48 = 10000.0;
  double v49 = v26;
  double v50 = v25;
  int v51 = v41;
  float v52 = 10000.0;
  do
  {
    double v53 = v50;
    double v54 = v49;
    uint64_t v55 = (double *)((char *)points + 96 * v51);
    int v44 = v44 & (v51 != v39);
    double v50 = *v55;
    double v49 = v55[1];
    *(float *)&double v53 = v53 - *v55;
    *(float *)&double v54 = v54 - v49;
    float v47 = sqrt((float)((float)(*(float *)&v54 * *(float *)&v54) + (float)(*(float *)&v53 * *(float *)&v53))) + v47;
    if (v44 == 1)
    {
      float v56 = v23 - v50;
      float v57 = v24 - v49;
      float v58 = sqrtf((float)(v57 * v57) + (float)(v56 * v56));
      if (v58 < v52 && *v45 * 0.5 > v47)
      {
        int v46 = v51;
        float v52 = v58;
        float v48 = v47;
      }
    }
    int v51 = *((_DWORD *)points + 24 * v51 + 17);
  }
  while (v51 != -1);
  char v59 = 0;
  if (v46 != -1 && v52 < v29)
  {
    if (*v45 * 0.5 > v48)
    {
      double v60 = (char *)points + 96 * v46;
      int v61 = *((_DWORD *)v60 + 18);
      *((_DWORD *)v60 + 18) = -1;
      *double v5 = v46;
      *((_DWORD *)points + 24 * v61 + 17) = -1;
      int v41 = *v42;
      char v59 = 1;
      int v15 = v46;
      goto LABEL_31;
    }
    char v59 = 0;
  }
  float v52 = v29;
LABEL_31:
  while (v41 != -1)
  {
    int v15 = v41;
    int v16 = v41;
    uint64_t v62 = (double *)((char *)points + 96 * v41);
    float v63 = v25 - *v62;
    float v64 = v26 - v62[1];
    if (sqrtf((float)(v64 * v64) + (float)(v63 * v63)) > v29) {
      break;
    }
    int v41 = *((_DWORD *)points + 24 * v16 + 17);
  }
LABEL_34:
  int v65 = *((_DWORD *)points + 24 * v16 + 17);
  if (v65 == -1) {
    int v65 = v15;
  }
  int v66 = *v30;
  if (*v30 == -1) {
    goto LABEL_48;
  }
  LOBYTE(v67) = v20 != v65;
  uint64_t v68 = (float *)((char *)threads + 96 * a3 + 12);
  int v69 = -1;
  float v70 = 0.0;
  float v71 = 10000.0;
  float v72 = 10000.0;
  do
  {
    double v73 = v23;
    double v74 = v24;
    uint64_t v75 = (double *)((char *)points + 96 * v66);
    int v67 = v67 & (v66 != v65);
    double v23 = *v75;
    double v24 = v75[1];
    *(float *)&double v73 = v73 - *v75;
    *(float *)&double v74 = v74 - v24;
    float v70 = sqrt((float)((float)(*(float *)&v74 * *(float *)&v74) + (float)(*(float *)&v73 * *(float *)&v73))) + v70;
    if (v67 == 1)
    {
      float v76 = v25 - v23;
      float v77 = v26 - v24;
      float v78 = sqrtf((float)(v77 * v77) + (float)(v76 * v76));
      if (v78 < v72 && *v68 * 0.5 > v70)
      {
        int v69 = v66;
        float v72 = v78;
        float v71 = v70;
      }
    }
    int v66 = *((_DWORD *)points + 24 * v66 + 18);
  }
  while (v66 != -1);
  if (v69 == -1 || v72 >= v52 || *v68 * 0.5 <= v71)
  {
LABEL_48:
    if ((v59 & 1) == 0 && *((float *)threads + 24 * a3 + 3) * 0.2 <= v29)
    {
LABEL_52:
      if (*((unsigned char *)threads + 96 * a3 + 25)) {
        return 0;
      }
      else {
        return 23;
      }
    }
  }
  else
  {
    float v79 = (char *)points + 96 * v69;
    int v80 = *((_DWORD *)v79 + 17);
    *((_DWORD *)v79 + 17) = -1;
    *float v19 = v69;
    *((_DWORD *)points + 24 * v80 + 18) = -1;
  }
  int result = [(CIRedEyeRepair3 *)self closeThreadIndex:v6 usingVectorField:&self->PB.G];
  if (result == 21 || !result)
  {
    *((unsigned char *)threads + 96 * a3 + 25) = 1;
    int result = [(CIRedEyeRepair3 *)self gatherThreadInfo:v5];
    if (!result) {
      goto LABEL_52;
    }
  }
  return result;
}

- (CGPoint)threadCentroid:(id *)a3
{
  points = self->G.points;
  uint64_t v4 = (char *)points + 96 * a3->var0;
  float32x2_t v5 = vcvt_f32_f64(*(float64x2_t *)v4);
  int v6 = *((_DWORD *)v4 + 17);
  if (v6 == -1)
  {
    float v9 = 1.0;
  }
  else
  {
    int v7 = 1;
    do
    {
      $79F3AD277E97AF61B58637F04D775907 *__attribute__((__org_arrdim(0,100))) v8 = (char *)points + 96 * v6;
      ++v7;
      float32x2_t v5 = vcvt_f32_f64(vaddq_f64(*(float64x2_t *)v8, vcvtq_f64_f32(v5)));
      int v6 = *((_DWORD *)v8 + 17);
    }
    while (v6 != -1);
    float v9 = (float)v7;
  }
  float64x2_t v10 = vcvtq_f64_f32(vmul_n_f32(v5, 1.0 / v9));
  double v11 = v10.f64[1];
  result.double x = v10.f64[0];
  result.double y = v11;
  return result;
}

- (float)threadSignedArea:(id *)a3 centroid:(CGPoint)a4
{
  points = self->G.points;
  float32x2_t v5 = (char *)points + 96 * a3->var0;
  int v6 = *((_DWORD *)v5 + 17);
  double v7 = *((double *)v5 + 1);
  if (v6 == -1)
  {
    double v16 = v7 - a4.y;
    float v8 = 0.0;
    double v15 = v16;
    double v10 = *(double *)v5;
  }
  else
  {
    float v8 = 0.0;
    double v9 = *((double *)v5 + 1);
    double v10 = *(double *)v5;
    do
    {
      double v11 = v10;
      int v12 = (double *)((char *)points + 96 * v6);
      double v13 = v9 - a4.y;
      double v10 = *v12;
      double v9 = v12[1];
      float v14 = *v12 - v11;
      double v15 = v9 - a4.y;
      *(float *)&double v13 = (v13 + v9 - a4.y) * 0.5;
      float v8 = v8 + (float)(v14 * *(float *)&v13);
      int v6 = *((_DWORD *)v12 + 17);
    }
    while (v6 != -1);
    double v16 = v7 - a4.y;
  }
  float v17 = *(double *)v5 - v10;
  float v18 = (v15 + v16) * 0.5;
  return v8 + (float)(v17 * v18);
}

- (int)color:(id *)a3 underConvexHull:(id *)a4 saturated:(id *)a5
{
  uint64_t v46 = 0;
  long long v44 = 0u;
  long long v45 = 0u;
  p_PB = &self->PB;
  int width = self->PB.O.width;
  int height = self->PB.O.height;
  initBitmap((uint64_t)&v44, width, height, 1, 1, 100.0);
  if (!(void)v44) {
    return 51;
  }
  int result = [(CIRedEyeRepair3 *)self renderHull:a4 toBitmap:&v44];
  if (!result)
  {
    if (height)
    {
      int v15 = 0;
      baseAddress = p_PB->D.baseAddress;
      float v17 = 0.0;
      float v18 = 0.0;
      float v19 = (unsigned char *)v44;
      uint64_t v20 = (uint64_t)(p_PB->O.baseAddress + 2);
      float v21 = 0.0;
      float v22 = 0.0;
      float v23 = 0.0;
      float v24 = 0.0;
      float v25 = 0.0;
      float v26 = 0.0;
      do
      {
        if (width)
        {
          int v27 = width;
          float v28 = (unsigned __int8 *)v20;
          float v29 = v19;
          float v30 = baseAddress;
          do
          {
            LOBYTE(v13) = *v29;
            float v13 = (float)LODWORD(v13) * 0.0039216;
            unsigned int v31 = *v28;
            unsigned int v32 = *(v28 - 1);
            unsigned int v33 = *(v28 - 2);
            LOBYTE(v14) = *v30;
            float v14 = (float)LODWORD(v14);
            float v26 = v26 + (float)((float)v31 * v13);
            float v25 = v25 + (float)((float)v32 * v13);
            float v24 = v24 + (float)((float)v33 * v13);
            float v23 = v23 + (float)(v14 * v13);
            if (v31 <= 0xFA) {
              float v34 = -0.0;
            }
            else {
              float v34 = v13;
            }
            float v21 = v21 + v34;
            if (v32 <= 0xFA) {
              float v35 = -0.0;
            }
            else {
              float v35 = v13;
            }
            float v18 = v18 + v35;
            if (v33 <= 0xFA) {
              float v36 = -0.0;
            }
            else {
              float v36 = v13;
            }
            float v17 = v17 + v36;
            float v22 = v22 + v13;
            v29 += SHIDWORD(v45);
            v30 += p_PB->D.samplesPerPixel;
            v28 += p_PB->O.samplesPerPixel;
            --v27;
          }
          while (v27);
        }
        ++v15;
        v19 += (int)v45;
        baseAddress += p_PB->D.rowSamples;
        v20 += p_PB->O.rowSamples;
      }
      while (v15 != height);
    }
    else
    {
      float v26 = 0.0;
      float v25 = 0.0;
      float v24 = 0.0;
      float v23 = 0.0;
      float v22 = 0.0;
      float v21 = 0.0;
      float v18 = 0.0;
      float v17 = 0.0;
    }
    float v37 = v26 / v22;
    float v38 = v25 / v22;
    float v39 = v24 / v22;
    float v40 = v23 / v22;
    float v41 = v21 / v22;
    float v42 = v18 / v22;
    float v43 = v17 / v22;
    termBitmap((void **)&v44);
    int result = 0;
    a5->int var0 = v41;
    a5->int var1 = v42;
    a5->int var2 = v43;
    a5->uint64_t var3 = 0.0;
    a3->int var0 = v37;
    a3->int var1 = v38;
    a3->int var2 = v39;
    a3->uint64_t var3 = v40;
  }
  return result;
}

+ (void)insertIntoThreadHopper:(id *)a3 index:(int)a4 recChannel:(float)a5 hue:(float)a6 saturation:(float)a7 luminance:(float)a8 shapeMetricTotal:(float)a9 xPosition:(float)a10
{
  uint64_t var0 = a3->var0;
  if ((int)var0 < 1)
  {
    LODWORD(v11) = 0;
LABEL_16:
    if ((int)var0 <= 18) {
      int v15 = var0 - 1;
    }
    else {
      int v15 = 18;
    }
    if (v15 >= (int)v11)
    {
      uint64_t v16 = v15 + 1;
      float v17 = &a3->var1[v15 + 1];
      do
      {
        *(_OWORD *)&v17->uint64_t var0 = *(_OWORD *)&v17[-1].var0;
        *(_OWORD *)&v17->uint64_t var3 = *(_OWORD *)&v17[-1].var3;
        --v17;
        --v16;
      }
      while (v16 > v11);
      LODWORD(var0) = a3->var0;
    }
    float v18 = (char *)a3 + 28 * v11;
    *((_DWORD *)v18 + 1) = a4;
    *((float *)v18 + 2) = a5;
    *((float *)v18 + 3) = a6;
    *((float *)v18 + 4) = a7;
    *((float *)v18 + 5) = a8;
    *((float *)v18 + 6) = a9;
    *((float *)v18 + 7) = a10;
    if ((int)var0 < 20) {
      int v19 = var0 + 1;
    }
    else {
      int v19 = 20;
    }
    a3->uint64_t var0 = v19;
    return;
  }
  uint64_t v11 = 0;
  p_int var5 = &a3->var1[0].var5;
  while (1)
  {
    unsigned int v13 = *(p_var5 - 4) < a5;
    if (*(p_var5 - 4) >= a5) {
      int v14 = 1;
    }
    else {
      int v14 = 2;
    }
    if (*(p_var5 - 2) < a7) {
      unsigned int v13 = v14;
    }
    if (*p_var5 > a9) {
      ++v13;
    }
    if (v13 > 1) {
      break;
    }
    ++v11;
    p_var5 += 7;
    if (var0 == v11)
    {
      LODWORD(v11) = a3->var0;
      break;
    }
  }
  if (v11 <= 0x13) {
    goto LABEL_16;
  }
}

- (BOOL)hopperElement:(id *)a3 isMoreScleraThanElement:(id *)a4
{
  return a3->var4 > a4->var4
      && fabs(a3->var2 + -0.333) > fabs(a4->var2 + -0.333)
      && a4->var3 * 3.0 > a3->var3
      && fabsf(a3->var6) > fabsf(a4->var6);
}

- (void)swapHopperElement:(id *)a3 withElement:(id *)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&v5[12] = *(_OWORD *)&a3->var3;
  *(_OWORD *)float32x2_t v5 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a4->var3;
  *(_OWORD *)&a3->uint64_t var0 = *(_OWORD *)&a4->var0;
  *(_OWORD *)&a3->uint64_t var3 = v4;
  *(_OWORD *)&a4->uint64_t var0 = *(_OWORD *)v5;
  *(_OWORD *)&a4->uint64_t var3 = *(_OWORD *)&v5[12];
  if (self->inspector)
  {
    [(RedEyeInspector3 *)self->inspector getIdentifyingString:v6 settings:&self->S];
    printf("%s swapping\n", v6);
  }
}

- (int)recognizeThreadsWinningThreadIndex:(int *)a3 info:(id *)a4
{
  int v90 = 0;
  p_G = &self->G;
  if (self->G.nThreads >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v101 = 0;
    v102[0] = 0;
    double v99 = 0.0;
    uint64_t v100 = 0;
    double v97 = 0.0;
    double v98 = 0.0;
    double v95 = 0.0;
    double v96 = 0.0;
    double v93 = 0.0;
    double v94 = 0.0;
    double v92 = 0.0;
    memset(v91, 0, 508);
    long long v88 = 0u;
    long long v89 = 0u;
    memset(v87, 0, sizeof(v87));
    threads = self->G.threads;
    while (1)
    {
      *((unsigned char *)threads + 26) = 0;
      if (!*((unsigned char *)threads + 24)) {
        goto LABEL_61;
      }
      inspector = self->inspector;
      if (inspector
        && [(RedEyeInspector3 *)inspector debuggingThisFaceAndEye:&self->S])
      {
        [(CIRedEyeRepair3 *)self printThreadWithIndex:v6];
        putchar(10);
        int v9 = 1;
      }
      else
      {
        int v9 = 0;
      }
      int v10 = [(CIRedEyeRepair3 *)self attemptClosureOfThreadIndex:v6];
      if (v10 == 23) {
        goto LABEL_61;
      }
      int v11 = v10;
      if (v10) {
        return v11;
      }
      [(CIRedEyeRepair3 *)self threadCentroid:threads];
      double v13 = v12;
      double v15 = v14;
      -[CIRedEyeRepair3 threadSignedArea:centroid:](self, "threadSignedArea:centroid:", threads);
      if (v16 >= 0.0) {
        goto LABEL_61;
      }
      int v17 = -[CIRedEyeRepair3 shape:withThreadAtIndex:centroid:](self, "shape:withThreadAtIndex:centroid:", &v101, v6, v13, v15);
      if (v17) {
        return v17;
      }
      [(CIRedEyeRepair3 *)self slidingWindowAnalysisOfShape:v101 into:v87];
      LODWORD(v19) = DWORD1(v87[0]);
      LODWORD(v20) = v87[0];
      BOOL v21 = *(float *)v87 > 0.62832;
      if (*((float *)v87 + 1) > 0.68068) {
        BOOL v21 = 1;
      }
      LODWORD(v18) = DWORD2(v87[0]);
      if (*((float *)v87 + 2) > 0.61087) {
        BOOL v21 = 1;
      }
      if ((int)v89 > 0) {
        BOOL v21 = 1;
      }
      int v22 = SDWORD1(v89) > 2 || v21;
      if (SDWORD2(v89) > 21) {
        int v22 = 1;
      }
      int v85 = v22;
      if (v22 == 1)
      {
        if (*(float *)v87 > 0.66323) {
          goto LABEL_61;
        }
        LODWORD(v20) = 1062338430;
        if (*((float *)v87 + 1) > 0.8203) {
          goto LABEL_61;
        }
        LODWORD(v19) = 1062045612;
        if (*((float *)v87 + 2) > 0.80285 || (int)v89 > 0 || SDWORD1(v89) > 5 || SDWORD2(v89) > 25) {
          goto LABEL_61;
        }
      }
      if (v9)
      {
        puts("\nafter");
        if (*(int *)v101 >= 1)
        {
          int v23 = 0;
          uint64_t v24 = *(void *)(v101 + 8);
          do
          {
            printf("%3d (%5.1f, %5.1f) %6.4f %6.1f° del %6.1f [%6.1f %6.1f %6.1f %6.1f]\n", v23++, *(double *)v24, *(double *)(v24 + 8), *(float *)(v24 + 16), (float)(*(float *)(v24 + 20) * 57.296), (float)(*(float *)(v24 + 24) * 57.296), (float)(*(float *)(v24 + 28) * 57.296), (float)(*(float *)(v24 + 32) * 57.296), (float)(*(float *)(v24 + 36) * 57.296), (float)(*(float *)(v24 + 40) * 57.296));
            v24 += 48;
          }
          while (v23 < *(_DWORD *)v101);
        }
      }
      float v25 = self->inspector;
      if (v25)
      {
        uint64_t v26 = [(RedEyeInspector3 *)v25 newSavedShape];
        uint64_t height = self->S.height;
        long long v28 = *(_OWORD *)&self->S.transform.c;
        v86[0] = *(_OWORD *)&self->S.transform.a;
        v86[1] = v28;
        v86[2] = *(_OWORD *)&self->S.transform.tx;
        [(CIRedEyeRepair3 *)self copyShape:v101 into:v26 transform:v86 height:height];
      }
      if (v9)
      {
        uint64_t v29 = -4;
        float v30 = &v88;
        do
        {
          float v31 = 3.14159265 / (float)(1 << (v29 + 4));
          printf("1/%d scale: min %4.2f max %4.2f avg %4.2f # neg %d\n", 2 << (v29 + 4), (float)((float)(*((float *)v30 - 4) - v31) * 57.296), (float)((float)(*(float *)v30 - v31) * 57.296), (float)(*((float *)v30 - 8) * 57.296), *((_DWORD *)v30 + 4));
          float v30 = (long long *)((char *)v30 + 4);
        }
        while (!__CFADD__(v29++, 1));
      }
      int v17 = -[CIRedEyeRepair3 convexHull:ofOriented:shape:](self, "convexHull:ofOriented:shape:", &v100, 0, v101, v18, v19, v20);
      if (v17) {
        return v17;
      }
      [(CIRedEyeRepair3 *)self measureHull:v100 majorAxis:&v98 majorTo:&v96 majorDiameter:(char *)v102 + 4 minorAxis:&v94 minorTo:&v92 minorDiameter:v102];
      double v33 = atan2(v97 - v99, v96 - v98);
      double v34 = atan2(v93 - v95, v92 - v94);
      int v35 = [(CIRedEyeRepair3 *)self color:(char *)threads + 52 underConvexHull:v100 saturated:(char *)threads + 68];
      if (v35)
      {
        int v11 = v35;
        [(CIRedEyeRepair3 *)self termHull:v100];
        return v11;
      }
      LODWORD(v36) = *((_DWORD *)threads + 13);
      LODWORD(v37) = *((_DWORD *)threads + 14);
      LODWORD(v38) = *((_DWORD *)threads + 15);
      LODWORD(v39) = *((_DWORD *)threads + 16);
      -[CIRedEyeRepair3 RGBtoHSV:](self, "RGBtoHSV:", v36, v37, v38, v39);
      float v41 = v40;
      float v43 = v42;
      float v45 = v44;
      p_FC = &self->FC;
      uint64_t v47 = 72;
      if (!self->S.side) {
        uint64_t v47 = 56;
      }
      uint64_t v48 = 32;
      if (!self->S.side) {
        uint64_t v48 = 16;
      }
      int v49 = *(int *)((char *)&p_FC->FR.minrow + v47);
      float v50 = *((float *)threads + 14) * 0.587 + *((float *)threads + 13) * 0.299 + *((float *)threads + 15) * 0.114;
      float scale = self->S.scale;
      double v52 = (float)(self->S.IOD * scale);
      float v53 = v52 * 0.032;
      float v54 = v52 * 0.14;
      int v55 = HIDWORD(v102[0]);
      BOOL v56 = *((float *)v102 + 1) >= v53 && *((float *)v102 + 1) <= v54;
      if (!v56 && (v54 * 1.17 < *((float *)v102 + 1) || fabs(v41 + -0.333) > 0.15 || v43 < 0.45 || v50 < 75.0)) {
        goto LABEL_61;
      }
      double v83 = v13;
      double v84 = *(double *)((char *)&p_FC->FR.minrow + v48);
      float v57 = v33;
      float v58 = v34;
      *((unsigned char *)threads + 26) = 1;
      *((_DWORD *)threads + 9) = v55;
      *((float *)threads + 10) = v57;
      *((_DWORD *)threads + 11) = v102[0];
      *((float *)threads + 12) = v58;
      float v59 = v41;
      float v60 = v43;
      float v61 = v45;
      [(CIRedEyeRepair3 *)self termHull:v100];
      *(float *)&double v63 = v60;
      float v64 = v59;
      if (v59 == 0.0 || v61 == 0.0 || v60 == 1.0 || *((float *)threads + 13) > 255.0)
      {
        char v65 = v85;
      }
      else
      {
        double v80 = (float)(v61 / 255.0) * 0.42;
        long double v71 = sin(v60 + -0.2);
        float v64 = v59;
        HIDWORD(v63) = HIDWORD(v80);
        *(float *)&long double v71 = v80 * v71 + 0.3945 + v60 * -0.21;
        if (vabds_f32(v59, *(float *)&v71) <= 0.0735)
        {
          float v72 = sqrt((v60 + -0.2) / 6.0) + 0.23;
          BOOL v73 = v60 < 0.28 || (float)(v61 / 255.0) < v72;
          *(float *)&double v63 = v60;
          double v67 = v83;
          double v66 = v84;
          if (v73 && ((v85 ^ 1) & 1) == 0) {
            goto LABEL_61;
          }
LABEL_60:
          double v68 = v66 - (double)v49;
          float v69 = v68 * scale;
          double v70 = (v67 - v69) / v52;
          *((float *)threads + 21) = (float)(*(float *)v87 + *((float *)v87 + 1)) + *((float *)v87 + 2);
          LODWORD(v70) = *((_DWORD *)threads + 16);
          *(float *)&double v68 = v64;
          *(float *)&double v62 = v50;
          +[CIRedEyeRepair3 insertIntoThreadHopper:index:recChannel:hue:saturation:luminance:shapeMetricTotal:xPosition:](CIRedEyeRepair3, "insertIntoThreadHopper:index:recChannel:hue:saturation:luminance:shapeMetricTotal:xPosition:", &v90, v6, v70, v68, v63, v62);
          goto LABEL_61;
        }
        char v65 = v85;
        *(float *)&double v63 = v60;
      }
      double v67 = v83;
      double v66 = v84;
      if ((v65 & 1) == 0) {
        goto LABEL_60;
      }
LABEL_61:
      uint64_t v6 = (v6 + 1);
      threads = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)threads + 96);
      if ((int)v6 >= p_G->nThreads)
      {
        int v74 = v90;
        if (v90 < 2) {
          goto LABEL_87;
        }
        if (v90 != 3)
        {
          if (v90 == 2)
          {
            uint64_t v75 = (char *)&v91[1] + 12;
            goto LABEL_79;
          }
          goto LABEL_82;
        }
        uint64_t v75 = (char *)&v91[1] + 12;
        if ([(CIRedEyeRepair3 *)self hopperElement:v91 isMoreScleraThanElement:(char *)&v91[1] + 12])
        {
          goto LABEL_80;
        }
        uint64_t v75 = (char *)&v91[3] + 8;
LABEL_79:
        if ([(CIRedEyeRepair3 *)self hopperElement:v91 isMoreScleraThanElement:v75])
        {
LABEL_80:
          [(CIRedEyeRepair3 *)self swapHopperElement:v91 withElement:v75];
        }
        int v74 = v90;
        if (v90 < 1)
        {
LABEL_87:
          if (!v74) {
            return 25;
          }
        }
        else
        {
LABEL_82:
          uint64_t v76 = 0;
          float v77 = (int *)v91;
          do
          {
            if (v76) {
              *((unsigned char *)p_G->threads + 96 * *v77 + 26) = 0;
            }
            ++v76;
            v77 += 7;
          }
          while (v74 != v76);
        }
        int v11 = 0;
        *a3 = v91[0];
        float v78 = *(float *)&v91[1];
        a4->uint64_t var0 = *((float *)&v91[1] + 2);
        *(void *)&a4->int var1 = *((void *)&v91[0] + 1);
        a4->uint64_t var3 = v78;
        return v11;
      }
    }
  }
  return 25;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)RGBtoHSV:(id)a3
{
  float var2 = a3.var2;
  float v4 = fmaxf(a3.var0, fmaxf(a3.var1, a3.var2));
  float v5 = fminf(a3.var0, fminf(a3.var1, a3.var2));
  float v6 = v4 - v5;
  float v7 = 0.0;
  if ((float)(v4 - v5) == 0.0)
  {
    float v8 = 0.0;
    goto LABEL_18;
  }
  double v9 = v6;
  float v10 = v4 + v5;
  float v11 = v10 * 0.5;
  if ((float)(v10 * 0.5) <= 0.5) {
    float v12 = v6 / v10;
  }
  else {
    float v12 = v9 / (510.0 - v10);
  }
  float v13 = 1.0 / (v9 * 6.0);
  if (a3.var0 == v4)
  {
    double v14 = (float)((float)(a3.var1 - var2) * v13);
    double v15 = 0.333333333;
  }
  else
  {
    if (a3.var1 != v4)
    {
      float v16 = (float)(a3.var0 - a3.var1) * v13;
      if (var2 != v4) {
        float v16 = 0.0;
      }
      goto LABEL_11;
    }
    double v14 = (float)((float)(var2 - a3.var0) * v13);
    double v15 = 0.666666667;
  }
  float v16 = v14 + v15;
LABEL_11:
  float v17 = floorf(v16);
  float v5 = 0.0;
  float v8 = 0.0;
  if (v12 >= 0.0)
  {
    float v8 = v12;
    if (v12 > 1.0) {
      float v8 = 1.0;
    }
  }
  float v7 = v16 - v17;
  if (v11 >= 0.0)
  {
    if (v11 <= 255.0) {
      float v5 = v11;
    }
    else {
      float v5 = 255.0;
    }
  }
LABEL_18:
  float v18 = 0.0;
  float v19 = v7;
  result.uint64_t var3 = v18;
  result.float var2 = v5;
  result.int var1 = v8;
  result.uint64_t var0 = v19;
  return result;
}

- (int)prominenceConvexHull:(id *)a3 facts:(id *)a4
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  unsigned int v110 = 0;
  double v108 = 0.0;
  double v109 = 0.0;
  v107[0] = 0;
  v107[1] = 0;
  p_PB = &self->PB;
  baseAddress = self->PB.G.baseAddress;
  uint64_t rowSamples = self->PB.G.rowSamples;
  uint64_t samplesPerPixel = self->PB.G.samplesPerPixel;
  float v11 = self->PB.O.baseAddress;
  p_O = &self->PB.O;
  uint64_t v99 = self->PB.O.rowSamples;
  uint64_t v12 = self->PB.O.samplesPerPixel;
  int width = self->PB.width;
  int height = self->PB.height;
  inspector = self->inspector;
  if (inspector) {
    [(RedEyeInspector3 *)inspector initGradients:v107];
  }
  if ([(CIRedEyeRepair3 *)self initGridWithBitmap:p_O scale:8])
  {
    double v95 = a4;
    double v96 = p_PB;
    double v97 = v11;
    uint64_t v98 = v12;
    float v103 = self;
    double v94 = a3;
    int v14 = width;
    if (height >= 1)
    {
      uint64_t v15 = 0;
      p_bytesPerSample = &self->fullBitmap.bytesPerSample;
      float v17 = (float *)(baseAddress + 12);
      do
      {
        if (v15 && (int)v15 < height - 1 && v14 >= 1)
        {
          uint64_t v18 = 0;
          float v19 = v17;
          do
          {
            if (v18 && (int)v18 < width - 1 && *(v19 - 1) > *((float *)p_bytesPerSample + 124))
            {
              __double2 v20 = __sincos_stret(*v19);
              uint64_t v21 = -[CIRedEyeRepair3 edgePoint:withBitmap:center:perp:](v103, "edgePoint:withBitmap:center:perp:", &v108, p_O, (float)(int)v18, (float)(int)v15, v20.__sinval, v20.__cosval);
              if (v21
                && -[CIRedEyeRepair3 insertPoint:andDirection:intoGrid:](v103, "insertPoint:andDirection:intoGrid:", 1, v108, v109, v20.__cosval, -v20.__sinval))
              {
                return 52;
              }
              int v22 = v103->inspector;
              int v14 = width;
              if (v22) {
                [(RedEyeInspector3 *)v22 addGradientRow:v15 column:v18 good:v21 toList:v107];
              }
            }
            uint64_t v18 = (v18 + 1);
            v19 += samplesPerPixel;
          }
          while (v14 != v18);
        }
        uint64_t v15 = (v15 + 1);
        v17 += rowSamples;
      }
      while (v15 != height);
    }
    int v23 = v103;
    p_G = &v103->G;
    unsigned int v110 = 0;
    uint64_t v25 = v98;
    if (v103->G.nPoints < 1) {
      goto LABEL_36;
    }
    uint64_t v26 = 0;
    do
    {
      [(CIRedEyeRepair3 *)v103 regressionWithPointIndex:v26];
      uint64_t v26 = v110 + 1;
      unsigned int v110 = v26;
      int nPoints = v103->G.nPoints;
    }
    while ((int)v26 < nPoints);
    unsigned int v110 = 0;
    if (nPoints < 1)
    {
LABEL_36:
      unsigned int v110 = 0;
LABEL_37:
      int v34 = [(CIRedEyeRepair3 *)v103 findThreadsInGrid];
      int v35 = v103->inspector;
      if (v35
        && [(RedEyeInspector3 *)v35 BOOLOptionIsOn:3]
        && [(RedEyeInspector3 *)v103->inspector BOOLOptionIsOn:5])
      {
        uint64_t v36 = [(RedEyeInspector3 *)v103->inspector initEyeMarkUpsWithBitmap:p_O];
        if (height >= 1)
        {
          uint64_t v37 = 0;
          double v38 = v97;
          do
          {
            if (width >= 1)
            {
              uint64_t v39 = 0;
              float v40 = v38;
              do
              {
                [(RedEyeInspector3 *)v103->inspector emitEyeMarkUps:v36 pixel:v40 rectangleAtRow:v37 column:v39 settings:&v103->S];
                uint64_t v39 = (v39 + 1);
                v40 += v98;
              }
              while (width != v39);
            }
            uint64_t v37 = (v37 + 1);
            v38 += v99;
          }
          while (v37 != height);
        }
        int v23 = v103;
        [(RedEyeInspector3 *)v103->inspector emitEyeMarkUps:v36 threadsWithGrid:p_G settings:&v103->S];
        [(RedEyeInspector3 *)v103->inspector getIdentifyingStringEdge:&v111 settings:&v103->S];
        -[RedEyeInspector3 saveEyeMarkUps:withName:](v103->inspector, "saveEyeMarkUps:withName:", v36, objc_msgSend(NSString, "stringWithFormat:", @"%s-T.tiff", &v111));
        [(RedEyeInspector3 *)v103->inspector termEyeMarkUps:v36];
        uint64_t v25 = v98;
      }
      if (!v34)
      {
        int v34 = [(CIRedEyeRepair3 *)v23 connectThreadsInGrid];
        float v41 = v23->inspector;
        if (v41
          && [(RedEyeInspector3 *)v41 BOOLOptionIsOn:3]
          && [(RedEyeInspector3 *)v23->inspector BOOLOptionIsOn:5])
        {
          uint64_t v42 = [(RedEyeInspector3 *)v23->inspector initEyeMarkUpsWithBitmap:p_O];
          if (height >= 1)
          {
            uint64_t v43 = 0;
            float v44 = v97;
            do
            {
              if (width >= 1)
              {
                uint64_t v45 = 0;
                uint64_t v46 = v44;
                do
                {
                  [(RedEyeInspector3 *)v103->inspector emitEyeMarkUps:v42 pixel:v46 rectangleAtRow:v43 column:v45 settings:&v103->S];
                  uint64_t v45 = (v45 + 1);
                  v46 += v98;
                }
                while (width != v45);
              }
              uint64_t v43 = (v43 + 1);
              v44 += v99;
            }
            while (v43 != height);
          }
          int v23 = v103;
          [(RedEyeInspector3 *)v103->inspector emitEyeMarkUps:v42 threadsWithGrid:p_G settings:&v103->S];
          [(RedEyeInspector3 *)v103->inspector getIdentifyingStringEdge:&v111 settings:&v103->S];
          -[RedEyeInspector3 saveEyeMarkUps:withName:](v103->inspector, "saveEyeMarkUps:withName:", v42, objc_msgSend(NSString, "stringWithFormat:", @"%s-C.tiff", &v111));
          [(RedEyeInspector3 *)v103->inspector termEyeMarkUps:v42];
          uint64_t v25 = v98;
        }
        if (!v34)
        {
          long long v106 = 0uLL;
          int v34 = [(CIRedEyeRepair3 *)v23 recognizeThreadsWinningThreadIndex:&v110 info:&v106];
          int v51 = v23->inspector;
          if (v51)
          {
            p_S = &v23->S;
            [(RedEyeInspector3 *)v51 setDebugFaceIndex:v23->S.faceIndex side:v23->S.side];
            uint64_t v53 = [(RedEyeInspector3 *)v23->inspector newSavedGradientList];
            if (v53)
            {
              uint64_t v54 = v53;
              int v55 = v23->inspector;
              long long v56 = *(_OWORD *)&v96->Tp.c;
              long long v111 = *(_OWORD *)&v96->Tp.a;
              long long v112 = v56;
              long long v113 = *(_OWORD *)&v96->Tp.tx;
              [(RedEyeInspector3 *)v55 copyGradients:v107 into:v54 bitmap:&v96->G transform:&v111];
            }
            uint64_t v57 = [(RedEyeInspector3 *)v23->inspector newSavedGrid];
            uint64_t v58 = v96->height;
            long long v59 = *(_OWORD *)&v96->Tp.c;
            long long v111 = *(_OWORD *)&v96->Tp.a;
            long long v112 = v59;
            long long v113 = *(_OWORD *)&v96->Tp.tx;
            [(CIRedEyeRepair3 *)v23 copyGridInto:v57 transform:&v111 height:v58];
            [(RedEyeInspector3 *)v23->inspector termGradients:v107];
            float v60 = v23->inspector;
            if (v60
              && [(RedEyeInspector3 *)v60 BOOLOptionIsOn:3]
              && [(RedEyeInspector3 *)v23->inspector BOOLOptionIsOn:5])
            {
              int v100 = v34;
              uint64_t v61 = [(RedEyeInspector3 *)v23->inspector initEyeMarkUpsWithBitmap:p_O];
              if (height >= 1)
              {
                uint64_t v62 = 0;
                double v63 = v97;
                do
                {
                  if (width >= 1)
                  {
                    uint64_t v64 = 0;
                    char v65 = v63;
                    do
                    {
                      [(RedEyeInspector3 *)v103->inspector emitEyeMarkUps:v61 pixel:v65 rectangleAtRow:v62 column:v64 settings:p_S];
                      uint64_t v64 = (v64 + 1);
                      v65 += v98;
                    }
                    while (width != v64);
                  }
                  uint64_t v62 = (v62 + 1);
                  v63 += v99;
                }
                while (v62 != height);
              }
              int v23 = v103;
              [(RedEyeInspector3 *)v103->inspector emitEyeMarkUps:v61 threadsWithGrid:p_G settings:p_S];
              [(RedEyeInspector3 *)v103->inspector getIdentifyingStringEdge:&v111 settings:p_S];
              -[RedEyeInspector3 saveEyeMarkUps:withName:](v103->inspector, "saveEyeMarkUps:withName:", v61, objc_msgSend(NSString, "stringWithFormat:", @"%s-R.tiff", &v111));
              [(RedEyeInspector3 *)v103->inspector termEyeMarkUps:v61];
              uint64_t v25 = v98;
              int v34 = v100;
            }
          }
          if (!v34)
          {
            float v105 = 0;
            threads = v103->G.threads;
            unsigned int v67 = v110;
            double v68 = v23->inspector;
            if (v68 && [(RedEyeInspector3 *)v68 BOOLOptionIsOn:2])
            {
              float v69 = (float *)((char *)threads + 96 * (int)v67);
              float v70 = v69[4] * 180.0 / 3.14159265;
              float v71 = rintf(v70);
              uint64_t v72 = 82;
              if (!v23->S.side) {
                uint64_t v72 = 76;
              }
              printf("      %c %3d turn %d° ", v72, v110, (int)v71);
              *(float *)&double v73 = v69[13];
              *(float *)&double v74 = v69[14];
              *(float *)&double v75 = v69[15];
              *(float *)&double v76 = v69[16];
              -[CIRedEyeRepair3 RGBtoHSV:](v23, "RGBtoHSV:", v73, v74, v75, v76);
              printf("%3.1f%% of IOD HSV (%5.3f, %5.3f, %5.1f) SAT (%2d %2d %2d) REC %5.1f\n", v69[9] * 100.0 / (float)(v23->S.IOD * v23->S.scale), v79, v77, v78, (int)rintf(v69[17] * 100.0), (int)rintf(v69[18] * 100.0), (int)rintf(v69[19] * 100.0), v69[16]);
            }
            double v80 = (char *)threads + 96 * (int)v67;
            LODWORD(v47) = *((_DWORD *)v80 + 13);
            LODWORD(v48) = *((_DWORD *)v80 + 14);
            LODWORD(v49) = *((_DWORD *)v80 + 15);
            LODWORD(v50) = *((_DWORD *)v80 + 16);
            -[CIRedEyeRepair3 RGBtoHSV:](v23, "RGBtoHSV:", v47, v48, v49, v50);
            v95->uint64_t var0 = *($C28CD4A45FD07A4F97CC9D5F91F25271 *)(v80 + 52);
            p_int var1 = &v95->var1;
            float32x2x2_t v82 = *(float32x2x2_t *)(v80 + 36);
            unint64_t v83 = vextq_s8((int8x16_t)v82, (int8x16_t)v82, 8uLL).u64[0];
            vst2_f32(p_var1, v82);
            v95->int var5 = *((float *)v80 + 21);
            *(_OWORD *)&v95->uint64_t var6 = v106;
            uint64_t nShapes = v103->G.nShapes;
            if ((int)nShapes < 1) {
              goto LABEL_89;
            }
            shapes = v103->G.shapes;
            uint64_t v86 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)shapes + 32 * (nShapes - 1));
            do
            {
              if (*((_DWORD *)shapes + 6) == v110)
              {
                uint64_t v86 = shapes;
                goto LABEL_87;
              }
              shapes = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)shapes + 32);
              --nShapes;
            }
            while (nShapes);
            if (!v86) {
              goto LABEL_89;
            }
LABEL_87:
            if (*((_DWORD *)v86 + 6) == v110) {
              int v88 = [(CIRedEyeRepair3 *)v23 convexHull:&v105 ofOriented:0 shape:v86];
            }
            else {
LABEL_89:
            }
              int v88 = [(CIRedEyeRepair3 *)v23 convexHull:&v105 ofOriented:0 threadIndex:v110];
            int v34 = v88;
            if (!v88)
            {
              long long v89 = v23->inspector;
              if (v89 && [(RedEyeInspector3 *)v89 BOOLOptionIsOn:3])
              {
                uint64_t v90 = [(RedEyeInspector3 *)v23->inspector initEyeMarkUpsWithBitmap:p_O];
                if (height >= 1)
                {
                  uint64_t v91 = 0;
                  do
                  {
                    if (width >= 1)
                    {
                      uint64_t v92 = 0;
                      double v93 = v97;
                      do
                      {
                        [(RedEyeInspector3 *)v23->inspector emitEyeMarkUps:v90 pixel:v93 rectangleAtRow:v91 column:v92 settings:&v23->S];
                        uint64_t v92 = (v92 + 1);
                        v93 += v25;
                      }
                      while (width != v92);
                    }
                    uint64_t v91 = (v91 + 1);
                    v97 += v99;
                  }
                  while (v91 != height);
                }
                if (v105) {
                  [(RedEyeInspector3 *)v23->inspector emitEyeMarkUps:v90 convexHull:v105 settings:&v23->S];
                }
                [(RedEyeInspector3 *)v23->inspector getIdentifyingStringEdge:&v111 settings:&v23->S];
                -[RedEyeInspector3 saveEyeMarkUps:withName:](v23->inspector, "saveEyeMarkUps:withName:", v90, objc_msgSend(NSString, "stringWithFormat:", @"%s.tiff", &v111));
                [(RedEyeInspector3 *)v23->inspector termEyeMarkUps:v90];
              }
              [(CIRedEyeRepair3 *)v23 termGrid];
              int v34 = 0;
              *double v94 = v105;
            }
          }
        }
      }
    }
    else
    {
      uint64_t v28 = 0;
      while (1)
      {
        int v29 = [(CIRedEyeRepair3 *)v103 replacePointAndDirection:v28];
        if (v29) {
          return v29;
        }
        uint64_t v28 = v110 + 1;
        unsigned int v110 = v28;
        int v30 = v103->G.nPoints;
        if ((int)v28 >= v30)
        {
          unsigned int v110 = 0;
          if (v30 < 1) {
            goto LABEL_37;
          }
          uint64_t v31 = 0;
          while (1)
          {
            uint64_t v32 = [(CIRedEyeRepair3 *)v103 nextPointIndexWithPointIndex:v31];
            if (v32 != -1)
            {
              int v29 = [(CIRedEyeRepair3 *)v103 linkUpPointIndex:v110 toPointIndex:v32];
              if (v29) {
                return v29;
              }
            }
            uint64_t v31 = v110 + 1;
            unsigned int v110 = v31;
            if ((int)v31 >= v103->G.nPoints) {
              goto LABEL_37;
            }
          }
        }
      }
    }
  }
  else
  {
    double v33 = self->inspector;
    if (v33) {
      [(RedEyeInspector3 *)v33 termGradients:v107];
    }
    return 18;
  }
  return v34;
}

- (int)prepareTransformWithEyeIndex:(int)a3
{
  p_FC = &self->FC;
  p_$2B11B063D4FF7ECB26AB90748407DBDB RR = &self->FC.RR;
  p_int maxrow = &self->FC.RR.maxrow;
  p_int mincol = &self->FC.RR.mincol;
  p_double maxcol = &self->FC.RR.maxcol;
  if (!a3)
  {
    p_double maxcol = &self->FC.LR.maxcol;
    p_int mincol = &self->FC.LR.mincol;
    p_int maxrow = &self->FC.LR.maxrow;
    p_$2B11B063D4FF7ECB26AB90748407DBDB RR = &self->FC.LR;
  }
  int v9 = *p_maxrow;
  double v10 = (double)*p_mincol;
  double v11 = (double)(self->FC.FR.maxrow - self->FC.FR.minrow - *p_maxrow);
  int v12 = *p_maxcol - *p_mincol;
  int v13 = v9 - p_RR->minrow;
  p_S = &self->S;
  int downsampleType = self->S.downsampleType;
  if ((downsampleType - 1) < 3)
  {
    double scale = self->S.scale;
    float v17 = (double)v12 * scale;
    p_PB = &self->PB;
    float v19 = (double)v13 * scale;
    __double2 v20 = (long long *)MEMORY[0x1E4F1DAB8];
    self->PB.int width = (int)rintf(v17);
    self->PB.float height = (int)rintf(v19);
    long long v21 = *v20;
    long long v22 = v20[1];
    *(_OWORD *)&self->PB.T.a = *v20;
    *(_OWORD *)&self->PB.T.c = v22;
    long long v23 = v20[2];
    *(_OWORD *)&self->PB.T.tdouble x = v23;
    CGFloat v24 = self->S.scale;
    *(_OWORD *)&v42.a = v21;
    *(_OWORD *)&v42.c = v22;
    *(_OWORD *)&v42.tdouble x = v23;
    CGAffineTransformScale(&v43, &v42, v24, v24);
    long long v25 = *(_OWORD *)&v43.c;
    *(_OWORD *)&self->PB.T.a = *(_OWORD *)&v43.a;
    *(_OWORD *)&self->PB.T.c = v25;
    *(_OWORD *)&self->PB.T.tdouble x = *(_OWORD *)&v43.tx;
    double v26 = -v10;
    double v27 = -v11;
    long long v28 = *(_OWORD *)&self->PB.T.c;
    *(_OWORD *)&v42.a = *(_OWORD *)&self->PB.T.a;
    *(_OWORD *)&v42.c = v28;
    *(_OWORD *)&v42.tdouble x = *(_OWORD *)&self->PB.T.tx;
LABEL_7:
    CGAffineTransformTranslate(&v43, &v42, v26, v27);
    long long v33 = *(_OWORD *)&v43.c;
    *(_OWORD *)&p_PB->T.a = *(_OWORD *)&v43.a;
    *(_OWORD *)&p_PB->T.c = v33;
    *(_OWORD *)&p_PB->T.tdouble x = *(_OWORD *)&v43.tx;
    float height = p_S->inputImageExtent.size.height;
    int maxrow = p_FC->FR.maxrow;
    int mincol = p_FC->FR.mincol;
    uint64_t v37 = &self->PB;
    long long v38 = *(_OWORD *)&v37->T.c;
    *(_OWORD *)&v42.a = *(_OWORD *)&v37->T.a;
    *(_OWORD *)&v42.c = v38;
    *(_OWORD *)&v42.tdouble x = *(_OWORD *)&v37->T.tx;
    memset(&v43, 0, sizeof(v43));
    CGAffineTransformTranslate(&v43, &v42, -(double)mincol, -(double)((int)rintf(height) - maxrow));
    CGAffineTransform v41 = v43;
    CGAffineTransformInvert(&v42, &v41);
    int result = 0;
    long long v40 = *(_OWORD *)&v42.c;
    *(_OWORD *)&v37->Tp.a = *(_OWORD *)&v42.a;
    *(_OWORD *)&v37->Tp.c = v40;
    *(_OWORD *)&v37->Tp.tdouble x = *(_OWORD *)&v42.tx;
    return result;
  }
  if (!downsampleType)
  {
    p_PB = &self->PB;
    int v29 = (long long *)MEMORY[0x1E4F1DAB8];
    self->PB.int width = (int)(float)v12;
    self->PB.float height = (int)(float)v13;
    long long v30 = *v29;
    long long v31 = v29[1];
    *(_OWORD *)&self->PB.T.a = *v29;
    *(_OWORD *)&self->PB.T.c = v31;
    long long v32 = v29[2];
    *(_OWORD *)&self->PB.T.tdouble x = v32;
    double v26 = -v10;
    double v27 = -v11;
    *(_OWORD *)&v42.a = v30;
    *(_OWORD *)&v42.c = v31;
    *(_OWORD *)&v42.tdouble x = v32;
    goto LABEL_7;
  }
  return 17;
}

- (int)renderEyePolygonToBitmap:(id *)a3
{
  size_t var1 = a3->var1;
  size_t var2 = a3->var2;
  DeviceGradouble y = CGColorSpaceCreateDeviceGray();
  if (!DeviceGray) {
    return 10;
  }
  float v8 = DeviceGray;
  int v9 = CGBitmapContextCreate(a3->var0, var1, var2, 8uLL, a3->var4, DeviceGray, 0);
  CGColorSpaceRelease(v8);
  if (!v9) {
    return 42;
  }
  CGContextSetRGBFillColor(v9, 0.0, 0.0, 0.0, 1.0);
  CGContextBeginPath(v9);
  CGContextMoveToPoint(v9, 0.0, 0.0);
  CGContextAddLineToPoint(v9, (double)var1, 0.0);
  CGContextAddLineToPoint(v9, (double)var1, (double)var2);
  CGContextAddLineToPoint(v9, 0.0, (double)var2);
  CGContextAddLineToPoint(v9, 0.0, 0.0);
  CGContextClosePath(v9);
  CGContextFillPath(v9);
  CGContextSetRGBFillColor(v9, 1.0, 1.0, 1.0, 1.0);
  CGContextBeginPath(v9);
  uint64_t v10 = 0;
  int side = self->S.side;
  p_FC = &self->FC;
  BOOL v13 = side == 0;
  uint64_t v14 = 72;
  if (v13) {
    uint64_t v14 = 56;
  }
  uint64_t v15 = 64;
  if (v13)
  {
    uint64_t v15 = 48;
    uint64_t v16 = 112;
  }
  else
  {
    uint64_t v16 = 240;
  }
  double v17 = (double)*(int *)((char *)&p_FC->FR.minrow + v14);
  double v18 = (double)*(int *)((char *)&p_FC->FR.minrow + v15);
  if (v13) {
    LPoldouble y = p_FC->LPoly;
  }
  else {
    LPoldouble y = p_FC->RPoly;
  }
  double v20 = (float)(var2 - 1);
  do
  {
    double v21 = LPoly[v10].x - v17 + 0.5;
    double v22 = v18 - LPoly[v10].y + v20 + 0.5;
    if (v10 * 16) {
      CGContextAddLineToPoint(v9, v21, v22);
    }
    else {
      CGContextMoveToPoint(v9, v21, v22);
    }
    ++v10;
  }
  while (v10 != 8);
  CGContextAddLineToPoint(v9, *(double *)((char *)&p_FC->FR.minrow + v16) - v17 + 0.5, v18 - LPoly->y + v20 + 0.5);
  CGContextClosePath(v9);
  CGContextFillPath(v9);
  CGContextRelease(v9);
  return 0;
}

- (int)prepareBitmapsWithString:(char *)a3
{
  v58[1] = *MEMORY[0x1E4F143B8];
  uint64_t v48 = 0;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:self->faceBitmap.baseAddress length:self->faceBitmap.size];
  float v6 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
  float v7 = [+[CIImage imageWithBitmapData:bytesPerRow:size:format:colorSpace:](CIImage, "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v5, self->faceBitmap.rowBytes, 266, v6, (double)self->faceBitmap.width, (double)self->faceBitmap.height) imageByClampingToExtent];
  p_PB = &self->PB;
  long long v9 = *(_OWORD *)&self->PB.T.c;
  long long v43 = *(_OWORD *)&self->PB.T.a;
  long long v44 = v9;
  long long v45 = *(_OWORD *)&self->PB.T.tx;
  uint64_t v10 = [(CIImage *)v7 imageByApplyingTransform:&v43];
  initBitmap((uint64_t)&self->PB.OO, self->PB.width, self->PB.height, 4, 1, 100.0);
  if (!self->PB.OO.baseAddress)
  {
    CGColorSpaceRelease(v6);
    return 9;
  }
  double v11 = +[CIContext context];
  -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v10, self->PB.OO.baseAddress, self->PB.OO.rowBytes, 266, v6, 0.0, 0.0, (double)p_PB->width, (double)self->PB.height);
  CGColorSpaceRelease(v6);
  initBitmap((uint64_t)&self->PB.O, p_PB->width, self->PB.height, 4, 1, 100.0);
  if (!self->PB.O.baseAddress) {
    return 9;
  }
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (!DeviceRGB) {
    return 10;
  }
  BOOL v13 = DeviceRGB;
  -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v10, self->PB.O.baseAddress, self->PB.O.rowBytes, 266, DeviceRGB, 0.0, 0.0, (double)p_PB->width, (double)self->PB.height);
  CGColorSpaceRelease(v13);
  inspector = self->inspector;
  if (inspector && [(RedEyeInspector3 *)inspector BOOLOptionIsOn:4]) {
    [(RedEyeInspector3 *)self->inspector saveBitmap:&self->PB.O format:266 faceIndex:self->S.faceIndex side:self->S.side name:"1-ORIG" which:a3];
  }
  uint64_t gradientChannel = self->S.gradientChannel;
  if (gradientChannel > 9) {
    return 54;
  }
  uint64_t v17 = dword_1939582E4[gradientChannel];
  uint64_t v57 = @"inputChannel";
  v58[0] = [NSNumber numberWithInt:v17];
  double v18 = -[CIImage imageByApplyingFilter:withInputParameters:](v10, "imageByApplyingFilter:withInputParameters:", @"RedEyeChannel", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:&v57 count:1]);
  double v19 = (float)(self->S.IOD * self->S.scale) * 0.05;
  float v20 = v19;
  double v21 = self->inspector;
  if (v21)
  {
    if ([(RedEyeInspector3 *)v21 BOOLOptionIsOn:4])
    {
      initBitmap((uint64_t)&v46, p_PB->width, self->PB.height, 4, 1, 100.0);
      if ((void)v46)
      {
        -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v18, (void)v46, SDWORD1(v47), 266, 0, 0.0, 0.0, (double)p_PB->width, (double)self->PB.height);
        [(RedEyeInspector3 *)self->inspector saveBitmap:&v46 format:266 faceIndex:self->S.faceIndex side:self->S.side name:"2-REC" which:a3];
        termBitmap((void **)&v46);
      }
    }
  }
  int v55 = @"inputRadius";
  *(float *)&double v19 = v20;
  uint64_t v56 = objc_msgSend(NSNumber, "numberWithFloat:", v19, a3);
  double v22 = -[CIImage imageByApplyingFilter:withInputParameters:](v18, "imageByApplyingFilter:withInputParameters:", @"RedEyeMinMorphology", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1]);
  CGFloat v24 = self->inspector;
  if (v24)
  {
    if ([(RedEyeInspector3 *)v24 BOOLOptionIsOn:4])
    {
      initBitmap((uint64_t)&v46, p_PB->width, self->PB.height, 4, 1, 100.0);
      if ((void)v46)
      {
        -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v22, (void)v46, SDWORD1(v47), 266, 0, 0.0, 0.0, (double)p_PB->width, (double)self->PB.height);
        [(RedEyeInspector3 *)self->inspector saveBitmap:&v46 format:266 faceIndex:self->S.faceIndex side:self->S.side name:"3-MIN" which:v38];
        termBitmap((void **)&v46);
      }
    }
  }
  uint64_t v53 = @"inputRadius";
  *(float *)&double v23 = v20;
  uint64_t v54 = [NSNumber numberWithFloat:v23];
  uint64_t v25 = -[CIImage imageByApplyingFilter:withInputParameters:](v22, "imageByApplyingFilter:withInputParameters:", @"RedEyeMaxMorphology", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1]);
  double v26 = self->inspector;
  if (v26)
  {
    if ([(RedEyeInspector3 *)v26 BOOLOptionIsOn:4])
    {
      initBitmap((uint64_t)&v46, p_PB->width, self->PB.height, 4, 1, 100.0);
      if ((void)v46)
      {
        -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v25, (void)v46, SDWORD1(v47), 266, 0, 0.0, 0.0, (double)p_PB->width, (double)self->PB.height);
        [(RedEyeInspector3 *)self->inspector saveBitmap:&v46 format:266 faceIndex:self->S.faceIndex side:self->S.side name:"4-MAX" which:v38];
        termBitmap((void **)&v46);
      }
    }
  }
  int v51 = @"inputSubtractedImage";
  uint64_t v52 = v25;
  double v27 = -[CIImage imageByApplyingFilter:withInputParameters:](v18, "imageByApplyingFilter:withInputParameters:", @"RedEyeDifference", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1]);
  long long v28 = v27;
  if (self->PB.maskRender) {
    long long v28 = [[(CIImage *)v27 imageByApplyingFilter:@"RedEyeMaxMorphology" withInputParameters:&unk_1EE4AB400] imageByApplyingFilter:@"RedEyeMinMorphology" withInputParameters:&unk_1EE4AB428];
  }
  initBitmap((uint64_t)&v46, p_PB->width, self->PB.height, 4, 1, 100.0);
  if (!(void)v46)
  {
    termBitmap((void **)&self->PB.O.baseAddress);
    return 11;
  }
  -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v28, (void)v46, SDWORD1(v47), 266, 0, 0.0, 0.0, (double)p_PB->width, (double)self->PB.height);
  initBitmap((uint64_t)&self->PB.D, p_PB->width, self->PB.height, 1, 1, 100.0);
  if (!self->PB.D.baseAddress)
  {
    termBitmap((void **)&self->PB.O.baseAddress);
    termBitmap((void **)&v46);
    return 12;
  }
  [(CIRedEyeRepair3 *)self condenseFourChannelRecognitionMap:&v46 intoOneChanneMap:&self->PB.D];
  int v29 = self->inspector;
  if (v29 && [(RedEyeInspector3 *)v29 BOOLOptionIsOn:4]) {
    [(RedEyeInspector3 *)self->inspector saveBitmap:&v46 format:266 faceIndex:self->S.faceIndex side:self->S.side name:"5-DIFF" which:v38];
  }
  termBitmap((void **)&v46);
  if (!self->PB.computeGradient)
  {
    self->PB.G.baseAddress = 0;
    goto LABEL_42;
  }
  uint64_t v30 = [(CIImage *)v28 imageByApplyingFilter:@"RedEyeGradient"];
  *(void *)&long long v45 = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  initBitmap((uint64_t)&v43, p_PB->width, self->PB.height, 4, 2, 100.0);
  if (!(void)v43)
  {
LABEL_59:
    termBitmap((void **)&self->PB.O.baseAddress);
    termBitmap((void **)&self->PB.D.baseAddress);
    return 13;
  }
  -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v30, (void)v43, SDWORD1(v44), 2056, 0, 0.0, 0.0, (double)p_PB->width, (double)self->PB.height);
  initBitmap((uint64_t)&self->PB.G, p_PB->width, self->PB.height, 4, 4, 100.0);
  baseAddress = self->PB.G.baseAddress;
  if (!baseAddress)
  {
    termBitmap((void **)&v43);
    goto LABEL_59;
  }
  src.data = (void *)v43;
  src.vImagePixelCount height = SHIDWORD(v43);
  src.int width = 4 * SDWORD2(v43);
  src.size_t rowBytes = SDWORD1(v44);
  vImagePixelCount height = self->PB.G.height;
  dest.data = baseAddress;
  dest.vImagePixelCount height = height;
  size_t rowBytes = self->PB.G.rowBytes;
  dest.int width = 4 * self->PB.G.width;
  dest.size_t rowBytes = rowBytes;
  vImageConvert_Planar16FtoPlanarF(&src, &dest, 0);
  termBitmap((void **)&v43);
  int v34 = self->inspector;
  if (v34)
  {
    if ([(RedEyeInspector3 *)v34 BOOLOptionIsOn:4])
    {
      uint64_t v40 = 0;
      memset(v39, 0, sizeof(v39));
      initBitmap((uint64_t)v39, p_PB->width, self->PB.height, 1, 1, 100.0);
      if (*(void *)&v39[0])
      {
        [(CIRedEyeRepair3 *)self magnitudeMap:v39 fromGabor:&self->PB.G];
        [(RedEyeInspector3 *)self->inspector saveBitmap:v39 format:266 faceIndex:self->S.faceIndex side:self->S.side name:"6-MAG" which:v38];
        termBitmap((void **)v39);
      }
    }
  }
LABEL_42:
  if (self->PB.computeShine)
  {
    double v49 = @"inputThresholds";
    double v50 = +[CIVector vectorWithX:0.36 Y:0.36 Z:0.36 W:0.0];
    uint64_t v35 = -[CIImage imageByApplyingFilter:withInputParameters:](v10, "imageByApplyingFilter:withInputParameters:", @"RedEyeGlintFinder", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1]);
    initBitmap((uint64_t)&v46, p_PB->width, self->PB.height, 4, 1, 100.0);
    if (!(void)v46)
    {
      termBitmap((void **)&self->PB.O.baseAddress);
      termBitmap((void **)&self->PB.D.baseAddress);
      if (self->PB.G.baseAddress) {
        termBitmap((void **)&self->PB.G.baseAddress);
      }
      return 14;
    }
    -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v35, (void)v46, SDWORD1(v47), 266, 0, 0.0, 0.0, (double)p_PB->width, (double)self->PB.height);
    initBitmap((uint64_t)&self->PB.S, p_PB->width, self->PB.height, 1, 1, 100.0);
    if (!self->PB.S.baseAddress)
    {
      termBitmap((void **)&self->PB.O.baseAddress);
      termBitmap((void **)&self->PB.D.baseAddress);
      if (self->PB.G.baseAddress) {
        termBitmap((void **)&self->PB.G.baseAddress);
      }
      termBitmap((void **)&v46);
      return 15;
    }
    [(CIRedEyeRepair3 *)self condenseFourChannelRecognitionMap:&v46 intoOneChanneMap:&self->PB.S];
    uint64_t v36 = self->inspector;
    if (v36 && [(RedEyeInspector3 *)v36 BOOLOptionIsOn:4]) {
      [(RedEyeInspector3 *)self->inspector saveBitmap:&v46 format:266 faceIndex:self->S.faceIndex side:self->S.side name:"7-SHIN" which:v38];
    }
    termBitmap((void **)&v46);
  }
  else
  {
    self->PB.S.baseAddress = 0;
  }
  if (!self->PB.computeEyePolygon) {
    return 0;
  }
  initBitmap((uint64_t)&self->PB.EP, p_PB->width, self->PB.height, 1, 1, 100.0);
  if (!self->PB.EP.baseAddress)
  {
    termBitmap((void **)&self->PB.O.baseAddress);
    termBitmap((void **)&self->PB.D.baseAddress);
    if (self->PB.G.baseAddress) {
      termBitmap((void **)&self->PB.G.baseAddress);
    }
    if (!self->PB.S.baseAddress) {
      return 59;
    }
    p_S = &self->PB.S;
LABEL_71:
    termBitmap((void **)&p_S->baseAddress);
    return 59;
  }
  int result = [(CIRedEyeRepair3 *)self renderEyePolygonToBitmap:&self->PB.EP];
  if (result)
  {
    termBitmap((void **)&self->PB.O.baseAddress);
    termBitmap((void **)&self->PB.D.baseAddress);
    if (self->PB.G.baseAddress) {
      termBitmap((void **)&self->PB.G.baseAddress);
    }
    if (self->PB.S.baseAddress) {
      termBitmap((void **)&self->PB.S.baseAddress);
    }
    p_S = &self->PB.EP;
    goto LABEL_71;
  }
  return result;
}

- (void)start12BitRandom:(int)a3
{
}

- (double)next12BitRandom
{
  return (double)(((unint64_t)random() >> 5) & 0xFFF) * 0.000244140625 + -0.5;
}

- (int)prepareMasksWithConvexHull:(id *)a3
{
  float v4 = self;
  uint64_t v206 = *MEMORY[0x1E4F143B8];
  inspector = self->inspector;
  if (inspector)
  {
    if ([(RedEyeInspector3 *)inspector BOOLOptionIsOn:0]) {
      [(RedEyeInspector3 *)v4->inspector saveBitmap:&v4->PB.O format:266 faceIndex:v4->S.faceIndex side:v4->S.side name:"1-ORIG" which:"M"];
    }
    float v6 = v4->inspector;
    if (v6)
    {
      if ([(RedEyeInspector3 *)v6 BOOLOptionIsOn:1]) {
        [(RedEyeInspector3 *)v4->inspector saveBitmap:&v4->PB.D format:266 faceIndex:v4->S.faceIndex side:v4->S.side name:"2-DIFF" which:"M"];
      }
      float v7 = v4->inspector;
      if (v7)
      {
        if ([(RedEyeInspector3 *)v7 BOOLOptionIsOn:1]) {
          [(RedEyeInspector3 *)v4->inspector saveBitmap:&v4->PB.S format:266 faceIndex:v4->S.faceIndex side:v4->S.side name:"A-OSHN" which:"M"];
        }
        float v8 = v4->inspector;
        if (v8 && [(RedEyeInspector3 *)v8 BOOLOptionIsOn:1]) {
          [(RedEyeInspector3 *)v4->inspector saveBitmap:&v4->PB.EP format:266 faceIndex:v4->S.faceIndex side:v4->S.side name:"B-POLY" which:"M"];
        }
      }
    }
  }
  p_PB = &v4->PB;
  initBitmap((uint64_t)&v4->PB.M, v4->PB.width, v4->PB.height, 1, 1, 100.0);
  if (!v4->PB.M.baseAddress) {
    return 6;
  }
  int v10 = [(CIRedEyeRepair3 *)v4 analyzeMask:&v4->PB.D usingConvexHull:a3 producingOptimizedMask:&v4->PB.M];
  if (!v10)
  {
    double v11 = v4->inspector;
    if (v11 && [(RedEyeInspector3 *)v11 BOOLOptionIsOn:1]) {
      [(RedEyeInspector3 *)v4->inspector saveBitmap:&v4->PB.M format:266 faceIndex:v4->S.faceIndex side:v4->S.side name:"3-OPTI" which:"M"];
    }
    uint64_t v202 = 0;
    uint64_t v203 = 0;
    long long v200 = 0u;
    long long v201 = 0u;
    int v10 = [(CIRedEyeRepair3 *)v4 widenedHull:&v203 withHull:a3 by:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0))];
    if (!v10)
    {
      initBitmap((uint64_t)&v200, v4->PB.width, v4->PB.height, 1, 1, 100.0);
      if (!(void)v200)
      {
        [(CIRedEyeRepair3 *)v4 termHull:v203];
        return 7;
      }
      LODWORD(v12) = 2.0;
      int v13 = [(CIRedEyeRepair3 *)v4 renderConvexHull:v203 distance:&v200 fieldToBitmap:v12];
      if (v13)
      {
        int v10 = v13;
        [(CIRedEyeRepair3 *)v4 termHull:v203];
        termBitmap((void **)&v200);
        return v10;
      }
      uint64_t v15 = v4->inspector;
      if (v15 && [(RedEyeInspector3 *)v15 BOOLOptionIsOn:1]) {
        [(RedEyeInspector3 *)v4->inspector saveBitmap:&v200 format:266 faceIndex:v4->S.faceIndex side:v4->S.side name:"4-DIST" which:"M"];
      }
      [(CIRedEyeRepair3 *)v4 termHull:v203];
      if ((applyMaxFilter8((uint64_t)&v4->PB.M, 3) & 1) == 0)
      {
        termBitmap((void **)&v200);
        return 0;
      }
      baseAddress = v4->PB.S.baseAddress;
      uint64_t rowSamples = v4->PB.S.rowSamples;
      uint64_t samplesPerPixel = v4->PB.S.samplesPerPixel;
      int width = p_PB->width;
      int height = v4->PB.height;
      v179 = baseAddress;
      if (height < 1)
      {
        int v23 = 0;
        int v22 = 0;
        int v21 = 0;
      }
      else
      {
        int v20 = 0;
        int v21 = 0;
        int v22 = 0;
        int v23 = 0;
        uint64_t v24 = SHIDWORD(v201);
        uint64_t v25 = (int)v201;
        double v26 = (unsigned __int8 *)v200;
        uint64_t v27 = v4->PB.M.samplesPerPixel;
        uint64_t v28 = v4->PB.M.rowSamples;
        int v29 = v4->PB.M.baseAddress;
        do
        {
          if (width >= 1)
          {
            int v30 = 0;
            long long v31 = baseAddress;
            long long v32 = v26;
            long long v33 = v29;
            do
            {
              int v34 = *v31;
              int v35 = *v32 | (*v32 << 8);
              unsigned int v36 = v35 * *v33;
              unsigned int v37 = (v36 + 0x8000) >> 16;
              if (v36 >= 0x8000)
              {
                v23 += v37 * v30;
                v22 += v37 * v20;
                v21 += v37;
              }
              ++v30;
              *long long v33 = v37;
              *long long v31 = (v35 * v34 + 0x8000) >> 16;
              v33 += v27;
              v32 += v24;
              v31 += samplesPerPixel;
            }
            while (width != v30);
          }
          ++v20;
          v29 += v28;
          v26 += v25;
          baseAddress += rowSamples;
        }
        while (v20 != height);
      }
      termBitmap((void **)&v200);
      uint64_t v38 = v4->inspector;
      if (v38) {
        int v176 = [(RedEyeInspector3 *)v38 debuggingThisFaceAndEye:&v4->S];
      }
      else {
        int v176 = 0;
      }
      uint64_t p_S = (uint64_t)&v4->PB.S;
      uint64_t v160 = &v4->S;
      uint64_t v40 = v179;
      p_FC = &v4->FC;
      if (v4->S.side)
      {
        double y = v4->FC.rightEye.y;
        double v42 = v4->FC.rightEye.x - (double)v4->FC.RR.mincol;
        long double v43 = y - (double)v4->FC.RR.minrow;
        double v181 = v43;
        rightDistMatridouble x = v4->FC.rightDistMatrix;
      }
      else
      {
        double y = v4->FC.leftEye.y;
        double v42 = v4->FC.leftEye.x - (double)v4->FC.LR.mincol;
        long double v43 = y - (double)v4->FC.LR.minrow;
        double v181 = v43;
        rightDistMatridouble x = v4->FC.leftDistMatrix;
      }
      if (height >= 1)
      {
        int v45 = 0;
        *(float *)&double y = (float)v21;
        float v174 = (float)v23 / (float)v21;
        float v46 = 0.0;
        double v47 = 0.0;
        double v48 = 1.0;
        float v49 = 0.0;
        float v50 = 0.0;
        *(float *)&long double v43 = (float)v22 / (float)v21;
        float v172 = *(float *)&v43;
        int v51 = rightDistMatrix;
        do
        {
          double v184 = v47;
          if (width >= 1)
          {
            int v52 = 0;
            *(float *)&long double v43 = v47 - v181;
            float v196 = *v51;
            float v192 = v51[1] * *(float *)&v43;
            float v189 = v51[2];
            float v53 = v51[3] * *(float *)&v43;
            double v54 = 0.0;
            int v55 = v40;
            do
            {
              LOBYTE(v43) = *v55;
              long double v43 = pow((float)((float)LODWORD(v43) * 0.0039216), 7.0);
              double v48 = 1.0;
              *(float *)&long double v43 = v43;
              double y = v54 - v42;
              *(float *)&double y = v54 - v42;
              *(float *)&long double v43 = sqrtf((float)((float)(v53 + (float)(*(float *)&y * v189))* (float)(v53 + (float)(*(float *)&y * v189)))+ (float)((float)(v192 + (float)(*(float *)&y * v196))* (float)(v192 + (float)(*(float *)&y * v196))))* *(float *)&v43;
              float v50 = v50 + *(float *)&v43;
              *(float *)&double y = (float)v52;
              float v49 = v49 + (float)((float)v52 * *(float *)&v43);
              float v46 = v46 + (float)((float)v45 * *(float *)&v43);
              double v54 = v54 + 1.0;
              ++v52;
              v55 += samplesPerPixel;
            }
            while (width != v52);
          }
          double v47 = v184 + v48;
          ++v45;
          v40 += rowSamples;
        }
        while (v45 != height);
        p_PB = &v4->PB;
        if (v50 > 0.0)
        {
          double v56 = v42;
          uint64_t v57 = 0;
          float v58 = v49 / v50;
          float v59 = 0.0;
          float v60 = v205;
          float v61 = v46 / v50;
          do
          {
            __double2 v62 = __sincos_stret(v59);
            for (uint64_t i = 0; i != 10; ++i)
            {
              float sinval = v62.__sinval;
              float cosval = v62.__cosval;
              v60[i] = bilinearLookup(p_S, v58 + (float)((float)(int)i * cosval), v61 + (float)((float)(int)i * sinval));
            }
            ++v57;
            float v59 = v59 + 0.7854;
            v60 += 10;
          }
          while (v57 != 8);
          if (v176)
          {
            [(RedEyeInspector3 *)v4->inspector getIdentifyingString:v204 settings:v160];
            printf("%s glint neighborhood\n", v204);
            uint64_t v67 = 0;
            double v68 = v205;
            do
            {
              printf("%d ", v67);
              for (uint64_t j = 0; j != 10; ++j)
                printf("%3d ", v68[j]);
              putchar(10);
              ++v67;
              v68 += 10;
            }
            while (v67 != 8);
          }
          uint64_t v70 = 0;
          float v71 = -1.0;
          uint64_t v72 = v205;
          float v73 = 256.0;
          double v74 = v56;
          do
          {
            uint64_t v75 = 0;
            float v76 = 0.0;
            do
            {
              LOBYTE(v66) = v72[v75];
              float v66 = (float)LODWORD(v66);
              float v76 = v76 + v66;
              v75 += 10;
            }
            while (v75 != 80);
            float v77 = v76 * 0.125;
            if (v77 < v73) {
              float v73 = v77;
            }
            if (v77 > v71) {
              float v71 = v77;
            }
            *(float *)&v204[4 * v70++] = v77;
            ++v72;
          }
          while (v70 != 10);
          if (v176)
          {
            printf("A ");
            for (uint64_t k = 0; k != 40; k += 4)
              printf("%3d ", (int)rintf(*(float *)&v204[k]));
            putchar(10);
            p_IOD = &v4->S.IOD;
            float v80 = v4->S.IOD * 0.025;
            float v81 = v73 / v71;
            printf("intensity %5.1f diameter %4.1f falloff %.3f\n", v71, v80, (float)(v73 / v71));
            putchar(10);
            float32x2x2_t v82 = v179;
            double v74 = v56;
          }
          else
          {
            float v81 = v73 / v71;
            p_IOD = &v4->S.IOD;
            float v80 = v4->S.IOD * 0.025;
            float32x2x2_t v82 = v179;
          }
          if (v71 < 121.0 || v81 > 0.28)
          {
            float v88 = v174 - v74;
            float v89 = v172 - v181;
            double v90 = sqrtf((float)(v89 * v89) + (float)(v88 * v88));
            double v91 = *p_IOD;
            if (v91 * 0.025 <= v90)
            {
              p_PB = &v4->PB;
              bzero(v82, v4->PB.S.size);
            }
            else
            {
              int v92 = 0;
              long double v43 = v91 * 0.009;
              *(float *)&long double v43 = v43;
              double y = *(float *)&v43;
              if (*(float *)&v43 < 1.3) {
                *(float *)&long double v43 = 1.3;
              }
              LODWORD(y) = 0.5;
              p_PB = &v4->PB;
              do
              {
                if (width >= 1)
                {
                  int v93 = 0;
                  double v94 = v82;
                  do
                  {
                    float v95 = (float)(*(float *)&v43
                                - sqrtf((float)((float)((float)v92 - v61) * (float)((float)v92 - v61))+ (float)((float)((float)v93 - v58) * (float)((float)v93 - v58))))* 0.5;
                    float v96 = 1.0;
                    if (v95 <= 1.0)
                    {
                      float v96 = v95;
                      if (v95 < 0.0) {
                        float v96 = 0.0;
                      }
                    }
                    *double v94 = (int)rintf(v96 * 255.0);
                    ++v93;
                    v94 += samplesPerPixel;
                  }
                  while (width != v93);
                }
                ++v92;
                v82 += rowSamples;
              }
              while (v92 != height);
            }
          }
          else
          {
            int v83 = 0;
            double y = (v80 + 2.0) * 0.5;
            *(float *)&double y = y;
            long double v43 = *p_IOD * 0.025;
            *(float *)&long double v43 = v43;
            if (*(float *)&v43 < 1.3) {
              *(float *)&long double v43 = 1.3;
            }
            if (*(float *)&v43 >= *(float *)&y) {
              *(float *)&long double v43 = *(float *)&y;
            }
            LODWORD(y) = 0.5;
            p_PB = &v4->PB;
            do
            {
              if (width >= 1)
              {
                int v84 = 0;
                int v85 = v82;
                do
                {
                  float v86 = (float)(*(float *)&v43
                              - sqrtf((float)((float)((float)v83 - v61) * (float)((float)v83 - v61))+ (float)((float)((float)v84 - v58) * (float)((float)v84 - v58))))* 0.5;
                  float v87 = 1.0;
                  if (v86 <= 1.0)
                  {
                    float v87 = v86;
                    if (v86 < 0.0) {
                      float v87 = 0.0;
                    }
                  }
                  *int v85 = (int)rintf(v87 * (float)*v85);
                  ++v84;
                  v85 += samplesPerPixel;
                }
                while (width != v84);
              }
              ++v83;
              v82 += rowSamples;
            }
            while (v83 != height);
          }
        }
      }
      double v97 = v4->inspector;
      if (v97 && -[RedEyeInspector3 BOOLOptionIsOn:](v97, "BOOLOptionIsOn:", 1, (double)v43, y))
      {
        [(RedEyeInspector3 *)v4->inspector saveBitmap:&v4->PB.M format:266 faceIndex:v4->S.faceIndex side:v4->S.side name:"5-PROD" which:"M"];
        [(RedEyeInspector3 *)v4->inspector saveBitmap:p_S format:266 faceIndex:v4->S.faceIndex side:v4->S.side name:"6-SHIN" which:"M"];
      }
      int v98 = p_PB->height;
      if (v98 < 1) {
        return 56;
      }
      signed int v99 = 0;
      signed int v100 = 0;
      int v101 = 0;
      signed int v102 = 0;
      uint64_t v103 = 0;
      int v104 = p_PB->width;
      uint64_t v105 = p_PB->M.rowSamples;
      uint64_t v106 = p_PB->M.samplesPerPixel;
      char v107 = 1;
      double v108 = p_PB->S.baseAddress;
      double v109 = p_PB->M.baseAddress;
      do
      {
        if (v104 >= 1)
        {
          int v110 = 0;
          long long v111 = v108;
          long long v112 = v109;
          do
          {
            int v113 = *v112 | *v111;
            if (v99 <= v100) {
              signed int v114 = v100;
            }
            else {
              signed int v114 = v99;
            }
            if (v99 >= v102) {
              signed int v115 = v102;
            }
            else {
              signed int v115 = v99;
            }
            if (v99 < v102) {
              signed int v114 = v100;
            }
            if (v110 <= v101) {
              int v116 = v101;
            }
            else {
              int v116 = v110;
            }
            if (v110 >= (int)v103) {
              unsigned int v117 = v103;
            }
            else {
              unsigned int v117 = v110;
            }
            if (v110 < (int)v103) {
              int v116 = v101;
            }
            if (v107)
            {
              unsigned int v117 = v110;
              signed int v115 = v99;
              int v116 = v110;
              signed int v114 = v99;
            }
            if (v113) {
              uint64_t v103 = v117;
            }
            else {
              uint64_t v103 = v103;
            }
            if (v113)
            {
              signed int v102 = v115;
              int v101 = v116;
              signed int v100 = v114;
              char v107 = 0;
            }
            ++v110;
            v112 += v106;
            v111 += p_PB->S.samplesPerPixel;
          }
          while (v104 != v110);
        }
        ++v99;
        v109 += v105;
        v108 += p_PB->S.rowSamples;
      }
      while (v99 != v98);
      if (v107) {
        return 56;
      }
      v187 = p_PB->M.baseAddress;
      v190 = p_PB->S.baseAddress;
      uint64_t v185 = p_PB->S.samplesPerPixel;
      uint64_t v165 = p_PB->S.rowSamples;
      int v197 = v100 + 1;
      int v193 = v101 + 1;
      unint64_t BitmapRect = makeBitmapRect(v103, v102, (v101 + 1), (v100 + 1));
      uint64_t v166 = v118;
      termBitmap((void **)&v4->repairMap.baseAddress);
      initBitmap((uint64_t)&v4->repairMap, v193 - v103, v197 - v102, 4, 1, 100.0);
      float v119 = v4->repairMap.baseAddress;
      if (v119)
      {
        uint64_t v120 = BitmapRect;
        double v121 = p_PB;
        v198 = p_PB->OO.baseAddress;
        uint64_t v164 = p_PB->OO.rowSamples;
        uint64_t v122 = p_PB->OO.samplesPerPixel;
        uint64_t v163 = v4->repairMap.rowSamples;
        p_repairMap = (int *)&v4->repairMap;
        v180 = (void *)v4->repairMap.samplesPerPixel;
        int v123 = BitmapRect;
        v194 = p_PB->EP.baseAddress;
        uint64_t v124 = p_PB->EP.rowSamples;
        uint64_t v159 = v121;
        uint64_t v182 = v121->EP.samplesPerPixel;
        uint64_t v183 = v122;
        float avgLuminance = v4->M.avgLuminance;
        [(CIRedEyeRepair3 *)v4 start12BitRandom:75838567];
        if ((int)BitmapRect < SHIDWORD(BitmapRect))
        {
          int v153 = v104;
          int v154 = v98;
          v178 = v4;
          int v170 = 0;
          int v173 = 0;
          float v126 = (avgLuminance * 0.0000036 * avgLuminance + 0.08) * 255.0;
          int v175 = (int)rintf(v126);
          v171 = &v194[(int)v124 * (uint64_t)(int)BitmapRect];
          v188 = &v187[(int)v105 * (uint64_t)(int)BitmapRect];
          v191 = &v190[(int)v165 * (uint64_t)(int)BitmapRect];
          uint64_t v177 = v106;
          uint64_t v158 = (int)v106 * (int)v166;
          uint64_t v161 = v124;
          uint64_t v127 = v119 + 2;
          float v128 = (unsigned __int8 *)&v198[(int)v183 * (uint64_t)(int)v166 + 2 + (int)v164 * (uint64_t)(int)BitmapRect];
          uint64_t v162 = v105;
          do
          {
            int v169 = v123;
            v167 = v128;
            v168 = v127;
            if (SHIDWORD(v166) > (int)v166)
            {
              uint64_t v130 = (int)v185 * (int)v166;
              uint64_t v129 = v158;
              uint64_t v131 = (int)v182 * (uint64_t)(int)v166;
              int v132 = HIDWORD(v166) - v166;
              do
              {
                int v199 = v188[v129];
                int v133 = v191[v130];
                unsigned int v134 = v199 | (v199 << 8);
                unsigned int v135 = v133 | (v133 << 8);
                int v136 = *v128;
                v137.i32[0] = *(v128 - 2);
                v137.i32[1] = *(v128 - 1);
                int32x2_t v195 = v137;
                [(CIRedEyeRepair3 *)v178 next12BitRandom];
                *(float *)&double v138 = v138 * 7.5;
                int v139 = (int)rintf(*(float *)&v138) + v175;
                if (v139 >= 255) {
                  int v139 = 255;
                }
                unsigned int v140 = v139 & ~(v139 >> 31);
                int32x2_t v141 = vsra_n_s32(v195, vmla_s32((int32x2_t)0x800000008000, vsub_s32(vdup_n_s32(v140), v195), vdup_n_s32(v134)), 0x10uLL);
                int v142 = v136 + ((int)((v140 - v136) * v134 + 0x8000) >> 16);
                uint32x2_t v143 = vsra_n_u32((uint32x2_t)v141, (uint32x2_t)vmla_s32((int32x2_t)0x800000008000, vsub_s32((int32x2_t)0xFF000000FFLL, v141), vdup_n_s32(v135)), 0x10uLL);
                *(v127 - 1) = v143.i8[4];
                *(v127 - 2) = v143.i8[0];
                unsigned char *v127 = v142 + (((255 - v142) * v135 + 0x8000) >> 16);
                v127[1] = -1;
                if (v133 | v199)
                {
                  if (v171[v131]) {
                    ++v173;
                  }
                  else {
                    ++v170;
                  }
                }
                v128 += v183;
                v131 += v182;
                uint64_t v127 = (char *)v180 + (void)v127;
                v130 += v185;
                v129 += v177;
                --v132;
              }
              while (v132);
            }
            int v123 = v169 + 1;
            v188 += v162;
            v191 += v165;
            v171 += v161;
            uint64_t v127 = &v168[v163];
            float v128 = &v167[v164];
          }
          while (v169 + 1 != HIDWORD(BitmapRect));
          float v4 = v178;
          int v104 = v153;
          int v98 = v154;
          uint64_t v120 = BitmapRect;
          if (v173 < v170) {
            return 56;
          }
        }
        float v144 = v4->inspector;
        if (!v144 || ![(RedEyeInspector3 *)v144 BOOLOptionIsOn:0]) {
          goto LABEL_155;
        }
        uint64_t p_P = (uint64_t)&v159->P;
        initBitmap((uint64_t)&v159->P, v104, v98, 4, 1, 100.0);
        v146 = v159->P.baseAddress;
        if (v146)
        {
          memmove(v146, v159->OO.baseAddress, v159->P.size);
          copyBitmapToSliceOfBitmap(p_repairMap, p_P, v120, v166);
          [(RedEyeInspector3 *)v4->inspector saveBitmap:p_P format:266 faceIndex:v160->faceIndex side:v160->side name:"7-FINL" which:"M"];
LABEL_155:
          uint64_t v147 = 64;
          if (!v160->side) {
            uint64_t v147 = 48;
          }
          uint64_t v148 = 72;
          if (!v160->side) {
            uint64_t v148 = 56;
          }
          unint64_t v149 = offsetBitmapRect(v120, v166, *(unsigned int *)((char *)&p_FC->FR.minrow + v148), *(int *)((char *)&p_FC->FR.minrow + v147));
          p_double minrow = &v4->repairRect.minrow;
          int v10 = 0;
          *p_double minrow = offsetBitmapRect(v149, v151, p_FC->FR.mincol, p_FC->FR.minrow);
          p_minrow[1] = v152;
          return v10;
        }
      }
      return 2;
    }
  }
  return v10;
}

- (int)repairDictionary:(id *)a3 withEyeIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  double v26 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t p_S = &self->S;
  self->S.int side = a4;
  [(CIRedEyeRepair3 *)self initBitmaps];
  int v8 = [(CIRedEyeRepair3 *)self prepareTransformWithEyeIndex:v4];
  if (!v8)
  {
    self->PB.maskRender = 0;
    self->PB.computeGradient = 1;
    self->PB.computeShine = 0;
    self->PB.computeEyePolygon = 0;
    int v8 = [(CIRedEyeRepair3 *)self prepareBitmapsWithString:"TI"];
    if (!v8)
    {
      int v23 = a3;
      uint64_t v24 = 0;
      uint64_t v10 = 0;
      uint64_t v25 = 0;
      int v11 = 0;
      long long v12 = *(_OWORD *)&self->PB.Tp.a;
      long long v13 = *(_OWORD *)&self->PB.Tp.tx;
      *(_OWORD *)&p_S->transform.c = *(_OWORD *)&self->PB.Tp.c;
      *(_OWORD *)&p_S->transform.tdouble x = v13;
      *(_OWORD *)&p_S->transform.a = v12;
      char v14 = 1;
      p_S->int height = self->PB.height;
      do
      {
        char v15 = v14;
        if (v14) {
          int v16 = 6;
        }
        else {
          int v16 = 8 * (p_S->IOD < 130.0);
        }
        p_S->edgeFindingChannel = v16;
        uint64_t v17 = &v28 + v10;
        int v18 = -[CIRedEyeRepair3 prominenceConvexHull:facts:](self, "prominenceConvexHull:facts:", v17, &v27[13 * v10], v23);
        v30[v10] = v18;
        if (v18)
        {
          *uint64_t v17 = 0;
        }
        else
        {
          ++v11;
          uint64_t v24 = &v27[13 * v10];
          uint64_t v25 = *v17;
        }
        char v14 = 0;
        uint64_t v10 = 1;
      }
      while ((v15 & 1) != 0);
      if (v11 != 1)
      {
        if (!v11) {
          return v30[0];
        }
        uint64_t v25 = v28;
        [(CIRedEyeRepair3 *)self termHull:v29];
        uint64_t v24 = v27;
      }
      [(CIRedEyeRepair3 *)self termBitmaps];
      if (v25)
      {
        float scale = p_S->scale;
        if (scale < 1.0)
        {
          uint64_t v20 = *(unsigned int *)(v25 + 4);
          if ((int)v20 >= 1)
          {
            double v21 = (float)(1.0 / scale);
            int v22 = *(float64x2_t **)(v25 + 16);
            do
            {
              *int v22 = vmulq_n_f64(*v22, v21);
              ++v22;
              --v20;
            }
            while (v20);
          }
        }
        int v8 = [(CIRedEyeRepair3 *)self saveRepairDictionary:&v26 withConvexHull:v25 facts:v24];
        [(CIRedEyeRepair3 *)self termHull:v25];
        if (!v8) {
          *int v23 = v26;
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return v8;
}

- (int)executeRepairWithRepairDictionary:(id)a3
{
  uint64_t v29 = 0;
  int v28 = 0;
  memset(v27, 0, sizeof(v27));
  if (![(CIRedEyeRepair3 *)self openRepairDictionary:a3 convexHull:&v29 facts:v27])return 1; {
  initBitmap((uint64_t)&self->faceBitmap, self->FC.FR.maxcol - self->FC.FR.mincol, self->FC.FR.maxrow - self->FC.FR.minrow, 4, 1, 100.0);
  }
  if (self->faceBitmap.baseAddress)
  {
    unint64_t v4 = offsetBitmapRect(*(void *)&self->FC.FR.minrow, *(void *)&self->FC.FR.mincol, -self->subRectangle.mincol, -self->subRectangle.minrow);
    copySliceOfBitmapToBitmap((int *)&self->fullBitmap, &self->faceBitmap.baseAddress, v4, v5);
    [(CIRedEyeRepair3 *)self initBitmaps];
    int side = self->S.side;
    p_$2B11B063D4FF7ECB26AB90748407DBDB RR = &self->FC.RR;
    p_int maxrow = &self->FC.RR.maxrow;
    p_int mincol = &self->FC.RR.mincol;
    BOOL v10 = side == 0;
    if (side) {
      p_double maxcol = &self->FC.RR.maxcol;
    }
    else {
      p_double maxcol = &self->FC.LR.maxcol;
    }
    if (v10) {
      p_int mincol = &self->FC.LR.mincol;
    }
    if (v10) {
      p_int maxrow = &self->FC.LR.maxrow;
    }
    if (v10) {
      p_$2B11B063D4FF7ECB26AB90748407DBDB RR = &self->FC.LR;
    }
    int v12 = *p_maxrow;
    int v13 = *p_mincol;
    int v14 = self->FC.FR.maxrow - self->FC.FR.minrow - v12;
    int v15 = (int)(float)(v12 - p_RR->minrow);
    int v16 = (long long *)MEMORY[0x1E4F1DAB8];
    self->PB.int width = (int)(float)(*p_maxcol - v13);
    self->PB.int height = v15;
    long long v17 = *v16;
    long long v18 = v16[1];
    *(_OWORD *)&self->PB.T.a = *v16;
    *(_OWORD *)&self->PB.T.c = v18;
    long long v19 = v16[2];
    *(_OWORD *)&self->PB.T.tdouble x = v19;
    *(_OWORD *)&v25.a = v17;
    *(_OWORD *)&v25.c = v18;
    *(_OWORD *)&v25.tdouble x = v19;
    CGAffineTransformTranslate(&v26, &v25, -(double)v13, -(double)v14);
    long long v20 = *(_OWORD *)&v26.c;
    *(_OWORD *)&self->PB.T.a = *(_OWORD *)&v26.a;
    *(_OWORD *)&self->PB.T.c = v20;
    *(_OWORD *)&self->PB.T.tdouble x = *(_OWORD *)&v26.tx;
    long long v21 = *(_OWORD *)&self->PB.T.c;
    *(_OWORD *)&v25.a = *(_OWORD *)&self->PB.T.a;
    *(_OWORD *)&v25.c = v21;
    *(_OWORD *)&v25.tdouble x = *(_OWORD *)&self->PB.T.tx;
    CGAffineTransformInvert(&v26, &v25);
    long long v22 = *(_OWORD *)&v26.c;
    *(_OWORD *)&self->PB.Tp.a = *(_OWORD *)&v26.a;
    *(_OWORD *)&self->PB.Tp.c = v22;
    *(_OWORD *)&self->PB.Tp.tdouble x = *(_OWORD *)&v26.tx;
    self->S.float scale = 1.0;
    self->PB.maskRender = 1;
    self->PB.computeGradient = 0;
    self->PB.computeShine = 1;
    self->PB.computeEyePolygon = 1;
    int v23 = [(CIRedEyeRepair3 *)self prepareBitmapsWithString:"MI"];
    if (!v23) {
      int v23 = [(CIRedEyeRepair3 *)self prepareMasksWithConvexHull:v29];
    }
    [(CIRedEyeRepair3 *)self termBitmaps];
  }
  else
  {
    int v23 = 55;
  }
  [(CIRedEyeRepair3 *)self termHull:v29];
  return v23;
}

- (BOOL)gatherFaceStatistics:(id *)a3
{
  p_FS = &self->FS;
  p_faceBitmap = &self->faceBitmap;
  *(float *)&double v3 = self->S.IOD;
  *(void *)&self->FS.variance = [(CIRedEyeRepair3 *)self focusStatsWithBitmap:&self->faceBitmap IOD:v3];
  *(void *)&p_FS->nNonZero = v8;
  int width = p_faceBitmap->width;
  int height = p_faceBitmap->height;
  if (height < 1)
  {
    int v13 = 0;
    int v14 = 0;
    double v21 = 0.0;
    float v35 = 0.0;
    float v19 = 1000.0;
    float v20 = -1000.0;
  }
  else
  {
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    uint64_t samplesPerPixel = p_faceBitmap->samplesPerPixel;
    uint64_t rowSamples = p_faceBitmap->rowSamples;
    uint64_t v17 = (uint64_t)(p_faceBitmap->baseAddress + 1);
    double v18 = 0.0;
    float v19 = 1000.0;
    float v20 = -1000.0;
    double v21 = 0.0;
    do
    {
      if (width >= 1)
      {
        long long v22 = (unsigned __int8 *)v17;
        int v23 = width;
        do
        {
          unsigned int v24 = *(v22 - 1);
          unsigned int v25 = *v22;
          unsigned int v26 = v22[1];
          double v27 = (double)v25 * 0.587 + (double)v26 * 0.299 + (double)v24 * 0.114;
          if (v27 < v19) {
            float v19 = v27;
          }
          if (v27 > v20) {
            float v20 = v27;
          }
          if (v26 > 0xFA || v25 > 0xFA || v24 > 0xFA) {
            ++v13;
          }
          if (v25 <= v26) {
            unsigned int v30 = v22[1];
          }
          else {
            unsigned int v30 = *v22;
          }
          if (v25 >= v26) {
            unsigned int v31 = v22[1];
          }
          else {
            unsigned int v31 = *v22;
          }
          if (v30 <= v24) {
            unsigned int v30 = *(v22 - 1);
          }
          if (v31 >= v24) {
            unsigned int v31 = *(v22 - 1);
          }
          double v32 = (double)(int)((v30 - v31) * v26) / 65025.0;
          if (v32 <= 0.05) {
            double v32 = -0.0;
          }
          else {
            ++v12;
          }
          double v21 = v21 + v27;
          double v18 = v18 + v32;
          if (v26 < 0x8D && v25 < 0x8D && v24 < 0x8D) {
            ++v14;
          }
          v22 += samplesPerPixel;
          --v23;
        }
        while (v23);
      }
      ++v11;
      v17 += rowSamples;
    }
    while (v11 != height);
    float v35 = 1.0 / (double)v12 * v18;
    if (!v12) {
      float v35 = 0.0;
    }
  }
  self->skinval = v35;
  double v36 = 1.0 / (double)(height * width);
  float v37 = v36 * v21;
  a3->uint64_t var0 = v35;
  a3->size_t var1 = v37;
  a3->size_t var2 = v19;
  a3->uint64_t var3 = v20;
  float v38 = v36 * ((float)v14 * 100.0);
  float v39 = v36 * ((float)v13 * 100.0);
  a3->int var4 = v38;
  a3->int var5 = v39;
  return 1;
}

- ($000CCD7ED2ADA2E18343834BA3C2DAF0)focusStatsWithBitmap:(id *)a3 IOD:(float)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t var0 = a3->var0;
  int var2 = a3->var2;
  uint64_t var3 = a3->var3;
  uint64_t var6 = a3->var6;
  int var1 = a3->var1;
  bzero(v54, 0x800uLL);
  bzero(v53, 0x400uLL);
  if (var2 > 2)
  {
    int v9 = 1;
    uint64_t v10 = (uint64_t)&var0[var6 + 1 + var3];
    do
    {
      if (var1 >= 3)
      {
        int v11 = var1 - 2;
        int v12 = (unsigned __int8 *)v10;
        do
        {
          unint64_t v13 = *v12;
          unsigned int v14 = v12[1 - (int)var6 - 1];
          int v15 = &v12[1 - (int)var3];
          unsigned int v16 = v12[var3];
          v12 += var6;
          unsigned int v17 = *v12;
          unsigned int v18 = *(v15 - 1);
          ++v53[v13];
          if (v13 <= 0xF0 && v14 <= 0xF0 && v17 <= 0xF0 && v18 <= 0xF0 && v16 <= 0xF0)
          {
            int v19 = ((v14 + v17 + v18 + v16 + 2) >> 2) - v13 + 256;
            ++v54[v19];
          }
          --v11;
        }
        while (v11);
      }
      v10 += var3;
    }
    while (v9++ != var2 - 2);
  }
  uint64_t v21 = 0;
  int32x4_t v22 = (int32x4_t)xmmword_19394C9F0;
  int32x4_t v23 = 0uLL;
  v24.i64[0] = 0x400000004;
  v24.i64[1] = 0x400000004;
  int32x4_t v25 = 0uLL;
  do
  {
    int32x4_t v26 = *(int32x4_t *)&v54[v21];
    int32x4_t v23 = vaddq_s32(v26, v23);
    int32x4_t v25 = vmlaq_s32(v25, v26, v22);
    int32x4_t v22 = vaddq_s32(v22, v24);
    v21 += 4;
  }
  while (v21 != 512);
  uint64_t v27 = 0;
  double v28 = (double)vaddvq_s32(v23);
  float64x2_t v29 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)vaddvq_s32(v25) / v28), 0);
  int32x4_t v30 = (int32x4_t)xmmword_19394C9F0;
  double v31 = 0.0;
  v32.i64[0] = 0x400000004;
  v32.i64[1] = 0x400000004;
  do
  {
    v33.i64[0] = v30.i32[0];
    v33.i64[1] = v30.i32[1];
    float64x2_t v34 = vcvtq_f64_s64(v33);
    v33.i64[0] = v30.i32[2];
    v33.i64[1] = v30.i32[3];
    float64x2_t v35 = vsubq_f64(vcvtq_f64_s64(v33), v29);
    float64x2_t v36 = vsubq_f64(v34, v29);
    long long v37 = *(_OWORD *)&v54[v27];
    v33.i64[0] = v37;
    v33.i64[1] = DWORD1(v37);
    float64x2_t v38 = vcvtq_f64_u64((uint64x2_t)v33);
    v33.i64[0] = DWORD2(v37);
    v33.i64[1] = HIDWORD(v37);
    float64x2_t v39 = vmulq_f64(vmulq_f64(v35, v35), vcvtq_f64_u64((uint64x2_t)v33));
    float64x2_t v40 = vmulq_f64(vmulq_f64(v36, v36), v38);
    double v31 = v31 + v40.f64[0] + v40.f64[1] + v39.f64[0] + v39.f64[1];
    int32x4_t v30 = vaddq_s32(v30, v32);
    v27 += 4;
  }
  while (v27 != 512);
  uint64_t v41 = 0;
  unint64_t v42 = 0;
  do
  {
    if (v54[v41]) {
      unint64_t v42 = (v42 + 1) | v42 & 0xFFFFFFFF00000000;
    }
    ++v41;
  }
  while (v41 != 512);
  int v43 = (var2 - 3) * (var1 - 3);
  if (v43 < 20)
  {
    int v51 = 255;
    int v48 = 2;
  }
  else
  {
    unint64_t v44 = 0;
    int v45 = 0;
    int v46 = v43 / 20;
    do
    {
      int v47 = v44 + 1;
      if (v44 > 0xFE) {
        break;
      }
      v45 += v53[v44++];
    }
    while (v45 < v46);
    int v48 = 2 - v47;
    int v49 = 0;
    int v50 = 255;
    do
    {
      int v51 = v50 - 1;
      if (!v50) {
        break;
      }
      v49 += v53[v50--];
    }
    while (v49 < v46);
  }
  double v52 = v31 / v28 / ((float)(v48 + v51) / 255.0);
  result.int var1 = v42;
  result.uint64_t var0 = v52;
  return result;
}

- (BOOL)isBlurryWithFocusStats:(id)a3
{
  return a3.var0 < 14.0;
}

@end