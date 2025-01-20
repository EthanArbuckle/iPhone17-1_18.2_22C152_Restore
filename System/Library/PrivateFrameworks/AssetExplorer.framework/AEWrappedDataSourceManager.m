@interface AEWrappedDataSourceManager
- (PUReviewAssetsDataSourceManager)_attachedDataSourceManager;
- (id)assetsDataSourceManagerInterestingAssetReferences:(id)a3;
- (id)createInitialDataSource;
- (void)_createDataSourceFromAssetsDataSource:(id)a3 changeDetails:(id)a4;
- (void)_setAttachedDataSourceManager:(id)a3;
- (void)assetsDataSourceManager:(id)a3 didChangeAssetsDataSource:(id)a4 changeDetails:(id)a5;
- (void)attachDataSourceManager:(id)a3;
- (void)detachCurrentDataSourceManager;
@end

@implementation AEWrappedDataSourceManager

- (void).cxx_destruct
{
}

- (void)_setAttachedDataSourceManager:(id)a3
{
}

- (PUReviewAssetsDataSourceManager)_attachedDataSourceManager
{
  return self->__attachedDataSourceManager;
}

- (id)assetsDataSourceManagerInterestingAssetReferences:(id)a3
{
  return 0;
}

- (void)assetsDataSourceManager:(id)a3 didChangeAssetsDataSource:(id)a4 changeDetails:(id)a5
{
}

- (id)createInitialDataSource
{
  return (id)[MEMORY[0x263F5E190] emptyDataSource];
}

- (void)_createDataSourceFromAssetsDataSource:(id)a3 changeDetails:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = [(PXSectionedDataSourceManager *)self dataSource];
  v9 = [[AEWrappedAssetsDataSource alloc] initWithReviewAssetsDataSource:v7];

  if (!v6)
  {
    v10 = 0;
    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v11 = 0;
    goto LABEL_6;
  }
  v16 = &unk_26DEBDD90;
  v17[0] = v6;
  v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v11 = [v8 identifier];
LABEL_6:
  uint64_t v12 = [(AEWrappedAssetsDataSource *)v9 identifier];
  id v13 = objc_alloc(MEMORY[0x263F5E198]);
  v14 = [MEMORY[0x263F5E128] changeDetailsWithNoChanges];
  v15 = (void *)[v13 initWithFromDataSourceIdentifier:v11 toDataSourceIdentifier:v12 sectionChanges:v14 itemChangeDetailsBySection:v10 subitemChangeDetailsByItemBySection:0];

  [(PXSectionedDataSourceManager *)self setDataSource:v9 changeDetails:v15];
}

- (void)detachCurrentDataSourceManager
{
  id v3 = [(AEWrappedDataSourceManager *)self _attachedDataSourceManager];
  [v3 setDelegate:0];
  [(AEWrappedDataSourceManager *)self _setAttachedDataSourceManager:0];
}

- (void)attachDataSourceManager:(id)a3
{
  id v4 = a3;
  id v5 = [v4 assetsDataSource];
  [(AEWrappedDataSourceManager *)self _createDataSourceFromAssetsDataSource:v5 changeDetails:0];
  [(AEWrappedDataSourceManager *)self _setAttachedDataSourceManager:v4];
  [v4 setDelegate:self];
  [v4 setReviewDelegate:self];
}

@end