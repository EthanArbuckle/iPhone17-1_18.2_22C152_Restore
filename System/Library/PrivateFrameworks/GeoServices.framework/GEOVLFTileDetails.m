@interface GEOVLFTileDetails
+ (BOOL)isValid:(id)a3;
- (BOOL)hasTileId;
- (BOOL)hasTileSizeBytes;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVLFTileDetails)initWithDictionary:(id)a3;
- (GEOVLFTileDetails)initWithJSON:(id)a3;
- (GEOVLFUsageTileID)tileId;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)tileSizeBytes;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTileSizeBytes:(BOOL)a3;
- (void)setTileId:(id)a3;
- (void)setTileSizeBytes:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLFTileDetails

- (BOOL)hasTileId
{
  return self->_tileId != 0;
}

- (GEOVLFUsageTileID)tileId
{
  return self->_tileId;
}

- (void)setTileId:(id)a3
{
}

- (unsigned)tileSizeBytes
{
  return self->_tileSizeBytes;
}

- (void)setTileSizeBytes:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_tileSizeBytes = a3;
}

- (void)setHasTileSizeBytes:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTileSizeBytes
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVLFTileDetails;
  v4 = [(GEOVLFTileDetails *)&v8 description];
  v5 = [(GEOVLFTileDetails *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFTileDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 tileId];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        objc_super v8 = @"tileId";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"tile_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if (*(unsigned char *)(a1 + 20))
    {
      v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
      if (a2) {
        v10 = @"tileSizeBytes";
      }
      else {
        v10 = @"tile_size_bytes";
      }
      [v4 setObject:v9 forKey:v10];
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
  return -[GEOVLFTileDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFTileDetails)initWithDictionary:(id)a3
{
  return (GEOVLFTileDetails *)-[GEOVLFTileDetails _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"tileId";
      }
      else {
        v6 = @"tile_id";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOVLFUsageTileID alloc];
        if (a3) {
          uint64_t v9 = [(GEOVLFUsageTileID *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOVLFUsageTileID *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setTileId:v9];
      }
      if (a3) {
        v11 = @"tileSizeBytes";
      }
      else {
        v11 = @"tile_size_bytes";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTileSizeBytes:", objc_msgSend(v12, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOVLFTileDetails)initWithJSON:(id)a3
{
  return (GEOVLFTileDetails *)-[GEOVLFTileDetails _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFTileDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFTileDetailsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_tileId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOVLFTileDetails *)self readAll:0];
  if (self->_tileId) {
    objc_msgSend(v4, "setTileId:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 4) = self->_tileSizeBytes;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOVLFUsageTileID *)self->_tileId copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_tileSizeBytes;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEOVLFTileDetails *)self readAll:1];
  [v4 readAll:1];
  tileId = self->_tileId;
  if ((unint64_t)tileId | *((void *)v4 + 1))
  {
    if (!-[GEOVLFUsageTileID isEqual:](tileId, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_tileSizeBytes == *((_DWORD *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  [(GEOVLFTileDetails *)self readAll:1];
  unint64_t v3 = [(GEOVLFUsageTileID *)self->_tileId hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_tileSizeBytes;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v6 = (unsigned int *)a3;
  [v6 readAll:0];
  tileId = self->_tileId;
  uint64_t v5 = *((void *)v6 + 1);
  if (tileId)
  {
    if (v5) {
      -[GEOVLFUsageTileID mergeFrom:](tileId, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOVLFTileDetails setTileId:](self, "setTileId:");
  }
  if (v6[5])
  {
    self->_tileSizeBytes = v6[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
}

@end