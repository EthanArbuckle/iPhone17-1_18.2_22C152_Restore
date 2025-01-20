@interface GDGraphSoftware
- (GDGraphSoftware)initWithEntityIdentifierField:(id)a3 bundleIdField:(id)a4 nameField:(id)a5 allBundleIdField:(id)a6 allNameField:(id)a7;
- (GDGraphSoftwareEntityIdentifier)entityIdentifier;
- (NSArray)allBundleId;
- (NSArray)allName;
- (NSString)bundleId;
- (NSString)name;
@end

@implementation GDGraphSoftware

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_allBundleId, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (NSArray)allName
{
  return self->_allName;
}

- (NSArray)allBundleId
{
  return self->_allBundleId;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (GDGraphSoftwareEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (GDGraphSoftware)initWithEntityIdentifierField:(id)a3 bundleIdField:(id)a4 nameField:(id)a5 allBundleIdField:(id)a6 allNameField:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)GDGraphSoftware;
  v17 = [(GDGraphSoftware *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_entityIdentifier, a3);
    objc_storeStrong((id *)&v18->_bundleId, a4);
    objc_storeStrong((id *)&v18->_name, a5);
    objc_storeStrong((id *)&v18->_allBundleId, a6);
    objc_storeStrong((id *)&v18->_allName, a7);
  }

  return v18;
}

@end