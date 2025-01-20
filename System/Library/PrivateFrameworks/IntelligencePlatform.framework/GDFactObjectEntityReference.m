@interface GDFactObjectEntityReference
- (GDEntityIdentifier)entityIdentifier;
- (GDFactObjectEntityReference)initWithEntityIdentifier:(id)a3;
@end

@implementation GDFactObjectEntityReference

- (void).cxx_destruct
{
}

- (GDEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (GDFactObjectEntityReference)initWithEntityIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDFactObjectEntityReference;
  v6 = [(GDFactObjectEntityReference *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_entityIdentifier, a3);
  }

  return v7;
}

@end