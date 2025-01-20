@interface GEOActionButtonDetail
+ (BOOL)isValid:(id)a3;
- (BOOL)dropDown;
- (BOOL)hasCategory;
- (BOOL)hasDropDown;
- (BOOL)hasLinkType;
- (BOOL)hasProviderId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOActionButtonDetail)init;
- (GEOActionButtonDetail)initWithData:(id)a3;
- (GEOActionButtonDetail)initWithDictionary:(id)a3;
- (GEOActionButtonDetail)initWithJSON:(id)a3;
- (NSString)category;
- (NSString)providerId;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)linkTypeAsString:(int)a3;
- (int)StringAsLinkType:(id)a3;
- (int)linkType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCategory;
- (void)_readProviderId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCategory:(id)a3;
- (void)setDropDown:(BOOL)a3;
- (void)setHasDropDown:(BOOL)a3;
- (void)setHasLinkType:(BOOL)a3;
- (void)setLinkType:(int)a3;
- (void)setProviderId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOActionButtonDetail

- (GEOActionButtonDetail)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOActionButtonDetail;
  v2 = [(GEOActionButtonDetail *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOActionButtonDetail)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOActionButtonDetail;
  v3 = [(GEOActionButtonDetail *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCategory
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActionButtonDetailReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategory_tags_4);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasCategory
{
  return self->_category != 0;
}

- (NSString)category
{
  -[GEOActionButtonDetail _readCategory]((uint64_t)self);
  category = self->_category;

  return category;
}

- (void)setCategory:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_category, a3);
}

- (void)_readProviderId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 52) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActionButtonDetailReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProviderId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasProviderId
{
  return self->_providerId != 0;
}

- (NSString)providerId
{
  -[GEOActionButtonDetail _readProviderId]((uint64_t)self);
  providerId = self->_providerId;

  return providerId;
}

- (void)setProviderId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_providerId, a3);
}

- (int)linkType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_linkType;
  }
  else {
    return 0;
  }
}

- (void)setLinkType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_linkType = a3;
}

- (void)setHasLinkType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasLinkType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)linkTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F8B80[a3];
  }

  return v3;
}

- (int)StringAsLinkType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LINK_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LINK_TYPE_QUICK_LINK"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LINK_TYPE_APP_CLIP_LINK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LINK_TYPE_APP_EXTENSION"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)dropDown
{
  return self->_dropDown;
}

- (void)setDropDown:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  self->_dropDown = a3;
}

- (void)setHasDropDown:(BOOL)a3
{
  if (a3) {
    char v3 = 18;
  }
  else {
    char v3 = 16;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDropDown
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOActionButtonDetail;
  int v4 = [(GEOActionButtonDetail *)&v8 description];
  v5 = [(GEOActionButtonDetail *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOActionButtonDetail _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 category];
    if (v5) {
      [v4 setObject:v5 forKey:@"category"];
    }

    objc_super v6 = [(id)a1 providerId];
    if (v6)
    {
      if (a2) {
        objc_super v7 = @"providerId";
      }
      else {
        objc_super v7 = @"provider_id";
      }
      [v4 setObject:v6 forKey:v7];
    }

    char v8 = *(unsigned char *)(a1 + 52);
    if (v8)
    {
      uint64_t v9 = *(int *)(a1 + 44);
      if (v9 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 44));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53F8B80[v9];
      }
      if (a2) {
        v11 = @"linkType";
      }
      else {
        v11 = @"link_type";
      }
      [v4 setObject:v10 forKey:v11];

      char v8 = *(unsigned char *)(a1 + 52);
    }
    if ((v8 & 2) != 0)
    {
      v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
      if (a2) {
        v13 = @"dropDown";
      }
      else {
        v13 = @"drop_down";
      }
      [v4 setObject:v12 forKey:v13];
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
  return -[GEOActionButtonDetail _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOActionButtonDetail)initWithDictionary:(id)a3
{
  return (GEOActionButtonDetail *)-[GEOActionButtonDetail _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_33;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_33;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"category"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = (void *)[v6 copy];
    [a1 setCategory:v7];
  }
  if (a3) {
    char v8 = @"providerId";
  }
  else {
    char v8 = @"provider_id";
  }
  uint64_t v9 = [v5 objectForKeyedSubscript:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = (void *)[v9 copy];
    [a1 setProviderId:v10];
  }
  if (a3) {
    v11 = @"linkType";
  }
  else {
    v11 = @"link_type";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v12;
    if ([v13 isEqualToString:@"LINK_TYPE_UNKNOWN"])
    {
      uint64_t v14 = 0;
    }
    else if ([v13 isEqualToString:@"LINK_TYPE_QUICK_LINK"])
    {
      uint64_t v14 = 1;
    }
    else if ([v13 isEqualToString:@"LINK_TYPE_APP_CLIP_LINK"])
    {
      uint64_t v14 = 2;
    }
    else if ([v13 isEqualToString:@"LINK_TYPE_APP_EXTENSION"])
    {
      uint64_t v14 = 3;
    }
    else
    {
      uint64_t v14 = 0;
    }

    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v12 intValue];
LABEL_26:
    [a1 setLinkType:v14];
  }

  if (a3) {
    v15 = @"dropDown";
  }
  else {
    v15 = @"drop_down";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDropDown:", objc_msgSend(v16, "BOOLValue"));
  }

LABEL_33:
  return a1;
}

- (GEOActionButtonDetail)initWithJSON:(id)a3
{
  return (GEOActionButtonDetail *)-[GEOActionButtonDetail _initWithDictionary:isJSON:](self, a3, 1);
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
      char v8 = (int *)&readAll__recursiveTag_90;
    }
    else {
      char v8 = (int *)&readAll__nonRecursiveTag_90;
    }
    GEOActionButtonDetailReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOActionButtonDetailIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOActionButtonDetailReadAllFrom((uint64_t)self, a3, 0);
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
    [(GEOActionButtonDetail *)self readAll:0];
    if (self->_category) {
      PBDataWriterWriteStringField();
    }
    if (self->_providerId) {
      PBDataWriterWriteStringField();
    }
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOActionButtonDetail *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 8) = self->_readerMarkPos;
  *((_DWORD *)v5 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_category) {
    objc_msgSend(v5, "setCategory:");
  }
  if (self->_providerId) {
    objc_msgSend(v5, "setProviderId:");
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v5 + 11) = self->_linkType;
    *((unsigned char *)v5 + 52) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v5 + 48) = self->_dropDown;
    *((unsigned char *)v5 + 52) |= 2u;
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
      GEOActionButtonDetailReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOActionButtonDetail *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_category copyWithZone:a3];
  v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  uint64_t v11 = [(NSString *)self->_providerId copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 44) = self->_linkType;
    *(unsigned char *)(v5 + 52) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 48) = self->_dropDown;
    *(unsigned char *)(v5 + 52) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOActionButtonDetail *)self readAll:1];
  [v4 readAll:1];
  category = self->_category;
  if ((unint64_t)category | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](category, "isEqual:")) {
      goto LABEL_13;
    }
  }
  providerId = self->_providerId;
  if ((unint64_t)providerId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](providerId, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_linkType != *((_DWORD *)v4 + 11)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_13;
  }
  BOOL v7 = (*((unsigned char *)v4 + 52) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0)
    {
LABEL_13:
      BOOL v7 = 0;
      goto LABEL_14;
    }
    if (self->_dropDown)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_13;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_13;
    }
    BOOL v7 = 1;
  }
LABEL_14:

  return v7;
}

- (unint64_t)hash
{
  [(GEOActionButtonDetail *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_category hash];
  NSUInteger v4 = [(NSString *)self->_providerId hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v5 = 2654435761 * self->_linkType;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_dropDown;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v6 = a3;
  [v6 readAll:0];
  NSUInteger v4 = v6;
  if (v6[2])
  {
    -[GEOActionButtonDetail setCategory:](self, "setCategory:");
    NSUInteger v4 = v6;
  }
  if (v4[3])
  {
    -[GEOActionButtonDetail setProviderId:](self, "setProviderId:");
    NSUInteger v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 52);
  if (v5)
  {
    self->_linkType = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v4 + 52);
  }
  if ((v5 & 2) != 0)
  {
    self->_dropDown = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerId, 0);
  objc_storeStrong((id *)&self->_category, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end