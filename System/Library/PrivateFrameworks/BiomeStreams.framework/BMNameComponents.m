@interface BMNameComponents
- (BMNameComponents)initWithNamePrefix:(id)a3 givenName:(id)a4 middleName:(id)a5 previousFamilyName:(id)a6 familyName:(id)a7 nameSuffix:(id)a8 nickname:(id)a9;
- (BMNameComponents)initWithProto:(id)a3;
- (BMNameComponents)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)middleName;
- (NSString)namePrefix;
- (NSString)nameSuffix;
- (NSString)nickname;
- (NSString)previousFamilyName;
- (id)encodeAsProto;
- (id)proto;
@end

@implementation BMNameComponents

- (BMNameComponents)initWithNamePrefix:(id)a3 givenName:(id)a4 middleName:(id)a5 previousFamilyName:(id)a6 familyName:(id)a7 nameSuffix:(id)a8 nickname:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)BMNameComponents;
  v18 = [(BMNameComponents *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_namePrefix, a3);
    objc_storeStrong((id *)&v19->_givenName, a4);
    objc_storeStrong((id *)&v19->_middleName, a5);
    objc_storeStrong((id *)&v19->_previousFamilyName, a6);
    objc_storeStrong((id *)&v19->_familyName, a7);
    objc_storeStrong((id *)&v19->_nameSuffix, a8);
    objc_storeStrong((id *)&v19->_nickname, a9);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    namePrefix = self->_namePrefix;
    v7 = [v5 namePrefix];
    if (+[BMEntityRelationshipEventUtilities checkNullableStringEqualityForSource:namePrefix target:v7])
    {
      givenName = self->_givenName;
      v9 = [v5 givenName];
      if (+[BMEntityRelationshipEventUtilities checkNullableStringEqualityForSource:givenName target:v9])
      {
        middleName = self->_middleName;
        v11 = [v5 middleName];
        if (+[BMEntityRelationshipEventUtilities checkNullableStringEqualityForSource:middleName target:v11])
        {
          previousFamilyName = self->_previousFamilyName;
          v13 = [v5 previousFamilyName];
          if (+[BMEntityRelationshipEventUtilities checkNullableStringEqualityForSource:previousFamilyName target:v13])
          {
            familyName = self->_familyName;
            id v21 = [v5 familyName];
            if (+[BMEntityRelationshipEventUtilities checkNullableStringEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableStringEqualityForSource:target:", familyName))
            {
              nameSuffix = self->_nameSuffix;
              id v16 = [v5 nameSuffix];
              if (+[BMEntityRelationshipEventUtilities checkNullableStringEqualityForSource:nameSuffix target:v16])
              {
                nickname = self->_nickname;
                v18 = [v5 nickname];
                BOOL v19 = +[BMEntityRelationshipEventUtilities checkNullableStringEqualityForSource:nickname target:v18];
              }
              else
              {
                BOOL v19 = 0;
              }
            }
            else
            {
              BOOL v19 = 0;
            }
          }
          else
          {
            BOOL v19 = 0;
          }
        }
        else
        {
          BOOL v19 = 0;
        }
      }
      else
      {
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (id)encodeAsProto
{
  v2 = [(BMNameComponents *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMNameComponents)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [v5 namePrefix];
    v7 = [v5 givenName];
    v8 = [v5 middleName];
    v9 = [v5 previousFamilyName];
    v10 = [v5 familyName];
    v11 = [v5 nameSuffix];
    v12 = [v5 nickname];

    self = [(BMNameComponents *)self initWithNamePrefix:v6 givenName:v7 middleName:v8 previousFamilyName:v9 familyName:v10 nameSuffix:v11 nickname:v12];
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BMNameComponents)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBNameComponents alloc] initWithData:v4];

    self = [(BMNameComponents *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(BMNameComponents *)self namePrefix];
  [v3 setNamePrefix:v4];

  id v5 = [(BMNameComponents *)self givenName];
  [v3 setGivenName:v5];

  v6 = [(BMNameComponents *)self middleName];
  [v3 setMiddleName:v6];

  v7 = [(BMNameComponents *)self previousFamilyName];
  [v3 setPreviousFamilyName:v7];

  v8 = [(BMNameComponents *)self familyName];
  [v3 setFamilyName:v8];

  v9 = [(BMNameComponents *)self nameSuffix];
  [v3 setNameSuffix:v9];

  v10 = [(BMNameComponents *)self nickname];
  [v3 setNickname:v10];

  return v3;
}

- (NSString)namePrefix
{
  return self->_namePrefix;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)previousFamilyName
{
  return self->_previousFamilyName;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (NSString)nameSuffix
{
  return self->_nameSuffix;
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_previousFamilyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);

  objc_storeStrong((id *)&self->_namePrefix, 0);
}

@end