@interface HKSignedClinicalDataIssuer
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKSignedClinicalDataIssuer)init;
- (HKSignedClinicalDataIssuer)initWithCoder:(id)a3;
- (HKSignedClinicalDataIssuer)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 wellKnownURL:(id)a6;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)wellKnownURL;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSignedClinicalDataIssuer

- (HKSignedClinicalDataIssuer)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKSignedClinicalDataIssuer)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 wellKnownURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKSignedClinicalDataIssuer;
  v14 = [(HKSignedClinicalDataIssuer *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    title = v14->_title;
    v14->_title = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    subtitle = v14->_subtitle;
    v14->_subtitle = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    wellKnownURL = v14->_wellKnownURL;
    v14->_wellKnownURL = (NSURL *)v21;
  }
  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_title hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_subtitle hash];
  return v4 ^ v5 ^ [(NSURL *)self->_wellKnownURL hash];
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HKSignedClinicalDataIssuer *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v14 = 0;
LABEL_40:

      goto LABEL_41;
    }
    identifier = self->_identifier;
    id v10 = [(HKSignedClinicalDataIssuer *)v8 identifier];
    if (identifier != v10)
    {
      uint64_t v11 = [(HKSignedClinicalDataIssuer *)v8 identifier];
      if (!v11)
      {
        char v14 = 0;
        goto LABEL_39;
      }
      NSUInteger v3 = (void *)v11;
      id v12 = self->_identifier;
      id v13 = [(HKSignedClinicalDataIssuer *)v8 identifier];
      if (![(NSString *)v12 isEqualToString:v13])
      {
        char v14 = 0;
LABEL_38:

        goto LABEL_39;
      }
      v43 = v13;
    }
    title = self->_title;
    v16 = [(HKSignedClinicalDataIssuer *)v8 title];
    if (title == v16)
    {
      v42 = title;
    }
    else
    {
      uint64_t v17 = [(HKSignedClinicalDataIssuer *)v8 title];
      if (!v17)
      {
        char v14 = 0;
        goto LABEL_36;
      }
      v18 = (void *)v17;
      v42 = title;
      uint64_t v19 = self->_title;
      NSUInteger v4 = [(HKSignedClinicalDataIssuer *)v8 title];
      if (![(NSString *)v19 isEqualToString:v4])
      {

        char v14 = 0;
        goto LABEL_37;
      }
      v38 = v18;
    }
    subtitle = self->_subtitle;
    uint64_t v21 = [(HKSignedClinicalDataIssuer *)v8 subtitle];
    v41 = v4;
    if (subtitle == v21)
    {
      v39 = v3;
      v40 = subtitle;
    }
    else
    {
      uint64_t v22 = [(HKSignedClinicalDataIssuer *)v8 subtitle];
      if (!v22)
      {
        char v14 = 0;
LABEL_33:

LABEL_34:
        if (v42 != v16)
        {
LABEL_35:
        }
LABEL_36:

LABEL_37:
        id v13 = v43;
        if (identifier != v10) {
          goto LABEL_38;
        }
LABEL_39:

        goto LABEL_40;
      }
      v40 = subtitle;
      v37 = (void *)v22;
      v23 = self->_subtitle;
      uint64_t v24 = [(HKSignedClinicalDataIssuer *)v8 subtitle];
      v25 = v23;
      v26 = (void *)v24;
      if (![(NSString *)v25 isEqualToString:v24])
      {

        char v14 = 0;
        goto LABEL_34;
      }
      v35 = v26;
      v39 = v3;
    }
    wellKnownURL = self->_wellKnownURL;
    uint64_t v28 = [(HKSignedClinicalDataIssuer *)v8 wellKnownURL];
    char v14 = wellKnownURL == (NSURL *)v28;
    if (wellKnownURL == (NSURL *)v28)
    {
    }
    else
    {
      v29 = (void *)v28;
      uint64_t v30 = [(HKSignedClinicalDataIssuer *)v8 wellKnownURL];
      if (v30)
      {
        v31 = (void *)v30;
        v32 = self->_wellKnownURL;
        v33 = [(HKSignedClinicalDataIssuer *)v8 wellKnownURL];
        char v14 = [(NSURL *)v32 isEqual:v33];

        if (v40 == v21)
        {

LABEL_44:
          NSUInteger v3 = v39;
          if (v42 == v16) {
            goto LABEL_36;
          }
          goto LABEL_35;
        }

LABEL_42:
        goto LABEL_44;
      }
    }
    if (v40 == v21) {
      goto LABEL_42;
    }

    NSUInteger v3 = v39;
    goto LABEL_33;
  }
  char v14 = 1;
LABEL_41:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"Identifier"];
  [v5 encodeObject:self->_title forKey:@"Title"];
  [v5 encodeObject:self->_subtitle forKey:@"Subtitle"];
  [v5 encodeObject:self->_wellKnownURL forKey:@"WellKnownURL"];
}

- (HKSignedClinicalDataIssuer)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Title"];
    if (v6)
    {
      v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Subtitle"];
      v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WellKnownURL"];
      self = [(HKSignedClinicalDataIssuer *)self initWithIdentifier:v5 title:v6 subtitle:v7 wellKnownURL:v8];

      v9 = self;
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      v9 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v9 = 0;
  }

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSURL)wellKnownURL
{
  return self->_wellKnownURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wellKnownURL, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end