@interface HKClinicalConnectedAccount
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsRelogin;
- (HKClinicalBrand)brand;
- (HKClinicalConnectedAccount)init;
- (HKClinicalConnectedAccount)initWithCoder:(id)a3;
- (HKClinicalConnectedAccount)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 brand:(id)a6 needsRelogin:(BOOL)a7;
- (NSString)subtitle;
- (NSString)title;
- (NSUUID)identifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalConnectedAccount

- (HKClinicalConnectedAccount)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalConnectedAccount)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 brand:(id)a6 needsRelogin:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HKClinicalConnectedAccount;
  v16 = [(HKClinicalConnectedAccount *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    identifier = v16->_identifier;
    v16->_identifier = (NSUUID *)v17;

    uint64_t v19 = [v13 copy];
    title = v16->_title;
    v16->_title = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    subtitle = v16->_subtitle;
    v16->_subtitle = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    brand = v16->_brand;
    v16->_brand = (HKClinicalBrand *)v23;

    v16->_needsRelogin = a7;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HKClinicalConnectedAccount *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v13 = 0;
LABEL_42:

      goto LABEL_43;
    }
    identifier = self->_identifier;
    v10 = [(HKClinicalConnectedAccount *)v8 identifier];
    if (identifier != v10)
    {
      uint64_t v11 = [(HKClinicalConnectedAccount *)v8 identifier];
      if (!v11)
      {
        BOOL v13 = 0;
        goto LABEL_41;
      }
      uint64_t v4 = (void *)v11;
      v3 = self->_identifier;
      id v12 = [(HKClinicalConnectedAccount *)v8 identifier];
      if (![(NSUUID *)v3 isEqual:v12])
      {
        BOOL v13 = 0;
LABEL_40:

        goto LABEL_41;
      }
      v44 = v12;
    }
    title = self->_title;
    id v15 = [(HKClinicalConnectedAccount *)v8 title];
    if (title != v15)
    {
      uint64_t v16 = [(HKClinicalConnectedAccount *)v8 title];
      if (!v16)
      {
        BOOL v13 = 0;
LABEL_38:
        id v12 = v44;
        goto LABEL_39;
      }
      uint64_t v17 = (void *)v16;
      v18 = self->_title;
      uint64_t v19 = [(HKClinicalConnectedAccount *)v8 title];
      v20 = v18;
      v3 = (NSUUID *)v19;
      if (![(NSString *)v20 isEqualToString:v19])
      {

        BOOL v13 = 0;
        goto LABEL_45;
      }
      v40 = v17;
    }
    subtitle = self->_subtitle;
    uint64_t v22 = [(HKClinicalConnectedAccount *)v8 subtitle];
    v43 = subtitle;
    BOOL v23 = subtitle == (NSString *)v22;
    v24 = (NSString *)v22;
    if (v23)
    {
      v41 = v4;
      v42 = v3;
    }
    else
    {
      uint64_t v25 = [(HKClinicalConnectedAccount *)v8 subtitle];
      if (!v25)
      {
        BOOL v13 = 0;
        goto LABEL_33;
      }
      v39 = (void *)v25;
      v42 = v3;
      objc_super v26 = self->_subtitle;
      v38 = [(HKClinicalConnectedAccount *)v8 subtitle];
      if (!-[NSString isEqualToString:](v26, "isEqualToString:"))
      {
        BOOL v13 = 0;
        v3 = v42;
LABEL_36:

        if (title != v15)
        {

          goto LABEL_38;
        }

LABEL_45:
        id v12 = v44;
        if (identifier == v10) {
          goto LABEL_41;
        }
        goto LABEL_40;
      }
      v41 = v4;
    }
    brand = self->_brand;
    v28 = [(HKClinicalConnectedAccount *)v8 brand];
    if (brand != v28)
    {
      uint64_t v29 = [(HKClinicalConnectedAccount *)v8 brand];
      if (!v29)
      {

        BOOL v13 = 0;
        v3 = v42;
        v33 = v43;
LABEL_31:
        uint64_t v4 = v41;
        if (v33 != v24)
        {
        }
        goto LABEL_33;
      }
      v36 = self->_brand;
      v37 = (void *)v29;
      uint64_t v30 = [(HKClinicalConnectedAccount *)v8 brand];
      v31 = v36;
      v35 = (void *)v30;
      if (!-[HKClinicalBrand isEqual:](v31, "isEqual:"))
      {
        BOOL v13 = 0;
LABEL_28:
        v3 = v42;

        v33 = v43;
        goto LABEL_31;
      }
    }
    BOOL needsRelogin = self->_needsRelogin;
    BOOL v13 = needsRelogin == [(HKClinicalConnectedAccount *)v8 needsRelogin];
    if (brand != v28) {
      goto LABEL_28;
    }

    v3 = v42;
    uint64_t v4 = v41;
    if (v43 != v24) {
      goto LABEL_36;
    }
LABEL_33:

    BOOL v23 = title == v15;
    id v12 = v44;
    if (!v23)
    {
    }
LABEL_39:

    if (identifier != v10) {
      goto LABEL_40;
    }
LABEL_41:

    goto LABEL_42;
  }
  BOOL v13 = 1;
LABEL_43:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_title hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_subtitle hash];
  return v4 ^ v5 ^ [(HKClinicalBrand *)self->_brand hash] ^ self->_needsRelogin;
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
  [v5 encodeObject:self->_subtitle forKey:@"subtitle"];
  [v5 encodeObject:self->_brand forKey:@"brand"];
  [v5 encodeBool:self->_needsRelogin forKey:@"needsRelogin"];
}

- (HKClinicalConnectedAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"title"]
    && ([v4 containsValueForKey:@"needsRelogin"] & 1) != 0)
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brand"];
    self = -[HKClinicalConnectedAccount initWithIdentifier:title:subtitle:brand:needsRelogin:](self, "initWithIdentifier:title:subtitle:brand:needsRelogin:", v5, v6, v7, v8, [v4 decodeBoolForKey:@"needsRelogin"]);

    v9 = self;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4865 userInfo:0];
    [v4 failWithError:v5];
    v9 = 0;
  }

  return v9;
}

- (NSUUID)identifier
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

- (HKClinicalBrand)brand
{
  return self->_brand;
}

- (BOOL)needsRelogin
{
  return self->_needsRelogin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end