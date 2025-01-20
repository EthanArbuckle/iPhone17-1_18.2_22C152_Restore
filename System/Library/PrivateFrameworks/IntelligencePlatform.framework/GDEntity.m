@interface GDEntity
- (GDEntity)initWithEntityIdentifier:(id)a3 facts:(id)a4 entityClass:(unint64_t)a5;
- (GDEntityIdentifier)entityIdentifier;
- (NSArray)facts;
- (unint64_t)entityClass;
@end

@implementation GDEntity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facts, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (unint64_t)entityClass
{
  return self->_entityClass;
}

- (NSArray)facts
{
  return self->_facts;
}

- (GDEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (GDEntity)initWithEntityIdentifier:(id)a3 facts:(id)a4 entityClass:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GDEntity;
  v11 = [(GDEntity *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entityIdentifier, a3);
    objc_storeStrong((id *)&v12->_facts, a4);
    v12->_entityClass = a5;
  }

  return v12;
}

@end