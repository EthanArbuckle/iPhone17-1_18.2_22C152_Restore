@interface PHTransientAssetCollectionOptions
- (Class)assetCollectionClass;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (NSString)titleFontName;
- (PHFetchResult)fetchResult;
- (PHPhotoLibrary)photoLibrary;
- (PHQuery)query;
- (PHTransientAssetCollectionOptions)init;
- (PHTransientAssetCollectionOptions)initWithAssetFetchResult:(id)a3;
- (PHTransientAssetCollectionOptions)initWithFetchOptions:(id)a3;
- (PHTransientAssetCollectionOptions)initWithPhotoLibrary:(id)a3;
- (id)_init;
- (int64_t)keyAssetsPosition;
- (int64_t)subtype;
- (int64_t)type;
- (void)setAssetCollectionClass:(Class)a3;
- (void)setEndDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeyAssetsPosition:(int64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtype:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTitleFontName:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PHTransientAssetCollectionOptions

- (int64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)titleFontName
{
  return self->_titleFontName;
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (PHQuery)query
{
  return self->_query;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (int64_t)keyAssetsPosition
{
  return self->_keyAssetsPosition;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setTitle:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setKeyAssetsPosition:(int64_t)a3
{
  self->_keyAssetsPosition = a3;
}

- (PHTransientAssetCollectionOptions)initWithFetchOptions:(id)a3
{
  id v4 = a3;
  v5 = [(PHTransientAssetCollectionOptions *)self _init];
  if (v5)
  {
    uint64_t v6 = +[PHQuery queryForAssetsWithOptions:v4];
    query = v5->_query;
    v5->_query = (PHQuery *)v6;
  }
  return v5;
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)PHTransientAssetCollectionOptions;
  v2 = [(PHTransientAssetCollectionOptions *)&v7 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = xmmword_19B2CC6A0;
    uint64_t v4 = objc_opt_class();
    v5 = (void *)v3[10];
    v3[10] = v4;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_assetCollectionClass, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_titleFontName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setAssetCollectionClass:(Class)a3
{
}

- (Class)assetCollectionClass
{
  return self->_assetCollectionClass;
}

- (void)setEndDate:(id)a3
{
}

- (void)setStartDate:(id)a3
{
}

- (void)setTitleFontName:(id)a3
{
}

- (void)setSubtitle:(id)a3
{
}

- (void)setSubtype:(int64_t)a3
{
  self->_subtype = a3;
}

- (PHTransientAssetCollectionOptions)init
{
  v2 = self;
  PLMethodNotImplementedException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (PHTransientAssetCollectionOptions)initWithAssetFetchResult:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(PHTransientAssetCollectionOptions *)self _init];
  objc_super v7 = (PHTransientAssetCollectionOptions *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 11, a3);
    uint64_t v8 = [v5 photoLibrary];
    photoLibrary = v7->_photoLibrary;
    v7->_photoLibrary = (PHPhotoLibrary *)v8;
  }
  return v7;
}

- (PHTransientAssetCollectionOptions)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(PHTransientAssetCollectionOptions *)self _init];
  objc_super v7 = (PHTransientAssetCollectionOptions *)v6;
  if (v6) {
    objc_storeStrong(v6 + 13, a3);
  }

  return v7;
}

@end