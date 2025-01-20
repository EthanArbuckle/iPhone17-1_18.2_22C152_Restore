@interface LNActionDescriptionIconNamed
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNActionDescriptionIconNamed)initWithCoder:(id)a3;
- (LNActionDescriptionIconNamed)initWithName:(id)a3;
- (LNActionDescriptionIconNamed)initWithName:(id)a3 bundleURL:(id)a4;
- (NSString)name;
- (NSURL)bundleURL;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNActionDescriptionIconNamed

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNActionDescriptionIconNamed *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    v7 = [(LNActionDescriptionIconNamed *)self name];
    v8 = [(LNActionDescriptionIconNamed *)v6 name];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      int v12 = [v9 isEqualToString:v10];

      if (!v12) {
        goto LABEL_19;
      }
    }
    v15 = [(LNActionDescriptionIconNamed *)self bundleURL];
    v16 = [(LNActionDescriptionIconNamed *)v6 bundleURL];
    id v14 = v15;
    id v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17) {
        LOBYTE(v12) = [v14 isEqual:v17];
      }
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(LNActionDescriptionIconNamed *)self name];
  uint64_t v4 = [v3 hash];
  v5 = [(LNActionDescriptionIconNamed *)self bundleURL];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(LNActionDescriptionIconNamed *)self name];
  v7 = [(LNActionDescriptionIconNamed *)self bundleURL];
  v8 = [v3 stringWithFormat:@"<%@: %p, name: %@, bundleURL: %@>", v5, self, v6, v7];

  return v8;
}

- (LNActionDescriptionIconNamed)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleURL"];

  if (v5)
  {
    self = [(LNActionDescriptionIconNamed *)self initWithName:v5 bundleURL:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNActionDescriptionIconNamed *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  id v6 = [(LNActionDescriptionIconNamed *)self bundleURL];
  [v4 encodeObject:v6 forKey:@"bundleURL"];
}

- (LNActionDescriptionIconNamed)initWithName:(id)a3 bundleURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"LNActionDescriptionIcon.m", 43, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)LNActionDescriptionIconNamed;
  id v9 = [(LNActionDescriptionIconNamed *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    name = v9->_name;
    v9->_name = (NSString *)v10;

    objc_storeStrong((id *)&v9->_bundleURL, a4);
    int v12 = v9;
  }

  return v9;
}

- (LNActionDescriptionIconNamed)initWithName:(id)a3
{
  return [(LNActionDescriptionIconNamed *)self initWithName:a3 bundleURL:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end