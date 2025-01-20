@interface CDMAssetsInfo
- (CDMAssetsInfo)init;
- (CDMAssetsInfo)initWithGraphName:(id)a3;
- (id)getAllAssetSets;
- (id)getCDMAssetsFactorConfigCDMAssetSet:(int64_t)a3;
- (id)getCDMAssetsUsagesForCDMAssetSet:(int64_t)a3;
- (id)getGraphName;
- (void)setAssetsUsages:(id)a3 withCDMAssetsFactorConfig:(id)a4 forCDMAssetSet:(int64_t)a5;
@end

@implementation CDMAssetsInfo

- (void)setAssetsUsages:(id)a3 withCDMAssetsFactorConfig:(id)a4 forCDMAssetSet:(int64_t)a5
{
  assetSetToUsagesMapping = self->_assetSetToUsagesMapping;
  v9 = NSNumber;
  id v12 = a4;
  id v10 = a3;
  v11 = [v9 numberWithInteger:a5];
  [(NSMutableDictionary *)assetSetToUsagesMapping setObject:v10 forKey:v11];

  [(CDMAssetSetToFactorsConfig *)self->_cdmAssetSetToFactorsConfig setCDMAssetsFactorConfig:v12 forAssetSet:a5];
}

- (CDMAssetsInfo)initWithGraphName:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CDMAssetsInfo;
  v6 = [(CDMAssetsInfo *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphName, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assetSetToUsagesMapping = v7->_assetSetToUsagesMapping;
    v7->_assetSetToUsagesMapping = v8;

    id v10 = objc_alloc_init(CDMAssetSetToFactorsConfig);
    cdmAssetSetToFactorsConfig = v7->_cdmAssetSetToFactorsConfig;
    v7->_cdmAssetSetToFactorsConfig = v10;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphName, 0);
  objc_storeStrong((id *)&self->_cdmAssetSetToFactorsConfig, 0);
  objc_storeStrong((id *)&self->_assetSetToUsagesMapping, 0);
}

- (id)getCDMAssetsFactorConfigCDMAssetSet:(int64_t)a3
{
  return [(CDMAssetSetToFactorsConfig *)self->_cdmAssetSetToFactorsConfig getCDMFactorConfigForAssetSet:a3];
}

- (id)getAllAssetSets
{
  return (id)[(NSMutableDictionary *)self->_assetSetToUsagesMapping allKeys];
}

- (id)getGraphName
{
  return self->_graphName;
}

- (id)getCDMAssetsUsagesForCDMAssetSet:(int64_t)a3
{
  assetSetToUsagesMapping = self->_assetSetToUsagesMapping;
  v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  v7 = [(NSMutableDictionary *)assetSetToUsagesMapping objectForKey:v6];

  if (v7)
  {
    v8 = self->_assetSetToUsagesMapping;
    v9 = [NSNumber numberWithInteger:a3];
    id v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (CDMAssetsInfo)init
{
  v8.receiver = self;
  v8.super_class = (Class)CDMAssetsInfo;
  v2 = [(CDMAssetsInfo *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assetSetToUsagesMapping = v2->_assetSetToUsagesMapping;
    v2->_assetSetToUsagesMapping = v3;

    id v5 = objc_alloc_init(CDMAssetSetToFactorsConfig);
    cdmAssetSetToFactorsConfig = v2->_cdmAssetSetToFactorsConfig;
    v2->_cdmAssetSetToFactorsConfig = v5;
  }
  return v2;
}

@end