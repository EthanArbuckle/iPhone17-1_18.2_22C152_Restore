@interface GEORPEditedAccessPoint
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCorrected;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasName;
- (BOOL)hasOriginal;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPCorrectedString)name;
- (GEORPEditedAccessPoint)init;
- (GEORPEditedAccessPoint)initWithData:(id)a3;
- (GEORPEditedAccessPoint)initWithDictionary:(id)a3;
- (GEORPEditedAccessPoint)initWithJSON:(id)a3;
- (GEORoadAccessPoint)corrected;
- (GEORoadAccessPoint)original;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readCorrected;
- (void)_readName;
- (void)_readOriginal;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCorrected:(id)a3;
- (void)setName:(id)a3;
- (void)setOriginal:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPEditedAccessPoint

- (GEORPEditedAccessPoint)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPEditedAccessPoint;
  v2 = [(GEORPEditedAccessPoint *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPEditedAccessPoint)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPEditedAccessPoint;
  v3 = [(GEORPEditedAccessPoint *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readOriginal
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPEditedAccessPointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginal_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasOriginal
{
  return self->_original != 0;
}

- (GEORoadAccessPoint)original
{
  -[GEORPEditedAccessPoint _readOriginal]((uint64_t)self);
  original = self->_original;

  return original;
}

- (void)setOriginal:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_original, a3);
}

- (void)_readCorrected
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPEditedAccessPointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCorrected_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasCorrected
{
  return self->_corrected != 0;
}

- (GEORoadAccessPoint)corrected
{
  -[GEORPEditedAccessPoint _readCorrected]((uint64_t)self);
  corrected = self->_corrected;

  return corrected;
}

- (void)setCorrected:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_corrected, a3);
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPEditedAccessPointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (GEORPCorrectedString)name
{
  -[GEORPEditedAccessPoint _readName]((uint64_t)self);
  name = self->_name;

  return name;
}

- (void)setName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPEditedAccessPoint;
  v4 = [(GEORPEditedAccessPoint *)&v8 description];
  v5 = [(GEORPEditedAccessPoint *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPEditedAccessPoint _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 original];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"original"];
    }
    objc_super v8 = [a1 corrected];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"corrected"];
    }
    v11 = [a1 name];
    v12 = v11;
    if (v11)
    {
      if (a2) {
        [v11 jsonRepresentation];
      }
      else {
      v13 = [v11 dictionaryRepresentation];
      }
      [v4 setObject:v13 forKey:@"name"];
    }
    v14 = (void *)a1[2];
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __52__GEORPEditedAccessPoint__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
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
  return -[GEORPEditedAccessPoint _dictionaryRepresentation:](self, 1);
}

void __52__GEORPEditedAccessPoint__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPEditedAccessPoint)initWithDictionary:(id)a3
{
  return (GEORPEditedAccessPoint *)-[GEORPEditedAccessPoint _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"original"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEORoadAccessPoint alloc];
        if (a3) {
          uint64_t v8 = [(GEORoadAccessPoint *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEORoadAccessPoint *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setOriginal:v8];
      }
      id v10 = [v5 objectForKeyedSubscript:@"corrected"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEORoadAccessPoint alloc];
        if (a3) {
          uint64_t v12 = [(GEORoadAccessPoint *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEORoadAccessPoint *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setCorrected:v12];
      }
      v14 = [v5 objectForKeyedSubscript:@"name"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = [GEORPCorrectedString alloc];
        if (a3) {
          uint64_t v16 = [(GEORPCorrectedString *)v15 initWithJSON:v14];
        }
        else {
          uint64_t v16 = [(GEORPCorrectedString *)v15 initWithDictionary:v14];
        }
        v17 = (void *)v16;
        [a1 setName:v16];
      }
    }
  }

  return a1;
}

- (GEORPEditedAccessPoint)initWithJSON:(id)a3
{
  return (GEORPEditedAccessPoint *)-[GEORPEditedAccessPoint _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_908;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_909;
    }
    GEORPEditedAccessPointReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEORoadAccessPoint *)self->_original readAll:1];
    [(GEORoadAccessPoint *)self->_corrected readAll:1];
    [(GEORPCorrectedString *)self->_name readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPEditedAccessPointIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPEditedAccessPointReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEORPEditedAccessPointIsDirty((uint64_t)self))
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
    [(GEORPEditedAccessPoint *)self readAll:0];
    if (self->_original) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_corrected)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_name)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPEditedAccessPoint _readCorrected]((uint64_t)self);
  if ([(GEORoadAccessPoint *)self->_corrected hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPEditedAccessPoint _readOriginal]((uint64_t)self);
  original = self->_original;

  return [(GEORoadAccessPoint *)original hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPEditedAccessPoint *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_original) {
    objc_msgSend(v5, "setOriginal:");
  }
  if (self->_corrected) {
    objc_msgSend(v5, "setCorrected:");
  }
  v4 = v5;
  if (self->_name)
  {
    objc_msgSend(v5, "setName:");
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
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPEditedAccessPoint *)self readAll:0];
    id v8 = [(GEORoadAccessPoint *)self->_original copyWithZone:a3];
    v9 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v8;

    id v10 = [(GEORoadAccessPoint *)self->_corrected copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    id v12 = [(GEORPCorrectedString *)self->_name copyWithZone:a3];
    v13 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPEditedAccessPointReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPEditedAccessPoint *)self readAll:1],
         [v4 readAll:1],
         original = self->_original,
         !((unint64_t)original | v4[5]))
     || -[GEORoadAccessPoint isEqual:](original, "isEqual:"))
    && ((corrected = self->_corrected, !((unint64_t)corrected | v4[3]))
     || -[GEORoadAccessPoint isEqual:](corrected, "isEqual:")))
  {
    name = self->_name;
    if ((unint64_t)name | v4[4]) {
      char v8 = -[GEORPCorrectedString isEqual:](name, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  [(GEORPEditedAccessPoint *)self readAll:1];
  unint64_t v3 = [(GEORoadAccessPoint *)self->_original hash];
  unint64_t v4 = [(GEORoadAccessPoint *)self->_corrected hash] ^ v3;
  return v4 ^ [(GEORPCorrectedString *)self->_name hash];
}

- (void)mergeFrom:(id)a3
{
  id v10 = a3;
  [v10 readAll:0];
  original = self->_original;
  uint64_t v5 = v10[5];
  if (original)
  {
    if (v5) {
      -[GEORoadAccessPoint mergeFrom:](original, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPEditedAccessPoint setOriginal:](self, "setOriginal:");
  }
  corrected = self->_corrected;
  uint64_t v7 = v10[3];
  if (corrected)
  {
    if (v7) {
      -[GEORoadAccessPoint mergeFrom:](corrected, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPEditedAccessPoint setCorrected:](self, "setCorrected:");
  }
  name = self->_name;
  uint64_t v9 = v10[4];
  if (name)
  {
    if (v9) {
      -[GEORPCorrectedString mergeFrom:](name, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEORPEditedAccessPoint setName:](self, "setName:");
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
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPEditedAccessPointReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_913);
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
  *(unsigned char *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPEditedAccessPoint *)self readAll:0];
    [(GEORoadAccessPoint *)self->_original clearUnknownFields:1];
    [(GEORoadAccessPoint *)self->_corrected clearUnknownFields:1];
    name = self->_name;
    [(GEORPCorrectedString *)name clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_original, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_corrected, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end