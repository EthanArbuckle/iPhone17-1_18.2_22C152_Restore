@interface GEOMapItemAddressBookAttributes
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAddressIdentifier;
- (BOOL)hasAddressType;
- (BOOL)hasContactIdentifier;
- (BOOL)hasIsMe;
- (BOOL)hasName;
- (BOOL)hasSpokenName;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMe;
- (BOOL)readFrom:(id)a3;
- (GEOMapItemAddressBookAttributes)init;
- (GEOMapItemAddressBookAttributes)initWithData:(id)a3;
- (GEOMapItemAddressBookAttributes)initWithDictionary:(id)a3;
- (GEOMapItemAddressBookAttributes)initWithJSON:(id)a3;
- (NSString)addressIdentifier;
- (NSString)contactIdentifier;
- (NSString)name;
- (NSString)spokenName;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)addressTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsAddressType:(id)a3;
- (int)addressType;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readAddressIdentifier;
- (void)_readContactIdentifier;
- (void)_readName;
- (void)_readSpokenName;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddressIdentifier:(id)a3;
- (void)setAddressType:(int)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setHasAddressType:(BOOL)a3;
- (void)setHasIsMe:(BOOL)a3;
- (void)setIsMe:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setSpokenName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMapItemAddressBookAttributes

- (GEOMapItemAddressBookAttributes)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMapItemAddressBookAttributes;
  v2 = [(GEOMapItemAddressBookAttributes *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOMapItemAddressBookAttributes)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOMapItemAddressBookAttributes;
  v3 = [(GEOMapItemAddressBookAttributes *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)addressType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_addressType;
  }
  else {
    return 0;
  }
}

- (void)setAddressType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_addressType = a3;
}

- (void)setHasAddressType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasAddressType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)addressTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E78F8[a3];
  }

  return v3;
}

- (int)StringAsAddressType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Home"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Work"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"School"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemAddressBookAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_789);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (NSString)name
{
  -[GEOMapItemAddressBookAttributes _readName]((uint64_t)self);
  name = self->_name;

  return name;
}

- (void)setName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readSpokenName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemAddressBookAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpokenName_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasSpokenName
{
  return self->_spokenName != 0;
}

- (NSString)spokenName
{
  -[GEOMapItemAddressBookAttributes _readSpokenName]((uint64_t)self);
  spokenName = self->_spokenName;

  return spokenName;
}

- (void)setSpokenName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_spokenName, a3);
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void)setIsMe:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_isMe = a3;
}

- (void)setHasIsMe:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsMe
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readAddressIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemAddressBookAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasAddressIdentifier
{
  return self->_addressIdentifier != 0;
}

- (NSString)addressIdentifier
{
  -[GEOMapItemAddressBookAttributes _readAddressIdentifier]((uint64_t)self);
  addressIdentifier = self->_addressIdentifier;

  return addressIdentifier;
}

- (void)setAddressIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_addressIdentifier, a3);
}

- (void)_readContactIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemAddressBookAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readContactIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasContactIdentifier
{
  return self->_contactIdentifier != 0;
}

- (NSString)contactIdentifier
{
  -[GEOMapItemAddressBookAttributes _readContactIdentifier]((uint64_t)self);
  contactIdentifier = self->_contactIdentifier;

  return contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_contactIdentifier, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMapItemAddressBookAttributes;
  int v4 = [(GEOMapItemAddressBookAttributes *)&v8 description];
  v5 = [(GEOMapItemAddressBookAttributes *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapItemAddressBookAttributes _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 76))
    {
      uint64_t v5 = *(int *)(a1 + 68);
      if (v5 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53E78F8[v5];
      }
      [v4 setObject:v6 forKey:@"addressType"];
    }
    objc_super v7 = [(id)a1 name];
    if (v7) {
      [v4 setObject:v7 forKey:@"name"];
    }

    objc_super v8 = [(id)a1 spokenName];
    if (v8) {
      [v4 setObject:v8 forKey:@"spokenName"];
    }

    if ((*(unsigned char *)(a1 + 76) & 2) != 0)
    {
      v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
      [v4 setObject:v9 forKey:@"isMe"];
    }
    v10 = [(id)a1 addressIdentifier];
    if (v10) {
      [v4 setObject:v10 forKey:@"addressIdentifier"];
    }

    v11 = [(id)a1 contactIdentifier];
    if (v11) {
      [v4 setObject:v11 forKey:@"contactIdentifier"];
    }

    v12 = *(void **)(a1 + 16);
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __61__GEOMapItemAddressBookAttributes__dictionaryRepresentation___block_invoke;
        v19[3] = &unk_1E53D8860;
        id v16 = v15;
        id v20 = v16;
        [v14 enumerateKeysAndObjectsUsingBlock:v19];
        id v17 = v16;

        v14 = v17;
      }
      [v4 setObject:v14 forKey:@"Unknown Fields"];
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
  return -[GEOMapItemAddressBookAttributes _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __61__GEOMapItemAddressBookAttributes__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOMapItemAddressBookAttributes)initWithDictionary:(id)a3
{
  return (GEOMapItemAddressBookAttributes *)-[GEOMapItemAddressBookAttributes _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_28;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_28;
  }
  int v4 = [v3 objectForKeyedSubscript:@"addressType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 isEqualToString:@"Unknown"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"Home"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"Work"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"School"])
    {
      uint64_t v6 = 3;
    }
    else
    {
      uint64_t v6 = 0;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v4 intValue];
LABEL_16:
    [a1 setAddressType:v6];
  }

  objc_super v7 = [v3 objectForKeyedSubscript:@"name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    [a1 setName:v8];
  }
  v9 = [v3 objectForKeyedSubscript:@"spokenName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = (void *)[v9 copy];
    [a1 setSpokenName:v10];
  }
  v11 = [v3 objectForKeyedSubscript:@"isMe"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsMe:", objc_msgSend(v11, "BOOLValue"));
  }

  v12 = [v3 objectForKeyedSubscript:@"addressIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = (void *)[v12 copy];
    [a1 setAddressIdentifier:v13];
  }
  v14 = [v3 objectForKeyedSubscript:@"contactIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = (void *)[v14 copy];
    [a1 setContactIdentifier:v15];
  }
LABEL_28:

  return a1;
}

- (GEOMapItemAddressBookAttributes)initWithJSON:(id)a3
{
  return (GEOMapItemAddressBookAttributes *)-[GEOMapItemAddressBookAttributes _initWithDictionary:isJSON:](self, a3);
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
      objc_super v8 = (int *)&readAll__recursiveTag_805;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_806;
    }
    GEOMapItemAddressBookAttributesReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapItemAddressBookAttributesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapItemAddressBookAttributesReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 7u))
  {
    uint64_t v6 = self->_reader;
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
    [(GEOMapItemAddressBookAttributes *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_name)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_spokenName)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v8;
    }
    if (self->_addressIdentifier)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_contactIdentifier)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOMapItemAddressBookAttributes *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 17) = self->_addressType;
    *((unsigned char *)v5 + 76) |= 1u;
  }
  if (self->_name)
  {
    objc_msgSend(v5, "setName:");
    int v4 = v5;
  }
  if (self->_spokenName)
  {
    objc_msgSend(v5, "setSpokenName:");
    int v4 = v5;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((unsigned char *)v4 + 72) = self->_isMe;
    *((unsigned char *)v4 + 76) |= 2u;
  }
  if (self->_addressIdentifier)
  {
    objc_msgSend(v5, "setAddressIdentifier:");
    int v4 = v5;
  }
  if (self->_contactIdentifier)
  {
    objc_msgSend(v5, "setContactIdentifier:");
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
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOMapItemAddressBookAttributesReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOMapItemAddressBookAttributes *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_addressType;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  uint64_t v11 = [(NSString *)self->_spokenName copyWithZone:a3];
  v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 72) = self->_isMe;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  uint64_t v13 = [(NSString *)self->_addressIdentifier copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  uint64_t v15 = [(NSString *)self->_contactIdentifier copyWithZone:a3];
  id v16 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v15;

  id v17 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v17;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  [(GEOMapItemAddressBookAttributes *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_addressType != *((_DWORD *)v4 + 17)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_23;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 5) && !-[NSString isEqual:](name, "isEqual:")) {
    goto LABEL_23;
  }
  spokenName = self->_spokenName;
  if ((unint64_t)spokenName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](spokenName, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) != 0)
    {
      if (self->_isMe)
      {
        if (!*((unsigned char *)v4 + 72)) {
          goto LABEL_23;
        }
        goto LABEL_19;
      }
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_19;
      }
    }
LABEL_23:
    char v9 = 0;
    goto LABEL_24;
  }
  if ((*((unsigned char *)v4 + 76) & 2) != 0) {
    goto LABEL_23;
  }
LABEL_19:
  addressIdentifier = self->_addressIdentifier;
  if ((unint64_t)addressIdentifier | *((void *)v4 + 3)
    && !-[NSString isEqual:](addressIdentifier, "isEqual:"))
  {
    goto LABEL_23;
  }
  contactIdentifier = self->_contactIdentifier;
  if ((unint64_t)contactIdentifier | *((void *)v4 + 4)) {
    char v9 = -[NSString isEqual:](contactIdentifier, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  [(GEOMapItemAddressBookAttributes *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_addressType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_name hash];
  NSUInteger v5 = [(NSString *)self->_spokenName hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_isMe;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v8 = [(NSString *)self->_addressIdentifier hash];
  return v7 ^ v8 ^ [(NSString *)self->_contactIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v5 = (int *)a3;
  [v5 readAll:0];
  NSUInteger v4 = v5;
  if (v5[19])
  {
    self->_addressType = v5[17];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v5 + 5))
  {
    -[GEOMapItemAddressBookAttributes setName:](self, "setName:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 6))
  {
    -[GEOMapItemAddressBookAttributes setSpokenName:](self, "setSpokenName:");
    NSUInteger v4 = v5;
  }
  if ((v4[19] & 2) != 0)
  {
    self->_isMe = *((unsigned char *)v4 + 72);
    *(unsigned char *)&self->_flags |= 2u;
  }
  if (*((void *)v4 + 3))
  {
    -[GEOMapItemAddressBookAttributes setAddressIdentifier:](self, "setAddressIdentifier:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[GEOMapItemAddressBookAttributes setContactIdentifier:](self, "setContactIdentifier:");
    NSUInteger v4 = v5;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      NSUInteger v5 = reader;
      objc_sync_enter(v5);
      GEOMapItemAddressBookAttributesReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_810);
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
  *(unsigned char *)&self->_flags |= 0x84u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOMapItemAddressBookAttributes *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_addressIdentifier, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end