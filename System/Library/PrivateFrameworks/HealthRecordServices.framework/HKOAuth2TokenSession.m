@interface HKOAuth2TokenSession
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKOAuth2TokenSession)init;
- (HKOAuth2TokenSession)initWithCode:(id)a3 query:(id)a4 requestedScope:(id)a5 state:(id)a6;
- (HKOAuth2TokenSession)initWithCode:(id)a3 query:(id)a4 requestedScope:(id)a5 state:(id)a6 pkceVerifier:(id)a7;
- (HKOAuth2TokenSession)initWithCoder:(id)a3;
- (NSString)code;
- (NSString)pkceVerifier;
- (NSString)query;
- (NSString)requestedScope;
- (NSUUID)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKOAuth2TokenSession

- (HKOAuth2TokenSession)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKOAuth2TokenSession)initWithCode:(id)a3 query:(id)a4 requestedScope:(id)a5 state:(id)a6
{
  return [(HKOAuth2TokenSession *)self initWithCode:a3 query:a4 requestedScope:a5 state:a6 pkceVerifier:0];
}

- (HKOAuth2TokenSession)initWithCode:(id)a3 query:(id)a4 requestedScope:(id)a5 state:(id)a6 pkceVerifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKOAuth2TokenSession;
  v17 = [(HKOAuth2TokenSession *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    code = v17->_code;
    v17->_code = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    query = v17->_query;
    v17->_query = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    requestedScope = v17->_requestedScope;
    v17->_requestedScope = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    state = v17->_state;
    v17->_state = (NSUUID *)v24;

    uint64_t v26 = [v16 copy];
    pkceVerifier = v17->_pkceVerifier;
    v17->_pkceVerifier = (NSString *)v26;
  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v7 = (HKOAuth2TokenSession *)a3;
  if (v7 == self)
  {
    char v14 = 1;
  }
  else
  {
    if ([(HKOAuth2TokenSession *)v7 isMemberOfClass:objc_opt_class()])
    {
      v8 = v7;
      v9 = [(HKOAuth2TokenSession *)v8 code];
      v10 = [(HKOAuth2TokenSession *)self code];
      if (v9 != v10)
      {
        uint64_t v11 = [(HKOAuth2TokenSession *)self code];
        if (!v11)
        {
          char v14 = 0;
          goto LABEL_61;
        }
        v3 = (void *)v11;
        id v12 = [(HKOAuth2TokenSession *)v8 code];
        id v13 = [(HKOAuth2TokenSession *)self code];
        v61 = v12;
        if (![v12 isEqualToString:v13])
        {
          char v14 = 0;
LABEL_60:

          goto LABEL_61;
        }
        v59 = v13;
      }
      id v15 = [(HKOAuth2TokenSession *)v8 query];
      uint64_t v16 = [(HKOAuth2TokenSession *)self query];
      v17 = (void *)v16;
      if (v15 == (void *)v16)
      {
        v56 = (void *)v16;
      }
      else
      {
        uint64_t v18 = [(HKOAuth2TokenSession *)self query];
        if (!v18)
        {

          goto LABEL_48;
        }
        uint64_t v4 = v15;
        v55 = (void *)v18;
        v5 = [(HKOAuth2TokenSession *)v8 query];
        v19 = [(HKOAuth2TokenSession *)self query];
        if (([v5 isEqualToString:v19] & 1) == 0)
        {

          char v14 = 0;
          id v13 = v59;
          if (v9 == v10) {
            goto LABEL_61;
          }
          goto LABEL_60;
        }
        v56 = v17;
        v52 = v19;
        id v15 = v4;
      }
      uint64_t v20 = [(HKOAuth2TokenSession *)v8 requestedScope];
      v58 = [(HKOAuth2TokenSession *)self requestedScope];
      v60 = (void *)v20;
      if ((void *)v20 == v58) {
        goto LABEL_21;
      }
      uint64_t v21 = [(HKOAuth2TokenSession *)self requestedScope];
      if (!v21)
      {
        v54 = v5;
        char v14 = 0;
        v28 = v52;
LABEL_54:

LABEL_55:
        v41 = v56;
        if (v15 != v56)
        {

          goto LABEL_57;
        }
        goto LABEL_58;
      }
      uint64_t v22 = v15;
      v50 = (void *)v21;
      v23 = [(HKOAuth2TokenSession *)v8 requestedScope];
      uint64_t v4 = [(HKOAuth2TokenSession *)self requestedScope];
      if ([v23 isEqualToString:v4])
      {
        v47 = v23;
        id v15 = v22;
LABEL_21:
        uint64_t v24 = [(HKOAuth2TokenSession *)v8 state];
        v51 = [(HKOAuth2TokenSession *)self state];
        v53 = (void *)v24;
        v54 = v5;
        if ((void *)v24 == v51)
        {
          v48 = v15;
          v49 = v4;
          v57 = v3;
          [(HKOAuth2TokenSession *)v8 pkceVerifier];
        }
        else
        {
          uint64_t v25 = [(HKOAuth2TokenSession *)self state];
          if (!v25)
          {
            char v14 = 0;
            v36 = v51;
            goto LABEL_42;
          }
          v49 = v4;
          v46 = (void *)v25;
          uint64_t v26 = [(HKOAuth2TokenSession *)v8 state];
          v27 = [(HKOAuth2TokenSession *)self state];
          if (([v26 isEqual:v27] & 1) == 0)
          {

            char v14 = 0;
            v37 = v60;
            v38 = v58;
            v28 = v52;
            v39 = v4;
            if (v60 != v58)
            {
LABEL_53:

              goto LABEL_54;
            }
LABEL_38:

            goto LABEL_55;
          }
          v45 = v27;
          v48 = v15;
          v57 = v3;
          [(HKOAuth2TokenSession *)v8 pkceVerifier];
        objc_super v29 = };
        uint64_t v30 = [(HKOAuth2TokenSession *)self pkceVerifier];
        char v14 = v29 == (void *)v30;
        if (v29 == (void *)v30)
        {
        }
        else
        {
          v31 = (void *)v30;
          uint64_t v32 = [(HKOAuth2TokenSession *)self pkceVerifier];
          if (v32)
          {
            v33 = (void *)v32;
            v34 = [(HKOAuth2TokenSession *)v8 pkceVerifier];
            v35 = [(HKOAuth2TokenSession *)self pkceVerifier];
            char v14 = [v34 isEqual:v35];

            if (v53 == v51)
            {
            }
            else
            {
            }
            v37 = v60;
            v3 = v57;
            v38 = v58;
            v28 = v52;
            id v15 = v48;
            v39 = v49;
            if (v60 != v58) {
              goto LABEL_53;
            }
            goto LABEL_38;
          }
        }
        v36 = v51;
        if (v53 == v51)
        {

          v3 = v57;
          v40 = v58;
          id v15 = v48;
          uint64_t v4 = v49;
          if (v60 == v58)
          {
LABEL_44:

            v41 = v56;
            if (v15 != v56)
            {

LABEL_57:
            }
LABEL_58:

LABEL_59:
            id v13 = v59;
            if (v9 != v10) {
              goto LABEL_60;
            }
LABEL_61:

            goto LABEL_62;
          }
LABEL_43:

          goto LABEL_44;
        }

        v3 = v57;
        id v15 = v48;
        uint64_t v4 = v49;
LABEL_42:

        v40 = v58;
        if (v60 == v58) {
          goto LABEL_44;
        }
        goto LABEL_43;
      }

      if (v22 == v56)
      {
      }
      else
      {
      }
LABEL_48:
      char v14 = 0;
      goto LABEL_59;
    }
    char v14 = 0;
  }
LABEL_62:

  return v14;
}

- (unint64_t)hash
{
  v3 = [(HKOAuth2TokenSession *)self code];
  uint64_t v4 = [v3 hash];
  v5 = [(HKOAuth2TokenSession *)self query];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(HKOAuth2TokenSession *)self requestedScope];
  uint64_t v8 = [v7 hash];
  v9 = [(HKOAuth2TokenSession *)self state];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  uint64_t v11 = [(HKOAuth2TokenSession *)self pkceVerifier];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HKOAuth2TokenSession *)self code];
  [v4 encodeObject:v5 forKey:@"code"];

  uint64_t v6 = [(HKOAuth2TokenSession *)self query];
  [v4 encodeObject:v6 forKey:@"query"];

  v7 = [(HKOAuth2TokenSession *)self requestedScope];
  [v4 encodeObject:v7 forKey:@"requestedScope"];

  uint64_t v8 = [(HKOAuth2TokenSession *)self state];
  [v4 encodeObject:v8 forKey:@"state"];

  id v9 = [(HKOAuth2TokenSession *)self pkceVerifier];
  [v4 encodeObject:v9 forKey:@"pkceVerifier"];
}

- (HKOAuth2TokenSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"code"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"query"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestedScope"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pkceVerifier"];
  if (v5 && v6 && v7 && v8)
  {
    self = [(HKOAuth2TokenSession *)self initWithCode:v5 query:v6 requestedScope:v7 state:v8 pkceVerifier:v9];
    uint64_t v10 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    uint64_t v10 = 0;
  }

  return v10;
}

- (NSString)code
{
  return self->_code;
}

- (NSString)query
{
  return self->_query;
}

- (NSString)requestedScope
{
  return self->_requestedScope;
}

- (NSUUID)state
{
  return self->_state;
}

- (NSString)pkceVerifier
{
  return self->_pkceVerifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pkceVerifier, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_requestedScope, 0);
  objc_storeStrong((id *)&self->_query, 0);

  objc_storeStrong((id *)&self->_code, 0);
}

@end