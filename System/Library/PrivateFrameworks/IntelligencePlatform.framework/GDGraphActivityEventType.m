@interface GDGraphActivityEventType
- (GDGraphActivityEventType)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 allNameField:(id)a5;
- (GDGraphActivityEventTypeEntityIdentifier)entityIdentifier;
- (NSArray)allName;
- (NSString)name;
@end

@implementation GDGraphActivityEventType

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (NSArray)allName
{
  return self->_allName;
}

- (NSString)name
{
  return self->_name;
}

- (GDGraphActivityEventTypeEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (GDGraphActivityEventType)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 allNameField:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)GDGraphActivityEventType;
  v12 = [(GDGraphActivityEventType *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_entityIdentifier, a3);
    objc_storeStrong((id *)&v13->_name, a4);
    objc_storeStrong((id *)&v13->_allName, a5);
  }

  return v13;
}

@end