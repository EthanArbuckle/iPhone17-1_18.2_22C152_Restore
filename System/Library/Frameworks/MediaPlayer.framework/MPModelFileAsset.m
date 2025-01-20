@interface MPModelFileAsset
+ (id)__filePath_KEY;
+ (id)__fileSize_KEY;
+ (id)__hlsKeyCertificateURL_KEY;
+ (id)__hlsKeyServerProtocol_KEY;
+ (id)__hlsKeyServerURL_KEY;
+ (id)__nonPurgeable_KEY;
+ (id)__protectionType_KEY;
+ (id)__purchaseBundleFilePath_KEY;
+ (id)__qualityType_KEY;
+ (id)__traits_KEY;
+ (id)allSupportedProperties;
+ (void)__MPModelPropertyFileAssetFilePath__MAPPING_MISSING__;
+ (void)__MPModelPropertyFileAssetFileSize__MAPPING_MISSING__;
+ (void)__MPModelPropertyFileAssetHLSKeyCertificateURL__MAPPING_MISSING__;
+ (void)__MPModelPropertyFileAssetHLSKeyServerProtocol__MAPPING_MISSING__;
+ (void)__MPModelPropertyFileAssetHLSKeyServerURL__MAPPING_MISSING__;
+ (void)__MPModelPropertyFileAssetNonPurgeable__MAPPING_MISSING__;
+ (void)__MPModelPropertyFileAssetProtectionType__MAPPING_MISSING__;
+ (void)__MPModelPropertyFileAssetPurchaseBundleFilePath__MAPPING_MISSING__;
+ (void)__MPModelPropertyFileAssetQualityType__MAPPING_MISSING__;
+ (void)__MPModelPropertyFileAssetTraits__MAPPING_MISSING__;
@end

@implementation MPModelFileAsset

+ (id)__traits_KEY
{
  return @"MPModelPropertyFileAssetTraits";
}

+ (id)__qualityType_KEY
{
  return @"MPModelPropertyFileAssetQualityType";
}

+ (id)__purchaseBundleFilePath_KEY
{
  return @"MPModelPropertyFileAssetPurchaseBundleFilePath";
}

+ (id)__protectionType_KEY
{
  return @"MPModelPropertyFileAssetProtectionType";
}

+ (id)__nonPurgeable_KEY
{
  return @"MPModelPropertyFileAssetNonPurgeable";
}

+ (id)__hlsKeyServerURL_KEY
{
  return @"MPModelPropertyFileAssetHLSKeyServerURL";
}

+ (id)__hlsKeyServerProtocol_KEY
{
  return @"MPModelPropertyFileAssetHLSKeyServerProtocol";
}

+ (id)__hlsKeyCertificateURL_KEY
{
  return @"MPModelPropertyFileAssetHLSKeyCertificateURL";
}

+ (id)__fileSize_KEY
{
  return @"MPModelPropertyFileAssetFileSize";
}

+ (id)__filePath_KEY
{
  return @"MPModelPropertyFileAssetFilePath";
}

+ (id)allSupportedProperties
{
  v5[9] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelPropertyFileAssetFilePath";
  v5[1] = @"MPModelPropertyFileAssetNonPurgeable";
  v5[2] = @"MPModelPropertyFileAssetQualityType";
  v5[3] = @"MPModelPropertyFileAssetProtectionType";
  v5[4] = @"MPModelPropertyFileAssetPurchaseBundleFilePath";
  v5[5] = @"MPModelPropertyFileAssetHLSKeyServerURL";
  v5[6] = @"MPModelPropertyFileAssetHLSKeyServerProtocol";
  v5[7] = @"MPModelPropertyFileAssetHLSKeyCertificateURL";
  v5[8] = @"MPModelPropertyFileAssetTraits";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:9];
  v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

+ (void)__MPModelPropertyFileAssetTraits__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelFileAsset.m" lineNumber:37 description:@"Translator was missing mapping for MPModelPropertyFileAssetTraits"];
}

+ (void)__MPModelPropertyFileAssetHLSKeyCertificateURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelFileAsset.m" lineNumber:36 description:@"Translator was missing mapping for MPModelPropertyFileAssetHLSKeyCertificateURL"];
}

+ (void)__MPModelPropertyFileAssetHLSKeyServerProtocol__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelFileAsset.m" lineNumber:35 description:@"Translator was missing mapping for MPModelPropertyFileAssetHLSKeyServerProtocol"];
}

+ (void)__MPModelPropertyFileAssetHLSKeyServerURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelFileAsset.m" lineNumber:34 description:@"Translator was missing mapping for MPModelPropertyFileAssetHLSKeyServerURL"];
}

+ (void)__MPModelPropertyFileAssetQualityType__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelFileAsset.m" lineNumber:33 description:@"Translator was missing mapping for MPModelPropertyFileAssetQualityType"];
}

+ (void)__MPModelPropertyFileAssetPurchaseBundleFilePath__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelFileAsset.m" lineNumber:32 description:@"Translator was missing mapping for MPModelPropertyFileAssetPurchaseBundleFilePath"];
}

+ (void)__MPModelPropertyFileAssetProtectionType__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelFileAsset.m" lineNumber:31 description:@"Translator was missing mapping for MPModelPropertyFileAssetProtectionType"];
}

+ (void)__MPModelPropertyFileAssetNonPurgeable__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelFileAsset.m" lineNumber:30 description:@"Translator was missing mapping for MPModelPropertyFileAssetNonPurgeable"];
}

+ (void)__MPModelPropertyFileAssetFileSize__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelFileAsset.m" lineNumber:29 description:@"Translator was missing mapping for MPModelPropertyFileAssetFileSize"];
}

+ (void)__MPModelPropertyFileAssetFilePath__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelFileAsset.m" lineNumber:28 description:@"Translator was missing mapping for MPModelPropertyFileAssetFilePath"];
}

@end