@interface KGSnapshotNode
- (BOOL)isEqual:(id)a3;
- (KGSnapshotNode)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5;
- (NSDictionary)properties;
- (NSSet)labels;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)identifier;
- (void)resolveIdentifier:(unint64_t)a3;
@end

@implementation KGSnapshotNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_labels, 0);
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
  v4 = (KGSnapshotNode *)a3;
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

- (void)resolveIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [KGSnapshotNode alloc];
  unint64_t identifier = self->_identifier;
  labels = self->_labels;
  properties = self->_properties;
  return [(KGSnapshotNode *)v4 initWithIdentifier:identifier labels:labels properties:properties];
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)KGSnapshotNode;
  v3 = [(KGSnapshotNode *)&v6 description];
  v4 = (void *)[v3 mutableCopy];

  [v4 appendFormat:@"[%ld] [%@]", self->_identifier, self->_labels];
  return (NSString *)v4;
}

- (KGSnapshotNode)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)KGSnapshotNode;
  v10 = [(KGSnapshotNode *)&v17 init];
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