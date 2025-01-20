@interface GKGridGraphNode
+ (BOOL)supportsSecureCoding;
+ (GKGridGraphNode)nodeWithGridPosition:(vector_int2)gridPosition;
- (GKGridGraphNode)init;
- (GKGridGraphNode)initWithCoder:(id)a3;
- (GKGridGraphNode)initWithGridPosition:(vector_int2)gridPosition;
- (float)costToNode:(id)a3;
- (float)estimatedCostToNode:(id)a3;
- (vector_int2)gridPosition;
- (void)cGridGraphNode;
- (void)deleteCGraphNode;
- (void)encodeWithCoder:(id)a3;
- (void)makeCGraphNode;
@end

@implementation GKGridGraphNode

- (void)cGridGraphNode
{
  return self->_cGridGraphNode;
}

- (void)makeCGraphNode
{
}

- (void)deleteCGraphNode
{
  v3.receiver = self;
  v3.super_class = (Class)GKGridGraphNode;
  [(GKGraphNode *)&v3 deleteCGraphNode];
  self->_cGridGraphNode = 0;
}

- (GKGridGraphNode)init
{
  return [(GKGridGraphNode *)self initWithGridPosition:0.0];
}

+ (GKGridGraphNode)nodeWithGridPosition:(vector_int2)gridPosition
{
  objc_super v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGridPosition:*(double *)&gridPosition];

  return (GKGridGraphNode *)v3;
}

- (vector_int2)gridPosition
{
  return *(vector_int2 *)((char *)self->_cGridGraphNode + 64);
}

- (GKGridGraphNode)initWithGridPosition:(vector_int2)gridPosition
{
  v5.receiver = self;
  v5.super_class = (Class)GKGridGraphNode;
  result = [(GKGraphNode *)&v5 init];
  if (result) {
    *((vector_int2 *)result->_cGridGraphNode + 8) = gridPosition;
  }
  return result;
}

- (float)estimatedCostToNode:(id)a3
{
  id v4 = a3;
  float v5 = (*(float (**)(void *, uint64_t))(*(void *)self->_cGridGraphNode + 24))(self->_cGridGraphNode, [v4 cGraphNode]);

  return v5;
}

- (float)costToNode:(id)a3
{
  id v4 = a3;
  float v5 = (*(float (**)(void *, uint64_t))(*(void *)self->_cGridGraphNode + 24))(self->_cGridGraphNode, [v4 cGraphNode]);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKGridGraphNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKGridGraphNode;
  float v5 = [(GKGraphNode *)&v8 initWithCoder:v4];
  unsigned int v6 = [v4 decodeIntForKey:@"positionX"];
  *((void *)v5->_cGridGraphNode + 8) = __PAIR64__([v4 decodeIntForKey:@"positionY"], v6);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKGridGraphNode;
  [(GKGraphNode *)&v7 encodeWithCoder:v4];
  [(GKGridGraphNode *)self gridPosition];
  [v4 encodeInt:v5 forKey:@"positionX"];
  [(GKGridGraphNode *)self gridPosition];
  [v4 encodeInt:v6 forKey:@"positionY"];
}

@end