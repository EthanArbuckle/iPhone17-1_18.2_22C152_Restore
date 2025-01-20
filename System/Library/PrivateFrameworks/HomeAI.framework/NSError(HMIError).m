@interface NSError(HMIError)
+ (id)_hmiErrorWithCode:()HMIError description:reason:suggestion:underlyingError:;
+ (uint64_t)hmiErrorWithCode:()HMIError;
+ (uint64_t)hmiErrorWithCode:()HMIError description:;
+ (uint64_t)hmiErrorWithCode:()HMIError description:underlyingError:;
+ (uint64_t)hmiErrorWithCode:()HMIError underlyingError:;
+ (uint64_t)hmiPrivateErrorWithCode:()HMIError;
+ (uint64_t)hmiPrivateErrorWithCode:()HMIError description:;
+ (uint64_t)hmiPrivateErrorWithCode:()HMIError description:suggestion:underlyingError:;
+ (uint64_t)hmiPrivateErrorWithCode:()HMIError description:underlyingError:;
+ (uint64_t)hmiPrivateErrorWithCode:()HMIError underlyingError:;
@end

@implementation NSError(HMIError)

+ (id)_hmiErrorWithCode:()HMIError description:reason:suggestion:underlyingError:
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = v14;
  if (v11 || v12 || v13 || v14)
  {
    v16 = [MEMORY[0x263EFF9A0] dictionary];
    if (v11)
    {
      v17 = [MEMORY[0x263F086E0] mainBundle];
      v18 = [v17 localizedStringForKey:v11 value:&stru_26D98B6C8 table:0];
      [v16 setObject:v18 forKeyedSubscript:*MEMORY[0x263F08320]];
    }
    if (v12)
    {
      v19 = [MEMORY[0x263F086E0] mainBundle];
      v20 = [v19 localizedStringForKey:v12 value:&stru_26D98B6C8 table:0];
      [v16 setObject:v20 forKeyedSubscript:*MEMORY[0x263F08338]];
    }
    if (v13)
    {
      v21 = [MEMORY[0x263F086E0] mainBundle];
      v22 = [v21 localizedStringForKey:v13 value:&stru_26D98B6C8 table:0];
      [v16 setObject:v22 forKeyedSubscript:*MEMORY[0x263F08348]];
    }
    if (v15) {
      [v16 setObject:v15 forKeyedSubscript:*MEMORY[0x263F08608]];
    }
  }
  else
  {
    v16 = 0;
  }
  v23 = [MEMORY[0x263F087E8] errorWithDomain:@"HMIErrorDomain" code:a3 userInfo:v16];

  return v23;
}

+ (uint64_t)hmiErrorWithCode:()HMIError underlyingError:
{
  return [MEMORY[0x263F087E8] _hmiErrorWithCode:a3 description:0 reason:0 suggestion:0 underlyingError:a4];
}

+ (uint64_t)hmiErrorWithCode:()HMIError
{
  return [MEMORY[0x263F087E8] _hmiErrorWithCode:a3 description:0 reason:0 suggestion:0 underlyingError:0];
}

+ (uint64_t)hmiErrorWithCode:()HMIError description:
{
  return [MEMORY[0x263F087E8] _hmiErrorWithCode:a3 description:a4 reason:0 suggestion:0 underlyingError:0];
}

+ (uint64_t)hmiErrorWithCode:()HMIError description:underlyingError:
{
  return [MEMORY[0x263F087E8] _hmiErrorWithCode:a3 description:a4 reason:0 suggestion:0 underlyingError:a5];
}

+ (uint64_t)hmiPrivateErrorWithCode:()HMIError underlyingError:
{
  return [MEMORY[0x263F087E8] _hmiErrorWithCode:a3 description:0 reason:0 suggestion:0 underlyingError:a4];
}

+ (uint64_t)hmiPrivateErrorWithCode:()HMIError
{
  return [MEMORY[0x263F087E8] _hmiErrorWithCode:a3 description:0 reason:0 suggestion:0 underlyingError:0];
}

+ (uint64_t)hmiPrivateErrorWithCode:()HMIError description:
{
  return [MEMORY[0x263F087E8] _hmiErrorWithCode:a3 description:a4 reason:0 suggestion:0 underlyingError:0];
}

+ (uint64_t)hmiPrivateErrorWithCode:()HMIError description:underlyingError:
{
  return [MEMORY[0x263F087E8] _hmiErrorWithCode:a3 description:a4 reason:0 suggestion:0 underlyingError:a5];
}

+ (uint64_t)hmiPrivateErrorWithCode:()HMIError description:suggestion:underlyingError:
{
  return [MEMORY[0x263F087E8] _hmiErrorWithCode:a3 description:a4 reason:0 suggestion:a5 underlyingError:a6];
}

@end