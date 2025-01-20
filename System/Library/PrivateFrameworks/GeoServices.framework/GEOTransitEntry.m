@interface GEOTransitEntry
+ (BOOL)isValid:(id)a3;
- (BOOL)hasLineMuid;
- (BOOL)hasRoutingParameters;
- (BOOL)hasTripMuid;
- (BOOL)hasTripStaticDepartureTime;
- (BOOL)hasWindowStartTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitEntry)initWithDictionary:(id)a3;
- (GEOTransitEntry)initWithJSON:(id)a3;
- (NSData)routingParameters;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)lineMuid;
- (unint64_t)tripMuid;
- (unsigned)tripStaticDepartureTime;
- (unsigned)windowStartTime;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLineMuid:(BOOL)a3;
- (void)setHasTripMuid:(BOOL)a3;
- (void)setHasTripStaticDepartureTime:(BOOL)a3;
- (void)setHasWindowStartTime:(BOOL)a3;
- (void)setLineMuid:(unint64_t)a3;
- (void)setRoutingParameters:(id)a3;
- (void)setTripMuid:(unint64_t)a3;
- (void)setTripStaticDepartureTime:(unsigned int)a3;
- (void)setWindowStartTime:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitEntry

- (unint64_t)tripMuid
{
  return self->_tripMuid;
}

- (void)setTripMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_tripMuid = a3;
}

- (void)setHasTripMuid:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTripMuid
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unint64_t)lineMuid
{
  return self->_lineMuid;
}

- (void)setLineMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_lineMuid = a3;
}

- (void)setHasLineMuid:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLineMuid
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)tripStaticDepartureTime
{
  return self->_tripStaticDepartureTime;
}

- (void)setTripStaticDepartureTime:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_tripStaticDepartureTime = a3;
}

- (void)setHasTripStaticDepartureTime:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTripStaticDepartureTime
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)windowStartTime
{
  return self->_windowStartTime;
}

- (void)setWindowStartTime:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_windowStartTime = a3;
}

- (void)setHasWindowStartTime:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasWindowStartTime
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)hasRoutingParameters
{
  return self->_routingParameters != 0;
}

- (NSData)routingParameters
{
  return self->_routingParameters;
}

- (void)setRoutingParameters:(id)a3
{
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitEntry;
  v4 = [(GEOTransitEntry *)&v8 description];
  v5 = [(GEOTransitEntry *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitEntry _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_31;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 48);
  if ((v5 & 2) != 0)
  {
    v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
    if (a2) {
      v12 = @"tripMuid";
    }
    else {
      v12 = @"trip_muid";
    }
    [v4 setObject:v11 forKey:v12];

    char v5 = *(unsigned char *)(a1 + 48);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
LABEL_21:
      v15 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
      if (a2) {
        v16 = @"tripStaticDepartureTime";
      }
      else {
        v16 = @"trip_static_departure_time";
      }
      [v4 setObject:v15 forKey:v16];

      if ((*(unsigned char *)(a1 + 48) & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)(a1 + 48) & 1) == 0)
  {
    goto LABEL_4;
  }
  v13 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
  if (a2) {
    v14 = @"lineMuid";
  }
  else {
    v14 = @"line_muid";
  }
  [v4 setObject:v13 forKey:v14];

  char v5 = *(unsigned char *)(a1 + 48);
  if ((v5 & 4) != 0) {
    goto LABEL_21;
  }
LABEL_5:
  if ((v5 & 8) != 0)
  {
LABEL_6:
    v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 44)];
    if (a2) {
      v7 = @"windowStartTime";
    }
    else {
      v7 = @"window_start_time";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_10:
  objc_super v8 = [(id)a1 routingParameters];
  v9 = v8;
  if (v8)
  {
    if (a2)
    {
      v10 = [v8 base64EncodedStringWithOptions:0];
      [v4 setObject:v10 forKey:@"routingParameters"];
    }
    else
    {
      [v4 setObject:v8 forKey:@"routing_parameters"];
    }
  }

  v17 = *(void **)(a1 + 8);
  if (v17)
  {
    v18 = [v17 dictionaryRepresentation];
    v19 = v18;
    if (a2)
    {
      v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __45__GEOTransitEntry__dictionaryRepresentation___block_invoke;
      v24[3] = &unk_1E53D8860;
      id v21 = v20;
      id v25 = v21;
      [v19 enumerateKeysAndObjectsUsingBlock:v24];
      id v22 = v21;

      v19 = v22;
    }
    [v4 setObject:v19 forKey:@"Unknown Fields"];
  }
LABEL_31:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitEntry _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOTransitEntry__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitEntry)initWithDictionary:(id)a3
{
  return (GEOTransitEntry *)-[GEOTransitEntry _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"tripMuid";
      }
      else {
        v6 = @"trip_muid";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTripMuid:", objc_msgSend(v7, "unsignedLongLongValue"));
      }

      if (a3) {
        objc_super v8 = @"lineMuid";
      }
      else {
        objc_super v8 = @"line_muid";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLineMuid:", objc_msgSend(v9, "unsignedLongLongValue"));
      }

      if (a3) {
        id v10 = @"tripStaticDepartureTime";
      }
      else {
        id v10 = @"trip_static_departure_time";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTripStaticDepartureTime:", objc_msgSend(v11, "unsignedIntValue"));
      }

      if (a3) {
        v12 = @"windowStartTime";
      }
      else {
        v12 = @"window_start_time";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setWindowStartTime:", objc_msgSend(v13, "unsignedIntValue"));
      }

      if (a3) {
        v14 = @"routingParameters";
      }
      else {
        v14 = @"routing_parameters";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v15 options:0];
        [a1 setRoutingParameters:v16];
      }
    }
  }

  return a1;
}

- (GEOTransitEntry)initWithJSON:(id)a3
{
  return (GEOTransitEntry *)-[GEOTransitEntry _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitEntryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitEntryReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_5:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_6:
  if (self->_routingParameters)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [(GEOTransitEntry *)self readAll:0];
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((void *)v6 + 4) = self->_tripMuid;
    *((unsigned char *)v6 + 48) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v6 + 2) = self->_lineMuid;
  *((unsigned char *)v6 + 48) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  *((_DWORD *)v6 + 10) = self->_tripStaticDepartureTime;
  *((unsigned char *)v6 + 48) |= 4u;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v6 + 11) = self->_windowStartTime;
    *((unsigned char *)v6 + 48) |= 8u;
  }
LABEL_6:
  if (self->_routingParameters)
  {
    objc_msgSend(v6, "setRoutingParameters:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(void *)(v5 + 32) = self->_tripMuid;
    *(unsigned char *)(v5 + 48) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v5 + 40) = self->_tripStaticDepartureTime;
      *(unsigned char *)(v5 + 48) |= 4u;
      if ((*(unsigned char *)&self->_flags & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 16) = self->_lineMuid;
  *(unsigned char *)(v5 + 48) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((flags & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 44) = self->_windowStartTime;
    *(unsigned char *)(v5 + 48) |= 8u;
  }
LABEL_6:
  uint64_t v8 = [(NSData *)self->_routingParameters copyWithZone:a3];
  v9 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v8;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  [(GEOTransitEntry *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_tripMuid != *((void *)v4 + 4)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
LABEL_24:
    char v6 = 0;
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_lineMuid != *((void *)v4 + 2)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_tripStaticDepartureTime != *((_DWORD *)v4 + 10)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_windowStartTime != *((_DWORD *)v4 + 11)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_24;
  }
  routingParameters = self->_routingParameters;
  if ((unint64_t)routingParameters | *((void *)v4 + 3)) {
    char v6 = -[NSData isEqual:](routingParameters, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_25:

  return v6;
}

- (unint64_t)hash
{
  [(GEOTransitEntry *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    unint64_t v3 = 2654435761u * self->_tripMuid;
    if (*(unsigned char *)&self->_flags)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_lineMuid;
      if ((*(unsigned char *)&self->_flags & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_flags & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ [(NSData *)self->_routingParameters hash];
    }
  }
  else
  {
    unint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_tripStaticDepartureTime;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_windowStartTime;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSData *)self->_routingParameters hash];
}

- (void)mergeFrom:(id)a3
{
  id v6 = a3;
  [v6 readAll:0];
  unint64_t v4 = v6;
  char v5 = *((unsigned char *)v6 + 48);
  if ((v5 & 2) != 0)
  {
    self->_tripMuid = *((void *)v6 + 4);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v6 + 48);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v6 + 48) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_lineMuid = *((void *)v6 + 2);
  *(unsigned char *)&self->_flags |= 1u;
  char v5 = *((unsigned char *)v6 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  self->_tripStaticDepartureTime = *((_DWORD *)v6 + 10);
  *(unsigned char *)&self->_flags |= 4u;
  if ((*((unsigned char *)v6 + 48) & 8) != 0)
  {
LABEL_5:
    self->_windowStartTime = *((_DWORD *)v6 + 11);
    *(unsigned char *)&self->_flags |= 8u;
  }
LABEL_6:
  if (*((void *)v6 + 3))
  {
    [(GEOTransitEntry *)self setRoutingParameters:"setRoutingParameters:"];
    unint64_t v4 = v6;
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
    [(GEOTransitEntry *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingParameters, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end