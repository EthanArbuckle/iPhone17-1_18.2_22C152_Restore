@interface HMFPairingIdentity(AppleMediaAccessory)
- (id)pbData;
- (id)protoPayload;
- (void)initWithProtoData:()AppleMediaAccessory;
@end

@implementation HMFPairingIdentity(AppleMediaAccessory)

- (id)pbData
{
  v1 = [a1 protoPayload];
  v2 = [v1 data];

  return v2;
}

- (id)protoPayload
{
  id v2 = objc_alloc_init(MEMORY[0x263F0DFE0]);
  v3 = [a1 identifier];
  [v2 setIdentifier:v3];

  v4 = [a1 publicKey];
  v5 = [v4 data];
  [v2 setPublicPairingKeyData:v5];

  return v2;
}

- (void)initWithProtoData:()AppleMediaAccessory
{
  v4 = (objc_class *)MEMORY[0x263F0DFE0];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithData:v5];

  if (!v6) {
    goto LABEL_5;
  }
  v7 = [v6 identifier];
  if (v7)
  {
    v8 = [v6 publicPairingKeyData];

    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x263F425F0]);
      v10 = [v6 publicPairingKeyData];
      v11 = (void *)[v9 initWithPairingKeyData:v10];

      v12 = [v6 identifier];
      a1 = (id)[a1 initWithIdentifier:v12 publicKey:v11 privateKey:0];

      v7 = a1;
      goto LABEL_6;
    }
LABEL_5:
    v7 = 0;
  }
LABEL_6:

  return v7;
}

@end