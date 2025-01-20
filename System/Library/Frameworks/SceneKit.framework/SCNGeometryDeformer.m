@interface SCNGeometryDeformer
+ (BOOL)supportsSecureCoding;
- (BOOL)_getDeformedMeshBoundingBox:(id *)a3;
- (BOOL)deformedMeshReliesOnFrustum;
- (BOOL)deformedMeshReliesOnTransforms;
- (SCNGeometryDeformer)initWithCoder:(id)a3;
- (id)dependencyNodeAtIndex:(unint64_t)a3;
- (id)meshForDeformedTopology;
- (id)newDeformerInstanceForNode:(id)a3 outputs:(unint64_t)a4 computeVertexCount:(unint64_t)a5 context:(id)a6;
- (unint64_t)requiredInputs;
- (unint64_t)requiredOutputs;
- (unint64_t)supportedOutputs;
- (void)_enumerateDependencyNodesUsingBlock:(id)a3;
@end

@implementation SCNGeometryDeformer

- (SCNGeometryDeformer)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNGeometryDeformer;
  return [(SCNGeometryDeformer *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)requiredInputs
{
  return 0;
}

- (unint64_t)supportedOutputs
{
  return 1;
}

- (unint64_t)requiredOutputs
{
  return 1;
}

- (BOOL)deformedMeshReliesOnTransforms
{
  return 0;
}

- (BOOL)deformedMeshReliesOnFrustum
{
  return 0;
}

- (BOOL)_getDeformedMeshBoundingBox:(id *)a3
{
  return 0;
}

- (id)meshForDeformedTopology
{
  return 0;
}

- (id)dependencyNodeAtIndex:(unint64_t)a3
{
  return 0;
}

- (void)_enumerateDependencyNodesUsingBlock:(id)a3
{
  char v6 = 0;
  unint64_t v5 = [(SCNGeometryDeformer *)self requiredInputs];
  if ((v5 & 0x38) != 0) {
    (*((void (**)(id, void, id, unint64_t, char *))a3 + 2))(a3, 0, [(SCNGeometryDeformer *)self dependencyNodeAtIndex:0], v5, &v6);
  }
  if ((v5 & 0x1C0) != 0) {
    (*((void (**)(id, uint64_t, id, unint64_t, char *))a3 + 2))(a3, 1, [(SCNGeometryDeformer *)self dependencyNodeAtIndex:1], v5, &v6);
  }
}

- (id)newDeformerInstanceForNode:(id)a3 outputs:(unint64_t)a4 computeVertexCount:(unint64_t)a5 context:(id)a6
{
  return 0;
}

@end