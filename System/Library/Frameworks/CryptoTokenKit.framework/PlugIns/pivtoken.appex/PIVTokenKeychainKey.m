@interface PIVTokenKeychainKey
- (PIVTokenKeychainKey)initWithCertificate:(__SecCertificate *)a3 objectID:(id)a4 certificateID:(id)a5;
- (id)certificateID;
- (unsigned)algID;
- (unsigned)keyID;
@end

@implementation PIVTokenKeychainKey

- (PIVTokenKeychainKey)initWithCertificate:(__SecCertificate *)a3 objectID:(id)a4 certificateID:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PIVTokenKeychainKey;
  v10 = [(PIVTokenKeychainKey *)&v13 initWithCertificate:a3 objectID:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong(&v10->_certificateID, a5);
  }

  return v11;
}

- (unsigned)keyID
{
  v2 = [(PIVTokenKeychainKey *)self objectID];
  unsigned __int8 v3 = [v2 unsignedCharValue];

  return v3;
}

- (unsigned)algID
{
  unsigned __int8 v3 = [(PIVTokenKeychainKey *)self keyType];
  unsigned int v4 = [v3 isEqual:kSecAttrKeyTypeECSECPrimeRandom];

  if (v4)
  {
    id v5 = [(PIVTokenKeychainKey *)self keySizeInBits];
    if (v5 == (id)384) {
      unsigned __int8 v6 = 20;
    }
    else {
      unsigned __int8 v6 = 0;
    }
    BOOL v7 = v5 == (id)256;
    unsigned __int8 v8 = 17;
  }
  else
  {
    id v9 = [(PIVTokenKeychainKey *)self keyType];
    unsigned int v10 = [v9 isEqual:kSecAttrKeyTypeRSA];

    if (!v10) {
      return 0;
    }
    id v11 = [(PIVTokenKeychainKey *)self keySizeInBits];
    if (v11 == (id)2048) {
      unsigned __int8 v6 = 7;
    }
    else {
      unsigned __int8 v6 = 0;
    }
    BOOL v7 = v11 == (id)1024;
    unsigned __int8 v8 = 6;
  }
  if (v7) {
    return v8;
  }
  else {
    return v6;
  }
}

- (id)certificateID
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end