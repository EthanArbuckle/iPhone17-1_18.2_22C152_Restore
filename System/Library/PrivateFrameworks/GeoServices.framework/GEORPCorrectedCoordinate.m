@interface GEORPCorrectedCoordinate
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCorrectedCoordinate;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasOriginalCoordinate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)correctedCoordinate;
- (GEOLatLng)originalCoordinate;
- (GEORPCorrectedCoordinate)init;
- (GEORPCorrectedCoordinate)initWithData:(id)a3;
- (GEORPCorrectedCoordinate)initWithDictionary:(id)a3;
- (GEORPCorrectedCoordinate)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCorrectedCoordinate;
- (void)_readOriginalCoordinate;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCorrectedCoordinate:(id)a3;
- (void)setOriginalCoordinate:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPCorrectedCoordinate

- (GEORPCorrectedCoordinate)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPCorrectedCoordinate;
  v2 = [(GEORPCorrectedCoordinate *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPCorrectedCoordinate)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPCorrectedCoordinate;
  v3 = [(GEORPCorrectedCoordinate *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readOriginalCoordinate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedCoordinateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalCoordinate_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasOriginalCoordinate
{
  return self->_originalCoordinate != 0;
}

- (GEOLatLng)originalCoordinate
{
  -[GEORPCorrectedCoordinate _readOriginalCoordinate]((uint64_t)self);
  originalCoordinate = self->_originalCoordinate;

  return originalCoordinate;
}

- (void)setOriginalCoordinate:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_originalCoordinate, a3);
}

- (void)_readCorrectedCoordinate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedCoordinateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCorrectedCoordinate_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasCorrectedCoordinate
{
  return self->_correctedCoordinate != 0;
}

- (GEOLatLng)correctedCoordinate
{
  -[GEORPCorrectedCoordinate _readCorrectedCoordinate]((uint64_t)self);
  correctedCoordinate = self->_correctedCoordinate;

  return correctedCoordinate;
}

- (void)setCorrectedCoordinate:(id)a3
{
  *(unsigned char *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_correctedCoordinate, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPCorrectedCoordinate;
  v4 = [(GEORPCorrectedCoordinate *)&v8 description];
  v5 = [(GEORPCorrectedCoordinate *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPCorrectedCoordinate _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 originalCoordinate];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"originalCoordinate";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"original_coordinate";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 correctedCoordinate];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"correctedCoordinate";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"corrected_coordinate";
      }
      [v4 setObject:v11 forKey:v12];
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
  return -[GEORPCorrectedCoordinate _dictionaryRepresentation:](self, 1);
}

- (GEORPCorrectedCoordinate)initWithDictionary:(id)a3
{
  return (GEORPCorrectedCoordinate *)-[GEORPCorrectedCoordinate _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"originalCoordinate";
      }
      else {
        objc_super v6 = @"original_coordinate";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v9 = [(GEOLatLng *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOLatLng *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setOriginalCoordinate:v9];
      }
      if (a3) {
        v11 = @"correctedCoordinate";
      }
      else {
        v11 = @"corrected_coordinate";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v14 = [(GEOLatLng *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOLatLng *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setCorrectedCoordinate:v14];
      }
    }
  }

  return a1;
}

- (GEORPCorrectedCoordinate)initWithJSON:(id)a3
{
  return (GEORPCorrectedCoordinate *)-[GEORPCorrectedCoordinate _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_275_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_276_0;
    }
    GEORPCorrectedCoordinateReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOLatLng *)self->_originalCoordinate readAll:1];
    [(GEOLatLng *)self->_correctedCoordinate readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPCorrectedCoordinateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPCorrectedCoordinateReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 7) == 0))
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPCorrectedCoordinate *)self readAll:0];
    if (self->_originalCoordinate) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_correctedCoordinate) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPCorrectedCoordinate _readCorrectedCoordinate]((uint64_t)self);
  if ([(GEOLatLng *)self->_correctedCoordinate hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPCorrectedCoordinate _readOriginalCoordinate]((uint64_t)self);
  originalCoordinate = self->_originalCoordinate;

  return [(GEOLatLng *)originalCoordinate hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEORPCorrectedCoordinate *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_originalCoordinate) {
    objc_msgSend(v4, "setOriginalCoordinate:");
  }
  if (self->_correctedCoordinate) {
    objc_msgSend(v4, "setCorrectedCoordinate:");
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
    [(GEORPCorrectedCoordinate *)self readAll:0];
    id v8 = [(GEOLatLng *)self->_originalCoordinate copyWithZone:a3];
    uint64_t v9 = (void *)v5[3];
    v5[3] = v8;

    id v10 = [(GEOLatLng *)self->_correctedCoordinate copyWithZone:a3];
    id v7 = (PBDataReader *)v5[2];
    v5[2] = v10;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPCorrectedCoordinateReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPCorrectedCoordinate *)self readAll:1],
         [v4 readAll:1],
         originalCoordinate = self->_originalCoordinate,
         !((unint64_t)originalCoordinate | v4[3]))
     || -[GEOLatLng isEqual:](originalCoordinate, "isEqual:")))
  {
    correctedCoordinate = self->_correctedCoordinate;
    if ((unint64_t)correctedCoordinate | v4[2]) {
      char v7 = -[GEOLatLng isEqual:](correctedCoordinate, "isEqual:");
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
  [(GEORPCorrectedCoordinate *)self readAll:1];
  unint64_t v3 = [(GEOLatLng *)self->_originalCoordinate hash];
  return [(GEOLatLng *)self->_correctedCoordinate hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  originalCoordinate = self->_originalCoordinate;
  uint64_t v5 = v8[3];
  if (originalCoordinate)
  {
    if (v5) {
      -[GEOLatLng mergeFrom:](originalCoordinate, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPCorrectedCoordinate setOriginalCoordinate:](self, "setOriginalCoordinate:");
  }
  correctedCoordinate = self->_correctedCoordinate;
  uint64_t v7 = v8[2];
  if (correctedCoordinate)
  {
    if (v7) {
      -[GEOLatLng mergeFrom:](correctedCoordinate, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPCorrectedCoordinate setCorrectedCoordinate:](self, "setCorrectedCoordinate:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalCoordinate, 0);
  objc_storeStrong((id *)&self->_correctedCoordinate, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end