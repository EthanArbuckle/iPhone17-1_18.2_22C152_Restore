@interface MCLECv3EncryptedDataContainer
- (MCLECv3EncryptedDataContainer)init;
- (MCLECv3Params)params;
- (NSString)data;
@end

@implementation MCLECv3EncryptedDataContainer

- (NSString)data
{
  v2 = self;
  sub_22912637C();

  id v5 = (id)sub_22912B778();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (MCLECv3Params)params
{
  v2 = self;
  id v5 = sub_229126424();

  return (MCLECv3Params *)v5;
}

- (MCLECv3EncryptedDataContainer)init
{
  return (MCLECv3EncryptedDataContainer *)MCLECv3Encryption.ECV3EncryptedDataContainer.init()();
}

- (void).cxx_destruct
{
}

@end