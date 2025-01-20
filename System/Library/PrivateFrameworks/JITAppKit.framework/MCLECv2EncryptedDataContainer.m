@interface MCLECv2EncryptedDataContainer
- (MCLECv2EncryptedData)_encryptedData;
- (MCLECv2EncryptedDataContainer)init;
- (NSString)_encryptionVersion;
- (NSString)_publicKeyHash;
- (id)toDictionary;
@end

@implementation MCLECv2EncryptedDataContainer

- (NSString)_encryptionVersion
{
  v2 = self;
  sub_229117F70();

  id v5 = (id)sub_22912B778();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (MCLECv2EncryptedData)_encryptedData
{
  v2 = self;
  id v5 = sub_229118018();

  return (MCLECv2EncryptedData *)v5;
}

- (id)toDictionary
{
  v2 = self;
  sub_2291193CC();

  id v5 = (id)sub_22912B718();
  swift_bridgeObjectRelease();
  return v5;
}

- (NSString)_publicKeyHash
{
  v2 = self;
  sub_22911994C();

  id v5 = (id)sub_22912B778();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (MCLECv2EncryptedDataContainer)init
{
  return (MCLECv2EncryptedDataContainer *)MCLECv2Encryption.ECv2EncryptedDataContainer.init()();
}

- (void).cxx_destruct
{
  sub_229111280();
}

@end