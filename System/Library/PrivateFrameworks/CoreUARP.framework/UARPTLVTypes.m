@interface UARPTLVTypes
+ (id)sharedInstance;
- (UARPAssetTag)hsModel4cc;
- (unint64_t)hsModelDownloaded;
- (unint64_t)hsModelEngineCompact;
- (unint64_t)hsModelEngineNormal;
- (unint64_t)hsModelFallback;
- (unint64_t)hsModelPreInstalled;
- (unint64_t)hsModelPrimary;
- (unint64_t)hsModelTlvModelCertificate;
- (unint64_t)hsModelTlvModelDigest;
- (unint64_t)hsModelTlvModelEngineType;
- (unint64_t)hsModelTlvModelEngineVersion;
- (unint64_t)hsModelTlvModelHash;
- (unint64_t)hsModelTlvModelLocale;
- (unint64_t)hsModelTlvModelRole;
- (unint64_t)hsModelTlvModelSignature;
- (unint64_t)hsModelTlvModelType;
@end

@implementation UARPTLVTypes

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__UARPTLVTypes_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __30__UARPTLVTypes_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (UARPAssetTag)hsModel4cc
{
  v2 = (char *)uarpAssetTagStructHeySiriModel();
  v3 = [[UARPAssetTag alloc] initWithChar1:*v2 char2:v2[1] char3:v2[2] char4:v2[3]];
  return v3;
}

- (unint64_t)hsModelTlvModelType
{
  return 1619725824;
}

- (unint64_t)hsModelTlvModelLocale
{
  return 1619725825;
}

- (unint64_t)hsModelTlvModelHash
{
  return 1619725826;
}

- (unint64_t)hsModelTlvModelRole
{
  return 1619725827;
}

- (unint64_t)hsModelTlvModelDigest
{
  return 1619725828;
}

- (unint64_t)hsModelTlvModelSignature
{
  return 1619725829;
}

- (unint64_t)hsModelTlvModelCertificate
{
  return 1619725830;
}

- (unint64_t)hsModelTlvModelEngineVersion
{
  return 1619725831;
}

- (unint64_t)hsModelTlvModelEngineType
{
  return 1619725832;
}

- (unint64_t)hsModelEngineCompact
{
  return 0;
}

- (unint64_t)hsModelEngineNormal
{
  return 1;
}

- (unint64_t)hsModelDownloaded
{
  return 0;
}

- (unint64_t)hsModelPreInstalled
{
  return 1;
}

- (unint64_t)hsModelPrimary
{
  return 0;
}

- (unint64_t)hsModelFallback
{
  return 1;
}

@end