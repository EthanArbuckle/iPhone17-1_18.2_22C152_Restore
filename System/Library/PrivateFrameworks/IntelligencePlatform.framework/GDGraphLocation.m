@interface GDGraphLocation
- (GDGraphLocation)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 locationLabelField:(id)a5 latLongField:(id)a6 addressField:(id)a7 identifiersField:(id)a8 muidField:(id)a9 allNameField:(id)a10 allLocationLabelField:(id)a11 allLatLongField:(id)a12 allAddressField:(id)a13 allMuidField:(id)a14;
- (GDGraphLocationAddressRelationship)address;
- (GDGraphLocationEntityIdentifier)entityIdentifier;
- (GDGraphLocationLatLongRelationship)latLong;
- (NSArray)allAddress;
- (NSArray)allLatLong;
- (NSArray)allLocationLabel;
- (NSArray)allMuid;
- (NSArray)allName;
- (NSArray)identifiers;
- (NSString)locationLabel;
- (NSString)muid;
- (NSString)name;
@end

@implementation GDGraphLocation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allMuid, 0);
  objc_storeStrong((id *)&self->_allAddress, 0);
  objc_storeStrong((id *)&self->_allLatLong, 0);
  objc_storeStrong((id *)&self->_allLocationLabel, 0);
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_muid, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_latLong, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (NSArray)allMuid
{
  return self->_allMuid;
}

- (NSArray)allAddress
{
  return self->_allAddress;
}

- (NSArray)allLatLong
{
  return self->_allLatLong;
}

- (NSArray)allLocationLabel
{
  return self->_allLocationLabel;
}

- (NSArray)allName
{
  return self->_allName;
}

- (NSString)muid
{
  return self->_muid;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (GDGraphLocationAddressRelationship)address
{
  return self->_address;
}

- (GDGraphLocationLatLongRelationship)latLong
{
  return self->_latLong;
}

- (NSString)locationLabel
{
  return self->_locationLabel;
}

- (NSString)name
{
  return self->_name;
}

- (GDGraphLocationEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (GDGraphLocation)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 locationLabelField:(id)a5 latLongField:(id)a6 addressField:(id)a7 identifiersField:(id)a8 muidField:(id)a9 allNameField:(id)a10 allLocationLabelField:(id)a11 allLatLongField:(id)a12 allAddressField:(id)a13 allMuidField:(id)a14
{
  id v38 = a3;
  id v28 = a4;
  id v37 = a4;
  id v36 = a5;
  id v35 = a6;
  id v29 = a7;
  id v34 = a7;
  id v30 = a8;
  id v33 = a8;
  id v32 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = a14;
  v39.receiver = self;
  v39.super_class = (Class)GDGraphLocation;
  v24 = [(GDGraphLocation *)&v39 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_entityIdentifier, a3);
    objc_storeStrong((id *)&v25->_name, v28);
    objc_storeStrong((id *)&v25->_locationLabel, a5);
    objc_storeStrong((id *)&v25->_latLong, a6);
    objc_storeStrong((id *)&v25->_address, v29);
    objc_storeStrong((id *)&v25->_identifiers, v30);
    objc_storeStrong((id *)&v25->_muid, a9);
    objc_storeStrong((id *)&v25->_allName, a10);
    objc_storeStrong((id *)&v25->_allLocationLabel, a11);
    objc_storeStrong((id *)&v25->_allLatLong, a12);
    objc_storeStrong((id *)&v25->_allAddress, a13);
    objc_storeStrong((id *)&v25->_allMuid, a14);
  }

  return v25;
}

@end