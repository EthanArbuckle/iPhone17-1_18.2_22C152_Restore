@interface ASCCollectionRequest
+ (BOOL)supportsSecureCoding;
+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 limit:(int64_t)a6 clientID:(id)a7;
- (ASCCollectionRequest)initWithCoder:(id)a3;
- (ASCCollectionRequest)initWithID:(id)a3 kind:(id)a4 context:(id)a5 limit:(int64_t)a6;
- (BOOL)isEqual:(id)a3;
- (NSString)clientID;
- (NSString)context;
- (NSString)id;
- (NSString)kind;
- (id)_collectionRequestWithClientID:(id)a3;
- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 limit:(int64_t)a6 clientID:(id)a7;
- (id)description;
- (int64_t)limit;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCCollectionRequest

- (ASCCollectionRequest)initWithID:(id)a3 kind:(id)a4 context:(id)a5 limit:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v21.receiver = self;
  v21.super_class = (Class)ASCCollectionRequest;
  v13 = [(ASCCollectionRequest *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    id = v13->_id;
    v13->_id = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    kind = v13->_kind;
    v13->_kind = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    context = v13->_context;
    v13->_context = (NSString *)v18;

    v13->_limit = a6;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCCollectionRequest)initWithCoder:(id)a3
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
        v8 = -[ASCCollectionRequest initWithID:kind:context:limit:](self, "initWithID:kind:context:limit:", v5, v6, v7, [v4 decodeIntegerForKey:@"limit"]);
        if (v8)
        {
          uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientID"];
          clientID = v8->_clientID;
          v8->_clientID = (NSString *)v9;
        }
        self = v8;
        id v11 = self;
      }
      else
      {
        BOOL v28 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v28) {
          -[ASCCollectionRequest initWithCoder:](v28, v29, v30, v31, v32, v33, v34, v35);
        }
        id v11 = 0;
      }
    }
    else
    {
      BOOL v20 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v20) {
        -[ASCCollectionRequest initWithCoder:](v20, v21, v22, v23, v24, v25, v26, v27);
      }
      id v11 = 0;
    }
  }
  else
  {
    BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v12) {
      -[ASCCollectionRequest initWithCoder:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    id v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASCCollectionRequest *)self id];
  [v4 encodeObject:v5 forKey:@"id"];

  v6 = [(ASCCollectionRequest *)self kind];
  [v4 encodeObject:v6 forKey:@"kind"];

  v7 = [(ASCCollectionRequest *)self context];
  [v4 encodeObject:v7 forKey:@"context"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASCCollectionRequest limit](self, "limit"), @"limit");
  id v8 = [(ASCCollectionRequest *)self clientID];
  [v4 encodeObject:v8 forKey:@"clientID"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCCollectionRequest *)self id];
  [(ASCHasher *)v3 combineObject:v4];

  v5 = [(ASCCollectionRequest *)self kind];
  [(ASCHasher *)v3 combineObject:v5];

  v6 = [(ASCCollectionRequest *)self context];
  [(ASCHasher *)v3 combineObject:v6];

  [(ASCHasher *)v3 combineInteger:[(ASCCollectionRequest *)self limit]];
  v7 = [(ASCCollectionRequest *)self clientID];
  [(ASCHasher *)v3 combineObject:v7];

  unint64_t v8 = [(ASCHasher *)v3 finalizeHash];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCCollectionRequest *)a3;
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
    unint64_t v8 = v6;

    if (!v8)
    {
      char v7 = 0;
LABEL_35:

      goto LABEL_36;
    }
    uint64_t v9 = [(ASCCollectionRequest *)self id];
    uint64_t v10 = [(ASCCollectionRequest *)v8 id];
    id v11 = (void *)v10;
    if (v9 && v10)
    {
      if ([v9 isEqual:v10])
      {
LABEL_12:
        BOOL v12 = [(ASCCollectionRequest *)self kind];
        uint64_t v13 = [(ASCCollectionRequest *)v8 kind];
        uint64_t v14 = (void *)v13;
        if (v12 && v13)
        {
          if ([v12 isEqual:v13])
          {
LABEL_15:
            uint64_t v15 = [(ASCCollectionRequest *)self context];
            uint64_t v16 = [(ASCCollectionRequest *)v8 context];
            uint64_t v17 = (void *)v16;
            if (v15 && v16)
            {
              if (![v15 isEqual:v16]) {
                goto LABEL_29;
              }
            }
            else if (v15 != (void *)v16)
            {
              goto LABEL_29;
            }
            int64_t v18 = [(ASCCollectionRequest *)self limit];
            if (v18 == [(ASCCollectionRequest *)v8 limit])
            {
              uint64_t v19 = [(ASCCollectionRequest *)self clientID];
              uint64_t v20 = [(ASCCollectionRequest *)v8 clientID];
              uint64_t v21 = (void *)v20;
              uint64_t v23 = v19;
              if (v19 && v20) {
                char v7 = [v19 isEqual:v20];
              }
              else {
                char v7 = v19 == (void *)v20;
              }

              goto LABEL_32;
            }
LABEL_29:
            char v7 = 0;
LABEL_32:

            goto LABEL_33;
          }
        }
        else if (v12 == (void *)v13)
        {
          goto LABEL_15;
        }
        char v7 = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    else if (v9 == (void *)v10)
    {
      goto LABEL_12;
    }
    char v7 = 0;
LABEL_34:

    goto LABEL_35;
  }
  char v7 = 1;
LABEL_36:

  return v7;
}

- (id)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCCollectionRequest *)self id];
  [(ASCDescriber *)v3 addObject:v4 withName:@"id"];

  v5 = [(ASCCollectionRequest *)self kind];
  [(ASCDescriber *)v3 addObject:v5 withName:@"kind"];

  v6 = [(ASCCollectionRequest *)self context];
  [(ASCDescriber *)v3 addObject:v6 withName:@"context"];

  [(ASCDescriber *)v3 addInteger:[(ASCCollectionRequest *)self limit] withName:@"limit"];
  char v7 = [(ASCCollectionRequest *)self clientID];
  [(ASCDescriber *)v3 addObject:v7 withName:@"clientID"];

  unint64_t v8 = [(ASCDescriber *)v3 finalizeDescription];

  return v8;
}

- (id)_collectionRequestWithClientID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(ASCCollectionRequest *)self id];
  char v7 = [(ASCCollectionRequest *)self kind];
  unint64_t v8 = [(ASCCollectionRequest *)self context];
  uint64_t v9 = objc_msgSend(v5, "initWithID:kind:context:limit:", v6, v7, v8, -[ASCCollectionRequest limit](self, "limit"));

  uint64_t v10 = (void *)v9[5];
  v9[5] = v4;

  return v9;
}

- (NSString)id
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

- (int64_t)limit
{
  return self->_limit;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_kind, 0);

  objc_storeStrong((id *)&self->_id, 0);
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 limit:(int64_t)a6 clientID:(id)a7
{
  id v12 = a7;
  uint64_t v13 = [(ASCCollectionRequest *)self initWithID:a3 kind:a4 context:a5 limit:a6];
  uint64_t v14 = [(ASCCollectionRequest *)v13 collectionRequestWithClientID:v12];

  return v14;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 limit:(int64_t)a6 clientID:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [[ASCCollectionRequest alloc] _initWithID:v14 kind:v13 context:v12 limit:a6 clientID:v11];

  return v15;
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