@interface GEOLogMsgStateMuninResource
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAssetBucket;
- (BOOL)hasLevelOfDetail;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateMuninResource)initWithDictionary:(id)a3;
- (GEOLogMsgStateMuninResource)initWithJSON:(id)a3;
- (NSString)assetBucket;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)levelOfDetail;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetBucket:(id)a3;
- (void)setHasLevelOfDetail:(BOOL)a3;
- (void)setLevelOfDetail:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateMuninResource

- (BOOL)hasAssetBucket
{
  return self->_assetBucket != 0;
}

- (NSString)assetBucket
{
  return self->_assetBucket;
}

- (void)setAssetBucket:(id)a3
{
}

- (unsigned)levelOfDetail
{
  return self->_levelOfDetail;
}

- (void)setLevelOfDetail:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_levelOfDetail = a3;
}

- (void)setHasLevelOfDetail:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLevelOfDetail
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateMuninResource;
  v4 = [(GEOLogMsgStateMuninResource *)&v8 description];
  v5 = [(GEOLogMsgStateMuninResource *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateMuninResource _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 assetBucket];
    if (v5)
    {
      if (a2) {
        v6 = @"assetBucket";
      }
      else {
        v6 = @"asset_bucket";
      }
      [v4 setObject:v5 forKey:v6];
    }

    if (*(unsigned char *)(a1 + 20))
    {
      v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
      if (a2) {
        objc_super v8 = @"levelOfDetail";
      }
      else {
        objc_super v8 = @"level_of_detail";
      }
      [v4 setObject:v7 forKey:v8];
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
  return -[GEOLogMsgStateMuninResource _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateMuninResource)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateMuninResource *)-[GEOLogMsgStateMuninResource _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"assetBucket";
      }
      else {
        v6 = @"asset_bucket";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setAssetBucket:v8];
      }
      if (a3) {
        v9 = @"levelOfDetail";
      }
      else {
        v9 = @"level_of_detail";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLevelOfDetail:", objc_msgSend(v10, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateMuninResource)initWithJSON:(id)a3
{
  return (GEOLogMsgStateMuninResource *)-[GEOLogMsgStateMuninResource _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateMuninResourceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateMuninResourceReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_assetBucket)
  {
    PBDataWriterWriteStringField();
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
  [(GEOLogMsgStateMuninResource *)self readAll:0];
  if (self->_assetBucket) {
    objc_msgSend(v4, "setAssetBucket:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 4) = self->_levelOfDetail;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_assetBucket copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_levelOfDetail;
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
  [(GEOLogMsgStateMuninResource *)self readAll:1];
  [v4 readAll:1];
  assetBucket = self->_assetBucket;
  if ((unint64_t)assetBucket | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](assetBucket, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_levelOfDetail == *((_DWORD *)v4 + 4))
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
  [(GEOLogMsgStateMuninResource *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_assetBucket hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_levelOfDetail;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  [v4 readAll:0];
  if (*((void *)v4 + 1)) {
    -[GEOLogMsgStateMuninResource setAssetBucket:](self, "setAssetBucket:");
  }
  if (v4[5])
  {
    self->_levelOfDetail = v4[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
}

@end