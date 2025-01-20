@interface HKSignedClinicalDataRegistryIssuerEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKSignedClinicalDataRegistryIssuerEntry)initWithCoder:(id)a3;
- (HKSignedClinicalDataRegistryIssuerEntry)initWithIdentifier:(id)a3 title:(id)a4;
- (NSString)identifier;
- (NSString)title;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSignedClinicalDataRegistryIssuerEntry

- (HKSignedClinicalDataRegistryIssuerEntry)initWithIdentifier:(id)a3 title:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKSignedClinicalDataRegistryIssuerEntry;
  v8 = [(HKSignedClinicalDataRegistryIssuerEntry *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    title = v8->_title;
    v8->_title = (NSString *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (HKSignedClinicalDataRegistryIssuerEntry *)a3;
  id v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v13 = 0;
LABEL_18:

      goto LABEL_19;
    }
    identifier = self->_identifier;
    v10 = [(HKSignedClinicalDataRegistryIssuerEntry *)v8 identifier];
    if (identifier == v10) {
      goto LABEL_9;
    }
    uint64_t v11 = [(HKSignedClinicalDataRegistryIssuerEntry *)v8 identifier];
    if (!v11)
    {
      char v13 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v3 = (void *)v11;
    v12 = self->_identifier;
    v4 = [(HKSignedClinicalDataRegistryIssuerEntry *)v8 identifier];
    if ([(NSString *)v12 isEqualToString:v4])
    {
LABEL_9:
      title = self->_title;
      uint64_t v15 = [(HKSignedClinicalDataRegistryIssuerEntry *)v8 title];
      if (title == (NSString *)v15)
      {

        char v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        uint64_t v17 = [(HKSignedClinicalDataRegistryIssuerEntry *)v8 title];
        if (v17)
        {
          v18 = (void *)v17;
          v19 = self->_title;
          v20 = [(HKSignedClinicalDataRegistryIssuerEntry *)v8 title];
          char v13 = [(NSString *)v19 isEqualToString:v20];
        }
        else
        {

          char v13 = 0;
        }
      }
      if (identifier == v10) {
        goto LABEL_17;
      }
    }
    else
    {
      char v13 = 0;
    }

    goto LABEL_17;
  }
  char v13 = 1;
LABEL_19:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_title forKey:@"title"];
}

- (HKSignedClinicalDataRegistryIssuerEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    if (v6)
    {
      self = [(HKSignedClinicalDataRegistryIssuerEntry *)self initWithIdentifier:v5 title:v6];
      id v7 = self;
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      id v7 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    id v7 = 0;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end