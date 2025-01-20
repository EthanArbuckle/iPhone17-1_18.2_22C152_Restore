@interface LNNLGDialog
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNDialog)fallbackDialog;
- (LNNLGDialog)initWithCoder:(id)a3;
- (LNNLGDialog)initWithNLGParams:(id)a3 options:(id)a4 fallbackDialog:(id)a5 localeIdentifier:(id)a6;
- (NSArray)nlgParams;
- (NSData)securityScopeData;
- (NSString)options;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSecurityScopeData:(id)a3;
@end

@implementation LNNLGDialog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityScopeData, 0);
  objc_storeStrong((id *)&self->_fallbackDialog, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_nlgParams, 0);
}

- (void)setSecurityScopeData:(id)a3
{
}

- (NSData)securityScopeData
{
  return self->_securityScopeData;
}

- (LNDialog)fallbackDialog
{
  return self->_fallbackDialog;
}

- (NSString)options
{
  return self->_options;
}

- (NSArray)nlgParams
{
  return self->_nlgParams;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNNLGDialog *)self nlgParams];
  [v4 encodeObject:v5 forKey:@"nlgParams"];

  v6 = [(LNNLGDialog *)self options];
  [v4 encodeObject:v6 forKey:@"options"];

  v7 = [(LNNLGDialog *)self fallbackDialog];
  [v4 encodeObject:v7 forKey:@"fallbackDialog"];

  id v8 = [(LNDialog *)self localeIdentifier];
  [v4 encodeObject:v8 forKey:@"localeIdentifier"];
}

- (LNNLGDialog)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"nlgParams"];

  if (v8)
  {
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localeIdentifier"];
    if (v9)
    {
      v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"options"];
      v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fallbackDialog"];
      self = [(LNNLGDialog *)self initWithNLGParams:v8 options:v10 fallbackDialog:v11 localeIdentifier:v9];

      v12 = self;
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(LNNLGDialog *)self nlgParams];
  v7 = [(LNNLGDialog *)self options];
  id v8 = [(LNNLGDialog *)self fallbackDialog];
  v9 = [v3 stringWithFormat:@"<%@: %p, nlgParams: %@, options: %@, fallbackDialog: %@>", v5, self, v6, v7, v8];

  return v9;
}

- (unint64_t)hash
{
  v3 = [(LNNLGDialog *)self nlgParams];
  uint64_t v4 = [v3 hash];
  v5 = [(LNNLGDialog *)self fallbackDialog];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(LNNLGDialog *)self options];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (LNNLGDialog *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    uint64_t v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(LNNLGDialog *)self nlgParams];
      unint64_t v8 = [(LNNLGDialog *)v6 nlgParams];
      if ([v7 isEqual:v8])
      {
        v9 = [(LNNLGDialog *)self options];
        v10 = [(LNNLGDialog *)v6 options];
        if ([v9 isEqual:v10])
        {
          v11 = [(LNNLGDialog *)self fallbackDialog];
          v12 = [(LNNLGDialog *)v6 fallbackDialog];
          char v13 = [v11 isEqual:v12];
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  return v13;
}

- (LNNLGDialog)initWithNLGParams:(id)a3 options:(id)a4 fallbackDialog:(id)a5 localeIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"LNNLGDialog.m", 27, @"Invalid parameter not satisfying: %@", @"nlgParams" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)LNNLGDialog;
  v15 = [(LNDialog *)&v25 initWithLocaleIdentifier:v14];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    nlgParams = v15->_nlgParams;
    v15->_nlgParams = (NSArray *)v16;

    uint64_t v18 = [v12 copy];
    options = v15->_options;
    v15->_options = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    fallbackDialog = v15->_fallbackDialog;
    v15->_fallbackDialog = (LNDialog *)v20;

    v22 = v15;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end