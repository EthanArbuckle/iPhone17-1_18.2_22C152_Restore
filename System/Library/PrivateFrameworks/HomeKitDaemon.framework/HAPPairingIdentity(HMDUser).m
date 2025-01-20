@interface HAPPairingIdentity(HMDUser)
+ (id)hmd_pairingIdentityWithDictionary:()HMDUser;
- (id)hmd_dictionaryEncoding;
@end

@implementation HAPPairingIdentity(HMDUser)

- (id)hmd_dictionaryEncoding
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  v3 = [a1 identifier];
  [v2 setObject:v3 forKeyedSubscript:@"HAP.identifier"];

  v4 = [a1 privateKey];

  if (v4)
  {
    v5 = [a1 privateKey];
    v6 = [v5 data];
    [v2 setObject:v6 forKeyedSubscript:@"HAP.privateKey"];
  }
  v7 = [a1 publicKey];

  if (v7)
  {
    v8 = [a1 publicKey];
    v9 = [v8 data];
    [v2 setObject:v9 forKeyedSubscript:@"HAP.publicKey"];
  }
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "permissions"));
  [v2 setObject:v10 forKeyedSubscript:@"HAP.permissions"];

  v11 = (void *)[v2 copy];
  return v11;
}

+ (id)hmd_pairingIdentityWithDictionary:()HMDUser
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"HAP.identifier"];
  v5 = [v3 objectForKeyedSubscript:@"HAP.privateKey"];
  if (v5) {
    v6 = (void *)[objc_alloc(MEMORY[0x263F425F0]) initWithPairingKeyData:v5];
  }
  else {
    v6 = 0;
  }
  v7 = [v3 objectForKeyedSubscript:@"HAP.publicKey"];
  if (v7) {
    v8 = (void *)[objc_alloc(MEMORY[0x263F425F0]) initWithPairingKeyData:v7];
  }
  else {
    v8 = 0;
  }
  v9 = [v3 objectForKeyedSubscript:@"HAP.permissions"];
  v10 = objc_msgSend(objc_alloc(MEMORY[0x263F35A78]), "initWithIdentifier:publicKey:privateKey:permissions:", v4, v8, v6, objc_msgSend(v9, "integerValue"));

  return v10;
}

@end