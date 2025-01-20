@interface GEOTransitEngineDebugData
+ (BOOL)isValid:(id)a3;
- (BOOL)hasScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitEngineDebugData)initWithDictionary:(id)a3;
- (GEOTransitEngineDebugData)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (double)score;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setScore:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitEngineDebugData

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitEngineDebugData;
  v4 = [(GEOTransitEngineDebugData *)&v8 description];
  v5 = [(GEOTransitEngineDebugData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitEngineDebugData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 24))
    {
      v5 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
      [v4 setObject:v5 forKey:@"score"];
    }
    v6 = *(void **)(a1 + 8);
    if (v6)
    {
      v7 = [v6 dictionaryRepresentation];
      objc_super v8 = v7;
      if (a2)
      {
        v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __55__GEOTransitEngineDebugData__dictionaryRepresentation___block_invoke;
        v13[3] = &unk_1E53D8860;
        id v10 = v9;
        id v14 = v10;
        [v8 enumerateKeysAndObjectsUsingBlock:v13];
        id v11 = v10;

        objc_super v8 = v11;
      }
      [v4 setObject:v8 forKey:@"Unknown Fields"];
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
  return -[GEOTransitEngineDebugData _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOTransitEngineDebugData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
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

- (GEOTransitEngineDebugData)initWithDictionary:(id)a3
{
  return (GEOTransitEngineDebugData *)-[GEOTransitEngineDebugData _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"score"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v4 doubleValue];
        objc_msgSend(a1, "setScore:");
      }
    }
  }

  return a1;
}

- (GEOTransitEngineDebugData)initWithJSON:(id)a3
{
  return (GEOTransitEngineDebugData *)-[GEOTransitEngineDebugData _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitEngineDebugDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitEngineDebugDataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOTransitEngineDebugData *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v4[2] = *(void *)&self->_score;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v4 + 16) = self->_score;
    *(unsigned char *)(v4 + 24) |= 1u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  [(GEOTransitEngineDebugData *)self readAll:1];
  [v4 readAll:1];
  BOOL v5 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_score == *((double *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  [(GEOTransitEngineDebugData *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return 0;
  }
  double score = self->_score;
  double v5 = -score;
  if (score >= 0.0) {
    double v5 = self->_score;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t result = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      result += (unint64_t)v7;
    }
  }
  else
  {
    result -= (unint64_t)fabs(v7);
  }
  return result;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (double *)a3;
  [v4 readAll:0];
  if ((_BYTE)v4[3])
  {
    self->_double score = v4[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitEngineDebugData *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end