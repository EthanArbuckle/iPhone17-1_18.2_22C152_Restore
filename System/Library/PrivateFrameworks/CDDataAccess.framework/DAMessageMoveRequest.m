@interface DAMessageMoveRequest
- (BOOL)isEqual:(id)a3;
- (NSString)fromFolder;
- (NSString)message;
- (NSString)toFolder;
- (id)context;
- (id)description;
- (id)initMoveRequestWithMessage:(id)a3 fromFolder:(id)a4 toFolder:(id)a5;
- (unint64_t)hash;
- (void)setContext:(id)a3;
- (void)setFromFolder:(id)a3;
- (void)setMessage:(id)a3;
- (void)setToFolder:(id)a3;
@end

@implementation DAMessageMoveRequest

- (id)initMoveRequestWithMessage:(id)a3 fromFolder:(id)a4 toFolder:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DAMessageMoveRequest;
  v11 = [(DAMessageMoveRequest *)&v16 init];
  if (v11)
  {
    v12 = (void *)[v8 copy];
    [(DAMessageMoveRequest *)v11 setMessage:v12];

    v13 = (void *)[v9 copy];
    [(DAMessageMoveRequest *)v11 setFromFolder:v13];

    v14 = (void *)[v10 copy];
    [(DAMessageMoveRequest *)v11 setToFolder:v14];
  }
  return v11;
}

- (unint64_t)hash
{
  id v3 = [NSString alloc];
  v4 = [(DAMessageMoveRequest *)self message];
  v5 = [(DAMessageMoveRequest *)self fromFolder];
  v6 = [(DAMessageMoveRequest *)self toFolder];
  v7 = (void *)[v3 initWithFormat:@"%@\n%@\n%@", v4, v5, v6];

  unint64_t v8 = [v7 hash];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    unint64_t v8 = [(DAMessageMoveRequest *)self message];
    id v9 = [v7 message];
    if (v8 != v9)
    {
      id v3 = [(DAMessageMoveRequest *)self message];
      v4 = [v7 message];
      if (![v3 isEqual:v4])
      {
        char v10 = 0;
        goto LABEL_17;
      }
    }
    v11 = [(DAMessageMoveRequest *)self fromFolder];
    v12 = [v7 fromFolder];
    if (v11 == v12)
    {
      v25 = v11;
    }
    else
    {
      v13 = [(DAMessageMoveRequest *)self fromFolder];
      v26 = [v7 fromFolder];
      if (!objc_msgSend(v13, "isEqual:"))
      {
        char v10 = 0;
        goto LABEL_15;
      }
      v24 = v13;
      v25 = v11;
    }
    v14 = [(DAMessageMoveRequest *)self toFolder];
    uint64_t v15 = [v7 toFolder];
    if (v14 == (void *)v15)
    {

      char v10 = 1;
    }
    else
    {
      objc_super v16 = (void *)v15;
      [(DAMessageMoveRequest *)self toFolder];
      v17 = v23 = v3;
      [v7 toFolder];
      v22 = v4;
      v18 = v9;
      v20 = v19 = v8;
      char v10 = [v17 isEqual:v20];

      unint64_t v8 = v19;
      id v9 = v18;
      v4 = v22;

      id v3 = v23;
    }
    v13 = v24;
    v11 = v25;
    if (v25 == v12)
    {
LABEL_16:

      if (v8 == v9)
      {
LABEL_18:

        goto LABEL_19;
      }
LABEL_17:

      goto LABEL_18;
    }
LABEL_15:

    goto LABEL_16;
  }
  char v10 = 0;
LABEL_19:

  return v10;
}

- (id)description
{
  id v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)DAMessageMoveRequest;
  v4 = [(DAMessageMoveRequest *)&v10 description];
  v5 = [(DAMessageMoveRequest *)self message];
  id v6 = [(DAMessageMoveRequest *)self fromFolder];
  id v7 = [(DAMessageMoveRequest *)self toFolder];
  unint64_t v8 = [v3 stringWithFormat:@"%@ message \"%@\", fromFolder \"%@\", toFolder \"%@\"", v4, v5, v6, v7];

  return v8;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)fromFolder
{
  return self->_fromFolder;
}

- (void)setFromFolder:(id)a3
{
}

- (NSString)toFolder
{
  return self->_toFolder;
}

- (void)setToFolder:(id)a3
{
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_toFolder, 0);
  objc_storeStrong((id *)&self->_fromFolder, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end