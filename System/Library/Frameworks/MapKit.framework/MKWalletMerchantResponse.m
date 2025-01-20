@interface MKWalletMerchantResponse
- (MKMapItem)mapItem;
- (MKWalletMerchantResponse)initWithGEOMapItem:(id)a3;
- (MKWalletMerchantResponse)initWithMerchantLookupResult:(id)a3;
- (MKWalletMerchantStylingInfo)placeStyling;
- (MKWalletMerchantStylingInfo)walletCategoryStyling;
- (NSString)heroImageProviderName;
- (NSString)localizedPlaceLanguage;
- (NSString)localizedPlaceName;
- (NSString)localizedWalletCategoryLanguage;
- (NSString)localizedWalletCategoryName;
- (NSString)mapsCategoryIdentifier;
- (NSString)walletCategoryIdentifier;
- (id)bestHeroImageForSize:(CGSize)a3 allowSmaller:(BOOL)a4;
@end

@implementation MKWalletMerchantResponse

- (MKWalletMerchantResponse)initWithGEOMapItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKWalletMerchantResponse;
  v6 = [(MKWalletMerchantResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mapItem, a3);
  }

  return v7;
}

- (MKWalletMerchantResponse)initWithMerchantLookupResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKWalletMerchantResponse;
  v6 = [(MKWalletMerchantResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_merchantLookupResult, a3);
  }

  return v7;
}

- (MKWalletMerchantStylingInfo)placeStyling
{
  mapItem = self->_mapItem;
  v4 = [MKWalletMerchantStylingInfo alloc];
  if (mapItem)
  {
    id v5 = [(GEOMapItem *)self->_mapItem _walletPlaceStyling];
    v6 = [(MKWalletMerchantStylingInfo *)v4 initWithStyleAttributes:v5];
  }
  else
  {
    id v5 = [(GEOPDMerchantLookupResult *)self->_merchantLookupResult categoryInfo];
    v7 = [v5 mapsCategoryStyleAttributes];
    v6 = [(MKWalletMerchantStylingInfo *)v4 initWithStyleAttributes:v7];
  }

  return v6;
}

- (NSString)localizedPlaceName
{
  mapItem = self->_mapItem;
  if (mapItem)
  {
    v4 = [(GEOMapItem *)mapItem _walletPlaceLocalizedString];
  }
  else
  {
    id v5 = [(GEOPDMerchantLookupResult *)self->_merchantLookupResult categoryInfo];
    v4 = [v5 mapsCategoryId];
  }

  return (NSString *)v4;
}

- (NSString)localizedPlaceLanguage
{
  mapItem = self->_mapItem;
  if (mapItem)
  {
    mapItem = [mapItem _walletPlaceLocalizedStringLocale];
  }

  return (NSString *)mapItem;
}

- (MKWalletMerchantStylingInfo)walletCategoryStyling
{
  if (self->_mapItem)
  {
    v3 = [MKWalletMerchantStylingInfo alloc];
    v4 = [(GEOMapItem *)self->_mapItem _walletCategoryStyling];
    id v5 = [(MKWalletMerchantStylingInfo *)v3 initWithStyleAttributes:v4];
  }
  else
  {
    v6 = [(GEOPDMerchantLookupResult *)self->_merchantLookupResult categoryInfo];
    v4 = [v6 walletCategoryId];

    v7 = +[MKMapService sharedService];
    id v5 = [v7 stylingForWalletCategory:v4];
  }

  return v5;
}

- (NSString)localizedWalletCategoryName
{
  mapItem = self->_mapItem;
  if (mapItem)
  {
    mapItem = [mapItem _walletCategoryLocalizedString];
  }

  return (NSString *)mapItem;
}

- (NSString)localizedWalletCategoryLanguage
{
  mapItem = self->_mapItem;
  if (mapItem)
  {
    mapItem = [mapItem _walletCategoryLocalizedStringLocale];
  }

  return (NSString *)mapItem;
}

- (NSString)mapsCategoryIdentifier
{
  mapItem = self->_mapItem;
  if (mapItem)
  {
    v4 = [(GEOMapItem *)mapItem _walletMapsCategoryIdentifier];
  }
  else
  {
    id v5 = [(GEOPDMerchantLookupResult *)self->_merchantLookupResult categoryInfo];
    v4 = [v5 mapsCategoryId];
  }

  return (NSString *)v4;
}

- (NSString)walletCategoryIdentifier
{
  mapItem = self->_mapItem;
  if (mapItem)
  {
    v4 = [(GEOMapItem *)mapItem _walletCategoryIdentifier];
  }
  else
  {
    id v5 = [(GEOPDMerchantLookupResult *)self->_merchantLookupResult categoryInfo];
    v4 = [v5 walletCategoryId];
  }

  return (NSString *)v4;
}

- (MKMapItem)mapItem
{
  if (self->_mapItem)
  {
    v2 = +[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:");
  }
  else
  {
    v2 = 0;
  }

  return (MKMapItem *)v2;
}

- (id)bestHeroImageForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  v8 = _MKBestWalletHeroPhotoForGEOMapItem(self->_mapItem);
  objc_super v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "bestPhotoForSize:allowSmaller:", v4, width, height);
    v11 = [v10 url];

    if (v11)
    {
      v12 = [v10 url];

      goto LABEL_6;
    }
  }
  v12 = -[GEOMapItem _bestHeroBrandIconURLForSize:allowSmaller:](self->_mapItem, "_bestHeroBrandIconURLForSize:allowSmaller:", v4, width, height);
LABEL_6:

  return v12;
}

- (NSString)heroImageProviderName
{
  v2 = _MKBestWalletHeroPhotoForGEOMapItem(self->_mapItem);
  v3 = v2;
  if (v2)
  {
    BOOL v4 = [v2 attribution];
    id v5 = [v4 providerName];
  }
  else
  {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantLookupResult, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end