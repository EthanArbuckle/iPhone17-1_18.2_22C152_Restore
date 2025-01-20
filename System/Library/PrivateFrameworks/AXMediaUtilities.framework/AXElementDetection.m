@interface AXElementDetection
- (AXElementDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6;
- (AXElementDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 hasLabel:(BOOL)a7 label:(int)a8;
- (AXElementDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 hasLabel:(BOOL)a7 label:(int)a8 labelName:(id)a9;
- (AXElementDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 mergesCount:(int)a7;
- (AXElementDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 mergesCount:(int)a7 hasLabel:(BOOL)a8 label:(int)a9;
- (AXElementDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 mergesCount:(int)a7 hasLabel:(BOOL)a8 label:(int)a9 labelName:(id)a10;
- (BOOL)hasLabel;
- (BOOL)isOverlappingLowMergeDet:(id)a3 withOverlapThreshold:(float)a4 withMergeCountDelta:(int)a5;
- (BOOL)isOverlappingSmallFace:(id)a3 withOverlapThreshold:(float)a4 withSizeRatio:(float)a5;
- (CGPoint)boxCenter;
- (CGRect)box;
- (CGRect)defaultBox;
- (NSString)labelName;
- (float)confidence;
- (float)distanceToDefaultBox;
- (float)iOa:(id)a3;
- (float)overlap:(id)a3;
- (float)smartDistance;
- (id)description;
- (int)label;
- (int)mergesCount;
- (int)scale;
- (void)setBox:(CGRect)a3;
- (void)setConfidence:(float)a3;
- (void)setDefaultBox:(CGRect)a3;
- (void)setHasLabel:(BOOL)a3;
- (void)setLabel:(int)a3;
- (void)setLabelName:(id)a3;
- (void)setMergesCount:(int)a3;
- (void)setScale:(int)a3;
@end

@implementation AXElementDetection

- (AXElementDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6
{
  return -[AXElementDetection initWithBox:defaultBox:confidence:scale:mergesCount:](self, "initWithBox:defaultBox:confidence:scale:mergesCount:", *(void *)&a6, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (AXElementDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 mergesCount:(int)a7
{
  return -[AXElementDetection initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:](self, "initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:", *(void *)&a6, *(void *)&a7, 0, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (AXElementDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 hasLabel:(BOOL)a7 label:(int)a8
{
  return -[AXElementDetection initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:](self, "initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:", *(void *)&a6, 1, a7, *(void *)&a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (AXElementDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 hasLabel:(BOOL)a7 label:(int)a8 labelName:(id)a9
{
  return -[AXElementDetection initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:labelName:](self, "initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:labelName:", *(void *)&a6, 1, a7, *(void *)&a8, a9, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (AXElementDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 mergesCount:(int)a7 hasLabel:(BOOL)a8 label:(int)a9
{
  return -[AXElementDetection initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:labelName:](self, "initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:labelName:", *(void *)&a6, *(void *)&a7, a8, *(void *)&a9, &stru_1F0E72D10, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (AXElementDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 mergesCount:(int)a7 hasLabel:(BOOL)a8 label:(int)a9 labelName:(id)a10
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v19 = a3.size.height;
  double v20 = a3.size.width;
  CGFloat v21 = a3.origin.y;
  CGFloat v22 = a3.origin.x;
  id v24 = a10;
  v29.receiver = self;
  v29.super_class = (Class)AXElementDetection;
  v25 = [(AXElementDetection *)&v29 init];
  v26 = v25;
  if (v25)
  {
    v25->_box.origin.CGFloat x = v22;
    v25->_box.origin.CGFloat y = v21;
    v25->_box.size.CGFloat width = v20;
    v25->_box.size.CGFloat height = v19;
    v25->_defaultBox.origin.CGFloat x = x;
    v25->_defaultBox.origin.CGFloat y = y;
    v25->_defaultBox.size.CGFloat width = width;
    v25->_defaultBox.size.CGFloat height = height;
    v25->_confidence = a5;
    v25->_mergesCount = a7;
    v25->_scale = a6;
    float v27 = v20 * v19;
    v25->_area = v27;
    v25->_hasLabel = a8;
    v25->_label = a9;
    objc_storeStrong((id *)&v25->_labelName, a10);
  }

  return v26;
}

- (CGPoint)boxCenter
{
  [(AXElementDetection *)self box];
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

- (float)distanceToDefaultBox
{
  [(AXElementDetection *)self boxCenter];
  double v4 = v3;
  double v6 = v5;
  [(AXElementDetection *)self defaultBox];
  *(float *)&double v8 = v8 + v7 * 0.5;
  *(float *)&double v10 = v10 + v9 * 0.5;
  return sqrt((v4 - *(float *)&v8) / v7 * ((v4 - *(float *)&v8) / v7)+ (v6 - *(float *)&v10) / v9 * ((v6 - *(float *)&v10) / v9));
}

- (float)smartDistance
{
  [(AXElementDetection *)self distanceToDefaultBox];
  float v4 = v3;
  [(AXElementDetection *)self confidence];
  return v4 + (float)(1.0 - v5);
}

- (float)overlap:(id)a3
{
  [a3 box];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(AXElementDetection *)self box];
  float v15 = v7;
  float v16 = v11;
  float v17 = v5;
  float v18 = v9;
  float v20 = v12 + v19;
  if ((float)(v17 + v18) < v20) {
    float v20 = v17 + v18;
  }
  float v21 = v12;
  if (v17 > v21) {
    float v21 = v5;
  }
  float v22 = v20 - v21;
  if (v22 < 0.0) {
    float v22 = 0.0;
  }
  float v23 = v13 + v14;
  if ((float)(v15 + v16) < v23) {
    float v23 = v15 + v16;
  }
  float v24 = v13;
  if (v15 > v24) {
    float v24 = v7;
  }
  float v25 = v23 - v24;
  if (v25 < 0.0) {
    float v25 = 0.0;
  }
  return (float)(v22 * v25) / (float)((float)((float)(v18 * v16) + self->_area) - (float)(v22 * v25));
}

- (float)iOa:(id)a3
{
  [a3 box];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(AXElementDetection *)self box];
  float v15 = v7;
  float v16 = v11;
  float v17 = v5;
  float v18 = v9;
  float v20 = v12 + v19;
  if ((float)(v17 + v18) < v20) {
    float v20 = v17 + v18;
  }
  float v21 = v12;
  if (v17 > v21) {
    float v21 = v5;
  }
  float v22 = v20 - v21;
  if (v22 < 0.0) {
    float v22 = 0.0;
  }
  float v23 = v13 + v14;
  if ((float)(v15 + v16) < v23) {
    float v23 = v15 + v16;
  }
  float v24 = v13;
  if (v15 > v24) {
    float v24 = v7;
  }
  float v25 = v23 - v24;
  if (v25 < 0.0) {
    float v25 = 0.0;
  }
  return (float)(v22 * v25) / (float)(v18 * v16);
}

- (BOOL)isOverlappingSmallFace:(id)a3 withOverlapThreshold:(float)a4 withSizeRatio:(float)a5
{
  [a3 box];
  double v9 = v8;
  double v11 = v10;
  float v13 = v12;
  float v15 = v14;
  float v16 = v13 * v15;
  [(AXElementDetection *)self box];
  float v20 = v11;
  float v21 = v9;
  float v23 = v17 + v22;
  if ((float)(v21 + v13) < v23) {
    float v23 = v21 + v13;
  }
  float v24 = v17;
  if (v21 > v24) {
    float v24 = v9;
  }
  float v25 = v23 - v24;
  if (v25 < 0.0) {
    float v25 = 0.0;
  }
  float v26 = v18 + v19;
  if ((float)(v20 + v15) < v26) {
    float v26 = v20 + v15;
  }
  float v27 = v18;
  if (v20 > v27) {
    float v27 = v11;
  }
  float v28 = v26 - v27;
  if (v28 < 0.0) {
    float v28 = 0.0;
  }
  return (float)((float)(v25 * v28) / v16) > a4 && v16 <= (float)(self->_area * a5);
}

- (BOOL)isOverlappingLowMergeDet:(id)a3 withOverlapThreshold:(float)a4 withMergeCountDelta:(int)a5
{
  id v8 = a3;
  [v8 box];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(AXElementDetection *)self box];
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
  if (v23 > v28) {
    float v28 = v10;
  }
  float v29 = v27 - v28;
  if (v29 < 0.0) {
    float v29 = 0.0;
  }
  float v30 = v18 + v19;
  if (v22 < v30) {
    float v30 = v22;
  }
  float v31 = v18;
  if (v20 > v31) {
    float v31 = v12;
  }
  float v32 = v30 - v31;
  if (v32 < 0.0) {
    float v32 = 0.0;
  }
  if ((float)((float)(v29 * v32) / (float)((float)(v25 + self->_area) - (float)(v29 * v32))) <= a4)
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

- (id)description
{
  float v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)AXElementDetection;
  double v4 = [(AXElementDetection *)&v14 description];
  double v5 = (void *)MEMORY[0x1E4F29238];
  [(AXElementDetection *)self box];
  v13[0] = v6;
  v13[1] = v7;
  v13[2] = v8;
  v13[3] = v9;
  double v10 = [v5 valueWithBytes:v13 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  double v11 = [v3 stringWithFormat:@"%@: %@", v4, v10];

  return v11;
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

- (void)setBox:(CGRect)a3
{
  self->_bodouble x = a3;
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

- (void)setDefaultBox:(CGRect)a3
{
  self->_defaultBodouble x = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (int)mergesCount
{
  return self->_mergesCount;
}

- (void)setMergesCount:(int)a3
{
  self->_int mergesCount = a3;
}

- (int)scale
{
  return self->_scale;
}

- (void)setScale:(int)a3
{
  self->_scale = a3;
}

- (BOOL)hasLabel
{
  return self->_hasLabel;
}

- (void)setHasLabel:(BOOL)a3
{
  self->_hasLabel = a3;
}

- (int)label
{
  return self->_label;
}

- (void)setLabel:(int)a3
{
  self->_label = a3;
}

- (NSString)labelName
{
  return self->_labelName;
}

- (void)setLabelName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end