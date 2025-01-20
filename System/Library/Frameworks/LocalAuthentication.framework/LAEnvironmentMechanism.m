@interface LAEnvironmentMechanism
- (BOOL)isEqual:(id)a3;
- (BOOL)isUsable;
- (LACEnvironmentMechanism)coreMechanism;
- (LAEnvironmentMechanism)initWithCoreMechanism:(id)a3;
- (NSString)iconSystemName;
- (NSString)localizedName;
- (id)availabilityError;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation LAEnvironmentMechanism

- (LAEnvironmentMechanism)initWithCoreMechanism:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)LAEnvironmentMechanism;
    v6 = [(LAEnvironmentMechanism *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_coreMechanism, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(LAEnvironmentMechanism *)self coreMechanism];
  v6 = (void *)[v4 initWithCoreMechanism:v5];

  return v6;
}

- (id)description
{
  v2 = [(LAEnvironmentMechanism *)self coreMechanism];
  v3 = [v2 description];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LAEnvironmentMechanism *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(LAEnvironmentMechanism *)self coreMechanism];
      v6 = [(LAEnvironmentMechanism *)v4 coreMechanism];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isUsable
{
  v2 = (void *)MEMORY[0x1E4F72F78];
  v3 = [(LAEnvironmentMechanism *)self coreMechanism];
  id v4 = [v3 availabilityError];
  LOBYTE(v2) = [v2 error:v4 hasCode:*MEMORY[0x1E4F72E70]];

  return (char)v2;
}

- (NSString)localizedName
{
  v2 = [(LAEnvironmentMechanism *)self coreMechanism];
  v3 = [v2 localizedName];

  return (NSString *)v3;
}

- (NSString)iconSystemName
{
  v2 = [(LAEnvironmentMechanism *)self coreMechanism];
  v3 = [v2 iconSystemName];

  return (NSString *)v3;
}

- (id)availabilityError
{
  v2 = [(LAEnvironmentMechanism *)self coreMechanism];
  v3 = [v2 availabilityError];

  return v3;
}

- (LACEnvironmentMechanism)coreMechanism
{
  return self->_coreMechanism;
}

- (void).cxx_destruct
{
}

@end