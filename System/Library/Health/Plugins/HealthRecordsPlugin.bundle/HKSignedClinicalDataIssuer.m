@interface HKSignedClinicalDataIssuer
+ (id)makeIssuerForRecord:(id)a3 usingRegistry:(id)a4;
+ (id)titleForTitle:(id)a3 identifier:(id)a4;
- (id)asCodableIssuerWithSyncIdentity:(id)a3;
@end

@implementation HKSignedClinicalDataIssuer

+ (id)makeIssuerForRecord:(id)a3 usingRegistry:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 issuerIdentifier];
  v9 = (void *)v8;
  v10 = &stru_1152E8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  v11 = v10;

  v12 = (char *)[v7 sourceType];
  if (v12 == (unsigned char *)&dword_0 + 1)
  {
    v13 = +[NSURL URLWithString:v11];
    v14 = [v13 URLByAppendingPathComponent:@".well-known/jwks.json"];
  }
  else
  {
    v14 = 0;
  }
  v15 = [v6 titleForIssuerWithIdentifier:v11];
  v16 = [a1 titleForTitle:v15 identifier:v11];
  id v17 = [objc_alloc((Class)HKSignedClinicalDataIssuer) initWithIdentifier:v11 title:v16 subtitle:0 wellKnownURL:v14];

  return v17;
}

+ (id)titleForTitle:(id)a3 identifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = +[HKSignedClinicalDataUtilities preferredRecordIssuerDisplayNameWithIssuerIdentifier:v6];
    if ([v8 length])
    {
      id v7 = v8;
    }
    else
    {
      v9 = +[NSURL URLWithString:v6];
      uint64_t v10 = [v9 host];
      v11 = (void *)v10;
      if (v10) {
        v12 = (void *)v10;
      }
      else {
        v12 = v6;
      }
      id v7 = v12;
    }
  }

  return v7;
}

- (id)asCodableIssuerWithSyncIdentity:(id)a3
{
  id v4 = a3;
  id v5 = [(HKSignedClinicalDataIssuer *)self identifier];
  id v6 = +[HDSignedClinicalDataIssuerEntity newCompatibleCodableSignedClinicalDataIssuerWithIdentifier:v5];

  id v7 = [(HKSignedClinicalDataIssuer *)self title];
  [v6 setTitle:v7];

  uint64_t v8 = [(HKSignedClinicalDataIssuer *)self subtitle];
  [v6 setSubtitle:v8];

  v9 = [(HKSignedClinicalDataIssuer *)self wellKnownURL];
  uint64_t v10 = [v9 absoluteString];
  [v6 setWellKnownURL:v10];

  [v6 setSyncIdentity:v4];

  return v6;
}

@end