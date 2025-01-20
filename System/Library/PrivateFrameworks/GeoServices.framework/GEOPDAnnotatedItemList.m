@interface GEOPDAnnotatedItemList
+ (id)annotatedItemListForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAnnotatedItemList)init;
- (GEOPDAnnotatedItemList)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)picItemContainer;
- (id)textItemContainer;
- (id)title;
- (uint64_t)annotatedItemStyle;
- (unint64_t)hash;
- (void)_readPicItemContainer;
- (void)_readTextItemContainer;
- (void)_readTitle;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAnnotatedItemList

+ (id)annotatedItemListForPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__37;
  v11 = __Block_byref_object_dispose__37;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__GEOPDAnnotatedItemList_PlaceDataExtras__annotatedItemListForPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:57 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __73__GEOPDAnnotatedItemList_PlaceDataExtras__annotatedItemListForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue annotatedItemList](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (GEOPDAnnotatedItemList)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAnnotatedItemList;
  v2 = [(GEOPDAnnotatedItemList *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDAnnotatedItemList)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAnnotatedItemList;
  id v3 = [(GEOPDAnnotatedItemList *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnnotatedItemListReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags_5);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)title
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDAnnotatedItemList _readTitle]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPicItemContainer
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnnotatedItemListReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPicItemContainer_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)picItemContainer
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDAnnotatedItemList _readPicItemContainer]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readTextItemContainer
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnnotatedItemListReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTextItemContainer_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)textItemContainer
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDAnnotatedItemList _readTextItemContainer]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)annotatedItemStyle
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 64);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
    if (v2) {
      return *(unsigned int *)(v1 + 60);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAnnotatedItemList;
  id v4 = [(GEOPDAnnotatedItemList *)&v8 description];
  uint64_t v5 = [(GEOPDAnnotatedItemList *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAnnotatedItemList _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDAnnotatedItemList readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = -[GEOPDAnnotatedItemList title]((id *)a1);
    if (v5) {
      [v4 setObject:v5 forKey:@"title"];
    }

    objc_super v6 = -[GEOPDAnnotatedItemList picItemContainer]((id *)a1);
    objc_super v7 = v6;
    if (v6)
    {
      if (a2)
      {
        objc_super v8 = [v6 jsonRepresentation];
        uint64_t v9 = @"picItemContainer";
      }
      else
      {
        objc_super v8 = [v6 dictionaryRepresentation];
        uint64_t v9 = @"pic_item_container";
      }
      [v4 setObject:v8 forKey:v9];
    }
    v10 = -[GEOPDAnnotatedItemList textItemContainer]((id *)a1);
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        id v12 = [v10 jsonRepresentation];
        v13 = @"textItemContainer";
      }
      else
      {
        id v12 = [v10 dictionaryRepresentation];
        v13 = @"text_item_container";
      }
      [v4 setObject:v12 forKey:v13];
    }
    if (*(unsigned char *)(a1 + 64))
    {
      int v14 = *(_DWORD *)(a1 + 60);
      if (v14)
      {
        if (v14 == 1)
        {
          v15 = @"ANNOTATED_ITEM_STYLE_RESTAURANT_MENU";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 60));
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v15 = @"ANNOTATED_ITEM_STYLE_UNKNOWN";
      }
      if (a2) {
        v16 = @"annotatedItemStyle";
      }
      else {
        v16 = @"annotated_item_style";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = *(void **)(a1 + 16);
    if (v17)
    {
      v18 = [v17 dictionaryRepresentation];
      v19 = v18;
      if (a2)
      {
        v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __52__GEOPDAnnotatedItemList__dictionaryRepresentation___block_invoke;
        v24[3] = &unk_1E53D8860;
        id v21 = v20;
        id v25 = v21;
        [v19 enumerateKeysAndObjectsUsingBlock:v24];
        id v22 = v21;

        v19 = v22;
      }
      [v4 setObject:v19 forKey:@"Unknown Fields"];
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
  return -[GEOPDAnnotatedItemList _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_503;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_504;
      }
      GEOPDAnnotatedItemListReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOPDTextItemContainer readAll:](*(void *)(a1 + 32), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __52__GEOPDAnnotatedItemList__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
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
  return GEOPDAnnotatedItemListReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader
    || (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x34) != 0)
    || (*(unsigned char *)&self->_flags & 8) != 0
    && (textItemContainer = self->_textItemContainer) != 0
    && (os_unfair_lock_lock_with_options(),
        os_unfair_lock_assert_owner(&textItemContainer->_readerLock),
        int v7 = *(unsigned char *)&textItemContainer->_flags & 0xE,
        os_unfair_lock_unlock(&textItemContainer->_readerLock),
        v7))
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAnnotatedItemList readAll:]((uint64_t)self, 0);
    if (self->_title) {
      PBDataWriterWriteStringField();
    }
    id v5 = v10;
    if (self->_picItemContainer)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (self->_textItemContainer)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v10;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
  else
  {
    objc_super v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    int v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDAnnotatedItemListReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAnnotatedItemList readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_title copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  id v11 = [(GEOPDPictureItemContainer *)self->_picItemContainer copyWithZone:a3];
  id v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  id v13 = [(GEOPDTextItemContainer *)self->_textItemContainer copyWithZone:a3];
  int v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_annotatedItemStyle;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  v15 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  -[GEOPDAnnotatedItemList readAll:]((uint64_t)self, 1);
  -[GEOPDAnnotatedItemList readAll:]((uint64_t)v4, 1);
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_12;
    }
  }
  picItemContainer = self->_picItemContainer;
  if ((unint64_t)picItemContainer | *((void *)v4 + 3))
  {
    if (!-[GEOPDPictureItemContainer isEqual:](picItemContainer, "isEqual:")) {
      goto LABEL_12;
    }
  }
  textItemContainer = self->_textItemContainer;
  if ((unint64_t)textItemContainer | *((void *)v4 + 4))
  {
    if (!-[GEOPDTextItemContainer isEqual:](textItemContainer, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 64) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) != 0 && self->_annotatedItemStyle == *((_DWORD *)v4 + 15))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDAnnotatedItemList readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_title hash];
  unint64_t v4 = [(GEOPDPictureItemContainer *)self->_picItemContainer hash];
  unint64_t v5 = [(GEOPDTextItemContainer *)self->_textItemContainer hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_annotatedItemStyle;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_textItemContainer, 0);
  objc_storeStrong((id *)&self->_picItemContainer, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end