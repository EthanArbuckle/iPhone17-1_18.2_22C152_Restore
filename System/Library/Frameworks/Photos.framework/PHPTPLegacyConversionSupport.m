@interface PHPTPLegacyConversionSupport
- (BOOL)peerSupportsAdjustmentBaseResources;
- (BOOL)peerSupportsTranscodeChoice;
- (BOOL)penultimateIsPublic;
- (PHPTPLegacyConversionSupport)init;
- (id)conversionResultForPTPAsset:(id)a3 sourceHints:(id)a4 forceLegacyConversion:(BOOL)a5 assetTypeLabel:(id)a6;
@end

@implementation PHPTPLegacyConversionSupport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerMediaCapabilities, 0);

  objc_storeStrong((id *)&self->_mediaFormatConversionManager, 0);
}

- (BOOL)penultimateIsPublic
{
  return 0;
}

- (BOOL)peerSupportsAdjustmentBaseResources
{
  return [(PFMediaCapabilities *)self->_peerMediaCapabilities supportForAdjustmentBaseResources] == 1;
}

- (id)conversionResultForPTPAsset:(id)a3 sourceHints:(id)a4 forceLegacyConversion:(BOOL)a5 assetTypeLabel:(id)a6
{
  return +[PHPTPConversionHelper conversionResultForPTPAsset:a3 sourceHints:a4 withConversionManager:self->_mediaFormatConversionManager peerCapabilities:self->_peerMediaCapabilities];
}

- (BOOL)peerSupportsTranscodeChoice
{
  return [(PFMediaCapabilities *)self->_peerMediaCapabilities supportsTranscodeChoice];
}

- (PHPTPLegacyConversionSupport)init
{
  v8.receiver = self;
  v8.super_class = (Class)PHPTPLegacyConversionSupport;
  v2 = [(PHPTPLegacyConversionSupport *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mediaFormatConversionManager = v2->_mediaFormatConversionManager;
    v2->_mediaFormatConversionManager = (PHMediaFormatConversionManager *)v3;

    uint64_t v5 = [MEMORY[0x1E4F8CC30] legacyCapabilities];
    peerMediaCapabilities = v2->_peerMediaCapabilities;
    v2->_peerMediaCapabilities = (PFMediaCapabilities *)v5;
  }
  return v2;
}

@end