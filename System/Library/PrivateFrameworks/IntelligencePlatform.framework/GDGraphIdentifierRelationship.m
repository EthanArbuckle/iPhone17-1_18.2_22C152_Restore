@interface GDGraphIdentifierRelationship
- (GDGraphIdentifierRelationship)initWithTypeField:(id)a3 idField:(id)a4 hasProfileImageField:(id)a5 allTypeField:(id)a6 allIdField:(id)a7 allHasProfileImageField:(id)a8;
- (NSArray)allHasProfileImage;
- (NSArray)allId;
- (NSArray)allType;
- (NSString)hasProfileImage;
- (NSString)id;
- (NSString)type;
@end

@implementation GDGraphIdentifierRelationship

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allHasProfileImage, 0);
  objc_storeStrong((id *)&self->_allId, 0);
  objc_storeStrong((id *)&self->_allType, 0);
  objc_storeStrong((id *)&self->_hasProfileImage, 0);
  objc_storeStrong((id *)&self->_id, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

- (NSArray)allHasProfileImage
{
  return self->_allHasProfileImage;
}

- (NSArray)allId
{
  return self->_allId;
}

- (NSArray)allType
{
  return self->_allType;
}

- (NSString)hasProfileImage
{
  return self->_hasProfileImage;
}

- (NSString)id
{
  return self->_id;
}

- (NSString)type
{
  return self->_type;
}

- (GDGraphIdentifierRelationship)initWithTypeField:(id)a3 idField:(id)a4 hasProfileImageField:(id)a5 allTypeField:(id)a6 allIdField:(id)a7 allHasProfileImageField:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)GDGraphIdentifierRelationship;
  v18 = [(GDGraphIdentifierRelationship *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_type, a3);
    objc_storeStrong((id *)&v19->_id, a4);
    objc_storeStrong((id *)&v19->_hasProfileImage, a5);
    objc_storeStrong((id *)&v19->_allType, a6);
    objc_storeStrong((id *)&v19->_allId, a7);
    objc_storeStrong((id *)&v19->_allHasProfileImage, a8);
  }

  return v19;
}

@end