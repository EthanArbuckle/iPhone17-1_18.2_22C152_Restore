@interface VNShotflowDetection
- (BOOL)hasLabel;
- (BOOL)isOverlappingLowMergeDet:(id)a3 withOverlapThreshold:(float)a4 withMergeCountDelta:(int)a5;
- (BOOL)isOverlappingSmallFace:(id)a3 withOverlapThreshold:(float)a4 withSizeRatio:(float)a5;
- (CGPoint)boxCenter;
- (CGRect)box;
- (CGRect)defaultBox;
- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8;
- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8 hasLabel:(BOOL)a9 label:(int)a10;
- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8 mergesCount:(int)a9;
- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8 mergesCount:(int)a9 hasLabel:(BOOL)a10 label:(int)a11;
- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8 pitchAngle:(float)a9 hasLabel:(BOOL)a10 label:(int)a11;
- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8 pitchAngle:(float)a9 hasLabel:(BOOL)a10 label:(int)a11 petFaceScore:(float)a12 associatedX:(float)a13 associatedY:(float)a14;
- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8 pitchAngle:(float)a9 mergesCount:(int)a10 hasLabel:(BOOL)a11 label:(int)a12;
- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8 pitchAngle:(float)a9 mergesCount:(int)a10 hasLabel:(BOOL)a11 label:(int)a12 petFaceScore:(float)a13 associatedX:(float)a14 associatedY:(float)a15 groupId:(int)a16;
- (float)associatedX;
- (float)associatedY;
- (float)confidence;
- (float)distanceToDefaultBox;
- (float)intersectionOverArea:(id)a3;
- (float)intersectionOverMinArea:(id)a3;
- (float)overlap:(id)a3;
- (float)petFaceScore;
- (float)pitchAngle;
- (float)rotationAngle;
- (float)smartDistance;
- (float)yawAngle;
- (id)description;
- (int)groupId;
- (int)label;
- (int)mergesCount;
- (int)scale;
- (void)setAssociatedX:(float)a3;
- (void)setAssociatedY:(float)a3;
- (void)setBox:(CGRect)a3;
- (void)setConfidence:(float)a3;
- (void)setDefaultBox:(CGRect)a3;
- (void)setGroupId:(int)a3;
- (void)setHasLabel:(BOOL)a3;
- (void)setLabel:(int)a3;
- (void)setMergesCount:(int)a3;
- (void)setPetFaceScore:(float)a3;
- (void)setPitchAngle:(float)a3;
- (void)setRotationAngle:(float)a3;
- (void)setScale:(int)a3;
- (void)setYawAngle:(float)a3;
@end

@implementation VNShotflowDetection

- (void)setGroupId:(int)a3
{
  self->_groupId = a3;
}

- (int)groupId
{
  return self->_groupId;
}

- (void)setAssociatedY:(float)a3
{
  self->_associatedY = a3;
}

- (float)associatedY
{
  return self->_associatedY;
}

- (void)setAssociatedX:(float)a3
{
  self->_associatedX = a3;
}

- (float)associatedX
{
  return self->_associatedX;
}

- (void)setPetFaceScore:(float)a3
{
  self->_petFaceScore = a3;
}

- (float)petFaceScore
{
  return self->_petFaceScore;
}

- (void)setLabel:(int)a3
{
  self->_label = a3;
}

- (int)label
{
  return self->_label;
}

- (void)setHasLabel:(BOOL)a3
{
  self->_hasLabel = a3;
}

- (BOOL)hasLabel
{
  return self->_hasLabel;
}

- (void)setPitchAngle:(float)a3
{
  self->_pitchAngle = a3;
}

- (float)pitchAngle
{
  return self->_pitchAngle;
}

- (void)setYawAngle:(float)a3
{
  self->_yawAngle = a3;
}

- (float)yawAngle
{
  return self->_yawAngle;
}

- (void)setRotationAngle:(float)a3
{
  self->_rotationAngle = a3;
}

- (float)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setScale:(int)a3
{
  self->_scale = a3;
}

- (int)scale
{
  return self->_scale;
}

- (void)setMergesCount:(int)a3
{
  self->_mergesCount = a3;
}

- (int)mergesCount
{
  return self->_mergesCount;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setDefaultBox:(CGRect)a3
{
  self->_defaultBox = a3;
}

- (CGRect)defaultBox
{
  double x = self->_defaultBox.origin.x;
  double y = self->_defaultBox.origin.y;
  double width = self->_defaultBox.size.width;
  double height = self->_defaultBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBox:(CGRect)a3
{
  self->_bodouble x = a3;
}

- (CGRect)box
{
  double x = self->_box.origin.x;
  double y = self->_box.origin.y;
  double width = self->_box.size.width;
  double height = self->_box.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)description
{
  [(VNShotflowDetection *)self box];
  v7 = (void *)[[NSString alloc] initWithFormat:@"[%g, %g, %g, %g]", v3, v4, v5, v6];
  [(VNShotflowDetection *)self defaultBox];
  v12 = (void *)[[NSString alloc] initWithFormat:@"[%g, %g, %g, %g]", v8, v9, v10, v11];
  [(VNShotflowDetection *)self boxCenter];
  v15 = (void *)[[NSString alloc] initWithFormat:@"(%g, %g)", v13, v14];
  id v16 = [NSString alloc];
  [(VNShotflowDetection *)self confidence];
  float v18 = v17;
  [(VNShotflowDetection *)self rotationAngle];
  float v20 = v19;
  [(VNShotflowDetection *)self yawAngle];
  float v22 = v21;
  uint64_t v23 = [(VNShotflowDetection *)self label];
  [(VNShotflowDetection *)self petFaceScore];
  float v25 = v24;
  [(VNShotflowDetection *)self associatedX];
  float v27 = v26;
  [(VNShotflowDetection *)self associatedY];
  v29 = objc_msgSend(v16, "initWithFormat:", @"bodouble x = %@; default bodouble x = %@; confidence = %f; rotationAngle = %f; yawAngle = %f label = %d petFaceScore = %f matchingX = %f matchingY %f; boxCenter = %@",
                  v7,
                  v12,
                  v18,
                  v20,
                  v22,
                  v23,
                  v25,
                  v27,
                  v28,
                  v15);

  return v29;
}

- (BOOL)isOverlappingLowMergeDet:(id)a3 withOverlapThreshold:(float)a4 withMergeCountDelta:(int)a5
{
  id v8 = a3;
  [v8 box];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(VNShotflowDetection *)self box];
  float v20 = v12;
  float v21 = v16;
  float v22 = v20 + v21;
  float v23 = v10;
  float v24 = v14;
  float v25 = v24 * v21;
  float v27 = v17 + v26;
  if ((float)(v23 + v24) < v27) {
    float v27 = v23 + v24;
  }
  float v28 = v17;
  if (v23 >= v28) {
    float v28 = v10;
  }
  float v29 = fmaxf(v27 - v28, 0.0);
  float v30 = v18 + v19;
  if (v22 < v30) {
    float v30 = v22;
  }
  float v31 = v18;
  if (v20 >= v31) {
    float v31 = v12;
  }
  float v32 = v29 * fmaxf(v30 - v31, 0.0);
  if ((float)(v32 / (float)((float)(v25 + self->_area) - v32)) <= a4)
  {
    BOOL v34 = 0;
  }
  else
  {
    int mergesCount = self->_mergesCount;
    BOOL v34 = (int)(mergesCount - [v8 mergesCount]) > a5;
  }

  return v34;
}

- (BOOL)isOverlappingSmallFace:(id)a3 withOverlapThreshold:(float)a4 withSizeRatio:(float)a5
{
  [a3 box];
  double v9 = v8;
  double v11 = v10;
  float v13 = v12;
  float v15 = v14;
  float v16 = v13 * v15;
  [(VNShotflowDetection *)self box];
  float v20 = v11;
  float v21 = v9;
  float v23 = v17 + v22;
  if ((float)(v21 + v13) < v23) {
    float v23 = v21 + v13;
  }
  float v24 = v17;
  if (v21 >= v24) {
    float v24 = v9;
  }
  float v25 = fmaxf(v23 - v24, 0.0);
  float v26 = v18 + v19;
  if ((float)(v20 + v15) < v26) {
    float v26 = v20 + v15;
  }
  float v27 = v18;
  if (v20 >= v27) {
    float v27 = v11;
  }
  return (float)((float)(v25 * fmaxf(v26 - v27, 0.0)) / v16) > a4 && v16 <= (float)(self->_area * a5);
}

- (float)intersectionOverMinArea:(id)a3
{
  [a3 box];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(VNShotflowDetection *)self box];
  float v16 = v7;
  float v17 = v11;
  float v18 = v16 + v17;
  float v19 = v5;
  float v20 = v9;
  float v21 = v19 + v20;
  float v22 = v20 * v17;
  float v23 = v12 + v14;
  if (v21 < v23) {
    float v23 = v21;
  }
  float v24 = v12;
  if (v19 >= v24) {
    float v24 = v5;
  }
  float v25 = fmaxf(v23 - v24, 0.0);
  float v26 = v13 + v15;
  if (v18 >= v26) {
    float v18 = v13 + v15;
  }
  float v27 = v13;
  if (v16 >= v27) {
    float v27 = v7;
  }
  float v28 = v25 * fmaxf(v18 - v27, 0.0);
  if (v15 * v14 <= v22)
  {
    float v29 = v15 * v14;
    float v30 = v29;
  }
  else
  {
    float v30 = v22;
  }
  return v28 / v30;
}

- (float)intersectionOverArea:(id)a3
{
  [a3 box];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(VNShotflowDetection *)self box];
  float v15 = v7;
  float v16 = v11;
  float v17 = v15 + v16;
  float v18 = v5;
  float v19 = v9;
  float v20 = v19 * v16;
  float v22 = v12 + v21;
  if ((float)(v18 + v19) < v22) {
    float v22 = v18 + v19;
  }
  float v23 = v12;
  if (v18 >= v23) {
    float v23 = v5;
  }
  float v24 = fmaxf(v22 - v23, 0.0);
  float v25 = v13 + v14;
  if (v17 < v25) {
    float v25 = v17;
  }
  float v26 = v13;
  if (v15 >= v26) {
    float v26 = v7;
  }
  return (float)(v24 * fmaxf(v25 - v26, 0.0)) / v20;
}

- (float)overlap:(id)a3
{
  [a3 box];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(VNShotflowDetection *)self box];
  float v15 = v7;
  float v16 = v11;
  float v17 = v15 + v16;
  float v18 = v5;
  float v19 = v9;
  float v20 = v19 * v16;
  float v22 = v12 + v21;
  if ((float)(v18 + v19) < v22) {
    float v22 = v18 + v19;
  }
  float v23 = v12;
  if (v18 >= v23) {
    float v23 = v5;
  }
  float v24 = fmaxf(v22 - v23, 0.0);
  float v25 = v13 + v14;
  if (v17 < v25) {
    float v25 = v17;
  }
  float v26 = v13;
  if (v15 >= v26) {
    float v26 = v7;
  }
  float v27 = fmaxf(v25 - v26, 0.0);
  return (float)(v24 * v27) / (float)((float)(v20 + self->_area) - (float)(v24 * v27));
}

- (float)smartDistance
{
  [(VNShotflowDetection *)self distanceToDefaultBox];
  float v4 = v3;
  [(VNShotflowDetection *)self confidence];
  return v4 + (float)(1.0 - v5);
}

- (float)distanceToDefaultBox
{
  [(VNShotflowDetection *)self boxCenter];
  double v4 = v3;
  double v6 = v5;
  [(VNShotflowDetection *)self defaultBox];
  *(float *)&double v8 = v8 + v7 * 0.5;
  *(float *)&double v10 = v10 + v9 * 0.5;
  return sqrt((v4 - *(float *)&v8) / v7 * ((v4 - *(float *)&v8) / v7)+ (v6 - *(float *)&v10) / v9 * ((v6 - *(float *)&v10) / v9));
}

- (CGPoint)boxCenter
{
  [(VNShotflowDetection *)self box];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGFloat MidX = CGRectGetMidX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v11);
  double v8 = MidX;
  result.CGFloat y = MidY;
  result.CGFloat x = v8;
  return result;
}

- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8 pitchAngle:(float)a9 mergesCount:(int)a10 hasLabel:(BOOL)a11 label:(int)a12 petFaceScore:(float)a13 associatedX:(float)a14 associatedY:(float)a15 groupId:(int)a16
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v25 = a3.size.height;
  double v26 = a3.size.width;
  CGFloat v27 = a3.origin.y;
  CGFloat v28 = a3.origin.x;
  v31.receiver = self;
  v31.super_class = (Class)VNShotflowDetection;
  CGPoint result = [(VNShotflowDetection *)&v31 init];
  if (result)
  {
    result->_box.origin.CGFloat x = v28;
    result->_box.origin.CGFloat y = v27;
    result->_box.size.CGFloat width = v26;
    result->_box.size.CGFloat height = v25;
    result->_defaultBox.origin.CGFloat x = x;
    result->_defaultBox.origin.CGFloat y = y;
    result->_defaultBox.size.CGFloat width = width;
    result->_defaultBox.size.CGFloat height = height;
    result->_confidence = a5;
    result->_int mergesCount = a10;
    result->_scale = a6;
    result->_rotationAngle = a7;
    result->_yawAngle = a8;
    result->_pitchAngle = a9;
    float v30 = v26 * v25;
    result->_area = v30;
    result->_hasLabel = a11;
    result->_label = a12;
    result->_petFaceScore = a13;
    result->_associatedX = a14;
    result->_associatedY = a15;
    result->_groupId = a16;
  }
  return result;
}

- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8 pitchAngle:(float)a9 hasLabel:(BOOL)a10 label:(int)a11 petFaceScore:(float)a12 associatedX:(float)a13 associatedY:(float)a14
{
  return -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:petFaceScore:associatedX:associatedY:groupId:](self, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:petFaceScore:associatedX:associatedY:groupId:", *(void *)&a6, 1, a10, *(void *)&a11, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8 pitchAngle:(float)a9 mergesCount:(int)a10 hasLabel:(BOOL)a11 label:(int)a12
{
  LODWORD(v13) = 0;
  return -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:petFaceScore:associatedX:associatedY:groupId:](self, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:petFaceScore:associatedX:associatedY:groupId:", *(void *)&a6, *(void *)&a10, a11, *(void *)&a12, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *(void *)&a5, *(void *)&a8, 0,
           v13);
}

- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8 mergesCount:(int)a9 hasLabel:(BOOL)a10 label:(int)a11
{
  return -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:](self, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:", *(void *)&a6, 1, a10, *(void *)&a11, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *(void *)&a5, LODWORD(a8));
}

- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8 pitchAngle:(float)a9 hasLabel:(BOOL)a10 label:(int)a11
{
  return -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:](self, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:", *(void *)&a6, 1, a10, *(void *)&a11, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8 hasLabel:(BOOL)a9 label:(int)a10
{
  return -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:](self, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:", *(void *)&a6, 1, a9, *(void *)&a10, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *(void *)&a5, LODWORD(a8));
}

- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8 mergesCount:(int)a9
{
  return -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:](self, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:", *(void *)&a6, *(void *)&a9, 0, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *(void *)&a5, LODWORD(a8));
}

- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8
{
  return -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:mergesCount:](self, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:mergesCount:", *(void *)&a6, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

@end