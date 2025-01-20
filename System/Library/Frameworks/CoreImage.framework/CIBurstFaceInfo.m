@interface CIBurstFaceInfo
- (CGPoint)hwCenter;
- (CGPoint)swCenter;
- (CGRect)hwFaceRect;
- (CGRect)swFaceRect;
- (CGSize)hwSize;
- (CGSize)swSize;
- (CIBurstFaceInfo)init;
- (float)overlapWithHwRect:(CGRect)a3;
- (float)overlapWithSwRect:(CGRect)a3;
- (int)hwFaceId;
- (int)hwLastFrameSeen;
- (int)swFaceId;
- (int)swLastFrameSeen;
- (void)setHwCenter:(CGPoint)a3;
- (void)setHwFaceId:(int)a3;
- (void)setHwLastFrameSeen:(int)a3;
- (void)setHwSize:(CGSize)a3;
- (void)setSwCenter:(CGPoint)a3;
- (void)setSwFaceId:(int)a3;
- (void)setSwLastFrameSeen:(int)a3;
- (void)setSwSize:(CGSize)a3;
@end

@implementation CIBurstFaceInfo

- (CIBurstFaceInfo)init
{
  v9.receiver = self;
  v9.super_class = (Class)CIBurstFaceInfo;
  v2 = [(CIBurstFaceInfo *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(CIBurstFaceInfo *)v2 setSwFaceId:0xFFFFFFFFLL];
    double v4 = *MEMORY[0x1E4F1DAD8];
    double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    -[CIBurstFaceInfo setSwCenter:](v3, "setSwCenter:", *MEMORY[0x1E4F1DAD8], v5);
    double v6 = *MEMORY[0x1E4F1DB30];
    double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    -[CIBurstFaceInfo setSwSize:](v3, "setSwSize:", *MEMORY[0x1E4F1DB30], v7);
    [(CIBurstFaceInfo *)v3 setSwLastFrameSeen:0xFFFFFFFFLL];
    [(CIBurstFaceInfo *)v3 setHwFaceId:0xFFFFFFFFLL];
    -[CIBurstFaceInfo setHwCenter:](v3, "setHwCenter:", v4, v5);
    -[CIBurstFaceInfo setHwSize:](v3, "setHwSize:", v6, v7);
    [(CIBurstFaceInfo *)v3 setHwLastFrameSeen:0xFFFFFFFFLL];
  }
  return v3;
}

- (CGRect)hwFaceRect
{
  [(CIBurstFaceInfo *)self hwCenter];
  double v4 = v3;
  [(CIBurstFaceInfo *)self hwSize];
  double v6 = v4 - v5 * 0.5;
  [(CIBurstFaceInfo *)self hwCenter];
  double v8 = v7;
  [(CIBurstFaceInfo *)self hwSize];
  double v10 = v8 - v9 * 0.5;
  [(CIBurstFaceInfo *)self hwSize];
  double v12 = v11;
  [(CIBurstFaceInfo *)self hwSize];
  double v14 = v13;
  double v15 = v6;
  double v16 = v10;
  double v17 = v12;
  result.size.height = v14;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)swFaceRect
{
  [(CIBurstFaceInfo *)self swCenter];
  double v4 = v3;
  [(CIBurstFaceInfo *)self swSize];
  double v6 = v4 - v5 * 0.5;
  [(CIBurstFaceInfo *)self swCenter];
  double v8 = v7;
  [(CIBurstFaceInfo *)self swSize];
  double v10 = v8 - v9 * 0.5;
  [(CIBurstFaceInfo *)self swSize];
  double v12 = v11;
  [(CIBurstFaceInfo *)self swSize];
  double v14 = v13;
  double v15 = v6;
  double v16 = v10;
  double v17 = v12;
  result.size.height = v14;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (float)overlapWithHwRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(CIBurstFaceInfo *)self hwFaceId] == -1) {
    return 0.0;
  }
  [(CIBurstFaceInfo *)self hwFaceRect];
  double v8 = v11.size.width;
  double v9 = v11.size.height;
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  CGRect v12 = CGRectIntersection(v11, v13);
  *(float *)&v12.origin.CGFloat y = v12.size.width * v12.size.height / (width * height);
  float result = v12.size.width * v12.size.height / (v8 * v9);
  if (*(float *)&v12.origin.y > result) {
    return v12.size.width * v12.size.height / (width * height);
  }
  return result;
}

- (float)overlapWithSwRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(CIBurstFaceInfo *)self swFaceId] == -1) {
    return 0.0;
  }
  [(CIBurstFaceInfo *)self swFaceRect];
  double v8 = v11.size.width;
  double v9 = v11.size.height;
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  CGRect v12 = CGRectIntersection(v11, v13);
  *(float *)&v12.origin.CGFloat y = v12.size.width * v12.size.height / (width * height);
  float result = v12.size.width * v12.size.height / (v8 * v9);
  if (*(float *)&v12.origin.y > result) {
    return v12.size.width * v12.size.height / (width * height);
  }
  return result;
}

- (int)swFaceId
{
  return self->swFaceId;
}

- (void)setSwFaceId:(int)a3
{
  self->swFaceId = a3;
}

- (CGPoint)swCenter
{
  objc_copyStruct(v4, &self->swCenter, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (void)setSwCenter:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->swCenter, &v3, 16, 1, 0);
}

- (CGSize)swSize
{
  objc_copyStruct(v4, &self->swSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setSwSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->swSize, &v3, 16, 1, 0);
}

- (int)swLastFrameSeen
{
  return self->swLastFrameSeen;
}

- (void)setSwLastFrameSeen:(int)a3
{
  self->swLastFrameSeen = a3;
}

- (int)hwFaceId
{
  return self->hwFaceId;
}

- (void)setHwFaceId:(int)a3
{
  self->hwFaceId = a3;
}

- (CGPoint)hwCenter
{
  objc_copyStruct(v4, &self->hwCenter, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (void)setHwCenter:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->hwCenter, &v3, 16, 1, 0);
}

- (CGSize)hwSize
{
  objc_copyStruct(v4, &self->hwSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setHwSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->hwSize, &v3, 16, 1, 0);
}

- (int)hwLastFrameSeen
{
  return self->hwLastFrameSeen;
}

- (void)setHwLastFrameSeen:(int)a3
{
  self->hwLastFrameSeen = a3;
}

@end