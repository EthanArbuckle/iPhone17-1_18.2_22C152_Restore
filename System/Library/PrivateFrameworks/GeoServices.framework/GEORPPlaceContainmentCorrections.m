@interface GEORPPlaceContainmentCorrections
+ (BOOL)isValid:(id)a3;
- (BOOL)hasChildContainment;
- (BOOL)hasParentContainment;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPContainmentCorrection)childContainment;
- (GEORPContainmentCorrection)parentContainment;
- (GEORPPlaceContainmentCorrections)init;
- (GEORPPlaceContainmentCorrections)initWithData:(id)a3;
- (GEORPPlaceContainmentCorrections)initWithDictionary:(id)a3;
- (GEORPPlaceContainmentCorrections)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readChildContainment;
- (void)_readParentContainment;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setChildContainment:(id)a3;
- (void)setParentContainment:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPPlaceContainmentCorrections

- (GEORPPlaceContainmentCorrections)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPPlaceContainmentCorrections;
  v2 = [(GEORPPlaceContainmentCorrections *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPlaceContainmentCorrections)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPPlaceContainmentCorrections;
  v3 = [(GEORPPlaceContainmentCorrections *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readParentContainment
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPlaceContainmentCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readParentContainment_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasParentContainment
{
  return self->_parentContainment != 0;
}

- (GEORPContainmentCorrection)parentContainment
{
  -[GEORPPlaceContainmentCorrections _readParentContainment]((uint64_t)self);
  parentContainment = self->_parentContainment;

  return parentContainment;
}

- (void)setParentContainment:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_parentContainment, a3);
}

- (void)_readChildContainment
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPlaceContainmentCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChildContainment_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasChildContainment
{
  return self->_childContainment != 0;
}

- (GEORPContainmentCorrection)childContainment
{
  -[GEORPPlaceContainmentCorrections _readChildContainment]((uint64_t)self);
  childContainment = self->_childContainment;

  return childContainment;
}

- (void)setChildContainment:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_childContainment, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPPlaceContainmentCorrections;
  v4 = [(GEORPPlaceContainmentCorrections *)&v8 description];
  v5 = [(GEORPPlaceContainmentCorrections *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPlaceContainmentCorrections _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 parentContainment];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"parentContainment"];
    }
    objc_super v8 = [a1 childContainment];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"childContainment"];
    }
    v11 = (void *)a1[2];
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __62__GEORPPlaceContainmentCorrections__dictionaryRepresentation___block_invoke;
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
  return -[GEORPPlaceContainmentCorrections _dictionaryRepresentation:](self, 1);
}

void __62__GEORPPlaceContainmentCorrections__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPPlaceContainmentCorrections)initWithDictionary:(id)a3
{
  return (GEORPPlaceContainmentCorrections *)-[GEORPPlaceContainmentCorrections _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"parentContainment"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEORPContainmentCorrection alloc];
        if (a3) {
          uint64_t v8 = [(GEORPContainmentCorrection *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEORPContainmentCorrection *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setParentContainment:v8];
      }
      id v10 = [v5 objectForKeyedSubscript:@"childContainment"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEORPContainmentCorrection alloc];
        if (a3) {
          uint64_t v12 = [(GEORPContainmentCorrection *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEORPContainmentCorrection *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setChildContainment:v12];
      }
    }
  }

  return a1;
}

- (GEORPPlaceContainmentCorrections)initWithJSON:(id)a3
{
  return (GEORPPlaceContainmentCorrections *)-[GEORPPlaceContainmentCorrections _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_2846;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_2847;
    }
    GEORPPlaceContainmentCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEORPContainmentCorrection *)self->_parentContainment readAll:1];
    [(GEORPContainmentCorrection *)self->_childContainment readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPlaceContainmentCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPlaceContainmentCorrectionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEORPPlaceContainmentCorrectionsIsDirty((uint64_t)self))
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
    [(GEORPPlaceContainmentCorrections *)self readAll:0];
    if (self->_parentContainment) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_childContainment)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEORPPlaceContainmentCorrections *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_parentContainment) {
    objc_msgSend(v4, "setParentContainment:");
  }
  if (self->_childContainment) {
    objc_msgSend(v4, "setChildContainment:");
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
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPPlaceContainmentCorrections *)self readAll:0];
    id v8 = [(GEORPContainmentCorrection *)self->_parentContainment copyWithZone:a3];
    v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    id v10 = [(GEORPContainmentCorrection *)self->_childContainment copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPPlaceContainmentCorrectionsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPPlaceContainmentCorrections *)self readAll:1],
         [v4 readAll:1],
         parentContainment = self->_parentContainment,
         !((unint64_t)parentContainment | v4[4]))
     || -[GEORPContainmentCorrection isEqual:](parentContainment, "isEqual:")))
  {
    childContainment = self->_childContainment;
    if ((unint64_t)childContainment | v4[3]) {
      char v7 = -[GEORPContainmentCorrection isEqual:](childContainment, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  [(GEORPPlaceContainmentCorrections *)self readAll:1];
  unint64_t v3 = [(GEORPContainmentCorrection *)self->_parentContainment hash];
  return [(GEORPContainmentCorrection *)self->_childContainment hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  parentContainment = self->_parentContainment;
  uint64_t v5 = v8[4];
  if (parentContainment)
  {
    if (v5) {
      -[GEORPContainmentCorrection mergeFrom:](parentContainment, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPPlaceContainmentCorrections setParentContainment:](self, "setParentContainment:");
  }
  childContainment = self->_childContainment;
  uint64_t v7 = v8[3];
  if (childContainment)
  {
    if (v7) {
      -[GEORPContainmentCorrection mergeFrom:](childContainment, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPPlaceContainmentCorrections setChildContainment:](self, "setChildContainment:");
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
      GEORPPlaceContainmentCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2851);
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
  *(unsigned char *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPPlaceContainmentCorrections *)self readAll:0];
    [(GEORPContainmentCorrection *)self->_parentContainment clearUnknownFields:1];
    childContainment = self->_childContainment;
    [(GEORPContainmentCorrection *)childContainment clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentContainment, 0);
  objc_storeStrong((id *)&self->_childContainment, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end