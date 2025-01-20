@interface FBKURLExtension
- (BOOL)isEqual:(id)a3;
- (FBKURLExtension)initWithExtensionIdentifier:(id)a3 parameters:(id)a4;
- (NSDictionary)parameters;
- (NSString)extensionIdentifier;
- (NSString)name;
- (unint64_t)hash;
- (void)setExtensionIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setParameters:(id)a3;
@end

@implementation FBKURLExtension

- (FBKURLExtension)initWithExtensionIdentifier:(id)a3 parameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FBKURLExtension;
  v9 = [(FBKURLExtension *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_extensionIdentifier, a3);
    if (v8) {
      v11 = (NSDictionary *)v8;
    }
    else {
      v11 = (NSDictionary *)MEMORY[0x263EFFA78];
    }
    parameters = v10->_parameters;
    v10->_parameters = v11;
  }
  return v10;
}

- (unint64_t)hash
{
  v2 = [(FBKURLExtension *)self extensionIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [(FBKURLExtension *)self extensionIdentifier];
    id v7 = [v5 extensionIdentifier];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void)setExtensionIdentifier:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
}

@end