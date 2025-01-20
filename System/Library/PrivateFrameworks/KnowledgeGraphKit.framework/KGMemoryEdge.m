@interface KGMemoryEdge
- (KGMemoryEdge)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 sourceNode:(id)a6 targetNode:(id)a7;
- (KGMemoryNode)sourceNode;
- (KGMemoryNode)targetNode;
- (NSDictionary)properties;
- (NSSet)labels;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)identifier;
- (void)resolveIdentifier:(unint64_t)a3;
- (void)setProperties:(id)a3;
@end

@implementation KGMemoryEdge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_sourceNode, 0);
  objc_storeStrong((id *)&self->_targetNode, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

- (void)setProperties:(id)a3
{
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (KGMemoryNode)sourceNode
{
  return self->_sourceNode;
}

- (KGMemoryNode)targetNode
{
  return self->_targetNode;
}

- (NSSet)labels
{
  return self->_labels;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (NSString)description
{
  v3 = NSString;
  unint64_t identifier = self->_identifier;
  v5 = [(KGMemoryEdge *)self sourceNode];
  uint64_t v6 = [v5 identifier];
  v7 = [(KGMemoryEdge *)self targetNode];
  uint64_t v8 = [v7 identifier];
  v9 = [(KGMemoryEdge *)self labels];
  v10 = [(KGMemoryEdge *)self properties];
  v11 = [v3 stringWithFormat:@"<KGMemoryEdge id:%lu sourceNodeIdentifier:%lu targetNodeIdentifier:%lu label:%@ properties:%@>", identifier, v6, v8, v9, v10];

  return (NSString *)v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[KGMemoryEdge allocWithZone:a3];
  unint64_t identifier = self->_identifier;
  uint64_t v6 = (void *)[(NSSet *)self->_labels copy];
  v7 = (void *)[(NSDictionary *)self->_properties copy];
  uint64_t v8 = [(KGMemoryEdge *)v4 initWithIdentifier:identifier labels:v6 properties:v7 sourceNode:self->_sourceNode targetNode:self->_targetNode];

  return v8;
}

- (void)resolveIdentifier:(unint64_t)a3
{
  self->_unint64_t identifier = a3;
}

- (KGMemoryEdge)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 sourceNode:(id)a6 targetNode:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)KGMemoryEdge;
  v16 = [(KGMemoryEdge *)&v23 init];
  v17 = v16;
  if (v16)
  {
    v16->_unint64_t identifier = a3;
    uint64_t v18 = [v12 copy];
    labels = v17->_labels;
    v17->_labels = (NSSet *)v18;

    objc_storeStrong((id *)&v17->_targetNode, a7);
    objc_storeStrong((id *)&v17->_sourceNode, a6);
    uint64_t v20 = [v13 copy];
    properties = v17->_properties;
    v17->_properties = (NSDictionary *)v20;
  }
  return v17;
}

@end