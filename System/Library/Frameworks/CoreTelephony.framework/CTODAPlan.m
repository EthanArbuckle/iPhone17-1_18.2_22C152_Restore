@interface CTODAPlan
+ (BOOL)supportsSecureCoding;
- (BOOL)inBuddy;
- (BOOL)isEqual:(id)a3;
- (CTODAPlan)initWithCoder:(id)a3;
- (CTODAPlan)initWithSetupUrl:(id)a3 mcc:(id)a4 mnc:(id)a5 gid1:(id)a6 gid2:(id)a7 handoffToken:(id)a8 inBuddy:(BOOL)a9;
- (NSString)gid1;
- (NSString)gid2;
- (NSString)handoffToken;
- (NSString)mcc;
- (NSString)mnc;
- (NSString)setupURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CTODAPlan

- (CTODAPlan)initWithSetupUrl:(id)a3 mcc:(id)a4 mnc:(id)a5 gid1:(id)a6 gid2:(id)a7 handoffToken:(id)a8 inBuddy:(BOOL)a9
{
  id v16 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v17 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)CTODAPlan;
  v19 = [(CTODAPlan *)&v25 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_mcc, a4);
    objc_storeStrong((id *)&v20->_mnc, a5);
    objc_storeStrong((id *)&v20->_gid1, a6);
    objc_storeStrong((id *)&v20->_gid2, a7);
    objc_storeStrong((id *)&v20->_setupURL, a3);
    objc_storeStrong((id *)&v20->_handoffToken, a8);
    v20->_inBuddy = a9;
  }

  return v20;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = v3;
  if (self->_mcc) {
    [v3 appendFormat:@", mcc=%@", self->_mcc];
  }
  if (self->_mnc) {
    [v4 appendFormat:@", mnc=%@", self->_mnc];
  }
  if (self->_gid1) {
    [v4 appendFormat:@", gid1=%@", self->_gid1];
  }
  if (self->_gid2) {
    [v4 appendFormat:@", gid1=%@", self->_gid2];
  }
  if (self->_setupURL) {
    [v4 appendFormat:@", setupURL=%@", self->_setupURL];
  }
  if (self->_handoffToken) {
    [v4 appendFormat:@", handoffToken=%@", self->_handoffToken];
  }
  if (self->_inBuddy) {
    v5 = "YES";
  }
  else {
    v5 = "NO";
  }
  [v4 appendFormat:@", inBuddy=%s", v5];
  [v4 appendString:@">"];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  v47.receiver = self;
  v47.super_class = (Class)CTODAPlan;
  if ([(CTPlan *)&v47 isEqual:v6])
  {
    v7 = [(CTODAPlan *)self mcc];
    v8 = [v6 mcc];
    if (v7 != v8)
    {
      v3 = [(CTODAPlan *)self mcc];
      v4 = [v6 mcc];
      if (![v3 isEqual:v4])
      {
        LOBYTE(v9) = 0;
        goto LABEL_39;
      }
    }
    v10 = [(CTODAPlan *)self mnc];
    v11 = [v6 mnc];
    if (v10 != v11)
    {
      v12 = [(CTODAPlan *)self mnc];
      v13 = [v6 mnc];
      if (![v12 isEqual:v13])
      {
        LOBYTE(v9) = 0;
LABEL_37:

LABEL_38:
        if (v7 == v8)
        {
LABEL_40:

          goto LABEL_41;
        }
LABEL_39:

        goto LABEL_40;
      }
      v43 = v13;
      v44 = v12;
    }
    uint64_t v14 = [(CTODAPlan *)self gid1];
    v45 = [v6 gid1];
    v46 = (void *)v14;
    if ((void *)v14 != v45)
    {
      v15 = [(CTODAPlan *)self gid1];
      v40 = [v6 gid1];
      v41 = v15;
      if (!objc_msgSend(v15, "isEqual:"))
      {
        LOBYTE(v9) = 0;
LABEL_35:

LABEL_36:
        v13 = v43;
        v12 = v44;
        if (v10 == v11) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
    }
    uint64_t v16 = [(CTODAPlan *)self gid2];
    uint64_t v17 = [v6 gid2];
    v42 = (void *)v16;
    v39 = (void *)v17;
    if (v16 != v17)
    {
      id v18 = (void *)v17;
      v19 = [(CTODAPlan *)self gid2];
      v37 = [v6 gid2];
      v38 = v19;
      if (!objc_msgSend(v19, "isEqual:"))
      {
        LOBYTE(v9) = 0;
        v20 = v42;
LABEL_33:

LABEL_34:
        if (v46 == v45) {
          goto LABEL_36;
        }
        goto LABEL_35;
      }
    }
    uint64_t v21 = [(CTODAPlan *)self setupURL];
    uint64_t v36 = [v6 setupURL];
    id v22 = (void *)v21;
    if (v21 == v36)
    {
      v32 = v4;
      v33 = v3;
    }
    else
    {
      id v23 = [(CTODAPlan *)self setupURL];
      v34 = [v6 setupURL];
      v35 = v23;
      if (!objc_msgSend(v23, "isEqual:"))
      {
        LOBYTE(v9) = 0;
        v27 = (void *)v36;
LABEL_31:

LABEL_32:
        v20 = v42;
        id v18 = v39;
        if (v42 == v39) {
          goto LABEL_34;
        }
        goto LABEL_33;
      }
      v32 = v4;
      v33 = v3;
    }
    id v24 = [(CTODAPlan *)self handoffToken];
    objc_super v25 = [v6 handoffToken];
    if (v24 == v25
      || ([(CTODAPlan *)self handoffToken],
          v26 = objc_claimAutoreleasedReturnValue(),
          [v6 handoffToken],
          v30 = objc_claimAutoreleasedReturnValue(),
          v31 = v26,
          objc_msgSend(v26, "isEqual:")))
    {
      BOOL v28 = [(CTODAPlan *)self inBuddy];
      int v9 = v28 ^ [v6 inBuddy] ^ 1;
      if (v24 == v25)
      {

        v27 = (void *)v36;
LABEL_30:
        v4 = v32;
        v3 = v33;
        if (v22 == v27) {
          goto LABEL_32;
        }
        goto LABEL_31;
      }
      v27 = (void *)v36;
    }
    else
    {
      LOBYTE(v9) = 0;
      v27 = (void *)v36;
    }

    goto LABEL_30;
  }
  LOBYTE(v9) = 0;
LABEL_41:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTODAPlan)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTODAPlan;
  v5 = [(CTPlan *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mcc"];
    mcc = v5->_mcc;
    v5->_mcc = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mnc"];
    mnc = v5->_mnc;
    v5->_mnc = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gid1"];
    gid1 = v5->_gid1;
    v5->_gid1 = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gid2"];
    gid2 = v5->_gid2;
    v5->_gid2 = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"setupURL"];
    setupURL = v5->_setupURL;
    v5->_setupURL = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handoffToken"];
    handoffToken = v5->_handoffToken;
    v5->_handoffToken = (NSString *)v16;

    v5->_inBuddy = [v4 decodeBoolForKey:@"inBuddy"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CTODAPlan;
  id v4 = a3;
  [(CTPlan *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_mcc, @"mcc", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_mnc forKey:@"mnc"];
  [v4 encodeObject:self->_gid1 forKey:@"gid1"];
  [v4 encodeObject:self->_gid2 forKey:@"gid2"];
  [v4 encodeObject:self->_setupURL forKey:@"setupURL"];
  [v4 encodeObject:self->_handoffToken forKey:@"handoffToken"];
  [v4 encodeBool:self->_inBuddy forKey:@"inBuddy"];
}

- (NSString)mcc
{
  return self->_mcc;
}

- (NSString)mnc
{
  return self->_mnc;
}

- (NSString)gid1
{
  return self->_gid1;
}

- (NSString)gid2
{
  return self->_gid2;
}

- (NSString)setupURL
{
  return self->_setupURL;
}

- (NSString)handoffToken
{
  return self->_handoffToken;
}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handoffToken, 0);
  objc_storeStrong((id *)&self->_setupURL, 0);
  objc_storeStrong((id *)&self->_gid2, 0);
  objc_storeStrong((id *)&self->_gid1, 0);
  objc_storeStrong((id *)&self->_mnc, 0);

  objc_storeStrong((id *)&self->_mcc, 0);
}

@end