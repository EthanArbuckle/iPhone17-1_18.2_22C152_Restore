@interface LACEnvironmentMechanismCompanion
+ (BOOL)supportsSecureCoding;
+ (id)companionForUser:(unsigned int)a3 type:(int64_t)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (LACEnvironmentMechanismCompanion)initWithAvailabilityError:(id)a3 companionType:(int64_t)a4 stateHash:(id)a5;
- (LACEnvironmentMechanismCompanion)initWithCoder:(id)a3;
- (NSData)stateHash;
- (id)descriptionDetails;
- (int64_t)companionType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LACEnvironmentMechanismCompanion

- (LACEnvironmentMechanismCompanion)initWithAvailabilityError:(id)a3 companionType:(int64_t)a4 stateHash:(id)a5
{
  id v9 = a5;
  id v10 = a3;
  v11 = NSStringFromLACCompanionType(a4);
  if (a4 == 2) {
    v12 = @"macbook";
  }
  else {
    v12 = @"questionmark";
  }
  if (a4 == 1) {
    v13 = @"applewatch";
  }
  else {
    v13 = v12;
  }
  v16.receiver = self;
  v16.super_class = (Class)LACEnvironmentMechanismCompanion;
  v14 = [(LACEnvironmentMechanism *)&v16 initWithAvailabilityError:v10 localizedName:v11 iconSystemName:v13];

  if (v14)
  {
    v14->_companionType = a4;
    objc_storeStrong((id *)&v14->_stateHash, a5);
  }

  return v14;
}

+ (id)companionForUser:(unsigned int)a3 type:(int64_t)a4 error:(id *)a5
{
  int v6 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  v8 = +[LACError errorWithCode:-1000 debugDescription:@"companions not supported"];
  id v9 = LACLogEnvironment();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v11[0] = 67109634;
    v11[1] = a3;
    __int16 v12 = 1024;
    int v13 = v6;
    __int16 v14 = 2114;
    v15 = v8;
    _os_log_error_impl(&dword_254F14000, v9, OS_LOG_TYPE_ERROR, "companionForUser:%u type:%d -> %{public}@", (uint8_t *)v11, 0x18u);
  }

  if (a5) {
    *a5 = v8;
  }

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)LACEnvironmentMechanismCompanion;
  id v4 = a3;
  [(LACEnvironmentMechanism *)&v9 encodeWithCoder:v4];
  int64_t v5 = [(LACEnvironmentMechanismCompanion *)self companionType];
  int v6 = NSStringFromSelector(sel_companionType);
  [v4 encodeInteger:v5 forKey:v6];

  v7 = [(LACEnvironmentMechanismCompanion *)self stateHash];
  v8 = NSStringFromSelector(sel_stateHash);
  [v4 encodeObject:v7 forKey:v8];
}

- (LACEnvironmentMechanismCompanion)initWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = NSStringFromSelector(sel_availabilityError);
  int v6 = [v4 decodeObjectForKey:v5];
  v7 = NSStringFromSelector(sel_companionType);
  uint64_t v8 = [v4 decodeIntegerForKey:v7];
  objc_super v9 = NSStringFromSelector(sel_stateHash);
  id v10 = [v4 decodeObjectForKey:v9];

  v11 = [(LACEnvironmentMechanismCompanion *)self initWithAvailabilityError:v6 companionType:v8 stateHash:v10];
  return v11;
}

- (id)descriptionDetails
{
  v12[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF980];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"companionType: %d", -[LACEnvironmentMechanismCompanion companionType](self, "companionType"));
  v12[0] = v4;
  int64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  int v6 = [v3 arrayWithArray:v5];

  v7 = [(LACEnvironmentMechanismCompanion *)self stateHash];

  if (v7)
  {
    uint64_t v8 = NSString;
    objc_super v9 = [(LACEnvironmentMechanismCompanion *)self stateHash];
    id v10 = [v8 stringWithFormat:@"stateHash: %@", v9];
    [v6 addObject:v10];
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LACEnvironmentMechanismCompanion *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)LACEnvironmentMechanismCompanion;
    if ([(LACEnvironmentMechanism *)&v14 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int64_t v5 = v4;
      int64_t v6 = [(LACEnvironmentMechanismCompanion *)self companionType];
      if (v6 == [(LACEnvironmentMechanismCompanion *)v5 companionType])
      {
        v7 = [(LACEnvironmentMechanismCompanion *)self stateHash];
        uint64_t v8 = [(LACEnvironmentMechanismCompanion *)v5 stateHash];
        if (v7 == (void *)v8)
        {
          char v12 = 1;
          objc_super v9 = v7;
        }
        else
        {
          objc_super v9 = (void *)v8;
          id v10 = [(LACEnvironmentMechanismCompanion *)self stateHash];
          v11 = [(LACEnvironmentMechanismCompanion *)v5 stateHash];
          char v12 = [v10 isEqualToData:v11];
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (int64_t)companionType
{
  return self->_companionType;
}

- (NSData)stateHash
{
  return self->_stateHash;
}

- (void).cxx_destruct
{
}

@end