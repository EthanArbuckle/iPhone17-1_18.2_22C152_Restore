@interface IDSPhoneUser
+ (BOOL)supportsSecureCoding;
- (BOOL)differsFromPhoneNumber:(id)a3;
- (BOOL)isDefaultUser;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPhoneUser:(id)a3;
- (BOOL)isIdenticalToUser:(id)a3;
- (BOOL)shouldReplace:(id)a3;
- (IDSPhoneUser)initWithCoder:(id)a3;
- (IDSPhoneUser)initWithLabelID:(id)a3;
- (IDSPhoneUser)initWithLabelID:(id)a3 phoneBookNumber:(id)a4;
- (IDSPhoneUser)initWithLabelID:(id)a3 phoneBookNumber:(id)a4 isDefaultUser:(BOOL)a5 countryCode:(id)a6 networkCode:(id)a7;
- (IDSPhoneUser)phoneUserWithUpdatedDefaultUser:(BOOL)a3 countryCode:(id)a4 networkCode:(id)a5;
- (IDSPhoneUser)phoneUserWithUpdatedPhoneNumber:(id)a3;
- (IDSPhoneUser)phoneUserWithUpdatedPhoneNumber:(id)a3 phoneBookNumber:(id)a4;
- (NSString)countryCode;
- (NSString)description;
- (NSString)labelID;
- (NSString)networkCode;
- (NSString)phoneBookNumber;
- (NSString)phoneNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)realmPrefixedIdentifier;
- (id)unprefixedIdentifier;
- (int64_t)realm;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setIsDefaultUser:(BOOL)a3;
- (void)setNetworkCode:(id)a3;
- (void)setPhoneBookNumber:(id)a3;
- (void)setPhoneNumber:(id)a3;
@end

@implementation IDSPhoneUser

- (IDSPhoneUser)initWithLabelID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSPhoneUser;
  v6 = [(IDSPhoneUser *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_labelID, a3);
  }

  return v7;
}

- (IDSPhoneUser)initWithLabelID:(id)a3 phoneBookNumber:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSPhoneUser;
  objc_super v9 = [(IDSPhoneUser *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_labelID, a3);
    objc_storeStrong((id *)&v10->_phoneBookNumber, a4);
  }

  return v10;
}

- (IDSPhoneUser)initWithLabelID:(id)a3 phoneBookNumber:(id)a4 isDefaultUser:(BOOL)a5 countryCode:(id)a6 networkCode:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)IDSPhoneUser;
  v17 = [(IDSPhoneUser *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_labelID, a3);
    objc_storeStrong((id *)&v18->_phoneBookNumber, a4);
    v18->_isDefaultUser = a5;
    objc_storeStrong((id *)&v18->_countryCode, a6);
    objc_storeStrong((id *)&v18->_networkCode, a7);
  }

  return v18;
}

- (IDSPhoneUser)phoneUserWithUpdatedPhoneNumber:(id)a3 phoneBookNumber:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IDSPhoneUser *)self copy];
  [v8 setPhoneNumber:v7];

  [v8 setPhoneBookNumber:v6];

  return (IDSPhoneUser *)v8;
}

- (IDSPhoneUser)phoneUserWithUpdatedPhoneNumber:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSPhoneUser *)self copy];
  [v5 setPhoneNumber:v4];

  return (IDSPhoneUser *)v5;
}

- (IDSPhoneUser)phoneUserWithUpdatedDefaultUser:(BOOL)a3 countryCode:(id)a4 networkCode:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(IDSPhoneUser *)self copy];
  [v10 setIsDefaultUser:v6];
  [v10 setCountryCode:v9];

  [v10 setNetworkCode:v8];

  return (IDSPhoneUser *)v10;
}

- (int64_t)realm
{
  return 0;
}

- (id)realmPrefixedIdentifier
{
  v3 = [(IDSPhoneUser *)self unprefixedIdentifier];

  if (v3)
  {
    id v4 = [(IDSPhoneUser *)self unprefixedIdentifier];
    id v5 = IMFormatPhoneNumber();
    BOOL v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [(IDSPhoneUser *)self unprefixedIdentifier];
    }
    id v8 = v7;

    v3 = +[NSString stringWithFormat:@"%@%@", @"P:", v8];
  }

  return v3;
}

- (id)unprefixedIdentifier
{
  v3 = [(IDSPhoneUser *)self phoneNumber];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(IDSPhoneUser *)self phoneBookNumber];
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)shouldReplace:(id)a3
{
  id v4 = a3;
  if ([v4 realm] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v6 = 0;
  }
  else
  {
    id v5 = [v4 phoneNumber];
    if (v5)
    {
      BOOL v6 = 0;
    }
    else
    {
      id v8 = [(IDSPhoneUser *)self phoneNumber];
      BOOL v6 = v8 != 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v2 = [(IDSPhoneUser *)self uniqueIdentifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(IDSPhoneUser *)self isEqualToPhoneUser:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToPhoneUser:(id)a3
{
  id v4 = (IDSPhoneUser *)a3;
  BOOL v5 = v4;
  if (self != v4)
  {
    BOOL v6 = [(IDSPhoneUser *)v4 uniqueIdentifier];
    id v7 = [(IDSPhoneUser *)self uniqueIdentifier];
    if (![v6 isEqualToString:v7])
    {
      unsigned __int8 v12 = 0;
LABEL_16:

      goto LABEL_17;
    }
    id v8 = [(IDSPhoneUser *)v5 phoneNumber];
    id v9 = [(IDSPhoneUser *)self phoneNumber];
    if (v8 == v9)
    {
      [(IDSPhoneUser *)v5 phoneBookNumber];
    }
    else
    {
      id v10 = [(IDSPhoneUser *)v5 phoneNumber];
      v11 = [(IDSPhoneUser *)self phoneNumber];
      if (![v10 isEqualToString:v11])
      {
        unsigned __int8 v12 = 0;
LABEL_14:

LABEL_15:
        goto LABEL_16;
      }
      [(IDSPhoneUser *)v5 phoneBookNumber];
    id v13 = };
    uint64_t v14 = [(IDSPhoneUser *)self phoneBookNumber];
    if (v13 == (void *)v14)
    {

      unsigned __int8 v12 = 1;
    }
    else
    {
      id v15 = (void *)v14;
      id v16 = [(IDSPhoneUser *)v5 phoneBookNumber];
      v17 = [(IDSPhoneUser *)self phoneBookNumber];
      unsigned __int8 v12 = [v16 isEqualToString:v17];
    }
    v11 = v20;
    id v10 = v22;
    if (v8 == v9) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  unsigned __int8 v12 = 1;
LABEL_17:

  return v12;
}

- (BOOL)isIdenticalToUser:(id)a3
{
  id v4 = a3;
  if ([(IDSPhoneUser *)self isEqualToUser:v4])
  {
    id v5 = v4;
    unsigned int v6 = [v5 isDefaultUser];
    if (v6 == [(IDSPhoneUser *)self isDefaultUser])
    {
      id v8 = [v5 countryCode];
      id v9 = [(IDSPhoneUser *)self countryCode];
      if ([v8 isEqualToString:v9])
      {
        id v10 = [v5 networkCode];
        v11 = [(IDSPhoneUser *)self networkCode];
        unsigned __int8 v7 = [v10 isEqualToString:v11];
      }
      else
      {
        unsigned __int8 v7 = 0;
      }
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)differsFromPhoneNumber:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ([v4 hasPrefix:@"+"])
  {
    unsigned int v6 = +[NSCharacterSet characterSetWithCharactersInString:@"+"];
    id v5 = [v4 stringByRemovingCharactersFromSet:v6];
  }
  unsigned __int8 v7 = [(IDSPhoneUser *)self phoneNumber];
  if (v7)
  {
    id v8 = [(IDSPhoneUser *)self phoneNumber];
    unsigned int v9 = +[IDSCTAdapter isPhoneNumber:v8 equivalentToExistingPhoneNumber:v5] ^ 1;
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  id v10 = [(IDSPhoneUser *)self phoneBookNumber];
  if (v10)
  {
    v11 = [(IDSPhoneUser *)self phoneBookNumber];
    unsigned int v12 = +[IDSCTAdapter isPhoneNumber:v11 equivalentToExistingPhoneNumber:v5] ^ 1;
  }
  else
  {
    LOBYTE(v12) = 1;
  }

  return v9 & v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPhoneUser)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"labelID"];
  if (v5)
  {
    unsigned int v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
    unsigned __int8 v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneBookNumber"];
    id v8 = [v4 decodeBoolForKey:@"defaultUser"];
    unsigned int v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkCode"];
    v11 = [(IDSPhoneUser *)self initWithLabelID:v5];
    [(IDSPhoneUser *)v11 setPhoneNumber:v6];
    [(IDSPhoneUser *)v11 setPhoneBookNumber:v7];
    [(IDSPhoneUser *)v11 setIsDefaultUser:v8];
    [(IDSPhoneUser *)v11 setCountryCode:v9];
    [(IDSPhoneUser *)v11 setNetworkCode:v10];

    self = v11;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  labelID = self->_labelID;
  id v5 = a3;
  [v5 encodeObject:labelID forKey:@"labelID"];
  [v5 encodeObject:self->_phoneNumber forKey:@"phoneNumber"];
  [v5 encodeObject:self->_phoneBookNumber forKey:@"phoneBookNumber"];
  [v5 encodeBool:self->_isDefaultUser forKey:@"defaultUser"];
  [v5 encodeObject:self->_countryCode forKey:@"countryCode"];
  [v5 encodeObject:self->_networkCode forKey:@"networkCode"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithLabelID:self->_labelID phoneBookNumber:self->_phoneBookNumber];
  [v4 setPhoneNumber:self->_phoneNumber];
  [v4 setIsDefaultUser:self->_isDefaultUser];
  [v4 setCountryCode:self->_countryCode];
  [v4 setNetworkCode:self->_networkCode];
  return v4;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(IDSPhoneUser *)self uniqueIdentifier];
  id v5 = [(IDSPhoneUser *)self phoneNumber];
  unsigned int v6 = [(IDSPhoneUser *)self phoneBookNumber];
  unsigned int v7 = [(IDSPhoneUser *)self isDefaultUser];
  CFStringRef v8 = @"NO";
  if (v7) {
    CFStringRef v8 = @"YES";
  }
  unsigned int v9 = +[NSString stringWithFormat:@"<%@:%p> uid: %@ pn: %@, pbn: %@, def: %@", v3, self, v4, v5, v6, v8];

  return (NSString *)v9;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)phoneBookNumber
{
  return self->_phoneBookNumber;
}

- (void)setPhoneBookNumber:(id)a3
{
}

- (NSString)labelID
{
  return self->_labelID;
}

- (BOOL)isDefaultUser
{
  return self->_isDefaultUser;
}

- (void)setIsDefaultUser:(BOOL)a3
{
  self->_isDefaultUser = a3;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)networkCode
{
  return self->_networkCode;
}

- (void)setNetworkCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_labelID, 0);
  objc_storeStrong((id *)&self->_phoneBookNumber, 0);

  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end