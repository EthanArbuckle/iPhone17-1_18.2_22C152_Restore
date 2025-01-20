@interface GEOPDCaptionedPhoto
+ (id)captionedPhotosForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDCaptionedPhoto)init;
- (GEOPDCaptionedPhoto)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)attribution;
- (id)author;
- (id)caption;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)joeColor;
- (id)jsonRepresentation;
- (id)licenseDescription;
- (id)licenseUrl;
- (id)photo;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)mergeFrom:(uint64_t)a1;
- (unint64_t)hash;
- (void)_readAttribution;
- (void)_readAuthor;
- (void)_readCaption;
- (void)_readJoeColor;
- (void)_readLicenseDescription;
- (void)_readLicenseUrl;
- (void)_readPhoto;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setAttribution:(uint64_t)a1;
- (void)setAuthor:(uint64_t)a1;
- (void)setCaption:(uint64_t)a1;
- (void)setJoeColor:(uint64_t)a1;
- (void)setLicenseDescription:(uint64_t)a1;
- (void)setLicenseUrl:(uint64_t)a1;
- (void)setPhoto:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDCaptionedPhoto

+ (id)captionedPhotosForPlaceData:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = [v3 array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__GEOPDCaptionedPhoto_PlaceDataExtras__captionedPhotosForPlaceData___block_invoke;
  v10[3] = &unk_1E53E1940;
  id v11 = v5;
  id v6 = v5;
  [v4 enumerateValidComponentValuesOfType:26 usingBlock:v10];

  if ([v6 count]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  return v8;
}

void __68__GEOPDCaptionedPhoto_PlaceDataExtras__captionedPhotosForPlaceData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && *((void *)v3 + 16))
  {
    id v5 = v3;
    id v4 = -[GEOPDComponentValue captionedPhoto]((id *)v3);
    [*(id *)(a1 + 32) addObject:v4];

    id v3 = v5;
  }
}

- (id)attribution
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCaptionedPhoto _readAttribution]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readAttribution
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCaptionedPhotoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttribution_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)photo
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCaptionedPhoto _readPhoto]((uint64_t)a1);
    a1 = (id *)v2[10];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPhoto
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x4000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCaptionedPhotoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhoto_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (GEOPDCaptionedPhoto)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDCaptionedPhoto;
  v2 = [(GEOPDCaptionedPhoto *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_1252;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_1253;
      }
      GEOPDCaptionedPhotoReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDCaptionedPhotoCallReadAllRecursiveWithoutSynchronized((void *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)joeColor
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCaptionedPhoto _readJoeColor]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readJoeColor
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCaptionedPhotoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readJoeColor_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_licenseUrl, 0);
  objc_storeStrong((id *)&self->_licenseDescription, 0);
  objc_storeStrong((id *)&self->_joeColor, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 108) |= 0x80u;
    *(_WORD *)(a1 + 108) |= 0x8000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEOPDCaptionedPhoto readAll:](a1, 0);
    -[GEOPDPhoto clearUnknownFields:](*(void *)(a1 + 80));
    uint64_t v3 = *(void *)(a1 + 56);
    if (v3)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v3 + 80) |= 2u;
      *(unsigned char *)(v3 + 80) |= 0x80u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 72));
      id v4 = *(void **)(v3 + 16);
      *(void *)(v3 + 16) = 0;

      -[GEOPDJoeColor readAll:](v3, 0);
    }
    uint64_t v5 = *(void *)(a1 + 24);
    -[GEOPDAttribution clearUnknownFields:](v5, 1);
  }
}

- (GEOPDCaptionedPhoto)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDCaptionedPhoto;
  uint64_t v3 = [(GEOPDCaptionedPhoto *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readCaption
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCaptionedPhotoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCaption_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)caption
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCaptionedPhoto _readCaption]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setCaption:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 108) |= 0x400u;
  *(_WORD *)(a1 + 108) |= 0x8000u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)_readAuthor
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCaptionedPhotoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAuthor_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)author
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCaptionedPhoto _readAuthor]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setAuthor:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 108) |= 0x200u;
  *(_WORD *)(a1 + 108) |= 0x8000u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)_readLicenseDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCaptionedPhotoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLicenseDescription_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)licenseDescription
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCaptionedPhoto _readLicenseDescription]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setLicenseDescription:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 108) |= 0x1000u;
  *(_WORD *)(a1 + 108) |= 0x8000u;
  objc_storeStrong((id *)(a1 + 64), a2);
}

- (void)_readLicenseUrl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCaptionedPhotoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLicenseUrl_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)licenseUrl
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCaptionedPhoto _readLicenseUrl]((uint64_t)a1);
    a1 = (id *)v2[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setLicenseUrl:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 108) |= 0x2000u;
  *(_WORD *)(a1 + 108) |= 0x8000u;
  objc_storeStrong((id *)(a1 + 72), a2);
}

- (void)setPhoto:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 108) |= 0x4000u;
  *(_WORD *)(a1 + 108) |= 0x8000u;
  objc_storeStrong((id *)(a1 + 80), a2);
}

- (void)setJoeColor:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 108) |= 0x800u;
  *(_WORD *)(a1 + 108) |= 0x8000u;
  objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)setAttribution:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 108) |= 0x100u;
  *(_WORD *)(a1 + 108) |= 0x8000u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDCaptionedPhoto;
  id v4 = [(GEOPDCaptionedPhoto *)&v8 description];
  uint64_t v5 = [(GEOPDCaptionedPhoto *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCaptionedPhoto _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_71;
  }
  -[GEOPDCaptionedPhoto readAll:](a1, 1);
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = -[GEOPDCaptionedPhoto caption]((id *)a1);
  if (v5) {
    [v4 setObject:v5 forKey:@"caption"];
  }

  objc_super v6 = -[GEOPDCaptionedPhoto author]((id *)a1);
  if (v6) {
    [v4 setObject:v6 forKey:@"author"];
  }

  objc_super v7 = -[GEOPDCaptionedPhoto licenseDescription]((id *)a1);
  if (v7)
  {
    if (a2) {
      objc_super v8 = @"licenseDescription";
    }
    else {
      objc_super v8 = @"license_description";
    }
    [v4 setObject:v7 forKey:v8];
  }

  v9 = -[GEOPDCaptionedPhoto licenseUrl]((id *)a1);
  if (v9)
  {
    if (a2) {
      v10 = @"licenseUrl";
    }
    else {
      v10 = @"license_url";
    }
    [v4 setObject:v9 forKey:v10];
  }

  id v11 = -[GEOPDCaptionedPhoto photo]((id *)a1);
  v12 = v11;
  if (v11)
  {
    if (a2) {
      [v11 jsonRepresentation];
    }
    else {
    v13 = [v11 dictionaryRepresentation];
    }
    [v4 setObject:v13 forKey:@"photo"];
  }
  __int16 v14 = *(_WORD *)(a1 + 108);
  if ((v14 & 2) != 0)
  {
    v21 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 100)];
    if (a2) {
      v22 = @"displayFullPhotoInline";
    }
    else {
      v22 = @"display_full_photo_inline";
    }
    [v4 setObject:v21 forKey:v22];

    __int16 v14 = *(_WORD *)(a1 + 108);
    if ((v14 & 0x40) == 0)
    {
LABEL_23:
      if ((v14 & 8) == 0) {
        goto LABEL_24;
      }
      goto LABEL_41;
    }
  }
  else if ((v14 & 0x40) == 0)
  {
    goto LABEL_23;
  }
  v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 105)];
  if (a2) {
    v24 = @"useGallery";
  }
  else {
    v24 = @"use_gallery";
  }
  [v4 setObject:v23 forKey:v24];

  __int16 v14 = *(_WORD *)(a1 + 108);
  if ((v14 & 8) == 0)
  {
LABEL_24:
    if ((v14 & 0x10) == 0) {
      goto LABEL_25;
    }
LABEL_45:
    v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 103)];
    if (a2) {
      v28 = @"isBusinessOwned";
    }
    else {
      v28 = @"is_business_owned";
    }
    [v4 setObject:v27 forKey:v28];

    if ((*(_WORD *)(a1 + 108) & 4) == 0) {
      goto LABEL_30;
    }
    goto LABEL_26;
  }
LABEL_41:
  v25 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 102)];
  if (a2) {
    v26 = @"highQuality";
  }
  else {
    v26 = @"high_quality";
  }
  [v4 setObject:v25 forKey:v26];

  __int16 v14 = *(_WORD *)(a1 + 108);
  if ((v14 & 0x10) != 0) {
    goto LABEL_45;
  }
LABEL_25:
  if ((v14 & 4) != 0)
  {
LABEL_26:
    v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 101)];
    if (a2) {
      v16 = @"displayFullScreenPhotoGallery";
    }
    else {
      v16 = @"display_full_screen_photo_gallery";
    }
    [v4 setObject:v15 forKey:v16];
  }
LABEL_30:
  v17 = -[GEOPDCaptionedPhoto joeColor]((id *)a1);
  v18 = v17;
  if (v17)
  {
    if (a2)
    {
      v19 = [v17 jsonRepresentation];
      v20 = @"joeColor";
    }
    else
    {
      v19 = [v17 dictionaryRepresentation];
      v20 = @"joe_color";
    }
    [v4 setObject:v19 forKey:v20];
  }
  v29 = -[GEOPDCaptionedPhoto attribution]((id *)a1);
  v30 = v29;
  if (v29)
  {
    if (a2) {
      [v29 jsonRepresentation];
    }
    else {
    v31 = [v29 dictionaryRepresentation];
    }
    [v4 setObject:v31 forKey:@"attribution"];
  }
  __int16 v32 = *(_WORD *)(a1 + 108);
  if (v32)
  {
    v33 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
    if (a2) {
      v34 = @"dateAdded";
    }
    else {
      v34 = @"date_added";
    }
    [v4 setObject:v33 forKey:v34];

    __int16 v32 = *(_WORD *)(a1 + 108);
  }
  if ((v32 & 0x20) != 0)
  {
    v35 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 104)];
    if (a2) {
      v36 = @"obfuscateFullScreenPhoto";
    }
    else {
      v36 = @"obfuscate_full_screen_photo";
    }
    [v4 setObject:v35 forKey:v36];
  }
  v37 = *(void **)(a1 + 16);
  if (v37)
  {
    v38 = [v37 dictionaryRepresentation];
    v39 = v38;
    if (a2)
    {
      v40 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v38, "count"));
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __49__GEOPDCaptionedPhoto__dictionaryRepresentation___block_invoke;
      v44[3] = &unk_1E53D8860;
      id v41 = v40;
      id v45 = v41;
      [v39 enumerateKeysAndObjectsUsingBlock:v44];
      id v42 = v41;

      v39 = v42;
    }
    [v4 setObject:v39 forKey:@"Unknown Fields"];
  }
LABEL_71:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDCaptionedPhoto _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOPDCaptionedPhoto__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    objc_super v7 = [v5 objectForKeyedSubscript:@"caption"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v8 = (void *)[v7 copy];
      -[GEOPDCaptionedPhoto setCaption:](v6, v8);
    }
    v9 = [v5 objectForKeyedSubscript:@"author"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = (void *)[v9 copy];
      -[GEOPDCaptionedPhoto setAuthor:](v6, v10);
    }
    if (a3) {
      id v11 = @"licenseDescription";
    }
    else {
      id v11 = @"license_description";
    }
    v12 = [v5 objectForKeyedSubscript:v11];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      -[GEOPDCaptionedPhoto setLicenseDescription:](v6, v13);
    }
    if (a3) {
      __int16 v14 = @"licenseUrl";
    }
    else {
      __int16 v14 = @"license_url";
    }
    v15 = [v5 objectForKeyedSubscript:v14];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = (void *)[v15 copy];
      -[GEOPDCaptionedPhoto setLicenseUrl:](v6, v16);
    }
    v17 = [v5 objectForKeyedSubscript:@"photo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [GEOPDPhoto alloc];
      if (v18) {
        v19 = (void *)-[GEOPDPhoto _initWithDictionary:isJSON:](v18, v17, a3);
      }
      else {
        v19 = 0;
      }
      -[GEOPDCaptionedPhoto setPhoto:](v6, v19);
    }
    if (a3) {
      v20 = @"displayFullPhotoInline";
    }
    else {
      v20 = @"display_full_photo_inline";
    }
    v21 = [v5 objectForKeyedSubscript:v20];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v22 = [v21 BOOLValue];
      *(_WORD *)(v6 + 108) |= 0x8000u;
      *(_WORD *)(v6 + 108) |= 2u;
      *(unsigned char *)(v6 + 100) = v22;
    }

    if (a3) {
      v23 = @"useGallery";
    }
    else {
      v23 = @"use_gallery";
    }
    v24 = [v5 objectForKeyedSubscript:v23];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v25 = [v24 BOOLValue];
      *(_WORD *)(v6 + 108) |= 0x8000u;
      *(_WORD *)(v6 + 108) |= 0x40u;
      *(unsigned char *)(v6 + 105) = v25;
    }

    if (a3) {
      v26 = @"highQuality";
    }
    else {
      v26 = @"high_quality";
    }
    v27 = [v5 objectForKeyedSubscript:v26];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v28 = [v27 BOOLValue];
      *(_WORD *)(v6 + 108) |= 0x8000u;
      *(_WORD *)(v6 + 108) |= 8u;
      *(unsigned char *)(v6 + 102) = v28;
    }

    if (a3) {
      v29 = @"isBusinessOwned";
    }
    else {
      v29 = @"is_business_owned";
    }
    v30 = [v5 objectForKeyedSubscript:v29];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v31 = [v30 BOOLValue];
      *(_WORD *)(v6 + 108) |= 0x8000u;
      *(_WORD *)(v6 + 108) |= 0x10u;
      *(unsigned char *)(v6 + 103) = v31;
    }

    if (a3) {
      __int16 v32 = @"displayFullScreenPhotoGallery";
    }
    else {
      __int16 v32 = @"display_full_screen_photo_gallery";
    }
    v33 = [v5 objectForKeyedSubscript:v32];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v34 = [v33 BOOLValue];
      *(_WORD *)(v6 + 108) |= 0x8000u;
      *(_WORD *)(v6 + 108) |= 4u;
      *(unsigned char *)(v6 + 101) = v34;
    }

    if (a3) {
      v35 = @"joeColor";
    }
    else {
      v35 = @"joe_color";
    }
    v36 = [v5 objectForKeyedSubscript:v35];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = [GEOPDJoeColor alloc];
      if (v37)
      {
        id v38 = v36;
        v37 = [(GEOPDJoeColor *)v37 init];
        if (v37)
        {
          if (a3) {
            v39 = @"backgroundColor";
          }
          else {
            v39 = @"background_color";
          }
          v40 = [v38 objectForKeyedSubscript:v39];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v41 = (void *)[v40 copy];
            -[GEOPDJoeColor setBackgroundColor:]((uint64_t)v37, v41);
          }
          if (a3) {
            id v42 = @"primaryTextColor";
          }
          else {
            id v42 = @"primary_text_color";
          }
          v43 = [v38 objectForKeyedSubscript:v42];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v44 = (void *)[v43 copy];
            -[GEOPDJoeColor setPrimaryTextColor:]((uint64_t)v37, v44);
          }
          if (a3) {
            id v45 = @"secondaryTextColor";
          }
          else {
            id v45 = @"secondary_text_color";
          }
          v46 = [v38 objectForKeyedSubscript:v45];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v47 = (void *)[v46 copy];
            -[GEOPDJoeColor setSecondaryTextColor:]((uint64_t)v37, v47);
          }
          if (a3) {
            v48 = @"tertiaryTextColor";
          }
          else {
            v48 = @"tertiary_text_color";
          }
          v49 = [v38 objectForKeyedSubscript:v48];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v50 = (void *)[v49 copy];
            -[GEOPDJoeColor setTertiaryTextColor:]((uint64_t)v37, v50);
          }
          if (a3) {
            v51 = @"quaternaryTextColor";
          }
          else {
            v51 = @"quaternary_text_color";
          }
          v52 = [v38 objectForKeyedSubscript:v51];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v53 = (void *)[v52 copy];
            -[GEOPDJoeColor setQuaternaryTextColor:]((uint64_t)v37, v53);
          }
          v54 = [v38 objectForKeyedSubscript:@"curated"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v55 = [v54 BOOLValue];
            *(unsigned char *)&v37->_flags |= 0x80u;
            *(unsigned char *)&v37->_flags |= 1u;
            v37->_curated = v55;
          }
        }
      }
      -[GEOPDCaptionedPhoto setJoeColor:](v6, v37);
    }
    v56 = [v5 objectForKeyedSubscript:@"attribution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v57 = [GEOPDAttribution alloc];
      if (v57) {
        v58 = (void *)-[GEOPDAttribution _initWithDictionary:isJSON:](v57, v56, a3);
      }
      else {
        v58 = 0;
      }
      -[GEOPDCaptionedPhoto setAttribution:](v6, v58);
    }
    if (a3) {
      v59 = @"dateAdded";
    }
    else {
      v59 = @"date_added";
    }
    v60 = [v5 objectForKeyedSubscript:v59];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v60 doubleValue];
      *(_WORD *)(v6 + 108) |= 0x8000u;
      *(_WORD *)(v6 + 108) |= 1u;
      *(void *)(v6 + 48) = v61;
    }

    if (a3) {
      v62 = @"obfuscateFullScreenPhoto";
    }
    else {
      v62 = @"obfuscate_full_screen_photo";
    }
    v63 = [v5 objectForKeyedSubscript:v62];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v64 = [v63 BOOLValue];
      *(_WORD *)(v6 + 108) |= 0x8000u;
      *(_WORD *)(v6 + 108) |= 0x20u;
      *(unsigned char *)(v6 + 104) = v64;
    }
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDCaptionedPhotoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDCaptionedPhotoIsDirty((uint64_t)self))
  {
    objc_super v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
    goto LABEL_34;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDCaptionedPhoto readAll:]((uint64_t)self, 0);
  if (self->_caption) {
    PBDataWriterWriteStringField();
  }
  id v5 = v10;
  if (self->_author)
  {
    PBDataWriterWriteStringField();
    id v5 = v10;
  }
  if (self->_licenseDescription)
  {
    PBDataWriterWriteStringField();
    id v5 = v10;
  }
  if (self->_licenseUrl)
  {
    PBDataWriterWriteStringField();
    id v5 = v10;
  }
  if (self->_photo)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v10;
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v5 = v10;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x40) == 0)
    {
LABEL_15:
      if ((flags & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_30;
    }
  }
  else if ((flags & 0x40) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteBOOLField();
  id v5 = v10;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_16:
    if ((flags & 0x10) == 0) {
      goto LABEL_17;
    }
LABEL_31:
    PBDataWriterWriteBOOLField();
    id v5 = v10;
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_30:
  PBDataWriterWriteBOOLField();
  id v5 = v10;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0) {
    goto LABEL_31;
  }
LABEL_17:
  if ((flags & 4) != 0)
  {
LABEL_18:
    PBDataWriterWriteBOOLField();
    id v5 = v10;
  }
LABEL_19:
  if (self->_joeColor)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v10;
  }
  if (self->_attribution)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v10;
  }
  __int16 v7 = (__int16)self->_flags;
  if (v7)
  {
    PBDataWriterWriteDoubleField();
    id v5 = v10;
    __int16 v7 = (__int16)self->_flags;
  }
  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v5 = v10;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
LABEL_34:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    __int16 v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDCaptionedPhotoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_16;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDCaptionedPhoto readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_caption copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  uint64_t v11 = [(NSString *)self->_author copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  uint64_t v13 = [(NSString *)self->_licenseDescription copyWithZone:a3];
  __int16 v14 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v13;

  uint64_t v15 = [(NSString *)self->_licenseUrl copyWithZone:a3];
  v16 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v15;

  id v17 = [(GEOPDPhoto *)self->_photo copyWithZone:a3];
  v18 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v17;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 100) = self->_displayFullPhotoInline;
    *(_WORD *)(v5 + 108) |= 2u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x40) == 0)
    {
LABEL_7:
      if ((flags & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_19;
    }
  }
  else if ((flags & 0x40) == 0)
  {
    goto LABEL_7;
  }
  *(unsigned char *)(v5 + 105) = self->_useGallery;
  *(_WORD *)(v5 + 108) |= 0x40u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_8:
    if ((flags & 0x10) == 0) {
      goto LABEL_9;
    }
LABEL_20:
    *(unsigned char *)(v5 + 103) = self->_isBusinessOwned;
    *(_WORD *)(v5 + 108) |= 0x10u;
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_19:
  *(unsigned char *)(v5 + 102) = self->_highQuality;
  *(_WORD *)(v5 + 108) |= 8u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0) {
    goto LABEL_20;
  }
LABEL_9:
  if ((flags & 4) != 0)
  {
LABEL_10:
    *(unsigned char *)(v5 + 101) = self->_displayFullScreenPhotoGallery;
    *(_WORD *)(v5 + 108) |= 4u;
  }
LABEL_11:
  id v20 = [(GEOPDJoeColor *)self->_joeColor copyWithZone:a3];
  v21 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v20;

  id v22 = [(GEOPDAttribution *)self->_attribution copyWithZone:a3];
  v23 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v22;

  __int16 v24 = (__int16)self->_flags;
  if (v24)
  {
    *(double *)(v5 + 48) = self->_dateAdded;
    *(_WORD *)(v5 + 108) |= 1u;
    __int16 v24 = (__int16)self->_flags;
  }
  if ((v24 & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 104) = self->_obfuscateFullScreenPhoto;
    *(_WORD *)(v5 + 108) |= 0x20u;
  }
  char v25 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v25;
LABEL_16:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_63;
  }
  -[GEOPDCaptionedPhoto readAll:]((uint64_t)self, 1);
  -[GEOPDCaptionedPhoto readAll:]((uint64_t)v4, 1);
  caption = self->_caption;
  if ((unint64_t)caption | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](caption, "isEqual:")) {
      goto LABEL_63;
    }
  }
  author = self->_author;
  if ((unint64_t)author | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](author, "isEqual:")) {
      goto LABEL_63;
    }
  }
  licenseDescription = self->_licenseDescription;
  if ((unint64_t)licenseDescription | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](licenseDescription, "isEqual:")) {
      goto LABEL_63;
    }
  }
  licenseUrl = self->_licenseUrl;
  if ((unint64_t)licenseUrl | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](licenseUrl, "isEqual:")) {
      goto LABEL_63;
    }
  }
  photo = self->_photo;
  if ((unint64_t)photo | *((void *)v4 + 10))
  {
    if (!-[GEOPDPhoto isEqual:](photo, "isEqual:")) {
      goto LABEL_63;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v11 = *((_WORD *)v4 + 54);
  if ((flags & 2) != 0)
  {
    if ((v11 & 2) == 0) {
      goto LABEL_63;
    }
    if (self->_displayFullPhotoInline)
    {
      if (!*((unsigned char *)v4 + 100)) {
        goto LABEL_63;
      }
    }
    else if (*((unsigned char *)v4 + 100))
    {
      goto LABEL_63;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_63;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0) {
      goto LABEL_63;
    }
    if (self->_useGallery)
    {
      if (!*((unsigned char *)v4 + 105)) {
        goto LABEL_63;
      }
    }
    else if (*((unsigned char *)v4 + 105))
    {
      goto LABEL_63;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_63;
  }
  if ((flags & 8) != 0)
  {
    if ((v11 & 8) == 0) {
      goto LABEL_63;
    }
    if (self->_highQuality)
    {
      if (!*((unsigned char *)v4 + 102)) {
        goto LABEL_63;
      }
    }
    else if (*((unsigned char *)v4 + 102))
    {
      goto LABEL_63;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_63;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0) {
      goto LABEL_63;
    }
    if (self->_isBusinessOwned)
    {
      if (!*((unsigned char *)v4 + 103)) {
        goto LABEL_63;
      }
    }
    else if (*((unsigned char *)v4 + 103))
    {
      goto LABEL_63;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_63;
  }
  if ((flags & 4) != 0)
  {
    if ((v11 & 4) == 0) {
      goto LABEL_63;
    }
    if (self->_displayFullScreenPhotoGallery)
    {
      if (!*((unsigned char *)v4 + 101)) {
        goto LABEL_63;
      }
    }
    else if (*((unsigned char *)v4 + 101))
    {
      goto LABEL_63;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_63;
  }
  joeColor = self->_joeColor;
  if ((unint64_t)joeColor | *((void *)v4 + 7) && !-[GEOPDJoeColor isEqual:](joeColor, "isEqual:")) {
    goto LABEL_63;
  }
  attribution = self->_attribution;
  if ((unint64_t)attribution | *((void *)v4 + 3))
  {
    if (!-[GEOPDAttribution isEqual:](attribution, "isEqual:")) {
      goto LABEL_63;
    }
  }
  __int16 v14 = (__int16)self->_flags;
  __int16 v15 = *((_WORD *)v4 + 54);
  if (v14)
  {
    if ((v15 & 1) == 0 || self->_dateAdded != *((double *)v4 + 6)) {
      goto LABEL_63;
    }
  }
  else if (v15)
  {
    goto LABEL_63;
  }
  BOOL v16 = (v15 & 0x20) == 0;
  if ((v14 & 0x20) != 0)
  {
    if ((v15 & 0x20) != 0)
    {
      if (self->_obfuscateFullScreenPhoto)
      {
        if (!*((unsigned char *)v4 + 104)) {
          goto LABEL_63;
        }
      }
      else if (*((unsigned char *)v4 + 104))
      {
        goto LABEL_63;
      }
      BOOL v16 = 1;
      goto LABEL_64;
    }
LABEL_63:
    BOOL v16 = 0;
  }
LABEL_64:

  return v16;
}

- (unint64_t)hash
{
  -[GEOPDCaptionedPhoto readAll:]((uint64_t)self, 1);
  NSUInteger v23 = [(NSString *)self->_caption hash];
  NSUInteger v22 = [(NSString *)self->_author hash];
  NSUInteger v21 = [(NSString *)self->_licenseDescription hash];
  NSUInteger v20 = [(NSString *)self->_licenseUrl hash];
  unint64_t v19 = [(GEOPDPhoto *)self->_photo hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_displayFullPhotoInline;
    if ((flags & 0x40) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_useGallery;
      if ((flags & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((flags & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((flags & 8) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_highQuality;
    if ((flags & 0x10) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v7 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v6 = 0;
  if ((flags & 0x10) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_isBusinessOwned;
  if ((flags & 4) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_displayFullScreenPhotoGallery;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v8 = 0;
LABEL_12:
  unint64_t v9 = [(GEOPDJoeColor *)self->_joeColor hash];
  unint64_t v10 = [(GEOPDAttribution *)self->_attribution hash];
  __int16 v11 = (__int16)self->_flags;
  if (v11)
  {
    double dateAdded = self->_dateAdded;
    double v14 = -dateAdded;
    if (dateAdded >= 0.0) {
      double v14 = self->_dateAdded;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  if ((v11 & 0x20) != 0) {
    uint64_t v17 = 2654435761 * self->_obfuscateFullScreenPhoto;
  }
  else {
    uint64_t v17 = 0;
  }
  return v22 ^ v23 ^ v21 ^ v20 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v17;
}

- (uint64_t)mergeFrom:(uint64_t)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v30 = a2;
  -[GEOPDCaptionedPhoto readAll:]((uint64_t)v30, 0);
  id v3 = v30;
  uint64_t v4 = (void *)v30[5];
  if (v4)
  {
    -[GEOPDCaptionedPhoto setCaption:](a1, v4);
    id v3 = v30;
  }
  uint64_t v5 = (void *)v3[4];
  if (v5)
  {
    -[GEOPDCaptionedPhoto setAuthor:](a1, v5);
    id v3 = v30;
  }
  uint64_t v6 = (void *)v3[8];
  if (v6)
  {
    -[GEOPDCaptionedPhoto setLicenseDescription:](a1, v6);
    id v3 = v30;
  }
  uint64_t v7 = (void *)v3[9];
  if (v7)
  {
    -[GEOPDCaptionedPhoto setLicenseUrl:](a1, v7);
    id v3 = v30;
  }
  uint64_t v8 = *(void *)(a1 + 80);
  unint64_t v9 = (void *)v3[10];
  if (v8)
  {
    if (!v9) {
      goto LABEL_24;
    }
    id v10 = v9;
    -[GEOPDPhoto readAll:]((uint64_t)v10, 0);
    __int16 v11 = (void *)*((void *)v10 + 3);
    if (v11) {
      -[GEOPDPhoto setPhotoId:](v8, v11);
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v12 = *((id *)v10 + 4);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          -[GEOPDPhoto addPhotoVersion:](v8, *(void **)(*((void *)&v31 + 1) + 8 * i));
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v14);
    }
  }
  else
  {
    if (!v9) {
      goto LABEL_24;
    }
    -[GEOPDCaptionedPhoto setPhoto:](a1, v9);
  }
  id v3 = v30;
LABEL_24:
  __int16 v17 = *((_WORD *)v3 + 54);
  if ((v17 & 2) != 0)
  {
    *(unsigned char *)(a1 + 100) = *((unsigned char *)v3 + 100);
    *(_WORD *)(a1 + 108) |= 2u;
    __int16 v17 = *((_WORD *)v3 + 54);
    if ((v17 & 0x40) == 0)
    {
LABEL_26:
      if ((v17 & 8) == 0) {
        goto LABEL_27;
      }
      goto LABEL_47;
    }
  }
  else if ((v17 & 0x40) == 0)
  {
    goto LABEL_26;
  }
  *(unsigned char *)(a1 + 105) = *((unsigned char *)v3 + 105);
  *(_WORD *)(a1 + 108) |= 0x40u;
  __int16 v17 = *((_WORD *)v3 + 54);
  if ((v17 & 8) == 0)
  {
LABEL_27:
    if ((v17 & 0x10) == 0) {
      goto LABEL_28;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(unsigned char *)(a1 + 102) = *((unsigned char *)v3 + 102);
  *(_WORD *)(a1 + 108) |= 8u;
  __int16 v17 = *((_WORD *)v3 + 54);
  if ((v17 & 0x10) == 0)
  {
LABEL_28:
    if ((v17 & 4) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_48:
  *(unsigned char *)(a1 + 103) = *((unsigned char *)v3 + 103);
  *(_WORD *)(a1 + 108) |= 0x10u;
  if ((*((_WORD *)v3 + 54) & 4) != 0)
  {
LABEL_29:
    *(unsigned char *)(a1 + 101) = *((unsigned char *)v3 + 101);
    *(_WORD *)(a1 + 108) |= 4u;
  }
LABEL_30:
  uint64_t v18 = *(void *)(a1 + 56);
  unint64_t v19 = (void *)v3[7];
  if (v18)
  {
    if (!v19) {
      goto LABEL_53;
    }
    NSUInteger v20 = v19;
    -[GEOPDJoeColor readAll:]((uint64_t)v20, 0);
    NSUInteger v21 = (void *)v20[3];
    if (v21) {
      -[GEOPDJoeColor setBackgroundColor:](v18, v21);
    }
    NSUInteger v22 = (void *)v20[4];
    if (v22) {
      -[GEOPDJoeColor setPrimaryTextColor:](v18, v22);
    }
    NSUInteger v23 = (void *)v20[6];
    if (v23) {
      -[GEOPDJoeColor setSecondaryTextColor:](v18, v23);
    }
    __int16 v24 = (void *)v20[7];
    if (v24) {
      -[GEOPDJoeColor setTertiaryTextColor:](v18, v24);
    }
    char v25 = (void *)v20[5];
    if (v25) {
      -[GEOPDJoeColor setQuaternaryTextColor:](v18, v25);
    }
    if (v20[10])
    {
      *(unsigned char *)(v18 + 76) = *((unsigned char *)v20 + 76);
      *(unsigned char *)(v18 + 80) |= 1u;
    }
  }
  else
  {
    if (!v19) {
      goto LABEL_53;
    }
    -[GEOPDCaptionedPhoto setJoeColor:](a1, v19);
  }
  id v3 = v30;
LABEL_53:
  uint64_t v26 = *(void *)(a1 + 24);
  v27 = (void *)v3[3];
  if (v26)
  {
    if (!v27) {
      goto LABEL_59;
    }
    -[GEOPDAttribution mergeFrom:](v26, v27);
  }
  else
  {
    if (!v27) {
      goto LABEL_59;
    }
    -[GEOPDCaptionedPhoto setAttribution:](a1, v27);
  }
  id v3 = v30;
LABEL_59:
  __int16 v28 = *((_WORD *)v3 + 54);
  if (v28)
  {
    *(void *)(a1 + 48) = v3[6];
    *(_WORD *)(a1 + 108) |= 1u;
    __int16 v28 = *((_WORD *)v3 + 54);
  }
  if ((v28 & 0x20) != 0)
  {
    *(unsigned char *)(a1 + 104) = *((unsigned char *)v3 + 104);
    *(_WORD *)(a1 + 108) |= 0x20u;
  }

  return MEMORY[0x1F4181820]();
}

@end