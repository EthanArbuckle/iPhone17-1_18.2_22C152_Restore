@interface CDMServiceAssetConfig
- (BOOL)isAssetRequiredForSetup;
- (CDMServiceAssetConfig)init;
- (id)getAllAssetSets;
- (id)getAllFactors;
- (id)getCDMAssetFactorToFoldersMappingForAssetSet:(int64_t)a3;
- (id)getCDMAssetSetToFactorsConfig;
- (id)getCDMAssetsFactorConfigForAssetSet:(int64_t)a3;
- (void)addCDMFactorToFoldersMapping:(id)a3 forAssetSet:(int64_t)a4;
- (void)setIsAssetRequiredForSetup:(BOOL)a3;
@end

@implementation CDMServiceAssetConfig

- (void).cxx_destruct
{
}

- (CDMServiceAssetConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)CDMServiceAssetConfig;
  v2 = [(CDMServiceAssetConfig *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CDMAssetSetToFactorsConfig);
    assetSetToFactorsConfig = v2->_assetSetToFactorsConfig;
    v2->_assetSetToFactorsConfig = v3;

    v2->_isAssetRequiredForSetup = 1;
  }
  return v2;
}

- (void)addCDMFactorToFoldersMapping:(id)a3 forAssetSet:(int64_t)a4
{
  id v6 = a3;
  v7 = [[CDMAssetsFactorConfig alloc] initWithFactorToFoldersMapping:v6];

  [(CDMAssetSetToFactorsConfig *)self->_assetSetToFactorsConfig setCDMAssetsFactorConfig:v7 forAssetSet:a4];
}

- (BOOL)isAssetRequiredForSetup
{
  return self->_isAssetRequiredForSetup;
}

- (id)getCDMAssetsFactorConfigForAssetSet:(int64_t)a3
{
  return [(CDMAssetSetToFactorsConfig *)self->_assetSetToFactorsConfig getCDMFactorConfigForAssetSet:a3];
}

- (id)getCDMAssetSetToFactorsConfig
{
  return self->_assetSetToFactorsConfig;
}

- (id)getAllFactors
{
  return [(CDMAssetSetToFactorsConfig *)self->_assetSetToFactorsConfig getAllFactors];
}

- (id)getAllAssetSets
{
  return [(CDMAssetSetToFactorsConfig *)self->_assetSetToFactorsConfig getAllAssetSets];
}

- (id)getCDMAssetFactorToFoldersMappingForAssetSet:(int64_t)a3
{
  v3 = [(CDMAssetSetToFactorsConfig *)self->_assetSetToFactorsConfig getCDMFactorConfigForAssetSet:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 getFactorToFoldersMapping];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setIsAssetRequiredForSetup:(BOOL)a3
{
  self->_isAssetRequiredForSetup = a3;
}

@end