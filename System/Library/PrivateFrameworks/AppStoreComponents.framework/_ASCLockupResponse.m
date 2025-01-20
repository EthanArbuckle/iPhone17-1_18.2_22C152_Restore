@interface _ASCLockupResponse
- (ASCLockup)lockup;
- (ASCLockupRequest)request;
- (BOOL)isEqual:(id)a3;
- (NSError)error;
- (_ASCLockupResponse)initWithRequest:(id)a3 lockup:(id)a4 error:(id)a5;
- (id)description;
- (unint64_t)hash;
@end

@implementation _ASCLockupResponse

- (_ASCLockupResponse)initWithRequest:(id)a3 lockup:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_ASCLockupResponse;
  v11 = [(_ASCLockupResponse *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    request = v11->_request;
    v11->_request = (ASCLockupRequest *)v12;

    uint64_t v14 = [v9 copy];
    lockup = v11->_lockup;
    v11->_lockup = (ASCLockup *)v14;

    uint64_t v16 = [v10 copy];
    error = v11->_error;
    v11->_error = (NSError *)v16;
  }
  return v11;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  v4 = [(_ASCLockupResponse *)self request];
  [(ASCHasher *)v3 combineObject:v4];

  v5 = [(_ASCLockupResponse *)self lockup];
  [(ASCHasher *)v3 combineObject:v5];

  v6 = [(_ASCLockupResponse *)self error];
  [(ASCHasher *)v3 combineObject:v6];

  unint64_t v7 = [(ASCHasher *)v3 finalizeHash];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
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
  id v7 = v6;

  if (v7)
  {
    id v8 = [(_ASCLockupResponse *)self request];
    uint64_t v9 = [v7 request];
    id v10 = (void *)v9;
    if (v8 && v9)
    {
      if ([v8 isEqual:v9])
      {
LABEL_10:
        v11 = [(_ASCLockupResponse *)self lockup];
        uint64_t v12 = [v7 lockup];
        v13 = (void *)v12;
        if (v11 && v12)
        {
          if ([v11 isEqual:v12]) {
            goto LABEL_13;
          }
        }
        else if (v11 == (void *)v12)
        {
LABEL_13:
          uint64_t v14 = [(_ASCLockupResponse *)self error];
          uint64_t v15 = [v7 error];
          uint64_t v16 = (void *)v15;
          if (v14 && v15) {
            char v17 = [v14 isEqual:v15];
          }
          else {
            char v17 = v14 == (void *)v15;
          }

          goto LABEL_23;
        }
        char v17 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    char v17 = 0;
LABEL_24:

    goto LABEL_25;
  }
  char v17 = 0;
LABEL_25:

  return v17;
}

- (id)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(_ASCLockupResponse *)self request];
  [(ASCDescriber *)v3 addObject:v4 withName:@"request"];

  id v5 = [(_ASCLockupResponse *)self lockup];
  [(ASCDescriber *)v3 addObject:v5 withName:@"lockup"];

  v6 = [(_ASCLockupResponse *)self error];
  [(ASCDescriber *)v3 addObject:v6 withName:@"error"];

  id v7 = [(ASCDescriber *)v3 finalizeDescription];

  return v7;
}

- (ASCLockupRequest)request
{
  return self->_request;
}

- (ASCLockup)lockup
{
  return self->_lockup;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_lockup, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end