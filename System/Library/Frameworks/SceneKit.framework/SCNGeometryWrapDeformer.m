@interface SCNGeometryWrapDeformer
+ (BOOL)supportsSecureCoding;
- (BOOL)_getDeformedMeshBoundingBox:(id *)a3;
- (SCNGeometryWrapDeformer)initWithCoder:(id)a3;
- (SCNGeometryWrapDeformer)initWithDrivingNode:(id)a3 parameters:(id)a4;
- (SCNGeometryWrapDeformer)initWithInnerLayerNode:(id)a3 outerLayerNode:(id)a4 parameters:(id)a5;
- (SCNNode)drivingNode;
- (id)dependencyNodeAtIndex:(unint64_t)a3;
- (id)newDeformerInstanceForNode:(id)a3 outputs:(unint64_t)a4 computeVertexCount:(unint64_t)a5 context:(id)a6;
- (unint64_t)requiredInputs;
- (unint64_t)supportedOutputs;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)initParametersIfNeededForDeformedNode:(id)a3;
@end

@implementation SCNGeometryWrapDeformer

- (SCNGeometryWrapDeformer)initWithDrivingNode:(id)a3 parameters:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SCNGeometryWrapDeformer;
  v6 = [(SCNGeometryWrapDeformer *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_isLegacySingleLayerDeformer = 1;
    objc_storeWeak((id *)&v6->_legacyDrivingNode, a3);
    v7->_parameters = (SCNGeometryWrapDeformerParameters *)a4;
  }
  return v7;
}

- (SCNGeometryWrapDeformer)initWithInnerLayerNode:(id)a3 outerLayerNode:(id)a4 parameters:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)SCNGeometryWrapDeformer;
  v8 = [(SCNGeometryWrapDeformer *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_innerLayerNode, a3);
    objc_storeWeak((id *)&v9->_outerLayerNode, a4);
    v9->_parameters = (SCNGeometryWrapDeformerParameters *)a5;
  }
  return v9;
}

- (void)initParametersIfNeededForDeformedNode:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->_innerLayerNode);
  id v6 = objc_loadWeak((id *)&self->_outerLayerNode);
  parameters = self->_parameters;
  uint64_t v8 = [Weak nodeRef];
  uint64_t v9 = [v6 nodeRef];
  uint64_t v10 = [a3 nodeRef];

  [(SCNGeometryWrapDeformerParameters *)parameters initParametersIfNeededWithInnerLayerNodeRef:v8 outerLayerNodeRef:v9 deformedNodeRef:v10];
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_innerLayerNode, 0);
  objc_storeWeak((id *)&self->_outerLayerNode, 0);
  objc_storeWeak((id *)&self->_legacyDrivingNode, 0);

  v3.receiver = self;
  v3.super_class = (Class)SCNGeometryWrapDeformer;
  [(SCNGeometryWrapDeformer *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNGeometryWrapDeformer;
  -[SCNGeometryDeformer encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [(SCNGeometryWrapDeformer *)self initParametersIfNeededForDeformedNode:0];
  [a3 encodeObject:self->_parameters forKey:@"parameters"];
}

- (SCNGeometryWrapDeformer)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNGeometryWrapDeformer;
  v4 = -[SCNGeometryDeformer initWithCoder:](&v6, sel_initWithCoder_);
  if (v4) {
    v4->_parameters = (SCNGeometryWrapDeformerParameters *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"parameters"];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCNNode)drivingNode
{
  if (self->_legacyDrivingNode) {
    return (SCNNode *)objc_loadWeak((id *)&self->_legacyDrivingNode);
  }
  else {
    return (SCNNode *)objc_loadWeak((id *)&self->_innerLayerNode);
  }
}

- (unint64_t)requiredInputs
{
  if (self->_isLegacySingleLayerDeformer) {
    return 9;
  }
  else {
    return 73;
  }
}

- (unint64_t)supportedOutputs
{
  return 1;
}

- (BOOL)_getDeformedMeshBoundingBox:(id *)a3
{
  if (self->_isLegacySingleLayerDeformer)
  {
    uint64_t v5 = [objc_loadWeak((id *)&self->_legacyDrivingNode) nodeRef];
    LOBYTE(LocalBoundingBox) = C3DNodeGetLocalBoundingBox(v5, a3);
  }
  else
  {
    id Weak = objc_loadWeak((id *)&self->_innerLayerNode);
    id v8 = objc_loadWeak((id *)&self->_outerLayerNode);
    uint64_t v9 = [Weak nodeRef];
    uint64_t v10 = [v8 nodeRef];
    int LocalBoundingBox = C3DNodeGetLocalBoundingBox(v9, &v23);
    if (LocalBoundingBox)
    {
      LOBYTE(LocalBoundingBox) = C3DNodeGetLocalBoundingBox(v10, v22);
      float32x4_t v12 = (float32x4_t)v22[0];
      float32x4_t v11 = (float32x4_t)v22[1];
    }
    float32x4_t v13 = vsubq_f32(v23, v24);
    v13.i32[3] = 0;
    float32x4_t v14 = vsubq_f32(v12, v11);
    v14.i32[3] = 0;
    float32x4_t v15 = vminnmq_f32(v13, v14);
    float32x4_t v16 = vaddq_f32(v23, v24);
    float32x4_t v17 = vaddq_f32(v12, v11);
    v16.i32[3] = 0;
    v17.i32[3] = 0;
    float32x4_t v18 = vmaxnmq_f32(v16, v17);
    v16.i64[0] = 0x3F0000003F000000;
    v16.i64[1] = 0x3F0000003F000000;
    float32x4_t v19 = vmulq_f32(vaddq_f32(v15, v18), v16);
    v19.i32[3] = 1.0;
    float32x4_t v20 = vmulq_f32(vsubq_f32(v18, v15), v16);
    v20.i32[3] = 0;
    *(float32x4_t *)a3 = v19;
    *((float32x4_t *)a3 + 1) = v20;
  }
  return LocalBoundingBox;
}

- (id)dependencyNodeAtIndex:(unint64_t)a3
{
  if (a3 == 1)
  {
    objc_super v3 = &OBJC_IVAR___SCNGeometryWrapDeformer__outerLayerNode;
    return objc_loadWeak((id *)((char *)&self->super.super.isa + *v3));
  }
  if (!a3)
  {
    if (self->_isLegacySingleLayerDeformer) {
      objc_super v3 = &OBJC_IVAR___SCNGeometryWrapDeformer__legacyDrivingNode;
    }
    else {
      objc_super v3 = &OBJC_IVAR___SCNGeometryWrapDeformer__innerLayerNode;
    }
    return objc_loadWeak((id *)((char *)&self->super.super.isa + *v3));
  }
  return 0;
}

- (id)newDeformerInstanceForNode:(id)a3 outputs:(unint64_t)a4 computeVertexCount:(unint64_t)a5 context:(id)a6
{
  if (self->_isLegacySingleLayerDeformer)
  {
    id Weak = objc_loadWeak((id *)&self->_legacyDrivingNode);
    float32x4_t v11 = [SCNGeometryWrapDeformerInstance alloc];
    return -[SCNGeometryWrapDeformerInstance initWithNode:drivingNode:deformer:outputs:computeVertexCount:context:](v11, a3, Weak, self, v12, a5, a6);
  }
  else
  {
    id v14 = objc_loadWeak((id *)&self->_innerLayerNode);
    id v15 = objc_loadWeak((id *)&self->_outerLayerNode);
    float32x4_t v16 = [SCNGeometryWrapDeformerInstance alloc];
    return -[SCNGeometryWrapDeformerInstance initWithNode:innerLayerNode:outerLayerNode:deformer:outputs:computeVertexCount:context:](v16, a3, v14, v15, self, v17, a5, a6);
  }
}

@end