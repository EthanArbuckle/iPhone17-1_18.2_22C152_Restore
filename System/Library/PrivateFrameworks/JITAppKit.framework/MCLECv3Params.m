@interface MCLECv3Params
- (MCLECv3KeyAgreement)keyAgreement;
- (MCLECv3Params)init;
@end

@implementation MCLECv3Params

- (MCLECv3KeyAgreement)keyAgreement
{
  v2 = self;
  id v5 = sub_22912653C();

  return (MCLECv3KeyAgreement *)v5;
}

- (MCLECv3Params)init
{
  return (MCLECv3Params *)MCLECv3Encryption.ECV3EncryptedDataContainer.Params.init()();
}

- (void).cxx_destruct
{
}

@end