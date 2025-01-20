@interface MCLHPKEEncryptedDataContainer
- (MCLHPKEEncryptedDataContainer)init;
- (NSString)cipher;
- (NSString)encapsulatedKey;
@end

@implementation MCLHPKEEncryptedDataContainer

- (NSString)encapsulatedKey
{
  v2 = self;
  sub_229120DA8();

  id v5 = (id)sub_22912B778();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSString)cipher
{
  v2 = self;
  sub_229120E70();

  id v5 = (id)sub_22912B778();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (MCLHPKEEncryptedDataContainer)init
{
  return (MCLHPKEEncryptedDataContainer *)sub_229121038();
}

- (void).cxx_destruct
{
}

@end