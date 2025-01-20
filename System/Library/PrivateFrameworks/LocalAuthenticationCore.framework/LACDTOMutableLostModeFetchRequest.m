@interface LACDTOMutableLostModeFetchRequest
- (BOOL)isDTOEnabled;
- (BOOL)isEqual:(id)a3;
- (LACDTOBiometryWatchdogPack)biometryWatchdogPack;
- (LACDTORatchetState)ratchetState;
- (NSDictionary)options;
- (NSString)description;
- (int64_t)policy;
- (void)setBiometryWatchdogPack:(id)a3;
- (void)setIsDTOEnabled:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setPolicy:(int64_t)a3;
- (void)setRatchetState:(id)a3;
@end

@implementation LACDTOMutableLostModeFetchRequest

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_270435730])
  {
    id v5 = v4;
    int64_t v6 = [(LACDTOMutableLostModeFetchRequest *)self policy];
    if (v6 == [v5 policy])
    {
      v7 = [(LACDTOMutableLostModeFetchRequest *)self options];
      uint64_t v8 = [v5 options];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(LACDTOMutableLostModeFetchRequest *)self options];
        v11 = [v5 options];
        int v12 = [v10 isEqualToDictionary:v11];

        if (!v12) {
          goto LABEL_11;
        }
      }
      int v14 = [(LACDTOMutableLostModeFetchRequest *)self isDTOEnabled];
      if (v14 == [v5 isDTOEnabled])
      {
        v15 = [(LACDTOMutableLostModeFetchRequest *)self ratchetState];
        uint64_t v16 = [v5 ratchetState];
        if (v15 == (void *)v16)
        {
        }
        else
        {
          v17 = (void *)v16;
          v18 = [(LACDTOMutableLostModeFetchRequest *)self ratchetState];
          v19 = [v5 ratchetState];
          int v20 = [v18 isEqual:v19];

          if (!v20) {
            goto LABEL_11;
          }
        }
        v22 = [(LACDTOMutableLostModeFetchRequest *)self biometryWatchdogPack];
        uint64_t v23 = [v5 biometryWatchdogPack];
        if (v22 == (void *)v23)
        {
          char v13 = 1;
          v24 = v22;
        }
        else
        {
          v24 = (void *)v23;
          v25 = [(LACDTOMutableLostModeFetchRequest *)self biometryWatchdogPack];
          v26 = [v5 biometryWatchdogPack];
          char v13 = [v25 isEqual:v26];
        }
        goto LABEL_12;
      }
    }
LABEL_11:
    char v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  char v13 = 0;
LABEL_13:

  return v13;
}

- (NSString)description
{
  v23[5] = *MEMORY[0x263EF8340];
  v21 = NSString;
  uint64_t v20 = objc_opt_class();
  v22 = objc_msgSend(NSString, "stringWithFormat:", @"policy: %d", -[LACDTOMutableLostModeFetchRequest policy](self, "policy"));
  v23[0] = v22;
  v3 = NSString;
  id v4 = [(LACDTOMutableLostModeFetchRequest *)self options];
  id v5 = [v3 stringWithFormat:@"options: %@", v4];
  v23[1] = v5;
  int64_t v6 = NSString;
  BOOL v7 = [(LACDTOMutableLostModeFetchRequest *)self isDTOEnabled];
  uint64_t v8 = @"NO";
  if (v7) {
    uint64_t v8 = @"YES";
  }
  v9 = [v6 stringWithFormat:@"isDTOEnabled: %@", v8];
  v23[2] = v9;
  v10 = NSString;
  v11 = [(LACDTOMutableLostModeFetchRequest *)self ratchetState];
  int v12 = [v10 stringWithFormat:@"ratchetState: %@", v11];
  v23[3] = v12;
  char v13 = NSString;
  int v14 = [(LACDTOMutableLostModeFetchRequest *)self biometryWatchdogPack];
  v15 = [v13 stringWithFormat:@"biometryWatchdogPack: %@", v14];
  v23[4] = v15;
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:5];
  v17 = [v16 componentsJoinedByString:@"; "];
  v18 = [v21 stringWithFormat:@"<%@ %p; %@>", v20, self, v17];

  return (NSString *)v18;
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (BOOL)isDTOEnabled
{
  return self->_isDTOEnabled;
}

- (void)setIsDTOEnabled:(BOOL)a3
{
  self->_isDTOEnabled = a3;
}

- (LACDTORatchetState)ratchetState
{
  return self->_ratchetState;
}

- (void)setRatchetState:(id)a3
{
}

- (LACDTOBiometryWatchdogPack)biometryWatchdogPack
{
  return self->_biometryWatchdogPack;
}

- (void)setBiometryWatchdogPack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biometryWatchdogPack, 0);
  objc_storeStrong((id *)&self->_ratchetState, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end