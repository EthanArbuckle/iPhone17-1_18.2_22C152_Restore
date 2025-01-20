@interface MUPlacePhotoGalleryAttributionViewModel
+ (id)viewModelForCustomTitle:(id)a3 customSubtitle:(id)a4;
+ (id)viewModelFromMapItem:(id)a3 photo:(id)a4 photoCreditName:(id)a5 shouldAddPhotoCredit:(BOOL)a6;
- (BOOL)supportsPunchOut;
- (NSDate)photoDate;
- (NSString)authorName;
- (NSString)caption;
- (NSString)placeName;
- (NSString)subtitleText;
- (NSString)titleText;
- (NSString)vendorName;
- (int64_t)accessoryStyle;
- (int64_t)attributionType;
- (void)setAccessoryStyle:(int64_t)a3;
- (void)setAttributionType:(int64_t)a3;
- (void)setAuthorName:(id)a3;
- (void)setCaption:(id)a3;
- (void)setPhotoDate:(id)a3;
- (void)setPlaceName:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setSupportsPunchOut:(BOOL)a3;
- (void)setTitleText:(id)a3;
- (void)setVendorName:(id)a3;
@end

@implementation MUPlacePhotoGalleryAttributionViewModel

+ (id)viewModelForCustomTitle:(id)a3 customSubtitle:(id)a4
{
  id v4 = a3;
  v5 = objc_alloc_init(MUPlacePhotoGalleryAttributionViewModel);
  [(MUPlacePhotoGalleryAttributionViewModel *)v5 setTitleText:v4];
  [(MUPlacePhotoGalleryAttributionViewModel *)v5 setSubtitleText:v4];

  return v5;
}

+ (id)viewModelFromMapItem:(id)a3 photo:(id)a4 photoCreditName:(id)a5 shouldAddPhotoCredit:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = objc_alloc_init(MUPlacePhotoGalleryAttributionViewModel);
  if ((MapKitIdiomIsMacCatalyst() & 1) == 0)
  {
    if (v6)
    {
      uint64_t v13 = 3;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E4F30F78];
      v15 = [v10 attribution];
      LODWORD(v14) = [v14 shouldShowReportAnIssueOnPhotoGalleryForMapItem:v9 photoAttribution:v15];

      if (v14) {
        uint64_t v13 = 2;
      }
      else {
        uint64_t v13 = 0;
      }
    }
    [(MUPlacePhotoGalleryAttributionViewModel *)v12 setAccessoryStyle:v13];
  }
  v16 = [v10 geoMapItemPhoto];
  v17 = [v16 author];
  [(MUPlacePhotoGalleryAttributionViewModel *)v12 setAuthorName:v17];

  v18 = [v9 name];
  [(MUPlacePhotoGalleryAttributionViewModel *)v12 setPlaceName:v18];

  v19 = [v10 geoMapItemPhoto];
  v20 = [v19 dateCreated];
  [(MUPlacePhotoGalleryAttributionViewModel *)v12 setPhotoDate:v20];

  v21 = [v10 attribution];
  v22 = [v21 providerName];
  [(MUPlacePhotoGalleryAttributionViewModel *)v12 setVendorName:v22];

  v23 = [v10 geoMapItemPhoto];
  v24 = [v23 caption];
  [(MUPlacePhotoGalleryAttributionViewModel *)v12 setCaption:v24];

  v25 = [v10 attribution];
  LODWORD(v24) = [v25 isUserSubmitted];

  if (v24)
  {
    v26 = v12;
    uint64_t v27 = 2;
LABEL_12:
    [(MUPlacePhotoGalleryAttributionViewModel *)v26 setAttributionType:v27];
    goto LABEL_13;
  }
  v28 = [v10 attribution];
  int v29 = [v28 isBusinessOwned];

  v26 = v12;
  if (v29)
  {
    uint64_t v27 = 3;
    goto LABEL_12;
  }
  if (v6)
  {
    [(MUPlacePhotoGalleryAttributionViewModel *)v12 setAttributionType:4];
    if ([v11 length]) {
      [(MUPlacePhotoGalleryAttributionViewModel *)v12 setAuthorName:v11];
    }
  }
  else
  {
    [(MUPlacePhotoGalleryAttributionViewModel *)v12 setAttributionType:1];
    v31 = [v10 attribution];
    v32 = [v10 photoID];
    v33 = [v31 urlsForPhotoWithIdentifier:v32];

    if ([v33 count]) {
      [(MUPlacePhotoGalleryAttributionViewModel *)v12 setSupportsPunchOut:1];
    }
  }
LABEL_13:

  return v12;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void)setSubtitleText:(id)a3
{
}

- (int64_t)accessoryStyle
{
  return self->_accessoryStyle;
}

- (void)setAccessoryStyle:(int64_t)a3
{
  self->_accessoryStyle = a3;
}

- (NSString)authorName
{
  return self->_authorName;
}

- (void)setAuthorName:(id)a3
{
}

- (NSString)placeName
{
  return self->_placeName;
}

- (void)setPlaceName:(id)a3
{
}

- (NSDate)photoDate
{
  return self->_photoDate;
}

- (void)setPhotoDate:(id)a3
{
}

- (int64_t)attributionType
{
  return self->_attributionType;
}

- (void)setAttributionType:(int64_t)a3
{
  self->_attributionType = a3;
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setCaption:(id)a3
{
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (void)setVendorName:(id)a3
{
}

- (BOOL)supportsPunchOut
{
  return self->_supportsPunchOut;
}

- (void)setSupportsPunchOut:(BOOL)a3
{
  self->_supportsPunchOut = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_photoDate, 0);
  objc_storeStrong((id *)&self->_placeName, 0);
  objc_storeStrong((id *)&self->_authorName, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end