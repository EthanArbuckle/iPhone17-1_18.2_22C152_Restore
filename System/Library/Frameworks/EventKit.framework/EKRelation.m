@interface EKRelation
+ (id)relationWithEntityName:(id)a3 toMany:(BOOL)a4 inversePropertyNames:(id)a5;
+ (id)relationWithEntityName:(id)a3 toMany:(BOOL)a4 inversePropertyNames:(id)a5 ownsRelated:(BOOL)a6;
- (BOOL)ownsRelatedObject;
- (BOOL)shouldSetInverseProperty:(id)a3 onObject:(id)a4 forObject:(id)a5;
- (BOOL)toMany;
- (EKRelation)initWithEntityName:(id)a3 toMany:(BOOL)a4 inversePropertyNames:(id)a5 ownsRelated:(BOOL)a6;
- (NSSet)inversePropertyNames;
- (id)description;
- (id)inversePropertyIsApplicable;
- (void)setInversePropertyIsApplicable:(id)a3;
@end

@implementation EKRelation

- (BOOL)toMany
{
  return self->_toMany;
}

- (BOOL)ownsRelatedObject
{
  return self->_ownsRelated;
}

- (void)setInversePropertyIsApplicable:(id)a3
{
}

+ (id)relationWithEntityName:(id)a3 toMany:(BOOL)a4 inversePropertyNames:(id)a5 ownsRelated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = (void *)[objc_alloc((Class)a1) initWithEntityName:v11 toMany:v7 inversePropertyNames:v10 ownsRelated:v6];

  return v12;
}

+ (id)relationWithEntityName:(id)a3 toMany:(BOOL)a4 inversePropertyNames:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithEntityName:v9 toMany:v5 inversePropertyNames:v8 ownsRelated:1];

  return v10;
}

- (EKRelation)initWithEntityName:(id)a3 toMany:(BOOL)a4 inversePropertyNames:(id)a5 ownsRelated:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)EKRelation;
  v12 = [(EKRelation *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    entityName = v12->_entityName;
    v12->_entityName = (NSString *)v13;

    v12->_toMany = a4;
    v12->_ownsRelated = a6;
    uint64_t v15 = [v11 copy];
    inversePropertyNames = v12->_inversePropertyNames;
    v12->_inversePropertyNames = (NSSet *)v15;
  }
  return v12;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p> %@", objc_opt_class(), self, self->_entityName];
}

- (NSSet)inversePropertyNames
{
  return self->_inversePropertyNames;
}

- (BOOL)shouldSetInverseProperty:(id)a3 onObject:(id)a4 forObject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(EKRelation *)self inversePropertyIsApplicable];

  if (v11)
  {
    v12 = [(EKRelation *)self inversePropertyIsApplicable];
    char v13 = ((uint64_t (**)(void, id, id, id))v12)[2](v12, v8, v9, v10);
  }
  else
  {
    char v13 = 1;
  }

  return v13;
}

- (id)inversePropertyIsApplicable
{
  return self->_inversePropertyIsApplicable;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_inversePropertyIsApplicable, 0);
  objc_storeStrong((id *)&self->_inversePropertyNames, 0);

  objc_storeStrong((id *)&self->_entityName, 0);
}

@end