@interface GEORPFeedbackLogEventParameters
+ (BOOL)isValid:(id)a3;
- (BOOL)hasClientEventUuid;
- (BOOL)hasCreatedAt;
- (BOOL)hasDetails;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackLogEventDetails)details;
- (GEORPFeedbackLogEventParameters)init;
- (GEORPFeedbackLogEventParameters)initWithData:(id)a3;
- (GEORPFeedbackLogEventParameters)initWithDictionary:(id)a3;
- (GEORPFeedbackLogEventParameters)initWithJSON:(id)a3;
- (GEORPTimestamp)createdAt;
- (NSString)clientEventUuid;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readClientEventUuid;
- (void)_readCreatedAt;
- (void)_readDetails;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setClientEventUuid:(id)a3;
- (void)setCreatedAt:(id)a3;
- (void)setDetails:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackLogEventParameters

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 clientEventUuid];
    if (v5)
    {
      if (a2) {
        v6 = @"clientEventUuid";
      }
      else {
        v6 = @"client_event_uuid";
      }
      [v4 setObject:v5 forKey:v6];
    }

    v7 = [(id)a1 createdAt];
    v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"createdAt";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"created_at";
      }
      [v4 setObject:v9 forKey:v10];
    }
    if (*(unsigned char *)(a1 + 64))
    {
      int v11 = *(_DWORD *)(a1 + 60);
      if (v11)
      {
        if (v11 == 1)
        {
          v12 = @"FEEDBACK_LOG_EVENT_TYPE_RAP_NOTIFICATION";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 60));
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v12 = @"FEEDBACK_LOG_EVENT_TYPE_UNKNOWN";
      }
      [v4 setObject:v12 forKey:@"type"];
    }
    v13 = [(id)a1 details];
    v14 = v13;
    if (v13)
    {
      if (a2) {
        [v13 jsonRepresentation];
      }
      else {
      v15 = [v13 dictionaryRepresentation];
      }
      [v4 setObject:v15 forKey:@"details"];
    }
    v16 = *(void **)(a1 + 16);
    if (v16)
    {
      v17 = [v16 dictionaryRepresentation];
      v18 = v17;
      if (a2)
      {
        v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __61__GEORPFeedbackLogEventParameters__dictionaryRepresentation___block_invoke;
        v23[3] = &unk_1E53D8860;
        id v20 = v19;
        id v24 = v20;
        [v18 enumerateKeysAndObjectsUsingBlock:v23];
        id v21 = v20;

        v18 = v21;
      }
      [v4 setObject:v18 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (GEORPFeedbackLogEventParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackLogEventParameters;
  v2 = [(GEORPFeedbackLogEventParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackLogEventParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackLogEventParameters;
  v3 = [(GEORPFeedbackLogEventParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readClientEventUuid
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackLogEventParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientEventUuid_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasClientEventUuid
{
  return self->_clientEventUuid != 0;
}

- (NSString)clientEventUuid
{
  -[GEORPFeedbackLogEventParameters _readClientEventUuid]((uint64_t)self);
  clientEventUuid = self->_clientEventUuid;

  return clientEventUuid;
}

- (void)setClientEventUuid:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_clientEventUuid, a3);
}

- (void)_readCreatedAt
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackLogEventParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCreatedAt_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasCreatedAt
{
  return self->_createdAt != 0;
}

- (GEORPTimestamp)createdAt
{
  -[GEORPFeedbackLogEventParameters _readCreatedAt]((uint64_t)self);
  createdAt = self->_createdAt;

  return createdAt;
}

- (void)setCreatedAt:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_createdAt, a3);
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"FEEDBACK_LOG_EVENT_TYPE_RAP_NOTIFICATION";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"FEEDBACK_LOG_EVENT_TYPE_UNKNOWN";
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FEEDBACK_LOG_EVENT_TYPE_UNKNOWN"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"FEEDBACK_LOG_EVENT_TYPE_RAP_NOTIFICATION"];
  }

  return v4;
}

- (void)_readDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackLogEventParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasDetails
{
  return self->_details != 0;
}

- (GEORPFeedbackLogEventDetails)details
{
  -[GEORPFeedbackLogEventParameters _readDetails]((uint64_t)self);
  details = self->_details;

  return details;
}

- (void)setDetails:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_details, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackLogEventParameters;
  int v4 = [(GEORPFeedbackLogEventParameters *)&v8 description];
  v5 = [(GEORPFeedbackLogEventParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackLogEventParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackLogEventParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __61__GEORPFeedbackLogEventParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackLogEventParameters)initWithDictionary:(id)a3
{
  return (GEORPFeedbackLogEventParameters *)-[GEORPFeedbackLogEventParameters _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_30;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_30;
  }
  if (a3) {
    objc_super v6 = @"clientEventUuid";
  }
  else {
    objc_super v6 = @"client_event_uuid";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    [a1 setClientEventUuid:v8];
  }
  if (a3) {
    v9 = @"createdAt";
  }
  else {
    v9 = @"created_at";
  }
  id v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v11 = [GEORPTimestamp alloc];
    if (a3) {
      uint64_t v12 = [(GEORPTimestamp *)v11 initWithJSON:v10];
    }
    else {
      uint64_t v12 = [(GEORPTimestamp *)v11 initWithDictionary:v10];
    }
    v13 = (void *)v12;
    [a1 setCreatedAt:v12];
  }
  v14 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
    if ([v15 isEqualToString:@"FEEDBACK_LOG_EVENT_TYPE_UNKNOWN"]) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = [v15 isEqualToString:@"FEEDBACK_LOG_EVENT_TYPE_RAP_NOTIFICATION"];
    }

    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [v14 intValue];
LABEL_23:
    [a1 setType:v16];
  }

  v17 = [v5 objectForKeyedSubscript:@"details"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = [GEORPFeedbackLogEventDetails alloc];
    if (a3) {
      uint64_t v19 = [(GEORPFeedbackLogEventDetails *)v18 initWithJSON:v17];
    }
    else {
      uint64_t v19 = [(GEORPFeedbackLogEventDetails *)v18 initWithDictionary:v17];
    }
    id v20 = (void *)v19;
    [a1 setDetails:v19];
  }
LABEL_30:

  return a1;
}

- (GEORPFeedbackLogEventParameters)initWithJSON:(id)a3
{
  return (GEORPFeedbackLogEventParameters *)-[GEORPFeedbackLogEventParameters _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1725;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1726;
    }
    GEORPFeedbackLogEventParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEORPTimestamp *)self->_createdAt readAll:1];
    [(GEORPFeedbackLogEventDetails *)self->_details readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackLogEventParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackLogEventParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3C) == 0))
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
    [(GEORPFeedbackLogEventParameters *)self readAll:0];
    if (self->_clientEventUuid) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_createdAt)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    if (self->_details)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPFeedbackLogEventParameters *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_clientEventUuid) {
    objc_msgSend(v5, "setClientEventUuid:");
  }
  if (self->_createdAt) {
    objc_msgSend(v5, "setCreatedAt:");
  }
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 15) = self->_type;
    *((unsigned char *)v5 + 64) |= 1u;
  }
  if (self->_details)
  {
    objc_msgSend(v5, "setDetails:");
    int v4 = v5;
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
      GEORPFeedbackLogEventParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPFeedbackLogEventParameters *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_clientEventUuid copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEORPTimestamp *)self->_createdAt copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_type;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  id v13 = [(GEORPFeedbackLogEventDetails *)self->_details copyWithZone:a3];
  v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  id v15 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEORPFeedbackLogEventParameters *)self readAll:1];
  [v4 readAll:1];
  clientEventUuid = self->_clientEventUuid;
  if ((unint64_t)clientEventUuid | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](clientEventUuid, "isEqual:")) {
      goto LABEL_13;
    }
  }
  createdAt = self->_createdAt;
  if ((unint64_t)createdAt | *((void *)v4 + 4))
  {
    if (!-[GEORPTimestamp isEqual:](createdAt, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_type != *((_DWORD *)v4 + 15)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  details = self->_details;
  if ((unint64_t)details | *((void *)v4 + 5)) {
    char v8 = -[GEORPFeedbackLogEventDetails isEqual:](details, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  [(GEORPFeedbackLogEventParameters *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_clientEventUuid hash];
  unint64_t v4 = [(GEORPTimestamp *)self->_createdAt hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_type;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(GEORPFeedbackLogEventDetails *)self->_details hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v9 = a3;
  [v9 readAll:0];
  unint64_t v4 = v9;
  if (v9[3])
  {
    -[GEORPFeedbackLogEventParameters setClientEventUuid:](self, "setClientEventUuid:");
    unint64_t v4 = v9;
  }
  createdAt = self->_createdAt;
  uint64_t v6 = v4[4];
  if (createdAt)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEORPTimestamp mergeFrom:](createdAt, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEORPFeedbackLogEventParameters setCreatedAt:](self, "setCreatedAt:");
  }
  unint64_t v4 = v9;
LABEL_9:
  if (v4[8])
  {
    self->_type = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_flags |= 1u;
  }
  details = self->_details;
  uint64_t v8 = v4[5];
  if (details)
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[GEORPFeedbackLogEventDetails mergeFrom:](details, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[GEORPFeedbackLogEventParameters setDetails:](self, "setDetails:");
  }
  unint64_t v4 = v9;
LABEL_17:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPFeedbackLogEventParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1730);
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
  *(unsigned char *)&self->_flags |= 0x22u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPFeedbackLogEventParameters *)self readAll:0];
    details = self->_details;
    [(GEORPFeedbackLogEventDetails *)details clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_clientEventUuid, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end