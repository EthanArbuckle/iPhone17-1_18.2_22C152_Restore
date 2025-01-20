@interface ASCLockupRequest
+ (BOOL)supportsSecureCoding;
+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6;
+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 enableAppDistribution:(BOOL)a7;
+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 productVariantID:(id)a7 enableAppDistribution:(BOOL)a8;
+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 enableAppDistribution:(BOOL)a6;
+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 minExternalVersionID:(id)a6 latestReleaseID:(id)a7 productVariantID:(id)a8;
+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 platformOverride:(id)a6;
- (ASCAdamID)id;
- (ASCLockupRequest)initWithCoder:(id)a3;
- (ASCLockupRequest)initWithID:(id)a3 kind:(id)a4 context:(id)a5;
- (ASCLockupRequest)lockupRequestWithAppDistributionEnabled;
- (ASCLockupRequest)lockupRequestWithMediaQueryParams:(id)a3;
- (BOOL)enableAppDistribution;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)mediaQueryParams;
- (NSString)clientID;
- (NSString)context;
- (NSString)kind;
- (NSString)platformOverride;
- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6;
- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 enableAppDistribution:(BOOL)a7;
- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 productVariantID:(id)a7 enableAppDistribution:(BOOL)a8;
- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 enableAppDistribution:(BOOL)a6;
- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 minExternalVersionID:(id)a6 latestReleaseID:(id)a7 productVariantID:(id)a8;
- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 platformOverride:(id)a6;
- (id)_lockupRequestWithAppDistributionEnabled;
- (id)_lockupRequestWithClientID:(id)a3;
- (id)_lockupRequestWithPlatformOverride:(id)a3;
- (id)clone;
- (id)description;
- (id)lockupRequestByAddingMediaQueryParams:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupRequest

- (ASCLockupRequest)initWithID:(id)a3 kind:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  sub_10000F3C4();
  v19.receiver = self;
  v19.super_class = (Class)ASCLockupRequest;
  v11 = [(ASCLockupRequest *)&v19 init];
  if (v11)
  {
    v12 = (ASCAdamID *)[v8 copy];
    id = v11->_id;
    v11->_id = v12;

    v14 = (NSString *)[v9 copy];
    kind = v11->_kind;
    v11->_kind = v14;

    v16 = (NSString *)[v10 copy];
    context = v11->_context;
    v11->_context = v16;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
    if (v6)
    {
      v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
      if (v7)
      {
        id v8 = [(ASCLockupRequest *)self initWithID:v5 kind:v6 context:v7];
        if (v8)
        {
          id v9 = objc_alloc((Class)NSSet);
          uint64_t v10 = objc_opt_class();
          id v11 = objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
          uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"mediaQueryParams"];
          mediaQueryParams = v8->_mediaQueryParams;
          v8->_mediaQueryParams = (NSDictionary *)v12;

          uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientID"];
          clientID = v8->_clientID;
          v8->_clientID = (NSString *)v14;

          v8->_enableAppDistribution = [v4 decodeBoolForKey:@"enableAppDistribution"];
          uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platformOverride"];
          platformOverride = v8->_platformOverride;
          v8->_platformOverride = (NSString *)v16;
        }
        self = v8;
        v18 = self;
      }
      else
      {
        BOOL v35 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v35) {
          sub_10013E86C(v35, v36, v37, v38, v39, v40, v41, v42);
        }
        v18 = 0;
      }
    }
    else
    {
      BOOL v27 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v27) {
        sub_10013E830(v27, v28, v29, v30, v31, v32, v33, v34);
      }
      v18 = 0;
    }
  }
  else
  {
    BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v19) {
      sub_10013E8A8(v19, v20, v21, v22, v23, v24, v25, v26);
    }
    v18 = 0;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASCLockupRequest *)self id];
  [v4 encodeObject:v5 forKey:@"id"];

  v6 = [(ASCLockupRequest *)self kind];
  [v4 encodeObject:v6 forKey:@"kind"];

  v7 = [(ASCLockupRequest *)self context];
  [v4 encodeObject:v7 forKey:@"context"];

  id v8 = [(ASCLockupRequest *)self mediaQueryParams];
  [v4 encodeObject:v8 forKey:@"mediaQueryParams"];

  id v9 = [(ASCLockupRequest *)self clientID];
  [v4 encodeObject:v9 forKey:@"clientID"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ASCLockupRequest enableAppDistribution](self, "enableAppDistribution"), @"enableAppDistribution");
  id v10 = [(ASCLockupRequest *)self platformOverride];
  [v4 encodeObject:v10 forKey:@"platformOverride"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCLockupRequest *)self id];
  [(ASCHasher *)v3 combineObject:v4];

  v5 = [(ASCLockupRequest *)self kind];
  [(ASCHasher *)v3 combineObject:v5];

  v6 = [(ASCLockupRequest *)self context];
  [(ASCHasher *)v3 combineObject:v6];

  v7 = [(ASCLockupRequest *)self mediaQueryParams];
  [(ASCHasher *)v3 combineObject:v7];

  id v8 = [(ASCLockupRequest *)self clientID];
  [(ASCHasher *)v3 combineObject:v8];

  [(ASCHasher *)v3 combineBool:[(ASCLockupRequest *)self enableAppDistribution]];
  id v9 = [(ASCLockupRequest *)self platformOverride];
  [(ASCHasher *)v3 combineObject:v9];

  unint64_t v10 = [(ASCHasher *)v3 finalizeHash];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockupRequest *)a3;
  if (self != v4)
  {
    objc_opt_class();
    v5 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
    }
    else
    {
      v6 = 0;
    }
    id v8 = v6;

    if (!v8)
    {
      BOOL v7 = 0;
LABEL_48:

      goto LABEL_49;
    }
    id v9 = [(ASCLockupRequest *)self id];
    uint64_t v10 = [(ASCLockupRequest *)v8 id];
    id v11 = (void *)v10;
    if (v9 && v10)
    {
      if ([v9 isEqual:v10])
      {
LABEL_12:
        uint64_t v12 = [(ASCLockupRequest *)self kind];
        uint64_t v13 = [(ASCLockupRequest *)v8 kind];
        uint64_t v14 = (void *)v13;
        if (v12 && v13)
        {
          if ([v12 isEqual:v13])
          {
LABEL_15:
            v15 = [(ASCLockupRequest *)self context];
            uint64_t v16 = [(ASCLockupRequest *)v8 context];
            v17 = (void *)v16;
            if (v15 && v16)
            {
              if ([v15 isEqual:v16])
              {
LABEL_18:
                v18 = [(ASCLockupRequest *)self mediaQueryParams];
                uint64_t v19 = [(ASCLockupRequest *)v8 mediaQueryParams];
                uint64_t v20 = (void *)v19;
                uint64_t v40 = v18;
                if (v18 && v19)
                {
                  uint64_t v21 = v18;
                  uint64_t v22 = v20;
                  unsigned int v23 = [v21 isEqual:v20];
                  uint64_t v20 = v22;
                  v18 = v40;
                  if (v23)
                  {
LABEL_21:
                    uint64_t v38 = v20;
                    uint64_t v24 = [(ASCLockupRequest *)self clientID];
                    uint64_t v25 = [(ASCLockupRequest *)v8 clientID];
                    uint64_t v26 = (void *)v25;
                    uint64_t v39 = (void *)v24;
                    if (v24 && v25)
                    {
                      BOOL v27 = (void *)v25;
                      unsigned int v28 = [v39 isEqual:v25];
                      uint64_t v26 = v27;
                      if (v28)
                      {
LABEL_24:
                        unsigned int v29 = [(ASCLockupRequest *)self enableAppDistribution];
                        if (v29 == [(ASCLockupRequest *)v8 enableAppDistribution])
                        {
                          uint64_t v30 = [(ASCLockupRequest *)self platformOverride];
                          uint64_t v31 = [(ASCLockupRequest *)v8 platformOverride];
                          uint64_t v32 = (void *)v31;
                          if (v30 && v31)
                          {
                            uint64_t v33 = (void *)v31;
                            unsigned __int8 v34 = [v30 isEqual:v31];
                            uint64_t v32 = v33;
                            BOOL v35 = v30;
                            BOOL v7 = v34;
                          }
                          else
                          {
                            BOOL v35 = v30;
                            BOOL v7 = v30 == (void *)v31;
                          }
                        }
                        else
                        {
                          BOOL v7 = 0;
                        }
                        uint64_t v26 = v37;
                        goto LABEL_43;
                      }
                    }
                    else if (v24 == v25)
                    {
                      goto LABEL_24;
                    }
                    BOOL v7 = 0;
LABEL_43:

                    uint64_t v20 = v38;
                    v18 = v40;
                    goto LABEL_44;
                  }
                }
                else if (v18 == (void *)v19)
                {
                  goto LABEL_21;
                }
                BOOL v7 = 0;
LABEL_44:

                goto LABEL_45;
              }
            }
            else if (v15 == (void *)v16)
            {
              goto LABEL_18;
            }
            BOOL v7 = 0;
LABEL_45:

            goto LABEL_46;
          }
        }
        else if (v12 == (void *)v13)
        {
          goto LABEL_15;
        }
        BOOL v7 = 0;
LABEL_46:

        goto LABEL_47;
      }
    }
    else if (v9 == (void *)v10)
    {
      goto LABEL_12;
    }
    BOOL v7 = 0;
LABEL_47:

    goto LABEL_48;
  }
  BOOL v7 = 1;
LABEL_49:

  return v7;
}

- (id)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCLockupRequest *)self id];
  [(ASCDescriber *)v3 addObject:v4 withName:@"id"];

  v5 = [(ASCLockupRequest *)self kind];
  [(ASCDescriber *)v3 addObject:v5 withName:@"kind"];

  v6 = [(ASCLockupRequest *)self context];
  [(ASCDescriber *)v3 addObject:v6 withName:@"context"];

  BOOL v7 = [(ASCLockupRequest *)self mediaQueryParams];

  if (v7)
  {
    id v8 = [(ASCLockupRequest *)self mediaQueryParams];
    [(ASCDescriber *)v3 addObject:v8 withName:@"mediaQueryParams"];
  }
  id v9 = [(ASCLockupRequest *)self clientID];

  if (v9)
  {
    uint64_t v10 = [(ASCLockupRequest *)self clientID];
    [(ASCDescriber *)v3 addObject:v10 withName:@"clientID"];
  }
  if ([(ASCLockupRequest *)self enableAppDistribution]) {
    [(ASCDescriber *)v3 addBool:[(ASCLockupRequest *)self enableAppDistribution] withName:@"enableAppDistribution"];
  }
  id v11 = [(ASCLockupRequest *)self platformOverride];

  if (v11)
  {
    uint64_t v12 = [(ASCLockupRequest *)self platformOverride];
    [(ASCDescriber *)v3 addObject:v12 withName:@"platformOverride"];
  }
  uint64_t v13 = [(ASCDescriber *)v3 finalizeDescription];

  return v13;
}

- (id)clone
{
  id v3 = objc_alloc((Class)objc_opt_class());
  id v4 = [(ASCLockupRequest *)self id];
  v5 = [(ASCLockupRequest *)self kind];
  v6 = [(ASCLockupRequest *)self context];
  BOOL v7 = [v3 initWithID:v4 kind:v5 context:v6];

  uint64_t v8 = [(ASCLockupRequest *)self mediaQueryParams];
  id v9 = (void *)v7[5];
  v7[5] = v8;

  uint64_t v10 = [(ASCLockupRequest *)self clientID];
  id v11 = (void *)v7[6];
  v7[6] = v10;

  *((unsigned char *)v7 + 8) = [(ASCLockupRequest *)self enableAppDistribution];
  uint64_t v12 = [(ASCLockupRequest *)self platformOverride];
  uint64_t v13 = (void *)v7[7];
  v7[7] = v12;

  return v7;
}

- (ASCLockupRequest)lockupRequestWithMediaQueryParams:(id)a3
{
  id v4 = a3;
  v5 = [(ASCLockupRequest *)self clone];
  v6 = (void *)v5[5];
  v5[5] = v4;

  return (ASCLockupRequest *)v5;
}

- (id)lockupRequestByAddingMediaQueryParams:(id)a3
{
  id v4 = a3;
  v5 = [(ASCLockupRequest *)self clone];
  v6 = (void *)v5[5];
  if (v6)
  {
    id v7 = [v6 mutableCopy];
  }
  else
  {
    id v7 = +[NSMutableDictionary dictionary];
  }
  uint64_t v8 = v7;
  [v7 addEntriesFromDictionary:v4];

  id v9 = [v8 copy];
  uint64_t v10 = (void *)v5[5];
  v5[5] = v9;

  return v5;
}

- (id)_lockupRequestWithClientID:(id)a3
{
  id v4 = a3;
  v5 = [(ASCLockupRequest *)self clone];
  v6 = (void *)v5[6];
  v5[6] = v4;

  return v5;
}

- (id)_lockupRequestWithAppDistributionEnabled
{
  id result = [(ASCLockupRequest *)self clone];
  *((unsigned char *)result + 8) = 1;
  return result;
}

- (id)_lockupRequestWithPlatformOverride:(id)a3
{
  id v4 = a3;
  v5 = [(ASCLockupRequest *)self clone];
  v6 = (void *)v5[7];
  v5[7] = v4;

  return v5;
}

- (ASCAdamID)id
{
  return self->_id;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)context
{
  return self->_context;
}

- (NSDictionary)mediaQueryParams
{
  return self->_mediaQueryParams;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (BOOL)enableAppDistribution
{
  return self->_enableAppDistribution;
}

- (NSString)platformOverride
{
  return self->_platformOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformOverride, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_mediaQueryParams, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_kind, 0);

  objc_storeStrong((id *)&self->_id, 0);
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 enableAppDistribution:(BOOL)a6
{
  BOOL v6 = a6;
  id v7 = [(ASCLockupRequest *)self initWithID:a3 kind:a4 context:a5];
  uint64_t v8 = v7;
  id v9 = v7;
  if (v6)
  {
    id v9 = [(ASCLockupRequest *)v7 lockupRequestWithAppDistributionEnabled];
  }
  return v9;
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 enableAppDistribution:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  uint64_t v13 = [(ASCLockupRequest *)self initWithID:a3 kind:a4 context:a5];
  uint64_t v14 = v13;
  v15 = v13;
  if (v7)
  {
    v15 = [(ASCLockupRequest *)v13 lockupRequestWithAppDistributionEnabled];
  }
  uint64_t v16 = [v15 _lockupRequestWithClientID:v12];

  return v16;
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 productVariantID:(id)a7 enableAppDistribution:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [(ASCLockupRequest *)self initWithID:a3 kind:a4 context:a5];
  v17 = v16;
  v18 = v16;
  if (v8)
  {
    v18 = [(ASCLockupRequest *)v16 lockupRequestWithAppDistributionEnabled];
  }
  if (v15)
  {
    CFStringRef v23 = @"ppid";
    id v24 = v15;
    uint64_t v19 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    uint64_t v20 = [v18 lockupRequestWithMediaQueryParams:v19];

    v18 = (void *)v20;
  }
  uint64_t v21 = [v18 _lockupRequestWithClientID:v14];

  return v21;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 enableAppDistribution:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [[ASCLockupRequest alloc] _initWithID:v11 kind:v10 context:v9 enableAppDistribution:v6];

  return v12;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 enableAppDistribution:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [[ASCLockupRequest alloc] _initWithID:v14 kind:v13 context:v12 clientID:v11 enableAppDistribution:v7];

  return v15;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 productVariantID:(id)a7 enableAppDistribution:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [[ASCLockupRequest alloc] _initWithID:v17 kind:v16 context:v15 clientID:v14 productVariantID:v13 enableAppDistribution:v8];

  return v18;
}

- (ASCLockupRequest)lockupRequestWithAppDistributionEnabled
{
  return (ASCLockupRequest *)[(ASCLockupRequest *)self _lockupRequestWithAppDistributionEnabled];
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 minExternalVersionID:(id)a6 latestReleaseID:(id)a7 productVariantID:(id)a8
{
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = [(ASCLockupRequest *)self initWithID:a3 kind:a4 context:a5];
  id v18 = v17;
  if (v14)
  {
    CFStringRef v29 = @"minExternalVersionId";
    id v30 = v14;
    uint64_t v19 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v18 = [(ASCLockupRequest *)v17 lockupRequestByAddingMediaQueryParams:v19];
  }
  if (v15)
  {
    CFStringRef v27 = @"latestReleaseId";
    id v28 = v15;
    uint64_t v20 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    uint64_t v21 = [v18 lockupRequestByAddingMediaQueryParams:v20];

    id v18 = (void *)v21;
  }
  if (v16)
  {
    CFStringRef v25 = @"ppid";
    id v26 = v16;
    uint64_t v22 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    uint64_t v23 = [v18 lockupRequestByAddingMediaQueryParams:v22];

    id v18 = (void *)v23;
  }

  return v18;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 minExternalVersionID:(id)a6 latestReleaseID:(id)a7 productVariantID:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [[ASCLockupRequest alloc] _initWithID:v18 kind:v17 context:v16 minExternalVersionID:v15 latestReleaseID:v14 productVariantID:v13];

  return v19;
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6
{
  id v10 = a6;
  id v11 = [(ASCLockupRequest *)self initWithID:a3 kind:a4 context:a5];
  id v12 = [(ASCLockupRequest *)v11 lockupRequestWithClientID:v10];

  return v12;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[ASCLockupRequest alloc] _initWithID:v12 kind:v11 context:v10 clientID:v9];

  return v13;
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 platformOverride:(id)a6
{
  id v10 = a6;
  id v11 = [(ASCLockupRequest *)self initWithID:a3 kind:a4 context:a5];
  id v12 = [(ASCLockupRequest *)v11 lockupRequestWithPlatformOverride:v10];

  return v12;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 platformOverride:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[ASCLockupRequest alloc] _initWithID:v12 kind:v11 context:v10 platformOverride:v9];

  return v13;
}

@end