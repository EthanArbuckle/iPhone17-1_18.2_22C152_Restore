@interface GEOLPRPowerTypeMap
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRPowerTypeMap)init;
- (GEOLPRPowerTypeMap)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRPowerTypeMap

- (GEOLPRPowerTypeMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRPowerTypeMap;
  v2 = [(GEOLPRPowerTypeMap *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRPowerTypeMap)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRPowerTypeMap;
  v3 = [(GEOLPRPowerTypeMap *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRPowerTypeMap;
  v4 = [(GEOLPRPowerTypeMap *)&v8 description];
  v5 = [(GEOLPRPowerTypeMap *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRPowerTypeMap _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOLPRPowerTypeMap readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 1) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOLPRPowerTypeMapReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readKey_tags_263);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    id v7 = *(id *)(a1 + 16);
    if (v7) {
      [v4 setObject:v7 forKey:@"key"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 2) == 0)
    {
      objc_super v8 = *(void **)(a1 + 8);
      if (v8)
      {
        id v9 = v8;
        objc_sync_enter(v9);
        GEOLPRPowerTypeMapReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPowerType_tags);
        objc_sync_exit(v9);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    id v10 = *(id *)(a1 + 24);
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"powerType";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"power_type";
      }
      [v4 setObject:v12 forKey:v13];
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
  return -[GEOLPRPowerTypeMap _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_270;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_271;
      }
      GEOLPRPowerTypeMapReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 24) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRPowerTypeMapReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLPRPowerTypeMapIsDirty((uint64_t)self) & 1) == 0)
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLPRPowerTypeMap readAll:]((uint64_t)self, 0);
    if (self->_key) {
      PBDataWriterWriteStringField();
    }
    if (self->_powerType) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLPRPowerTypeMap readAll:]((uint64_t)self, 0);
    uint64_t v8 = [(NSString *)self->_key copyWithZone:a3];
    id v9 = (void *)v5[2];
    v5[2] = v8;

    id v10 = [(GEOLPRPowerType *)self->_powerType copyWithZone:a3];
    id v7 = (PBDataReader *)v5[3];
    v5[3] = v10;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLPRPowerTypeMapReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOLPRPowerTypeMap readAll:]((uint64_t)self, 1),
         -[GEOLPRPowerTypeMap readAll:]((uint64_t)v4, 1),
         key = self->_key,
         !((unint64_t)key | v4[2]))
     || -[NSString isEqual:](key, "isEqual:")))
  {
    powerType = self->_powerType;
    if ((unint64_t)powerType | v4[3]) {
      char v7 = -[GEOLPRPowerType isEqual:](powerType, "isEqual:");
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
  -[GEOLPRPowerTypeMap readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_key hash];
  return [(GEOLPRPowerType *)self->_powerType hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerType, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end