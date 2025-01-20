@interface GKGraphNode3D
+ (BOOL)supportsSecureCoding;
+ (GKGraphNode3D)nodeWithPoint:(vector_float3)point;
- (GKGraphNode3D)init;
- (GKGraphNode3D)initWithCoder:(id)a3;
- (GKGraphNode3D)initWithPoint:(vector_float3)point;
- (float)costToNode:(id)a3;
- (float)estimatedCostToNode:(id)a3;
- (id)description;
- (vector_float3)position;
- (void)cGraphNode3D;
- (void)deleteCGraphNode;
- (void)encodeWithCoder:(id)a3;
- (void)makeCGraphNode;
- (void)setPosition:(vector_float3)position;
@end

@implementation GKGraphNode3D

- (void)cGraphNode3D
{
  return self->_cGraphNode3D;
}

- (void)makeCGraphNode
{
}

- (void)setPosition:(vector_float3)position
{
  *((_OWORD *)self->_cGraphNode3D + 4) = v3;
}

- (vector_float3)position
{
  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (void)deleteCGraphNode
{
  v3.receiver = self;
  v3.super_class = (Class)GKGraphNode3D;
  [(GKGraphNode *)&v3 deleteCGraphNode];
  self->_cGraphNode3D = 0;
}

- (GKGraphNode3D)initWithPoint:(vector_float3)point
{
  long long v7 = v3;
  v8.receiver = self;
  v8.super_class = (Class)GKGraphNode3D;
  v4 = [(GKGraphNode *)&v8 init];
  v5 = v4;
  if (v4)
  {
    [(GKGraphNode3D *)v4 setPosition:*(double *)&v7];
    *((_OWORD *)v5->_cGraphNode3D + 4) = v7;
  }
  return v5;
}

+ (GKGraphNode3D)nodeWithPoint:(vector_float3)point
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPoint:v3];

  return (GKGraphNode3D *)v4;
}

- (GKGraphNode3D)init
{
  return [(GKGraphNode3D *)self initWithPoint:0.0];
}

- (float)estimatedCostToNode:(id)a3
{
  id v4 = a3;
  float v5 = (*(float (**)(void *, uint64_t))(*(void *)self->_cGraphNode3D + 24))(self->_cGraphNode3D, [v4 cGraphNode]);

  return v5;
}

- (float)costToNode:(id)a3
{
  id v4 = a3;
  float v5 = (*(float (**)(void *, uint64_t))(*(void *)self->_cGraphNode3D + 24))(self->_cGraphNode3D, [v4 cGraphNode]);

  return v5;
}

- (id)description
{
  double v3 = NSString;
  [(GKGraphNode3D *)self position];
  double v5 = v4;
  [(GKGraphNode3D *)self position];
  return (id)[v3 stringWithFormat:@"GKGraphNode2D: {%.2f, %.2f}", *(void *)&v5, v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKGraphNode3D)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKGraphNode3D;
  double v5 = [(GKGraphNode *)&v11 initWithCoder:v4];
  [v4 decodeFloatForKey:@"positionX"];
  unsigned int v10 = v6;
  [v4 decodeFloatForKey:@"positionY"];
  unsigned int v9 = v7;
  [v4 decodeFloatForKey:@"positionZ"];
  [(GKGraphNode3D *)v5 setPosition:COERCE_DOUBLE(__PAIR64__(v9, v10))];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKGraphNode3D;
  [(GKGraphNode *)&v8 encodeWithCoder:v4];
  [(GKGraphNode3D *)self position];
  objc_msgSend(v4, "encodeFloat:forKey:", @"positionX");
  [(GKGraphNode3D *)self position];
  LODWORD(v5) = HIDWORD(v5);
  [v4 encodeFloat:@"positionY" forKey:v5];
  [(GKGraphNode3D *)self position];
  LODWORD(v7) = v6;
  [v4 encodeFloat:@"positionZ" forKey:v7];
}

@end