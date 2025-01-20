@interface GEOPBTransitShield
+ (BOOL)isValid:(id)a3;
- (BOOL)hasShieldColor;
- (BOOL)hasShieldEnumValue;
- (BOOL)hasShieldText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPBTransitShield)init;
- (GEOPBTransitShield)initWithData:(id)a3;
- (GEOPBTransitShield)initWithDictionary:(id)a3;
- (GEOPBTransitShield)initWithJSON:(id)a3;
- (NSString)description;
- (NSString)shieldColor;
- (NSString)shieldText;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int64_t)shieldType;
- (unint64_t)hash;
- (unsigned)shieldEnumValue;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readShieldColor;
- (void)_readShieldText;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasShieldEnumValue:(BOOL)a3;
- (void)setShieldColor:(id)a3;
- (void)setShieldEnumValue:(unsigned int)a3;
- (void)setShieldText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBTransitShield

- (GEOPBTransitShield)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitShield;
  v2 = [(GEOPBTransitShield *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitShield)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitShield;
  v3 = [(GEOPBTransitShield *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readShieldText
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
        GEOPBTransitShieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readShieldText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasShieldText
{
  return self->_shieldText != 0;
}

- (NSString)shieldText
{
  -[GEOPBTransitShield _readShieldText]((uint64_t)self);
  shieldText = self->_shieldText;

  return shieldText;
}

- (void)setShieldText:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_shieldText, a3);
}

- (unsigned)shieldEnumValue
{
  return self->_shieldEnumValue;
}

- (void)setShieldEnumValue:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_shieldEnumValue = a3;
}

- (void)setHasShieldEnumValue:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasShieldEnumValue
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readShieldColor
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
        GEOPBTransitShieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readShieldColor_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasShieldColor
{
  return self->_shieldColor != 0;
}

- (NSString)shieldColor
{
  -[GEOPBTransitShield _readShieldColor]((uint64_t)self);
  shieldColor = self->_shieldColor;

  return shieldColor;
}

- (void)setShieldColor:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_shieldColor, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitShield;
  v4 = [(GEOPBTransitShield *)&v8 description];
  v5 = [(GEOPBTransitShield *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitShield _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 shieldText];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"shieldText";
      }
      else {
        objc_super v6 = @"shield_text";
      }
      [v4 setObject:v5 forKey:v6];
    }

    if (*(unsigned char *)(a1 + 56))
    {
      objc_super v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
      if (a2) {
        objc_super v8 = @"shieldEnumValue";
      }
      else {
        objc_super v8 = @"shield_enum_value";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [(id)a1 shieldColor];
    if (v9)
    {
      if (a2) {
        v10 = @"shieldColor";
      }
      else {
        v10 = @"shield_color";
      }
      [v4 setObject:v9 forKey:v10];
    }

    v11 = *(void **)(a1 + 16);
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __48__GEOPBTransitShield__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
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
  return -[GEOPBTransitShield _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOPBTransitShield__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPBTransitShield)initWithDictionary:(id)a3
{
  return (GEOPBTransitShield *)-[GEOPBTransitShield _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"shieldText";
      }
      else {
        objc_super v6 = @"shield_text";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setShieldText:v8];
      }
      if (a3) {
        v9 = @"shieldEnumValue";
      }
      else {
        v9 = @"shield_enum_value";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setShieldEnumValue:", objc_msgSend(v10, "unsignedIntValue"));
      }

      if (a3) {
        v11 = @"shieldColor";
      }
      else {
        v11 = @"shield_color";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = (void *)[v12 copy];
        [a1 setShieldColor:v13];
      }
    }
  }

  return a1;
}

- (GEOPBTransitShield)initWithJSON:(id)a3
{
  return (GEOPBTransitShield *)-[GEOPBTransitShield _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_4403;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_4404;
    }
    GEOPBTransitShieldReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitShieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitShieldReadAllFrom((uint64_t)self, a3, 0);
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
    [(GEOPBTransitShield *)self readAll:0];
    if (self->_shieldText) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteUint32Field();
      id v5 = v8;
    }
    if (self->_shieldColor)
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
  [(GEOPBTransitShield *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_shieldText) {
    objc_msgSend(v5, "setShieldText:");
  }
  v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 13) = self->_shieldEnumValue;
    *((unsigned char *)v5 + 56) |= 1u;
  }
  if (self->_shieldColor)
  {
    objc_msgSend(v5, "setShieldColor:");
    v4 = v5;
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
      GEOPBTransitShieldReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPBTransitShield *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_shieldText copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_shieldEnumValue;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v11 = [(NSString *)self->_shieldColor copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  v13 = self->_unknownFields;
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
  [(GEOPBTransitShield *)self readAll:1];
  [v4 readAll:1];
  shieldText = self->_shieldText;
  if ((unint64_t)shieldText | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](shieldText, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_shieldEnumValue != *((_DWORD *)v4 + 13)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  shieldColor = self->_shieldColor;
  if ((unint64_t)shieldColor | *((void *)v4 + 3)) {
    char v7 = -[NSString isEqual:](shieldColor, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  [(GEOPBTransitShield *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_shieldText hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_shieldEnumValue;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_shieldColor hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = a3;
  [v5 readAll:0];
  uint64_t v4 = v5;
  if (v5[4])
  {
    -[GEOPBTransitShield setShieldText:](self, "setShieldText:");
    uint64_t v4 = v5;
  }
  if (v4[7])
  {
    self->_shieldEnumValue = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (v4[3])
  {
    -[GEOPBTransitShield setShieldColor:](self, "setShieldColor:");
    uint64_t v4 = v5;
  }
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
      GEOPBTransitShieldReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_4408);
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
    [(GEOPBTransitShield *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shieldText, 0);
  objc_storeStrong((id *)&self->_shieldColor, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (int64_t)shieldType
{
  return [(GEOPBTransitShield *)self shieldEnumValue];
}

@end