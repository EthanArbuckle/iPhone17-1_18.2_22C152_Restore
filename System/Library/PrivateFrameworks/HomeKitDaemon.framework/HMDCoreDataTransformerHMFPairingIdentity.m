@interface HMDCoreDataTransformerHMFPairingIdentity
+ (Class)valueClass;
+ (id)OPACKFromValue:(id)a3 error:(id *)a4;
+ (id)valueFromOPACK:(id)a3 error:(id *)a4;
@end

@implementation HMDCoreDataTransformerHMFPairingIdentity

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

+ (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "hmf_stringForKey:", @"i");
    v10 = objc_msgSend(v8, "hmf_dataForKey:", @"d");
    if ([v9 length] && objc_msgSend(v10, "length"))
    {
      id v11 = objc_alloc(MEMORY[0x263F425E8]);
      v12 = (void *)[objc_alloc(MEMORY[0x263F425F0]) initWithPairingKeyData:v10];
      v13 = (void *)[v11 initWithIdentifier:v9 publicKey:v12 privateKey:0];
    }
    else
    {
      if (!a4)
      {
        v13 = 0;
        goto LABEL_15;
      }
      v15 = (void *)MEMORY[0x263F087E8];
      v12 = [NSString stringWithFormat:@"Failed to create HMFPairingIdentity from dictionary: %@", v8];
      [v15 hmfErrorWithCode:15 reason:v12];
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_15:
    goto LABEL_16;
  }
  if (!a4)
  {
    v13 = 0;
    goto LABEL_17;
  }
  v14 = (void *)MEMORY[0x263F087E8];
  v9 = [NSString stringWithFormat:@"Expected NSDictionary value to create HMFPairingIdentity: %@", v5];
  [v14 hmfErrorWithCode:3 reason:v9];
  v13 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

LABEL_17:
  return v13;
}

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 identifier];
  id v7 = [v5 publicKey];
  v8 = [v7 data];

  if ([v6 length] && objc_msgSend(v8, "length"))
  {
    v12[0] = @"i";
    v12[1] = @"d";
    v13[0] = v6;
    v13[1] = v8;
    a4 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  }
  else if (a4)
  {
    v9 = (void *)MEMORY[0x263F087E8];
    v10 = [NSString stringWithFormat:@"Invalid pairing identity: %@", v5];
    *a4 = [v9 hmfErrorWithCode:3 reason:v10];

    a4 = 0;
  }

  return a4;
}

@end