@interface GEOABAssignmentRequest
+ (BOOL)isValid:(id)a3;
- (BOOL)hasClientMetadata;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasGuid;
- (BOOL)hasRequestType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (GEOABAssignmentRequest)init;
- (GEOABAssignmentRequest)initWithData:(id)a3;
- (GEOABAssignmentRequest)initWithDictionary:(id)a3;
- (GEOABAssignmentRequest)initWithJSON:(id)a3;
- (GEOPDClientMetadata)clientMetadata;
- (NSString)guid;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)requestTypeAsString:(int)a3;
- (int)StringAsRequestType:(id)a3;
- (int)requestType;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readClientMetadata;
- (void)_readGuid;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setClientMetadata:(id)a3;
- (void)setGuid:(id)a3;
- (void)setHasRequestType:(BOOL)a3;
- (void)setRequestType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOABAssignmentRequest

- (GEOABAssignmentRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOABAssignmentRequest;
  v2 = [(GEOABAssignmentRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOABAssignmentRequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOABAssignmentRequest;
  v3 = [(GEOABAssignmentRequest *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readGuid
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOABAssignmentRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGuid_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasGuid
{
  return self->_guid != 0;
}

- (NSString)guid
{
  -[GEOABAssignmentRequest _readGuid]((uint64_t)self);
  guid = self->_guid;

  return guid;
}

- (void)setGuid:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_guid, a3);
}

- (int)requestType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_requestType;
  }
  else {
    return 1;
  }
}

- (void)setRequestType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_requestType = a3;
}

- (void)setHasRequestType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasRequestType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)requestTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53EC0F8[a3];
  }

  return v3;
}

- (int)StringAsRequestType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AB_REQUEST_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AB_REQUEST_TYPE_GET_ASSIGNMENTS_FOR_USER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AB_REQUEST_TYPE_GET_ALL_POSSIBLE_ASSIGNMENTS"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readClientMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOABAssignmentRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientMetadata_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasClientMetadata
{
  return self->_clientMetadata != 0;
}

- (GEOPDClientMetadata)clientMetadata
{
  -[GEOABAssignmentRequest _readClientMetadata]((uint64_t)self);
  clientMetadata = self->_clientMetadata;

  return clientMetadata;
}

- (void)setClientMetadata:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_clientMetadata, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOABAssignmentRequest;
  int v4 = [(GEOABAssignmentRequest *)&v8 description];
  v5 = [(GEOABAssignmentRequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOABAssignmentRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 guid];
    if (v5) {
      [v4 setObject:v5 forKey:@"guid"];
    }

    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v6 = *(int *)(a1 + 52);
      if (v6 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v7 = off_1E53EC0F8[v6];
      }
      if (a2) {
        objc_super v8 = @"requestType";
      }
      else {
        objc_super v8 = @"request_type";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [(id)a1 clientMetadata];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"clientMetadata";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"client_metadata";
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
        v20[2] = __52__GEOABAssignmentRequest__dictionaryRepresentation___block_invoke;
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
  return -[GEOABAssignmentRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEOABAssignmentRequest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOABAssignmentRequest)initWithDictionary:(id)a3
{
  return (GEOABAssignmentRequest *)-[GEOABAssignmentRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_29;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_29;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"guid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = (void *)[v6 copy];
    [a1 setGuid:v7];
  }
  if (a3) {
    objc_super v8 = @"requestType";
  }
  else {
    objc_super v8 = @"request_type";
  }
  v9 = [v5 objectForKeyedSubscript:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    if ([v10 isEqualToString:@"AB_REQUEST_TYPE_UNKNOWN"])
    {
      uint64_t v11 = 0;
    }
    else if ([v10 isEqualToString:@"AB_REQUEST_TYPE_GET_ASSIGNMENTS_FOR_USER"])
    {
      uint64_t v11 = 1;
    }
    else if ([v10 isEqualToString:@"AB_REQUEST_TYPE_GET_ALL_POSSIBLE_ASSIGNMENTS"])
    {
      uint64_t v11 = 2;
    }
    else
    {
      uint64_t v11 = 0;
    }

    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v9 intValue];
LABEL_19:
    [a1 setRequestType:v11];
  }

  if (a3) {
    v12 = @"clientMetadata";
  }
  else {
    v12 = @"client_metadata";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [GEOPDClientMetadata alloc];
    if (a3) {
      uint64_t v15 = [(GEOPDClientMetadata *)v14 initWithJSON:v13];
    }
    else {
      uint64_t v15 = [(GEOPDClientMetadata *)v14 initWithDictionary:v13];
    }
    v16 = (void *)v15;
    [a1 setClientMetadata:v15];
  }
LABEL_29:

  return a1;
}

- (GEOABAssignmentRequest)initWithJSON:(id)a3
{
  return (GEOABAssignmentRequest *)-[GEOABAssignmentRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_73;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_73;
    }
    GEOABAssignmentRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOPDClientMetadata *)self->_clientMetadata readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOABAssignmentRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOABAssignmentRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOABAssignmentRequestIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v6 = self->_reader;
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
    [(GEOABAssignmentRequest *)self readAll:0];
    if (self->_guid) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    if (self->_clientMetadata)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOABAssignmentRequest _readClientMetadata]((uint64_t)self);
  clientMetadata = self->_clientMetadata;

  return [(GEOPDClientMetadata *)clientMetadata hasGreenTeaWithValue:v3];
}

- (unsigned)requestTypeCode
{
  return 1016;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOABAssignmentRequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_guid) {
    objc_msgSend(v5, "setGuid:");
  }
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 13) = self->_requestType;
    *((unsigned char *)v5 + 56) |= 1u;
  }
  if (self->_clientMetadata)
  {
    objc_msgSend(v5, "setClientMetadata:");
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
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOABAssignmentRequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOABAssignmentRequest *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_guid copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_requestType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  id v11 = [(GEOPDClientMetadata *)self->_clientMetadata copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOABAssignmentRequest *)self readAll:1];
  [v4 readAll:1];
  guid = self->_guid;
  if ((unint64_t)guid | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](guid, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_requestType != *((_DWORD *)v4 + 13)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  clientMetadata = self->_clientMetadata;
  if ((unint64_t)clientMetadata | *((void *)v4 + 3)) {
    char v7 = -[GEOPDClientMetadata isEqual:](clientMetadata, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  [(GEOABAssignmentRequest *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_guid hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_requestType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ [(GEOPDClientMetadata *)self->_clientMetadata hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  char v7 = a3;
  [v7 readAll:0];
  uint64_t v4 = v7;
  if (v7[4])
  {
    -[GEOABAssignmentRequest setGuid:](self, "setGuid:");
    uint64_t v4 = v7;
  }
  if (v4[7])
  {
    self->_requestType = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
  }
  clientMetadata = self->_clientMetadata;
  uint64_t v6 = v4[3];
  if (clientMetadata)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOPDClientMetadata mergeFrom:](clientMetadata, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOABAssignmentRequest setClientMetadata:](self, "setClientMetadata:");
  }
  uint64_t v4 = v7;
LABEL_11:
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
      GEOABAssignmentRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_14);
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
  *(unsigned char *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOABAssignmentRequest *)self readAll:0];
    clientMetadata = self->_clientMetadata;
    [(GEOPDClientMetadata *)clientMetadata clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_clientMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end