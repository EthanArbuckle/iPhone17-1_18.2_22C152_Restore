@interface LNAssistantDefinedSchemaConformance
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNAssistantDefinedSchemaConformance)initWithCoder:(id)a3;
- (LNAssistantDefinedSchemaConformance)initWithName:(id)a3 version:(id)a4;
- (NSString)name;
- (NSString)version;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNAssistantDefinedSchemaConformance

- (LNAssistantDefinedSchemaConformance)initWithName:(id)a3 version:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"LNAssistantDefinedSchemaConformance.m", 17, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"LNAssistantDefinedSchemaConformance.m", 18, @"Invalid parameter not satisfying: %@", @"version" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNAssistantDefinedSchemaConformance;
  v10 = [(LNAssistantDefinedSchemaConformance *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    name = v10->_name;
    v10->_name = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    version = v10->_version;
    v10->_version = (NSString *)v13;

    v15 = v10;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNAssistantDefinedSchemaConformance *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  id v6 = [(LNAssistantDefinedSchemaConformance *)self version];
  [v4 encodeObject:v6 forKey:@"version"];
}

- (NSString)version
{
  return self->_version;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (LNAssistantDefinedSchemaConformance)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    self = [(LNAssistantDefinedSchemaConformance *)self initWithName:v5 version:v6];
    id v8 = self;
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [(LNAssistantDefinedSchemaConformance *)self name];
  uint64_t v4 = [v3 hash];
  v5 = [(LNAssistantDefinedSchemaConformance *)self version];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (LNAssistantDefinedSchemaConformance *)a3;
  v5 = v4;
  if (self != v4)
  {
    unint64_t v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    BOOL v7 = [(LNAssistantDefinedSchemaConformance *)self name];
    id v8 = [(LNAssistantDefinedSchemaConformance *)v6 name];
    id v9 = v7;
    id v10 = v8;
    uint64_t v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      uint64_t v13 = v10;
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
    v15 = [(LNAssistantDefinedSchemaConformance *)self version];
    v16 = [(LNAssistantDefinedSchemaConformance *)v6 version];
    id v14 = v15;
    id v17 = v16;
    uint64_t v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17) {
        LOBYTE(v12) = [v14 isEqualToString:v17];
      }
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(LNAssistantDefinedSchemaConformance *)self name];
  BOOL v7 = [(LNAssistantDefinedSchemaConformance *)self version];
  id v8 = [v3 stringWithFormat:@"<%@: %p, name: %@, version: %@>", v5, self, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end