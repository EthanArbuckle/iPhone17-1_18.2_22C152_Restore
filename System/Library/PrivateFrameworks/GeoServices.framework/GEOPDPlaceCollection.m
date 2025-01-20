@interface GEOPDPlaceCollection
+ (id)collectionComponentsForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceCollection)init;
- (GEOPDPlaceCollection)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)authorName;
- (id)authorPhoto;
- (id)collectionDescription;
- (id)collectionDescriptionHtmls;
- (id)collectionDescriptions;
- (id)collectionHTMLDescription;
- (id)collectionId;
- (id)collectionItemDescriptionHtmls;
- (id)collectionItemDescriptions;
- (id)collectionLongTitle;
- (id)collectionTitle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayTitles;
- (id)itemIds;
- (id)jsonRepresentation;
- (id)longTitles;
- (id)mediaLinks;
- (id)photos;
- (id)publisher;
- (id)publisherDescriptionOfCollectionItem;
- (id)publisherHTMLDescriptionOfCollectionItem;
- (id)url;
- (os_unfair_lock_s)_initWithDictionary:(int)a3 isJSON:;
- (os_unfair_lock_s)errorState;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_addNoFlagsCollectionClassDisplayName:(uint64_t)a1;
- (void)_addNoFlagsCollectionClassSpokenName:(uint64_t)a1;
- (void)_addNoFlagsCollectionDescription:(uint64_t)a1;
- (void)_addNoFlagsCollectionDescriptionBytes:(uint64_t)a1;
- (void)_addNoFlagsCollectionDescriptionHtml:(uint64_t)a1;
- (void)_addNoFlagsCollectionItemDescription:(uint64_t)a1;
- (void)_addNoFlagsCollectionItemDescriptionHtml:(uint64_t)a1;
- (void)_addNoFlagsDisplayTitle:(uint64_t)a1;
- (void)_addNoFlagsItemId:(uint64_t)a1;
- (void)_addNoFlagsItemPhoto:(uint64_t)a1;
- (void)_addNoFlagsLocalizedCategory:(uint64_t)a1;
- (void)_addNoFlagsLongSpokenTitle:(uint64_t)a1;
- (void)_addNoFlagsLongTitle:(uint64_t)a1;
- (void)_addNoFlagsMediaLink:(uint64_t)a1;
- (void)_addNoFlagsPhoto:(uint64_t)a1;
- (void)_addNoFlagsPlaceCollectionItem:(uint64_t)a1;
- (void)_addNoFlagsSpokenTitle:(uint64_t)a1;
- (void)_readAuthorName;
- (void)_readAuthorPhoto;
- (void)_readCollectionDescriptionHtmls;
- (void)_readCollectionDescriptions;
- (void)_readCollectionId;
- (void)_readCollectionItemDescriptionHtmls;
- (void)_readCollectionItemDescriptions;
- (void)_readDisplayTitles;
- (void)_readItemIds;
- (void)_readLongTitles;
- (void)_readMediaLinks;
- (void)_readPhotos;
- (void)_readPlaceCollectionItems;
- (void)_readPublisher;
- (void)_readPublisherId;
- (void)_readUrl;
- (void)addCollectionClassDisplayName:(uint64_t)a1;
- (void)addCollectionClassSpokenName:(uint64_t)a1;
- (void)addCollectionDescription:(os_unfair_lock_s *)a1;
- (void)addCollectionDescriptionBytes:(uint64_t)a1;
- (void)addCollectionDescriptionHtml:(os_unfair_lock_s *)a1;
- (void)addCollectionItemDescription:(os_unfair_lock_s *)a1;
- (void)addCollectionItemDescriptionHtml:(os_unfair_lock_s *)a1;
- (void)addDisplayTitle:(os_unfair_lock_s *)a1;
- (void)addItemId:(os_unfair_lock_s *)a1;
- (void)addItemPhoto:(uint64_t)a1;
- (void)addLocalizedCategory:(uint64_t)a1;
- (void)addLongSpokenTitle:(uint64_t)a1;
- (void)addLongTitle:(os_unfair_lock_s *)a1;
- (void)addMediaLink:(os_unfair_lock_s *)a1;
- (void)addPhoto:(os_unfair_lock_s *)a1;
- (void)addPlaceCollectionItem:(os_unfair_lock_s *)a1;
- (void)addSpokenTitle:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setAuthorName:(uint64_t)a1;
- (void)setAuthorPhoto:(uint64_t)a1;
- (void)setCollectionId:(uint64_t)a1;
- (void)setPublisher:(uint64_t)a1;
- (void)setPublisherId:(uint64_t)a1;
- (void)setUrl:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceCollection

- (GEOPDPlaceCollection)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceCollection;
  v2 = [(GEOPDPlaceCollection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (id)url
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceCollection _readUrl]((uint64_t)a1);
    a1 = (id *)v2[26];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readUrl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 243) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrl_tags_7193);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (void)addCollectionItemDescription:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPlaceCollection _readCollectionItemDescriptions]((uint64_t)a1);
    -[GEOPDPlaceCollection _addNoFlagsCollectionItemDescription:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[60]._os_unfair_lock_opaque |= 0x4000u;
    os_unfair_lock_unlock(a1 + 56);
    a1[60]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_addNoFlagsCollectionDescription:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_addNoFlagsItemId:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 112);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = v5;

      v4 = *(void **)(a1 + 112);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_addNoFlagsPhoto:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 168);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 168);
      *(void *)(a1 + 168) = v5;

      v4 = *(void **)(a1 + 168);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_addNoFlagsDisplayTitle:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 104);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v5;

      v4 = *(void **)(a1 + 104);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_addNoFlagsSpokenTitle:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 200);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 200);
      *(void *)(a1 + 200) = v5;

      v4 = *(void **)(a1 + 200);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_addNoFlagsPlaceCollectionItem:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 176);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 176);
      *(void *)(a1 + 176) = v5;

      v4 = *(void **)(a1 + 176);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)collectionTitle
{
  v2 = -[GEOPDPlaceCollection displayTitles]((id *)&self->super.super.isa);
  id v3 = +[GEOLocalizedString bestStringForCurrentLocale:v2 fallbackToFirstAvailable:1];

  return v3;
}

- (id)displayTitles
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceCollection _readDisplayTitles]((uint64_t)a1);
    a1 = (id *)v2[13];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readDisplayTitles
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 241) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayTitles_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)photos
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceCollection _readPhotos]((uint64_t)a1);
    a1 = (id *)v2[21];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPhotos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 242) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotos_tags_7191);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_72;
  }
  -[GEOPDPlaceCollection readAll:]((uint64_t)self, 1);
  -[GEOPDPlaceCollection readAll:]((uint64_t)v4, 1);
  displayTitles = self->_displayTitles;
  if ((unint64_t)displayTitles | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](displayTitles, "isEqual:")) {
      goto LABEL_72;
    }
  }
  collectionDescriptions = self->_collectionDescriptions;
  if ((unint64_t)collectionDescriptions | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](collectionDescriptions, "isEqual:")) {
      goto LABEL_72;
    }
  }
  photos = self->_photos;
  if ((unint64_t)photos | *((void *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](photos, "isEqual:")) {
      goto LABEL_72;
    }
  }
  collectionId = self->_collectionId;
  if ((unint64_t)collectionId | *((void *)v4 + 10))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](collectionId, "isEqual:")) {
      goto LABEL_72;
    }
  }
  publisherId = self->_publisherId;
  if ((unint64_t)publisherId | *((void *)v4 + 23))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](publisherId, "isEqual:")) {
      goto LABEL_72;
    }
  }
  placeCollectionItems = self->_placeCollectionItems;
  if ((unint64_t)placeCollectionItems | *((void *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](placeCollectionItems, "isEqual:")) {
      goto LABEL_72;
    }
  }
  spokenTitles = self->_spokenTitles;
  if ((unint64_t)spokenTitles | *((void *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](spokenTitles, "isEqual:")) {
      goto LABEL_72;
    }
  }
  itemIds = self->_itemIds;
  if ((unint64_t)itemIds | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](itemIds, "isEqual:")) {
      goto LABEL_72;
    }
  }
  int v13 = *((_DWORD *)v4 + 60);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_numItems != *((_DWORD *)v4 + 58)) {
      goto LABEL_72;
    }
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_72;
  }
  collectionClassDisplayNames = self->_collectionClassDisplayNames;
  if ((unint64_t)collectionClassDisplayNames | *((void *)v4 + 5)
    && !-[NSMutableArray isEqual:](collectionClassDisplayNames, "isEqual:"))
  {
    goto LABEL_72;
  }
  collectionClassSpokenNames = self->_collectionClassSpokenNames;
  if ((unint64_t)collectionClassSpokenNames | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](collectionClassSpokenNames, "isEqual:")) {
      goto LABEL_72;
    }
  }
  int v16 = *((_DWORD *)v4 + 60);
  if (*(unsigned char *)&self->_flags)
  {
    if ((v16 & 1) == 0 || self->_modifiedTime != *((double *)v4 + 20)) {
      goto LABEL_72;
    }
  }
  else if (v16)
  {
    goto LABEL_72;
  }
  url = self->_url;
  if ((unint64_t)url | *((void *)v4 + 26) && !-[NSString isEqual:](url, "isEqual:")) {
    goto LABEL_72;
  }
  authorName = self->_authorName;
  if ((unint64_t)authorName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](authorName, "isEqual:")) {
      goto LABEL_72;
    }
  }
  publisher = self->_publisher;
  if ((unint64_t)publisher | *((void *)v4 + 24))
  {
    if (!-[GEOPDPublisher isEqual:](publisher, "isEqual:")) {
      goto LABEL_72;
    }
  }
  $5C185B3F1CE4A3565E103C9829A476EA flags = self->_flags;
  int v21 = *((_DWORD *)v4 + 60);
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v21 & 8) == 0) {
      goto LABEL_72;
    }
    if (self->_enableFallbackImagesForItems)
    {
      if (!*((unsigned char *)v4 + 236)) {
        goto LABEL_72;
      }
    }
    else if (*((unsigned char *)v4 + 236))
    {
      goto LABEL_72;
    }
  }
  else if ((v21 & 8) != 0)
  {
    goto LABEL_72;
  }
  authorPhoto = self->_authorPhoto;
  if (!((unint64_t)authorPhoto | *((void *)v4 + 4))) {
    goto LABEL_49;
  }
  if (!-[GEOPDCaptionedPhoto isEqual:](authorPhoto, "isEqual:"))
  {
LABEL_72:
    char v32 = 0;
    goto LABEL_73;
  }
  $5C185B3F1CE4A3565E103C9829A476EA flags = self->_flags;
  int v21 = *((_DWORD *)v4 + 60);
LABEL_49:
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v21 & 2) == 0 || self->_errorState != *((_DWORD *)v4 + 57)) {
      goto LABEL_72;
    }
  }
  else if ((v21 & 2) != 0)
  {
    goto LABEL_72;
  }
  collectionDescriptionBytes = self->_collectionDescriptionBytes;
  if ((unint64_t)collectionDescriptionBytes | *((void *)v4 + 7)
    && !-[NSMutableArray isEqual:](collectionDescriptionBytes, "isEqual:"))
  {
    goto LABEL_72;
  }
  collectionDescriptionHtmls = self->_collectionDescriptionHtmls;
  if ((unint64_t)collectionDescriptionHtmls | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](collectionDescriptionHtmls, "isEqual:")) {
      goto LABEL_72;
    }
  }
  collectionItemDescriptions = self->_collectionItemDescriptions;
  if ((unint64_t)collectionItemDescriptions | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](collectionItemDescriptions, "isEqual:")) {
      goto LABEL_72;
    }
  }
  collectionItemDescriptionHtmls = self->_collectionItemDescriptionHtmls;
  if ((unint64_t)collectionItemDescriptionHtmls | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](collectionItemDescriptionHtmls, "isEqual:")) {
      goto LABEL_72;
    }
  }
  longTitles = self->_longTitles;
  if ((unint64_t)longTitles | *((void *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](longTitles, "isEqual:")) {
      goto LABEL_72;
    }
  }
  longSpokenTitles = self->_longSpokenTitles;
  if ((unint64_t)longSpokenTitles | *((void *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](longSpokenTitles, "isEqual:")) {
      goto LABEL_72;
    }
  }
  mediaLinks = self->_mediaLinks;
  if ((unint64_t)mediaLinks | *((void *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](mediaLinks, "isEqual:")) {
      goto LABEL_72;
    }
  }
  itemPhotos = self->_itemPhotos;
  if ((unint64_t)itemPhotos | *((void *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](itemPhotos, "isEqual:")) {
      goto LABEL_72;
    }
  }
  localizedCategorys = self->_localizedCategorys;
  if ((unint64_t)localizedCategorys | *((void *)v4 + 16)) {
    char v32 = -[NSMutableArray isEqual:](localizedCategorys, "isEqual:");
  }
  else {
    char v32 = 1;
  }
LABEL_73:

  return v32;
}

- (id)collectionId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceCollection _readCollectionId]((uint64_t)a1);
    a1 = (id *)v2[10];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readCollectionId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 241) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollectionId_tags_7192);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (unint64_t)hash
{
  -[GEOPDPlaceCollection readAll:]((uint64_t)self, 1);
  uint64_t v37 = [(NSMutableArray *)self->_displayTitles hash];
  uint64_t v36 = [(NSMutableArray *)self->_collectionDescriptions hash];
  uint64_t v35 = [(NSMutableArray *)self->_photos hash];
  unint64_t v34 = [(GEOPDMapsIdentifier *)self->_collectionId hash];
  unint64_t v33 = [(GEOPDMapsIdentifier *)self->_publisherId hash];
  uint64_t v32 = [(NSMutableArray *)self->_placeCollectionItems hash];
  uint64_t v31 = [(NSMutableArray *)self->_spokenTitles hash];
  uint64_t v30 = [(NSMutableArray *)self->_itemIds hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v29 = 2654435761 * self->_numItems;
  }
  else {
    uint64_t v29 = 0;
  }
  uint64_t v3 = [(NSMutableArray *)self->_collectionClassDisplayNames hash];
  uint64_t v4 = [(NSMutableArray *)self->_collectionClassSpokenNames hash];
  if (*(unsigned char *)&self->_flags)
  {
    double modifiedTime = self->_modifiedTime;
    double v7 = -modifiedTime;
    if (modifiedTime >= 0.0) {
      double v7 = self->_modifiedTime;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    double v10 = fmod(v8, 1.84467441e19);
    unint64_t v11 = 2654435761u * (unint64_t)v10;
    unint64_t v12 = v11 + (unint64_t)v9;
    if (v9 <= 0.0) {
      unint64_t v12 = 2654435761u * (unint64_t)v10;
    }
    unint64_t v13 = v11 - (unint64_t)fabs(v9);
    if (v9 < 0.0) {
      unint64_t v5 = v13;
    }
    else {
      unint64_t v5 = v12;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  NSUInteger v14 = [(NSString *)self->_url hash];
  NSUInteger v15 = [(NSString *)self->_authorName hash];
  unint64_t v16 = [(GEOPDPublisher *)self->_publisher hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    uint64_t v17 = 2654435761 * self->_enableFallbackImagesForItems;
  }
  else {
    uint64_t v17 = 0;
  }
  unint64_t v18 = [(GEOPDCaptionedPhoto *)self->_authorPhoto hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v19 = 2654435761 * self->_errorState;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v20 = v36 ^ v37 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v3 ^ v4 ^ v5 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ [(NSMutableArray *)self->_collectionDescriptionBytes hash];
  uint64_t v21 = [(NSMutableArray *)self->_collectionDescriptionHtmls hash];
  uint64_t v22 = v21 ^ [(NSMutableArray *)self->_collectionItemDescriptions hash];
  uint64_t v23 = v22 ^ [(NSMutableArray *)self->_collectionItemDescriptionHtmls hash];
  uint64_t v24 = v23 ^ [(NSMutableArray *)self->_longTitles hash];
  uint64_t v25 = v24 ^ [(NSMutableArray *)self->_longSpokenTitles hash];
  uint64_t v26 = v25 ^ [(NSMutableArray *)self->_mediaLinks hash];
  uint64_t v27 = v20 ^ v26 ^ [(NSMutableArray *)self->_itemPhotos hash];
  return v27 ^ [(NSMutableArray *)self->_localizedCategorys hash];
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    uint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_7324;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_7325;
      }
      GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDPlaceCollectionCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)publisher
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceCollection _readPublisher]((uint64_t)a1);
    a1 = (id *)v2[24];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPublisher
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 243) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPublisher_tags_7194);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v193 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    double v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 3) & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPlaceCollectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_133;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceCollection readAll:]((uint64_t)self, 0);
  long long v175 = 0u;
  long long v174 = 0u;
  long long v173 = 0u;
  long long v172 = 0u;
  double v9 = self->_displayTitles;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v172 objects:v192 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v173;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v173 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v172 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDPlaceCollection addDisplayTitle:]((os_unfair_lock_s *)v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v172 objects:v192 count:16];
    }
    while (v10);
  }

  long long v170 = 0u;
  long long v171 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  NSUInteger v14 = self->_collectionDescriptions;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v168 objects:v191 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v169;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v169 != v16) {
          objc_enumerationMutation(v14);
        }
        unint64_t v18 = (void *)[*(id *)(*((void *)&v168 + 1) + 8 * j) copyWithZone:a3];
        -[GEOPDPlaceCollection addCollectionDescription:]((os_unfair_lock_s *)v5, v18);
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v168 objects:v191 count:16];
    }
    while (v15);
  }

  long long v166 = 0u;
  long long v167 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  uint64_t v19 = self->_photos;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v164 objects:v190 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v165;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v165 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = (void *)[*(id *)(*((void *)&v164 + 1) + 8 * k) copyWithZone:a3];
        -[GEOPDPlaceCollection addPhoto:]((os_unfair_lock_s *)v5, v23);
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v164 objects:v190 count:16];
    }
    while (v20);
  }

  id v24 = [(GEOPDMapsIdentifier *)self->_collectionId copyWithZone:a3];
  uint64_t v25 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v24;

  id v26 = [(GEOPDMapsIdentifier *)self->_publisherId copyWithZone:a3];
  uint64_t v27 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v26;

  long long v162 = 0u;
  long long v163 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  v28 = self->_placeCollectionItems;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v160 objects:v189 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v161;
    do
    {
      for (uint64_t m = 0; m != v29; ++m)
      {
        if (*(void *)v161 != v30) {
          objc_enumerationMutation(v28);
        }
        uint64_t v32 = (void *)[*(id *)(*((void *)&v160 + 1) + 8 * m) copyWithZone:a3];
        -[GEOPDPlaceCollection addPlaceCollectionItem:]((os_unfair_lock_s *)v5, v32);
      }
      uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v160 objects:v189 count:16];
    }
    while (v29);
  }

  long long v158 = 0u;
  long long v159 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  unint64_t v33 = self->_spokenTitles;
  uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v156 objects:v188 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v157;
    do
    {
      for (uint64_t n = 0; n != v34; ++n)
      {
        if (*(void *)v157 != v35) {
          objc_enumerationMutation(v33);
        }
        uint64_t v37 = (void *)[*(id *)(*((void *)&v156 + 1) + 8 * n) copyWithZone:a3];
        -[GEOPDPlaceCollection addSpokenTitle:](v5, v37);
      }
      uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v156 objects:v188 count:16];
    }
    while (v34);
  }

  long long v154 = 0u;
  long long v155 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  v38 = self->_itemIds;
  uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v152 objects:v187 count:16];
  if (v39)
  {
    uint64_t v40 = *(void *)v153;
    do
    {
      for (iuint64_t i = 0; ii != v39; ++ii)
      {
        if (*(void *)v153 != v40) {
          objc_enumerationMutation(v38);
        }
        v42 = (void *)[*(id *)(*((void *)&v152 + 1) + 8 * ii) copyWithZone:a3];
        -[GEOPDPlaceCollection addItemId:]((os_unfair_lock_s *)v5, v42);
      }
      uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v152 objects:v187 count:16];
    }
    while (v39);
  }

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 232) = self->_numItems;
    *(_DWORD *)(v5 + 240) |= 4u;
  }
  long long v150 = 0u;
  long long v151 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  v43 = self->_collectionClassDisplayNames;
  uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v148 objects:v186 count:16];
  if (v44)
  {
    uint64_t v45 = *(void *)v149;
    do
    {
      for (juint64_t j = 0; jj != v44; ++jj)
      {
        if (*(void *)v149 != v45) {
          objc_enumerationMutation(v43);
        }
        v47 = (void *)[*(id *)(*((void *)&v148 + 1) + 8 * jj) copyWithZone:a3];
        -[GEOPDPlaceCollection addCollectionClassDisplayName:](v5, v47);
      }
      uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v148 objects:v186 count:16];
    }
    while (v44);
  }

  long long v146 = 0u;
  long long v147 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  v48 = self->_collectionClassSpokenNames;
  uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v144 objects:v185 count:16];
  if (v49)
  {
    uint64_t v50 = *(void *)v145;
    do
    {
      for (kuint64_t k = 0; kk != v49; ++kk)
      {
        if (*(void *)v145 != v50) {
          objc_enumerationMutation(v48);
        }
        v52 = (void *)[*(id *)(*((void *)&v144 + 1) + 8 * kk) copyWithZone:a3];
        -[GEOPDPlaceCollection addCollectionClassSpokenName:](v5, v52);
      }
      uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v144 objects:v185 count:16];
    }
    while (v49);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 160) = self->_modifiedTime;
    *(_DWORD *)(v5 + 240) |= 1u;
  }
  uint64_t v53 = [(NSString *)self->_url copyWithZone:a3];
  v54 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v53;

  uint64_t v55 = [(NSString *)self->_authorName copyWithZone:a3];
  v56 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v55;

  id v57 = [(GEOPDPublisher *)self->_publisher copyWithZone:a3];
  v58 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v57;

  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *(unsigned char *)(v5 + 236) = self->_enableFallbackImagesForItems;
    *(_DWORD *)(v5 + 240) |= 8u;
  }
  id v59 = [(GEOPDCaptionedPhoto *)self->_authorPhoto copyWithZone:a3];
  v60 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v59;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 228) = self->_errorState;
    *(_DWORD *)(v5 + 240) |= 2u;
  }
  long long v142 = 0u;
  long long v143 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  v61 = self->_collectionDescriptionBytes;
  uint64_t v62 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v140 objects:v184 count:16];
  if (v62)
  {
    uint64_t v63 = *(void *)v141;
    do
    {
      for (muint64_t m = 0; mm != v62; ++mm)
      {
        if (*(void *)v141 != v63) {
          objc_enumerationMutation(v61);
        }
        v65 = (void *)[*(id *)(*((void *)&v140 + 1) + 8 * mm) copyWithZone:a3];
        -[GEOPDPlaceCollection addCollectionDescriptionBytes:](v5, v65);
      }
      uint64_t v62 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v140 objects:v184 count:16];
    }
    while (v62);
  }

  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  v66 = self->_collectionDescriptionHtmls;
  uint64_t v67 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v136 objects:v183 count:16];
  if (v67)
  {
    uint64_t v68 = *(void *)v137;
    do
    {
      for (nuint64_t n = 0; nn != v67; ++nn)
      {
        if (*(void *)v137 != v68) {
          objc_enumerationMutation(v66);
        }
        v70 = (void *)[*(id *)(*((void *)&v136 + 1) + 8 * nn) copyWithZone:a3];
        -[GEOPDPlaceCollection addCollectionDescriptionHtml:]((os_unfair_lock_s *)v5, v70);
      }
      uint64_t v67 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v136 objects:v183 count:16];
    }
    while (v67);
  }

  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  v71 = self->_collectionItemDescriptions;
  uint64_t v72 = [(NSMutableArray *)v71 countByEnumeratingWithState:&v132 objects:v182 count:16];
  if (v72)
  {
    uint64_t v73 = *(void *)v133;
    do
    {
      for (uint64_t i1 = 0; i1 != v72; ++i1)
      {
        if (*(void *)v133 != v73) {
          objc_enumerationMutation(v71);
        }
        v75 = (void *)[*(id *)(*((void *)&v132 + 1) + 8 * i1) copyWithZone:a3];
        -[GEOPDPlaceCollection addCollectionItemDescription:]((os_unfair_lock_s *)v5, v75);
      }
      uint64_t v72 = [(NSMutableArray *)v71 countByEnumeratingWithState:&v132 objects:v182 count:16];
    }
    while (v72);
  }

  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  v76 = self->_collectionItemDescriptionHtmls;
  uint64_t v77 = [(NSMutableArray *)v76 countByEnumeratingWithState:&v128 objects:v181 count:16];
  if (v77)
  {
    uint64_t v78 = *(void *)v129;
    do
    {
      for (uint64_t i2 = 0; i2 != v77; ++i2)
      {
        if (*(void *)v129 != v78) {
          objc_enumerationMutation(v76);
        }
        v80 = (void *)[*(id *)(*((void *)&v128 + 1) + 8 * i2) copyWithZone:a3];
        -[GEOPDPlaceCollection addCollectionItemDescriptionHtml:]((os_unfair_lock_s *)v5, v80);
      }
      uint64_t v77 = [(NSMutableArray *)v76 countByEnumeratingWithState:&v128 objects:v181 count:16];
    }
    while (v77);
  }

  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  v81 = self->_longTitles;
  uint64_t v82 = [(NSMutableArray *)v81 countByEnumeratingWithState:&v124 objects:v180 count:16];
  if (v82)
  {
    uint64_t v83 = *(void *)v125;
    do
    {
      for (uint64_t i3 = 0; i3 != v82; ++i3)
      {
        if (*(void *)v125 != v83) {
          objc_enumerationMutation(v81);
        }
        v85 = (void *)[*(id *)(*((void *)&v124 + 1) + 8 * i3) copyWithZone:a3];
        -[GEOPDPlaceCollection addLongTitle:]((os_unfair_lock_s *)v5, v85);
      }
      uint64_t v82 = [(NSMutableArray *)v81 countByEnumeratingWithState:&v124 objects:v180 count:16];
    }
    while (v82);
  }

  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  v86 = self->_longSpokenTitles;
  uint64_t v87 = [(NSMutableArray *)v86 countByEnumeratingWithState:&v120 objects:v179 count:16];
  if (v87)
  {
    uint64_t v88 = *(void *)v121;
    do
    {
      for (uint64_t i4 = 0; i4 != v87; ++i4)
      {
        if (*(void *)v121 != v88) {
          objc_enumerationMutation(v86);
        }
        v90 = (void *)[*(id *)(*((void *)&v120 + 1) + 8 * i4) copyWithZone:a3];
        -[GEOPDPlaceCollection addLongSpokenTitle:](v5, v90);
      }
      uint64_t v87 = [(NSMutableArray *)v86 countByEnumeratingWithState:&v120 objects:v179 count:16];
    }
    while (v87);
  }

  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  v91 = self->_mediaLinks;
  uint64_t v92 = [(NSMutableArray *)v91 countByEnumeratingWithState:&v116 objects:v178 count:16];
  if (v92)
  {
    uint64_t v93 = *(void *)v117;
    do
    {
      for (uint64_t i5 = 0; i5 != v92; ++i5)
      {
        if (*(void *)v117 != v93) {
          objc_enumerationMutation(v91);
        }
        v95 = (void *)[*(id *)(*((void *)&v116 + 1) + 8 * i5) copyWithZone:a3];
        -[GEOPDPlaceCollection addMediaLink:]((os_unfair_lock_s *)v5, v95);
      }
      uint64_t v92 = [(NSMutableArray *)v91 countByEnumeratingWithState:&v116 objects:v178 count:16];
    }
    while (v92);
  }

  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  v96 = self->_itemPhotos;
  uint64_t v97 = [(NSMutableArray *)v96 countByEnumeratingWithState:&v112 objects:v177 count:16];
  if (v97)
  {
    uint64_t v98 = *(void *)v113;
    do
    {
      for (uint64_t i6 = 0; i6 != v97; ++i6)
      {
        if (*(void *)v113 != v98) {
          objc_enumerationMutation(v96);
        }
        v100 = (void *)[*(id *)(*((void *)&v112 + 1) + 8 * i6) copyWithZone:a3];
        -[GEOPDPlaceCollection addItemPhoto:](v5, v100);
      }
      uint64_t v97 = [(NSMutableArray *)v96 countByEnumeratingWithState:&v112 objects:v177 count:16];
    }
    while (v97);
  }

  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  v101 = self->_localizedCategorys;
  uint64_t v102 = [(NSMutableArray *)v101 countByEnumeratingWithState:&v108 objects:v176 count:16];
  if (v102)
  {
    uint64_t v103 = *(void *)v109;
    do
    {
      for (uint64_t i7 = 0; i7 != v102; ++i7)
      {
        if (*(void *)v109 != v103) {
          objc_enumerationMutation(v101);
        }
        v105 = objc_msgSend(*(id *)(*((void *)&v108 + 1) + 8 * i7), "copyWithZone:", a3, (void)v108);
        -[GEOPDPlaceCollection addLocalizedCategory:](v5, v105);
      }
      uint64_t v102 = [(NSMutableArray *)v101 countByEnumeratingWithState:&v108 objects:v176 count:16];
    }
    while (v102);
  }

  v106 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v106;
LABEL_133:

  return (id)v5;
}

- (os_unfair_lock_s)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v386 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_super v6 = (os_unfair_lock_s *)(id)[a1 init];

  if (!v6) {
    goto LABEL_486;
  }
  if (a3) {
    double v7 = @"displayTitle";
  }
  else {
    double v7 = @"display_title";
  }
  id v8 = objc_msgSend(v5, "objectForKeyedSubscript:", v7, v5);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v363 = 0u;
    long long v362 = 0u;
    long long v361 = 0u;
    long long v360 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v360 objects:v384 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v361;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v361 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v360 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v15 = [GEOLocalizedString alloc];
            if (a3) {
              uint64_t v16 = [(GEOLocalizedString *)v15 initWithJSON:v14];
            }
            else {
              uint64_t v16 = [(GEOLocalizedString *)v15 initWithDictionary:v14];
            }
            uint64_t v17 = v16;
            -[GEOPDPlaceCollection addDisplayTitle:](v6, v16);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v360 objects:v384 count:16];
      }
      while (v11);
    }
  }
  if (a3) {
    unint64_t v18 = @"collectionDescription";
  }
  else {
    unint64_t v18 = @"collection_description";
  }
  uint64_t v19 = [v278 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v359 = 0u;
    long long v358 = 0u;
    long long v357 = 0u;
    long long v356 = 0u;
    id v20 = v19;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v356 objects:v383 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v357;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v357 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v356 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v26 = [GEOLocalizedString alloc];
            if (a3) {
              uint64_t v27 = [(GEOLocalizedString *)v26 initWithJSON:v25];
            }
            else {
              uint64_t v27 = [(GEOLocalizedString *)v26 initWithDictionary:v25];
            }
            v28 = v27;
            -[GEOPDPlaceCollection addCollectionDescription:](v6, v27);
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v356 objects:v383 count:16];
      }
      while (v22);
    }
  }
  uint64_t v29 = [v278 objectForKeyedSubscript:@"photo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v355 = 0u;
    long long v354 = 0u;
    long long v353 = 0u;
    long long v352 = 0u;
    id v30 = v29;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v352 objects:v382 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v353;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v353 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void **)(*((void *)&v352 + 1) + 8 * v34);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v36 = [GEOPDCaptionedPhoto alloc];
            if (v36) {
              uint64_t v37 = (void *)-[GEOPDCaptionedPhoto _initWithDictionary:isJSON:](v36, v35, a3);
            }
            else {
              uint64_t v37 = 0;
            }
            -[GEOPDPlaceCollection addPhoto:](v6, v37);
          }
          ++v34;
        }
        while (v32 != v34);
        uint64_t v38 = [v30 countByEnumeratingWithState:&v352 objects:v382 count:16];
        uint64_t v32 = v38;
      }
      while (v38);
    }
  }
  if (a3) {
    uint64_t v39 = @"collectionId";
  }
  else {
    uint64_t v39 = @"collection_id";
  }
  uint64_t v40 = [v278 objectForKeyedSubscript:v39];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v41 = [GEOPDMapsIdentifier alloc];
    if (a3) {
      v42 = [(GEOPDMapsIdentifier *)v41 initWithJSON:v40];
    }
    else {
      v42 = [(GEOPDMapsIdentifier *)v41 initWithDictionary:v40];
    }
    v43 = v42;
    -[GEOPDPlaceCollection setCollectionId:]((uint64_t)v6, v42);
  }
  if (a3) {
    uint64_t v44 = @"publisherId";
  }
  else {
    uint64_t v44 = @"publisher_id";
  }
  uint64_t v45 = [v278 objectForKeyedSubscript:v44];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v46 = [GEOPDMapsIdentifier alloc];
    if (a3) {
      v47 = [(GEOPDMapsIdentifier *)v46 initWithJSON:v45];
    }
    else {
      v47 = [(GEOPDMapsIdentifier *)v46 initWithDictionary:v45];
    }
    v48 = v47;
    -[GEOPDPlaceCollection setPublisherId:]((uint64_t)v6, v47);
  }
  if (a3) {
    uint64_t v49 = @"placeCollectionItem";
  }
  else {
    uint64_t v49 = @"place_collection_item";
  }
  uint64_t v50 = [v278 objectForKeyedSubscript:v49];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v350 = 0u;
    long long v351 = 0u;
    long long v348 = 0u;
    long long v349 = 0u;
    id v51 = v50;
    uint64_t v52 = [v51 countByEnumeratingWithState:&v348 objects:v381 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v349;
      do
      {
        uint64_t v55 = 0;
        do
        {
          if (*(void *)v349 != v54) {
            objc_enumerationMutation(v51);
          }
          v56 = *(void **)(*((void *)&v348 + 1) + 8 * v55);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v57 = [GEOPDPlaceCollectionItem alloc];
            if (v57) {
              v58 = (void *)-[GEOPDPlaceCollectionItem _initWithDictionary:isJSON:](v57, v56, a3);
            }
            else {
              v58 = 0;
            }
            -[GEOPDPlaceCollection addPlaceCollectionItem:](v6, v58);
          }
          ++v55;
        }
        while (v53 != v55);
        uint64_t v59 = [v51 countByEnumeratingWithState:&v348 objects:v381 count:16];
        uint64_t v53 = v59;
      }
      while (v59);
    }
  }
  if (a3) {
    v60 = @"spokenTitle";
  }
  else {
    v60 = @"spoken_title";
  }
  v61 = [v278 objectForKeyedSubscript:v60];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v346 = 0u;
    long long v347 = 0u;
    long long v344 = 0u;
    long long v345 = 0u;
    id v62 = v61;
    uint64_t v63 = [v62 countByEnumeratingWithState:&v344 objects:v380 count:16];
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v65 = *(void *)v345;
      do
      {
        for (uint64_t k = 0; k != v64; ++k)
        {
          if (*(void *)v345 != v65) {
            objc_enumerationMutation(v62);
          }
          uint64_t v67 = *(void *)(*((void *)&v344 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v68 = [GEOLocalizedString alloc];
            if (a3) {
              v69 = [(GEOLocalizedString *)v68 initWithJSON:v67];
            }
            else {
              v69 = [(GEOLocalizedString *)v68 initWithDictionary:v67];
            }
            v70 = v69;
            -[GEOPDPlaceCollection addSpokenTitle:]((uint64_t)v6, v69);
          }
        }
        uint64_t v64 = [v62 countByEnumeratingWithState:&v344 objects:v380 count:16];
      }
      while (v64);
    }
  }
  if (a3) {
    v71 = @"itemId";
  }
  else {
    v71 = @"item_id";
  }
  uint64_t v72 = [v278 objectForKeyedSubscript:v71];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v342 = 0u;
    long long v343 = 0u;
    long long v340 = 0u;
    long long v341 = 0u;
    id v73 = v72;
    uint64_t v74 = [v73 countByEnumeratingWithState:&v340 objects:v379 count:16];
    if (v74)
    {
      uint64_t v75 = v74;
      uint64_t v76 = *(void *)v341;
      do
      {
        for (uint64_t m = 0; m != v75; ++m)
        {
          if (*(void *)v341 != v76) {
            objc_enumerationMutation(v73);
          }
          uint64_t v78 = *(void *)(*((void *)&v340 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v79 = [GEOPDMapsIdentifier alloc];
            if (a3) {
              v80 = [(GEOPDMapsIdentifier *)v79 initWithJSON:v78];
            }
            else {
              v80 = [(GEOPDMapsIdentifier *)v79 initWithDictionary:v78];
            }
            v81 = v80;
            -[GEOPDPlaceCollection addItemId:](v6, v80);
          }
        }
        uint64_t v75 = [v73 countByEnumeratingWithState:&v340 objects:v379 count:16];
      }
      while (v75);
    }
  }
  if (a3) {
    uint64_t v82 = @"numItems";
  }
  else {
    uint64_t v82 = @"num_items";
  }
  uint64_t v83 = [v278 objectForKeyedSubscript:v82];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint32_t v84 = [v83 unsignedIntValue];
    v6[60]._os_unfair_lock_opaque |= 0x10000000u;
    v6[60]._os_unfair_lock_opaque |= 4u;
    v6[58]._os_unfair_lock_opaque = v84;
  }

  if (a3) {
    v85 = @"collectionClassDisplayName";
  }
  else {
    v85 = @"collection_class_display_name";
  }
  v86 = [v278 objectForKeyedSubscript:v85];
  objc_opt_class();
  int v292 = a3;
  if (objc_opt_isKindOfClass())
  {
    long long v338 = 0u;
    long long v339 = 0u;
    long long v336 = 0u;
    long long v337 = 0u;
    id v87 = v86;
    uint64_t v88 = [v87 countByEnumeratingWithState:&v336 objects:v378 count:16];
    if (v88)
    {
      uint64_t v89 = v88;
      uint64_t v90 = *(void *)v337;
      do
      {
        for (uint64_t n = 0; n != v89; ++n)
        {
          if (*(void *)v337 != v90) {
            objc_enumerationMutation(v87);
          }
          uint64_t v92 = *(void *)(*((void *)&v336 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v93 = [GEOLocalizedString alloc];
            if (v292) {
              v94 = [(GEOLocalizedString *)v93 initWithJSON:v92];
            }
            else {
              v94 = [(GEOLocalizedString *)v93 initWithDictionary:v92];
            }
            v95 = v94;
            -[GEOPDPlaceCollection addCollectionClassDisplayName:]((uint64_t)v6, v94);
          }
        }
        uint64_t v89 = [v87 countByEnumeratingWithState:&v336 objects:v378 count:16];
      }
      while (v89);
    }

    a3 = v292;
  }

  if (a3) {
    v96 = @"collectionClassSpokenName";
  }
  else {
    v96 = @"collection_class_spoken_name";
  }
  uint64_t v97 = [v278 objectForKeyedSubscript:v96];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v334 = 0u;
    long long v335 = 0u;
    long long v332 = 0u;
    long long v333 = 0u;
    id v98 = v97;
    uint64_t v99 = [v98 countByEnumeratingWithState:&v332 objects:v377 count:16];
    if (v99)
    {
      uint64_t v100 = v99;
      uint64_t v101 = *(void *)v333;
      do
      {
        for (iuint64_t i = 0; ii != v100; ++ii)
        {
          if (*(void *)v333 != v101) {
            objc_enumerationMutation(v98);
          }
          uint64_t v103 = *(void *)(*((void *)&v332 + 1) + 8 * ii);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v104 = [GEOLocalizedString alloc];
            if (v292) {
              v105 = [(GEOLocalizedString *)v104 initWithJSON:v103];
            }
            else {
              v105 = [(GEOLocalizedString *)v104 initWithDictionary:v103];
            }
            v106 = v105;
            -[GEOPDPlaceCollection addCollectionClassSpokenName:]((uint64_t)v6, v105);
          }
        }
        uint64_t v100 = [v98 countByEnumeratingWithState:&v332 objects:v377 count:16];
      }
      while (v100);
    }

    a3 = v292;
  }

  if (a3) {
    v107 = @"modifiedTime";
  }
  else {
    v107 = @"modified_time";
  }
  long long v108 = [v278 objectForKeyedSubscript:v107];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v108 doubleValue];
    v6[60]._os_unfair_lock_opaque |= 0x10000000u;
    v6[60]._os_unfair_lock_opaque |= 1u;
    *(void *)&v6[40]._os_unfair_lock_opaque = v109;
  }

  long long v110 = [v278 objectForKeyedSubscript:@"url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v111 = (void *)[v110 copy];
    -[GEOPDPlaceCollection setUrl:]((uint64_t)v6, v111);
  }
  if (a3) {
    long long v112 = @"authorName";
  }
  else {
    long long v112 = @"author_name";
  }
  long long v113 = [v278 objectForKeyedSubscript:v112];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v114 = (void *)[v113 copy];
    -[GEOPDPlaceCollection setAuthorName:]((uint64_t)v6, v114);
  }
  long long v115 = [v278 objectForKeyedSubscript:@"publisher"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v116 = [GEOPDPublisher alloc];
    if (v116) {
      long long v117 = (void *)-[GEOPDPublisher _initWithDictionary:isJSON:](v116, v115, a3);
    }
    else {
      long long v117 = 0;
    }
    -[GEOPDPlaceCollection setPublisher:]((uint64_t)v6, v117);
  }
  if (a3) {
    long long v118 = @"enableFallbackImagesForItems";
  }
  else {
    long long v118 = @"enable_fallback_images_for_items";
  }
  long long v119 = [v278 objectForKeyedSubscript:v118];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v120 = [v119 BOOLValue];
    v6[60]._os_unfair_lock_opaque |= 0x10000000u;
    v6[60]._os_unfair_lock_opaque |= 8u;
    LOBYTE(v6[59]._os_unfair_lock_opaque) = v120;
  }

  if (a3) {
    long long v121 = @"authorPhoto";
  }
  else {
    long long v121 = @"author_photo";
  }
  long long v122 = [v278 objectForKeyedSubscript:v121];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v123 = [GEOPDCaptionedPhoto alloc];
    if (v123) {
      long long v124 = (void *)-[GEOPDCaptionedPhoto _initWithDictionary:isJSON:](v123, v122, a3);
    }
    else {
      long long v124 = 0;
    }
    -[GEOPDPlaceCollection setAuthorPhoto:]((uint64_t)v6, v124);
  }
  if (a3) {
    long long v125 = @"errorState";
  }
  else {
    long long v125 = @"error_state";
  }
  long long v126 = [v278 objectForKeyedSubscript:v125];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v127 = v126;
    if ([v127 isEqualToString:@"BROOKLYN_ERROR_STATE_UNKNOWN"])
    {
      int v128 = 0;
    }
    else if ([v127 isEqualToString:@"BROOKLYN_ERROR_STATE_SUPPRESSED"])
    {
      int v128 = 1;
    }
    else if ([v127 isEqualToString:@"BROOKLYN_ERROR_STATE_BLOCKED"])
    {
      int v128 = 2;
    }
    else
    {
      int v128 = 0;
    }

    goto LABEL_200;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v128 = [v126 intValue];
LABEL_200:
    v6[60]._os_unfair_lock_opaque |= 0x10000000u;
    v6[60]._os_unfair_lock_opaque |= 2u;
    v6[57]._os_unfair_lock_opaque = v128;
  }

  if (a3) {
    long long v129 = @"collectionDescriptionBytes";
  }
  else {
    long long v129 = @"collection_description_bytes";
  }
  long long v130 = [v278 objectForKeyedSubscript:v129];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v330 = 0u;
    long long v331 = 0u;
    long long v328 = 0u;
    long long v329 = 0u;
    id v131 = v130;
    uint64_t v132 = [v131 countByEnumeratingWithState:&v328 objects:v376 count:16];
    if (v132)
    {
      uint64_t v133 = v132;
      uint64_t v134 = *(void *)v329;
      do
      {
        for (juint64_t j = 0; jj != v133; ++jj)
        {
          if (*(void *)v329 != v134) {
            objc_enumerationMutation(v131);
          }
          uint64_t v136 = *(void *)(*((void *)&v328 + 1) + 8 * jj);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v137 = [GEOLocalizedBytes alloc];
            if (a3) {
              long long v138 = [(GEOLocalizedBytes *)v137 initWithJSON:v136];
            }
            else {
              long long v138 = [(GEOLocalizedBytes *)v137 initWithDictionary:v136];
            }
            long long v139 = v138;
            -[GEOPDPlaceCollection addCollectionDescriptionBytes:]((uint64_t)v6, v138);
          }
        }
        uint64_t v133 = [v131 countByEnumeratingWithState:&v328 objects:v376 count:16];
      }
      while (v133);
    }
  }
  if (a3) {
    long long v140 = @"collectionDescriptionHtml";
  }
  else {
    long long v140 = @"collection_description_html";
  }
  long long v141 = [v278 objectForKeyedSubscript:v140];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v326 = 0u;
    long long v327 = 0u;
    long long v324 = 0u;
    long long v325 = 0u;
    id v142 = v141;
    uint64_t v143 = [v142 countByEnumeratingWithState:&v324 objects:v375 count:16];
    if (v143)
    {
      uint64_t v144 = v143;
      uint64_t v145 = *(void *)v325;
      do
      {
        for (kuint64_t k = 0; kk != v144; ++kk)
        {
          if (*(void *)v325 != v145) {
            objc_enumerationMutation(v142);
          }
          uint64_t v147 = *(void *)(*((void *)&v324 + 1) + 8 * kk);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v148 = [GEOLocalizedString alloc];
            if (a3) {
              long long v149 = [(GEOLocalizedString *)v148 initWithJSON:v147];
            }
            else {
              long long v149 = [(GEOLocalizedString *)v148 initWithDictionary:v147];
            }
            long long v150 = v149;
            -[GEOPDPlaceCollection addCollectionDescriptionHtml:](v6, v149);
          }
        }
        uint64_t v144 = [v142 countByEnumeratingWithState:&v324 objects:v375 count:16];
      }
      while (v144);
    }
  }
  if (a3) {
    long long v151 = @"collectionItemDescription";
  }
  else {
    long long v151 = @"collection_item_description";
  }
  long long v152 = [v278 objectForKeyedSubscript:v151];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v322 = 0u;
    long long v323 = 0u;
    long long v320 = 0u;
    long long v321 = 0u;
    id v153 = v152;
    uint64_t v154 = [v153 countByEnumeratingWithState:&v320 objects:v374 count:16];
    if (v154)
    {
      uint64_t v155 = v154;
      uint64_t v156 = *(void *)v321;
      do
      {
        for (muint64_t m = 0; mm != v155; ++mm)
        {
          if (*(void *)v321 != v156) {
            objc_enumerationMutation(v153);
          }
          uint64_t v158 = *(void *)(*((void *)&v320 + 1) + 8 * mm);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v159 = [GEOLocalizedString alloc];
            if (a3) {
              long long v160 = [(GEOLocalizedString *)v159 initWithJSON:v158];
            }
            else {
              long long v160 = [(GEOLocalizedString *)v159 initWithDictionary:v158];
            }
            long long v161 = v160;
            -[GEOPDPlaceCollection addCollectionItemDescription:](v6, v160);
          }
        }
        uint64_t v155 = [v153 countByEnumeratingWithState:&v320 objects:v374 count:16];
      }
      while (v155);
    }
  }
  if (a3) {
    long long v162 = @"collectionItemDescriptionHtml";
  }
  else {
    long long v162 = @"collection_item_description_html";
  }
  long long v163 = [v278 objectForKeyedSubscript:v162];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v318 = 0u;
    long long v319 = 0u;
    long long v316 = 0u;
    long long v317 = 0u;
    id v164 = v163;
    uint64_t v165 = [v164 countByEnumeratingWithState:&v316 objects:v373 count:16];
    if (v165)
    {
      uint64_t v166 = v165;
      uint64_t v167 = *(void *)v317;
      do
      {
        for (nuint64_t n = 0; nn != v166; ++nn)
        {
          if (*(void *)v317 != v167) {
            objc_enumerationMutation(v164);
          }
          uint64_t v169 = *(void *)(*((void *)&v316 + 1) + 8 * nn);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v170 = [GEOLocalizedString alloc];
            if (a3) {
              long long v171 = [(GEOLocalizedString *)v170 initWithJSON:v169];
            }
            else {
              long long v171 = [(GEOLocalizedString *)v170 initWithDictionary:v169];
            }
            long long v172 = v171;
            -[GEOPDPlaceCollection addCollectionItemDescriptionHtml:](v6, v171);
          }
        }
        uint64_t v166 = [v164 countByEnumeratingWithState:&v316 objects:v373 count:16];
      }
      while (v166);
    }
  }
  if (a3) {
    long long v173 = @"longTitle";
  }
  else {
    long long v173 = @"long_title";
  }
  long long v174 = [v278 objectForKeyedSubscript:v173];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v314 = 0u;
    long long v315 = 0u;
    long long v312 = 0u;
    long long v313 = 0u;
    id v175 = v174;
    uint64_t v176 = [v175 countByEnumeratingWithState:&v312 objects:v372 count:16];
    if (v176)
    {
      uint64_t v177 = v176;
      uint64_t v178 = *(void *)v313;
      do
      {
        for (uint64_t i1 = 0; i1 != v177; ++i1)
        {
          if (*(void *)v313 != v178) {
            objc_enumerationMutation(v175);
          }
          uint64_t v180 = *(void *)(*((void *)&v312 + 1) + 8 * i1);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v181 = [GEOLocalizedString alloc];
            if (a3) {
              v182 = [(GEOLocalizedString *)v181 initWithJSON:v180];
            }
            else {
              v182 = [(GEOLocalizedString *)v181 initWithDictionary:v180];
            }
            v183 = v182;
            -[GEOPDPlaceCollection addLongTitle:](v6, v182);
          }
        }
        uint64_t v177 = [v175 countByEnumeratingWithState:&v312 objects:v372 count:16];
      }
      while (v177);
    }
  }
  if (a3) {
    v184 = @"longSpokenTitle";
  }
  else {
    v184 = @"long_spoken_title";
  }
  v185 = [v278 objectForKeyedSubscript:v184];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v310 = 0u;
    long long v311 = 0u;
    long long v308 = 0u;
    long long v309 = 0u;
    id v186 = v185;
    uint64_t v187 = [v186 countByEnumeratingWithState:&v308 objects:v371 count:16];
    if (v187)
    {
      uint64_t v188 = v187;
      uint64_t v189 = *(void *)v309;
      do
      {
        for (uint64_t i2 = 0; i2 != v188; ++i2)
        {
          if (*(void *)v309 != v189) {
            objc_enumerationMutation(v186);
          }
          uint64_t v191 = *(void *)(*((void *)&v308 + 1) + 8 * i2);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v192 = [GEOLocalizedString alloc];
            if (a3) {
              uint64_t v193 = [(GEOLocalizedString *)v192 initWithJSON:v191];
            }
            else {
              uint64_t v193 = [(GEOLocalizedString *)v192 initWithDictionary:v191];
            }
            v194 = v193;
            -[GEOPDPlaceCollection addLongSpokenTitle:]((uint64_t)v6, v193);
          }
        }
        uint64_t v188 = [v186 countByEnumeratingWithState:&v308 objects:v371 count:16];
      }
      while (v188);
    }
  }
  if (a3) {
    v195 = @"mediaLink";
  }
  else {
    v195 = @"media_link";
  }
  v196 = v278;
  v197 = [v278 objectForKeyedSubscript:v195];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v306 = 0u;
    long long v307 = 0u;
    long long v304 = 0u;
    long long v305 = 0u;
    obuint64_t j = v197;
    uint64_t v291 = [obj countByEnumeratingWithState:&v304 objects:v370 count:16];
    if (!v291) {
      goto LABEL_449;
    }
    v198 = @"adam_id";
    uint64_t v290 = *(void *)v305;
    if (a3) {
      v198 = @"adamId";
    }
    v295 = v198;
    if (a3) {
      v199 = @"subId";
    }
    else {
      v199 = @"sub_id";
    }
    v200 = @"media_type";
    if (a3) {
      v200 = @"mediaType";
    }
    v285 = v200;
    v286 = v199;
    v201 = @"mediaSubType";
    if (!a3) {
      v201 = @"media_sub_type";
    }
    v284 = v201;
    v202 = @"third_party_link";
    if (a3) {
      v202 = @"thirdPartyLink";
    }
    v283 = v202;
    if (a3) {
      v203 = @"mediaLinkPositionMetaData";
    }
    else {
      v203 = @"media_link_position_meta_data";
    }
    v282 = v203;
    if (a3) {
      v204 = @"collectionItemIndex";
    }
    else {
      v204 = @"collection_item_index";
    }
    v205 = @"media_link_position";
    if (a3) {
      v205 = @"mediaLinkPosition";
    }
    v279 = v205;
    v280 = v204;
    v287 = v197;
    v288 = v6;
    while (1)
    {
      uint64_t v206 = 0;
      do
      {
        if (*(void *)v305 != v290) {
          objc_enumerationMutation(obj);
        }
        uint64_t v294 = v206;
        v207 = *(void **)(*((void *)&v304 + 1) + 8 * v206);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v208 = [GEOPDMediaLink alloc];
          if (v208)
          {
            v209 = v208;
            id v210 = v207;
            v211 = v209;
            v212 = v210;
            uint64_t v213 = [(GEOPDMediaLink *)v211 init];
            if (v213)
            {
              v214 = [v212 objectForKeyedSubscript:v295];
              objc_opt_class();
              v293 = v212;
              if (objc_opt_isKindOfClass())
              {
                v215 = (void *)[v214 copy];
                id v216 = v215;
                *(unsigned char *)(v213 + 76) |= 8u;
                *(unsigned char *)(v213 + 76) |= 0x80u;
                v217 = v215;
                v212 = v293;
                objc_storeStrong((id *)(v213 + 24), v217);
              }
              v218 = [v212 objectForKeyedSubscript:v286];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v219 = (void *)[v218 copy];
                id v220 = v219;
                *(unsigned char *)(v213 + 76) |= 0x20u;
                *(unsigned char *)(v213 + 76) |= 0x80u;
                v221 = v219;
                v212 = v293;
                objc_storeStrong((id *)(v213 + 40), v221);
              }
              v222 = [v212 objectForKeyedSubscript:v285];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v223 = v222;
                if ([v223 isEqualToString:@"MEDIA_TYPE_UNKNOWN"])
                {
                  int v224 = 0;
                }
                else if ([v223 isEqualToString:@"MEDIA_TYPE_MUSIC"])
                {
                  int v224 = 1;
                }
                else if ([v223 isEqualToString:@"MEDIA_TYPE_PODCASTS"])
                {
                  int v224 = 2;
                }
                else if ([v223 isEqualToString:@"MEDIA_TYPE_BOOKS"])
                {
                  int v224 = 3;
                }
                else if ([v223 isEqualToString:@"MEDIA_TYPE_FITNESS"])
                {
                  int v224 = 4;
                }
                else if ([v223 isEqualToString:@"MEDIA_TYPE_APP"])
                {
                  int v224 = 5;
                }
                else
                {
                  int v224 = 0;
                }

LABEL_355:
                *(unsigned char *)(v213 + 76) |= 0x80u;
                *(unsigned char *)(v213 + 76) |= 2u;
                *(_DWORD *)(v213 + 72) = v224;
                v212 = v293;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v224 = [v222 intValue];
                  goto LABEL_355;
                }
              }

              v225 = [v212 objectForKeyedSubscript:v284];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v226 = v225;
                if ([v226 isEqualToString:@"MEDIA_SUBTYPE_UNKNOWN"])
                {
                  int v227 = 0;
                }
                else if ([v226 isEqualToString:@"MEDIA_SUBTYPE_SONG"])
                {
                  int v227 = 1;
                }
                else if ([v226 isEqualToString:@"MEDIA_SUBTYPE_ALBUM"])
                {
                  int v227 = 2;
                }
                else if ([v226 isEqualToString:@"MEDIA_SUBTYPE_ARTIST"])
                {
                  int v227 = 3;
                }
                else if ([v226 isEqualToString:@"MEDIA_SUBTYPE_PLAYLIST"])
                {
                  int v227 = 4;
                }
                else if ([v226 isEqualToString:@"MEDIA_SUBTYPE_RADIO_STATION"])
                {
                  int v227 = 5;
                }
                else if ([v226 isEqualToString:@"MEDIA_SUBTYPE_MUSIC_VIDEO"])
                {
                  int v227 = 6;
                }
                else if ([v226 isEqualToString:@"MEDIA_SUBTYPE_SUPER_ROOM"])
                {
                  int v227 = 7;
                }
                else if ([v226 isEqualToString:@"MEDIA_SUBTYPE_ARTIST_INTERVIEW"])
                {
                  int v227 = 8;
                }
                else if ([v226 isEqualToString:@"MEDIA_SUBTYPE_EPISODE"])
                {
                  int v227 = 9;
                }
                else if ([v226 isEqualToString:@"MEDIA_SUBTYPE_SHOW"])
                {
                  int v227 = 10;
                }
                else if ([v226 isEqualToString:@"MEDIA_SUBTYPE_CHANNEL"])
                {
                  int v227 = 11;
                }
                else if ([v226 isEqualToString:@"MEDIA_SUBTYPE_BOOK"])
                {
                  int v227 = 12;
                }
                else if ([v226 isEqualToString:@"MEDIA_SUBTYPE_AUTHOR"])
                {
                  int v227 = 13;
                }
                else if ([v226 isEqualToString:@"MEDIA_SUBTYPE_INSTRUCTOR"])
                {
                  int v227 = 14;
                }
                else if ([v226 isEqualToString:@"MEDIA_SUBTYPE_CLASS"])
                {
                  int v227 = 15;
                }
                else if ([v226 isEqualToString:@"MEDIA_SUBTYPE_CLASS_TYPE"])
                {
                  int v227 = 16;
                }
                else if ([v226 isEqualToString:@"MEDIA_SUBTYPE_APPS"])
                {
                  int v227 = 17;
                }
                else if ([v226 isEqualToString:@"MEDIA_SUBTYPE_STORY"])
                {
                  int v227 = 18;
                }
                else if ([v226 isEqualToString:@"MEDIA_SUBTYPE_AUDIO_BOOK"])
                {
                  int v227 = 19;
                }
                else
                {
                  int v227 = 0;
                }

LABEL_402:
                *(unsigned char *)(v213 + 76) |= 0x80u;
                *(unsigned char *)(v213 + 76) |= 1u;
                *(_DWORD *)(v213 + 68) = v227;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v227 = [v225 intValue];
                  goto LABEL_402;
                }
              }

              v228 = [v212 objectForKeyedSubscript:v283];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v367 = 0u;
                long long v366 = 0u;
                long long v365 = 0u;
                long long v364 = 0u;
                v281 = v228;
                id v229 = v228;
                uint64_t v230 = [v229 countByEnumeratingWithState:&v364 objects:v385 count:16];
                if (v230)
                {
                  uint64_t v231 = v230;
                  uint64_t v232 = *(void *)v365;
                  do
                  {
                    for (uint64_t i3 = 0; i3 != v231; ++i3)
                    {
                      if (*(void *)v365 != v232) {
                        objc_enumerationMutation(v229);
                      }
                      v234 = *(void **)(*((void *)&v364 + 1) + 8 * i3);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v235 = [GEOPDThirdPartyLink alloc];
                        if (v235)
                        {
                          id v236 = v234;
                          v235 = [(GEOPDThirdPartyLink *)v235 init];
                          if (v235)
                          {
                            v237 = [v236 objectForKeyedSubscript:v295];
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v238 = (void *)[v237 copy];
                              id v239 = v238;
                              *(unsigned char *)&v235->_flags |= 2u;
                              *(unsigned char *)&v235->_flags |= 8u;
                              objc_storeStrong((id *)&v235->_adamId, v238);
                            }
                            v240 = [v236 objectForKeyedSubscript:@"url"];
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v241 = (void *)[v240 copy];
                              id v242 = v241;
                              *(unsigned char *)&v235->_flags |= 4u;
                              *(unsigned char *)&v235->_flags |= 8u;
                              objc_storeStrong((id *)&v235->_url, v241);
                            }
                          }
                        }
                        -[GEOPDMediaLink addThirdPartyLink:](v213, v235);
                      }
                    }
                    uint64_t v231 = [v229 countByEnumeratingWithState:&v364 objects:v385 count:16];
                  }
                  while (v231);
                }

                a3 = v292;
                v197 = v287;
                v212 = v293;
                v228 = v281;
              }

              v243 = [v212 objectForKeyedSubscript:v282];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v244 = [GEOPDMediaLinkPositionMetaData alloc];
                if (v244)
                {
                  v245 = v244;
                  id v246 = v243;
                  uint64_t v247 = [(GEOPDMediaLinkPositionMetaData *)v245 init];
                  if (v247)
                  {
                    v248 = [v246 objectForKeyedSubscript:v280];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      int v249 = [v248 intValue];
                      *(unsigned char *)(v247 + 24) |= 1u;
                      *(_DWORD *)(v247 + 16) = v249;
                    }

                    v250 = [v246 objectForKeyedSubscript:v279];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v251 = v250;
                      if ([v251 isEqualToString:@"MEDIA_LINK_POSITION_UNKNOWN"])
                      {
                        int v252 = 0;
                      }
                      else if ([v251 isEqualToString:@"MEDIA_LINK_POSITION_ABOVE"])
                      {
                        int v252 = 1;
                      }
                      else if ([v251 isEqualToString:@"MEDIA_LINK_POSITION_BELOW"])
                      {
                        int v252 = 2;
                      }
                      else
                      {
                        int v252 = 0;
                      }

LABEL_438:
                      *(unsigned char *)(v247 + 24) |= 2u;
                      *(_DWORD *)(v247 + 20) = v252;
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        int v252 = [v250 intValue];
                        goto LABEL_438;
                      }
                    }
                  }
                }
                else
                {
                  uint64_t v247 = 0;
                }
                id v253 = (id)v247;
                *(unsigned char *)(v213 + 76) |= 0x10u;
                *(unsigned char *)(v213 + 76) |= 0x80u;
                objc_storeStrong((id *)(v213 + 32), (id)v247);

                v197 = v287;
                v212 = v293;
              }
            }
          }
          else
          {
            uint64_t v213 = 0;
          }
          -[GEOPDPlaceCollection addMediaLink:](v288, (void *)v213);

          objc_super v6 = v288;
        }
        uint64_t v206 = v294 + 1;
      }
      while (v294 + 1 != v291);
      uint64_t v254 = [obj countByEnumeratingWithState:&v304 objects:v370 count:16];
      uint64_t v291 = v254;
      if (!v254)
      {
LABEL_449:

        v196 = v278;
        break;
      }
    }
  }

  if (a3) {
    v255 = @"itemPhoto";
  }
  else {
    v255 = @"item_photo";
  }
  v256 = [v196 objectForKeyedSubscript:v255];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v302 = 0u;
    long long v303 = 0u;
    long long v300 = 0u;
    long long v301 = 0u;
    id v257 = v256;
    uint64_t v258 = [v257 countByEnumeratingWithState:&v300 objects:v369 count:16];
    if (v258)
    {
      uint64_t v259 = v258;
      uint64_t v260 = *(void *)v301;
      do
      {
        uint64_t v261 = 0;
        do
        {
          if (*(void *)v301 != v260) {
            objc_enumerationMutation(v257);
          }
          v262 = *(void **)(*((void *)&v300 + 1) + 8 * v261);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v263 = [GEOPDCaptionedPhoto alloc];
            if (v263) {
              v264 = (void *)-[GEOPDCaptionedPhoto _initWithDictionary:isJSON:](v263, v262, a3);
            }
            else {
              v264 = 0;
            }
            -[GEOPDPlaceCollection addItemPhoto:]((uint64_t)v6, v264);
          }
          ++v261;
        }
        while (v259 != v261);
        uint64_t v265 = [v257 countByEnumeratingWithState:&v300 objects:v369 count:16];
        uint64_t v259 = v265;
      }
      while (v265);
    }
  }
  if (a3) {
    v266 = @"localizedCategory";
  }
  else {
    v266 = @"localized_category";
  }
  v267 = [v278 objectForKeyedSubscript:v266];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v298 = 0u;
    long long v299 = 0u;
    long long v296 = 0u;
    long long v297 = 0u;
    id v268 = v267;
    uint64_t v269 = [v268 countByEnumeratingWithState:&v296 objects:v368 count:16];
    if (v269)
    {
      uint64_t v270 = v269;
      uint64_t v271 = *(void *)v297;
      do
      {
        for (uint64_t i4 = 0; i4 != v270; ++i4)
        {
          if (*(void *)v297 != v271) {
            objc_enumerationMutation(v268);
          }
          uint64_t v273 = *(void *)(*((void *)&v296 + 1) + 8 * i4);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v274 = [GEOLocalizedString alloc];
            if (a3) {
              v275 = [(GEOLocalizedString *)v274 initWithJSON:v273];
            }
            else {
              v275 = [(GEOLocalizedString *)v274 initWithDictionary:v273];
            }
            v276 = v275;
            -[GEOPDPlaceCollection addLocalizedCategory:]((uint64_t)v6, v275);
          }
        }
        uint64_t v270 = [v268 countByEnumeratingWithState:&v296 objects:v368 count:16];
      }
      while (v270);
    }
  }
  id v5 = v278;
LABEL_486:

  return v6;
}

- (void)setAuthorPhoto:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 240) |= 0x40u;
  *(_DWORD *)(a1 + 240) |= 0x10000000u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v282 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDPlaceCollection readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 104) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
      long long v261 = 0u;
      long long v262 = 0u;
      long long v263 = 0u;
      long long v264 = 0u;
      id v6 = *(id *)(a1 + 104);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v261 objects:v281 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v262;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v262 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v261 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            id v12 = [v11 dictionaryRepresentation];
            }

            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v261 objects:v281 count:16];
        }
        while (v8);
      }

      if (a2) {
        unint64_t v13 = @"displayTitle";
      }
      else {
        unint64_t v13 = @"display_title";
      }
      [v4 setObject:v5 forKey:v13];
    }
    if ([*(id *)(a1 + 72) count])
    {
      uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
      long long v257 = 0u;
      long long v258 = 0u;
      long long v259 = 0u;
      long long v260 = 0u;
      id v15 = *(id *)(a1 + 72);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v257 objects:v280 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v258;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v258 != v18) {
              objc_enumerationMutation(v15);
            }
            id v20 = *(void **)(*((void *)&v257 + 1) + 8 * j);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            id v21 = [v20 dictionaryRepresentation];
            }

            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v257 objects:v280 count:16];
        }
        while (v17);
      }

      if (a2) {
        uint64_t v22 = @"collectionDescription";
      }
      else {
        uint64_t v22 = @"collection_description";
      }
      [v4 setObject:v14 forKey:v22];
    }
    if ([*(id *)(a1 + 168) count])
    {
      uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 168), "count"));
      long long v253 = 0u;
      long long v254 = 0u;
      long long v255 = 0u;
      long long v256 = 0u;
      id v24 = *(id *)(a1 + 168);
      uint64_t v25 = [v24 countByEnumeratingWithState:&v253 objects:v279 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v254;
        do
        {
          for (uint64_t k = 0; k != v26; ++k)
          {
            if (*(void *)v254 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void **)(*((void *)&v253 + 1) + 8 * k);
            if (a2) {
              [v29 jsonRepresentation];
            }
            else {
            id v30 = [v29 dictionaryRepresentation];
            }

            [v23 addObject:v30];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v253 objects:v279 count:16];
        }
        while (v26);
      }

      [v4 setObject:v23 forKey:@"photo"];
    }
    uint64_t v31 = -[GEOPDPlaceCollection collectionId]((id *)a1);
    uint64_t v32 = v31;
    if (v31)
    {
      if (a2)
      {
        uint64_t v33 = [v31 jsonRepresentation];
        uint64_t v34 = @"collectionId";
      }
      else
      {
        uint64_t v33 = [v31 dictionaryRepresentation];
        uint64_t v34 = @"collection_id";
      }
      id v35 = v33;

      [v4 setObject:v35 forKey:v34];
    }

    -[GEOPDPlaceCollection _readPublisherId](a1);
    id v36 = *(id *)(a1 + 184);
    uint64_t v37 = v36;
    if (v36)
    {
      if (a2)
      {
        uint64_t v38 = [v36 jsonRepresentation];
        uint64_t v39 = @"publisherId";
      }
      else
      {
        uint64_t v38 = [v36 dictionaryRepresentation];
        uint64_t v39 = @"publisher_id";
      }
      id v40 = v38;

      [v4 setObject:v40 forKey:v39];
    }

    if ([*(id *)(a1 + 176) count])
    {
      v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 176), "count"));
      long long v249 = 0u;
      long long v250 = 0u;
      long long v251 = 0u;
      long long v252 = 0u;
      id v42 = *(id *)(a1 + 176);
      uint64_t v43 = [v42 countByEnumeratingWithState:&v249 objects:v278 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v250;
        do
        {
          for (uint64_t m = 0; m != v44; ++m)
          {
            if (*(void *)v250 != v45) {
              objc_enumerationMutation(v42);
            }
            v47 = *(void **)(*((void *)&v249 + 1) + 8 * m);
            if (a2) {
              [v47 jsonRepresentation];
            }
            else {
            id v48 = [v47 dictionaryRepresentation];
            }

            [v41 addObject:v48];
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v249 objects:v278 count:16];
        }
        while (v44);
      }

      if (a2) {
        uint64_t v49 = @"placeCollectionItem";
      }
      else {
        uint64_t v49 = @"place_collection_item";
      }
      [v4 setObject:v41 forKey:v49];
    }
    if ([*(id *)(a1 + 200) count])
    {
      uint64_t v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 200), "count"));
      long long v245 = 0u;
      long long v246 = 0u;
      long long v247 = 0u;
      long long v248 = 0u;
      id v51 = *(id *)(a1 + 200);
      uint64_t v52 = [v51 countByEnumeratingWithState:&v245 objects:v277 count:16];
      if (v52)
      {
        uint64_t v53 = v52;
        uint64_t v54 = *(void *)v246;
        do
        {
          for (uint64_t n = 0; n != v53; ++n)
          {
            if (*(void *)v246 != v54) {
              objc_enumerationMutation(v51);
            }
            v56 = *(void **)(*((void *)&v245 + 1) + 8 * n);
            if (a2) {
              [v56 jsonRepresentation];
            }
            else {
            id v57 = [v56 dictionaryRepresentation];
            }

            [v50 addObject:v57];
          }
          uint64_t v53 = [v51 countByEnumeratingWithState:&v245 objects:v277 count:16];
        }
        while (v53);
      }

      if (a2) {
        v58 = @"spokenTitle";
      }
      else {
        v58 = @"spoken_title";
      }
      [v4 setObject:v50 forKey:v58];
    }
    if ([*(id *)(a1 + 112) count])
    {
      uint64_t v59 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
      long long v241 = 0u;
      long long v242 = 0u;
      long long v243 = 0u;
      long long v244 = 0u;
      id v60 = *(id *)(a1 + 112);
      uint64_t v61 = [v60 countByEnumeratingWithState:&v241 objects:v276 count:16];
      if (v61)
      {
        uint64_t v62 = v61;
        uint64_t v63 = *(void *)v242;
        do
        {
          for (iuint64_t i = 0; ii != v62; ++ii)
          {
            if (*(void *)v242 != v63) {
              objc_enumerationMutation(v60);
            }
            uint64_t v65 = *(void **)(*((void *)&v241 + 1) + 8 * ii);
            if (a2) {
              [v65 jsonRepresentation];
            }
            else {
            id v66 = [v65 dictionaryRepresentation];
            }

            [v59 addObject:v66];
          }
          uint64_t v62 = [v60 countByEnumeratingWithState:&v241 objects:v276 count:16];
        }
        while (v62);
      }

      if (a2) {
        uint64_t v67 = @"itemId";
      }
      else {
        uint64_t v67 = @"item_id";
      }
      [v4 setObject:v59 forKey:v67];
    }
    if ((*(unsigned char *)(a1 + 240) & 4) != 0)
    {
      uint64_t v68 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 232)];
      if (a2) {
        v69 = @"numItems";
      }
      else {
        v69 = @"num_items";
      }
      [v4 setObject:v68 forKey:v69];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v70 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v237 = 0u;
      long long v238 = 0u;
      long long v239 = 0u;
      long long v240 = 0u;
      id v71 = *(id *)(a1 + 40);
      uint64_t v72 = [v71 countByEnumeratingWithState:&v237 objects:v275 count:16];
      if (v72)
      {
        uint64_t v73 = v72;
        uint64_t v74 = *(void *)v238;
        do
        {
          for (juint64_t j = 0; jj != v73; ++jj)
          {
            if (*(void *)v238 != v74) {
              objc_enumerationMutation(v71);
            }
            uint64_t v76 = *(void **)(*((void *)&v237 + 1) + 8 * jj);
            if (a2) {
              [v76 jsonRepresentation];
            }
            else {
            id v77 = [v76 dictionaryRepresentation];
            }

            [v70 addObject:v77];
          }
          uint64_t v73 = [v71 countByEnumeratingWithState:&v237 objects:v275 count:16];
        }
        while (v73);
      }

      if (a2) {
        uint64_t v78 = @"collectionClassDisplayName";
      }
      else {
        uint64_t v78 = @"collection_class_display_name";
      }
      [v4 setObject:v70 forKey:v78];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v79 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v233 = 0u;
      long long v234 = 0u;
      long long v235 = 0u;
      long long v236 = 0u;
      id v80 = *(id *)(a1 + 48);
      uint64_t v81 = [v80 countByEnumeratingWithState:&v233 objects:v274 count:16];
      if (v81)
      {
        uint64_t v82 = v81;
        uint64_t v83 = *(void *)v234;
        do
        {
          for (kuint64_t k = 0; kk != v82; ++kk)
          {
            if (*(void *)v234 != v83) {
              objc_enumerationMutation(v80);
            }
            v85 = *(void **)(*((void *)&v233 + 1) + 8 * kk);
            if (a2) {
              [v85 jsonRepresentation];
            }
            else {
            id v86 = [v85 dictionaryRepresentation];
            }

            [v79 addObject:v86];
          }
          uint64_t v82 = [v80 countByEnumeratingWithState:&v233 objects:v274 count:16];
        }
        while (v82);
      }

      if (a2) {
        id v87 = @"collectionClassSpokenName";
      }
      else {
        id v87 = @"collection_class_spoken_name";
      }
      [v4 setObject:v79 forKey:v87];
    }
    if (*(unsigned char *)(a1 + 240))
    {
      uint64_t v88 = [NSNumber numberWithDouble:*(double *)(a1 + 160)];
      if (a2) {
        uint64_t v89 = @"modifiedTime";
      }
      else {
        uint64_t v89 = @"modified_time";
      }
      [v4 setObject:v88 forKey:v89];
    }
    uint64_t v90 = -[GEOPDPlaceCollection url]((id *)a1);
    if (v90) {
      [v4 setObject:v90 forKey:@"url"];
    }

    v91 = -[GEOPDPlaceCollection authorName]((id *)a1);
    if (v91)
    {
      if (a2) {
        uint64_t v92 = @"authorName";
      }
      else {
        uint64_t v92 = @"author_name";
      }
      [v4 setObject:v91 forKey:v92];
    }

    uint64_t v93 = -[GEOPDPlaceCollection publisher]((id *)a1);
    v94 = v93;
    if (v93)
    {
      if (a2) {
        [v93 jsonRepresentation];
      }
      else {
      id v95 = [v93 dictionaryRepresentation];
      }

      [v4 setObject:v95 forKey:@"publisher"];
    }

    if ((*(unsigned char *)(a1 + 240) & 8) != 0)
    {
      v96 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 236)];
      if (a2) {
        uint64_t v97 = @"enableFallbackImagesForItems";
      }
      else {
        uint64_t v97 = @"enable_fallback_images_for_items";
      }
      [v4 setObject:v96 forKey:v97];
    }
    id v98 = -[GEOPDPlaceCollection authorPhoto]((id *)a1);
    uint64_t v99 = v98;
    if (v98)
    {
      if (a2)
      {
        uint64_t v100 = [v98 jsonRepresentation];
        uint64_t v101 = @"authorPhoto";
      }
      else
      {
        uint64_t v100 = [v98 dictionaryRepresentation];
        uint64_t v101 = @"author_photo";
      }
      id v102 = v100;

      [v4 setObject:v102 forKey:v101];
    }

    if ((*(unsigned char *)(a1 + 240) & 2) != 0)
    {
      uint64_t v103 = *(int *)(a1 + 228);
      if (v103 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 228));
        v104 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v104 = off_1E53E3F90[v103];
      }
      if (a2) {
        v105 = @"errorState";
      }
      else {
        v105 = @"error_state";
      }
      [v4 setObject:v104 forKey:v105];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v106 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v229 = 0u;
      long long v230 = 0u;
      long long v231 = 0u;
      long long v232 = 0u;
      id v107 = *(id *)(a1 + 56);
      uint64_t v108 = [v107 countByEnumeratingWithState:&v229 objects:v273 count:16];
      if (v108)
      {
        uint64_t v109 = v108;
        uint64_t v110 = *(void *)v230;
        do
        {
          for (muint64_t m = 0; mm != v109; ++mm)
          {
            if (*(void *)v230 != v110) {
              objc_enumerationMutation(v107);
            }
            long long v112 = *(void **)(*((void *)&v229 + 1) + 8 * mm);
            if (a2) {
              [v112 jsonRepresentation];
            }
            else {
            id v113 = [v112 dictionaryRepresentation];
            }

            [v106 addObject:v113];
          }
          uint64_t v109 = [v107 countByEnumeratingWithState:&v229 objects:v273 count:16];
        }
        while (v109);
      }

      if (a2) {
        long long v114 = @"collectionDescriptionBytes";
      }
      else {
        long long v114 = @"collection_description_bytes";
      }
      [v4 setObject:v106 forKey:v114];
    }
    if ([*(id *)(a1 + 64) count])
    {
      long long v115 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v225 = 0u;
      long long v226 = 0u;
      long long v227 = 0u;
      long long v228 = 0u;
      id v116 = *(id *)(a1 + 64);
      uint64_t v117 = [v116 countByEnumeratingWithState:&v225 objects:v272 count:16];
      if (v117)
      {
        uint64_t v118 = v117;
        uint64_t v119 = *(void *)v226;
        do
        {
          for (nuint64_t n = 0; nn != v118; ++nn)
          {
            if (*(void *)v226 != v119) {
              objc_enumerationMutation(v116);
            }
            long long v121 = *(void **)(*((void *)&v225 + 1) + 8 * nn);
            if (a2) {
              [v121 jsonRepresentation];
            }
            else {
            id v122 = [v121 dictionaryRepresentation];
            }

            [v115 addObject:v122];
          }
          uint64_t v118 = [v116 countByEnumeratingWithState:&v225 objects:v272 count:16];
        }
        while (v118);
      }

      if (a2) {
        long long v123 = @"collectionDescriptionHtml";
      }
      else {
        long long v123 = @"collection_description_html";
      }
      [v4 setObject:v115 forKey:v123];
    }
    if ([*(id *)(a1 + 96) count])
    {
      long long v124 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
      long long v221 = 0u;
      long long v222 = 0u;
      long long v223 = 0u;
      long long v224 = 0u;
      id v125 = *(id *)(a1 + 96);
      uint64_t v126 = [v125 countByEnumeratingWithState:&v221 objects:v271 count:16];
      if (v126)
      {
        uint64_t v127 = v126;
        uint64_t v128 = *(void *)v222;
        do
        {
          for (uint64_t i1 = 0; i1 != v127; ++i1)
          {
            if (*(void *)v222 != v128) {
              objc_enumerationMutation(v125);
            }
            long long v130 = *(void **)(*((void *)&v221 + 1) + 8 * i1);
            if (a2) {
              [v130 jsonRepresentation];
            }
            else {
            id v131 = [v130 dictionaryRepresentation];
            }

            [v124 addObject:v131];
          }
          uint64_t v127 = [v125 countByEnumeratingWithState:&v221 objects:v271 count:16];
        }
        while (v127);
      }

      if (a2) {
        uint64_t v132 = @"collectionItemDescription";
      }
      else {
        uint64_t v132 = @"collection_item_description";
      }
      [v4 setObject:v124 forKey:v132];
    }
    if ([*(id *)(a1 + 88) count])
    {
      uint64_t v133 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
      long long v217 = 0u;
      long long v218 = 0u;
      long long v219 = 0u;
      long long v220 = 0u;
      id v134 = *(id *)(a1 + 88);
      uint64_t v135 = [v134 countByEnumeratingWithState:&v217 objects:v270 count:16];
      if (v135)
      {
        uint64_t v136 = v135;
        uint64_t v137 = *(void *)v218;
        do
        {
          for (uint64_t i2 = 0; i2 != v136; ++i2)
          {
            if (*(void *)v218 != v137) {
              objc_enumerationMutation(v134);
            }
            long long v139 = *(void **)(*((void *)&v217 + 1) + 8 * i2);
            if (a2) {
              [v139 jsonRepresentation];
            }
            else {
            id v140 = [v139 dictionaryRepresentation];
            }

            [v133 addObject:v140];
          }
          uint64_t v136 = [v134 countByEnumeratingWithState:&v217 objects:v270 count:16];
        }
        while (v136);
      }

      if (a2) {
        long long v141 = @"collectionItemDescriptionHtml";
      }
      else {
        long long v141 = @"collection_item_description_html";
      }
      [v4 setObject:v133 forKey:v141];
    }
    if ([*(id *)(a1 + 144) count])
    {
      id v142 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 144), "count"));
      long long v213 = 0u;
      long long v214 = 0u;
      long long v215 = 0u;
      long long v216 = 0u;
      id v143 = *(id *)(a1 + 144);
      uint64_t v144 = [v143 countByEnumeratingWithState:&v213 objects:v269 count:16];
      if (v144)
      {
        uint64_t v145 = v144;
        uint64_t v146 = *(void *)v214;
        do
        {
          for (uint64_t i3 = 0; i3 != v145; ++i3)
          {
            if (*(void *)v214 != v146) {
              objc_enumerationMutation(v143);
            }
            long long v148 = *(void **)(*((void *)&v213 + 1) + 8 * i3);
            if (a2) {
              [v148 jsonRepresentation];
            }
            else {
            id v149 = [v148 dictionaryRepresentation];
            }

            [v142 addObject:v149];
          }
          uint64_t v145 = [v143 countByEnumeratingWithState:&v213 objects:v269 count:16];
        }
        while (v145);
      }

      if (a2) {
        long long v150 = @"longTitle";
      }
      else {
        long long v150 = @"long_title";
      }
      [v4 setObject:v142 forKey:v150];
    }
    if ([*(id *)(a1 + 136) count])
    {
      long long v151 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
      long long v209 = 0u;
      long long v210 = 0u;
      long long v211 = 0u;
      long long v212 = 0u;
      id v152 = *(id *)(a1 + 136);
      uint64_t v153 = [v152 countByEnumeratingWithState:&v209 objects:v268 count:16];
      if (v153)
      {
        uint64_t v154 = v153;
        uint64_t v155 = *(void *)v210;
        do
        {
          for (uint64_t i4 = 0; i4 != v154; ++i4)
          {
            if (*(void *)v210 != v155) {
              objc_enumerationMutation(v152);
            }
            long long v157 = *(void **)(*((void *)&v209 + 1) + 8 * i4);
            if (a2) {
              [v157 jsonRepresentation];
            }
            else {
            id v158 = [v157 dictionaryRepresentation];
            }

            [v151 addObject:v158];
          }
          uint64_t v154 = [v152 countByEnumeratingWithState:&v209 objects:v268 count:16];
        }
        while (v154);
      }

      if (a2) {
        long long v159 = @"longSpokenTitle";
      }
      else {
        long long v159 = @"long_spoken_title";
      }
      [v4 setObject:v151 forKey:v159];
    }
    if ([*(id *)(a1 + 152) count])
    {
      long long v160 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 152), "count"));
      long long v205 = 0u;
      long long v206 = 0u;
      long long v207 = 0u;
      long long v208 = 0u;
      id v161 = *(id *)(a1 + 152);
      uint64_t v162 = [v161 countByEnumeratingWithState:&v205 objects:v267 count:16];
      if (v162)
      {
        uint64_t v163 = v162;
        uint64_t v164 = *(void *)v206;
        do
        {
          for (uint64_t i5 = 0; i5 != v163; ++i5)
          {
            if (*(void *)v206 != v164) {
              objc_enumerationMutation(v161);
            }
            uint64_t v166 = *(void **)(*((void *)&v205 + 1) + 8 * i5);
            if (a2) {
              [v166 jsonRepresentation];
            }
            else {
            id v167 = [v166 dictionaryRepresentation];
            }

            [v160 addObject:v167];
          }
          uint64_t v163 = [v161 countByEnumeratingWithState:&v205 objects:v267 count:16];
        }
        while (v163);
      }

      if (a2) {
        long long v168 = @"mediaLink";
      }
      else {
        long long v168 = @"media_link";
      }
      [v4 setObject:v160 forKey:v168];
    }
    if ([*(id *)(a1 + 120) count])
    {
      uint64_t v169 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 120), "count"));
      long long v201 = 0u;
      long long v202 = 0u;
      long long v203 = 0u;
      long long v204 = 0u;
      id v170 = *(id *)(a1 + 120);
      uint64_t v171 = [v170 countByEnumeratingWithState:&v201 objects:v266 count:16];
      if (v171)
      {
        uint64_t v172 = v171;
        uint64_t v173 = *(void *)v202;
        do
        {
          for (uint64_t i6 = 0; i6 != v172; ++i6)
          {
            if (*(void *)v202 != v173) {
              objc_enumerationMutation(v170);
            }
            id v175 = *(void **)(*((void *)&v201 + 1) + 8 * i6);
            if (a2) {
              [v175 jsonRepresentation];
            }
            else {
            id v176 = [v175 dictionaryRepresentation];
            }

            [v169 addObject:v176];
          }
          uint64_t v172 = [v170 countByEnumeratingWithState:&v201 objects:v266 count:16];
        }
        while (v172);
      }

      if (a2) {
        uint64_t v177 = @"itemPhoto";
      }
      else {
        uint64_t v177 = @"item_photo";
      }
      [v4 setObject:v169 forKey:v177];
    }
    if ([*(id *)(a1 + 128) count])
    {
      uint64_t v178 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
      long long v197 = 0u;
      long long v198 = 0u;
      long long v199 = 0u;
      long long v200 = 0u;
      id v179 = *(id *)(a1 + 128);
      uint64_t v180 = [v179 countByEnumeratingWithState:&v197 objects:v265 count:16];
      if (v180)
      {
        uint64_t v181 = v180;
        uint64_t v182 = *(void *)v198;
        do
        {
          for (uint64_t i7 = 0; i7 != v181; ++i7)
          {
            if (*(void *)v198 != v182) {
              objc_enumerationMutation(v179);
            }
            v184 = *(void **)(*((void *)&v197 + 1) + 8 * i7);
            if (a2) {
              [v184 jsonRepresentation];
            }
            else {
            id v185 = [v184 dictionaryRepresentation];
            }

            [v178 addObject:v185];
          }
          uint64_t v181 = [v179 countByEnumeratingWithState:&v197 objects:v265 count:16];
        }
        while (v181);
      }

      if (a2) {
        id v186 = @"localizedCategory";
      }
      else {
        id v186 = @"localized_category";
      }
      [v4 setObject:v178 forKey:v186];
    }
    uint64_t v187 = *(void **)(a1 + 16);
    if (v187)
    {
      uint64_t v188 = [v187 dictionaryRepresentation];
      uint64_t v189 = v188;
      if (a2)
      {
        v190 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v188, "count"));
        v195[0] = MEMORY[0x1E4F143A8];
        v195[1] = 3221225472;
        v195[2] = __50__GEOPDPlaceCollection__dictionaryRepresentation___block_invoke;
        v195[3] = &unk_1E53D8860;
        id v191 = v190;
        id v196 = v191;
        [v189 enumerateKeysAndObjectsUsingBlock:v195];
        id v192 = v191;

        uint64_t v189 = v192;
      }
      [v4 setObject:v189 forKey:@"Unknown Fields"];
    }
    id v193 = v4;
  }
  else
  {
    id v193 = 0;
  }

  return v193;
}

void __50__GEOPDPlaceCollection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_spokenTitles, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_publisherId, 0);
  objc_storeStrong((id *)&self->_placeCollectionItems, 0);
  objc_storeStrong((id *)&self->_photos, 0);
  objc_storeStrong((id *)&self->_mediaLinks, 0);
  objc_storeStrong((id *)&self->_longTitles, 0);
  objc_storeStrong((id *)&self->_longSpokenTitles, 0);
  objc_storeStrong((id *)&self->_localizedCategorys, 0);
  objc_storeStrong((id *)&self->_itemPhotos, 0);
  objc_storeStrong((id *)&self->_itemIds, 0);
  objc_storeStrong((id *)&self->_displayTitles, 0);
  objc_storeStrong((id *)&self->_collectionItemDescriptions, 0);
  objc_storeStrong((id *)&self->_collectionItemDescriptionHtmls, 0);
  objc_storeStrong((id *)&self->_collectionId, 0);
  objc_storeStrong((id *)&self->_collectionDescriptions, 0);
  objc_storeStrong((id *)&self->_collectionDescriptionHtmls, 0);
  objc_storeStrong((id *)&self->_collectionDescriptionBytes, 0);
  objc_storeStrong((id *)&self->_collectionClassSpokenNames, 0);
  objc_storeStrong((id *)&self->_collectionClassDisplayNames, 0);
  objc_storeStrong((id *)&self->_authorPhoto, 0);
  objc_storeStrong((id *)&self->_authorName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v161 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDPlaceCollectionIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v74 = self->_reader;
    objc_sync_enter(v74);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v75 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v75];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v74);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceCollection readAll:]((uint64_t)self, 0);
    long long v143 = 0u;
    long long v142 = 0u;
    long long v141 = 0u;
    long long v140 = 0u;
    id v6 = self->_displayTitles;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v140 objects:v160 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v141;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v141 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v140 objects:v160 count:16];
      }
      while (v7);
    }

    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    id v10 = self->_collectionDescriptions;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v136 objects:v159 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v137;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v137 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v136 objects:v159 count:16];
      }
      while (v11);
    }

    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    uint64_t v14 = self->_photos;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v132 objects:v158 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v133;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v133 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v132 objects:v158 count:16];
      }
      while (v15);
    }

    if (self->_collectionId) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_publisherId) {
      PBDataWriterWriteSubmessage();
    }
    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    uint64_t v18 = self->_placeCollectionItems;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v128 objects:v157 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v129;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v129 != v20) {
            objc_enumerationMutation(v18);
          }
          PBDataWriterWriteSubmessage();
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v128 objects:v157 count:16];
      }
      while (v19);
    }

    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    uint64_t v22 = self->_spokenTitles;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v124 objects:v156 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v125;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v125 != v24) {
            objc_enumerationMutation(v22);
          }
          PBDataWriterWriteSubmessage();
          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v124 objects:v156 count:16];
      }
      while (v23);
    }

    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    uint64_t v26 = self->_itemIds;
    uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v120 objects:v155 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v121;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v121 != v28) {
            objc_enumerationMutation(v26);
          }
          PBDataWriterWriteSubmessage();
          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v120 objects:v155 count:16];
      }
      while (v27);
    }

    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id v30 = self->_collectionClassDisplayNames;
    uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v116 objects:v154 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v117;
      do
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v117 != v32) {
            objc_enumerationMutation(v30);
          }
          PBDataWriterWriteSubmessage();
          ++v33;
        }
        while (v31 != v33);
        uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v116 objects:v154 count:16];
      }
      while (v31);
    }

    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    uint64_t v34 = self->_collectionClassSpokenNames;
    uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v112 objects:v153 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v113;
      do
      {
        uint64_t v37 = 0;
        do
        {
          if (*(void *)v113 != v36) {
            objc_enumerationMutation(v34);
          }
          PBDataWriterWriteSubmessage();
          ++v37;
        }
        while (v35 != v37);
        uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v112 objects:v153 count:16];
      }
      while (v35);
    }

    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteDoubleField();
    }
    if (self->_url) {
      PBDataWriterWriteStringField();
    }
    if (self->_authorName) {
      PBDataWriterWriteStringField();
    }
    if (self->_publisher) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_authorPhoto) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    uint64_t v38 = self->_collectionDescriptionBytes;
    uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v108 objects:v152 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v109;
      do
      {
        uint64_t v41 = 0;
        do
        {
          if (*(void *)v109 != v40) {
            objc_enumerationMutation(v38);
          }
          PBDataWriterWriteSubmessage();
          ++v41;
        }
        while (v39 != v41);
        uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v108 objects:v152 count:16];
      }
      while (v39);
    }

    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v42 = self->_collectionDescriptionHtmls;
    uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v104 objects:v151 count:16];
    if (v43)
    {
      uint64_t v44 = *(void *)v105;
      do
      {
        uint64_t v45 = 0;
        do
        {
          if (*(void *)v105 != v44) {
            objc_enumerationMutation(v42);
          }
          PBDataWriterWriteSubmessage();
          ++v45;
        }
        while (v43 != v45);
        uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v104 objects:v151 count:16];
      }
      while (v43);
    }

    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    v46 = self->_collectionItemDescriptions;
    uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v100 objects:v150 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v101;
      do
      {
        uint64_t v49 = 0;
        do
        {
          if (*(void *)v101 != v48) {
            objc_enumerationMutation(v46);
          }
          PBDataWriterWriteSubmessage();
          ++v49;
        }
        while (v47 != v49);
        uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v100 objects:v150 count:16];
      }
      while (v47);
    }

    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    uint64_t v50 = self->_collectionItemDescriptionHtmls;
    uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v96 objects:v149 count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v97;
      do
      {
        uint64_t v53 = 0;
        do
        {
          if (*(void *)v97 != v52) {
            objc_enumerationMutation(v50);
          }
          PBDataWriterWriteSubmessage();
          ++v53;
        }
        while (v51 != v53);
        uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v96 objects:v149 count:16];
      }
      while (v51);
    }

    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    uint64_t v54 = self->_longTitles;
    uint64_t v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v92 objects:v148 count:16];
    if (v55)
    {
      uint64_t v56 = *(void *)v93;
      do
      {
        uint64_t v57 = 0;
        do
        {
          if (*(void *)v93 != v56) {
            objc_enumerationMutation(v54);
          }
          PBDataWriterWriteSubmessage();
          ++v57;
        }
        while (v55 != v57);
        uint64_t v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v92 objects:v148 count:16];
      }
      while (v55);
    }

    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    v58 = self->_longSpokenTitles;
    uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v88 objects:v147 count:16];
    if (v59)
    {
      uint64_t v60 = *(void *)v89;
      do
      {
        uint64_t v61 = 0;
        do
        {
          if (*(void *)v89 != v60) {
            objc_enumerationMutation(v58);
          }
          PBDataWriterWriteSubmessage();
          ++v61;
        }
        while (v59 != v61);
        uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v88 objects:v147 count:16];
      }
      while (v59);
    }

    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    uint64_t v62 = self->_mediaLinks;
    uint64_t v63 = [(NSMutableArray *)v62 countByEnumeratingWithState:&v84 objects:v146 count:16];
    if (v63)
    {
      uint64_t v64 = *(void *)v85;
      do
      {
        uint64_t v65 = 0;
        do
        {
          if (*(void *)v85 != v64) {
            objc_enumerationMutation(v62);
          }
          PBDataWriterWriteSubmessage();
          ++v65;
        }
        while (v63 != v65);
        uint64_t v63 = [(NSMutableArray *)v62 countByEnumeratingWithState:&v84 objects:v146 count:16];
      }
      while (v63);
    }

    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v66 = self->_itemPhotos;
    uint64_t v67 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v80 objects:v145 count:16];
    if (v67)
    {
      uint64_t v68 = *(void *)v81;
      do
      {
        uint64_t v69 = 0;
        do
        {
          if (*(void *)v81 != v68) {
            objc_enumerationMutation(v66);
          }
          PBDataWriterWriteSubmessage();
          ++v69;
        }
        while (v67 != v69);
        uint64_t v67 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v80 objects:v145 count:16];
      }
      while (v67);
    }

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    v70 = self->_localizedCategorys;
    uint64_t v71 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v76 objects:v144 count:16];
    if (v71)
    {
      uint64_t v72 = *(void *)v77;
      do
      {
        uint64_t v73 = 0;
        do
        {
          if (*(void *)v77 != v72) {
            objc_enumerationMutation(v70);
          }
          PBDataWriterWriteSubmessage();
          ++v73;
        }
        while (v71 != v73);
        uint64_t v71 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v76 objects:v144 count:16];
      }
      while (v71);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v76);
  }
}

- (void)addCollectionClassDisplayName:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 240) & 0x80) == 0)
    {
      id v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollectionClassDisplayNames_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    -[GEOPDPlaceCollection _addNoFlagsCollectionClassDisplayName:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 240) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    *(_DWORD *)(a1 + 240) |= 0x10000000u;
  }
}

+ (id)collectionComponentsForPlaceData:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = [v3 array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__GEOPDPlaceCollection_PlaceDataExtras__collectionComponentsForPlaceData___block_invoke;
  v10[3] = &unk_1E53E1880;
  id v11 = v5;
  id v6 = v5;
  [v4 enumerateComponentOfType:65 enumerationOptions:1 usingBlock:v10];

  if ([v6 count]) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  return v8;
}

void __74__GEOPDPlaceCollection_PlaceDataExtras__collectionComponentsForPlaceData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = -[GEOPDComponent values](v3);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * v8);
        if (v9 && *(void *)(v9 + 392)) {
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v3, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)collectionLongTitle
{
  v2 = -[GEOPDPlaceCollection longTitles]((id *)&self->super.super.isa);
  id v3 = +[GEOLocalizedString bestStringForCurrentLocale:v2 fallbackToFirstAvailable:1];

  return v3;
}

- (id)collectionDescription
{
  v2 = -[GEOPDPlaceCollection collectionDescriptions]((id *)&self->super.super.isa);
  id v3 = +[GEOLocalizedString bestStringForCurrentLocale:v2 fallbackToFirstAvailable:1];

  return v3;
}

- (id)collectionHTMLDescription
{
  v2 = -[GEOPDPlaceCollection collectionDescriptionHtmls]((id *)&self->super.super.isa);
  id v3 = +[GEOLocalizedString bestStringForCurrentLocale:v2 fallbackToFirstAvailable:1];

  return v3;
}

- (id)publisherDescriptionOfCollectionItem
{
  v2 = -[GEOPDPlaceCollection collectionItemDescriptions]((id *)&self->super.super.isa);
  id v3 = +[GEOLocalizedString bestStringForCurrentLocale:v2 fallbackToFirstAvailable:1];

  return v3;
}

- (id)publisherHTMLDescriptionOfCollectionItem
{
  v2 = -[GEOPDPlaceCollection collectionItemDescriptionHtmls]((id *)&self->super.super.isa);
  id v3 = +[GEOLocalizedString bestStringForCurrentLocale:v2 fallbackToFirstAvailable:1];

  return v3;
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDPlaceCollection _readCollectionId](result);
    if (([*(id *)(v3 + 80) hasGreenTeaWithValue:a2] & 1) == 0)
    {
      -[GEOPDPlaceCollection _readItemIds](v3);
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v4 = *(id *)(v3 + 112);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v19;
LABEL_5:
        uint64_t v8 = 0;
        while (1)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v18 + 1) + 8 * v8) hasGreenTeaWithValue:a2]) {
            break;
          }
          if (v6 == ++v8)
          {
            uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
            if (v6) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
      }
      else
      {
LABEL_11:

        -[GEOPDPlaceCollection _readPlaceCollectionItems](v3);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        id v4 = *(id *)(v3 + 176);
        uint64_t v9 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (!v9)
        {
LABEL_20:

          -[GEOPDPlaceCollection _readPublisher](v3);
          if ((-[GEOPDPublisher hasGreenTeaWithValue:](*(void *)(v3 + 192), a2) & 1) == 0)
          {
            -[GEOPDPlaceCollection _readPublisherId](v3);
            return [*(id *)(v3 + 184) hasGreenTeaWithValue:a2];
          }
          return 1;
        }
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v15;
LABEL_13:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v4);
          }
          uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * v12);
          if (v13)
          {
            -[GEOPDPlaceCollectionItem _readItemId](*(void *)(*((void *)&v14 + 1) + 8 * v12));
            if (objc_msgSend(*(id *)(v13 + 56), "hasGreenTeaWithValue:", a2, (void)v14)) {
              break;
            }
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
            if (v10) {
              goto LABEL_13;
            }
            goto LABEL_20;
          }
        }
      }
    }
    return 1;
  }
  return result;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v191 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 240) |= 0x10u;
    *(_DWORD *)(a1 + 240) |= 0x10000000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    id v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDPlaceCollection readAll:](a1, 0);
      long long v168 = 0u;
      long long v167 = 0u;
      long long v166 = 0u;
      long long v165 = 0u;
      id v5 = *(id *)(a1 + 104);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v165 objects:v189 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v166;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v166 != v8) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v165 + 1) + 8 * i) clearUnknownFields:1];
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v165 objects:v189 count:16];
        }
        while (v7);
      }

      long long v164 = 0u;
      long long v162 = 0u;
      long long v163 = 0u;
      long long v161 = 0u;
      id v10 = *(id *)(a1 + 72);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v161 objects:v188 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v162;
        do
        {
          for (uint64_t j = 0; j != v12; ++j)
          {
            if (*(void *)v162 != v13) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(*((void *)&v161 + 1) + 8 * j) clearUnknownFields:1];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v161 objects:v188 count:16];
        }
        while (v12);
      }

      long long v159 = 0u;
      long long v160 = 0u;
      long long v157 = 0u;
      long long v158 = 0u;
      id v15 = *(id *)(a1 + 168);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v157 objects:v187 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v158;
        do
        {
          for (uint64_t k = 0; k != v17; ++k)
          {
            if (*(void *)v158 != v18) {
              objc_enumerationMutation(v15);
            }
            -[GEOPDCaptionedPhoto clearUnknownFields:](*(void *)(*((void *)&v157 + 1) + 8 * k));
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v157 objects:v187 count:16];
        }
        while (v17);
      }

      [*(id *)(a1 + 80) clearUnknownFields:1];
      [*(id *)(a1 + 184) clearUnknownFields:1];
      long long v155 = 0u;
      long long v156 = 0u;
      long long v153 = 0u;
      long long v154 = 0u;
      id v20 = *(id *)(a1 + 176);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v153 objects:v186 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v154;
        do
        {
          for (uint64_t m = 0; m != v22; ++m)
          {
            if (*(void *)v154 != v23) {
              objc_enumerationMutation(v20);
            }
            -[GEOPDPlaceCollectionItem clearUnknownFields:](*(void *)(*((void *)&v153 + 1) + 8 * m));
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v153 objects:v186 count:16];
        }
        while (v22);
      }

      long long v151 = 0u;
      long long v152 = 0u;
      long long v149 = 0u;
      long long v150 = 0u;
      id v25 = *(id *)(a1 + 200);
      uint64_t v26 = [v25 countByEnumeratingWithState:&v149 objects:v185 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v150;
        do
        {
          for (uint64_t n = 0; n != v27; ++n)
          {
            if (*(void *)v150 != v28) {
              objc_enumerationMutation(v25);
            }
            [*(id *)(*((void *)&v149 + 1) + 8 * n) clearUnknownFields:1];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v149 objects:v185 count:16];
        }
        while (v27);
      }

      long long v147 = 0u;
      long long v148 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      id v30 = *(id *)(a1 + 112);
      uint64_t v31 = [v30 countByEnumeratingWithState:&v145 objects:v184 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v146;
        do
        {
          for (iuint64_t i = 0; ii != v32; ++ii)
          {
            if (*(void *)v146 != v33) {
              objc_enumerationMutation(v30);
            }
            [*(id *)(*((void *)&v145 + 1) + 8 * ii) clearUnknownFields:1];
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v145 objects:v184 count:16];
        }
        while (v32);
      }

      long long v143 = 0u;
      long long v144 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      id v35 = *(id *)(a1 + 40);
      uint64_t v36 = [v35 countByEnumeratingWithState:&v141 objects:v183 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v142;
        do
        {
          for (juint64_t j = 0; jj != v37; ++jj)
          {
            if (*(void *)v142 != v38) {
              objc_enumerationMutation(v35);
            }
            [*(id *)(*((void *)&v141 + 1) + 8 * jj) clearUnknownFields:1];
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v141 objects:v183 count:16];
        }
        while (v37);
      }

      long long v139 = 0u;
      long long v140 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      id v40 = *(id *)(a1 + 48);
      uint64_t v41 = [v40 countByEnumeratingWithState:&v137 objects:v182 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v138;
        do
        {
          for (kuint64_t k = 0; kk != v42; ++kk)
          {
            if (*(void *)v138 != v43) {
              objc_enumerationMutation(v40);
            }
            [*(id *)(*((void *)&v137 + 1) + 8 * kk) clearUnknownFields:1];
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v137 objects:v182 count:16];
        }
        while (v42);
      }

      -[GEOPDPublisher clearUnknownFields:](*(void *)(a1 + 192));
      -[GEOPDCaptionedPhoto clearUnknownFields:](*(void *)(a1 + 32));
      long long v135 = 0u;
      long long v136 = 0u;
      long long v133 = 0u;
      long long v134 = 0u;
      id v45 = *(id *)(a1 + 56);
      uint64_t v46 = [v45 countByEnumeratingWithState:&v133 objects:v181 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v134;
        do
        {
          for (muint64_t m = 0; mm != v47; ++mm)
          {
            if (*(void *)v134 != v48) {
              objc_enumerationMutation(v45);
            }
            [*(id *)(*((void *)&v133 + 1) + 8 * mm) clearUnknownFields:1];
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v133 objects:v181 count:16];
        }
        while (v47);
      }

      long long v131 = 0u;
      long long v132 = 0u;
      long long v129 = 0u;
      long long v130 = 0u;
      id v50 = *(id *)(a1 + 64);
      uint64_t v51 = [v50 countByEnumeratingWithState:&v129 objects:v180 count:16];
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = *(void *)v130;
        do
        {
          for (nuint64_t n = 0; nn != v52; ++nn)
          {
            if (*(void *)v130 != v53) {
              objc_enumerationMutation(v50);
            }
            [*(id *)(*((void *)&v129 + 1) + 8 * nn) clearUnknownFields:1];
          }
          uint64_t v52 = [v50 countByEnumeratingWithState:&v129 objects:v180 count:16];
        }
        while (v52);
      }

      long long v127 = 0u;
      long long v128 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      id v55 = *(id *)(a1 + 96);
      uint64_t v56 = [v55 countByEnumeratingWithState:&v125 objects:v179 count:16];
      if (v56)
      {
        uint64_t v57 = v56;
        uint64_t v58 = *(void *)v126;
        do
        {
          for (uint64_t i1 = 0; i1 != v57; ++i1)
          {
            if (*(void *)v126 != v58) {
              objc_enumerationMutation(v55);
            }
            [*(id *)(*((void *)&v125 + 1) + 8 * i1) clearUnknownFields:1];
          }
          uint64_t v57 = [v55 countByEnumeratingWithState:&v125 objects:v179 count:16];
        }
        while (v57);
      }

      long long v123 = 0u;
      long long v124 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      id v60 = *(id *)(a1 + 88);
      uint64_t v61 = [v60 countByEnumeratingWithState:&v121 objects:v178 count:16];
      if (v61)
      {
        uint64_t v62 = v61;
        uint64_t v63 = *(void *)v122;
        do
        {
          for (uint64_t i2 = 0; i2 != v62; ++i2)
          {
            if (*(void *)v122 != v63) {
              objc_enumerationMutation(v60);
            }
            [*(id *)(*((void *)&v121 + 1) + 8 * i2) clearUnknownFields:1];
          }
          uint64_t v62 = [v60 countByEnumeratingWithState:&v121 objects:v178 count:16];
        }
        while (v62);
      }

      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      id v65 = *(id *)(a1 + 144);
      uint64_t v66 = [v65 countByEnumeratingWithState:&v117 objects:v177 count:16];
      if (v66)
      {
        uint64_t v67 = v66;
        uint64_t v68 = *(void *)v118;
        do
        {
          for (uint64_t i3 = 0; i3 != v67; ++i3)
          {
            if (*(void *)v118 != v68) {
              objc_enumerationMutation(v65);
            }
            [*(id *)(*((void *)&v117 + 1) + 8 * i3) clearUnknownFields:1];
          }
          uint64_t v67 = [v65 countByEnumeratingWithState:&v117 objects:v177 count:16];
        }
        while (v67);
      }

      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      id v70 = *(id *)(a1 + 136);
      uint64_t v71 = [v70 countByEnumeratingWithState:&v113 objects:v176 count:16];
      if (v71)
      {
        uint64_t v72 = v71;
        uint64_t v73 = *(void *)v114;
        do
        {
          for (uint64_t i4 = 0; i4 != v72; ++i4)
          {
            if (*(void *)v114 != v73) {
              objc_enumerationMutation(v70);
            }
            [*(id *)(*((void *)&v113 + 1) + 8 * i4) clearUnknownFields:1];
          }
          uint64_t v72 = [v70 countByEnumeratingWithState:&v113 objects:v176 count:16];
        }
        while (v72);
      }

      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      uint64_t v97 = a1;
      obuint64_t j = *(id *)(a1 + 152);
      uint64_t v100 = [obj countByEnumeratingWithState:&v109 objects:v175 count:16];
      if (v100)
      {
        uint64_t v99 = *(void *)v110;
        do
        {
          for (uint64_t i5 = 0; i5 != v100; ++i5)
          {
            if (*(void *)v110 != v99) {
              objc_enumerationMutation(obj);
            }
            uint64_t v76 = *(void *)(*((void *)&v109 + 1) + 8 * i5);
            if (v76)
            {
              os_unfair_lock_lock_with_options();
              *(unsigned char *)(v76 + 76) |= 4u;
              *(unsigned char *)(v76 + 76) |= 0x80u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v76 + 64));
              long long v77 = *(void **)(v76 + 16);
              *(void *)(v76 + 16) = 0;

              -[GEOPDMediaLink readAll:](v76, 0);
              long long v172 = 0u;
              long long v171 = 0u;
              long long v170 = 0u;
              long long v169 = 0u;
              id v78 = *(id *)(v76 + 48);
              uint64_t v79 = [v78 countByEnumeratingWithState:&v169 objects:v190 count:16];
              if (v79)
              {
                uint64_t v80 = v79;
                uint64_t v81 = *(void *)v170;
                do
                {
                  for (uint64_t i6 = 0; i6 != v80; ++i6)
                  {
                    if (*(void *)v170 != v81) {
                      objc_enumerationMutation(v78);
                    }
                    uint64_t v83 = *(void *)(*((void *)&v169 + 1) + 8 * i6);
                    if (v83)
                    {
                      os_unfair_lock_lock_with_options();
                      *(unsigned char *)(v83 + 52) |= 1u;
                      *(unsigned char *)(v83 + 52) |= 8u;
                      os_unfair_lock_unlock((os_unfair_lock_t)(v83 + 48));
                      long long v84 = *(void **)(v83 + 16);
                      *(void *)(v83 + 16) = 0;

                      -[GEOPDThirdPartyLink readAll:](v83, 0);
                    }
                  }
                  uint64_t v80 = [v78 countByEnumeratingWithState:&v169 objects:v190 count:16];
                }
                while (v80);
              }

              uint64_t v85 = *(void *)(v76 + 32);
              if (v85)
              {
                long long v86 = *(void **)(v85 + 8);
                *(void *)(v85 + 8) = 0;
              }
            }
          }
          uint64_t v100 = [obj countByEnumeratingWithState:&v109 objects:v175 count:16];
        }
        while (v100);
      }

      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      id v87 = *(id *)(v97 + 120);
      uint64_t v88 = [v87 countByEnumeratingWithState:&v105 objects:v174 count:16];
      if (v88)
      {
        uint64_t v89 = v88;
        uint64_t v90 = *(void *)v106;
        do
        {
          for (uint64_t i7 = 0; i7 != v89; ++i7)
          {
            if (*(void *)v106 != v90) {
              objc_enumerationMutation(v87);
            }
            -[GEOPDCaptionedPhoto clearUnknownFields:](*(void *)(*((void *)&v105 + 1) + 8 * i7));
          }
          uint64_t v89 = [v87 countByEnumeratingWithState:&v105 objects:v174 count:16];
        }
        while (v89);
      }

      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v92 = *(id *)(v97 + 128);
      uint64_t v93 = [v92 countByEnumeratingWithState:&v101 objects:v173 count:16];
      if (v93)
      {
        uint64_t v94 = v93;
        uint64_t v95 = *(void *)v102;
        do
        {
          for (uint64_t i8 = 0; i8 != v94; ++i8)
          {
            if (*(void *)v102 != v95) {
              objc_enumerationMutation(v92);
            }
            objc_msgSend(*(id *)(*((void *)&v101 + 1) + 8 * i8), "clearUnknownFields:", 1, v97);
          }
          uint64_t v94 = [v92 countByEnumeratingWithState:&v101 objects:v173 count:16];
        }
        while (v94);
      }
    }
  }
}

- (GEOPDPlaceCollection)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceCollection;
  uint64_t v3 = [(GEOPDPlaceCollection *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)addDisplayTitle:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPlaceCollection _readDisplayTitles]((uint64_t)a1);
    -[GEOPDPlaceCollection _addNoFlagsDisplayTitle:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[60]._os_unfair_lock_opaque |= 0x8000u;
    os_unfair_lock_unlock(a1 + 56);
    a1[60]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_readCollectionDescriptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 241) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollectionDescriptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)collectionDescriptions
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceCollection _readCollectionDescriptions]((uint64_t)a1);
    a1 = (id *)v2[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addCollectionDescription:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPlaceCollection _readCollectionDescriptions]((uint64_t)a1);
    -[GEOPDPlaceCollection _addNoFlagsCollectionDescription:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[60]._os_unfair_lock_opaque |= 0x800u;
    os_unfair_lock_unlock(a1 + 56);
    a1[60]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)addPhoto:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPlaceCollection _readPhotos]((uint64_t)a1);
    -[GEOPDPlaceCollection _addNoFlagsPhoto:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[60]._os_unfair_lock_opaque |= 0x400000u;
    os_unfair_lock_unlock(a1 + 56);
    a1[60]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)setCollectionId:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 240) |= 0x1000u;
  *(_DWORD *)(a1 + 240) |= 0x10000000u;
  objc_storeStrong((id *)(a1 + 80), a2);
}

- (void)_readPublisherId
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
  if ((*(unsigned char *)(a1 + 243) & 1) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPublisherId_tags_0);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
}

- (void)setPublisherId:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 240) |= 0x1000000u;
  *(_DWORD *)(a1 + 240) |= 0x10000000u;
  objc_storeStrong((id *)(a1 + 184), a2);
}

- (void)_readPlaceCollectionItems
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
  if ((*(unsigned char *)(a1 + 242) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceCollectionItems_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
}

- (void)addPlaceCollectionItem:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPlaceCollection _readPlaceCollectionItems]((uint64_t)a1);
    -[GEOPDPlaceCollection _addNoFlagsPlaceCollectionItem:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[60]._os_unfair_lock_opaque |= 0x800000u;
    os_unfair_lock_unlock(a1 + 56);
    a1[60]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)addSpokenTitle:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 243) & 4) == 0)
    {
      id v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpokenTitles_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    -[GEOPDPlaceCollection _addNoFlagsSpokenTitle:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 240) |= 0x4000000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    *(_DWORD *)(a1 + 240) |= 0x10000000u;
  }
}

- (void)_readItemIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 242) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readItemIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)itemIds
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceCollection _readItemIds]((uint64_t)a1);
    a1 = (id *)v2[14];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addItemId:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPlaceCollection _readItemIds]((uint64_t)a1);
    -[GEOPDPlaceCollection _addNoFlagsItemId:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[60]._os_unfair_lock_opaque |= 0x10000u;
    os_unfair_lock_unlock(a1 + 56);
    a1[60]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_addNoFlagsCollectionClassDisplayName:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addCollectionClassSpokenName:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 241) & 1) == 0)
    {
      id v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollectionClassSpokenNames_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    -[GEOPDPlaceCollection _addNoFlagsCollectionClassSpokenName:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 240) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    *(_DWORD *)(a1 + 240) |= 0x10000000u;
  }
}

- (void)_addNoFlagsCollectionClassSpokenName:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)setUrl:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 240) |= 0x8000000u;
  *(_DWORD *)(a1 + 240) |= 0x10000000u;
  objc_storeStrong((id *)(a1 + 208), a2);
}

- (void)_readAuthorName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 240) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAuthorName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)authorName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceCollection _readAuthorName]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setAuthorName:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 240) |= 0x20u;
  *(_DWORD *)(a1 + 240) |= 0x10000000u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setPublisher:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 240) |= 0x2000000u;
  *(_DWORD *)(a1 + 240) |= 0x10000000u;
  objc_storeStrong((id *)(a1 + 192), a2);
}

- (void)_readAuthorPhoto
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 240) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAuthorPhoto_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)authorPhoto
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceCollection _readAuthorPhoto]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (os_unfair_lock_s)errorState
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    uint32_t os_unfair_lock_opaque = v1[60]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v1 + 56);
    if ((os_unfair_lock_opaque & 2) != 0) {
      return (os_unfair_lock_s *)v1[57]._os_unfair_lock_opaque;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)addCollectionDescriptionBytes:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 241) & 2) == 0)
    {
      id v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollectionDescriptionBytes_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    -[GEOPDPlaceCollection _addNoFlagsCollectionDescriptionBytes:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 240) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    *(_DWORD *)(a1 + 240) |= 0x10000000u;
  }
}

- (void)_addNoFlagsCollectionDescriptionBytes:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readCollectionDescriptionHtmls
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 241) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollectionDescriptionHtmls_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)collectionDescriptionHtmls
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceCollection _readCollectionDescriptionHtmls]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addCollectionDescriptionHtml:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPlaceCollection _readCollectionDescriptionHtmls]((uint64_t)a1);
    -[GEOPDPlaceCollection _addNoFlagsCollectionDescriptionHtml:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[60]._os_unfair_lock_opaque |= 0x400u;
    os_unfair_lock_unlock(a1 + 56);
    a1[60]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_addNoFlagsCollectionDescriptionHtml:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readCollectionItemDescriptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 241) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollectionItemDescriptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)collectionItemDescriptions
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceCollection _readCollectionItemDescriptions]((uint64_t)a1);
    a1 = (id *)v2[12];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_addNoFlagsCollectionItemDescription:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 96);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v5;

      id v4 = *(void **)(a1 + 96);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readCollectionItemDescriptionHtmls
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 241) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollectionItemDescriptionHtmls_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)collectionItemDescriptionHtmls
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceCollection _readCollectionItemDescriptionHtmls]((uint64_t)a1);
    a1 = (id *)v2[11];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addCollectionItemDescriptionHtml:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPlaceCollection _readCollectionItemDescriptionHtmls]((uint64_t)a1);
    -[GEOPDPlaceCollection _addNoFlagsCollectionItemDescriptionHtml:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[60]._os_unfair_lock_opaque |= 0x2000u;
    os_unfair_lock_unlock(a1 + 56);
    a1[60]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_addNoFlagsCollectionItemDescriptionHtml:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      id v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readLongTitles
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 242) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLongTitles_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)longTitles
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceCollection _readLongTitles]((uint64_t)a1);
    a1 = (id *)v2[18];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addLongTitle:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPlaceCollection _readLongTitles]((uint64_t)a1);
    -[GEOPDPlaceCollection _addNoFlagsLongTitle:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[60]._os_unfair_lock_opaque |= 0x100000u;
    os_unfair_lock_unlock(a1 + 56);
    a1[60]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_addNoFlagsLongTitle:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 144);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 144);
      *(void *)(a1 + 144) = v5;

      id v4 = *(void **)(a1 + 144);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addLongSpokenTitle:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 242) & 8) == 0)
    {
      id v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLongSpokenTitles_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    -[GEOPDPlaceCollection _addNoFlagsLongSpokenTitle:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 240) |= 0x80000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    *(_DWORD *)(a1 + 240) |= 0x10000000u;
  }
}

- (void)_addNoFlagsLongSpokenTitle:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 136);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 136);
      *(void *)(a1 + 136) = v5;

      id v4 = *(void **)(a1 + 136);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readMediaLinks
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 242) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMediaLinks_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)mediaLinks
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceCollection _readMediaLinks]((uint64_t)a1);
    a1 = (id *)v2[19];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addMediaLink:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPlaceCollection _readMediaLinks]((uint64_t)a1);
    -[GEOPDPlaceCollection _addNoFlagsMediaLink:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[60]._os_unfair_lock_opaque |= 0x200000u;
    os_unfair_lock_unlock(a1 + 56);
    a1[60]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_addNoFlagsMediaLink:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 152);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 152);
      *(void *)(a1 + 152) = v5;

      id v4 = *(void **)(a1 + 152);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addItemPhoto:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 242) & 2) == 0)
    {
      id v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readItemPhotos_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    -[GEOPDPlaceCollection _addNoFlagsItemPhoto:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 240) |= 0x20000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    *(_DWORD *)(a1 + 240) |= 0x10000000u;
  }
}

- (void)_addNoFlagsItemPhoto:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 120);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 120);
      *(void *)(a1 + 120) = v5;

      id v4 = *(void **)(a1 + 120);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addLocalizedCategory:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 242) & 4) == 0)
    {
      id v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDPlaceCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedCategorys_tags_7197);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    -[GEOPDPlaceCollection _addNoFlagsLocalizedCategory:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 240) |= 0x40000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    *(_DWORD *)(a1 + 240) |= 0x10000000u;
  }
}

- (void)_addNoFlagsLocalizedCategory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 128);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = v5;

      id v4 = *(void **)(a1 + 128);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceCollection;
  id v4 = [(GEOPDPlaceCollection *)&v8 description];
  id v5 = [(GEOPDPlaceCollection *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceCollection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceCollection _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceCollectionReadAllFrom((uint64_t)self, a3, 0);
}

@end