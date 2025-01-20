@interface CNAutocompleteFetchContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid:(id *)a3;
- (BOOL)predictsBasedOnOutgoingInteraction;
- (CNAutocompleteFetchContext)initWithCoder:(id)a3;
- (NSArray)bundleIdentifiers;
- (NSArray)otherAddressesAlreadyChosen;
- (NSArray)relatedContacts;
- (NSDate)date;
- (NSString)domainIdentifier;
- (NSString)locationUUID;
- (NSString)sendingAddress;
- (NSString)sendingAddressAccountIdentifier;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifiers:(id)a3;
- (void)setDate:(id)a3;
- (void)setDomainIdentifier:(id)a3;
- (void)setLocationUUID:(id)a3;
- (void)setOtherAddressesAlreadyChosen:(id)a3;
- (void)setPredictsBasedOnOutgoingInteraction:(BOOL)a3;
- (void)setRelatedContacts:(id)a3;
- (void)setSendingAddress:(id)a3;
- (void)setSendingAddressAccountIdentifier:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CNAutocompleteFetchContext

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CNAutocompleteFetchContext *)self sendingAddress];
  [v4 setSendingAddress:v5];

  v6 = [(CNAutocompleteFetchContext *)self sendingAddressAccountIdentifier];
  [v4 setSendingAddressAccountIdentifier:v6];

  v7 = [(CNAutocompleteFetchContext *)self domainIdentifier];
  [v4 setDomainIdentifier:v7];

  v8 = [(CNAutocompleteFetchContext *)self otherAddressesAlreadyChosen];
  [v4 setOtherAddressesAlreadyChosen:v8];

  v9 = [(CNAutocompleteFetchContext *)self title];
  [v4 setTitle:v9];

  v10 = [(CNAutocompleteFetchContext *)self date];
  [v4 setDate:v10];

  v11 = [(CNAutocompleteFetchContext *)self locationUUID];
  [v4 setLocationUUID:v11];

  v12 = [(CNAutocompleteFetchContext *)self bundleIdentifiers];
  [v4 setBundleIdentifiers:v12];

  objc_msgSend(v4, "setPredictsBasedOnOutgoingInteraction:", -[CNAutocompleteFetchContext predictsBasedOnOutgoingInteraction](self, "predictsBasedOnOutgoingInteraction"));
  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  v4 = [(CNAutocompleteFetchContext *)self sendingAddress];
  id v5 = (id)[v3 appendName:@"sending address" object:v4];

  v6 = [(CNAutocompleteFetchContext *)self sendingAddressAccountIdentifier];
  id v7 = (id)[v3 appendName:@"sending account" object:v6];

  v8 = [(CNAutocompleteFetchContext *)self domainIdentifier];
  id v9 = (id)[v3 appendName:@"domain" object:v8];

  v10 = [(CNAutocompleteFetchContext *)self otherAddressesAlreadyChosen];
  id v11 = (id)[v3 appendName:@"related contacts" object:v10];

  v12 = [(CNAutocompleteFetchContext *)self title];
  id v13 = (id)[v3 appendName:@"title" object:v12];

  v14 = [(CNAutocompleteFetchContext *)self date];
  id v15 = (id)[v3 appendName:@"date" object:v14];

  v16 = [(CNAutocompleteFetchContext *)self locationUUID];
  id v17 = (id)[v3 appendName:@"location" object:v16];

  v18 = [(CNAutocompleteFetchContext *)self bundleIdentifiers];
  v19 = [v18 componentsJoinedByString:@"+"];
  id v20 = (id)[v3 appendName:@"bundleIdentifiers" object:v19];

  id v21 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"predictsBasedOnOutgoingInteraction", -[CNAutocompleteFetchContext predictsBasedOnOutgoingInteraction](self, "predictsBasedOnOutgoingInteraction"));
  v22 = [v3 build];

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !self->_predictsBasedOnOutgoingInteraction == (*((unsigned char *)a3 + 8) != 0))
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      sendingAddress = self->_sendingAddress;
      if (!((unint64_t)sendingAddress | *((void *)a3 + 2))
        || (int v6 = -[NSString isEqual:](sendingAddress, "isEqual:")) != 0)
      {
        sendingAddressAccountIdentifier = self->_sendingAddressAccountIdentifier;
        if (!((unint64_t)sendingAddressAccountIdentifier | *((void *)a3 + 3))
          || (int v6 = -[NSString isEqual:](sendingAddressAccountIdentifier, "isEqual:")) != 0)
        {
          domainIdentifier = self->_domainIdentifier;
          if (!((unint64_t)domainIdentifier | *((void *)a3 + 4))
            || (int v6 = -[NSString isEqual:](domainIdentifier, "isEqual:")) != 0)
          {
            otherAddressesAlreadyChosen = self->_otherAddressesAlreadyChosen;
            if (!((unint64_t)otherAddressesAlreadyChosen | *((void *)a3 + 6))
              || (int v6 = -[NSArray isEqual:](otherAddressesAlreadyChosen, "isEqual:")) != 0)
            {
              title = self->_title;
              if (!((unint64_t)title | *((void *)a3 + 9))
                || (int v6 = -[NSString isEqual:](title, "isEqual:")) != 0)
              {
                date = self->_date;
                if (!((unint64_t)date | *((void *)a3 + 7)) || (int v6 = -[NSDate isEqual:](date, "isEqual:")) != 0)
                {
                  locationUUID = self->_locationUUID;
                  if (!((unint64_t)locationUUID | *((void *)a3 + 8))
                    || (int v6 = -[NSString isEqual:](locationUUID, "isEqual:")) != 0)
                  {
                    bundleIdentifiers = self->_bundleIdentifiers;
                    if (!((unint64_t)bundleIdentifiers | *((void *)a3 + 10))
                      || (int v6 = -[NSArray isEqual:](bundleIdentifiers, "isEqual:")) != 0)
                    {
                      LOBYTE(v6) = 1;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F5A418] objectHash:self->_sendingAddress];
  uint64_t v4 = [MEMORY[0x1E4F5A418] objectHash:self->_sendingAddressAccountIdentifier] - v3 + 32 * v3;
  uint64_t v5 = [MEMORY[0x1E4F5A418] objectHash:self->_domainIdentifier] - v4 + 32 * v4;
  uint64_t v6 = [MEMORY[0x1E4F5A418] objectHash:self->_otherAddressesAlreadyChosen] - v5 + 32 * v5;
  uint64_t v7 = [MEMORY[0x1E4F5A418] objectHash:self->_title] - v6 + 32 * v6;
  uint64_t v8 = [MEMORY[0x1E4F5A418] objectHash:self->_date] - v7 + 32 * v7;
  uint64_t v9 = [MEMORY[0x1E4F5A418] objectHash:self->_locationUUID] - v8 + 32 * v8;
  uint64_t v10 = [MEMORY[0x1E4F5A418] objectHash:self->_bundleIdentifiers];
  return self->_predictsBasedOnOutgoingInteraction
       - (v10
        - v9
        + 32 * v9)
       + 32 * (v10 - v9 + 32 * v9)
       + 0x198CB38E0830FLL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNAutocompleteFetchContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CNAutocompleteFetchContext;
  uint64_t v5 = [(CNAutocompleteFetchContext *)&v30 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sendingAddress"];
    sendingAddress = v5->_sendingAddress;
    v5->_sendingAddress = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sendingAddressAccountIdentifier"];
    sendingAddressAccountIdentifier = v5->_sendingAddressAccountIdentifier;
    v5->_sendingAddressAccountIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domainIdentifier"];
    domainIdentifier = v5->_domainIdentifier;
    v5->_domainIdentifier = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"otherAddressesAlreadyChosen"];
    otherAddressesAlreadyChosen = v5->_otherAddressesAlreadyChosen;
    v5->_otherAddressesAlreadyChosen = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationUUID"];
    locationUUID = v5->_locationUUID;
    v5->_locationUUID = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v21;

    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"bundleIdentifiers"];
    bundleIdentifiers = v5->_bundleIdentifiers;
    v5->_bundleIdentifiers = (NSArray *)v26;

    v5->_predictsBasedOnOutgoingInteraction = [v4 decodeBoolForKey:@"predictsBasedOnOutgoingInteraction"];
    v28 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sendingAddress = self->_sendingAddress;
  id v5 = a3;
  [v5 encodeObject:sendingAddress forKey:@"sendingAddress"];
  [v5 encodeObject:self->_sendingAddressAccountIdentifier forKey:@"sendingAddressAccountIdentifier"];
  [v5 encodeObject:self->_domainIdentifier forKey:@"domainIdentifier"];
  [v5 encodeObject:self->_otherAddressesAlreadyChosen forKey:@"otherAddressesAlreadyChosen"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_locationUUID forKey:@"locationUUID"];
  [v5 encodeObject:self->_date forKey:@"date"];
  [v5 encodeObject:self->_bundleIdentifiers forKey:@"bundleIdentifiers"];
  [v5 encodeBool:self->_predictsBasedOnOutgoingInteraction forKey:@"predictsBasedOnOutgoingInteraction"];
}

- (BOOL)isValid:(id *)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(CNAutocompleteFetchContext *)self otherAddressesAlreadyChosen];
  int v5 = objc_msgSend(v4, "_cn_any:", *MEMORY[0x1E4F5A288]);

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28588];
    v12[0] = @"otherAddressesAlreadyChosen contains NSNull";
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v8 = [v6 errorWithDomain:@"CNContactAutocompleteErrorDomain" code:2 userInfo:v7];
    uint64_t v9 = v8;
    if (a3) {
      *a3 = v8;
    }
  }
  return v5 ^ 1;
}

- (NSString)sendingAddress
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSendingAddress:(id)a3
{
}

- (NSString)sendingAddressAccountIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSendingAddressAccountIdentifier:(id)a3
{
}

- (NSString)domainIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDomainIdentifier:(id)a3
{
}

- (NSArray)relatedContacts
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRelatedContacts:(id)a3
{
}

- (NSArray)otherAddressesAlreadyChosen
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOtherAddressesAlreadyChosen:(id)a3
{
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDate:(id)a3
{
}

- (NSString)locationUUID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLocationUUID:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSArray)bundleIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBundleIdentifiers:(id)a3
{
}

- (BOOL)predictsBasedOnOutgoingInteraction
{
  return self->_predictsBasedOnOutgoingInteraction;
}

- (void)setPredictsBasedOnOutgoingInteraction:(BOOL)a3
{
  self->_predictsBasedOnOutgoingInteraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_locationUUID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_otherAddressesAlreadyChosen, 0);
  objc_storeStrong((id *)&self->_relatedContacts, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_sendingAddressAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_sendingAddress, 0);
}

@end