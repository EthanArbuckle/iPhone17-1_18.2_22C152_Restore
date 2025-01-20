@interface GEOClientMetrics
+ (BOOL)isValid:(id)a3;
- (BOOL)hasNetworkMetrics;
- (BOOL)hasQueuedTime;
- (BOOL)hasResponseSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOClientMetrics)initWithDictionary:(id)a3;
- (GEOClientMetrics)initWithJSON:(id)a3;
- (GEOClientNetworkMetrics)networkMetrics;
- (PBUnknownFields)unknownFields;
- (double)queuedTime;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)responseSourceAsString:(int)a3;
- (int)StringAsResponseSource:(id)a3;
- (int)responseSource;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasQueuedTime:(BOOL)a3;
- (void)setHasResponseSource:(BOOL)a3;
- (void)setNetworkMetrics:(id)a3;
- (void)setQueuedTime:(double)a3;
- (void)setResponseSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOClientMetrics

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_networkMetrics) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteDoubleField();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (GEOClientNetworkMetrics)networkMetrics
{
  return self->_networkMetrics;
}

- (void)setNetworkMetrics:(id)a3
{
}

- (void)setResponseSource:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_responseSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMetrics, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (int)responseSource
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_responseSource;
  }
  else {
    return 0;
  }
}

- (void)setHasResponseSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasResponseSource
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)responseSourceAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E7860[a3];
  }

  return v3;
}

- (int)StringAsResponseSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FAILED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"URL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MAPDATASERVICE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasNetworkMetrics
{
  return self->_networkMetrics != 0;
}

- (double)queuedTime
{
  return self->_queuedTime;
}

- (void)setQueuedTime:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_queuedTime = a3;
}

- (void)setHasQueuedTime:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasQueuedTime
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOClientMetrics;
  int v4 = [(GEOClientMetrics *)&v8 description];
  v5 = [(GEOClientMetrics *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOClientMetrics _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 36) & 2) != 0)
    {
      uint64_t v5 = *(int *)(a1 + 32);
      if (v5 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 32));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53E7860[v5];
      }
      [v4 setObject:v6 forKey:@"responseSource"];
    }
    v7 = [(id)a1 networkMetrics];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"networkMetrics"];
    }
    if (*(unsigned char *)(a1 + 36))
    {
      v10 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
      if (a2) {
        v11 = @"queuedTime";
      }
      else {
        v11 = @"queued_time";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = *(void **)(a1 + 8);
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __46__GEOClientMetrics__dictionaryRepresentation___block_invoke;
        v19[3] = &unk_1E53D8860;
        id v16 = v15;
        id v20 = v16;
        [v14 enumerateKeysAndObjectsUsingBlock:v19];
        id v17 = v16;

        v14 = v17;
      }
      [v4 setObject:v14 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOClientMetrics _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOClientMetrics__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOClientMetrics)initWithDictionary:(id)a3
{
  return (GEOClientMetrics *)-[GEOClientMetrics _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_28;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_28;
  }
  v6 = [v5 objectForKeyedSubscript:@"responseSource"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"FAILED"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"URL"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"MAPDATASERVICE"])
    {
      uint64_t v8 = 3;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_16:
    [a1 setResponseSource:v8];
  }

  v9 = [v5 objectForKeyedSubscript:@"networkMetrics"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [GEOClientNetworkMetrics alloc];
    if (a3) {
      uint64_t v11 = [(GEOClientNetworkMetrics *)v10 initWithJSON:v9];
    }
    else {
      uint64_t v11 = [(GEOClientNetworkMetrics *)v10 initWithDictionary:v9];
    }
    v12 = (void *)v11;
    [a1 setNetworkMetrics:v11];
  }
  if (a3) {
    v13 = @"queuedTime";
  }
  else {
    v13 = @"queued_time";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v14 doubleValue];
    objc_msgSend(a1, "setQueuedTime:");
  }

LABEL_28:
  return a1;
}

- (GEOClientMetrics)initWithJSON:(id)a3
{
  return (GEOClientMetrics *)-[GEOClientMetrics _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOClientMetricsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOClientMetricsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOClientMetrics *)self readAll:0];
  int v4 = v5;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v5[8] = self->_responseSource;
    *((unsigned char *)v5 + 36) |= 2u;
  }
  if (self->_networkMetrics)
  {
    objc_msgSend(v5, "setNetworkMetrics:");
    int v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    v4[3] = *(void *)&self->_queuedTime;
    *((unsigned char *)v4 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_responseSource;
    *(unsigned char *)(v5 + 36) |= 2u;
  }
  id v7 = [(GEOClientNetworkMetrics *)self->_networkMetrics copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v6 + 24) = self->_queuedTime;
    *(unsigned char *)(v6 + 36) |= 1u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOClientMetrics *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 36);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_responseSource != *((_DWORD *)v4 + 8)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_14;
  }
  networkMetrics = self->_networkMetrics;
  if ((unint64_t)networkMetrics | *((void *)v4 + 2))
  {
    if (!-[GEOClientNetworkMetrics isEqual:](networkMetrics, "isEqual:"))
    {
LABEL_14:
      BOOL v8 = 0;
      goto LABEL_15;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 36);
  }
  BOOL v8 = (v6 & 1) == 0;
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_queuedTime != *((double *)v4 + 3)) {
      goto LABEL_14;
    }
    BOOL v8 = 1;
  }
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  [(GEOClientMetrics *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_responseSource;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOClientNetworkMetrics *)self->_networkMetrics hash];
  if (*(unsigned char *)&self->_flags)
  {
    double queuedTime = self->_queuedTime;
    double v7 = -queuedTime;
    if (queuedTime >= 0.0) {
      double v7 = self->_queuedTime;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  double v7 = (int *)a3;
  [v7 readAll:0];
  unint64_t v4 = (double *)v7;
  if ((v7[9] & 2) != 0)
  {
    self->_responseSource = v7[8];
    *(unsigned char *)&self->_flags |= 2u;
  }
  networkMetrics = self->_networkMetrics;
  uint64_t v6 = *((void *)v7 + 2);
  if (networkMetrics)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOClientNetworkMetrics mergeFrom:](networkMetrics, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOClientMetrics setNetworkMetrics:](self, "setNetworkMetrics:");
  }
  unint64_t v4 = (double *)v7;
LABEL_9:
  if (*((unsigned char *)v4 + 36))
  {
    self->_double queuedTime = v4[3];
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
    [(GEOClientMetrics *)self readAll:0];
    networkMetrics = self->_networkMetrics;
    [(GEOClientNetworkMetrics *)networkMetrics clearUnknownFields:1];
  }
}

@end