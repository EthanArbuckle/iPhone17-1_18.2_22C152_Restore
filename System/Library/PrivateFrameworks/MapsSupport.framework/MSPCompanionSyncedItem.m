@interface MSPCompanionSyncedItem
- (BOOL)hasBookmark;
- (BOOL)hasChangeType;
- (BOOL)hasPin;
- (BOOL)hasSearchRequest;
- (BOOL)hasSyncId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MSPBookmarkStorage)bookmark;
- (MSPHistoryEntryStorage)searchRequest;
- (MSPPinStorage)pin;
- (NSString)syncId;
- (PBUnknownFields)unknownFields;
- (id)changeTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsChangeType:(id)a3;
- (int)changeType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBookmark:(id)a3;
- (void)setChangeType:(int)a3;
- (void)setHasChangeType:(BOOL)a3;
- (void)setPin:(id)a3;
- (void)setSearchRequest:(id)a3;
- (void)setSyncId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPCompanionSyncedItem

- (BOOL)hasSyncId
{
  return self->_syncId != 0;
}

- (int)changeType
{
  if (*(unsigned char *)&self->_has) {
    return self->_changeType;
  }
  else {
    return 1;
  }
}

- (void)setChangeType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_changeType = a3;
}

- (void)setHasChangeType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChangeType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)changeTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = *(&off_100081200 + a3 - 1);
  }

  return v3;
}

- (int)StringAsChangeType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Add"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Update"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Delete"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasBookmark
{
  return self->_bookmark != 0;
}

- (BOOL)hasPin
{
  return self->_pin != 0;
}

- (BOOL)hasSearchRequest
{
  return self->_searchRequest != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)MSPCompanionSyncedItem;
  id v3 = [(MSPCompanionSyncedItem *)&v7 description];
  int v4 = [(MSPCompanionSyncedItem *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  syncId = self->_syncId;
  if (syncId) {
    [v3 setObject:syncId forKey:@"syncId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int v6 = self->_changeType - 1;
    if (v6 >= 3)
    {
      objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_changeType];
    }
    else
    {
      objc_super v7 = *(&off_100081200 + v6);
    }
    [v4 setObject:v7 forKey:@"changeType"];
  }
  bookmark = self->_bookmark;
  if (bookmark)
  {
    v9 = [(MSPBookmarkStorage *)bookmark dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"bookmark"];
  }
  pin = self->_pin;
  if (pin)
  {
    v11 = [(MSPPinStorage *)pin dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"pin"];
  }
  searchRequest = self->_searchRequest;
  if (searchRequest)
  {
    v13 = [(MSPHistoryEntryStorage *)searchRequest dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"searchRequest"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v15 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v4 setObject:v15 forKey:@"Unknown Fields"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (!*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error))
    {
      char v5 = 0;
      unsigned int v6 = 0;
      unint64_t v7 = 0;
      while (1)
      {
        unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
        v7 |= (unint64_t)(v9 & 0x7F) << v5;
        if ((v9 & 0x80) == 0) {
          goto LABEL_11;
        }
        v5 += 7;
        BOOL v10 = v6++ >= 9;
        if (v10)
        {
          unint64_t v7 = 0;
          int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v7 = 0;
      }
LABEL_13:
      if (v11 || (v7 & 7) == 4) {
        break;
      }
      switch((v7 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v13 = (NSString *)objc_claimAutoreleasedReturnValue();
          syncId = self->_syncId;
          self->_syncId = v13;

          goto LABEL_40;
        case 2u:
          id v18 = objc_alloc_init((Class)MSPBookmarkStorage);
          uint64_t v19 = 16;
          goto LABEL_26;
        case 3u:
          id v18 = objc_alloc_init((Class)MSPPinStorage);
          uint64_t v19 = 32;
          goto LABEL_26;
        case 4u:
          id v18 = objc_alloc_init((Class)MSPHistoryEntryStorage);
          uint64_t v19 = 40;
LABEL_26:
          objc_storeStrong((id *)&self->PBCodable_opaque[v19], v18);
          if (!PBReaderPlaceMark()
            || (objc_msgSend(v18, "readFrom:", a3, 0, 0) & 1) == 0)
          {

            LOBYTE(v17) = 0;
            return v17;
          }
          PBReaderRecallMark();

LABEL_40:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            goto LABEL_41;
          break;
        case 5u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)&self->_has |= 1u;
          while (2)
          {
            unint64_t v23 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v23 == -1 || v23 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v24 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v23);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v23 + 1;
              v22 |= (unint64_t)(v24 & 0x7F) << v20;
              if (v24 < 0)
              {
                v20 += 7;
                BOOL v10 = v21++ >= 9;
                if (v10)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_39;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v22) = 0;
          }
LABEL_39:
          self->_changeType = v22;
          goto LABEL_40;
        default:
          if (!self->_unknownFields)
          {
            v15 = (PBUnknownFields *)objc_alloc_init((Class)PBUnknownFields);
            unknownFields = self->_unknownFields;
            self->_unknownFields = v15;
          }
          int v17 = PBUnknownFieldAdd();
          if (!v17) {
            return v17;
          }
          goto LABEL_40;
      }
    }
  }
LABEL_41:
  LOBYTE(v17) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v17;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_syncId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_bookmark)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_pin)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_searchRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_syncId)
  {
    objc_msgSend(v4, "setSyncId:");
    id v4 = v5;
  }
  if (self->_bookmark)
  {
    objc_msgSend(v5, "setBookmark:");
    id v4 = v5;
  }
  if (self->_pin)
  {
    objc_msgSend(v5, "setPin:");
    id v4 = v5;
  }
  if (self->_searchRequest)
  {
    objc_msgSend(v5, "setSearchRequest:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_changeType;
    *((unsigned char *)v4 + 56) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_syncId copyWithZone:a3];
  unint64_t v7 = (void *)*((void *)v5 + 6);
  *((void *)v5 + 6) = v6;

  id v8 = [(MSPBookmarkStorage *)self->_bookmark copyWithZone:a3];
  char v9 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v8;

  id v10 = [(MSPPinStorage *)self->_pin copyWithZone:a3];
  int v11 = (void *)*((void *)v5 + 4);
  *((void *)v5 + 4) = v10;

  id v12 = [(MSPHistoryEntryStorage *)self->_searchRequest copyWithZone:a3];
  v13 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 6) = self->_changeType;
    *((unsigned char *)v5 + 56) |= 1u;
  }
  objc_storeStrong((id *)v5 + 1, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  syncId = self->_syncId;
  if ((unint64_t)syncId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](syncId, "isEqual:")) {
      goto LABEL_14;
    }
  }
  bookmark = self->_bookmark;
  if ((unint64_t)bookmark | *((void *)v4 + 2))
  {
    if (!-[MSPBookmarkStorage isEqual:](bookmark, "isEqual:")) {
      goto LABEL_14;
    }
  }
  pin = self->_pin;
  if ((unint64_t)pin | *((void *)v4 + 4))
  {
    if (!-[MSPPinStorage isEqual:](pin, "isEqual:")) {
      goto LABEL_14;
    }
  }
  searchRequest = self->_searchRequest;
  if ((unint64_t)searchRequest | *((void *)v4 + 5))
  {
    if (!-[MSPHistoryEntryStorage isEqual:](searchRequest, "isEqual:")) {
      goto LABEL_14;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) != 0 && self->_changeType == *((_DWORD *)v4 + 6))
    {
      BOOL v9 = 1;
      goto LABEL_15;
    }
LABEL_14:
    BOOL v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_syncId hash];
  unint64_t v4 = (unint64_t)[(MSPBookmarkStorage *)self->_bookmark hash];
  unint64_t v5 = (unint64_t)[(MSPPinStorage *)self->_pin hash];
  unint64_t v6 = (unint64_t)[(MSPHistoryEntryStorage *)self->_searchRequest hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_changeType;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (int *)a3;
  int v11 = v4;
  if (*((void *)v4 + 6))
  {
    -[MSPCompanionSyncedItem setSyncId:](self, "setSyncId:");
    unint64_t v4 = v11;
  }
  bookmark = self->_bookmark;
  uint64_t v6 = *((void *)v4 + 2);
  if (bookmark)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[MSPBookmarkStorage mergeFrom:](bookmark, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[MSPCompanionSyncedItem setBookmark:](self, "setBookmark:");
  }
  unint64_t v4 = v11;
LABEL_9:
  pin = self->_pin;
  uint64_t v8 = *((void *)v4 + 4);
  if (pin)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[MSPPinStorage mergeFrom:](pin, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[MSPCompanionSyncedItem setPin:](self, "setPin:");
  }
  unint64_t v4 = v11;
LABEL_15:
  searchRequest = self->_searchRequest;
  uint64_t v10 = *((void *)v4 + 5);
  if (searchRequest)
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[MSPHistoryEntryStorage mergeFrom:](searchRequest, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[MSPCompanionSyncedItem setSearchRequest:](self, "setSearchRequest:");
  }
  unint64_t v4 = v11;
LABEL_21:
  if (v4[14])
  {
    self->_changeType = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }

  _objc_release_x1();
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSString)syncId
{
  return self->_syncId;
}

- (void)setSyncId:(id)a3
{
}

- (MSPBookmarkStorage)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
}

- (MSPPinStorage)pin
{
  return self->_pin;
}

- (void)setPin:(id)a3
{
}

- (MSPHistoryEntryStorage)searchRequest
{
  return self->_searchRequest;
}

- (void)setSearchRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncId, 0);
  objc_storeStrong((id *)&self->_searchRequest, 0);
  objc_storeStrong((id *)&self->_pin, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end