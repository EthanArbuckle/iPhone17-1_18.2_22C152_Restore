@interface GEODirectionsRequestFeedback
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAppIdentifier;
- (BOOL)hasPurpose;
- (BOOL)hasRequestingAppId;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEODirectionsRequestFeedback)init;
- (GEODirectionsRequestFeedback)initWithData:(id)a3;
- (GEODirectionsRequestFeedback)initWithDictionary:(id)a3;
- (GEODirectionsRequestFeedback)initWithJSON:(id)a3;
- (GEODirectionsRequestFeedback)initWithPurpose:(int)a3;
- (GEODirectionsRequestFeedback)initWithPurpose:(int)a3 andSource:(int)a4;
- (GEODirectionsRequestFeedback)initWithPurpose:(int)a3 andSource:(int)a4 andIdentifier:(id)a5;
- (NSString)appIdentifier;
- (NSString)requestingAppId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)purposeAsString:(int)a3;
- (id)sourceAsString:(int)a3;
- (int)StringAsPurpose:(id)a3;
- (int)StringAsSource:(id)a3;
- (int)purpose;
- (int)source;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAppIdentifier;
- (void)_readRequestingAppId;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setHasPurpose:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setPurpose:(int)a3;
- (void)setRequestingAppId:(id)a3;
- (void)setSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEODirectionsRequestFeedback

- (GEODirectionsRequestFeedback)initWithPurpose:(int)a3
{
  return [(GEODirectionsRequestFeedback *)self initWithPurpose:*(void *)&a3 andSource:0 andIdentifier:0];
}

- (GEODirectionsRequestFeedback)initWithPurpose:(int)a3 andSource:(int)a4
{
  return [(GEODirectionsRequestFeedback *)self initWithPurpose:*(void *)&a3 andSource:*(void *)&a4 andIdentifier:0];
}

- (GEODirectionsRequestFeedback)initWithPurpose:(int)a3 andSource:(int)a4 andIdentifier:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v9 = [(GEODirectionsRequestFeedback *)self init];
  v10 = v9;
  if (v9)
  {
    [(GEODirectionsRequestFeedback *)v9 setPurpose:v6];
    [(GEODirectionsRequestFeedback *)v10 setSource:v5];
    [(GEODirectionsRequestFeedback *)v10 setAppIdentifier:v8];
    v11 = GEOApplicationIdentifierOrProcessName();
    [(GEODirectionsRequestFeedback *)v10 setRequestingAppId:v11];
  }
  return v10;
}

- (GEODirectionsRequestFeedback)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEODirectionsRequestFeedback;
  v2 = [(GEODirectionsRequestFeedback *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEODirectionsRequestFeedback)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEODirectionsRequestFeedback;
  v3 = [(GEODirectionsRequestFeedback *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (int)purpose
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_purpose;
  }
  else {
    return 0;
  }
}

- (void)setPurpose:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_purpose = a3;
}

- (void)setHasPurpose:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasPurpose
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)purposeAsString:(int)a3
{
  if (a3 >= 0xF)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E0010[a3];
  }

  return v3;
}

- (int)StringAsPurpose:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PURPOSE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TEST_OR_DEBUG"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ETA"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"QUICK_ETA"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ROUTE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"REROUTE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ROUTE_GENIUS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SEARCH_ALONG_ROUTE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"DODGEBALL_OUTSIDE_OF_MAPS"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"TIME_TO_LEAVE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"LAUNCH_AND_GO"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"TRANSITION_FROM_DRIVING"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"TRANSITION_FROM_PREPARE_TO_PARK"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"TRANSITION_FROM_DRIVING_BEFORE_ARRIVAL"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"TRANSITION_FROM_DRIVING_AFTER_ARRIVAL"])
  {
    int v4 = 14;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)source
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_source;
  }
  else {
    return 0;
  }
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSource
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)sourceAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E0088[a3];
  }

  return v3;
}

- (int)StringAsSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_SOURCE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MAPS_UI"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STARK_UI"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"URL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MAP_KIT_API"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"DEVICE_SYNC"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readAppIdentifier
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
        GEODirectionsRequestFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppIdentifier_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAppIdentifier
{
  return self->_appIdentifier != 0;
}

- (NSString)appIdentifier
{
  -[GEODirectionsRequestFeedback _readAppIdentifier]((uint64_t)self);
  appIdentifier = self->_appIdentifier;

  return appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_appIdentifier, a3);
}

- (void)_readRequestingAppId
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
        GEODirectionsRequestFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestingAppId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasRequestingAppId
{
  return self->_requestingAppId != 0;
}

- (NSString)requestingAppId
{
  -[GEODirectionsRequestFeedback _readRequestingAppId]((uint64_t)self);
  requestingAppId = self->_requestingAppId;

  return requestingAppId;
}

- (void)setRequestingAppId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_requestingAppId, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEODirectionsRequestFeedback;
  int v4 = [(GEODirectionsRequestFeedback *)&v8 description];
  uint64_t v5 = [(GEODirectionsRequestFeedback *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODirectionsRequestFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 60);
    if (v5)
    {
      uint64_t v6 = *(int *)(a1 + 52);
      if (v6 >= 0xF)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v7 = off_1E53E0010[v6];
      }
      [v4 setObject:v7 forKey:@"purpose"];

      char v5 = *(unsigned char *)(a1 + 60);
    }
    if ((v5 & 2) != 0)
    {
      uint64_t v8 = *(int *)(a1 + 56);
      if (v8 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 56));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_1E53E0088[v8];
      }
      [v4 setObject:v9 forKey:@"source"];
    }
    v10 = [(id)a1 appIdentifier];
    if (v10) {
      [v4 setObject:v10 forKey:@"appIdentifier"];
    }

    v11 = [(id)a1 requestingAppId];
    if (v11)
    {
      if (a2) {
        v12 = @"requestingAppId";
      }
      else {
        v12 = @"requesting_app_id";
      }
      [v4 setObject:v11 forKey:v12];
    }

    v13 = *(void **)(a1 + 16);
    if (v13)
    {
      v14 = [v13 dictionaryRepresentation];
      v15 = v14;
      if (a2)
      {
        v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __58__GEODirectionsRequestFeedback__dictionaryRepresentation___block_invoke;
        v20[3] = &unk_1E53D8860;
        id v17 = v16;
        id v21 = v17;
        [v15 enumerateKeysAndObjectsUsingBlock:v20];
        id v18 = v17;

        v15 = v18;
      }
      [v4 setObject:v15 forKey:@"Unknown Fields"];
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
  return -[GEODirectionsRequestFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __58__GEODirectionsRequestFeedback__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEODirectionsRequestFeedback)initWithDictionary:(id)a3
{
  return (GEODirectionsRequestFeedback *)-[GEODirectionsRequestFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_65;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_65;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"purpose"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"UNKNOWN_PURPOSE"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"TEST_OR_DEBUG"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"ETA"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"QUICK_ETA"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"ROUTE"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"REROUTE"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"ROUTE_GENIUS"])
    {
      uint64_t v8 = 6;
    }
    else if ([v7 isEqualToString:@"SEARCH_ALONG_ROUTE"])
    {
      uint64_t v8 = 7;
    }
    else if ([v7 isEqualToString:@"DODGEBALL_OUTSIDE_OF_MAPS"])
    {
      uint64_t v8 = 8;
    }
    else if ([v7 isEqualToString:@"TIME_TO_LEAVE"])
    {
      uint64_t v8 = 9;
    }
    else if ([v7 isEqualToString:@"LAUNCH_AND_GO"])
    {
      uint64_t v8 = 10;
    }
    else if ([v7 isEqualToString:@"TRANSITION_FROM_DRIVING"])
    {
      uint64_t v8 = 11;
    }
    else if ([v7 isEqualToString:@"TRANSITION_FROM_PREPARE_TO_PARK"])
    {
      uint64_t v8 = 12;
    }
    else if ([v7 isEqualToString:@"TRANSITION_FROM_DRIVING_BEFORE_ARRIVAL"])
    {
      uint64_t v8 = 13;
    }
    else if ([v7 isEqualToString:@"TRANSITION_FROM_DRIVING_AFTER_ARRIVAL"])
    {
      uint64_t v8 = 14;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_39;
    }
    uint64_t v8 = [v6 intValue];
  }
  [a1 setPurpose:v8];
LABEL_39:

  v9 = [v5 objectForKeyedSubscript:@"source"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    if ([v10 isEqualToString:@"UNKNOWN_SOURCE"])
    {
      uint64_t v11 = 0;
    }
    else if ([v10 isEqualToString:@"MAPS_UI"])
    {
      uint64_t v11 = 1;
    }
    else if ([v10 isEqualToString:@"STARK_UI"])
    {
      uint64_t v11 = 2;
    }
    else if ([v10 isEqualToString:@"URL"])
    {
      uint64_t v11 = 3;
    }
    else if ([v10 isEqualToString:@"MAP_KIT_API"])
    {
      uint64_t v11 = 4;
    }
    else if ([v10 isEqualToString:@"DEVICE_SYNC"])
    {
      uint64_t v11 = 5;
    }
    else
    {
      uint64_t v11 = 0;
    }

    goto LABEL_56;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v9 intValue];
LABEL_56:
    [a1 setSource:v11];
  }

  v12 = [v5 objectForKeyedSubscript:@"appIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = (void *)[v12 copy];
    [a1 setAppIdentifier:v13];
  }
  if (a3) {
    v14 = @"requestingAppId";
  }
  else {
    v14 = @"requesting_app_id";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = (void *)[v15 copy];
    [a1 setRequestingAppId:v16];
  }
LABEL_65:

  return a1;
}

- (GEODirectionsRequestFeedback)initWithJSON:(id)a3
{
  return (GEODirectionsRequestFeedback *)-[GEODirectionsRequestFeedback _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_1429;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_1430;
    }
    GEODirectionsRequestFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEODirectionsRequestFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEODirectionsRequestFeedbackReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
  {
    id v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEODirectionsRequestFeedback *)self readAll:0];
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    id v6 = v9;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v6 = v9;
    }
    if (self->_appIdentifier)
    {
      PBDataWriterWriteStringField();
      id v6 = v9;
    }
    if (self->_requestingAppId)
    {
      PBDataWriterWriteStringField();
      id v6 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v6];
  }
}

- (void)copyTo:(id)a3
{
  id v6 = (id *)a3;
  [(GEODirectionsRequestFeedback *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 10) = self->_readerMarkPos;
  *((_DWORD *)v6 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v6;
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v6 + 13) = self->_purpose;
    *((unsigned char *)v6 + 60) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 14) = self->_source;
    *((unsigned char *)v6 + 60) |= 2u;
  }
  if (self->_appIdentifier)
  {
    objc_msgSend(v6, "setAppIdentifier:");
    int v4 = v6;
  }
  if (self->_requestingAppId)
  {
    objc_msgSend(v6, "setRequestingAppId:");
    int v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEODirectionsRequestFeedbackReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEODirectionsRequestFeedback *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 52) = self->_purpose;
    *(unsigned char *)(v5 + 60) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_source;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  uint64_t v10 = [(NSString *)self->_appIdentifier copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSString *)self->_requestingAppId copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  v14 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v14;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEODirectionsRequestFeedback *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_purpose != *((_DWORD *)v4 + 13)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_source != *((_DWORD *)v4 + 14)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_16;
  }
  appIdentifier = self->_appIdentifier;
  if ((unint64_t)appIdentifier | *((void *)v4 + 3)
    && !-[NSString isEqual:](appIdentifier, "isEqual:"))
  {
    goto LABEL_16;
  }
  requestingAppId = self->_requestingAppId;
  if ((unint64_t)requestingAppId | *((void *)v4 + 4)) {
    char v7 = -[NSString isEqual:](requestingAppId, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  [(GEODirectionsRequestFeedback *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_purpose;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_source;
LABEL_6:
  NSUInteger v5 = v4 ^ v3 ^ [(NSString *)self->_appIdentifier hash];
  return v5 ^ [(NSString *)self->_requestingAppId hash];
}

- (void)mergeFrom:(id)a3
{
  id v6 = (int *)a3;
  [v6 readAll:0];
  uint64_t v4 = v6;
  char v5 = *((unsigned char *)v6 + 60);
  if (v5)
  {
    self->_purpose = v6[13];
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v6 + 60);
  }
  if ((v5 & 2) != 0)
  {
    self->_source = v6[14];
    *(unsigned char *)&self->_flags |= 2u;
  }
  if (*((void *)v6 + 3))
  {
    -[GEODirectionsRequestFeedback setAppIdentifier:](self, "setAppIdentifier:");
    uint64_t v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[GEODirectionsRequestFeedback setRequestingAppId:](self, "setRequestingAppId:");
    uint64_t v4 = v6;
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
      char v5 = reader;
      objc_sync_enter(v5);
      GEODirectionsRequestFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1434);
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
    [(GEODirectionsRequestFeedback *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingAppId, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end