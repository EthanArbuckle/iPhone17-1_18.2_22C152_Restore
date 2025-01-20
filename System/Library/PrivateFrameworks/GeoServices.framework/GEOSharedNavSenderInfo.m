@interface GEOSharedNavSenderInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasFromDisplayName;
- (BOOL)hasFromIdentifier;
- (BOOL)hasLocalContactIdentifier;
- (BOOL)hasLocalName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOSharedNavSenderInfo)init;
- (GEOSharedNavSenderInfo)initWithData:(id)a3;
- (GEOSharedNavSenderInfo)initWithDictionary:(id)a3;
- (GEOSharedNavSenderInfo)initWithJSON:(id)a3;
- (NSString)fromDisplayName;
- (NSString)fromIdentifier;
- (NSString)localContactIdentifier;
- (NSString)localName;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readFromDisplayName;
- (void)_readFromIdentifier;
- (void)_readLocalContactIdentifier;
- (void)_readLocalName;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setFromDisplayName:(id)a3;
- (void)setFromIdentifier:(id)a3;
- (void)setLocalContactIdentifier:(id)a3;
- (void)setLocalName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSharedNavSenderInfo

- (GEOSharedNavSenderInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOSharedNavSenderInfo;
  v2 = [(GEOSharedNavSenderInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSharedNavSenderInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOSharedNavSenderInfo;
  v3 = [(GEOSharedNavSenderInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLocalName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavSenderInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLocalName
{
  return self->_localName != 0;
}

- (NSString)localName
{
  -[GEOSharedNavSenderInfo _readLocalName]((uint64_t)self);
  localName = self->_localName;

  return localName;
}

- (void)setLocalName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_localName, a3);
}

- (void)_readLocalContactIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavSenderInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalContactIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLocalContactIdentifier
{
  return self->_localContactIdentifier != 0;
}

- (NSString)localContactIdentifier
{
  -[GEOSharedNavSenderInfo _readLocalContactIdentifier]((uint64_t)self);
  localContactIdentifier = self->_localContactIdentifier;

  return localContactIdentifier;
}

- (void)setLocalContactIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_localContactIdentifier, a3);
}

- (void)_readFromIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavSenderInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFromIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasFromIdentifier
{
  return self->_fromIdentifier != 0;
}

- (NSString)fromIdentifier
{
  -[GEOSharedNavSenderInfo _readFromIdentifier]((uint64_t)self);
  fromIdentifier = self->_fromIdentifier;

  return fromIdentifier;
}

- (void)setFromIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_fromIdentifier, a3);
}

- (void)_readFromDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavSenderInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFromDisplayName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasFromDisplayName
{
  return self->_fromDisplayName != 0;
}

- (NSString)fromDisplayName
{
  -[GEOSharedNavSenderInfo _readFromDisplayName]((uint64_t)self);
  fromDisplayName = self->_fromDisplayName;

  return fromDisplayName;
}

- (void)setFromDisplayName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_fromDisplayName, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSharedNavSenderInfo;
  v4 = [(GEOSharedNavSenderInfo *)&v8 description];
  v5 = [(GEOSharedNavSenderInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSharedNavSenderInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 localName];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"localName";
      }
      else {
        objc_super v6 = @"local_name";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [a1 localContactIdentifier];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"localContactIdentifier";
      }
      else {
        objc_super v8 = @"local_contact_identifier";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [a1 fromIdentifier];
    if (v9)
    {
      if (a2) {
        v10 = @"fromIdentifier";
      }
      else {
        v10 = @"from_identifier";
      }
      [v4 setObject:v9 forKey:v10];
    }

    v11 = [a1 fromDisplayName];
    if (v11)
    {
      if (a2) {
        v12 = @"fromDisplayName";
      }
      else {
        v12 = @"from_display_name";
      }
      [v4 setObject:v11 forKey:v12];
    }

    v13 = (void *)a1[2];
    if (v13)
    {
      v14 = [v13 dictionaryRepresentation];
      v15 = v14;
      if (a2)
      {
        v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __52__GEOSharedNavSenderInfo__dictionaryRepresentation___block_invoke;
        v20[3] = &unk_1E53D8860;
        id v17 = v16;
        id v21 = v17;
        [v15 enumerateKeysAndObjectsUsingBlock:v20];
        id v18 = v17;

        v15 = v18;
      }
      [v4 setObject:v15 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSharedNavSenderInfo _dictionaryRepresentation:](self, 1);
}

void __52__GEOSharedNavSenderInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSharedNavSenderInfo)initWithDictionary:(id)a3
{
  return (GEOSharedNavSenderInfo *)-[GEOSharedNavSenderInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"localName";
      }
      else {
        objc_super v6 = @"local_name";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setLocalName:v8];
      }
      if (a3) {
        v9 = @"localContactIdentifier";
      }
      else {
        v9 = @"local_contact_identifier";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setLocalContactIdentifier:v11];
      }
      if (a3) {
        v12 = @"fromIdentifier";
      }
      else {
        v12 = @"from_identifier";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[v13 copy];
        [a1 setFromIdentifier:v14];
      }
      if (a3) {
        v15 = @"fromDisplayName";
      }
      else {
        v15 = @"from_display_name";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = (void *)[v16 copy];
        [a1 setFromDisplayName:v17];
      }
    }
  }

  return a1;
}

- (GEOSharedNavSenderInfo)initWithJSON:(id)a3
{
  return (GEOSharedNavSenderInfo *)-[GEOSharedNavSenderInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3446;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3447;
    }
    GEOSharedNavSenderInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSharedNavSenderInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSharedNavSenderInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3E) == 0))
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
    [(GEOSharedNavSenderInfo *)self readAll:0];
    if (self->_localName) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_localContactIdentifier)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_fromIdentifier)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_fromDisplayName)
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
  [(GEOSharedNavSenderInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_localName) {
    objc_msgSend(v5, "setLocalName:");
  }
  if (self->_localContactIdentifier) {
    objc_msgSend(v5, "setLocalContactIdentifier:");
  }
  v4 = v5;
  if (self->_fromIdentifier)
  {
    objc_msgSend(v5, "setFromIdentifier:");
    v4 = v5;
  }
  if (self->_fromDisplayName)
  {
    objc_msgSend(v5, "setFromDisplayName:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOSharedNavSenderInfo *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_localName copyWithZone:a3];
    v9 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v8;

    uint64_t v10 = [(NSString *)self->_localContactIdentifier copyWithZone:a3];
    v11 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v10;

    uint64_t v12 = [(NSString *)self->_fromIdentifier copyWithZone:a3];
    v13 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v12;

    uint64_t v14 = [(NSString *)self->_fromDisplayName copyWithZone:a3];
    v15 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOSharedNavSenderInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOSharedNavSenderInfo *)self readAll:1],
         [v4 readAll:1],
         localName = self->_localName,
         !((unint64_t)localName | v4[6]))
     || -[NSString isEqual:](localName, "isEqual:"))
    && ((localContactIdentifier = self->_localContactIdentifier, !((unint64_t)localContactIdentifier | v4[5]))
     || -[NSString isEqual:](localContactIdentifier, "isEqual:"))
    && ((fromIdentifier = self->_fromIdentifier, !((unint64_t)fromIdentifier | v4[4]))
     || -[NSString isEqual:](fromIdentifier, "isEqual:")))
  {
    fromDisplayName = self->_fromDisplayName;
    if ((unint64_t)fromDisplayName | v4[3]) {
      char v9 = -[NSString isEqual:](fromDisplayName, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  [(GEOSharedNavSenderInfo *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_localName hash];
  NSUInteger v4 = [(NSString *)self->_localContactIdentifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_fromIdentifier hash];
  return v4 ^ v5 ^ [(NSString *)self->_fromDisplayName hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  [v4 readAll:0];
  if (v4[6]) {
    -[GEOSharedNavSenderInfo setLocalName:](self, "setLocalName:");
  }
  if (v4[5]) {
    -[GEOSharedNavSenderInfo setLocalContactIdentifier:](self, "setLocalContactIdentifier:");
  }
  if (v4[4]) {
    -[GEOSharedNavSenderInfo setFromIdentifier:](self, "setFromIdentifier:");
  }
  if (v4[3]) {
    -[GEOSharedNavSenderInfo setFromDisplayName:](self, "setFromDisplayName:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      NSUInteger v5 = reader;
      objc_sync_enter(v5);
      GEOSharedNavSenderInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3451);
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
  *(unsigned char *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOSharedNavSenderInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localName, 0);
  objc_storeStrong((id *)&self->_localContactIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_fromDisplayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end