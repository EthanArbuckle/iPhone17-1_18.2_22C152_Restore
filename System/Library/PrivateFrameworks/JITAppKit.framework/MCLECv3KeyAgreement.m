@interface MCLECv3KeyAgreement
- (MCLECv3KeyAgreement)init;
- (NSString)recipientFingerprint;
- (NSString)sender;
@end

@implementation MCLECv3KeyAgreement

- (NSString)sender
{
  v2 = self;
  sub_2291265F8();

  id v5 = (id)sub_22912B778();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSString)recipientFingerprint
{
  v2 = self;
  sub_2291266C0();

  id v5 = (id)sub_22912B778();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (MCLECv3KeyAgreement)init
{
  return (MCLECv3KeyAgreement *)MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement.init()();
}

- (void).cxx_destruct
{
}

@end