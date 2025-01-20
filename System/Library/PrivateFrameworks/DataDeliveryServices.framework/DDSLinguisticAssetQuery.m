@interface DDSLinguisticAssetQuery
- (DDSLinguisticAssetQuery)initWithAssetType:(id)a3 languageIdentifier:(id)a4;
- (DDSLinguisticAssetQuery)initWithLanguageIdentifier:(id)a3;
- (void)addRegionWithCountry:(id)a3 province:(id)a4 city:(id)a5;
@end

@implementation DDSLinguisticAssetQuery

- (DDSLinguisticAssetQuery)initWithAssetType:(id)a3 languageIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[DDSAttributeFilter attributeFilter];
  [v8 addAssetLocale:v7];
  uint64_t v9 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v7];
  v10 = [(id)v9 languageCode];

  LOBYTE(v9) = [v10 isEqualToString:v7];
  if ((v9 & 1) == 0) {
    [v8 addAssetLocale:v10];
  }
  v13.receiver = self;
  v13.super_class = (Class)DDSLinguisticAssetQuery;
  v11 = [(DDSAssetQuery *)&v13 initWithAssetType:v6 filter:v8];

  return v11;
}

- (DDSLinguisticAssetQuery)initWithLanguageIdentifier:(id)a3
{
  return [(DDSLinguisticAssetQuery *)self initWithAssetType:@"com.apple.MobileAsset.LinguisticData" languageIdentifier:a3];
}

- (void)addRegionWithCountry:(id)a3 province:(id)a4 city:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DDSAssetQuery *)self filter];
  [v11 addRegionWithCountry:v10 province:v9 city:v8];
}

@end