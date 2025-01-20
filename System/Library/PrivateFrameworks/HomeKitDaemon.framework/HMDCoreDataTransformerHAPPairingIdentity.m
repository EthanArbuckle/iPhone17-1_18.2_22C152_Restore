@interface HMDCoreDataTransformerHAPPairingIdentity
+ (Class)valueClass;
+ (id)OPACKFromValue:(id)a3 error:(id *)a4;
+ (id)valueFromOPACK:(id)a3 error:(id *)a4;
@end

@implementation HMDCoreDataTransformerHAPPairingIdentity

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
    objc_msgSend(v7, "hmf_stringForKey:", @"i");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "hmf_dataForKey:", @"d");
    v11 = objc_msgSend(v8, "hmf_numberForKey:", @"p");
    if (!v9 || ([v10 length] ? (BOOL v12 = v11 == 0) : (BOOL v12 = 1), v12))
    {
      if (!a4)
      {
        v15 = 0;
        goto LABEL_20;
      }
      v13 = (void *)MEMORY[0x263F087E8];
      v14 = [NSString stringWithFormat:@"Failed to create HAPPairingIdentity from dictionary: %@", v8];
      [v13 hmfErrorWithCode:15 reason:v14];
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (![(__CFString *)v9 length])
      {

        v9 = @"884A90AC-D3C1-4DB2-8C1C-33D10348F452";
      }
      id v17 = objc_alloc(MEMORY[0x263F35A78]);
      v14 = (void *)[objc_alloc(MEMORY[0x263F425F0]) initWithPairingKeyData:v10];
      v15 = objc_msgSend(v17, "initWithIdentifier:publicKey:privateKey:permissions:", v9, v14, 0, objc_msgSend(v11, "unsignedIntegerValue"));
    }

LABEL_20:
    goto LABEL_21;
  }
  if (a4)
  {
    v16 = (void *)MEMORY[0x263F087E8];
    v9 = [NSString stringWithFormat:@"Expected NSDictionary value to create HAPPairingIdentity: %@", v5];
    [v16 hmfErrorWithCode:3 reason:v9];
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

    goto LABEL_22;
  }
  v15 = 0;
LABEL_22:

  return v15;
}

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  v14[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 identifier];
  id v7 = [v5 publicKey];
  v8 = [v7 data];

  if ([v6 length] && objc_msgSend(v8, "length"))
  {
    v13[0] = @"i";
    v13[1] = @"d";
    v14[0] = v6;
    v14[1] = v8;
    v13[2] = @"p";
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "permissions"));
    v14[2] = v9;
    a4 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  }
  else if (a4)
  {
    v10 = (void *)MEMORY[0x263F087E8];
    v11 = [NSString stringWithFormat:@"Invalid pairing identity: %@", v5];
    *a4 = [v10 hmfErrorWithCode:3 reason:v11];

    a4 = 0;
  }

  return a4;
}

@end