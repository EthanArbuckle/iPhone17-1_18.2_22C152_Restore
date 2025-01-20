@interface ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation
- (ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation)init;
- (BOOL)decisionHistoryContainsPlaneChange:(id)a3 relativeToNewDecision:(id)a4;
- (BOOL)hasFormedClusterForInitialPlacement:(float *)a3 planeNormal:;
- (BOOL)hasFormedClusterForMovement:(float *)a3 planeNormal:;
- (BOOL)resultsContainPoorQualityEstimatedResults:(id)a3;
- (id)decisionForHitTestOfType:(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self atScreenPoint:(SEL)a2 inFrame:(int64_t)a3 withViewportSize:(id)a4 assetPosition:(CGSize)a5 maxDistance:(float)a6;
- (id)decisionForHitTestOfType:(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self atScreenPoint:(SEL)a2 inSession:(int64_t)a3 withViewportSize:(id)a4 assetPosition:(CGSize)a5 maxDistance:(float)a6;
- (id)decisionForHitTestOfType:(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self originalResult:(SEL)a2 atImagePoint:(int64_t)a3 inFrame:(id)a4 withViewportSize:(id)a5 assetPosition:(CGSize)a6 maxDistance:(float)a7;
- (id)decisionForMovementFromOriginalResult:(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self atImagePoint:(SEL)a2 inFrame:(id)a3 withViewportSize:(id)a4 assetPosition:(CGSize)a5 maxDistance:(float)a6;
- (id)decisionForPlacementFromOriginalResult:(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self afterPlacementTimeout:(SEL)a2 atImagePoint:(id)a3 inFrame:(BOOL)a4 withViewportSize:(id)a5 assetPosition:(CGSize)a6 maxDistance:(float)a7;
- (id)interpolatedDecisionForDecision:(id)a3;
- (id)reprojectOntoCurrentPlaneAtImagePoint:(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self inFrame:(SEL)a2 withViewportSize:(id)a3 assetPosition:(CGSize)a4 maxDistance:(float)a5;
- (void)clearHistory;
@end

@implementation ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation

- (ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation)init
{
  +[ASVSettings floatForKey:@"ASVSettingHitTestClusterSizeForPlacement"];
  unint64_t v4 = vcvtms_u32_f32(v3);
  +[ASVSettings floatForKey:@"ASVSettingHitTestClusterSizeForMovement"];
  unint64_t v6 = vcvtms_u32_f32(v5);
  if (v4 <= v6) {
    unint64_t v4 = v6;
  }
  +[ASVSettings floatForKey:@"ASVSettingInterpolationPlaneChangeDecisionCount"];
  v9.receiver = self;
  v9.super_class = (Class)ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation;
  result = [(ASVHitTestHistory *)&v9 initWithResultCapacity:v4 decisionCapacity:vcvtms_u32_f32(v7)];
  if (result)
  {
    result->_currentPlaneHeight = -1000000.0;
    *(_OWORD *)&result->_currentPlaneNormal[4] = kASVInvalidPosition;
  }
  return result;
}

- (void)clearHistory
{
  v3.receiver = self;
  v3.super_class = (Class)ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation;
  [(ASVHitTestHistory *)&v3 clearHistory];
  self->_currentPlaneHeight = -1000000.0;
  *(_OWORD *)&self->_currentPlaneNormal[4] = kASVInvalidPosition;
}

- (id)decisionForHitTestOfType:(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self atScreenPoint:(SEL)a2 inSession:(int64_t)a3 withViewportSize:(id)a4 assetPosition:(CGSize)a5 maxDistance:(float)a6
{
  int v8 = v7;
  double v25 = v6;
  double v9 = *(double *)&a6;
  double height = a5.height;
  double width = a5.width;
  id v14 = a4;
  v15 = [v14 currentFrame];
  if (+[ASVUserDefaults forceUseLegacyHitTestAPI])
  {
    LODWORD(v16) = v8;
    v17 = -[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation decisionForHitTestOfType:atScreenPoint:inFrame:withViewportSize:assetPosition:maxDistance:](self, "decisionForHitTestOfType:atScreenPoint:inFrame:withViewportSize:assetPosition:maxDistance:", a3, v15, width, height, v9, v25, v16);
  }
  else
  {
    v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
    objc_msgSend(v15, "normalizedImagePointForScreenPoint:viewportSize:orientation:", objc_msgSend(v18, "currentOrientation"), width, height, v9);
    double v20 = v19;

    LODWORD(v21) = v8;
    v22 = [v14 smartRaycastResultForImagePoint:v20 assetPosition:v25 maxDistance:v21];
    LODWORD(v23) = v8;
    v17 = -[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation decisionForHitTestOfType:originalResult:atImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:](self, "decisionForHitTestOfType:originalResult:atImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:", a3, v22, v15, v20, height, v9, v25, v23);
  }
  return v17;
}

- (id)decisionForHitTestOfType:(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self atScreenPoint:(SEL)a2 inFrame:(int64_t)a3 withViewportSize:(id)a4 assetPosition:(CGSize)a5 maxDistance:(float)a6
{
  int v8 = v7;
  double v24 = v6;
  double v9 = *(double *)&a6;
  double height = a5.height;
  double width = a5.width;
  id v14 = (void *)MEMORY[0x1E4FB1BA8];
  id v15 = a4;
  double v16 = [v14 mainScreen];
  objc_msgSend(v15, "normalizedImagePointForScreenPoint:viewportSize:orientation:", objc_msgSend(v16, "currentOrientation"), width, height, v9);
  double v18 = v17;

  LODWORD(v19) = v8;
  double v20 = [v15 smartHitTestResultForImagePoint:v18 assetPosition:v24 maxDistance:v19];
  LODWORD(v21) = v8;
  v22 = -[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation decisionForHitTestOfType:originalResult:atImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:](self, "decisionForHitTestOfType:originalResult:atImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:", a3, v20, v15, v18, height, v9, v24, v21);

  return v22;
}

- (id)decisionForHitTestOfType:(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self originalResult:(SEL)a2 atImagePoint:(int64_t)a3 inFrame:(id)a4 withViewportSize:(id)a5 assetPosition:(CGSize)a6 maxDistance:(float)a7
{
  if ((unint64_t)a3 > 1)
  {
    uint64_t v9 = -[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation decisionForMovementFromOriginalResult:atImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:](self, "decisionForMovementFromOriginalResult:atImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:", a4, a5, a6.width, a6.height);
    if (!v9)
    {
      int v8 = 0;
      goto LABEL_8;
    }
    v10 = (void *)v9;
    int v8 = [(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self interpolatedDecisionForDecision:v9];

LABEL_6:
    [(ASVHitTestHistory *)self addDecision:v8];
    goto LABEL_8;
  }
  int v8 = -[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation decisionForPlacementFromOriginalResult:afterPlacementTimeout:atImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:](self, "decisionForPlacementFromOriginalResult:afterPlacementTimeout:atImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:", a4, a3 == 1, a5, a6.width, a6.height);
  if (v8) {
    goto LABEL_6;
  }
LABEL_8:
  return v8;
}

- (id)decisionForPlacementFromOriginalResult:(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self afterPlacementTimeout:(SEL)a2 atImagePoint:(id)a3 inFrame:(BOOL)a4 withViewportSize:(id)a5 assetPosition:(CGSize)a6 maxDistance:(float)a7
{
  int v9 = v8;
  long long v25 = v7;
  double v10 = *(double *)&a7;
  double height = a6.height;
  double width = a6.width;
  BOOL v14 = a4;
  id v16 = a3;
  id v17 = a5;
  if (!v16)
  {
LABEL_9:
    double v18 = 0;
    goto LABEL_12;
  }
  [(ASVHitTestHistory *)self addResult:v16];
  if (![v16 isRealPlane])
  {
    float v27 = 0.0;
    DWORD2(v26) = 0;
    *(void *)&long long v26 = 0;
    if ([(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self hasFormedClusterForInitialPlacement:&v27 planeNormal:&v26])
    {
      self->_currentPlaneHeight = v27;
      *(_OWORD *)&self->_currentPlaneNormal[4] = v26;
      LODWORD(v22) = v9;
      double v23 = -[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation reprojectOntoCurrentPlaneAtImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:](self, "reprojectOntoCurrentPlaneAtImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:", v17, width, height, v10, *(double *)&v25, v22);
      if (v23) {
        double v18 = [[ASVHitTestDecision alloc] initWithOriginalResult:v16 interpolatedResult:0 finalResult:v23];
      }
      else {
        double v18 = 0;
      }

      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (v14
    || (double v18 = 0,
        [(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self hasFormedClusterForInitialPlacement:0 planeNormal:0]))
  {
    objc_msgSend(v16, "worldTransform", v25);
    int8x16_t v21 = (int8x16_t)vmulq_f32(v19, v20);
    self->_currentPlaneHeight = vaddv_f32(vadd_f32(*(float32x2_t *)v21.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v21, v21, 8uLL)));
    *(float32x4_t *)&self->_currentPlaneNormal[4] = v19;
    double v18 = [[ASVHitTestDecision alloc] initWithOriginalResult:v16 interpolatedResult:0 finalResult:v16];
  }
LABEL_12:

  return v18;
}

- (id)decisionForMovementFromOriginalResult:(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self atImagePoint:(SEL)a2 inFrame:(id)a3 withViewportSize:(id)a4 assetPosition:(CGSize)a5 maxDistance:(float)a6
{
  int v8 = v7;
  long long v26 = v6;
  double v9 = *(double *)&a6;
  double height = a5.height;
  double width = a5.width;
  id v14 = a3;
  id v15 = a4;
  if (v14)
  {
    [(ASVHitTestHistory *)self addResult:v14];
    if ([v14 isRealPlane])
    {
      [v14 worldTransform];
      int8x16_t v19 = (int8x16_t)vmulq_f32(v17, v18);
      self->_currentPlaneHeight = vaddv_f32(vadd_f32(*(float32x2_t *)v19.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v19, v19, 8uLL)));
      *(float32x4_t *)&self->_currentPlaneNormal[4] = v17;
      float32x4_t v20 = [[ASVHitTestDecision alloc] initWithOriginalResult:v14 interpolatedResult:0 finalResult:v14];
      goto LABEL_13;
    }
    float v28 = 0.0;
    DWORD2(v27) = 0;
    *(void *)&long long v27 = 0;
    if ([(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self hasFormedClusterForMovement:&v28 planeNormal:&v27])
    {
      self->_currentPlaneHeight = v28;
      *(_OWORD *)&self->_currentPlaneNormal[4] = v27;
    }
    LODWORD(v24) = v8;
    int8x16_t v21 = -[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation reprojectOntoCurrentPlaneAtImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:](self, "reprojectOntoCurrentPlaneAtImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:", v15, width, height, v9, *(double *)&v26, v24, v26);
    if (v21)
    {
      double v22 = [ASVHitTestDecision alloc];
      id v23 = v14;
      goto LABEL_10;
    }
LABEL_11:
    float32x4_t v20 = 0;
    goto LABEL_12;
  }
  LODWORD(v16) = v8;
  int8x16_t v21 = -[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation reprojectOntoCurrentPlaneAtImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:](self, "reprojectOntoCurrentPlaneAtImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:", v15, width, height, v9, *(double *)&v26, v16);
  if (!v21) {
    goto LABEL_11;
  }
  double v22 = [ASVHitTestDecision alloc];
  id v23 = 0;
LABEL_10:
  float32x4_t v20 = -[ASVHitTestDecision initWithOriginalResult:interpolatedResult:finalResult:](v22, "initWithOriginalResult:interpolatedResult:finalResult:", v23, 0, v21, v26);
LABEL_12:

LABEL_13:
  return v20;
}

- (id)interpolatedDecisionForDecision:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  +[ASVSettings floatForKey:@"ASVSettingInterpolationPlaneChangeDecisionCount"];
  unint64_t v6 = vcvtms_u32_f32(v5);
  id v7 = [(ASVHitTestHistory *)self recentDecisionsForCount:v6];
  if ([v7 count])
  {
    if ([v7 count] >= v6)
    {
      double v10 = v7;
    }
    else
    {
      uint64_t v8 = [v7 count];
      double v9 = [v7 firstObject];
      double v10 = objc_opt_new();
      for (unint64_t i = v6 - v8; i; --i)
        [v10 addObject:v9];
      [v10 addObjectsFromArray:v7];
    }
    if ([(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self decisionHistoryContainsPlaneChange:v10 relativeToNewDecision:v4])
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v7 = v10;
      uint64_t v12 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v40;
        float v15 = 0.0;
        do
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v40 != v14) {
              objc_enumerationMutation(v7);
            }
            float32x4_t v17 = [*(id *)(*((void *)&v39 + 1) + 8 * j) finalResult];
            [v17 distanceFromCamera];
            float v15 = v15 + v18;
          }
          uint64_t v13 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v13);
      }
      else
      {
        float v15 = 0.0;
      }

      float v36 = v15 / (float)(unint64_t)[v7 count];
      int8x16_t v19 = [v4 finalResult];
      [v19 cameraPosition];
      float32x4_t v38 = v20;
      int8x16_t v21 = [v4 finalResult];
      [v21 cameraToPosition];
      int32x4_t v23 = (int32x4_t)vmulq_f32(v22, v22);
      v23.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v23, 2), vadd_f32(*(float32x2_t *)v23.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v23.i8, 1))).u32[0];
      float32x2_t v24 = vrsqrte_f32((float32x2_t)v23.u32[0]);
      float32x2_t v25 = vmul_f32(v24, vrsqrts_f32((float32x2_t)v23.u32[0], vmul_f32(v24, v24)));
      v38.i64[0] = vmlaq_n_f32(v38, vmulq_n_f32(v22, vmul_f32(v25, vrsqrts_f32((float32x2_t)v23.u32[0], vmul_f32(v25, v25))).f32[0]), v36).u64[0];

      long long v26 = [ASVHitTestResult alloc];
      long long v27 = [v4 finalResult];
      [v27 imagePoint];
      double v29 = v28;
      v30 = [v4 finalResult];
      [v30 assetPosition];
      double v37 = v31;
      v32 = [v4 finalResult];
      [v32 cameraPosition];
      v34 = [(ASVHitTestResult *)v26 initWithType:4 worldPosition:*(double *)v38.i64 imagePoint:v29 assetPosition:v37 cameraPosition:v33];
      [v4 setInterpolatedResult:v34];
    }
    else
    {
      id v7 = v10;
    }
  }

  return v4;
}

- (BOOL)decisionHistoryContainsPlaneChange:(id)a3 relativeToNewDecision:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 finalResult];
  int v8 = [v7 isRealPlane];

  if (v8)
  {
    id v9 = [v6 finalResult];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v32 = v5;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v39 != v13) {
            objc_enumerationMutation(v10);
          }
          float v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          double v16 = objc_msgSend(v15, "finalResult", v32);
          int v17 = [v16 isRealPlane];

          if (v17)
          {
            float v18 = [v15 finalResult];
            int8x16_t v19 = [v9 planeIdentifier];
            float32x4_t v20 = [v18 planeIdentifier];
            int v21 = [v19 isEqual:v20];

            if (!v21)
            {

              LOBYTE(v10) = 1;
              id v5 = v32;
              goto LABEL_23;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    id v5 = v32;
  }
  +[ASVSettings floatForKey:@"ASVSettingInterpolationPlaneChangeMinimumSeparationDistance", v32];
  float v23 = v22;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = v5;
  id v10 = (id)[v9 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v10)
  {
    uint64_t v24 = *(void *)v35;
    while (2)
    {
      for (uint64_t j = 0; j != v10; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(v9);
        }
        long long v26 = [*(id *)(*((void *)&v34 + 1) + 8 * (void)j) finalResult];
        [v26 worldPosition];
        float32x4_t v33 = v27;
        double v28 = [v6 finalResult];
        [v28 worldPosition];
        LODWORD(v30) = vsubq_f32(v33, v29).i32[1];

        if (fabsf(v30) >= v23)
        {
          LOBYTE(v10) = 1;
          goto LABEL_23;
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_23:

  return (char)v10;
}

- (id)reprojectOntoCurrentPlaneAtImagePoint:(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self inFrame:(SEL)a2 withViewportSize:(id)a3 assetPosition:(CGSize)a4 maxDistance:(float)a5
{
  int v7 = v6;
  double v21 = v5;
  double width = a4.width;
  id v10 = a3;
  uint64_t v12 = v10;
  float currentPlaneHeight = self->_currentPlaneHeight;
  if (currentPlaneHeight == -1000000.0)
  {
    uint64_t v14 = 0;
  }
  else
  {
    LODWORD(v11) = v7;
    float v15 = objc_msgSend(v10, "hitTestOnPlaneWithWorldTransform:forImagePoint:maxDistance:", *MEMORY[0x1E4F149A0], *(double *)&self->_currentPlaneNormal[4], *(double *)(MEMORY[0x1E4F149A0] + 32), *(double *)vmulq_n_f32(*(float32x4_t *)&self->_currentPlaneNormal[4], currentPlaneHeight).i64, width, v11);
    if (v15)
    {
      double v16 = [ASVHitTestResult alloc];
      [v15 worldPosition];
      double v20 = v17;
      [v12 cameraPosition];
      uint64_t v14 = [(ASVHitTestResult *)v16 initWithType:3 worldPosition:v20 imagePoint:width assetPosition:v21 cameraPosition:v18];
      [(ASVHitTestResult *)v14 setSynthesizedPlaneNormal:*(double *)&self->_currentPlaneNormal[4]];
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  return v14;
}

- (BOOL)resultsContainPoorQualityEstimatedResults:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  +[ASVSettings floatForKey:@"ASVSettingMinimumEstimatedHitPointDistanceFromCamera"];
  float v5 = v4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (!objc_msgSend(v10, "type", (void)v16))
        {
          [v10 distanceFromCamera];
          if (v11 <= v5
            || ([v10 distanceFromFeaturePoint],
                float v13 = v12,
                [v10 distanceFromCamera],
                v13 > v14))
          {
            LOBYTE(v7) = 1;
            goto LABEL_13;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v7;
}

- (BOOL)hasFormedClusterForInitialPlacement:(float *)a3 planeNormal:
{
  float v4 = v3;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  +[ASVSettings floatForKey:@"ASVSettingHitTestClusterSizeForPlacement"];
  unint64_t v8 = vcvtms_u32_f32(v7);
  if (!v8) {
    return 1;
  }
  id v9 = [(ASVHitTestHistory *)self results];
  unint64_t v10 = [v9 count];

  if (v10 < v8) {
    return 0;
  }
  float v12 = [(ASVHitTestHistory *)self recentResultsForCount:v8];
  if ([(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self resultsContainPoorQualityEstimatedResults:v12])
  {
LABEL_28:
    BOOL v11 = 0;
  }
  else
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v50 count:16];
    float32x4_t v39 = 0u;
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v46;
      float32x4_t v39 = 0uLL;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v46 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v45 + 1) + 8 * i) worldPosition];
          float32x4_t v39 = vaddq_f32(v39, v18);
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v15);
    }

    *(float *)v19.i32 = (float)(unint64_t)[v13 count];
    float32x4_t v38 = vdivq_f32(v39, (float32x4_t)vdupq_lane_s32(v19, 0));
    +[ASVSettings floatForKey:@"ASVSettingPlacementClusterCylinderDiameter"];
    float v21 = v20;
    +[ASVSettings floatForKey:@"ASVSettingPlacementClusterCylinderHeight"];
    float v23 = v22;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v24 = v13;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      float v27 = v21 * 0.5;
      float v28 = v23 * 0.5;
      uint64_t v29 = *(void *)v42;
      float32x2_t v30 = (float32x2_t)vzip1_s32(*(int32x2_t *)v38.f32, (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v38, (int8x16_t)v38, 8uLL));
      while (2)
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v42 != v29) {
            objc_enumerationMutation(v24);
          }
          id v32 = *(void **)(*((void *)&v41 + 1) + 8 * j);
          [v32 worldPosition];
          if (fabsf(COERCE_FLOAT(vsubq_f32(v33, v38).i32[1])) <= v28)
          {
            [v32 worldPosition];
            unsigned int v40 = v34;
            [v32 worldPosition];
            float32x2_t v36 = vsub_f32((float32x2_t)__PAIR64__(v35, v40), v30);
            if (sqrtf(vaddv_f32(vmul_f32(v36, v36))) <= v27) {
              continue;
            }
          }

          goto LABEL_28;
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }

    if (a3) {
      *a3 = v38.f32[1];
    }
    if (v4) {
      *float v4 = xmmword_1E29A3B90;
    }
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)hasFormedClusterForMovement:(float *)a3 planeNormal:
{
  float v4 = v3;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  +[ASVSettings floatForKey:@"ASVSettingHitTestClusterSizeForMovement"];
  unint64_t v8 = vcvtms_u32_f32(v7);
  if (!v8) {
    return 1;
  }
  id v9 = [(ASVHitTestHistory *)self results];
  unint64_t v10 = [v9 count];

  if (v10 >= v8)
  {
    float v12 = [(ASVHitTestHistory *)self recentResultsForCount:v8];
    if (![(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self resultsContainPoorQualityEstimatedResults:v12])
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v51;
        float v17 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v51 != v16) {
              objc_enumerationMutation(v13);
            }
            [*(id *)(*((void *)&v50 + 1) + 8 * i) worldPosition];
            float v17 = v17 + v19;
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v50 objects:v55 count:16];
        }
        while (v15);
      }
      else
      {
        float v17 = 0.0;
      }

      float v20 = v17 / (float)(unint64_t)[v13 count];
      +[ASVSettings floatForKey:@"ASVSettingMovementClusterChainHeight"];
      float v22 = v21;
      +[ASVSettings floatForKey:@"ASVSettingMovementClusterChainLinkDistance"];
      float v24 = v23;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v25 = v13;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        float v28 = v22 * 0.5;
        uint64_t v29 = *(void *)v47;
        while (2)
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v47 != v29) {
              objc_enumerationMutation(v25);
            }
            [*(id *)(*((void *)&v46 + 1) + 8 * j) worldPosition];
            if (vabds_f32(v31, v20) > v28)
            {

              goto LABEL_33;
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v46 objects:v54 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }

      if ((unint64_t)[v25 count] < 2)
      {
LABEL_27:
        if (a3) {
          *a3 = v20;
        }
        if (v4) {
          *float v4 = xmmword_1E29A3B90;
        }
        BOOL v11 = 1;
        goto LABEL_34;
      }
      unint64_t v32 = 1;
      while (1)
      {
        float32x4_t v33 = [v25 objectAtIndexedSubscript:v32];
        unint64_t v34 = v32 - 1;
        unsigned int v35 = [v25 objectAtIndexedSubscript:v34];
        [v33 worldPosition];
        unsigned int v44 = v36;
        [v33 worldPosition];
        float32x2_t v45 = (float32x2_t)__PAIR64__(v37, v44);
        [v35 worldPosition];
        unsigned int v43 = v38;
        [v35 worldPosition];
        float32x2_t v40 = vsub_f32(v45, (float32x2_t)__PAIR64__(v39, v43));
        float v41 = sqrtf(vaddv_f32(vmul_f32(v40, v40)));

        if (v41 > v24) {
          break;
        }
        unint64_t v32 = v34 + 2;
        if (v32 >= [v25 count]) {
          goto LABEL_27;
        }
      }
    }
LABEL_33:
    BOOL v11 = 0;
LABEL_34:

    return v11;
  }
  return 0;
}

@end