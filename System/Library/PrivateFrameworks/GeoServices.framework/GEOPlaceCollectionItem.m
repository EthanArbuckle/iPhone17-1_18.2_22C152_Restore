@interface GEOPlaceCollectionItem
- (BOOL)disableAppClipFallback;
- (BOOL)supportsPhotoFallback;
- (GEOMapItemIdentifier)itemIdentifier;
- (GEOPlaceCollectionItem)initWithPlaceCollectionItem:(id)a3;
- (GEOQuickLink)appClip;
- (NSArray)photos;
- (NSString)itemDescription;
- (NSString)itemHTMLDescription;
- (NSString)reviewText;
- (NSURL)reviewUrl;
- (id)description;
@end

@implementation GEOPlaceCollectionItem

- (GEOPlaceCollectionItem)initWithPlaceCollectionItem:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOPlaceCollectionItem;
  v6 = [(GEOPlaceCollectionItem *)&v12 init];
  if (!v6) {
    goto LABEL_5;
  }
  if (v5)
  {
    -[GEOPDPlaceCollectionItem _readItemId]((uint64_t)v5);
    BOOL v7 = v5[7] != 0;
    -[GEOPDPlaceCollectionItem _readItemId]((uint64_t)v5);
    if (v5[7])
    {
      objc_storeStrong((id *)&v6->_placeCollectionItem, a3);
LABEL_5:
      v8 = v6;
      goto LABEL_12;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  v9 = GEOGetCuratedCollectionsLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = "NO";
    if (v7) {
      v10 = "YES";
    }
    *(_DWORD *)buf = 136315138;
    v14 = v10;
    _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "Place Collection Item could not be initialized because some data is missing/nPlace Collection Item hasItemId: %s", buf, 0xCu);
  }

  v8 = 0;
LABEL_12:

  return v8;
}

- (id)description
{
  v2 = NSString;
  v3 = [(GEOPDPlaceCollectionItem *)self->_placeCollectionItem description];
  v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (NSString)itemDescription
{
  return (NSString *)[(GEOPDPlaceCollectionItem *)self->_placeCollectionItem itemDescription];
}

- (NSString)itemHTMLDescription
{
  return (NSString *)[(GEOPDPlaceCollectionItem *)self->_placeCollectionItem itemHTMLDescription];
}

- (GEOMapItemIdentifier)itemIdentifier
{
  v3 = [GEOMapItemIdentifier alloc];
  v4 = -[GEOPDPlaceCollectionItem itemId]((id *)&self->_placeCollectionItem->super.super.isa);
  v5 = [(GEOMapItemIdentifier *)v3 initWithMapsIdentifier:v4];

  return v5;
}

- (NSArray)photos
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v4 = -[GEOPDPlaceCollectionItem photos]((id *)&self->_placeCollectionItem->super.super.isa);
  v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = -[GEOPDPlaceCollectionItem photos]((id *)&self->_placeCollectionItem->super.super.isa);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        objc_super v12 = [_GEOPlaceDataPhoto alloc];
        v13 = -[_GEOPlaceDataPhoto initWithCaptionedPhoto:](v12, "initWithCaptionedPhoto:", v11, (void)v16);
        if (v13) {
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = (void *)[v5 copy];

  return (NSArray *)v14;
}

- (BOOL)supportsPhotoFallback
{
  placeCollectionItem = self->_placeCollectionItem;
  return placeCollectionItem && placeCollectionItem->_enableImageFallback;
}

- (NSURL)reviewUrl
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_isa = &self->_placeCollectionItem->super.super.isa;
  if (p_isa)
  {
    -[GEOPDPlaceCollectionItem _readUrl]((uint64_t)self->_placeCollectionItem);
    if (p_isa[10])
    {
      v4 = (void *)MEMORY[0x1E4F1CB10];
      v5 = -[GEOPDPlaceCollectionItem url]((id *)&self->_placeCollectionItem->super.super.isa);
      p_isa = [v4 URLWithString:v5];

      if (p_isa) {
        goto LABEL_8;
      }
      v6 = GEOGetCuratedCollectionsLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = -[GEOPDPlaceCollectionItem url]((id *)&self->_placeCollectionItem->super.super.isa);
        int v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "PlaceCollectionItem does not have valid string url for the reivew: %@", (uint8_t *)&v9, 0xCu);
      }
    }
    p_isa = 0;
  }
LABEL_8:

  return (NSURL *)p_isa;
}

- (NSString)reviewText
{
  return (NSString *)[(GEOPDPlaceCollectionItem *)self->_placeCollectionItem punchOutText];
}

- (GEOQuickLink)appClip
{
  placeCollectionItem = self->_placeCollectionItem;
  if (placeCollectionItem)
  {
    -[GEOPDPlaceCollectionItem _readAppClip]((uint64_t)self->_placeCollectionItem);
    if (placeCollectionItem->_appClip)
    {
      v4 = [GEOQuickLink alloc];
      v5 = -[GEOPDPlaceCollectionItem appClip]((id *)&self->_placeCollectionItem->super.super.isa);
      v6 = [(GEOQuickLink *)v4 initWithQuickLink:v5];

      if ([(GEOQuickLink *)v6 type] == 2) {
        goto LABEL_6;
      }
    }
  }
  v6 = 0;
LABEL_6:

  return v6;
}

- (BOOL)disableAppClipFallback
{
  placeCollectionItem = self->_placeCollectionItem;
  return placeCollectionItem && placeCollectionItem->_disableAppClipFallback;
}

- (void).cxx_destruct
{
}

@end