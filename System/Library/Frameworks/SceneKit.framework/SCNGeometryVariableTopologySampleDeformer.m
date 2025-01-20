@interface SCNGeometryVariableTopologySampleDeformer
+ (BOOL)supportsSecureCoding;
- (BOOL)deformedMeshReliesOnTransforms;
- (SCNGeometryVariableTopologySampleDeformer)init;
- (SCNGeometryVariableTopologySampleDeformer)initWithCoder:(id)a3;
- (id)newDeformerInstanceForNode:(id)a3 outputs:(unint64_t)a4 computeVertexCount:(unint64_t)a5 context:(id)a6;
- (unint64_t)requiredInputs;
- (unint64_t)requiredOutputs;
- (unint64_t)supportedOutputs;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCNGeometryVariableTopologySampleDeformer

- (SCNGeometryVariableTopologySampleDeformer)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNGeometryVariableTopologySampleDeformer;
  return [(SCNGeometryVariableTopologySampleDeformer *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SCNGeometryVariableTopologySampleDeformer;
  [(SCNGeometryVariableTopologySampleDeformer *)&v2 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SCNGeometryVariableTopologySampleDeformer;
  [(SCNGeometryDeformer *)&v3 encodeWithCoder:a3];
}

- (SCNGeometryVariableTopologySampleDeformer)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNGeometryVariableTopologySampleDeformer;
  return [(SCNGeometryDeformer *)&v4 initWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)requiredInputs
{
  return 1;
}

- (unint64_t)supportedOutputs
{
  return 1;
}

- (unint64_t)requiredOutputs
{
  return 513;
}

- (BOOL)deformedMeshReliesOnTransforms
{
  return 1;
}

- (id)newDeformerInstanceForNode:(id)a3 outputs:(unint64_t)a4 computeVertexCount:(unint64_t)a5 context:(id)a6
{
  v8 = [SCNGeometryVariableTopologySampleDeformerInstance alloc];

  return -[SCNGeometryVariableTopologySampleDeformerInstance initWithNode:deformer:outputs:computeVertexCount:context:](v8, a3, v9, v10, v11, a6);
}

@end