@interface GEOLogMsgEventServiceMetadata
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDirectionsMetadata;
- (BOOL)hasPlacesMetadata;
- (BOOL)hasServiceMetadataType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEODirectionsRequestResponseAnalyticsData)directionsMetadata;
- (GEOLogMsgEventServiceMetadata)init;
- (GEOLogMsgEventServiceMetadata)initWithData:(id)a3;
- (GEOLogMsgEventServiceMetadata)initWithDictionary:(id)a3;
- (GEOLogMsgEventServiceMetadata)initWithJSON:(id)a3;
- (GEOPDPlacesRequestResponseAnalyticsData)placesMetadata;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)serviceMetadataTypeAsString:(int)a3;
- (int)StringAsServiceMetadataType:(id)a3;
- (int)serviceMetadataType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDirectionsMetadata;
- (void)_readPlacesMetadata;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDirectionsMetadata:(id)a3;
- (void)setHasServiceMetadataType:(BOOL)a3;
- (void)setPlacesMetadata:(id)a3;
- (void)setServiceMetadataType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventServiceMetadata

- (GEOLogMsgEventServiceMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventServiceMetadata;
  v2 = [(GEOLogMsgEventServiceMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventServiceMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventServiceMetadata;
  v3 = [(GEOLogMsgEventServiceMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)serviceMetadataType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_serviceMetadataType;
  }
  else {
    return 0;
  }
}

- (void)setServiceMetadataType:(int)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  self->_serviceMetadataType = a3;
}

- (void)setHasServiceMetadataType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasServiceMetadataType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)serviceMetadataTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53F7BD8[a3];
  }

  return v3;
}

- (int)StringAsServiceMetadataType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ServiceMetadataType_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ServiceMetadataType_DIRECTIONS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ServiceMetadataType_PLACES"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readDirectionsMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventServiceMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasDirectionsMetadata
{
  return self->_directionsMetadata != 0;
}

- (GEODirectionsRequestResponseAnalyticsData)directionsMetadata
{
  -[GEOLogMsgEventServiceMetadata _readDirectionsMetadata]((uint64_t)self);
  directionsMetadata = self->_directionsMetadata;

  return directionsMetadata;
}

- (void)setDirectionsMetadata:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_directionsMetadata, a3);
}

- (void)_readPlacesMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventServiceMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlacesMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasPlacesMetadata
{
  return self->_placesMetadata != 0;
}

- (GEOPDPlacesRequestResponseAnalyticsData)placesMetadata
{
  -[GEOLogMsgEventServiceMetadata _readPlacesMetadata]((uint64_t)self);
  placesMetadata = self->_placesMetadata;

  return placesMetadata;
}

- (void)setPlacesMetadata:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_placesMetadata, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventServiceMetadata;
  int v4 = [(GEOLogMsgEventServiceMetadata *)&v8 description];
  v5 = [(GEOLogMsgEventServiceMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventServiceMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v5 = *(int *)(a1 + 44);
      if (v5 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 44));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53F7BD8[v5];
      }
      if (a2) {
        objc_super v7 = @"serviceMetadataType";
      }
      else {
        objc_super v7 = @"service_metadata_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 directionsMetadata];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"directionsMetadata";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"directions_metadata";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = [(id)a1 placesMetadata];
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"placesMetadata";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"places_metadata";
      }
      [v4 setObject:v14 forKey:v15];
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
  return -[GEOLogMsgEventServiceMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventServiceMetadata)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventServiceMetadata *)-[GEOLogMsgEventServiceMetadata _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_35;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_35;
  }
  if (a3) {
    objc_super v6 = @"serviceMetadataType";
  }
  else {
    objc_super v6 = @"service_metadata_type";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"ServiceMetadataType_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"ServiceMetadataType_DIRECTIONS"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"ServiceMetadataType_PLACES"])
    {
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_17:
    [a1 setServiceMetadataType:v9];
  }

  if (a3) {
    v10 = @"directionsMetadata";
  }
  else {
    v10 = @"directions_metadata";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [GEODirectionsRequestResponseAnalyticsData alloc];
    if (a3) {
      uint64_t v13 = [(GEODirectionsRequestResponseAnalyticsData *)v12 initWithJSON:v11];
    }
    else {
      uint64_t v13 = [(GEODirectionsRequestResponseAnalyticsData *)v12 initWithDictionary:v11];
    }
    v14 = (void *)v13;
    [a1 setDirectionsMetadata:v13];
  }
  if (a3) {
    v15 = @"placesMetadata";
  }
  else {
    v15 = @"places_metadata";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [GEOPDPlacesRequestResponseAnalyticsData alloc];
    if (a3) {
      uint64_t v18 = [(GEOPDPlacesRequestResponseAnalyticsData *)v17 initWithJSON:v16];
    }
    else {
      uint64_t v18 = [(GEOPDPlacesRequestResponseAnalyticsData *)v17 initWithDictionary:v16];
    }
    v19 = (void *)v18;
    [a1 setPlacesMetadata:v18];
  }
LABEL_35:

  return a1;
}

- (GEOLogMsgEventServiceMetadata)initWithJSON:(id)a3
{
  return (GEOLogMsgEventServiceMetadata *)-[GEOLogMsgEventServiceMetadata _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_4772;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_4773;
    }
    GEOLogMsgEventServiceMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEODirectionsRequestResponseAnalyticsData *)self->_directionsMetadata readAll:1];
    [(GEOPDPlacesRequestResponseAnalyticsData *)self->_placesMetadata readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventServiceMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventServiceMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEventServiceMetadata *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_directionsMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_placesMetadata) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOLogMsgEventServiceMetadata *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 8) = self->_readerMarkPos;
  *((_DWORD *)v5 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 11) = self->_serviceMetadataType;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  if (self->_directionsMetadata)
  {
    objc_msgSend(v5, "setDirectionsMetadata:");
    int v4 = v5;
  }
  if (self->_placesMetadata)
  {
    objc_msgSend(v5, "setPlacesMetadata:");
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
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLogMsgEventServiceMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventServiceMetadata *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 44) = self->_serviceMetadataType;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  id v9 = [(GEODirectionsRequestResponseAnalyticsData *)self->_directionsMetadata copyWithZone:a3];
  v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  id v11 = [(GEOPDPlacesRequestResponseAnalyticsData *)self->_placesMetadata copyWithZone:a3];
  id v8 = *(id *)(v5 + 24);
  *(void *)(v5 + 24) = v11;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOLogMsgEventServiceMetadata *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_serviceMetadataType != *((_DWORD *)v4 + 11)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  directionsMetadata = self->_directionsMetadata;
  if ((unint64_t)directionsMetadata | *((void *)v4 + 2)
    && !-[GEODirectionsRequestResponseAnalyticsData isEqual:](directionsMetadata, "isEqual:"))
  {
    goto LABEL_11;
  }
  placesMetadata = self->_placesMetadata;
  if ((unint64_t)placesMetadata | *((void *)v4 + 3)) {
    char v7 = -[GEOPDPlacesRequestResponseAnalyticsData isEqual:](placesMetadata, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventServiceMetadata *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_serviceMetadataType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEODirectionsRequestResponseAnalyticsData *)self->_directionsMetadata hash] ^ v3;
  return v4 ^ [(GEOPDPlacesRequestResponseAnalyticsData *)self->_placesMetadata hash];
}

- (void)mergeFrom:(id)a3
{
  id v9 = (int *)a3;
  [v9 readAll:0];
  unint64_t v4 = v9;
  if (v9[12])
  {
    self->_serviceMetadataType = v9[11];
    *(unsigned char *)&self->_flags |= 1u;
  }
  directionsMetadata = self->_directionsMetadata;
  uint64_t v6 = *((void *)v9 + 2);
  if (directionsMetadata)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEODirectionsRequestResponseAnalyticsData mergeFrom:](directionsMetadata, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOLogMsgEventServiceMetadata setDirectionsMetadata:](self, "setDirectionsMetadata:");
  }
  unint64_t v4 = v9;
LABEL_9:
  placesMetadata = self->_placesMetadata;
  uint64_t v8 = *((void *)v4 + 3);
  if (placesMetadata)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOPDPlacesRequestResponseAnalyticsData mergeFrom:](placesMetadata, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOLogMsgEventServiceMetadata setPlacesMetadata:](self, "setPlacesMetadata:");
  }
  unint64_t v4 = v9;
LABEL_15:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placesMetadata, 0);
  objc_storeStrong((id *)&self->_directionsMetadata, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end