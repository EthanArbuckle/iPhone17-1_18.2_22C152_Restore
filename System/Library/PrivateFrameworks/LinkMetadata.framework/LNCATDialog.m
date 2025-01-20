@interface LNCATDialog
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNCATDialog)initWithCoder:(id)a3;
- (LNCATDialog)initWithIdentifier:(id)a3 templateDirectoryURL:(id)a4 parameters:(id)a5 localeIdentifier:(id)a6;
- (NSData)securityScopeData;
- (NSDictionary)parameters;
- (NSString)identifier;
- (NSURL)templateDirectoryURL;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSecurityScopeData:(id)a3;
@end

@implementation LNCATDialog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityScopeData, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_templateDirectoryURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setSecurityScopeData:(id)a3
{
}

- (NSData)securityScopeData
{
  return self->_securityScopeData;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (NSURL)templateDirectoryURL
{
  return self->_templateDirectoryURL;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)LNCATDialog;
  id v4 = a3;
  [(LNDialog *)&v10 encodeWithCoder:v4];
  v5 = [(LNCATDialog *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(LNCATDialog *)self templateDirectoryURL];
  [v4 encodeObject:v6 forKey:@"templateDirectoryURL"];

  v7 = [(LNCATDialog *)self templateDirectoryURL];
  v8 = (void *)MEMORY[0x19F39F7E0]();
  [v4 encodeObject:v8 forKey:@"securityScopeData"];

  v9 = [(LNCATDialog *)self parameters];
  [v4 encodeObject:v9 forKey:@"parameters"];
}

- (LNCATDialog)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"templateDirectoryURL"];
    if (v6)
    {
      v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"securityScopeData"];
      if (v7) {
        MEMORY[0x19F39F7D0](v6, v7);
      }
      v8 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
      v12 = [v4 decodeObjectOfClasses:v11 forKey:@"parameters"];

      if (v12)
      {
        v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localeIdentifier"];
        if (v13)
        {
          self = [(LNCATDialog *)self initWithIdentifier:v5 templateDirectoryURL:v6 parameters:v12 localeIdentifier:v13];
          v14 = self;
        }
        else
        {
          v14 = 0;
        }
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNCATDialog *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)LNCATDialog;
    if ([(LNDialog *)&v24 isEqual:v4])
    {
      v5 = v4;
      if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        LOBYTE(v11) = 0;
LABEL_29:

        goto LABEL_30;
      }
      v6 = [(LNCATDialog *)self identifier];
      v7 = [(LNCATDialog *)v5 identifier];
      id v8 = v6;
      id v9 = v7;
      uint64_t v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        LOBYTE(v11) = 0;
        v12 = v9;
        id v13 = v8;
        if (!v8 || !v9) {
          goto LABEL_27;
        }
        int v14 = [v8 isEqual:v9];

        if (!v14)
        {
          LOBYTE(v11) = 0;
LABEL_28:

          goto LABEL_29;
        }
      }
      v15 = [(LNCATDialog *)self templateDirectoryURL];
      v16 = [(LNCATDialog *)v5 templateDirectoryURL];
      id v13 = v15;
      id v17 = v16;
      v12 = v17;
      if (v13 == v17)
      {
      }
      else
      {
        LOBYTE(v11) = 0;
        v18 = v17;
        id v19 = v13;
        if (!v13 || !v17)
        {
LABEL_26:

LABEL_27:
          goto LABEL_28;
        }
        int v11 = [v13 isEqual:v17];

        if (!v11) {
          goto LABEL_27;
        }
      }
      v20 = [(LNCATDialog *)self parameters];
      v21 = [(LNCATDialog *)v5 parameters];
      id v19 = v20;
      id v22 = v21;
      v18 = v22;
      if (v19 == v22)
      {
        LOBYTE(v11) = 1;
      }
      else
      {
        LOBYTE(v11) = 0;
        if (v19 && v22) {
          LOBYTE(v11) = [v19 isEqualToDictionary:v22];
        }
      }

      goto LABEL_26;
    }
    LOBYTE(v11) = 0;
  }
LABEL_30:

  return v11;
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)LNCATDialog;
  unint64_t v3 = [(LNDialog *)&v11 hash];
  id v4 = [(LNCATDialog *)self identifier];
  uint64_t v5 = [v4 hash];
  v6 = [(LNCATDialog *)self templateDirectoryURL];
  uint64_t v7 = v5 ^ [v6 hash];
  id v8 = [(LNCATDialog *)self parameters];
  unint64_t v9 = v7 ^ [v8 hash] ^ v3;

  return v9;
}

- (LNCATDialog)initWithIdentifier:(id)a3 templateDirectoryURL:(id)a4 parameters:(id)a5 localeIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_8:
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"LNCATDialog.m", 29, @"Invalid parameter not satisfying: %@", @"templateDirectoryURL" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  objc_super v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"LNCATDialog.m", 28, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_9:
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"LNCATDialog.m", 30, @"Invalid parameter not satisfying: %@", @"parameters" object file lineNumber description];

LABEL_4:
  v27.receiver = self;
  v27.super_class = (Class)LNCATDialog;
  v15 = [(LNDialog *)&v27 initWithLocaleIdentifier:v14];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    templateDirectoryURL = v15->_templateDirectoryURL;
    v15->_templateDirectoryURL = (NSURL *)v18;

    uint64_t v20 = [v13 copy];
    parameters = v15->_parameters;
    v15->_parameters = (NSDictionary *)v20;

    id v22 = v15;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end