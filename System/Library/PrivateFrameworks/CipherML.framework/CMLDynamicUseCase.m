@interface CMLDynamicUseCase
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDynamicUseCase:(id)a3;
- (CMLDynamicUseCase)initWithCoder:(id)a3;
- (CMLDynamicUseCase)initWithGroup:(id)a3 useCase:(id)a4 config:(id)a5 networkManager:(id)a6;
- (CMLNetworkManager)networkManager;
- (CMLUseCaseConfig)config;
- (NSString)group;
- (NSString)useCase;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)registerWithCompletionHandler:(id)a3;
@end

@implementation CMLDynamicUseCase

- (CMLDynamicUseCase)initWithGroup:(id)a3 useCase:(id)a4 config:(id)a5 networkManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CMLDynamicUseCase;
  v15 = [(CMLDynamicUseCase *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_group, a3);
    objc_storeStrong((id *)&v16->_useCase, a4);
    objc_storeStrong((id *)&v16->_config, a5);
    objc_storeStrong((id *)&v16->_networkManager, a6);
  }

  return v16;
}

- (void)registerWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, id))a3;
  v5 = +[CMLUseCaseGroupManager sharedManager];
  id v20 = 0;
  v6 = [v5 listUseCaseGroupsWithError:&v20];
  id v7 = v20;
  if (v6)
  {
    v8 = [(CMLDynamicUseCase *)self group];
    v9 = [v6 objectForKeyedSubscript:v8];
    v10 = [v9 useCases];
    id v11 = (void *)[v10 mutableCopy];

    if (!v11) {
      id v11 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
    }
    id v12 = [(CMLDynamicUseCase *)self config];
    id v13 = [(CMLDynamicUseCase *)self useCase];
    [v11 setObject:v12 forKeyedSubscript:v13];

    id v14 = [CMLUseCaseGroup alloc];
    v15 = [(CMLDynamicUseCase *)self networkManager];
    v16 = [(CMLUseCaseGroup *)v14 initWithUseCases:v11 networkConfig:v15];

    v17 = [(CMLDynamicUseCase *)self group];
    id v19 = v7;
    [v5 configureGroupWithName:v17 useCaseGroup:v16 error:&v19];
    id v18 = v19;

    v4[2](v4, v18);
    id v7 = v18;
  }
  else
  {
    v4[2](v4, v7);
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CMLDynamicUseCase *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CMLDynamicUseCase *)self isEqualToDynamicUseCase:v5];

  return v6;
}

- (BOOL)isEqualToDynamicUseCase:(id)a3
{
  id v4 = a3;
  v5 = [(CMLDynamicUseCase *)self group];
  BOOL v6 = [v4 group];
  if ([v5 isEqual:v6])
  {
    id v7 = [(CMLDynamicUseCase *)self useCase];
    v8 = [v4 useCase];
    if ([v7 isEqual:v8])
    {
      v9 = [(CMLDynamicUseCase *)self config];
      v10 = [v4 config];
      if ([v9 isEqual:v10])
      {
        id v11 = [(CMLDynamicUseCase *)self networkManager];
        id v12 = [v4 networkManager];
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

  return v13;
}

- (unint64_t)hash
{
  v3 = [(CMLDynamicUseCase *)self group];
  uint64_t v4 = [v3 hash];
  v5 = [(CMLDynamicUseCase *)self useCase];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(CMLDynamicUseCase *)self config];
  uint64_t v8 = [v7 hash];
  v9 = [(CMLDynamicUseCase *)self networkManager];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLDynamicUseCase)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"group"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"useCase"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"config"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkManager"];

  v9 = [(CMLDynamicUseCase *)self initWithGroup:v5 useCase:v6 config:v7 networkManager:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CMLDynamicUseCase *)self group];
  [v4 encodeObject:v5 forKey:@"group"];

  uint64_t v6 = [(CMLDynamicUseCase *)self useCase];
  [v4 encodeObject:v6 forKey:@"useCase"];

  id v7 = [(CMLDynamicUseCase *)self config];
  [v4 encodeObject:v7 forKey:@"config"];

  id v8 = [(CMLDynamicUseCase *)self networkManager];
  [v4 encodeObject:v8 forKey:@"networkManager"];
}

- (NSString)group
{
  return self->_group;
}

- (NSString)useCase
{
  return self->_useCase;
}

- (CMLUseCaseConfig)config
{
  return self->_config;
}

- (CMLNetworkManager)networkManager
{
  return self->_networkManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkManager, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end