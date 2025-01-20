@interface GDGraphAgentAffiliationRelationship
- (GDGraphAgentAffiliationRelationship)initWithLabelField:(id)a3 personIdField:(id)a4 allLabelField:(id)a5 allPersonIdField:(id)a6;
- (GDGraphEntityIdentifier)personId;
- (NSArray)allLabel;
- (NSArray)allPersonId;
- (NSString)label;
@end

@implementation GDGraphAgentAffiliationRelationship

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allPersonId, 0);
  objc_storeStrong((id *)&self->_allLabel, 0);
  objc_storeStrong((id *)&self->_personId, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (NSArray)allPersonId
{
  return self->_allPersonId;
}

- (NSArray)allLabel
{
  return self->_allLabel;
}

- (GDGraphEntityIdentifier)personId
{
  return self->_personId;
}

- (NSString)label
{
  return self->_label;
}

- (GDGraphAgentAffiliationRelationship)initWithLabelField:(id)a3 personIdField:(id)a4 allLabelField:(id)a5 allPersonIdField:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)GDGraphAgentAffiliationRelationship;
  v15 = [(GDGraphAgentAffiliationRelationship *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_label, a3);
    objc_storeStrong((id *)&v16->_personId, a4);
    objc_storeStrong((id *)&v16->_allLabel, a5);
    objc_storeStrong((id *)&v16->_allPersonId, a6);
  }

  return v16;
}

@end