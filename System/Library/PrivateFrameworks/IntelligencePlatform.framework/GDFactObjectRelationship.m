@interface GDFactObjectRelationship
- (GDFactObjectRelationship)initWithSubentity:(id)a3;
- (GDSubentity)subentity;
@end

@implementation GDFactObjectRelationship

- (void).cxx_destruct
{
}

- (GDSubentity)subentity
{
  return self->_subentity;
}

- (GDFactObjectRelationship)initWithSubentity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDFactObjectRelationship;
  v6 = [(GDFactObjectRelationship *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_subentity, a3);
  }

  return v7;
}

@end