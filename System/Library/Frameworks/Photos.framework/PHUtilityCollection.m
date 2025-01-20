@interface PHUtilityCollection
+ (id)searchLookupIdentifierForUtilityCollectionType:(unsigned __int16)a3;
- (PHUtilityCollection)initWithType:(unsigned __int16)a3 fetchOptions:(id)a4;
- (id)description;
- (id)localizedTitle;
- (unsigned)type;
@end

@implementation PHUtilityCollection

- (PHUtilityCollection)initWithType:(unsigned __int16)a3 fetchOptions:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v7 = +[PHQuery queryForAssetsInUtilityCollectionWithType:v4 options:v6];
  if (v7)
  {
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"utility-%d", v4);
    v9 = [v6 photoLibrary];
    v12.receiver = self;
    v12.super_class = (Class)PHUtilityCollection;
    int v11 = 0;
    self = [(PHAssetCollection *)&v12 initTransientWithAssets:0 orFetchResult:0 orQuery:v7 title:0 subtitle:0 titleFontName:0 identifier:v8 albumKind:v11 subtype:0 photoLibrary:v9];

    if (self) {
      self->_type = v4;
    }
  }
  return self;
}

+ (id)searchLookupIdentifierForUtilityCollectionType:(unsigned __int16)a3
{
  return (id)MEMORY[0x1F413F848](a3, a2);
}

- (unsigned)type
{
  return self->_type;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PHUtilityCollection;
  v3 = [(PHAssetCollection *)&v8 description];
  unsigned int v4 = [(PHUtilityCollection *)self type] - 1;
  if (v4 > 5) {
    v5 = @"None";
  }
  else {
    v5 = off_1E5845F60[(unsigned __int16)v4];
  }
  id v6 = [v3 stringByAppendingFormat:@" Utility collection type: %@", v5];

  return v6;
}

- (id)localizedTitle
{
  unsigned int v2 = [(PHUtilityCollection *)self type] - 1;
  if (v2 > 5) {
    return @"None";
  }
  else {
    return off_1E5845F60[(unsigned __int16)v2];
  }
}

@end