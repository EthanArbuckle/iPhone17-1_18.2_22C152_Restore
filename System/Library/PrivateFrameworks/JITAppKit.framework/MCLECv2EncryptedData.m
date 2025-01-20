@interface MCLECv2EncryptedData
- (MCLECv2EncryptedData)init;
- (NSString)ephemeralPublicKey;
- (NSString)gcmEncryptedData;
- (NSString)gcmTag;
@end

@implementation MCLECv2EncryptedData

- (NSString)ephemeralPublicKey
{
  v2 = self;
  sub_2291180D4();

  id v5 = (id)sub_22912B778();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSString)gcmEncryptedData
{
  v2 = self;
  sub_22911819C();

  id v5 = (id)sub_22912B778();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSString)gcmTag
{
  v2 = self;
  sub_229118264();

  id v5 = (id)sub_22912B778();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (MCLECv2EncryptedData)init
{
  return (MCLECv2EncryptedData *)MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData.init()();
}

- (void).cxx_destruct
{
}

@end