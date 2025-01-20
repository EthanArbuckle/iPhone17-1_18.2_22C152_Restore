@interface DMFProfile
+ (BOOL)supportsSecureCoding;
- (BOOL)hasRemovalPasscode;
- (BOOL)isEncrypted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocked;
- (BOOL)isManaged;
- (DMFProfile)initWithCoder:(id)a3;
- (DMFProfile)initWithUUID:(id)a3 type:(unint64_t)a4 identifier:(id)a5 profileVersion:(int64_t)a6 displayName:(id)a7 organization:(id)a8 profileDescription:(id)a9 isManaged:(BOOL)a10 isLocked:(BOOL)a11 hasRemovalPasscode:(BOOL)a12 isEncrypted:(BOOL)a13 signerCertificates:(id)a14 payloads:(id)a15 restrictions:(id)a16;
- (NSArray)payloads;
- (NSArray)signerCertificates;
- (NSDictionary)restrictions;
- (NSString)UUID;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)organization;
- (NSString)profileDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)profileVersion;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFProfile

- (DMFProfile)initWithUUID:(id)a3 type:(unint64_t)a4 identifier:(id)a5 profileVersion:(int64_t)a6 displayName:(id)a7 organization:(id)a8 profileDescription:(id)a9 isManaged:(BOOL)a10 isLocked:(BOOL)a11 hasRemovalPasscode:(BOOL)a12 isEncrypted:(BOOL)a13 signerCertificates:(id)a14 payloads:(id)a15 restrictions:(id)a16
{
  id v39 = a3;
  id v38 = a5;
  id v21 = a7;
  id v37 = a8;
  id v22 = a9;
  id v23 = a14;
  id v24 = a15;
  id v36 = a16;
  v40.receiver = self;
  v40.super_class = (Class)DMFProfile;
  v25 = [(DMFProfile *)&v40 init];
  if (v25)
  {
    uint64_t v26 = [v39 copy];
    UUID = v25->_UUID;
    v25->_UUID = (NSString *)v26;

    v25->_type = a4;
    uint64_t v28 = [v38 copy];
    identifier = v25->_identifier;
    v25->_identifier = (NSString *)v28;

    v25->_profileVersion = a6;
    objc_storeStrong((id *)&v25->_displayName, a7);
    uint64_t v30 = [v37 copy];
    organization = v25->_organization;
    v25->_organization = (NSString *)v30;

    uint64_t v32 = [v22 copy];
    profileDescription = v25->_profileDescription;
    v25->_profileDescription = (NSString *)v32;

    v25->_isManaged = a10;
    v25->_isLocked = a11;
    v25->_hasRemovalPasscode = a12;
    v25->_isEncrypted = a13;
    objc_storeStrong((id *)&v25->_signerCertificates, a14);
    objc_storeStrong((id *)&v25->_payloads, a15);
    objc_storeStrong((id *)&v25->_restrictions, a16);
  }

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v21 = objc_alloc((Class)objc_opt_class());
  v20 = [(DMFProfile *)self UUID];
  unint64_t v19 = [(DMFProfile *)self type];
  v18 = [(DMFProfile *)self identifier];
  int64_t v17 = [(DMFProfile *)self profileVersion];
  v4 = [(DMFProfile *)self displayName];
  v5 = [(DMFProfile *)self organization];
  v6 = [(DMFProfile *)self profileDescription];
  BOOL v7 = [(DMFProfile *)self isManaged];
  BOOL v8 = [(DMFProfile *)self isLocked];
  BOOL v9 = [(DMFProfile *)self hasRemovalPasscode];
  BOOL v10 = [(DMFProfile *)self isEncrypted];
  v11 = [(DMFProfile *)self signerCertificates];
  v12 = [(DMFProfile *)self payloads];
  v13 = [(DMFProfile *)self restrictions];
  BYTE3(v16) = v10;
  BYTE2(v16) = v9;
  BYTE1(v16) = v8;
  LOBYTE(v16) = v7;
  v14 = objc_msgSend(v21, "initWithUUID:type:identifier:profileVersion:displayName:organization:profileDescription:isManaged:isLocked:hasRemovalPasscode:isEncrypted:signerCertificates:payloads:restrictions:", v20, v19, v18, v17, v4, v5, v6, v16, v11, v12, v13);

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)DMFProfile;
  v5 = [(DMFProfile *)&v52 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSString *)v7;

    BOOL v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = [v9 unsignedIntegerValue];

    BOOL v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v11;

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"profileVersion"];
    v5->_profileVersion = [v13 integerValue];

    v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v15;

    int64_t v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"organization"];
    organization = v5->_organization;
    v5->_organization = (NSString *)v18;

    v20 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"profileDescription"];
    profileDescription = v5->_profileDescription;
    v5->_profileDescription = (NSString *)v21;

    id v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isManaged"];
    v5->_isManaged = [v23 BOOLValue];

    id v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isLocked"];
    v5->_isLocked = [v24 BOOLValue];

    v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasRemovalPasscode"];
    v5->_hasRemovalPasscode = [v25 BOOLValue];

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isEncrypted"];
    v5->_isEncrypted = [v26 BOOLValue];

    v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"signerCertificates"];
    signerCertificates = v5->_signerCertificates;
    v5->_signerCertificates = (NSArray *)v30;

    uint64_t v32 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v33 = objc_opt_class();
    v34 = objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"payloads"];
    payloads = v5->_payloads;
    v5->_payloads = (NSArray *)v35;

    v51 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v50 = objc_opt_class();
    uint64_t v49 = objc_opt_class();
    uint64_t v37 = objc_opt_class();
    uint64_t v38 = objc_opt_class();
    uint64_t v39 = objc_opt_class();
    uint64_t v40 = objc_opt_class();
    uint64_t v41 = objc_opt_class();
    uint64_t v42 = objc_opt_class();
    uint64_t v43 = objc_opt_class();
    uint64_t v44 = objc_opt_class();
    v45 = objc_msgSend(v51, "setWithObjects:", v50, v49, v37, v38, v39, v40, v41, v42, v43, v44, objc_opt_class(), 0);
    uint64_t v46 = [v4 decodeObjectOfClasses:v45 forKey:@"restrictions"];
    restrictions = v5->_restrictions;
    v5->_restrictions = (NSDictionary *)v46;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DMFProfile *)self UUID];
  [v4 encodeObject:v5 forKey:@"UUID"];

  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[DMFProfile type](self, "type"));
  [v4 encodeObject:v6 forKey:@"type"];

  uint64_t v7 = [(DMFProfile *)self identifier];
  [v4 encodeObject:v7 forKey:@"identifier"];

  BOOL v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[DMFProfile profileVersion](self, "profileVersion"));
  [v4 encodeObject:v8 forKey:@"profileVersion"];

  BOOL v9 = [(DMFProfile *)self displayName];
  [v4 encodeObject:v9 forKey:@"displayName"];

  BOOL v10 = [(DMFProfile *)self organization];
  [v4 encodeObject:v10 forKey:@"organization"];

  uint64_t v11 = [(DMFProfile *)self profileDescription];
  [v4 encodeObject:v11 forKey:@"profileDescription"];

  v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFProfile isManaged](self, "isManaged"));
  [v4 encodeObject:v12 forKey:@"isManaged"];

  v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFProfile isLocked](self, "isLocked"));
  [v4 encodeObject:v13 forKey:@"isLocked"];

  v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFProfile hasRemovalPasscode](self, "hasRemovalPasscode"));
  [v4 encodeObject:v14 forKey:@"hasRemovalPasscode"];

  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFProfile isEncrypted](self, "isEncrypted"));
  [v4 encodeObject:v15 forKey:@"isEncrypted"];

  uint64_t v16 = [(DMFProfile *)self signerCertificates];
  [v4 encodeObject:v16 forKey:@"signerCertificates"];

  int64_t v17 = [(DMFProfile *)self payloads];
  [v4 encodeObject:v17 forKey:@"payloads"];

  id v18 = [(DMFProfile *)self restrictions];
  [v4 encodeObject:v18 forKey:@"restrictions"];
}

- (unint64_t)hash
{
  v3 = [(DMFProfile *)self UUID];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(DMFProfile *)self type] ^ v4;
  v6 = [(DMFProfile *)self identifier];
  uint64_t v7 = [v6 hash];
  int64_t v8 = v5 ^ v7 ^ [(DMFProfile *)self profileVersion];
  BOOL v9 = [(DMFProfile *)self displayName];
  uint64_t v10 = [v9 hash];
  uint64_t v11 = [(DMFProfile *)self organization];
  uint64_t v12 = v10 ^ [v11 hash];
  v13 = [(DMFProfile *)self profileDescription];
  uint64_t v14 = v8 ^ v12 ^ [v13 hash];
  uint64_t v15 = [(DMFProfile *)self isManaged];
  uint64_t v16 = v15 ^ [(DMFProfile *)self isLocked];
  uint64_t v17 = v14 ^ v16 ^ [(DMFProfile *)self hasRemovalPasscode];
  uint64_t v18 = [(DMFProfile *)self isEncrypted];
  unint64_t v19 = [(DMFProfile *)self signerCertificates];
  uint64_t v20 = v18 ^ [v19 hash];
  uint64_t v21 = [(DMFProfile *)self payloads];
  uint64_t v22 = v20 ^ [v21 hash];
  id v23 = [(DMFProfile *)self restrictions];
  unint64_t v24 = v17 ^ v22 ^ [v23 hash];

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DMFProfile *)a3;
  if (self == v4)
  {
    BOOL v45 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      v6 = [(DMFProfile *)self UUID];
      uint64_t v7 = [(DMFProfile *)v5 UUID];
      unint64_t v8 = v6;
      unint64_t v9 = v7;
      if ((!(v8 | v9) || (int v10 = [(id)v8 isEqual:v9], (id)v9, (id)v8, v10))
        && (unint64_t v11 = [(DMFProfile *)self type], v11 == [(DMFProfile *)v5 type]))
      {
        uint64_t v12 = [(DMFProfile *)self identifier];
        v13 = [(DMFProfile *)v5 identifier];
        unint64_t v14 = v12;
        unint64_t v15 = v13;
        if (v14 | v15
          && (int v16 = [(id)v14 isEqual:v15], (id)v15, (id)v14, !v16))
        {
          BOOL v45 = 0;
        }
        else
        {
          uint64_t v17 = [(DMFProfile *)self displayName];
          uint64_t v18 = [(DMFProfile *)v5 displayName];
          unint64_t v19 = v17;
          unint64_t v61 = v18;
          if (v19 | v61
            && (int v20 = [(id)v19 isEqual:v61], (id)v61, (id)v19, !v20))
          {
            BOOL v45 = 0;
          }
          else
          {
            unint64_t v59 = v19;
            uint64_t v21 = [(DMFProfile *)self organization];
            uint64_t v22 = [(DMFProfile *)v5 organization];
            unint64_t v23 = v21;
            unint64_t v60 = v22;
            if (v23 | v60
              && (int v24 = [(id)v23 isEqual:v60], (id)v60, (id)v23, !v24))
            {
              BOOL v45 = 0;
              unint64_t v19 = v59;
            }
            else
            {
              unint64_t v57 = v23;
              v25 = [(DMFProfile *)self profileDescription];
              uint64_t v26 = [(DMFProfile *)v5 profileDescription];
              unint64_t v27 = v25;
              unint64_t v28 = v26;
              v29 = (void *)v27;
              v58 = (void *)v28;
              if (v27 | v28
                && (int v30 = [(id)v27 isEqual:v28], v58, v29, !v30))
              {
                BOOL v45 = 0;
                unint64_t v19 = v59;
              }
              else
              {
                v55 = v29;
                v31 = [(DMFProfile *)self signerCertificates];
                uint64_t v32 = [(DMFProfile *)v5 signerCertificates];
                unint64_t v33 = v31;
                unint64_t v34 = v32;
                v56 = (void *)v34;
                if (v33 | v34
                  && (uint64_t v35 = (void *)v34,
                      int v36 = [(id)v33 isEqual:v34],
                      v35,
                      (id)v33,
                      !v36))
                {
                  BOOL v45 = 0;
                  unint64_t v19 = v59;
                  v29 = v55;
                }
                else
                {
                  uint64_t v37 = [(DMFProfile *)self payloads];
                  uint64_t v38 = [(DMFProfile *)v5 payloads];
                  unint64_t v39 = v37;
                  unint64_t v53 = v38;
                  v54 = (void *)v39;
                  if (v39 | v53
                    && (int v51 = [(id)v39 isEqual:v53], (id)v53, (id)v39, !v51))
                  {
                    BOOL v45 = 0;
                    unint64_t v19 = v59;
                    v29 = v55;
                  }
                  else
                  {
                    int64_t v40 = [(DMFProfile *)self profileVersion];
                    v29 = v55;
                    if (v40 == [(DMFProfile *)v5 profileVersion]
                      && (BOOL v41 = [(DMFProfile *)self isManaged],
                          v41 == [(DMFProfile *)v5 isManaged])
                      && (BOOL v42 = [(DMFProfile *)self isLocked], v42 == [(DMFProfile *)v5 isLocked])
                      && (BOOL v43 = [(DMFProfile *)self hasRemovalPasscode],
                          v43 == [(DMFProfile *)v5 hasRemovalPasscode])
                      && (BOOL v44 = [(DMFProfile *)self isEncrypted],
                          v44 == [(DMFProfile *)v5 isEncrypted]))
                    {
                      uint64_t v47 = [(DMFProfile *)self restrictions];
                      uint64_t v48 = [(DMFProfile *)v5 restrictions];
                      unint64_t v19 = v59;
                      objc_super v52 = (void *)v47;
                      if (v47 | v48)
                      {
                        uint64_t v50 = v48;
                        char v49 = [(id)v47 isEqual:v48];
                        uint64_t v48 = v50;
                        BOOL v45 = v49;
                      }
                      else
                      {
                        BOOL v45 = 1;
                      }
                    }
                    else
                    {
                      BOOL v45 = 0;
                      unint64_t v19 = v59;
                    }
                  }
                }
              }
              unint64_t v23 = v57;
            }
          }
        }
      }
      else
      {
        BOOL v45 = 0;
      }
    }
    else
    {
      BOOL v45 = 0;
    }
  }

  return v45;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p {\n\tVersion      : %zd", objc_opt_class(), self, -[DMFProfile profileVersion](self, "profileVersion")];
  uint64_t v4 = [(DMFProfile *)self displayName];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [(DMFProfile *)self displayName];
    [v3 appendFormat:@"\n\tDisplay Name : “%@”", v6];
  }
  uint64_t v7 = [(DMFProfile *)self profileDescription];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    unint64_t v9 = [(DMFProfile *)self profileDescription];
    [v3 appendFormat:@"\n\tDescription  : “%@”", v9];
  }
  if ([(DMFProfile *)self type]) {
    int v10 = @"\n\tType         : User";
  }
  else {
    int v10 = @"\n\tType         : System";
  }
  [v3 appendFormat:v10];
  unint64_t v11 = [(DMFProfile *)self identifier];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    v13 = [(DMFProfile *)self identifier];
    [v3 appendFormat:@"\n\tIdentifier   : %@", v13];
  }
  unint64_t v14 = [(DMFProfile *)self UUID];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    int v16 = [(DMFProfile *)self UUID];
    [v3 appendFormat:@"\n\tUUID         : %@", v16];
  }
  uint64_t v17 = [(DMFProfile *)self organization];
  uint64_t v18 = [v17 length];

  if (v18)
  {
    unint64_t v19 = [(DMFProfile *)self organization];
    [v3 appendFormat:@"\n\tOrganization : %@", v19];
  }
  if ([(DMFProfile *)self isLocked]) {
    int v20 = @"YES";
  }
  else {
    int v20 = @"NO";
  }
  [v3 appendFormat:@"\n\tLocked       : %@", v20];
  if ([(DMFProfile *)self hasRemovalPasscode]) {
    [v3 appendFormat:@"\n\tRemoval passcode present"];
  }
  if ([(DMFProfile *)self isEncrypted]) {
    uint64_t v21 = @"YES";
  }
  else {
    uint64_t v21 = @"NO";
  }
  [v3 appendFormat:@"\n\tEncrypted    : %@", v21];
  uint64_t v22 = [(DMFProfile *)self signerCertificates];
  if ([v22 count]) {
    unint64_t v23 = @"YES";
  }
  else {
    unint64_t v23 = @"NO";
  }
  [v3 appendFormat:@"\n\tSigned       : %@", v23];

  int v24 = [(DMFProfile *)self restrictions];
  [v3 appendFormat:@"\n\tRestrictions : %@", v24];

  [v3 appendString:@"\n}>"];
  v25 = (void *)[v3 copy];

  return v25;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)profileVersion
{
  return self->_profileVersion;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)organization
{
  return self->_organization;
}

- (NSString)profileDescription
{
  return self->_profileDescription;
}

- (BOOL)isManaged
{
  return self->_isManaged;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (BOOL)hasRemovalPasscode
{
  return self->_hasRemovalPasscode;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (NSArray)signerCertificates
{
  return self->_signerCertificates;
}

- (NSArray)payloads
{
  return self->_payloads;
}

- (NSDictionary)restrictions
{
  return self->_restrictions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictions, 0);
  objc_storeStrong((id *)&self->_payloads, 0);
  objc_storeStrong((id *)&self->_signerCertificates, 0);
  objc_storeStrong((id *)&self->_profileDescription, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end