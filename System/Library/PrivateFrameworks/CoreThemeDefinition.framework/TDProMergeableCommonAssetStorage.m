@interface TDProMergeableCommonAssetStorage
- (TDProMergeableCommonAssetStorage)initWithPath:(id)a3;
@end

@implementation TDProMergeableCommonAssetStorage

- (TDProMergeableCommonAssetStorage)initWithPath:(id)a3
{
  return [(CUICommonAssetStorage *)self initWithPath:a3 forWriting:1];
}

@end