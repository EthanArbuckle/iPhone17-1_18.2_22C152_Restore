@interface MPMutablePropertySet
- (MPMutablePropertySet)init;
- (MPMutablePropertySet)initWithProperties:(id)a3 relationships:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addProperty:(id)a3;
- (void)addRelationship:(id)a3 properties:(id)a4;
- (void)removeProperty:(id)a3;
- (void)removeRelationship:(id)a3;
@end

@implementation MPMutablePropertySet

- (void)removeRelationship:(id)a3
{
}

- (void)addRelationship:(id)a3 properties:(id)a4
{
  v6 = self->super._relationships;
  id v7 = a3;
  id v8 = (id)[a4 copy];
  [(NSDictionary *)v6 setObject:v8 forKeyedSubscript:v7];
}

- (void)removeProperty:(id)a3
{
}

- (void)addProperty:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MPPropertySet alloc];
  v5 = [(NSSet *)self->super._properties allObjects];
  v6 = [(MPPropertySet *)v4 initWithProperties:v5 relationships:self->super._relationships];

  return v6;
}

- (MPMutablePropertySet)initWithProperties:(id)a3 relationships:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)MPMutablePropertySet;
  v4 = [(MPPropertySet *)&v11 initWithProperties:a3 relationships:a4];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(NSSet *)v4->super._properties mutableCopy];
    properties = v5->super._properties;
    v5->super._properties = (NSSet *)v6;

    uint64_t v8 = [(NSDictionary *)v5->super._relationships mutableCopy];
    relationships = v5->super._relationships;
    v5->super._relationships = (NSDictionary *)v8;
  }
  return v5;
}

- (MPMutablePropertySet)init
{
  return [(MPMutablePropertySet *)self initWithProperties:0 relationships:0];
}

@end