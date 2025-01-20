@interface LNQueryRequestParameterTarget
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNActionMetadata)actionMetadata;
- (LNQueryRequestParameterTarget)initWithActionMetadata:(id)a3 parameterIdentifier:(id)a4;
- (LNQueryRequestParameterTarget)initWithActionMetadata:(id)a3 parameterIndex:(int64_t)a4;
- (LNQueryRequestParameterTarget)initWithCoder:(id)a3;
- (NSString)parameterIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNQueryRequestParameterTarget

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterIdentifier, 0);
  objc_storeStrong((id *)&self->_actionMetadata, 0);
}

- (NSString)parameterIdentifier
{
  return self->_parameterIdentifier;
}

- (LNActionMetadata)actionMetadata
{
  return self->_actionMetadata;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNQueryRequestParameterTarget *)a3;
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
    v7 = [(LNQueryRequestParameterTarget *)self actionMetadata];
    v8 = [(LNQueryRequestParameterTarget *)v6 actionMetadata];
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
      int v12 = [v9 isEqual:v10];

      if (!v12) {
        goto LABEL_19;
      }
    }
    v15 = [(LNQueryRequestParameterTarget *)self parameterIdentifier];
    v16 = [(LNQueryRequestParameterTarget *)v6 parameterIdentifier];
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
        LOBYTE(v12) = [v14 isEqualToString:v17];
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
  uint64_t v3 = [(LNActionMetadata *)self->_actionMetadata hash];
  return [(NSString *)self->_parameterIdentifier hash] & v3;
}

- (LNQueryRequestParameterTarget)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionMetadata"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterIdentifier"];

  v7 = [(LNQueryRequestParameterTarget *)self initWithActionMetadata:v5 parameterIdentifier:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNQueryRequestParameterTarget *)self actionMetadata];
  [v4 encodeObject:v5 forKey:@"actionMetadata"];

  id v6 = [(LNQueryRequestParameterTarget *)self parameterIdentifier];
  [v4 encodeObject:v6 forKey:@"parameterIdentifier"];
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(LNQueryRequestParameterTarget *)self actionMetadata];
  v5 = [v4 identifier];
  id v6 = [(LNQueryRequestParameterTarget *)self parameterIdentifier];
  v7 = [v3 stringWithFormat:@"Parameter <%@:%@>", v5, v6];

  return v7;
}

- (LNQueryRequestParameterTarget)initWithActionMetadata:(id)a3 parameterIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LNQueryRequestParameterTarget;
  id v9 = [(LNQueryRequestTargetBase *)&v13 _init];
  id v10 = (LNQueryRequestParameterTarget *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a3);
    objc_storeStrong((id *)&v10->_parameterIdentifier, a4);
    v11 = v10;
  }

  return v10;
}

- (LNQueryRequestParameterTarget)initWithActionMetadata:(id)a3 parameterIndex:(int64_t)a4
{
  actionMetadata = self->_actionMetadata;
  id v7 = [a3 parameters];
  id v8 = [v7 objectAtIndex:a4];
  id v9 = [v8 name];
  id v10 = [(LNQueryRequestParameterTarget *)self initWithActionMetadata:actionMetadata parameterIdentifier:v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end