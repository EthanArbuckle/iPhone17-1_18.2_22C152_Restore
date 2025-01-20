@interface GEORouteAnnotation
+ (BOOL)isValid:(id)a3;
- (BOOL)hasArtwork;
- (BOOL)hasDeprecatedOffsetMeters;
- (BOOL)hasInfoCard;
- (BOOL)hasOffsetMeters;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMiniCard)infoCard;
- (GEOPBTransitArtwork)artwork;
- (GEORouteAnnotation)init;
- (GEORouteAnnotation)initWithData:(id)a3;
- (GEORouteAnnotation)initWithDictionary:(id)a3;
- (GEORouteAnnotation)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (float)offsetMeters;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)deprecatedOffsetMeters;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readArtwork;
- (void)_readInfoCard;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArtwork:(id)a3;
- (void)setDeprecatedOffsetMeters:(unsigned int)a3;
- (void)setHasDeprecatedOffsetMeters:(BOOL)a3;
- (void)setHasOffsetMeters:(BOOL)a3;
- (void)setInfoCard:(id)a3;
- (void)setOffsetMeters:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORouteAnnotation

- (GEORouteAnnotation)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORouteAnnotation;
  v2 = [(GEORouteAnnotation *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORouteAnnotation)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORouteAnnotation;
  v3 = [(GEORouteAnnotation *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)deprecatedOffsetMeters
{
  return self->_deprecatedOffsetMeters;
}

- (void)setDeprecatedOffsetMeters:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_deprecatedOffsetMeters = a3;
}

- (void)setHasDeprecatedOffsetMeters:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasDeprecatedOffsetMeters
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readArtwork
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteAnnotationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtwork_tags_5793);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasArtwork
{
  return self->_artwork != 0;
}

- (GEOPBTransitArtwork)artwork
{
  -[GEORouteAnnotation _readArtwork]((uint64_t)self);
  artwork = self->_artwork;

  return artwork;
}

- (void)setArtwork:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (void)_readInfoCard
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteAnnotationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInfoCard_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasInfoCard
{
  return self->_infoCard != 0;
}

- (GEOMiniCard)infoCard
{
  -[GEORouteAnnotation _readInfoCard]((uint64_t)self);
  infoCard = self->_infoCard;

  return infoCard;
}

- (void)setInfoCard:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_infoCard, a3);
}

- (float)offsetMeters
{
  return self->_offsetMeters;
}

- (void)setOffsetMeters:(float)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_offsetMeters = a3;
}

- (void)setHasOffsetMeters:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasOffsetMeters
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORouteAnnotation;
  v4 = [(GEORouteAnnotation *)&v8 description];
  v5 = [(GEORouteAnnotation *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORouteAnnotation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 60))
    {
      v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
      if (a2) {
        objc_super v6 = @"deprecatedOffsetMeters";
      }
      else {
        objc_super v6 = @"deprecated_offset_meters";
      }
      [v4 setObject:v5 forKey:v6];
    }
    objc_super v7 = [(id)a1 artwork];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"artwork"];
    }
    v10 = [(id)a1 infoCard];
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"infoCard";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"info_card";
      }
      [v4 setObject:v12 forKey:v13];
    }
    if ((*(unsigned char *)(a1 + 60) & 2) != 0)
    {
      LODWORD(v14) = *(_DWORD *)(a1 + 56);
      v15 = [NSNumber numberWithFloat:v14];
      if (a2) {
        v16 = @"offsetMeters";
      }
      else {
        v16 = @"offset_meters";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = *(void **)(a1 + 16);
    if (v17)
    {
      v18 = [v17 dictionaryRepresentation];
      v19 = v18;
      if (a2)
      {
        v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __48__GEORouteAnnotation__dictionaryRepresentation___block_invoke;
        v24[3] = &unk_1E53D8860;
        id v21 = v20;
        id v25 = v21;
        [v19 enumerateKeysAndObjectsUsingBlock:v24];
        id v22 = v21;

        v19 = v22;
      }
      [v4 setObject:v19 forKey:@"Unknown Fields"];
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
  return -[GEORouteAnnotation _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEORouteAnnotation__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORouteAnnotation)initWithDictionary:(id)a3
{
  return (GEORouteAnnotation *)-[GEORouteAnnotation _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"deprecatedOffsetMeters";
      }
      else {
        objc_super v6 = @"deprecated_offset_meters";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDeprecatedOffsetMeters:", objc_msgSend(v7, "unsignedIntValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"artwork"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = [GEOPBTransitArtwork alloc];
        if (a3) {
          uint64_t v10 = [(GEOPBTransitArtwork *)v9 initWithJSON:v8];
        }
        else {
          uint64_t v10 = [(GEOPBTransitArtwork *)v9 initWithDictionary:v8];
        }
        v11 = (void *)v10;
        [a1 setArtwork:v10];
      }
      if (a3) {
        v12 = @"infoCard";
      }
      else {
        v12 = @"info_card";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v14 = [GEOMiniCard alloc];
        if (a3) {
          uint64_t v15 = [(GEOMiniCard *)v14 initWithJSON:v13];
        }
        else {
          uint64_t v15 = [(GEOMiniCard *)v14 initWithDictionary:v13];
        }
        v16 = (void *)v15;
        [a1 setInfoCard:v15];
      }
      if (a3) {
        v17 = @"offsetMeters";
      }
      else {
        v17 = @"offset_meters";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v18 floatValue];
        objc_msgSend(a1, "setOffsetMeters:");
      }
    }
  }

  return a1;
}

- (GEORouteAnnotation)initWithJSON:(id)a3
{
  return (GEORouteAnnotation *)-[GEORouteAnnotation _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_5813;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_5814;
    }
    GEORouteAnnotationReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOPBTransitArtwork *)self->_artwork readAll:1];
    [(GEOMiniCard *)self->_infoCard readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORouteAnnotationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteAnnotationReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORouteAnnotationIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEORouteAnnotation *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    id v5 = v8;
    if (self->_artwork)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_infoCard)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteFloatField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEORouteAnnotation *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 13) = self->_deprecatedOffsetMeters;
    *((unsigned char *)v4 + 60) |= 1u;
  }
  if (self->_artwork) {
    objc_msgSend(v4, "setArtwork:");
  }
  if (self->_infoCard) {
    objc_msgSend(v4, "setInfoCard:");
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = LODWORD(self->_offsetMeters);
    *((unsigned char *)v4 + 60) |= 2u;
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
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORouteAnnotationReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORouteAnnotation *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_deprecatedOffsetMeters;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  id v9 = [(GEOPBTransitArtwork *)self->_artwork copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEOMiniCard *)self->_infoCard copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(float *)(v5 + 56) = self->_offsetMeters;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  [(GEORouteAnnotation *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_deprecatedOffsetMeters != *((_DWORD *)v4 + 13)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  artwork = self->_artwork;
  if ((unint64_t)artwork | *((void *)v4 + 3) && !-[GEOPBTransitArtwork isEqual:](artwork, "isEqual:")) {
    goto LABEL_15;
  }
  infoCard = self->_infoCard;
  if ((unint64_t)infoCard | *((void *)v4 + 4))
  {
    if (!-[GEOMiniCard isEqual:](infoCard, "isEqual:")) {
      goto LABEL_15;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 60) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_offsetMeters != *((float *)v4 + 14)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  [(GEORouteAnnotation *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_deprecatedOffsetMeters;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPBTransitArtwork *)self->_artwork hash];
  unint64_t v5 = [(GEOMiniCard *)self->_infoCard hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    float offsetMeters = self->_offsetMeters;
    double v8 = offsetMeters;
    if (offsetMeters < 0.0) {
      double v8 = -offsetMeters;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  long double v9 = (unsigned int *)a3;
  [v9 readAll:0];
  unint64_t v4 = v9;
  if (v9[15])
  {
    self->_deprecatedOffsetMeters = v9[13];
    *(unsigned char *)&self->_flags |= 1u;
  }
  artwork = self->_artwork;
  uint64_t v6 = *((void *)v9 + 3);
  if (artwork)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPBTransitArtwork mergeFrom:](artwork, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEORouteAnnotation setArtwork:](self, "setArtwork:");
  }
  unint64_t v4 = v9;
LABEL_9:
  infoCard = self->_infoCard;
  uint64_t v8 = *((void *)v4 + 4);
  if (infoCard)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOMiniCard mergeFrom:](infoCard, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEORouteAnnotation setInfoCard:](self, "setInfoCard:");
  }
  unint64_t v4 = v9;
LABEL_15:
  if ((v4[15] & 2) != 0)
  {
    LODWORD(self->_offsetMeters) = v4[14];
    *(unsigned char *)&self->_flags |= 2u;
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
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORouteAnnotationReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_5818);
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
  *(unsigned char *)&self->_flags |= 0x24u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORouteAnnotation *)self readAll:0];
    [(GEOPBTransitArtwork *)self->_artwork clearUnknownFields:1];
    infoCard = self->_infoCard;
    [(GEOMiniCard *)infoCard clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoCard, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end