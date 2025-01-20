@interface GEOPDButtonItem
+ (BOOL)isValid:(id)a3;
- (BOOL)hasButtonType;
- (BOOL)hasGroupParams;
- (BOOL)hasQuickLinkParams;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDButtonItem)init;
- (GEOPDButtonItem)initWithData:(id)a3;
- (GEOPDButtonItem)initWithDictionary:(id)a3;
- (GEOPDButtonItem)initWithJSON:(id)a3;
- (GEOPDGroupParams)groupParams;
- (GEOPDQuickLinkParams)quickLinkParams;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)buttonTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsButtonType:(id)a3;
- (int)buttonType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readGroupParams;
- (void)_readQuickLinkParams;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setButtonType:(int)a3;
- (void)setGroupParams:(id)a3;
- (void)setHasButtonType:(BOOL)a3;
- (void)setQuickLinkParams:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDButtonItem

- (GEOPDButtonItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDButtonItem;
  v2 = [(GEOPDButtonItem *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDButtonItem)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDButtonItem;
  v3 = [(GEOPDButtonItem *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)buttonType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_buttonType;
  }
  else {
    return 0;
  }
}

- (void)setButtonType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_buttonType = a3;
}

- (void)setHasButtonType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasButtonType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)buttonTypeAsString:(int)a3
{
  if (a3 >= 0x10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E3720[a3];
  }

  return v3;
}

- (int)StringAsButtonType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BUTTON_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_ADD_TO_GUIDES"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_REPORT_AN_ISSUE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_SHARE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_CALL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_MESSAGE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_WEBSITE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_QUICK_LINK"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_GROUP"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_DIRECTIONS"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_FLYOVER"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_DOWNLOAD"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_ADD_PHOTOS"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_ADD_TO_FAVORITES"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_SAVE_TO_LIBRARY"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_ADD_A_NOTE"])
  {
    int v4 = 15;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readQuickLinkParams
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDButtonItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQuickLinkParams_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasQuickLinkParams
{
  return self->_quickLinkParams != 0;
}

- (GEOPDQuickLinkParams)quickLinkParams
{
  -[GEOPDButtonItem _readQuickLinkParams]((uint64_t)self);
  quickLinkParams = self->_quickLinkParams;

  return quickLinkParams;
}

- (void)setQuickLinkParams:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_quickLinkParams, a3);
}

- (void)_readGroupParams
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDButtonItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGroupParams_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasGroupParams
{
  return self->_groupParams != 0;
}

- (GEOPDGroupParams)groupParams
{
  -[GEOPDButtonItem _readGroupParams]((uint64_t)self);
  groupParams = self->_groupParams;

  return groupParams;
}

- (void)setGroupParams:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_groupParams, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDButtonItem;
  int v4 = [(GEOPDButtonItem *)&v8 description];
  v5 = [(GEOPDButtonItem *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDButtonItem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v5 = *(int *)(a1 + 52);
      if (v5 >= 0x10)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53E3720[v5];
      }
      if (a2) {
        objc_super v7 = @"buttonType";
      }
      else {
        objc_super v7 = @"button_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 quickLinkParams];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"quickLinkParams";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"quick_link_params";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = [(id)a1 groupParams];
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"groupParams";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"group_params";
      }
      [v4 setObject:v14 forKey:v15];
    }
    v16 = *(void **)(a1 + 16);
    if (v16)
    {
      v17 = [v16 dictionaryRepresentation];
      v18 = v17;
      if (a2)
      {
        v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __45__GEOPDButtonItem__dictionaryRepresentation___block_invoke;
        v23[3] = &unk_1E53D8860;
        id v20 = v19;
        id v24 = v20;
        [v18 enumerateKeysAndObjectsUsingBlock:v23];
        id v21 = v20;

        v18 = v21;
      }
      [v4 setObject:v18 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDButtonItem _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOPDButtonItem__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDButtonItem)initWithDictionary:(id)a3
{
  return (GEOPDButtonItem *)-[GEOPDButtonItem _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_61;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_61;
  }
  if (a3) {
    objc_super v6 = @"buttonType";
  }
  else {
    objc_super v6 = @"button_type";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"BUTTON_TYPE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"BUTTON_TYPE_ADD_TO_GUIDES"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"BUTTON_TYPE_REPORT_AN_ISSUE"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"BUTTON_TYPE_SHARE"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"BUTTON_TYPE_CALL"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"BUTTON_TYPE_MESSAGE"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"BUTTON_TYPE_WEBSITE"])
    {
      uint64_t v9 = 6;
    }
    else if ([v8 isEqualToString:@"BUTTON_TYPE_QUICK_LINK"])
    {
      uint64_t v9 = 7;
    }
    else if ([v8 isEqualToString:@"BUTTON_TYPE_GROUP"])
    {
      uint64_t v9 = 8;
    }
    else if ([v8 isEqualToString:@"BUTTON_TYPE_DIRECTIONS"])
    {
      uint64_t v9 = 9;
    }
    else if ([v8 isEqualToString:@"BUTTON_TYPE_FLYOVER"])
    {
      uint64_t v9 = 10;
    }
    else if ([v8 isEqualToString:@"BUTTON_TYPE_DOWNLOAD"])
    {
      uint64_t v9 = 11;
    }
    else if ([v8 isEqualToString:@"BUTTON_TYPE_ADD_PHOTOS"])
    {
      uint64_t v9 = 12;
    }
    else if ([v8 isEqualToString:@"BUTTON_TYPE_ADD_TO_FAVORITES"])
    {
      uint64_t v9 = 13;
    }
    else if ([v8 isEqualToString:@"BUTTON_TYPE_SAVE_TO_LIBRARY"])
    {
      uint64_t v9 = 14;
    }
    else if ([v8 isEqualToString:@"BUTTON_TYPE_ADD_A_NOTE"])
    {
      uint64_t v9 = 15;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_43;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_43:
    [a1 setButtonType:v9];
  }

  if (a3) {
    id v10 = @"quickLinkParams";
  }
  else {
    id v10 = @"quick_link_params";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [GEOPDQuickLinkParams alloc];
    if (a3) {
      uint64_t v13 = [(GEOPDQuickLinkParams *)v12 initWithJSON:v11];
    }
    else {
      uint64_t v13 = [(GEOPDQuickLinkParams *)v12 initWithDictionary:v11];
    }
    v14 = (void *)v13;
    [a1 setQuickLinkParams:v13];
  }
  if (a3) {
    v15 = @"groupParams";
  }
  else {
    v15 = @"group_params";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [GEOPDGroupParams alloc];
    if (a3) {
      uint64_t v18 = [(GEOPDGroupParams *)v17 initWithJSON:v16];
    }
    else {
      uint64_t v18 = [(GEOPDGroupParams *)v17 initWithDictionary:v16];
    }
    v19 = (void *)v18;
    [a1 setGroupParams:v18];
  }
LABEL_61:

  return a1;
}

- (GEOPDButtonItem)initWithJSON:(id)a3
{
  return (GEOPDButtonItem *)-[GEOPDButtonItem _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_1125;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_1126;
    }
    GEOPDButtonItemReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOPDQuickLinkParams *)self->_quickLinkParams readAll:1];
    [(GEOPDGroupParams *)self->_groupParams readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDButtonItemIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDButtonItemReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDButtonItem *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_quickLinkParams)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_groupParams)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOPDButtonItem *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 13) = self->_buttonType;
    *((unsigned char *)v5 + 56) |= 1u;
  }
  if (self->_quickLinkParams)
  {
    objc_msgSend(v5, "setQuickLinkParams:");
    int v4 = v5;
  }
  if (self->_groupParams)
  {
    objc_msgSend(v5, "setGroupParams:");
    int v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDButtonItemReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDButtonItem *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_buttonType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  id v9 = [(GEOPDQuickLinkParams *)self->_quickLinkParams copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  id v11 = [(GEOPDGroupParams *)self->_groupParams copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  uint64_t v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOPDButtonItem *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_buttonType != *((_DWORD *)v4 + 13)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  quickLinkParams = self->_quickLinkParams;
  if ((unint64_t)quickLinkParams | *((void *)v4 + 4)
    && !-[GEOPDQuickLinkParams isEqual:](quickLinkParams, "isEqual:"))
  {
    goto LABEL_11;
  }
  groupParams = self->_groupParams;
  if ((unint64_t)groupParams | *((void *)v4 + 3)) {
    char v7 = -[GEOPDGroupParams isEqual:](groupParams, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  [(GEOPDButtonItem *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_buttonType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDQuickLinkParams *)self->_quickLinkParams hash] ^ v3;
  return v4 ^ [(GEOPDGroupParams *)self->_groupParams hash];
}

- (void)mergeFrom:(id)a3
{
  id v9 = (int *)a3;
  [v9 readAll:0];
  unint64_t v4 = v9;
  if (v9[14])
  {
    self->_buttonType = v9[13];
    *(unsigned char *)&self->_flags |= 1u;
  }
  quickLinkParams = self->_quickLinkParams;
  uint64_t v6 = *((void *)v9 + 4);
  if (quickLinkParams)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDQuickLinkParams mergeFrom:](quickLinkParams, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDButtonItem setQuickLinkParams:](self, "setQuickLinkParams:");
  }
  unint64_t v4 = v9;
LABEL_9:
  groupParams = self->_groupParams;
  uint64_t v8 = *((void *)v4 + 3);
  if (groupParams)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOPDGroupParams mergeFrom:](groupParams, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOPDButtonItem setGroupParams:](self, "setGroupParams:");
  }
  unint64_t v4 = v9;
LABEL_15:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPDButtonItemReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1130);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDButtonItem *)self readAll:0];
    [(GEOPDQuickLinkParams *)self->_quickLinkParams clearUnknownFields:1];
    groupParams = self->_groupParams;
    [(GEOPDGroupParams *)groupParams clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickLinkParams, 0);
  objc_storeStrong((id *)&self->_groupParams, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end