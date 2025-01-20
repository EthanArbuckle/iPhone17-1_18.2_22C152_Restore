@interface LAEnvironmentState
- (BOOL)isEqual:(id)a3;
- (LACEnvironmentState)coreState;
- (LAEnvironmentMechanismBiometry)biometry;
- (LAEnvironmentMechanismUserPassword)userPassword;
- (LAEnvironmentState)initWithCoreState:(id)a3;
- (NSArray)allMechanisms;
- (NSArray)companions;
- (id)_descriptionParts;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation LAEnvironmentState

- (LAEnvironmentState)initWithCoreState:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)LAEnvironmentState;
  v6 = [(LAEnvironmentState *)&v33 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coreState, a3);
    v8 = [v5 biometry];
    if ([v8 biometryType])
    {
      v9 = [LAEnvironmentMechanismBiometry alloc];
      v10 = [v5 biometry];
      uint64_t v11 = [(LAEnvironmentMechanismBiometry *)v9 initWithCoreMechanism:v10];
      biometry = v7->_biometry;
      v7->_biometry = (LAEnvironmentMechanismBiometry *)v11;
    }
    else
    {
      v10 = v7->_biometry;
      v7->_biometry = 0;
    }

    v13 = [LAEnvironmentMechanismUserPassword alloc];
    v14 = [v5 userPassword];
    uint64_t v15 = [(LAEnvironmentMechanismUserPassword *)v13 initWithCoreMechanism:v14];
    userPassword = v7->_userPassword;
    v7->_userPassword = (LAEnvironmentMechanismUserPassword *)v15;

    uint64_t v17 = objc_opt_new();
    companions = v7->_companions;
    v7->_companions = (NSArray *)v17;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v19 = objc_msgSend(v5, "companions", 0);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v30;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = v7->_companions;
          v25 = [[LAEnvironmentMechanismCompanion alloc] initWithCoreMechanism:*(void *)(*((void *)&v29 + 1) + 8 * v23)];
          uint64_t v26 = [(NSArray *)v24 arrayByAddingObject:v25];
          v27 = v7->_companions;
          v7->_companions = (NSArray *)v26;

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v21);
    }
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [LAEnvironmentState alloc];
  id v5 = [(LAEnvironmentState *)self coreState];
  v6 = [(LAEnvironmentState *)v4 initWithCoreState:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LAEnvironmentState *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(LAEnvironmentState *)self biometry];
      uint64_t v7 = [(LAEnvironmentState *)v5 biometry];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        v9 = [(LAEnvironmentState *)self biometry];
        v10 = [(LAEnvironmentState *)v5 biometry];
        int v11 = [v9 isEqual:v10];

        if (!v11) {
          goto LABEL_11;
        }
      }
      v13 = [(LAEnvironmentState *)self userPassword];
      uint64_t v14 = [(LAEnvironmentState *)v5 userPassword];
      if (v13 == (void *)v14)
      {
      }
      else
      {
        uint64_t v15 = (void *)v14;
        v16 = [(LAEnvironmentState *)self userPassword];
        uint64_t v17 = [(LAEnvironmentState *)v5 userPassword];
        int v18 = [v16 isEqual:v17];

        if (!v18)
        {
LABEL_11:
          char v12 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      v19 = [(LAEnvironmentState *)self companions];
      uint64_t v20 = [(LAEnvironmentState *)v5 companions];
      if (v19 == (void *)v20)
      {
        char v12 = 1;
        uint64_t v21 = v19;
      }
      else
      {
        uint64_t v21 = (void *)v20;
        uint64_t v22 = [(LAEnvironmentState *)self companions];
        uint64_t v23 = [(LAEnvironmentState *)v5 companions];
        char v12 = [v22 isEqualToArray:v23];
      }
      goto LABEL_17;
    }
    char v12 = 0;
  }
LABEL_18:

  return v12;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(LAEnvironmentState *)self _descriptionParts];
  v6 = [v5 componentsJoinedByString:@", "];
  uint64_t v7 = [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v6];

  return v7;
}

- (id)_descriptionParts
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v4 = [(LAEnvironmentState *)self biometry];
  v12[0] = v4;
  id v5 = [(LAEnvironmentState *)self userPassword];
  v12[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v7 = [v3 arrayWithArray:v6];

  v8 = [(LAEnvironmentState *)self companions];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v10 = [(LAEnvironmentState *)self companions];
    [v7 addObject:v10];
  }

  return v7;
}

- (NSArray)allMechanisms
{
  v3 = objc_opt_new();
  uint64_t v4 = [(LAEnvironmentState *)self biometry];

  if (v4)
  {
    id v5 = [(LAEnvironmentState *)self biometry];
    [v3 addObject:v5];
  }
  v6 = [(LAEnvironmentState *)self userPassword];

  if (v6)
  {
    uint64_t v7 = [(LAEnvironmentState *)self userPassword];
    [v3 addObject:v7];
  }
  v8 = [(LAEnvironmentState *)self companions];
  [v3 addObjectsFromArray:v8];

  return (NSArray *)v3;
}

- (LAEnvironmentMechanismBiometry)biometry
{
  return self->_biometry;
}

- (LAEnvironmentMechanismUserPassword)userPassword
{
  return self->_userPassword;
}

- (NSArray)companions
{
  return self->_companions;
}

- (LACEnvironmentState)coreState
{
  return self->_coreState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreState, 0);
  objc_storeStrong((id *)&self->_companions, 0);
  objc_storeStrong((id *)&self->_userPassword, 0);

  objc_storeStrong((id *)&self->_biometry, 0);
}

@end