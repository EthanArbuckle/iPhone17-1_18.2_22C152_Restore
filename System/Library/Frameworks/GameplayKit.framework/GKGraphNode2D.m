@interface GKGraphNode2D
+ (BOOL)supportsSecureCoding;
+ (GKGraphNode2D)nodeWithPoint:(vector_float2)point;
- (GKGraphNode2D)init;
- (GKGraphNode2D)initWithCoder:(id)a3;
- (GKGraphNode2D)initWithPoint:(vector_float2)point;
- (float)costToNode:(id)a3;
- (float)estimatedCostToNode:(id)a3;
- (id)description;
- (vector_float2)position;
- (void)cGraphNode2D;
- (void)deleteCGraphNode;
- (void)encodeWithCoder:(id)a3;
- (void)makeCGraphNode;
- (void)setPosition:(vector_float2)position;
@end

@implementation GKGraphNode2D

- (void)cGraphNode2D
{
  return self->_cGraphNode2D;
}

- (void)makeCGraphNode
{
}

- (void)setPosition:(vector_float2)position
{
  *((vector_float2 *)self->_cGraphNode2D + 8) = position;
}

- (vector_float2)position
{
  return *(vector_float2 *)((char *)self->_cGraphNode2D + 64);
}

- (void)deleteCGraphNode
{
  v3.receiver = self;
  v3.super_class = (Class)GKGraphNode2D;
  [(GKGraphNode *)&v3 deleteCGraphNode];
  self->_cGraphNode2D = 0;
}

- (GKGraphNode2D)initWithPoint:(vector_float2)point
{
  v7.receiver = self;
  v7.super_class = (Class)GKGraphNode2D;
  v4 = [(GKGraphNode *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(GKGraphNode2D *)v4 setPosition:*(double *)&point];
    *((vector_float2 *)v5->_cGraphNode2D + 8) = point;
  }
  return v5;
}

+ (GKGraphNode2D)nodeWithPoint:(vector_float2)point
{
  objc_super v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPoint:*(double *)&point];

  return (GKGraphNode2D *)v3;
}

- (GKGraphNode2D)init
{
  return [(GKGraphNode2D *)self initWithPoint:0.0];
}

- (float)estimatedCostToNode:(id)a3
{
  id v4 = a3;
  float v5 = (*(float (**)(void *, uint64_t))(*(void *)self->_cGraphNode2D + 24))(self->_cGraphNode2D, [v4 cGraphNode]);

  return v5;
}

- (float)costToNode:(id)a3
{
  id v4 = a3;
  float v5 = (*(float (**)(void *, uint64_t))(*(void *)self->_cGraphNode2D + 24))(self->_cGraphNode2D, [v4 cGraphNode]);

  return v5;
}

- (id)description
{
  objc_super v3 = NSString;
  [(GKGraphNode2D *)self position];
  double v5 = v4;
  [(GKGraphNode2D *)self position];
  return (id)[v3 stringWithFormat:@"GKGraphNode2D: {%.2f, %.2f}", *(void *)&v5, v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKGraphNode2D)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GKGraphNode2D;
  double v5 = [(GKGraphNode *)&v10 initWithCoder:v4];
  [v4 decodeFloatForKey:@"positionX"];
  unsigned int v9 = v6;
  [v4 decodeFloatForKey:@"positionY"];
  [(GKGraphNode2D *)v5 setPosition:COERCE_DOUBLE(__PAIR64__(v7, v9))];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GKGraphNode2D;
  [(GKGraphNode *)&v6 encodeWithCoder:v4];
  [(GKGraphNode2D *)self position];
  objc_msgSend(v4, "encodeFloat:forKey:", @"positionX");
  [(GKGraphNode2D *)self position];
  LODWORD(v5) = HIDWORD(v5);
  [v4 encodeFloat:@"positionY" forKey:v5];
}

@end