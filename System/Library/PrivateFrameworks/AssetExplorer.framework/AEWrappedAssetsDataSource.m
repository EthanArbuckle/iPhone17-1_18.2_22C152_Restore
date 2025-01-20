@interface AEWrappedAssetsDataSource
- (AEWrappedAssetsDataSource)initWithReviewAssetsDataSource:(id)a3;
- (PUAssetsDataSource)_reviewAssetsDataSource;
- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4;
@end

@implementation AEWrappedAssetsDataSource

- (void).cxx_destruct
{
}

- (PUAssetsDataSource)_reviewAssetsDataSource
{
  return self->__reviewAssetsDataSource;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v6 = a4;
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  v15.receiver = self;
  v15.super_class = (Class)AEWrappedAssetsDataSource;
  [(PXSimpleIndexPath *)&v15 indexPathForObjectReference:v6];
  if (retstr->dataSourceIdentifier == *MEMORY[0x263F5E208])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [v6 itemObject];
      v8 = [(AEWrappedAssetsDataSource *)self _reviewAssetsDataSource];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          v10 = [v7 identifier];
          v11 = [v9 indexPathForAssetWithIdentifier:v10];

          [(AEWrappedAssetsDataSource *)self identifier];
          PXSimpleIndexPathFromIndexPath();
          *(_OWORD *)&retstr->dataSourceIdentifier = v13;
          *(_OWORD *)&retstr->item = v14;
        }
      }
    }
  }

  return result;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  v4 = [(AEWrappedAssetsDataSource *)self _reviewAssetsDataSource];
  PXSimpleIndexPath v8 = *a3;
  v5 = PXIndexPathFromSimpleIndexPath();
  id v6 = objc_msgSend(v4, "assetAtIndexPath:", v5, *(_OWORD *)&v8.dataSourceIdentifier, *(_OWORD *)&v8.item);

  return v6;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  v3 = [(AEWrappedAssetsDataSource *)self _reviewAssetsDataSource];
  v4 = (void *)[objc_alloc(MEMORY[0x263F088C8]) initWithIndex:0];
  int64_t v5 = [v3 numberOfSubItemsAtIndexPath:v4];

  return v5;
}

- (int64_t)numberOfSections
{
  v2 = [(AEWrappedAssetsDataSource *)self _reviewAssetsDataSource];
  id v3 = objc_alloc_init(MEMORY[0x263F088C8]);
  int64_t v4 = [v2 numberOfSubItemsAtIndexPath:v3];

  return v4;
}

- (AEWrappedAssetsDataSource)initWithReviewAssetsDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AEWrappedAssetsDataSource;
  id v6 = [(AEWrappedAssetsDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->__reviewAssetsDataSource, a3);
  }

  return v7;
}

@end