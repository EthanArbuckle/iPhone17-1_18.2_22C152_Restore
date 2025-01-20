@interface HAPMutableKeychainItem
- (HAPMutableKeychainItem)initWithPairingIdentity:(id)a3;
@end

@implementation HAPMutableKeychainItem

- (HAPMutableKeychainItem)initWithPairingIdentity:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HAPMutableKeychainItem;
  v5 = [(HAPMutableKeychainItem *)&v19 init];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = [v4 identifier];
  [(HAPKeychainItem *)v5 setAccount:v6];

  v7 = [v4 publicKey];
  v8 = [v7 data];

  v9 = [v4 privateKey];
  v10 = [v9 data];

  id v11 = v8;
  uint64_t v12 = [v11 bytes];
  id v13 = v10;
  id v18 = 0;
  LODWORD(v12) = _serializeKeyPairToData(v12, [v13 bytes], &v18);
  id v14 = v18;
  v15 = v14;
  if (!v12)
  {
    [(HAPKeychainItem *)v5 setValueData:v14];

LABEL_5:
    v16 = v5;
    goto LABEL_6;
  }

  v16 = 0;
LABEL_6:

  return v16;
}

@end