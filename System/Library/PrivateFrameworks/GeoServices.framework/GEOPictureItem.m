@interface GEOPictureItem
- (GEOMapItemPhoto)photo;
- (GEOPictureItem)init;
- (GEOPictureItem)initWithPhoto:(id)a3 pictureItemPhotoType:(int)a4 primaryText:(id)a5 secondaryText:(id)a6;
- (GEOPictureItem)initWithPictureItem:(id)a3;
- (NSString)primaryText;
- (NSString)secondaryText;
- (int)pictureItemPhotoType;
@end

@implementation GEOPictureItem

- (GEOPictureItem)init
{
  result = (GEOPictureItem *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOPictureItem)initWithPhoto:(id)a3 pictureItemPhotoType:(int)a4 primaryText:(id)a5 secondaryText:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = 0;
  if (v11) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = (a4 - 1) >= 2;
  }
  char v16 = !v15;
  if (a4 && (v16 & 1) == 0)
  {
    v24.receiver = self;
    v24.super_class = (Class)GEOPictureItem;
    v17 = [(GEOPictureItem *)&v24 init];
    v18 = v17;
    if (v17)
    {
      objc_storeStrong((id *)&v17->_photo, a3);
      v18->_pictureItemPhotoType = a4;
      uint64_t v19 = [v12 copy];
      primaryText = v18->_primaryText;
      v18->_primaryText = (NSString *)v19;

      uint64_t v21 = [v13 copy];
      secondaryText = v18->_secondaryText;
      v18->_secondaryText = (NSString *)v21;
    }
    self = v18;
    v14 = self;
  }

  return v14;
}

- (GEOPictureItem)initWithPictureItem:(id)a3
{
  v4 = (id *)a3;
  -[GEOPDPictureItem photo](v4);
  v5 = (_GEOPlaceDataPhoto *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [_GEOPlaceDataPhoto alloc];
    v7 = -[GEOPDPictureItem photo](v4);
    v5 = [(_GEOPlaceDataPhoto *)v6 initWithPhoto:v7];
  }
  unsigned int v8 = -[GEOPDPictureItem photoItemType]((uint64_t)v4);
  if (v8 - 1 >= 3) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v8;
  }
  v10 = -[GEOPDPictureItem primaryText](v4);
  id v11 = -[GEOPDPictureItem secondaryText](v4);
  id v12 = [(GEOPictureItem *)self initWithPhoto:v5 pictureItemPhotoType:v9 primaryText:v10 secondaryText:v11];

  return v12;
}

- (GEOMapItemPhoto)photo
{
  return self->_photo;
}

- (int)pictureItemPhotoType
{
  return self->_pictureItemPhotoType;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);

  objc_storeStrong((id *)&self->_photo, 0);
}

@end