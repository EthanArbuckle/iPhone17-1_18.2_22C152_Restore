@interface DDSLinguisticAttributeFilter
- (void)addAssetLocale:(id)a3;
- (void)addContentItemLocale:(id)a3;
- (void)addContentType:(id)a3;
- (void)addLinguisticAssetType:(id)a3;
- (void)addRegionWithCountry:(id)a3 province:(id)a4 city:(id)a5;
@end

@implementation DDSLinguisticAttributeFilter

- (void)addRegionWithCountry:(id)a3 province:(id)a4 city:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v11 = v10;
  if (v12) {
    [v10 setObject:v12 forKeyedSubscript:@"Country"];
  }
  if (v8) {
    [v11 setObject:v8 forKeyedSubscript:@"Province"];
  }
  if (v9) {
    [v11 setObject:v9 forKeyedSubscript:@"City"];
  }
  [(DDSAttributeFilter *)self addAllowedValue:v11 forKey:@"AssetRegion"];
}

- (void)addAssetLocale:(id)a3
{
}

- (void)addContentType:(id)a3
{
}

- (void)addContentItemLocale:(id)a3
{
}

- (void)addLinguisticAssetType:(id)a3
{
}

@end