@interface GEOCaptionedPhotoAlbum
- (GEOCaptionedPhotoAlbum)initWithCaptionedPhotoCategory:(id)a3 attributionMap:(id)a4;
- (NSArray)photoList;
- (NSString)categoryId;
- (NSString)categoryName;
- (id)description;
- (unint64_t)totalNumberOfPhotosAvailable;
- (void)_buildPhotoList;
@end

@implementation GEOCaptionedPhotoAlbum

- (GEOCaptionedPhotoAlbum)initWithCaptionedPhotoCategory:(id)a3 attributionMap:(id)a4
{
  v7 = (id *)a3;
  id v8 = a4;
  if (v7 && (-[GEOPDCategorizedPhotos _readPhotos]((uint64_t)v7), [v7[5] count]))
  {
    v13.receiver = self;
    v13.super_class = (Class)GEOCaptionedPhotoAlbum;
    v9 = [(GEOCaptionedPhotoAlbum *)&v13 init];
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_categorizedPhotos, a3);
      objc_storeStrong(p_isa + 2, a4);
      [p_isa _buildPhotoList];
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_buildPhotoList
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v4 = -[GEOPDCategorizedPhotos photos]((id *)&self->_categorizedPhotos->super.super.isa);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(id **)(*((void *)&v19 + 1) + 8 * i);
        attributionMap = self->_attributionMap;
        -[GEOPDCaptionedPhoto attribution](v9);
        v11 = (id *)objc_claimAutoreleasedReturnValue();
        v12 = -[GEOPDAttribution vendorId](v11);
        objc_super v13 = -[NSMapTable objectForKey:](attributionMap, "objectForKey:", v12, (void)v19);

        if (v13 && [v13 hasAttributionRequirement:3])
        {
          v14 = -[GEOPDCaptionedPhoto attribution](v9);
          v15 = +[GEOMapItemAttribution attributionWithDataAttribution:v14 searchInfo:v13 class:objc_opt_class()];

          v16 = [[_GEOPlaceDataPhoto alloc] initWithCaptionedPhoto:v9 attribution:v15];
          [v3 addObject:v16];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  v17 = (NSArray *)[v3 copy];
  photoList = self->_photoList;
  self->_photoList = v17;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@", self->_categorizedPhotos];
}

- (NSString)categoryName
{
  return (NSString *)[(GEOPDCategorizedPhotos *)self->_categorizedPhotos displayTitle];
}

- (NSString)categoryId
{
  return -[GEOPDCategorizedPhotos categoryId]((id *)&self->_categorizedPhotos->super.super.isa);
}

- (unint64_t)totalNumberOfPhotosAvailable
{
  unint64_t categorizedPhotos = (unint64_t)self->_categorizedPhotos;
  if (categorizedPhotos
    && (unint64_t categorizedPhotos = *(unsigned int *)(categorizedPhotos + 60), (categorizedPhotos & 0x80000000) != 0))
  {
    return [(NSArray *)self->_photoList count];
  }
  else
  {
    return categorizedPhotos;
  }
}

- (NSArray)photoList
{
  return self->_photoList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoList, 0);
  objc_storeStrong((id *)&self->_attributionMap, 0);

  objc_storeStrong((id *)&self->_categorizedPhotos, 0);
}

@end