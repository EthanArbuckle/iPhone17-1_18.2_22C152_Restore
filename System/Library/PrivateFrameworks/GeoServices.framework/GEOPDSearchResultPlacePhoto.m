@interface GEOPDSearchResultPlacePhoto
+ (id)searchResultPhotosFromPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)photo;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchResultPlacePhoto

+ (id)searchResultPhotosFromPlaceData:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__GEOPDSearchResultPlacePhoto_PlaceDataExtras__searchResultPhotosFromPlaceData___block_invoke;
  v10[3] = &unk_1E53E1940;
  id v11 = v5;
  id v6 = v5;
  [v4 enumerateValidComponentValuesOfType:102 usingBlock:v10];

  if ([v6 count]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  return v8;
}

void __80__GEOPDSearchResultPlacePhoto_PlaceDataExtras__searchResultPhotosFromPlaceData___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  if (v3 && v3[68])
  {
    v9 = v3;
    id v4 = -[GEOPDComponentValue searchResultPlacePhoto](v3);
    if (v4)
    {
      uint64_t v5 = v4[2];

      v3 = v9;
      if (!v5) {
        goto LABEL_7;
      }
      id v6 = *(void **)(a1 + 32);
      -[GEOPDComponentValue searchResultPlacePhoto](v9);
      v7 = (id *)objc_claimAutoreleasedReturnValue();
      id v8 = -[GEOPDSearchResultPlacePhoto photo](v7);
      [v6 addObject:v8];
    }
    else
    {
      v7 = 0;
    }

    v3 = v9;
  }
LABEL_7:
}

- (id)photo
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchResultPlacePhoto;
  id v4 = [(GEOPDSearchResultPlacePhoto *)&v8 description];
  uint64_t v5 = [(GEOPDSearchResultPlacePhoto *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchResultPlacePhoto _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = *(id *)(a1 + 16);
    id v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"photo"];
    }
    objc_super v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = [v8 dictionaryRepresentation];
      v10 = v9;
      if (a2)
      {
        id v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __57__GEOPDSearchResultPlacePhoto__dictionaryRepresentation___block_invoke;
        v15[3] = &unk_1E53D8860;
        id v12 = v11;
        id v16 = v12;
        [v10 enumerateKeysAndObjectsUsingBlock:v15];
        id v13 = v12;

        v10 = v13;
      }
      [v4 setObject:v10 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchResultPlacePhoto _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOPDSearchResultPlacePhoto__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchResultPlacePhotoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_photo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOPDCaptionedPhoto *)self->_photo copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    photo = self->_photo;
    if ((unint64_t)photo | v4[2]) {
      char v6 = -[GEOPDCaptionedPhoto isEqual:](photo, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(GEOPDCaptionedPhoto *)self->_photo hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photo, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end