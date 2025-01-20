@interface GEOPairedDeviceMessageMetadata
+ (BOOL)isValid:(id)a3;
- (BOOL)hasPriority;
- (BOOL)hasSenderUUID;
- (BOOL)hasSentTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPairedDeviceMessageMetadata)initWithDictionary:(id)a3;
- (GEOPairedDeviceMessageMetadata)initWithJSON:(id)a3;
- (NSString)senderUUID;
- (PBUnknownFields)unknownFields;
- (double)sentTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)priorityAsString:(int)a3;
- (int)StringAsPriority:(id)a3;
- (int)priority;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setHasSentTimestamp:(BOOL)a3;
- (void)setPriority:(int)a3;
- (void)setSenderUUID:(id)a3;
- (void)setSentTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPairedDeviceMessageMetadata

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

- (int)priority
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_priority;
  }
  else {
    return 100;
  }
}

- (void)setPriority:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasPriority
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)priorityAsString:(int)a3
{
  switch(a3)
  {
    case 100:
      v4 = @"SYNC";
      break;
    case 300:
      v4 = @"URGENT";
      break;
    case 200:
      v4 = @"DEFAULT";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v4;
}

- (int)StringAsPriority:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SYNC"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"DEFAULT"])
  {
    int v4 = 200;
  }
  else if ([v3 isEqualToString:@"URGENT"])
  {
    int v4 = 300;
  }
  else
  {
    int v4 = 100;
  }

  return v4;
}

- (double)sentTimestamp
{
  return self->_sentTimestamp;
}

- (void)setSentTimestamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_sentTimestamp = a3;
}

- (void)setHasSentTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasSentTimestamp
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPairedDeviceMessageMetadata;
  int v4 = [(GEOPairedDeviceMessageMetadata *)&v8 description];
  v5 = [(GEOPairedDeviceMessageMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPairedDeviceMessageMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 senderUUID];
    if (v5) {
      [v4 setObject:v5 forKey:@"senderUUID"];
    }

    char v6 = *(unsigned char *)(a1 + 36);
    if ((v6 & 2) != 0)
    {
      int v7 = *(_DWORD *)(a1 + 32);
      switch(v7)
      {
        case 100:
          objc_super v8 = @"SYNC";
          break;
        case 300:
          objc_super v8 = @"URGENT";
          break;
        case 200:
          objc_super v8 = @"DEFAULT";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 32));
          objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      [v4 setObject:v8 forKey:@"priority"];

      char v6 = *(unsigned char *)(a1 + 36);
    }
    if (v6)
    {
      v9 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
      [v4 setObject:v9 forKey:@"sentTimestamp"];
    }
    v10 = *(void **)(a1 + 8);
    if (v10)
    {
      v11 = [v10 dictionaryRepresentation];
      v12 = v11;
      if (a2)
      {
        v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __60__GEOPairedDeviceMessageMetadata__dictionaryRepresentation___block_invoke;
        v17[3] = &unk_1E53D8860;
        id v14 = v13;
        id v18 = v14;
        [v12 enumerateKeysAndObjectsUsingBlock:v17];
        id v15 = v14;

        v12 = v15;
      }
      [v4 setObject:v12 forKey:@"Unknown Fields"];
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
  return -[GEOPairedDeviceMessageMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __60__GEOPairedDeviceMessageMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int v7 = *(void **)(a1 + 32);
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

- (GEOPairedDeviceMessageMetadata)initWithDictionary:(id)a3
{
  return (GEOPairedDeviceMessageMetadata *)-[GEOPairedDeviceMessageMetadata _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_20;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_20;
  }
  int v4 = [v3 objectForKeyedSubscript:@"senderUUID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (void *)[v4 copy];
    [a1 setSenderUUID:v5];
  }
  char v6 = [v3 objectForKeyedSubscript:@"priority"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"SYNC"])
    {
      uint64_t v8 = 100;
    }
    else if ([v7 isEqualToString:@"DEFAULT"])
    {
      uint64_t v8 = 200;
    }
    else if ([v7 isEqualToString:@"URGENT"])
    {
      uint64_t v8 = 300;
    }
    else
    {
      uint64_t v8 = 100;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_16:
    [a1 setPriority:v8];
  }

  v9 = [v3 objectForKeyedSubscript:@"sentTimestamp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 doubleValue];
    objc_msgSend(a1, "setSentTimestamp:");
  }

LABEL_20:
  return a1;
}

- (GEOPairedDeviceMessageMetadata)initWithJSON:(id)a3
{
  return (GEOPairedDeviceMessageMetadata *)-[GEOPairedDeviceMessageMetadata _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPairedDeviceMessageMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPairedDeviceMessageMetadataReadAllFrom((uint64_t)self, a3);
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
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOPairedDeviceMessageMetadata *)self readAll:0];
  if (self->_senderUUID) {
    objc_msgSend(v5, "setSenderUUID:");
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_priority;
    *((unsigned char *)v5 + 36) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((void *)v5 + 3) = *(void *)&self->_sentTimestamp;
    *((unsigned char *)v5 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_senderUUID copyWithZone:a3];
  id v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_priority;
    *(unsigned char *)(v5 + 36) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(double *)(v5 + 24) = self->_sentTimestamp;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOPairedDeviceMessageMetadata *)self readAll:1];
  [v4 readAll:1];
  senderUUID = self->_senderUUID;
  if ((unint64_t)senderUUID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](senderUUID, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_priority != *((_DWORD *)v4 + 8)) {
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_sentTimestamp != *((double *)v4 + 3)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  [(GEOPairedDeviceMessageMetadata *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_senderUUID hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_priority;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v9;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double sentTimestamp = self->_sentTimestamp;
  double v6 = -sentTimestamp;
  if (sentTimestamp >= 0.0) {
    double v6 = self->_sentTimestamp;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v4 ^ v3 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  if (*((void *)v5 + 2)) {
    -[GEOPairedDeviceMessageMetadata setSenderUUID:](self, "setSenderUUID:");
  }
  char v4 = *((unsigned char *)v5 + 36);
  if ((v4 & 2) != 0)
  {
    self->_priority = *((_DWORD *)v5 + 8);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 36);
  }
  if (v4)
  {
    self->_double sentTimestamp = *((double *)v5 + 3);
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
    [(GEOPairedDeviceMessageMetadata *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderUUID, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end