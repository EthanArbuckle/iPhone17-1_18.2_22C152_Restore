@interface HMDEntityCodingDescription
- (BOOL)hasConcreteSubentities;
- (NSArray)parentRelationships;
- (NSDictionary)attributesByCodingKey;
- (NSDictionary)concreteSubentitiesByTypeID;
- (NSDictionary)keyAttributesByCodingKey;
- (NSDictionary)relationshipsByCodingKey;
- (NSEntityDescription)entity;
- (NSEntityDescription)refContextEntity;
- (NSString)name;
- (NSString)refContextCodingKey;
- (NSString)refContextKeyPath;
- (NSString)typeID;
- (id)descriptionForAttribute:(id)a3;
- (id)descriptionForRelationship:(id)a3;
@end

@implementation HMDEntityCodingDescription

id __51__HMDEntityCodingDescription_initWithModel_entity___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id result = (id)[a3 isConditional];
  if (result)
  {
    [a3 shortDescription];
    objc_claimAutoreleasedReturnValue();
    uint64_t v5 = _HMFPreconditionFailureWithFormat();
    return -[HMDManagedObjectCodingModel codingKeyForProperty:](v5, v6);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concreteSubentitiesByTypeID, 0);
  objc_storeStrong((id *)&self->_parentRelationships, 0);
  objc_storeStrong((id *)&self->_relationshipCodingKeysByPropertyName, 0);
  objc_storeStrong((id *)&self->_relationshipsByCodingKey, 0);
  objc_storeStrong((id *)&self->_attributeCodingKeysByPropertyName, 0);
  objc_storeStrong((id *)&self->_attributesByCodingKey, 0);
  objc_storeStrong((id *)&self->_keyAttributesByCodingKey, 0);
  objc_storeStrong((id *)&self->_refContextEntity, 0);
  objc_storeStrong((id *)&self->_refContextKeyPath, 0);
  objc_storeStrong((id *)&self->_refContextCodingKey, 0);
  objc_storeStrong((id *)&self->_typeID, 0);
  objc_storeStrong((id *)&self->_entity, 0);
}

- (NSArray)parentRelationships
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (id)descriptionForRelationship:(id)a3
{
  uint64_t v5 = [a3 entity];
  v6 = v5;
  entity = self->_entity;
  if (v5 == entity || [(NSEntityDescription *)v5 isKindOfEntity:self->_entity])
  {

LABEL_4:
    v8 = [a3 name];
    uint64_t v9 = [(NSDictionary *)self->_relationshipCodingKeysByPropertyName objectForKeyedSubscript:v8];
    v10 = (void *)v9;
    if (v9) {
      v11 = (void *)v9;
    }
    else {
      v11 = v8;
    }
    id v12 = v11;

    v13 = [(NSDictionary *)self->_relationshipsByCodingKey objectForKeyedSubscript:v12];
    v14 = v13;
    if (v13)
    {
      v15 = [v13 name];
      if ([v15 isEqualToString:v8]) {
        v16 = v14;
      }
      else {
        v16 = 0;
      }
      id v17 = v16;
    }
    else
    {
      id v17 = 0;
    }

    goto LABEL_16;
  }
  BOOL v18 = [(NSEntityDescription *)entity isKindOfEntity:v6];

  if (v18) {
    goto LABEL_4;
  }
  id v17 = 0;
LABEL_16:
  return v17;
}

- (id)descriptionForAttribute:(id)a3
{
  uint64_t v5 = [a3 entity];
  v6 = v5;
  entity = self->_entity;
  if (v5 == entity || [(NSEntityDescription *)v5 isKindOfEntity:self->_entity])
  {

LABEL_4:
    v8 = [a3 name];
    uint64_t v9 = [(NSDictionary *)self->_attributeCodingKeysByPropertyName objectForKeyedSubscript:v8];
    v10 = (void *)v9;
    if (v9) {
      v11 = (void *)v9;
    }
    else {
      v11 = v8;
    }
    id v12 = v11;

    v13 = [(NSDictionary *)self->_attributesByCodingKey objectForKeyedSubscript:v12];
    v14 = v13;
    if (v13)
    {
      v15 = [v13 name];
      if ([v15 isEqualToString:v8]) {
        v16 = v14;
      }
      else {
        v16 = 0;
      }
      id v17 = v16;
    }
    else
    {
      id v17 = 0;
    }

    goto LABEL_16;
  }
  BOOL v18 = [(NSEntityDescription *)entity isKindOfEntity:v6];

  if (v18) {
    goto LABEL_4;
  }
  id v17 = 0;
LABEL_16:
  return v17;
}

- (NSDictionary)concreteSubentitiesByTypeID
{
  return self->_concreteSubentitiesByTypeID;
}

- (NSDictionary)relationshipsByCodingKey
{
  return self->_relationshipsByCodingKey;
}

- (NSDictionary)attributesByCodingKey
{
  return self->_attributesByCodingKey;
}

- (NSDictionary)keyAttributesByCodingKey
{
  return self->_keyAttributesByCodingKey;
}

- (NSEntityDescription)refContextEntity
{
  return self->_refContextEntity;
}

- (NSString)refContextKeyPath
{
  return self->_refContextKeyPath;
}

- (NSString)refContextCodingKey
{
  return self->_refContextCodingKey;
}

- (BOOL)hasConcreteSubentities
{
  return self->_concreteSubentitiesByTypeID != 0;
}

- (NSString)typeID
{
  return self->_typeID;
}

- (NSString)name
{
  return [(NSEntityDescription *)self->_entity name];
}

- (NSEntityDescription)entity
{
  return self->_entity;
}

@end