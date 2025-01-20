@interface GEOPairedDeviceReplyMetadata
+ (BOOL)isValid:(id)a3;
- (BOOL)hasRequestReceivedTimestamp;
- (BOOL)hasResponseTime;
- (BOOL)hasSenderUUID;
- (BOOL)hasSentTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPairedDeviceReplyMetadata)initWithDictionary:(id)a3;
- (GEOPairedDeviceReplyMetadata)initWithJSON:(id)a3;
- (NSString)senderUUID;
- (PBUnknownFields)unknownFields;
- (double)requestReceivedTimestamp;
- (double)responseTime;
- (double)sentTimestamp;
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
- (void)setHasRequestReceivedTimestamp:(BOOL)a3;
- (void)setHasResponseTime:(BOOL)a3;
- (void)setHasSentTimestamp:(BOOL)a3;
- (void)setRequestReceivedTimestamp:(double)a3;
- (void)setResponseTime:(double)a3;
- (void)setSenderUUID:(id)a3;
- (void)setSentTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPairedDeviceReplyMetadata

- (BOOL)hasSenderUUID
{
  return self->_senderUUID != 0;
}

- (NSString)senderUUID
{
  return self->_senderUUID;
}

- (void)setSenderUUID:(id)a3
{
}

- (double)responseTime
{
  return self->_responseTime;
}

- (void)setResponseTime:(double)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_responseTime = a3;
}

- (void)setHasResponseTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasResponseTime
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)requestReceivedTimestamp
{
  return self->_requestReceivedTimestamp;
}

- (void)setRequestReceivedTimestamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_requestReceivedTimestamp = a3;
}

- (void)setHasRequestReceivedTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasRequestReceivedTimestamp
{
  return *(unsigned char *)&self->_flags & 1;
}

- (double)sentTimestamp
{
  return self->_sentTimestamp;
}

- (void)setSentTimestamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_sentTimestamp = a3;
}

- (void)setHasSentTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSentTimestamp
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPairedDeviceReplyMetadata;
  v4 = [(GEOPairedDeviceReplyMetadata *)&v8 description];
  v5 = [(GEOPairedDeviceReplyMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPairedDeviceReplyMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_12;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(id)a1 senderUUID];
  if (v5) {
    [v4 setObject:v5 forKey:@"senderUUID"];
  }

  char v6 = *(unsigned char *)(a1 + 48);
  if ((v6 & 2) != 0)
  {
    v15 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
    [v4 setObject:v15 forKey:@"responseTime"];

    char v6 = *(unsigned char *)(a1 + 48);
    if ((v6 & 1) == 0)
    {
LABEL_6:
      if ((v6 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)(a1 + 48) & 1) == 0)
  {
    goto LABEL_6;
  }
  v16 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
  [v4 setObject:v16 forKey:@"requestReceivedTimestamp"];

  if ((*(unsigned char *)(a1 + 48) & 4) != 0)
  {
LABEL_7:
    v7 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
    [v4 setObject:v7 forKey:@"sentTimestamp"];
  }
LABEL_8:
  objc_super v8 = *(void **)(a1 + 8);
  if (v8)
  {
    v9 = [v8 dictionaryRepresentation];
    v10 = v9;
    if (a2)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __58__GEOPairedDeviceReplyMetadata__dictionaryRepresentation___block_invoke;
      v17[3] = &unk_1E53D8860;
      id v12 = v11;
      id v18 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v17];
      id v13 = v12;

      v10 = v13;
    }
    [v4 setObject:v10 forKey:@"Unknown Fields"];
  }
LABEL_12:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPairedDeviceReplyMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __58__GEOPairedDeviceReplyMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPairedDeviceReplyMetadata)initWithDictionary:(id)a3
{
  return (GEOPairedDeviceReplyMetadata *)-[GEOPairedDeviceReplyMetadata _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"senderUUID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = (void *)[v4 copy];
        [a1 setSenderUUID:v5];
      }
      char v6 = [v3 objectForKeyedSubscript:@"responseTime"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 doubleValue];
        objc_msgSend(a1, "setResponseTime:");
      }

      v7 = [v3 objectForKeyedSubscript:@"requestReceivedTimestamp"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 doubleValue];
        objc_msgSend(a1, "setRequestReceivedTimestamp:");
      }

      objc_super v8 = [v3 objectForKeyedSubscript:@"sentTimestamp"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 doubleValue];
        objc_msgSend(a1, "setSentTimestamp:");
      }
    }
  }

  return a1;
}

- (GEOPairedDeviceReplyMetadata)initWithJSON:(id)a3
{
  return (GEOPairedDeviceReplyMetadata *)-[GEOPairedDeviceReplyMetadata _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPairedDeviceReplyMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPairedDeviceReplyMetadataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_senderUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_5:
      if ((flags & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_7:
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOPairedDeviceReplyMetadata *)self readAll:0];
  if (self->_senderUUID) {
    objc_msgSend(v5, "setSenderUUID:");
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((void *)v5 + 3) = *(void *)&self->_responseTime;
    *((unsigned char *)v5 + 48) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_5:
      if ((flags & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v5 + 2) = *(void *)&self->_requestReceivedTimestamp;
  *((unsigned char *)v5 + 48) |= 1u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_6:
    *((void *)v5 + 5) = *(void *)&self->_sentTimestamp;
    *((unsigned char *)v5 + 48) |= 4u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_senderUUID copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(double *)(v5 + 16) = self->_requestReceivedTimestamp;
    *(unsigned char *)(v5 + 48) |= 1u;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(double *)(v5 + 24) = self->_responseTime;
  *(unsigned char *)(v5 + 48) |= 2u;
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_7;
  }
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    *(double *)(v5 + 40) = self->_sentTimestamp;
    *(unsigned char *)(v5 + 48) |= 4u;
  }
LABEL_5:
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEOPairedDeviceReplyMetadata *)self readAll:1];
  [v4 readAll:1];
  senderUUID = self->_senderUUID;
  if ((unint64_t)senderUUID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](senderUUID, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_responseTime != *((double *)v4 + 3)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
LABEL_18:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_requestReceivedTimestamp != *((double *)v4 + 2)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_18;
  }
  BOOL v6 = (*((unsigned char *)v4 + 48) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_sentTimestamp != *((double *)v4 + 5)) {
      goto LABEL_18;
    }
    BOOL v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  [(GEOPairedDeviceReplyMetadata *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_senderUUID hash];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    double responseTime = self->_responseTime;
    double v7 = -responseTime;
    if (responseTime >= 0.0) {
      double v7 = self->_responseTime;
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
  if (flags)
  {
    double requestReceivedTimestamp = self->_requestReceivedTimestamp;
    double v12 = -requestReceivedTimestamp;
    if (requestReceivedTimestamp >= 0.0) {
      double v12 = self->_requestReceivedTimestamp;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((flags & 4) != 0)
  {
    double sentTimestamp = self->_sentTimestamp;
    double v17 = -sentTimestamp;
    if (sentTimestamp >= 0.0) {
      double v17 = self->_sentTimestamp;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v5 = (double *)a3;
  [v5 readAll:0];
  if (*((void *)v5 + 4)) {
    -[GEOPairedDeviceReplyMetadata setSenderUUID:](self, "setSenderUUID:");
  }
  char v4 = *((unsigned char *)v5 + 48);
  if ((v4 & 2) != 0)
  {
    self->_double responseTime = v5[3];
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 48);
    if ((v4 & 1) == 0)
    {
LABEL_5:
      if ((v4 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if (((_BYTE)v5[6] & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_double requestReceivedTimestamp = v5[2];
  *(unsigned char *)&self->_flags |= 1u;
  if (((_BYTE)v5[6] & 4) != 0)
  {
LABEL_6:
    self->_double sentTimestamp = v5[5];
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_7:
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
    [(GEOPairedDeviceReplyMetadata *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderUUID, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end