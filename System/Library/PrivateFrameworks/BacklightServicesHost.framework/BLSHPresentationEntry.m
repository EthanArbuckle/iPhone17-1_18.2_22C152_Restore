@interface BLSHPresentationEntry
- (BLSHBacklightSceneHostEnvironment)environment;
- (BLSHEnvironmentDateSpecifier)currentSpecifier;
- (BLSHPresentationEntry)initWithEnvironment:(id)a3 userObject:(id)a4;
- (BOOL)isEqual:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)userObject;
- (unint64_t)hash;
- (void)setUserObject:(id)a3;
@end

@implementation BLSHPresentationEntry

- (BLSHPresentationEntry)initWithEnvironment:(id)a3 userObject:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BLSHPresentationEntry;
  v9 = [(BLSHPresentationEntry *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_environment, a3);
    objc_storeStrong(&v10->_userObject, a4);
  }

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = NSString;
  environment = self->_environment;
  v6 = [(BLSHBacklightSceneHostEnvironment *)environment identifier];
  id v7 = [v4 stringWithFormat:@"<%p:%@>", environment, v6];
  [v3 appendString:v7 withName:@"environment"];

  if (!self->_userObject) {
    [v3 appendString:@"<nil>" withName:@"userObject"];
  }
  id v8 = [v3 build];

  return v8;
}

- (id)debugDescription
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_environment withName:@"environment"];
  id v5 = (id)[v3 appendObject:self->_userObject withName:@"userObject"];
  v6 = [v3 build];

  return v6;
}

- (unint64_t)hash
{
  return [(BLSHBacklightSceneHostEnvironment *)self->_environment hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    environment = self->_environment;
    v6 = [v4 environment];
    char v7 = [(BLSHBacklightSceneHostEnvironment *)environment isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BLSHEnvironmentDateSpecifier)currentSpecifier
{
  v3 = [(BLSHBacklightSceneHostEnvironment *)self->_environment presentationDate];
  if (v3)
  {
    id v4 = [(BLSHBacklightSceneHostEnvironment *)self->_environment visualState];
    id v5 = +[BLSHEnvironmentDateSpecifier specifierWithPresentationDate:fidelity:environment:](BLSHEnvironmentDateSpecifier, "specifierWithPresentationDate:fidelity:environment:", v3, [v4 updateFidelity], self->_environment);
  }
  else
  {
    id v5 = 0;
  }

  return (BLSHEnvironmentDateSpecifier *)v5;
}

- (BLSHBacklightSceneHostEnvironment)environment
{
  return self->_environment;
}

- (id)userObject
{
  return self->_userObject;
}

- (void)setUserObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userObject, 0);

  objc_storeStrong((id *)&self->_environment, 0);
}

@end