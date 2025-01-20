@interface GDGraphSoftwareRelationship
- (GDGraphEntityIdentifier)softwareId;
- (GDGraphSoftwareRelationship)initWithSoftwareIdField:(id)a3 allSoftwareIdField:(id)a4;
- (NSArray)allSoftwareId;
@end

@implementation GDGraphSoftwareRelationship

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allSoftwareId, 0);

  objc_storeStrong((id *)&self->_softwareId, 0);
}

- (NSArray)allSoftwareId
{
  return self->_allSoftwareId;
}

- (GDGraphEntityIdentifier)softwareId
{
  return self->_softwareId;
}

- (GDGraphSoftwareRelationship)initWithSoftwareIdField:(id)a3 allSoftwareIdField:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GDGraphSoftwareRelationship;
  v9 = [(GDGraphSoftwareRelationship *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_softwareId, a3);
    objc_storeStrong((id *)&v10->_allSoftwareId, a4);
  }

  return v10;
}

@end