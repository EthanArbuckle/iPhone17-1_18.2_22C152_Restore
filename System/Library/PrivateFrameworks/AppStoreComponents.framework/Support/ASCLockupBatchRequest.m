@interface ASCLockupBatchRequest
+ (BOOL)supportsSecureCoding;
+ (id)lockupBatchRequestsFromRequests:(id)a3;
- (ASCLockupBatchRequest)initWithCoder:(id)a3;
- (ASCLockupBatchRequest)initWithIDs:(id)a3 kind:(id)a4 context:(id)a5;
- (ASCLockupBatchRequest)lockupBatchRequestWithIDs:(id)a3;
- (BOOL)enableAppDistribution;
- (BOOL)isEqual:(id)a3;
- (NSArray)requests;
- (NSDictionary)mediaQueryParams;
- (NSSet)ids;
- (NSString)clientID;
- (NSString)context;
- (NSString)kind;
- (NSString)platformOverride;
- (id)_initWithIDs:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 enableAppDistribution:(BOOL)a7 mediaQueryParams:(id)a8 platformOverride:(id)a9;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupBatchRequest

+ (id)lockupBatchRequestsFromRequests:(id)a3
{
  id v3 = a3;
  id v43 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [v3 firstObject];
  v5 = [v4 clientID];

  v6 = [v3 firstObject];
  unsigned int v42 = [v6 enableAppDistribution];

  v7 = [v3 firstObject];
  v41 = [v7 mediaQueryParams];

  v8 = [v3 firstObject];
  v9 = [v8 platformOverride];

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v10 = v3;
  id v11 = [v10 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v51;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v51 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        if ((unint64_t)[v10 count] >= 2)
        {
          v16 = [v15 mediaQueryParams];

          if (v16)
          {
            id v38 = objc_alloc((Class)NSException);
            NSExceptionName v39 = NSInvalidArgumentException;
            CFStringRef v40 = @"Request specifying custom media query parameters cannot be included in batch request with more than one request";
LABEL_30:
            objc_exception_throw([v38 initWithName:v39 reason:v40 userInfo:0]);
          }
        }
        v17 = [v15 clientID];
        v18 = v17;
        if (v5 && v17)
        {
          unsigned __int8 v19 = [v17 isEqual:v5];

          if ((v19 & 1) == 0) {
            goto LABEL_26;
          }
        }
        else
        {

          if (v18 != v5)
          {
LABEL_26:
            v35 = [v15 clientID];
            uint64_t v36 = +[NSString stringWithFormat:@"Requests with different clientID cannot be included in batch request: %@ != %@", v35, v5];

LABEL_29:
            id v38 = objc_alloc((Class)NSException);
            NSExceptionName v39 = NSInvalidArgumentException;
            CFStringRef v40 = (const __CFString *)v36;
            goto LABEL_30;
          }
        }
        if (v42 != [v15 enableAppDistribution])
        {
          uint64_t v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Requests with different AppDistribution options cannot be included in batch request: %d != %d", [v15 enableAppDistribution], v42);
          goto LABEL_29;
        }
        v20 = [v15 platformOverride];
        v21 = v20;
        if (v9 && v20)
        {
          unsigned __int8 v22 = [v20 isEqual:v9];

          if ((v22 & 1) == 0) {
            goto LABEL_28;
          }
        }
        else
        {

          if (v21 != v9)
          {
LABEL_28:
            v37 = [v15 platformOverride];
            uint64_t v36 = +[NSString stringWithFormat:@"Requests with different platformOverride options cannot be included in batch request: %@ != %@", v37, v9];

            goto LABEL_29;
          }
        }
        v23 = [ASCPair alloc];
        v24 = [v15 kind];
        v25 = [v15 context];
        v26 = [(ASCPair *)v23 initWithFirst:v24 second:v25];

        id v27 = [v43 objectForKeyedSubscript:v26];
        if (!v27)
        {
          id v27 = objc_alloc_init((Class)NSMutableSet);
          [v43 setObject:v27 forKeyedSubscript:v26];
        }
        v28 = [v15 id];
        [v27 addObject:v28];
      }
      id v12 = [v10 countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v12);
  }

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10001753C;
  v44[3] = &unk_100184068;
  char v49 = v42;
  id v45 = v5;
  id v46 = v41;
  id v47 = v9;
  id v48 = objc_alloc_init((Class)NSMutableArray);
  id v29 = v48;
  id v30 = v9;
  id v31 = v41;
  id v32 = v5;
  [v43 enumerateKeysAndObjectsUsingBlock:v44];
  id v33 = [v29 copy];

  return v33;
}

- (ASCLockupBatchRequest)initWithIDs:(id)a3 kind:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ASCLockupBatchRequest;
  id v11 = [(ASCLockupBatchRequest *)&v19 init];
  if (v11)
  {
    id v12 = (NSSet *)[v8 copy];
    ids = v11->_ids;
    v11->_ids = v12;

    v14 = (NSString *)[v9 copy];
    kind = v11->_kind;
    v11->_kind = v14;

    v16 = (NSString *)[v10 copy];
    context = v11->_context;
    v11->_context = v16;
  }
  return v11;
}

- (id)_initWithIDs:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 enableAppDistribution:(BOOL)a7 mediaQueryParams:(id)a8 platformOverride:(id)a9
{
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  v18 = [(ASCLockupBatchRequest *)self initWithIDs:a3 kind:a4 context:a5];
  objc_super v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_clientID, a6);
    v19->_enableAppDistribution = a7;
    objc_storeStrong((id *)&v19->_mediaQueryParams, a8);
    objc_storeStrong((id *)&v19->_platformOverride, a9);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupBatchRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"ids"];

  if (v7)
  {
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
    if (v8)
    {
      id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
      if (v9)
      {
        id v10 = [(ASCLockupBatchRequest *)self initWithIDs:v7 kind:v8 context:v9];
        if (v10)
        {
          uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientID"];
          clientID = v10->_clientID;
          v10->_clientID = (NSString *)v11;

          v10->_enableAppDistribution = [v4 decodeBoolForKey:@"enableAppDistribution"];
          id v13 = objc_alloc((Class)NSSet);
          uint64_t v14 = objc_opt_class();
          id v15 = objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0);
          uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"mediaQueryParams"];
          mediaQueryParams = v10->_mediaQueryParams;
          v10->_mediaQueryParams = (NSDictionary *)v16;

          uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platformOverride"];
          platformOverride = v10->_platformOverride;
          v10->_platformOverride = (NSString *)v18;
        }
        self = v10;
        v20 = self;
      }
      else
      {
        BOOL v37 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v37) {
          sub_10013E86C(v37, v38, v39, v40, v41, v42, v43, v44);
        }
        v20 = 0;
      }
    }
    else
    {
      BOOL v29 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v29) {
        sub_10013E830(v29, v30, v31, v32, v33, v34, v35, v36);
      }
      v20 = 0;
    }
  }
  else
  {
    BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v21) {
      sub_10013E7F4(v21, v22, v23, v24, v25, v26, v27, v28);
    }
    v20 = 0;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ASCLockupBatchRequest *)self ids];
  [v4 encodeObject:v5 forKey:@"ids"];

  v6 = [(ASCLockupBatchRequest *)self kind];
  [v4 encodeObject:v6 forKey:@"kind"];

  v7 = [(ASCLockupBatchRequest *)self context];
  [v4 encodeObject:v7 forKey:@"context"];

  id v8 = [(ASCLockupBatchRequest *)self clientID];
  [v4 encodeObject:v8 forKey:@"clientID"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ASCLockupBatchRequest enableAppDistribution](self, "enableAppDistribution"), @"enableAppDistribution");
  id v9 = [(ASCLockupBatchRequest *)self mediaQueryParams];
  [v4 encodeObject:v9 forKey:@"mediaQueryParams"];

  id v10 = [(ASCLockupBatchRequest *)self platformOverride];
  [v4 encodeObject:v10 forKey:@"platformOverride"];
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCLockupBatchRequest *)self ids];
  [(ASCHasher *)v3 combineObject:v4];

  uint64_t v5 = [(ASCLockupBatchRequest *)self kind];
  [(ASCHasher *)v3 combineObject:v5];

  v6 = [(ASCLockupBatchRequest *)self context];
  [(ASCHasher *)v3 combineObject:v6];

  v7 = [(ASCLockupBatchRequest *)self clientID];
  [(ASCHasher *)v3 combineObject:v7];

  [(ASCHasher *)v3 combineBool:[(ASCLockupBatchRequest *)self enableAppDistribution]];
  id v8 = [(ASCLockupBatchRequest *)self mediaQueryParams];
  [(ASCHasher *)v3 combineObject:v8];

  id v9 = [(ASCLockupBatchRequest *)self platformOverride];
  [(ASCHasher *)v3 combineObject:v9];

  unint64_t v10 = [(ASCHasher *)v3 finalizeHash];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockupBatchRequest *)a3;
  if (self != v4)
  {
    objc_opt_class();
    uint64_t v5 = v4;
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
    id v9 = [(ASCLockupBatchRequest *)self ids];
    uint64_t v10 = [(ASCLockupBatchRequest *)v8 ids];
    uint64_t v11 = (void *)v10;
    if (v9 && v10)
    {
      if ([v9 isEqual:v10])
      {
LABEL_12:
        id v12 = [(ASCLockupBatchRequest *)self kind];
        uint64_t v13 = [(ASCLockupBatchRequest *)v8 kind];
        uint64_t v14 = (void *)v13;
        if (v12 && v13)
        {
          if ([v12 isEqual:v13])
          {
LABEL_15:
            id v15 = [(ASCLockupBatchRequest *)self context];
            uint64_t v16 = [(ASCLockupBatchRequest *)v8 context];
            id v17 = (void *)v16;
            if (v15 && v16)
            {
              if ([v15 isEqual:v16])
              {
LABEL_18:
                BOOL v37 = v17;
                uint64_t v18 = [(ASCLockupBatchRequest *)self clientID];
                uint64_t v19 = [(ASCLockupBatchRequest *)v8 clientID];
                v20 = (void *)v19;
                if (v18 && v19)
                {
                  if ([v18 isEqual:v19]) {
                    goto LABEL_21;
                  }
                }
                else if (v18 == (void *)v19)
                {
LABEL_21:
                  uint64_t v34 = v18;
                  uint64_t v36 = v20;
                  unsigned int v21 = [(ASCLockupBatchRequest *)self enableAppDistribution];
                  if (v21 != [(ASCLockupBatchRequest *)v8 enableAppDistribution])
                  {
                    BOOL v7 = 0;
LABEL_43:
                    v20 = v36;
                    goto LABEL_44;
                  }
                  uint64_t v22 = [(ASCLockupBatchRequest *)self mediaQueryParams];
                  uint64_t v23 = [(ASCLockupBatchRequest *)v8 mediaQueryParams];
                  uint64_t v24 = (void *)v23;
                  if (v22 && v23)
                  {
                    uint64_t v25 = (void *)v23;
                    unsigned int v26 = [v22 isEqual:v23];
                    uint64_t v24 = v25;
                    uint64_t v18 = v34;
                    if (v26) {
                      goto LABEL_35;
                    }
                  }
                  else if (v22 == (void *)v23)
                  {
LABEL_35:
                    uint64_t v33 = v24;
                    uint64_t v27 = [(ASCLockupBatchRequest *)self platformOverride];
                    uint64_t v28 = [(ASCLockupBatchRequest *)v8 platformOverride];
                    BOOL v29 = (void *)v28;
                    uint64_t v35 = v27;
                    if (v27 && v28)
                    {
                      uint64_t v32 = (void *)v28;
                      unsigned __int8 v30 = [v27 isEqual:v28];
                      BOOL v29 = v32;
                      BOOL v7 = v30;
                    }
                    else
                    {
                      BOOL v7 = v27 == (void *)v28;
                    }

                    uint64_t v24 = v33;
                    goto LABEL_42;
                  }
                  BOOL v7 = 0;
LABEL_42:

                  goto LABEL_43;
                }
                BOOL v7 = 0;
LABEL_44:

                id v17 = v37;
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
  id v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCLockupBatchRequest *)self ids];
  [(ASCDescriber *)v3 addObject:v4 withName:@"ids"];

  uint64_t v5 = [(ASCLockupBatchRequest *)self kind];
  [(ASCDescriber *)v3 addObject:v5 withName:@"kind"];

  v6 = [(ASCLockupBatchRequest *)self context];
  [(ASCDescriber *)v3 addObject:v6 withName:@"context"];

  BOOL v7 = [(ASCLockupBatchRequest *)self clientID];
  [(ASCDescriber *)v3 addObject:v7 withName:@"clientID"];

  [(ASCDescriber *)v3 addBool:[(ASCLockupBatchRequest *)self enableAppDistribution] withName:@"enableAppDistribution"];
  id v8 = [(ASCLockupBatchRequest *)self mediaQueryParams];

  if (v8)
  {
    id v9 = [(ASCLockupBatchRequest *)self mediaQueryParams];
    [(ASCDescriber *)v3 addObject:v9 withName:@"mediaQueryParams"];
  }
  uint64_t v10 = [(ASCLockupBatchRequest *)self platformOverride];

  if (v10)
  {
    uint64_t v11 = [(ASCLockupBatchRequest *)self platformOverride];
    [(ASCDescriber *)v3 addObject:v11 withName:@"platformOverride"];
  }
  id v12 = [(ASCDescriber *)v3 finalizeDescription];

  return v12;
}

- (NSArray)requests
{
  id v3 = objc_alloc((Class)NSMutableArray);
  id v4 = [(ASCLockupBatchRequest *)self ids];
  id v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(ASCLockupBatchRequest *)self ids];
  id v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = [ASCLockupRequest alloc];
        id v12 = [(ASCLockupBatchRequest *)self kind];
        uint64_t v13 = [(ASCLockupBatchRequest *)self context];
        uint64_t v14 = [(ASCLockupBatchRequest *)self clientID];
        id v15 = [(ASCLockupRequest *)v11 _initWithID:v10 kind:v12 context:v13 clientID:v14 enableAppDistribution:[(ASCLockupBatchRequest *)self enableAppDistribution]];

        uint64_t v16 = [(ASCLockupBatchRequest *)self mediaQueryParams];

        if (v16)
        {
          id v17 = [(ASCLockupBatchRequest *)self mediaQueryParams];
          uint64_t v18 = [v15 lockupRequestWithMediaQueryParams:v17];

          id v15 = (id)v18;
        }
        uint64_t v19 = [(ASCLockupBatchRequest *)self platformOverride];

        if (v19)
        {
          v20 = [(ASCLockupBatchRequest *)self platformOverride];
          uint64_t v21 = [v15 _lockupRequestWithPlatformOverride:v20];

          id v15 = (id)v21;
        }
        [v5 addObject:v15];
      }
      id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  id v22 = [v5 copy];

  return (NSArray *)v22;
}

- (ASCLockupBatchRequest)lockupBatchRequestWithIDs:(id)a3
{
  id v4 = a3;
  id v5 = [ASCLockupBatchRequest alloc];
  id v6 = [(ASCLockupBatchRequest *)self kind];
  id v7 = [(ASCLockupBatchRequest *)self context];
  uint64_t v8 = [(ASCLockupBatchRequest *)self clientID];
  BOOL v9 = [(ASCLockupBatchRequest *)self enableAppDistribution];
  uint64_t v10 = [(ASCLockupBatchRequest *)self mediaQueryParams];
  uint64_t v11 = [(ASCLockupBatchRequest *)self platformOverride];
  id v12 = [(ASCLockupBatchRequest *)v5 _initWithIDs:v4 kind:v6 context:v7 clientID:v8 enableAppDistribution:v9 mediaQueryParams:v10 platformOverride:v11];

  return (ASCLockupBatchRequest *)v12;
}

- (NSSet)ids
{
  return self->_ids;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)context
{
  return self->_context;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (BOOL)enableAppDistribution
{
  return self->_enableAppDistribution;
}

- (NSDictionary)mediaQueryParams
{
  return self->_mediaQueryParams;
}

- (NSString)platformOverride
{
  return self->_platformOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformOverride, 0);
  objc_storeStrong((id *)&self->_mediaQueryParams, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_kind, 0);

  objc_storeStrong((id *)&self->_ids, 0);
}

@end