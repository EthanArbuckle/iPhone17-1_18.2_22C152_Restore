@interface DACUnknownActivityPolicy
+ (BOOL)supportsSecureCoding;
+ (id)audioPolicyWithOptions:(unint64_t)a3 audioSessionCategory:(id)a4 audioSessionMode:(id)a5 audioSessionOptions:(unint64_t)a6;
+ (id)audioPolicyWithOptions:(unint64_t)a3 audioSessionCategory:(id)a4 audioSessionMode:(id)a5 audioSessionOptions:(unint64_t)a6 audioSessionRouteSharingPolicy:(unint64_t)a7;
+ (id)policyWithOptions:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (DACUnknownActivityPolicy)initWithCoder:(id)a3;
- (NSString)audioSessionCategory;
- (NSString)audioSessionMode;
- (id)description;
- (unint64_t)audioSessionOptions;
- (unint64_t)audioSessionRouteSharingPolicy;
- (unint64_t)options;
- (void)_initWithOptions:(void *)a3 audioSessionCategory:(void *)a4 audioSessionMode:(uint64_t)a5 audioSessionOptions:(uint64_t)a6 audioSessionRouteSharingPolicy:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DACUnknownActivityPolicy

+ (id)policyWithOptions:(unint64_t)a3
{
  v3 = -[DACUnknownActivityPolicy _initWithOptions:audioSessionCategory:audioSessionMode:audioSessionOptions:audioSessionRouteSharingPolicy:]([DACUnknownActivityPolicy alloc], a3, 0, 0, 0, 0);

  return v3;
}

- (void)_initWithOptions:(void *)a3 audioSessionCategory:(void *)a4 audioSessionMode:(uint64_t)a5 audioSessionOptions:(uint64_t)a6 audioSessionRouteSharingPolicy:
{
  id v11 = a3;
  id v12 = a4;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)DACUnknownActivityPolicy;
    v13 = objc_msgSendSuper2(&v19, sel_init);
    a1 = v13;
    if (v13)
    {
      v13[1] = a2;
      uint64_t v14 = [v11 copy];
      v15 = (void *)a1[2];
      a1[2] = v14;

      uint64_t v16 = [v12 copy];
      v17 = (void *)a1[3];
      a1[3] = v16;

      a1[4] = a5;
      a1[5] = a6;
    }
  }

  return a1;
}

+ (id)audioPolicyWithOptions:(unint64_t)a3 audioSessionCategory:(id)a4 audioSessionMode:(id)a5 audioSessionOptions:(unint64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = -[DACUnknownActivityPolicy _initWithOptions:audioSessionCategory:audioSessionMode:audioSessionOptions:audioSessionRouteSharingPolicy:]([DACUnknownActivityPolicy alloc], a3 | 8, v10, v9, a6, 0);

  return v11;
}

+ (id)audioPolicyWithOptions:(unint64_t)a3 audioSessionCategory:(id)a4 audioSessionMode:(id)a5 audioSessionOptions:(unint64_t)a6 audioSessionRouteSharingPolicy:(unint64_t)a7
{
  id v11 = a5;
  id v12 = a4;
  v13 = -[DACUnknownActivityPolicy _initWithOptions:audioSessionCategory:audioSessionMode:audioSessionOptions:audioSessionRouteSharingPolicy:]([DACUnknownActivityPolicy alloc], a3 | 8, v12, v11, a6, a7);

  return v13;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(DACUnknownActivityPolicy *)self options];
  v7 = [(DACUnknownActivityPolicy *)self audioSessionCategory];
  v8 = [(DACUnknownActivityPolicy *)self audioSessionMode];
  id v9 = [v3 stringWithFormat:@"<%@: %p, %lu audio(%@/%@/%lu/%lu)>", v5, self, v6, v7, v8, -[DACUnknownActivityPolicy audioSessionOptions](self, "audioSessionOptions"), -[DACUnknownActivityPolicy audioSessionRouteSharingPolicy](self, "audioSessionRouteSharingPolicy")];

  return v9;
}

- (DACUnknownActivityPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeIntegerForKey:@"version"] < 1)
  {
    id v12 = 0;
  }
  else
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"options"];
    uint64_t v6 = [(DACUnknownActivityPolicy *)v5 unsignedIntegerValue];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audioSessionCategory"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audioSessionMode"];
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audioSessionOptions"];
    uint64_t v10 = [v9 unsignedIntegerValue];
    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audioSessionRouteSharingPolicy"];
    id v12 = (DACUnknownActivityPolicy *)-[DACUnknownActivityPolicy _initWithOptions:audioSessionCategory:audioSessionMode:audioSessionOptions:audioSessionRouteSharingPolicy:](self, v6, v7, v8, v10, [v11 unsignedIntegerValue]);

    self = v5;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:1 forKey:@"version"];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DACUnknownActivityPolicy options](self, "options"));
  [v4 encodeObject:v5 forKey:@"options"];

  uint64_t v6 = [(DACUnknownActivityPolicy *)self audioSessionCategory];
  [v4 encodeObject:v6 forKey:@"audioSessionCategory"];

  v7 = [(DACUnknownActivityPolicy *)self audioSessionMode];
  [v4 encodeObject:v7 forKey:@"audioSessionMode"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DACUnknownActivityPolicy audioSessionOptions](self, "audioSessionOptions"));
  [v4 encodeObject:v8 forKey:@"audioSessionOptions"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DACUnknownActivityPolicy audioSessionRouteSharingPolicy](self, "audioSessionRouteSharingPolicy"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"audioSessionRouteSharingPolicy"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v9 = (DACUnknownActivityPolicy *)a3;
  uint64_t v10 = v9;
  if (v9)
  {
    if (self == v9)
    {
      LOBYTE(self) = 1;
      goto LABEL_35;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
      if (self)
      {
        unint64_t v12 = [(DACUnknownActivityPolicy *)self options];
        if (v12 == [(DACUnknownActivityPolicy *)v11 options])
        {
          v13 = [(DACUnknownActivityPolicy *)self audioSessionCategory];
          if (v13
            || ([(DACUnknownActivityPolicy *)v11 audioSessionCategory],
                (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            id v4 = [(DACUnknownActivityPolicy *)self audioSessionCategory];
            v5 = [(DACUnknownActivityPolicy *)v11 audioSessionCategory];
            if (([v4 isEqual:v5] & 1) == 0)
            {

              LOBYTE(self) = 0;
              goto LABEL_31;
            }
            int v21 = 1;
          }
          else
          {
            int v21 = 0;
          }
          uint64_t v14 = [(DACUnknownActivityPolicy *)self audioSessionMode];
          if (v14
            || ([(DACUnknownActivityPolicy *)v11 audioSessionMode],
                (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v7 = [(DACUnknownActivityPolicy *)self audioSessionMode];
            v3 = [(DACUnknownActivityPolicy *)v11 audioSessionMode];
            if (([v7 isEqual:v3] & 1) == 0)
            {

              LOBYTE(self) = 0;
              if (v14) {
                goto LABEL_29;
              }
              goto LABEL_20;
            }
            v20 = v6;
            int v19 = 1;
          }
          else
          {
            v20 = v6;
            v18 = 0;
            int v19 = 0;
          }
          unint64_t v15 = [(DACUnknownActivityPolicy *)self audioSessionOptions];
          if (v15 == [(DACUnknownActivityPolicy *)v11 audioSessionOptions])
          {
            self = [(DACUnknownActivityPolicy *)self audioSessionRouteSharingPolicy];
            LOBYTE(self) = self == (DACUnknownActivityPolicy *)[(DACUnknownActivityPolicy *)v11 audioSessionRouteSharingPolicy];
            if ((v19 & 1) == 0)
            {
LABEL_28:
              uint64_t v6 = v20;
              if (v14)
              {
LABEL_29:

                if (v21)
                {
LABEL_30:
                }
LABEL_31:
                if (!v13) {

                }
                goto LABEL_34;
              }
LABEL_20:

              if ((v21 & 1) == 0) {
                goto LABEL_31;
              }
              goto LABEL_30;
            }
          }
          else
          {
            LOBYTE(self) = 0;
            if (!v19) {
              goto LABEL_28;
            }
          }

          goto LABEL_28;
        }
        LOBYTE(self) = 0;
      }
LABEL_34:

      goto LABEL_35;
    }
  }
  LOBYTE(self) = 0;
LABEL_35:

  return (char)self;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSString)audioSessionCategory
{
  return self->_audioSessionCategory;
}

- (NSString)audioSessionMode
{
  return self->_audioSessionMode;
}

- (unint64_t)audioSessionOptions
{
  return self->_audioSessionOptions;
}

- (unint64_t)audioSessionRouteSharingPolicy
{
  return self->_audioSessionRouteSharingPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSessionMode, 0);

  objc_storeStrong((id *)&self->_audioSessionCategory, 0);
}

@end