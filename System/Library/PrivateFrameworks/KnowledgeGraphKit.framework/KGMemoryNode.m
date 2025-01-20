@interface KGMemoryNode
- (KGMemoryNode)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5;
- (NSDictionary)properties;
- (NSSet)labels;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)identifier;
- (void)resolveIdentifier:(unint64_t)a3;
- (void)setProperties:(id)a3;
@end

@implementation KGMemoryNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

- (void)setProperties:(id)a3
{
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

- (NSString)description
{
  v3 = NSString;
  unint64_t identifier = self->_identifier;
  v5 = [(KGMemoryNode *)self labels];
  v6 = [(KGMemoryNode *)self properties];
  v7 = [v3 stringWithFormat:@"<KGMemoryEdge id:%lu label:%@ properties:%@>", identifier, v5, v6];

  return (NSString *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[KGMemoryNode allocWithZone:a3];
  unint64_t identifier = self->_identifier;
  v6 = (void *)[(NSSet *)self->_labels copy];
  v7 = (void *)[(NSDictionary *)self->_properties copy];
  v8 = [(KGMemoryNode *)v4 initWithIdentifier:identifier labels:v6 properties:v7];

  return v8;
}

- (void)resolveIdentifier:(unint64_t)a3
{
  self->_unint64_t identifier = a3;
}

- (KGMemoryNode)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)KGMemoryNode;
  v10 = [(KGMemoryNode *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_unint64_t identifier = a3;
    uint64_t v12 = [v8 copy];
    labels = v11->_labels;
    v11->_labels = (NSSet *)v12;

    uint64_t v14 = [v9 copy];
    properties = v11->_properties;
    v11->_properties = (NSDictionary *)v14;
  }
  return v11;
}

@end