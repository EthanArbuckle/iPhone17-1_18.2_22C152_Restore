@interface VCPBoundingBox
- (CGRect)getCGRectWithClipWidth:(float)a3 height:(float)a4;
- (VCPBoundingBox)initWithCenterAndSize:(float)a3 y:(float)a4 width:(float)a5 height:(float)a6 confidence:(float)a7;
- (VCPBoundingBox)initWithXYAndSize:(float)a3 y:(float)a4 width:(float)a5 height:(float)a6 confidence:(float)a7;
- (float)area;
- (float)computeIntersectionOverUnion:(id)a3;
- (float)confidence;
- (float)flag;
- (float)maxX;
- (float)maxY;
- (float)minX;
- (float)minY;
- (id)intersect:(id)a3;
- (id)union:(id)a3;
- (int)classIndex;
- (int)extendBoxBy:(float)a3 scaleX:(float)a4 scaleY:(float)a5;
- (int)groupID;
- (int)trackID;
- (void)setClassIndex:(int)a3;
- (void)setConfidence:(float)a3;
- (void)setFlag:(float)a3;
- (void)setGroupID:(int)a3;
- (void)setMaxX:(float)a3;
- (void)setMaxY:(float)a3;
- (void)setMinX:(float)a3;
- (void)setMinY:(float)a3;
- (void)setTrackID:(int)a3;
@end

@implementation VCPBoundingBox

- (VCPBoundingBox)initWithXYAndSize:(float)a3 y:(float)a4 width:(float)a5 height:(float)a6 confidence:(float)a7
{
  v21.receiver = self;
  v21.super_class = (Class)VCPBoundingBox;
  v12 = [(VCPBoundingBox *)&v21 init];
  v14 = v12;
  if (v12)
  {
    *(float *)&double v13 = a3;
    [(VCPBoundingBox *)v12 setMinX:v13];
    *(float *)&double v15 = a4;
    [(VCPBoundingBox *)v14 setMinY:v15];
    *(float *)&double v16 = a3 + a5;
    [(VCPBoundingBox *)v14 setMaxX:v16];
    *(float *)&double v17 = a4 + a6;
    [(VCPBoundingBox *)v14 setMaxY:v17];
    *(float *)&double v18 = a7;
    [(VCPBoundingBox *)v14 setConfidence:v18];
    [(VCPBoundingBox *)v14 setTrackID:0xFFFFFFFFLL];
    [(VCPBoundingBox *)v14 setGroupID:0xFFFFFFFFLL];
    v19 = v14;
  }

  return v14;
}

- (VCPBoundingBox)initWithCenterAndSize:(float)a3 y:(float)a4 width:(float)a5 height:(float)a6 confidence:(float)a7
{
  v25.receiver = self;
  v25.super_class = (Class)VCPBoundingBox;
  v12 = [(VCPBoundingBox *)&v25 init];
  double v13 = v12;
  if (v12)
  {
    double v14 = a3;
    double v15 = a5;
    double v16 = v14 + v15 * -0.5;
    *(float *)&double v16 = v16;
    [(VCPBoundingBox *)v12 setMinX:v16];
    double v17 = a4;
    double v18 = a6;
    double v19 = v17 + v18 * -0.5;
    *(float *)&double v19 = v19;
    [(VCPBoundingBox *)v13 setMinY:v19];
    double v20 = v14 + v15 * 0.5;
    *(float *)&double v20 = v20;
    [(VCPBoundingBox *)v13 setMaxX:v20];
    double v21 = v17 + v18 * 0.5;
    *(float *)&double v21 = v21;
    [(VCPBoundingBox *)v13 setMaxY:v21];
    *(float *)&double v22 = a7;
    [(VCPBoundingBox *)v13 setConfidence:v22];
    [(VCPBoundingBox *)v13 setTrackID:0xFFFFFFFFLL];
    [(VCPBoundingBox *)v13 setGroupID:0xFFFFFFFFLL];
    v23 = v13;
  }

  return v13;
}

- (float)area
{
  [(VCPBoundingBox *)self maxX];
  float v4 = v3;
  [(VCPBoundingBox *)self minX];
  float v6 = v4 - v5;
  [(VCPBoundingBox *)self maxY];
  float v8 = v7;
  [(VCPBoundingBox *)self minY];
  return v6 * (float)(v8 - v9);
}

- (id)intersect:(id)a3
{
  id v4 = a3;
  [(VCPBoundingBox *)self minX];
  float v6 = v5;
  [v4 minX];
  if (v6 < v7) {
    float v6 = v7;
  }
  [(VCPBoundingBox *)self minY];
  float v9 = v8;
  [v4 minY];
  if (v9 < v10) {
    float v9 = v10;
  }
  [(VCPBoundingBox *)self maxX];
  float v12 = v11;
  [v4 maxX];
  if (v13 >= v12) {
    float v14 = v12;
  }
  else {
    float v14 = v13;
  }
  [(VCPBoundingBox *)self maxY];
  float v16 = v15;
  [v4 maxY];
  if (v17 < v16) {
    float v16 = v17;
  }
  if (v14 <= v6 || v16 <= v9)
  {
    v24 = 0;
  }
  else
  {
    double v19 = [VCPBoundingBox alloc];
    *(float *)&double v20 = v14 - v6;
    *(float *)&double v21 = v16 - v9;
    *(float *)&double v22 = v6;
    *(float *)&double v23 = v9;
    v24 = [(VCPBoundingBox *)v19 initWithXYAndSize:v22 y:v23 width:v20 height:v21 confidence:0.0];
  }

  return v24;
}

- (id)union:(id)a3
{
  id v4 = a3;
  [(VCPBoundingBox *)self minX];
  float v6 = v5;
  [v4 minX];
  if (v7 < v6) {
    float v6 = v7;
  }
  [(VCPBoundingBox *)self minY];
  float v9 = v8;
  [v4 minY];
  if (v10 < v9) {
    float v9 = v10;
  }
  [(VCPBoundingBox *)self maxX];
  float v12 = v11;
  [v4 maxX];
  if (v12 >= v13) {
    float v14 = v12;
  }
  else {
    float v14 = v13;
  }
  [(VCPBoundingBox *)self maxY];
  float v16 = v15;
  [v4 maxY];
  float v18 = v17;
  double v19 = [VCPBoundingBox alloc];
  if (v16 >= v18) {
    *(float *)&double v20 = v16;
  }
  else {
    *(float *)&double v20 = v18;
  }
  *(float *)&double v22 = v14 - v6;
  *(float *)&double v23 = *(float *)&v20 - v9;
  *(float *)&double v20 = v6;
  *(float *)&double v21 = v9;
  v24 = [(VCPBoundingBox *)v19 initWithXYAndSize:v20 y:v21 width:v22 height:v23 confidence:0.0];

  return v24;
}

- (float)computeIntersectionOverUnion:(id)a3
{
  id v4 = a3;
  float v5 = [(VCPBoundingBox *)self intersect:v4];
  float v6 = [(VCPBoundingBox *)self union:v4];
  float v7 = 0.0;
  float v8 = 0.0;
  if (v5)
  {
    [v5 area];
    float v8 = v9;
  }
  if (v6)
  {
    [v6 area];
    float v7 = v10;
  }
  if (v7 == 0.0) {
    float v11 = 0.0;
  }
  else {
    float v11 = v8 / v7;
  }

  return v11;
}

- (CGRect)getCGRectWithClipWidth:(float)a3 height:(float)a4
{
  [(VCPBoundingBox *)self minX];
  if (v7 < a3) {
    float v8 = v7;
  }
  else {
    float v8 = a3;
  }
  if (v7 <= 0.0) {
    float v9 = 0.0;
  }
  else {
    float v9 = v8;
  }
  [(VCPBoundingBox *)self minY];
  if (v10 < a4) {
    float v11 = v10;
  }
  else {
    float v11 = a4;
  }
  if (v10 <= 0.0) {
    float v12 = 0.0;
  }
  else {
    float v12 = v11;
  }
  [(VCPBoundingBox *)self maxX];
  if (v13 < a3) {
    float v14 = v13;
  }
  else {
    float v14 = a3;
  }
  if (v13 <= 0.0) {
    float v15 = 0.0;
  }
  else {
    float v15 = v14;
  }
  [(VCPBoundingBox *)self maxY];
  if (v16 < a4) {
    float v17 = v16;
  }
  else {
    float v17 = a4;
  }
  if (v16 <= 0.0) {
    float v18 = 0.0;
  }
  else {
    float v18 = v17;
  }
  double v19 = (float)(v9 / a3);
  double v20 = (float)(v12 / a4);
  double v21 = (float)((float)(v15 - v9) / a3);
  double v22 = (float)((float)(v18 - v12) / a4);
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (int)extendBoxBy:(float)a3 scaleX:(float)a4 scaleY:(float)a5
{
  int result = -50;
  if (a4 > 0.0 && a5 > 0.0)
  {
    float v9 = 1.0;
    if (a3 < 1.0) {
      float v9 = a3;
    }
    if (a3 <= 0.0) {
      float v10 = 0.0;
    }
    else {
      float v10 = v9;
    }
    [(VCPBoundingBox *)self maxX];
    float v12 = v11;
    [(VCPBoundingBox *)self minX];
    float v14 = (float)(v12 - v13) * 0.5;
    [(VCPBoundingBox *)self maxY];
    float v16 = v15;
    [(VCPBoundingBox *)self minY];
    float v18 = (float)(v16 - v17) * 0.5;
    [(VCPBoundingBox *)self minX];
    float v20 = v14 + v19;
    [(VCPBoundingBox *)self minY];
    float v22 = *(float *)&v21 + v18;
    if (v14 >= v18) {
      float v23 = v14;
    }
    else {
      float v23 = v18;
    }
    float v24 = v10 * v14;
    float v25 = v10 * v18;
    *(float *)&double v21 = (float)((float)(v20 - v23) - v24) / a4;
    if (*(float *)&v21 < 0.0) {
      *(float *)&double v21 = 0.0;
    }
    [(VCPBoundingBox *)self setMinX:v21];
    *(float *)&double v26 = (float)(v24 + (float)(v20 + v23)) / a4;
    if (*(float *)&v26 > 1.0) {
      *(float *)&double v26 = 1.0;
    }
    [(VCPBoundingBox *)self setMaxX:v26];
    *(float *)&double v27 = (float)((float)(v22 - v23) - v25) / a5;
    if (*(float *)&v27 < 0.0) {
      *(float *)&double v27 = 0.0;
    }
    [(VCPBoundingBox *)self setMinY:v27];
    *(float *)&double v28 = (float)(v25 + (float)(v22 + v23)) / a5;
    if (*(float *)&v28 > 1.0) {
      *(float *)&double v28 = 1.0;
    }
    [(VCPBoundingBox *)self setMaxY:v28];
    return 0;
  }
  return result;
}

- (float)minX
{
  return self->_minX;
}

- (void)setMinX:(float)a3
{
  self->_minX = a3;
}

- (float)maxX
{
  return self->_maxX;
}

- (void)setMaxX:(float)a3
{
  self->_maxX = a3;
}

- (float)minY
{
  return self->_minY;
}

- (void)setMinY:(float)a3
{
  self->_minY = a3;
}

- (float)maxY
{
  return self->_maxY;
}

- (void)setMaxY:(float)a3
{
  self->_maxY = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (float)flag
{
  return self->_flag;
}

- (void)setFlag:(float)a3
{
  self->_flag = a3;
}

- (int)classIndex
{
  return self->_classIndex;
}

- (void)setClassIndex:(int)a3
{
  self->_classIndex = a3;
}

- (int)trackID
{
  return self->_trackID;
}

- (void)setTrackID:(int)a3
{
  self->_trackID = a3;
}

- (int)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(int)a3
{
  self->_groupID = a3;
}

@end