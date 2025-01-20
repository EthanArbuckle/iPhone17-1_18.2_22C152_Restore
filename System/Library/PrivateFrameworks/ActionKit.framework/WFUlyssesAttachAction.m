@interface WFUlyssesAttachAction
- (BOOL)inputPassthrough;
- (BOOL)inputRequired;
- (id)attachmentType;
- (id)contentDestinationWithError:(id *)a3;
- (id)inputContentClasses;
@end

@implementation WFUlyssesAttachAction

- (id)contentDestinationWithError:(id *)a3
{
  v3 = (void *)MEMORY[0x263F33708];
  v4 = [(WFInterchangeAction *)self appDescriptor];
  v5 = [v3 locationWithAppDescriptor:v4];

  return v5;
}

- (BOOL)inputRequired
{
  v3 = [(WFUlyssesAttachAction *)self attachmentType];
  if ([v3 isEqualToString:@"Keywords"])
  {
    BOOL v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFUlyssesAttachAction;
    BOOL v4 = [(WFInterchangeAction *)&v6 inputRequired];
  }

  return v4;
}

- (BOOL)inputPassthrough
{
  v2 = [(WFUlyssesAttachAction *)self attachmentType];
  char v3 = [v2 isEqualToString:@"Keywords"];

  return v3;
}

- (id)inputContentClasses
{
  v10[1] = *MEMORY[0x263EF8340];
  v2 = [(WFUlyssesAttachAction *)self attachmentType];
  if ([v2 isEqualToString:@"Keywords"])
  {
    char v3 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    if ([v2 isEqualToString:@"Image"])
    {
      v10[0] = objc_opt_class();
      BOOL v4 = (void *)MEMORY[0x263EFF8C0];
      v5 = v10;
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      BOOL v4 = (void *)MEMORY[0x263EFF8C0];
      v5 = &v8;
      uint64_t v6 = 2;
    }
    char v3 = objc_msgSend(v4, "arrayWithObjects:count:", v5, v6, v8, v9, v10[0]);
  }

  return v3;
}

- (id)attachmentType
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(WFUlyssesAttachAction *)self parameterStateForKey:@"UlyssesAttachmentType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = [v2 value];
    uint64_t v4 = objc_opt_class();
    id v5 = v3;
    if (v5 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = getWFGeneralLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        int v10 = 136315906;
        v11 = "WFEnforceClass";
        __int16 v12 = 2114;
        id v13 = v5;
        __int16 v14 = 2114;
        id v15 = (id)objc_opt_class();
        __int16 v16 = 2114;
        uint64_t v17 = v4;
        id v8 = v15;
        _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v10, 0x2Au);
      }
      id v6 = 0;
    }
    else
    {
      id v6 = v5;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v2 string];
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

@end