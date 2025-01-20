@interface PHImportAssetThumbnailDataRequest
- (PHImportAssetThumbnailDataRequest)initWithAsset:(id)a3 longestSide:(unint64_t)a4 priority:(unsigned __int8)a5;
- (id)completionHandler;
- (id)description;
- (id)requestAsset;
- (unint64_t)longestSide;
- (unsigned)priority;
- (void)setCompletionHandler:(id)a3;
@end

@implementation PHImportAssetThumbnailDataRequest

- (void).cxx_destruct
{
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (unsigned)priority
{
  return self->_priority;
}

- (unint64_t)longestSide
{
  return self->_longestSide;
}

- (id)requestAsset
{
  v3 = [(PHImportAssetDataRequest *)self asset];
  v4 = [v3 largeRender];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [(PHImportAssetDataRequest *)self asset];
    v8 = [v7 largeMovieRender];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [(PHImportAssetDataRequest *)self asset];
    }
    id v6 = v10;
  }

  return v6;
}

- (PHImportAssetThumbnailDataRequest)initWithAsset:(id)a3 longestSide:(unint64_t)a4 priority:(unsigned __int8)a5
{
  result = [(PHImportAssetDataRequest *)self initWithAsset:a3];
  if (result)
  {
    result->_longestSide = a4;
    result->_priority = a5;
  }
  return result;
}

- (id)description
{
  return @"thumbnail";
}

@end