@interface HKSignedClinicalDataRegistryPublicKeyEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKSignedClinicalDataRegistryPublicKeyEntry)initWithCoder:(id)a3;
- (HKSignedClinicalDataRegistryPublicKeyEntry)initWithKeyID:(id)a3 added:(id)a4 removed:(id)a5 source:(id)a6 jwkData:(id)a7;
- (NSData)jwk;
- (NSDate)added;
- (NSDate)removed;
- (NSString)kid;
- (NSString)source;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSignedClinicalDataRegistryPublicKeyEntry

- (HKSignedClinicalDataRegistryPublicKeyEntry)initWithKeyID:(id)a3 added:(id)a4 removed:(id)a5 source:(id)a6 jwkData:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKSignedClinicalDataRegistryPublicKeyEntry;
  v17 = [(HKSignedClinicalDataRegistryPublicKeyEntry *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    kid = v17->_kid;
    v17->_kid = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    added = v17->_added;
    v17->_added = (NSDate *)v20;

    uint64_t v22 = [v14 copy];
    removed = v17->_removed;
    v17->_removed = (NSDate *)v22;

    uint64_t v24 = [v15 copy];
    source = v17->_source;
    v17->_source = (NSString *)v24;

    uint64_t v26 = [v16 copy];
    jwk = v17->_jwk;
    v17->_jwk = (NSData *)v26;
  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HKSignedClinicalDataRegistryPublicKeyEntry *)a3;
  v6 = v5;
  if (self != v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v14 = 0;
LABEL_53:

      goto LABEL_54;
    }
    kid = self->_kid;
    v9 = [(HKSignedClinicalDataRegistryPublicKeyEntry *)v7 kid];
    if (kid != v9)
    {
      uint64_t v10 = [(HKSignedClinicalDataRegistryPublicKeyEntry *)v7 kid];
      if (!v10)
      {
        char v14 = 0;
        goto LABEL_52;
      }
      v11 = (void *)v10;
      id v12 = self->_kid;
      id v13 = [(HKSignedClinicalDataRegistryPublicKeyEntry *)v7 kid];
      if (![(NSString *)v12 isEqualToString:v13])
      {
        char v14 = 0;
LABEL_51:

        goto LABEL_52;
      }
      v58 = v11;
      v57 = v13;
    }
    added = self->_added;
    id v16 = [(HKSignedClinicalDataRegistryPublicKeyEntry *)v7 added];
    if (added != v16)
    {
      uint64_t v17 = [(HKSignedClinicalDataRegistryPublicKeyEntry *)v7 added];
      if (!v17)
      {
LABEL_32:

LABEL_33:
        char v14 = 0;
        goto LABEL_50;
      }
      v56 = (void *)v17;
      uint64_t v18 = self->_added;
      v3 = [(HKSignedClinicalDataRegistryPublicKeyEntry *)v7 added];
      if (([(NSDate *)v18 isEqual:v3] & 1) == 0)
      {
LABEL_31:

        goto LABEL_32;
      }
    }
    removed = self->_removed;
    uint64_t v20 = [(HKSignedClinicalDataRegistryPublicKeyEntry *)v7 removed];
    v55 = removed;
    if (removed == v20)
    {
      v54 = added;
      v27 = v16;
    }
    else
    {
      uint64_t v21 = [(HKSignedClinicalDataRegistryPublicKeyEntry *)v7 removed];
      if (!v21)
      {
        v53 = v3;
        char v14 = 0;
        goto LABEL_47;
      }
      v52 = (void *)v21;
      v54 = added;
      uint64_t v22 = v20;
      v23 = self->_removed;
      uint64_t v24 = [(HKSignedClinicalDataRegistryPublicKeyEntry *)v7 removed];
      v25 = v23;
      uint64_t v26 = (void *)v24;
      if (([(NSDate *)v25 isEqual:v24] & 1) == 0)
      {

        if (added == v16)
        {

          goto LABEL_33;
        }
        goto LABEL_31;
      }
      v27 = v16;
      v48 = v26;
      uint64_t v20 = v22;
    }
    source = self->_source;
    uint64_t v29 = [(HKSignedClinicalDataRegistryPublicKeyEntry *)v7 source];
    v30 = (void *)v29;
    v51 = source;
    v53 = v3;
    if (source == (NSString *)v29)
    {
      v49 = (NSString *)v29;
      v50 = v20;
      id v16 = v27;
    }
    else
    {
      uint64_t v31 = [(HKSignedClinicalDataRegistryPublicKeyEntry *)v7 source];
      if (!v31)
      {
        char v14 = 0;
        id v16 = v27;
        added = v54;
        v43 = v55;
        goto LABEL_37;
      }
      v47 = (void *)v31;
      v50 = v20;
      v32 = self->_source;
      uint64_t v33 = [(HKSignedClinicalDataRegistryPublicKeyEntry *)v7 source];
      v34 = v32;
      v35 = (void *)v33;
      id v16 = v27;
      if (![(NSString *)v34 isEqualToString:v33])
      {

        char v14 = 0;
        uint64_t v20 = v50;
        added = v54;
        v44 = v55;
        goto LABEL_45;
      }
      v46 = v35;
      v49 = (NSString *)v30;
    }
    jwk = self->_jwk;
    uint64_t v37 = [(HKSignedClinicalDataRegistryPublicKeyEntry *)v7 jwk];
    char v14 = jwk == (NSData *)v37;
    if (jwk == (NSData *)v37)
    {

      v30 = v49;
      added = v54;
      if (v51 == v49) {
        goto LABEL_41;
      }
    }
    else
    {
      v38 = (void *)v37;
      uint64_t v39 = [(HKSignedClinicalDataRegistryPublicKeyEntry *)v7 jwk];
      added = v54;
      if (v39)
      {
        v40 = (void *)v39;
        v41 = self->_jwk;
        v42 = [(HKSignedClinicalDataRegistryPublicKeyEntry *)v7 jwk];
        char v14 = [(NSData *)v41 isEqual:v42];

        if (v51 == v49)
        {
        }
        else
        {
        }
        goto LABEL_44;
      }

      v30 = v49;
      if (v51 == v49)
      {
LABEL_41:

LABEL_44:
        uint64_t v20 = v50;
        v44 = v55;
LABEL_45:
        if (v44 != v20)
        {
LABEL_46:
        }
LABEL_47:

        if (added != v16)
        {
        }
LABEL_50:
        id v13 = v57;
        v11 = v58;
        if (kid != v9) {
          goto LABEL_51;
        }
LABEL_52:

        goto LABEL_53;
      }
    }

    uint64_t v20 = v50;
    v43 = v55;
LABEL_37:

    if (v43 == v20) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
  char v14 = 1;
LABEL_54:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  kid = self->_kid;
  id v5 = a3;
  [v5 encodeObject:kid forKey:@"kid"];
  [v5 encodeObject:self->_added forKey:@"added"];
  [v5 encodeObject:self->_removed forKey:@"removed"];
  [v5 encodeObject:self->_source forKey:@"source"];
  [v5 encodeObject:self->_jwk forKey:@"jwk"];
}

- (HKSignedClinicalDataRegistryPublicKeyEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kid"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"added"];
    if (v6)
    {
      v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"removed"];
      v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];
      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"jwk"];
      self = [(HKSignedClinicalDataRegistryPublicKeyEntry *)self initWithKeyID:v5 added:v6 removed:v7 source:v8 jwkData:v9];

      uint64_t v10 = self;
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      uint64_t v10 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    uint64_t v10 = 0;
  }

  return v10;
}

- (NSString)kid
{
  return self->_kid;
}

- (NSDate)added
{
  return self->_added;
}

- (NSDate)removed
{
  return self->_removed;
}

- (NSString)source
{
  return self->_source;
}

- (NSData)jwk
{
  return self->_jwk;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jwk, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_removed, 0);
  objc_storeStrong((id *)&self->_added, 0);

  objc_storeStrong((id *)&self->_kid, 0);
}

@end