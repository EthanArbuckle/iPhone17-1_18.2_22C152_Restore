@interface HMDAccessoryAdvertisement
- (BOOL)isEqual:(id)a3;
- (HMAccessoryCategory)category;
- (HMDAccessoryAdvertisement)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5;
- (NSString)identifier;
- (NSString)name;
- (id)description;
- (int64_t)associationOptions;
- (unint64_t)hash;
- (void)setCategory:(id)a3;
@end

@implementation HMDAccessoryAdvertisement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (HMAccessoryCategory)category
{
  return self->_category;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)associationOptions
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDAccessoryAdvertisement *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      v7 = [(HMDAccessoryAdvertisement *)self identifier];
      v8 = [(HMDAccessoryAdvertisement *)v6 identifier];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(HMDAccessoryAdvertisement *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)setCategory:(id)a3
{
  v4 = [MEMORY[0x263F0E340] cachedInstanceForHMAccessoryCategory:a3];
  category = self->_category;
  self->_category = v4;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = [(HMDAccessoryAdvertisement *)self name];
  v5 = [(HMDAccessoryAdvertisement *)self identifier];
  v6 = [(HMDAccessoryAdvertisement *)self category];
  v7 = [v3 stringWithFormat:@"[ name = %@, identifier = %@, category = %@]", v4, v5, v6];

  return v7;
}

- (HMDAccessoryAdvertisement)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDAccessoryAdvertisement;
  v12 = [(HMDAccessoryAdvertisement *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_name, a4);
    uint64_t v14 = [MEMORY[0x263F0E340] cachedInstanceForHMAccessoryCategory:v11];
    category = v13->_category;
    v13->_category = (HMAccessoryCategory *)v14;
  }
  return v13;
}

@end