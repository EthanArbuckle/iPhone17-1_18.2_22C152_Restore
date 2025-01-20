@interface KGSnapshotEdge
- (BOOL)isEqual:(id)a3;
- (KGNode)sourceNode;
- (KGNode)targetNode;
- (KGSnapshotEdge)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 sourceNode:(id)a6 targetNode:(id)a7;
- (NSDictionary)properties;
- (NSSet)labels;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)identifier;
- (void)resolveIdentifier:(unint64_t)a3;
@end

@implementation KGSnapshotEdge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetNode, 0);
  objc_storeStrong((id *)&self->_sourceNode, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

- (KGNode)targetNode
{
  return self->_targetNode;
}

- (KGNode)sourceNode
{
  return self->_sourceNode;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (NSSet)labels
{
  return self->_labels;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (KGSnapshotEdge *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_identifier == v4->_identifier;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_identifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t identifier = self->_identifier;
  labels = self->_labels;
  properties = self->_properties;
  sourceNode = self->_sourceNode;
  targetNode = self->_targetNode;
  return (id)[v4 initWithIdentifier:identifier labels:labels properties:properties sourceNode:sourceNode targetNode:targetNode];
}

- (void)resolveIdentifier:(unint64_t)a3
{
  self->_unint64_t identifier = a3;
}

- (KGSnapshotEdge)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 sourceNode:(id)a6 targetNode:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)KGSnapshotEdge;
  v16 = [(KGSnapshotEdge *)&v23 init];
  v17 = v16;
  if (v16)
  {
    v16->_unint64_t identifier = a3;
    uint64_t v18 = [v12 copy];
    labels = v17->_labels;
    v17->_labels = (NSSet *)v18;

    uint64_t v20 = [v13 copy];
    properties = v17->_properties;
    v17->_properties = (NSDictionary *)v20;

    objc_storeStrong((id *)&v17->_sourceNode, a6);
    objc_storeStrong((id *)&v17->_targetNode, a7);
  }

  return v17;
}

@end