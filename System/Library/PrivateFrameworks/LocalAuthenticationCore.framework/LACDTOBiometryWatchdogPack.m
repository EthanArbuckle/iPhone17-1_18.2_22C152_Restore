@interface LACDTOBiometryWatchdogPack
+ (BOOL)supportsSecureCoding;
+ (id)nullInstance;
- (BOOL)isBarking;
- (BOOL)isEqual:(id)a3;
- (LACDTOBiometryWatchdog)biometryWatchdogDTO;
- (LACDTOBiometryWatchdog)biometryWatchdogGlobal;
- (LACDTOBiometryWatchdogPack)initWithBiometryWatchdogGlobal:(id)a3 biometryWatchdogDTO:(id)a4;
- (LACDTOBiometryWatchdogPack)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LACDTOBiometryWatchdogPack

- (LACDTOBiometryWatchdogPack)initWithBiometryWatchdogGlobal:(id)a3 biometryWatchdogDTO:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACDTOBiometryWatchdogPack;
  v9 = [(LACDTOBiometryWatchdogPack *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_biometryWatchdogGlobal, a3);
    objc_storeStrong((id *)&v10->_biometryWatchdogDTO, a4);
  }

  return v10;
}

- (BOOL)isBarking
{
  v3 = [(LACDTOBiometryWatchdogPack *)self biometryWatchdogDTO];
  if ([v3 isBarking])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(LACDTOBiometryWatchdogPack *)self biometryWatchdogGlobal];
    char v4 = [v5 isBarking];
  }
  return v4;
}

+ (id)nullInstance
{
  v2 = [LACDTOBiometryWatchdogPack alloc];
  v3 = +[LACDTOBiometryWatchdog nullInstance];
  char v4 = +[LACDTOBiometryWatchdog nullInstance];
  v5 = [(LACDTOBiometryWatchdogPack *)v2 initWithBiometryWatchdogGlobal:v3 biometryWatchdogDTO:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LACDTOBiometryWatchdogPack *)self biometryWatchdogGlobal];
  v6 = NSStringFromSelector(sel_biometryWatchdogGlobal);
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(LACDTOBiometryWatchdogPack *)self biometryWatchdogDTO];
  id v7 = NSStringFromSelector(sel_biometryWatchdogDTO);
  [v4 encodeObject:v8 forKey:v7];
}

- (LACDTOBiometryWatchdogPack)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_biometryWatchdogGlobal);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_biometryWatchdogDTO);
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  v11 = [(LACDTOBiometryWatchdogPack *)self initWithBiometryWatchdogGlobal:v7 biometryWatchdogDTO:v10];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(LACDTOBiometryWatchdogPack *)self biometryWatchdogGlobal];
    uint64_t v7 = [v5 biometryWatchdogGlobal];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      uint64_t v8 = (void *)v7;
      v9 = [(LACDTOBiometryWatchdogPack *)self biometryWatchdogGlobal];
      v10 = [v5 biometryWatchdogGlobal];
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        char v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    v13 = [(LACDTOBiometryWatchdogPack *)self biometryWatchdogDTO];
    uint64_t v14 = [v5 biometryWatchdogDTO];
    if (v13 == (void *)v14)
    {
      char v12 = 1;
      v15 = v13;
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(LACDTOBiometryWatchdogPack *)self biometryWatchdogDTO];
      v17 = [v5 biometryWatchdogDTO];
      char v12 = [v16 isEqual:v17];
    }
    goto LABEL_11;
  }
  char v12 = 0;
LABEL_12:

  return v12;
}

- (id)description
{
  v15[2] = *MEMORY[0x263EF8340];
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = NSString;
  v6 = [(LACDTOBiometryWatchdogPack *)self biometryWatchdogGlobal];
  uint64_t v7 = [v5 stringWithFormat:@"biometryWatchdogGlobal: %@", v6];
  v15[0] = v7;
  uint64_t v8 = NSString;
  v9 = [(LACDTOBiometryWatchdogPack *)self biometryWatchdogDTO];
  v10 = [v8 stringWithFormat:@"biometryWatchdogDTO: %@", v9];
  v15[1] = v10;
  int v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  char v12 = [v11 componentsJoinedByString:@"; "];
  v13 = [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v12];

  return v13;
}

- (LACDTOBiometryWatchdog)biometryWatchdogGlobal
{
  return self->_biometryWatchdogGlobal;
}

- (LACDTOBiometryWatchdog)biometryWatchdogDTO
{
  return self->_biometryWatchdogDTO;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biometryWatchdogDTO, 0);
  objc_storeStrong((id *)&self->_biometryWatchdogGlobal, 0);
}

@end