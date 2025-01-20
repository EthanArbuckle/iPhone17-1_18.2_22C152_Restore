@interface GDGraphSportsTeam
- (GDGraphSportsTeam)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 identifiersField:(id)a5 qidField:(id)a6 umcIdentifierField:(id)a7 allNameField:(id)a8 allQidField:(id)a9 allUmcIdentifierField:(id)a10;
- (GDGraphSportsTeamEntityIdentifier)entityIdentifier;
- (NSArray)allName;
- (NSArray)allQid;
- (NSArray)allUmcIdentifier;
- (NSArray)identifiers;
- (NSString)name;
- (NSString)qid;
- (NSString)umcIdentifier;
@end

@implementation GDGraphSportsTeam

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allUmcIdentifier, 0);
  objc_storeStrong((id *)&self->_allQid, 0);
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_umcIdentifier, 0);
  objc_storeStrong((id *)&self->_qid, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (NSArray)allUmcIdentifier
{
  return self->_allUmcIdentifier;
}

- (NSArray)allQid
{
  return self->_allQid;
}

- (NSArray)allName
{
  return self->_allName;
}

- (NSString)umcIdentifier
{
  return self->_umcIdentifier;
}

- (NSString)qid
{
  return self->_qid;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (NSString)name
{
  return self->_name;
}

- (GDGraphSportsTeamEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (GDGraphSportsTeam)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 identifiersField:(id)a5 qidField:(id)a6 umcIdentifierField:(id)a7 allNameField:(id)a8 allQidField:(id)a9 allUmcIdentifierField:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)GDGraphSportsTeam;
  v18 = [(GDGraphSportsTeam *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_entityIdentifier, a3);
    objc_storeStrong((id *)&v19->_name, a4);
    objc_storeStrong((id *)&v19->_identifiers, a5);
    objc_storeStrong((id *)&v19->_qid, a6);
    objc_storeStrong((id *)&v19->_umcIdentifier, a7);
    objc_storeStrong((id *)&v19->_allName, a8);
    objc_storeStrong((id *)&v19->_allQid, a9);
    objc_storeStrong((id *)&v19->_allUmcIdentifier, a10);
  }

  return v19;
}

@end