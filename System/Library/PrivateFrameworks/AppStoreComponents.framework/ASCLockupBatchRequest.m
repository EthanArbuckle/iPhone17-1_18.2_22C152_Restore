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
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [v3 firstObject];
  v5 = [v4 clientID];

  v6 = [v3 firstObject];
  unsigned int v45 = [v6 enableAppDistribution];

  v7 = [v3 firstObject];
  v44 = [v7 mediaQueryParams];

  v8 = [v3 firstObject];
  v9 = [v8 platformOverride];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v54 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        if ((unint64_t)[v10 count] >= 2)
        {
          v16 = [v15 mediaQueryParams];

          if (v16)
          {
            id v41 = objc_alloc(MEMORY[0x1E4F1CA00]);
            uint64_t v42 = *MEMORY[0x1E4F1C3C8];
            v43 = @"Request specifying custom media query parameters cannot be included in batch request with more than one request";
LABEL_30:
            objc_exception_throw((id)[v41 initWithName:v42 reason:v43 userInfo:0]);
          }
        }
        v17 = [v15 clientID];
        v18 = v17;
        if (v5 && v17)
        {
          char v19 = [v17 isEqual:v5];

          if ((v19 & 1) == 0) {
            goto LABEL_26;
          }
        }
        else
        {

          if (v18 != v5)
          {
LABEL_26:
            v36 = NSString;
            v37 = [v15 clientID];
            uint64_t v38 = [v36 stringWithFormat:@"Requests with different clientID cannot be included in batch request: %@ != %@", v37, v5];

LABEL_29:
            id v41 = objc_alloc(MEMORY[0x1E4F1CA00]);
            uint64_t v42 = *MEMORY[0x1E4F1C3C8];
            v43 = (__CFString *)v38;
            goto LABEL_30;
          }
        }
        if (v45 != [v15 enableAppDistribution])
        {
          uint64_t v38 = objc_msgSend(NSString, "stringWithFormat:", @"Requests with different AppDistribution options cannot be included in batch request: %d != %d", objc_msgSend(v15, "enableAppDistribution"), v45);
          goto LABEL_29;
        }
        v20 = [v15 platformOverride];
        v21 = v20;
        if (v9 && v20)
        {
          char v22 = [v20 isEqual:v9];

          if ((v22 & 1) == 0) {
            goto LABEL_28;
          }
        }
        else
        {

          if (v21 != v9)
          {
LABEL_28:
            v39 = NSString;
            v40 = [v15 platformOverride];
            uint64_t v38 = [v39 stringWithFormat:@"Requests with different platformOverride options cannot be included in batch request: %@ != %@", v40, v9];

            goto LABEL_29;
          }
        }
        v23 = [ASCPair alloc];
        v24 = [v15 kind];
        v25 = [v15 context];
        v26 = [(ASCPair *)v23 initWithFirst:v24 second:v25];

        id v27 = [v46 objectForKeyedSubscript:v26];
        if (!v27)
        {
          id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          [v46 setObject:v27 forKeyedSubscript:v26];
        }
        v28 = [v15 id];
        [v27 addObject:v28];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v53 objects:v57 count:16];
    }
    while (v12);
  }

  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __57__ASCLockupBatchRequest_lockupBatchRequestsFromRequests___block_invoke;
  v47[3] = &unk_1E645DCD8;
  char v52 = v45;
  id v48 = v5;
  id v49 = v44;
  id v50 = v9;
  id v51 = v29;
  id v30 = v29;
  id v31 = v9;
  id v32 = v44;
  id v33 = v5;
  [v46 enumerateKeysAndObjectsUsingBlock:v47];
  v34 = (void *)[v30 copy];

  return v34;
}

void __57__ASCLockupBatchRequest_lockupBatchRequestsFromRequests___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [ASCLockupBatchRequest alloc];
  v8 = [v6 first];
  v9 = [v6 second];

  id v10 = [(ASCLockupBatchRequest *)v7 _initWithIDs:v5 kind:v8 context:v9 clientID:*(void *)(a1 + 32) enableAppDistribution:*(unsigned __int8 *)(a1 + 64) mediaQueryParams:*(void *)(a1 + 40) platformOverride:*(void *)(a1 + 48)];
  [*(id *)(a1 + 56) addObject:v10];
}

- (ASCLockupBatchRequest)initWithIDs:(id)a3 kind:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ASCLockupBatchRequest;
  uint64_t v11 = [(ASCLockupBatchRequest *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    ids = v11->_ids;
    v11->_ids = (NSSet *)v12;

    uint64_t v14 = [v9 copy];
    kind = v11->_kind;
    v11->_kind = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    context = v11->_context;
    v11->_context = (NSString *)v16;
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
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"ids"];

  if (v8)
  {
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
    if (v9)
    {
      id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
      if (v10)
      {
        uint64_t v11 = [(ASCLockupBatchRequest *)self initWithIDs:v8 kind:v9 context:v10];
        if (v11)
        {
          uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientID"];
          clientID = v11->_clientID;
          v11->_clientID = (NSString *)v12;

          v11->_enableAppDistribution = [v4 decodeBoolForKey:@"enableAppDistribution"];
          id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          uint64_t v15 = objc_opt_class();
          id v16 = objc_msgSend(v14, "initWithObjects:", v15, objc_opt_class(), 0);
          uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"mediaQueryParams"];
          mediaQueryParams = v11->_mediaQueryParams;
          v11->_mediaQueryParams = (NSDictionary *)v17;

          uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platformOverride"];
          platformOverride = v11->_platformOverride;
          v11->_platformOverride = (NSString *)v19;
        }
        self = v11;
        v21 = self;
      }
      else
      {
        BOOL v38 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v38) {
          -[ASCLockupBatchRequest initWithCoder:](v38, v39, v40, v41, v42, v43, v44, v45);
        }
        v21 = 0;
      }
    }
    else
    {
      BOOL v30 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v30) {
        -[ASCLockupBatchRequest initWithCoder:](v30, v31, v32, v33, v34, v35, v36, v37);
      }
      v21 = 0;
    }
  }
  else
  {
    BOOL v22 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v22) {
      -[ASCLockupBatchRequest initWithCoder:](v22, v23, v24, v25, v26, v27, v28, v29);
    }
    v21 = 0;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCLockupBatchRequest *)self ids];
  [v4 encodeObject:v5 forKey:@"ids"];

  uint64_t v6 = [(ASCLockupBatchRequest *)self kind];
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

  id v5 = [(ASCLockupBatchRequest *)self kind];
  [(ASCHasher *)v3 combineObject:v5];

  uint64_t v6 = [(ASCLockupBatchRequest *)self context];
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
    id v5 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
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
        uint64_t v12 = [(ASCLockupBatchRequest *)self kind];
        uint64_t v13 = [(ASCLockupBatchRequest *)v8 kind];
        id v14 = (void *)v13;
        if (v12 && v13)
        {
          if ([v12 isEqual:v13])
          {
LABEL_15:
            uint64_t v15 = [(ASCLockupBatchRequest *)self context];
            uint64_t v16 = [(ASCLockupBatchRequest *)v8 context];
            uint64_t v17 = (void *)v16;
            if (v15 && v16)
            {
              if ([v15 isEqual:v16])
              {
LABEL_18:
                uint64_t v37 = v17;
                v18 = [(ASCLockupBatchRequest *)self clientID];
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
                  BOOL v21 = [(ASCLockupBatchRequest *)self enableAppDistribution];
                  if (v21 != [(ASCLockupBatchRequest *)v8 enableAppDistribution])
                  {
                    BOOL v7 = 0;
LABEL_43:
                    v20 = v36;
                    goto LABEL_44;
                  }
                  BOOL v22 = [(ASCLockupBatchRequest *)self mediaQueryParams];
                  uint64_t v23 = [(ASCLockupBatchRequest *)v8 mediaQueryParams];
                  uint64_t v24 = (void *)v23;
                  if (v22 && v23)
                  {
                    uint64_t v25 = (void *)v23;
                    int v26 = [v22 isEqual:v23];
                    uint64_t v24 = v25;
                    v18 = v34;
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
                    uint64_t v29 = (void *)v28;
                    uint64_t v35 = v27;
                    if (v27 && v28)
                    {
                      uint64_t v32 = (void *)v28;
                      char v30 = [v27 isEqual:v28];
                      uint64_t v29 = v32;
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

                uint64_t v17 = v37;
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

  id v5 = [(ASCLockupBatchRequest *)self kind];
  [(ASCDescriber *)v3 addObject:v5 withName:@"kind"];

  uint64_t v6 = [(ASCLockupBatchRequest *)self context];
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
  uint64_t v12 = [(ASCDescriber *)v3 finalizeDescription];

  return v12;
}

- (NSArray)requests
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v4 = [(ASCLockupBatchRequest *)self ids];
  id v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(ASCLockupBatchRequest *)self ids];
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = [ASCLockupRequest alloc];
        uint64_t v12 = [(ASCLockupBatchRequest *)self kind];
        uint64_t v13 = [(ASCLockupBatchRequest *)self context];
        id v14 = [(ASCLockupBatchRequest *)self clientID];
        id v15 = [(ASCLockupRequest *)v11 _initWithID:v10 kind:v12 context:v13 clientID:v14 enableAppDistribution:[(ASCLockupBatchRequest *)self enableAppDistribution]];

        uint64_t v16 = [(ASCLockupBatchRequest *)self mediaQueryParams];

        if (v16)
        {
          uint64_t v17 = [(ASCLockupBatchRequest *)self mediaQueryParams];
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
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  BOOL v22 = (void *)[v5 copy];

  return (NSArray *)v22;
}

- (ASCLockupBatchRequest)lockupBatchRequestWithIDs:(id)a3
{
  id v4 = a3;
  id v5 = [ASCLockupBatchRequest alloc];
  uint64_t v6 = [(ASCLockupBatchRequest *)self kind];
  uint64_t v7 = [(ASCLockupBatchRequest *)self context];
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

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end