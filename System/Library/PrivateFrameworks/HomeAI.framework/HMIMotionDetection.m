@interface HMIMotionDetection
+ (id)firstMotionDetectionInArray:(id)a3 withMode:(unint64_t)a4;
- (BOOL)applyEventTypeAndCheckIfSubBoundingIsStatic:(CGRect)a3 eventClass:(Class)a4 confidence:(float)a5;
- (CGRect)boundingBox;
- (CGSize)size;
- (HMIMotionDetection)initWithBoundingBox:(CGRect)a3 size:(CGSize)a4 motionVectors:(id)a5 motionScore:(float)a6 motionMode:(unint64_t)a7;
- (NSArray)motionVectors;
- (float)motionScore;
- (float)scoreForSubBoundingBox:(CGRect)a3 eventClass:(Class)a4 confidence:(float)a5;
- (id)classMotionScoreMap;
- (id)classPaddingMap;
- (unint64_t)motionMode;
@end

@implementation HMIMotionDetection

- (HMIMotionDetection)initWithBoundingBox:(CGRect)a3 size:(CGSize)a4 motionVectors:(id)a5 motionScore:(float)a6 motionMode:(unint64_t)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat v11 = a3.size.height;
  CGFloat v12 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v16 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HMIMotionDetection;
  v17 = [(HMIMotionDetection *)&v22 init];
  v18 = v17;
  if (v17)
  {
    v17->_boundingBox.origin.CGFloat x = x;
    v17->_boundingBox.origin.CGFloat y = y;
    v17->_boundingBox.size.CGFloat width = v12;
    v17->_boundingBox.size.CGFloat height = v11;
    v17->_size.CGFloat width = width;
    v17->_size.CGFloat height = height;
    uint64_t v19 = [v16 copy];
    motionVectors = v18->_motionVectors;
    v18->_motionVectors = (NSArray *)v19;

    v18->_motionScore = a6;
    v18->_motionMode = a7;
  }

  return v18;
}

+ (id)firstMotionDetectionInArray:(id)a3 withMode:(unint64_t)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__HMIMotionDetection_firstMotionDetectionInArray_withMode___block_invoke;
  v6[3] = &__block_descriptor_40_e28_B16__0__HMIMotionDetection_8l;
  v6[4] = a4;
  v4 = objc_msgSend(a3, "na_firstObjectPassingTest:", v6);
  return v4;
}

BOOL __59__HMIMotionDetection_firstMotionDetectionInArray_withMode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 motionMode] == *(void *)(a1 + 32);
}

- (float)scoreForSubBoundingBox:(CGRect)a3 eventClass:(Class)a4 confidence:(float)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  unint64_t v11 = 0;
  float v12 = 0.0;
  while (1)
  {
    v13 = [(HMIMotionDetection *)self motionVectors];
    unint64_t v14 = [v13 count];

    if (v14 <= v11) {
      break;
    }
    v15 = [(HMIMotionDetection *)self motionVectors];
    id v16 = [v15 objectAtIndexedSubscript:v11];

    [v16 target];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    BOOL v21 = (Class)[v16 eventClass] == a4 || objc_msgSend(v16, "eventClass") == 0;
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.double width = width;
    v27.size.double height = height;
    v26.CGFloat x = v18;
    v26.CGFloat y = v20;
    if (CGRectContainsPoint(v27, v26) && v21)
    {
      [v16 distance];
      double v23 = sqrt(v22) + v12;
      float v12 = v23;
      *(float *)&double v23 = a5;
      if (a5 > 0.6) {
        objc_msgSend(v16, "setEventClass:", a4, v23);
      }
    }

    ++v11;
  }
  return v12 / (height * width + 0.00000011920929);
}

- (BOOL)applyEventTypeAndCheckIfSubBoundingIsStatic:(CGRect)a3 eventClass:(Class)a4 confidence:(float)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  float v12 = [(HMIMotionDetection *)self classMotionScoreMap];
  v13 = [(HMIMotionDetection *)self classPaddingMap];
  unint64_t v14 = [v13 objectForKeyedSubscript:a4];
  [v14 floatValue];
  float v16 = v15;

  double v17 = [v12 objectForKeyedSubscript:a4];
  [v17 floatValue];
  float v19 = v18;

  [(HMIMotionDetection *)self size];
  +[HMIVisionUtilities applyPadding:withOriginalSize:padding:](HMIVisionUtilities, "applyPadding:withOriginalSize:padding:", x, y, width, height, v20, v21, v16, v16);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  if ((Class)objc_opt_class() == a4) {
    a4 = (Class)objc_opt_class();
  }
  *(float *)&double v30 = a5;
  -[HMIMotionDetection scoreForSubBoundingBox:eventClass:confidence:](self, "scoreForSubBoundingBox:eventClass:confidence:", a4, v23, v25, v27, v29, v30);
  BOOL v32 = v31 < v19;

  return v32;
}

- (id)classMotionScoreMap
{
  if (-[HMIMotionDetection classMotionScoreMap]::onceToken != -1) {
    dispatch_once(&-[HMIMotionDetection classMotionScoreMap]::onceToken, &__block_literal_global_39);
  }
  v2 = (void *)-[HMIMotionDetection classMotionScoreMap]::motionScoreMap;
  return v2;
}

void __41__HMIMotionDetection_classMotionScoreMap__block_invoke()
{
  v3[3] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v3[0] = &unk_26D9A9D58;
  v2[1] = objc_opt_class();
  v3[1] = &unk_26D9A9D68;
  v2[2] = objc_opt_class();
  v3[2] = &unk_26D9A9D58;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)-[HMIMotionDetection classMotionScoreMap]::motionScoreMap;
  -[HMIMotionDetection classMotionScoreMap]::motionScoreMap = v0;
}

- (id)classPaddingMap
{
  if (-[HMIMotionDetection classPaddingMap]::onceToken != -1) {
    dispatch_once(&-[HMIMotionDetection classPaddingMap]::onceToken, &__block_literal_global_45);
  }
  v2 = (void *)-[HMIMotionDetection classPaddingMap]::paddingMap;
  return v2;
}

void __37__HMIMotionDetection_classPaddingMap__block_invoke()
{
  v3[3] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v3[0] = &unk_26D9A9D78;
  v2[1] = objc_opt_class();
  v3[1] = &unk_26D9A9D88;
  v2[2] = objc_opt_class();
  v3[2] = &unk_26D9A9D78;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)-[HMIMotionDetection classPaddingMap]::paddingMap;
  -[HMIMotionDetection classPaddingMap]::paddingMap = v0;
}

- (CGRect)boundingBox
{
  objc_copyStruct(v6, &self->_boundingBox, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (NSArray)motionVectors
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (CGSize)size
{
  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (float)motionScore
{
  return self->_motionScore;
}

- (unint64_t)motionMode
{
  return self->_motionMode;
}

- (void).cxx_destruct
{
}

@end