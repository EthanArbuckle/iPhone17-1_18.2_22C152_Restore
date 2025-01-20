@interface CKStaticDisplayAssetFetchResult
- (BOOL)containsObject:(id)a3;
- (CKStaticDisplayAssetFetchResult)init;
- (CKStaticDisplayAssetFetchResult)initWithAssets:(id)a3;
- (NSArray)assets;
- (PXDisplayAsset)firstObject;
- (PXDisplayAsset)lastObject;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (id)thumbnailAssetAtIndex:(unint64_t)a3;
- (int64_t)count;
- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3;
- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3;
@end

@implementation CKStaticDisplayAssetFetchResult

- (CKStaticDisplayAssetFetchResult)init
{
  return [(CKStaticDisplayAssetFetchResult *)self initWithAssets:MEMORY[0x1E4F1CBF0]];
}

- (CKStaticDisplayAssetFetchResult)initWithAssets:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKStaticDisplayAssetFetchResult;
  v5 = [(CKStaticDisplayAssetFetchResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    assets = v5->_assets;
    v5->_assets = (NSArray *)v6;
  }
  return v5;
}

- (int64_t)count
{
  return [(NSArray *)self->_assets count];
}

- (id)objectAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_assets objectAtIndexedSubscript:a3];
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return [(NSArray *)self->_assets objectAtIndexedSubscript:a3];
}

- (id)objectsAtIndexes:(id)a3
{
  return [(NSArray *)self->_assets objectsAtIndexes:a3];
}

- (BOOL)containsObject:(id)a3
{
  return [(NSArray *)self->_assets containsObject:a3];
}

- (PXDisplayAsset)firstObject
{
  return (PXDisplayAsset *)[(NSArray *)self->_assets firstObject];
}

- (PXDisplayAsset)lastObject
{
  return (PXDisplayAsset *)[(NSArray *)self->_assets lastObject];
}

- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)thumbnailAssetAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_assets objectAtIndexedSubscript:a3];
}

- (NSArray)assets
{
  return self->_assets;
}

- (void).cxx_destruct
{
}

@end