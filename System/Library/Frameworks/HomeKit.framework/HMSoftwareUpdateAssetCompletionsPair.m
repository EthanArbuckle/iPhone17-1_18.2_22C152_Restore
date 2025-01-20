@interface HMSoftwareUpdateAssetCompletionsPair
- (HMSoftwareUpdateDocumentationAsset)asset;
- (NSMutableArray)completions;
- (void)setAsset:(id)a3;
- (void)setCompletions:(id)a3;
@end

@implementation HMSoftwareUpdateAssetCompletionsPair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setCompletions:(id)a3
{
}

- (NSMutableArray)completions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAsset:(id)a3
{
}

- (HMSoftwareUpdateDocumentationAsset)asset
{
  return (HMSoftwareUpdateDocumentationAsset *)objc_getProperty(self, a2, 8, 1);
}

@end