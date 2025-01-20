@interface GDGraphLocationRelationship
- (GDGraphEntityIdentifier)locationId;
- (GDGraphLocationRelationship)initWithLabelField:(id)a3 locationIdField:(id)a4 allLabelField:(id)a5 allLocationIdField:(id)a6;
- (NSArray)allLabel;
- (NSArray)allLocationId;
- (NSString)label;
@end

@implementation GDGraphLocationRelationship

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allLocationId, 0);
  objc_storeStrong((id *)&self->_allLabel, 0);
  objc_storeStrong((id *)&self->_locationId, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (NSArray)allLocationId
{
  return self->_allLocationId;
}

- (NSArray)allLabel
{
  return self->_allLabel;
}

- (GDGraphEntityIdentifier)locationId
{
  return self->_locationId;
}

- (NSString)label
{
  return self->_label;
}

- (GDGraphLocationRelationship)initWithLabelField:(id)a3 locationIdField:(id)a4 allLabelField:(id)a5 allLocationIdField:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)GDGraphLocationRelationship;
  v15 = [(GDGraphLocationRelationship *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_label, a3);
    objc_storeStrong((id *)&v16->_locationId, a4);
    objc_storeStrong((id *)&v16->_allLabel, a5);
    objc_storeStrong((id *)&v16->_allLocationId, a6);
  }

  return v16;
}

@end