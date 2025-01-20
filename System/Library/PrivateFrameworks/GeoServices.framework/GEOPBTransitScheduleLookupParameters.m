@interface GEOPBTransitScheduleLookupParameters
+ (BOOL)isValid:(id)a3;
- (BOOL)hasIncludeAllDirectionNames;
- (BOOL)hasIncludeAllHeadsigns;
- (BOOL)hasLineId;
- (BOOL)hasReferenceTripId;
- (BOOL)hasRoutingParameters;
- (BOOL)hasTransitId;
- (BOOL)includeAllDirectionNames;
- (BOOL)includeAllHeadsigns;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPBTransitScheduleLookupParameters)initWithDictionary:(id)a3;
- (GEOPBTransitScheduleLookupParameters)initWithJSON:(id)a3;
- (NSData)routingParameters;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)lineId;
- (unint64_t)referenceTripId;
- (unint64_t)transitId;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIncludeAllDirectionNames:(BOOL)a3;
- (void)setHasIncludeAllHeadsigns:(BOOL)a3;
- (void)setHasLineId:(BOOL)a3;
- (void)setHasReferenceTripId:(BOOL)a3;
- (void)setHasTransitId:(BOOL)a3;
- (void)setIncludeAllDirectionNames:(BOOL)a3;
- (void)setIncludeAllHeadsigns:(BOOL)a3;
- (void)setLineId:(unint64_t)a3;
- (void)setReferenceTripId:(unint64_t)a3;
- (void)setRoutingParameters:(id)a3;
- (void)setTransitId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBTransitScheduleLookupParameters

- (unint64_t)lineId
{
  return self->_lineId;
}

- (void)setLineId:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_lineId = a3;
}

- (void)setHasLineId:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLineId
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unint64_t)transitId
{
  return self->_transitId;
}

- (void)setTransitId:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_transitId = a3;
}

- (void)setHasTransitId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTransitId
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unint64_t)referenceTripId
{
  return self->_referenceTripId;
}

- (void)setReferenceTripId:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_referenceTripId = a3;
}

- (void)setHasReferenceTripId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasReferenceTripId
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
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

- (BOOL)includeAllDirectionNames
{
  return self->_includeAllDirectionNames;
}

- (void)setIncludeAllDirectionNames:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_includeAllDirectionNames = a3;
}

- (void)setHasIncludeAllDirectionNames:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIncludeAllDirectionNames
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)includeAllHeadsigns
{
  return self->_includeAllHeadsigns;
}

- (void)setIncludeAllHeadsigns:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_includeAllHeadsigns = a3;
}

- (void)setHasIncludeAllHeadsigns:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasIncludeAllHeadsigns
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitScheduleLookupParameters;
  v4 = [(GEOPBTransitScheduleLookupParameters *)&v8 description];
  v5 = [(GEOPBTransitScheduleLookupParameters *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitScheduleLookupParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_36;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 52);
  if ((v5 & 1) == 0)
  {
    if ((*(unsigned char *)(a1 + 52) & 4) == 0) {
      goto LABEL_4;
    }
LABEL_16:
    v13 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
    if (a2) {
      v14 = @"transitId";
    }
    else {
      v14 = @"transit_id";
    }
    [v4 setObject:v13 forKey:v14];

    if ((*(unsigned char *)(a1 + 52) & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
  if (a2) {
    v12 = @"lineId";
  }
  else {
    v12 = @"line_id";
  }
  [v4 setObject:v11 forKey:v12];

  char v5 = *(unsigned char *)(a1 + 52);
  if ((v5 & 4) != 0) {
    goto LABEL_16;
  }
LABEL_4:
  if ((v5 & 2) != 0)
  {
LABEL_5:
    v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
    if (a2) {
      v7 = @"referenceTripId";
    }
    else {
      v7 = @"reference_trip_id";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_9:
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

  char v15 = *(unsigned char *)(a1 + 52);
  if ((v15 & 8) != 0)
  {
    v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
    if (a2) {
      v17 = @"includeAllDirectionNames";
    }
    else {
      v17 = @"include_all_direction_names";
    }
    [v4 setObject:v16 forKey:v17];

    char v15 = *(unsigned char *)(a1 + 52);
  }
  if ((v15 & 0x10) != 0)
  {
    v18 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 49)];
    if (a2) {
      v19 = @"includeAllHeadsigns";
    }
    else {
      v19 = @"include_all_headsigns";
    }
    [v4 setObject:v18 forKey:v19];
  }
  v20 = *(void **)(a1 + 8);
  if (v20)
  {
    v21 = [v20 dictionaryRepresentation];
    v22 = v21;
    if (a2)
    {
      v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __66__GEOPBTransitScheduleLookupParameters__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E53D8860;
      id v24 = v23;
      id v28 = v24;
      [v22 enumerateKeysAndObjectsUsingBlock:v27];
      id v25 = v24;

      v22 = v25;
    }
    [v4 setObject:v22 forKey:@"Unknown Fields"];
  }
LABEL_36:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitScheduleLookupParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __66__GEOPBTransitScheduleLookupParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPBTransitScheduleLookupParameters)initWithDictionary:(id)a3
{
  return (GEOPBTransitScheduleLookupParameters *)-[GEOPBTransitScheduleLookupParameters _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"lineId";
      }
      else {
        v6 = @"line_id";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLineId:", objc_msgSend(v7, "unsignedLongLongValue"));
      }

      if (a3) {
        objc_super v8 = @"transitId";
      }
      else {
        objc_super v8 = @"transit_id";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTransitId:", objc_msgSend(v9, "unsignedLongLongValue"));
      }

      if (a3) {
        id v10 = @"referenceTripId";
      }
      else {
        id v10 = @"reference_trip_id";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setReferenceTripId:", objc_msgSend(v11, "unsignedLongLongValue"));
      }

      if (a3) {
        v12 = @"routingParameters";
      }
      else {
        v12 = @"routing_parameters";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v13 options:0];
        [a1 setRoutingParameters:v14];
      }
      if (a3) {
        char v15 = @"includeAllDirectionNames";
      }
      else {
        char v15 = @"include_all_direction_names";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIncludeAllDirectionNames:", objc_msgSend(v16, "BOOLValue"));
      }

      if (a3) {
        v17 = @"includeAllHeadsigns";
      }
      else {
        v17 = @"include_all_headsigns";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIncludeAllHeadsigns:", objc_msgSend(v18, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOPBTransitScheduleLookupParameters)initWithJSON:(id)a3
{
  return (GEOPBTransitScheduleLookupParameters *)-[GEOPBTransitScheduleLookupParameters _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitScheduleLookupParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitScheduleLookupParametersReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteUint64Field();
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint64Field();
LABEL_5:
  if (self->_routingParameters) {
    PBDataWriterWriteDataField();
  }
  char v5 = (char)self->_flags;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v5 = (char)self->_flags;
  }
  if ((v5 & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v6];
}

- (void)copyTo:(id)a3
{
  v7 = a3;
  [(GEOPBTransitScheduleLookupParameters *)self readAll:0];
  v4 = v7;
  char flags = (char)self->_flags;
  if (flags)
  {
    *((void *)v7 + 2) = self->_lineId;
    v7[52] |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v7 + 5) = self->_transitId;
  v7[52] |= 4u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    *((void *)v7 + 3) = self->_referenceTripId;
    v7[52] |= 2u;
  }
LABEL_5:
  if (self->_routingParameters)
  {
    objc_msgSend(v7, "setRoutingParameters:");
    v4 = v7;
  }
  char v6 = (char)self->_flags;
  if ((v6 & 8) != 0)
  {
    v4[48] = self->_includeAllDirectionNames;
    v4[52] |= 8u;
    char v6 = (char)self->_flags;
  }
  if ((v6 & 0x10) != 0)
  {
    v4[49] = self->_includeAllHeadsigns;
    v4[52] |= 0x10u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(void *)(v5 + 16) = self->_lineId;
    *(unsigned char *)(v5 + 52) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 40) = self->_transitId;
  *(unsigned char *)(v5 + 52) |= 4u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    *(void *)(v5 + 24) = self->_referenceTripId;
    *(unsigned char *)(v5 + 52) |= 2u;
  }
LABEL_5:
  uint64_t v8 = [(NSData *)self->_routingParameters copyWithZone:a3];
  v9 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v8;

  char v10 = (char)self->_flags;
  if ((v10 & 8) != 0)
  {
    *(unsigned char *)(v6 + 48) = self->_includeAllDirectionNames;
    *(unsigned char *)(v6 + 52) |= 8u;
    char v10 = (char)self->_flags;
  }
  if ((v10 & 0x10) != 0)
  {
    *(unsigned char *)(v6 + 49) = self->_includeAllHeadsigns;
    *(unsigned char *)(v6 + 52) |= 0x10u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  [(GEOPBTransitScheduleLookupParameters *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 52);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_lineId != *((void *)v4 + 2)) {
      goto LABEL_30;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_transitId != *((void *)v4 + 5)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_referenceTripId != *((void *)v4 + 3)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_30;
  }
  routingParameters = self->_routingParameters;
  if ((unint64_t)routingParameters | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](routingParameters, "isEqual:")) {
      goto LABEL_30;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 52);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0) {
      goto LABEL_30;
    }
    if (self->_includeAllDirectionNames)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_30;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_30;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_30;
  }
  BOOL v8 = (v6 & 0x10) == 0;
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) != 0)
    {
      if (self->_includeAllHeadsigns)
      {
        if (!*((unsigned char *)v4 + 49)) {
          goto LABEL_30;
        }
      }
      else if (*((unsigned char *)v4 + 49))
      {
        goto LABEL_30;
      }
      BOOL v8 = 1;
      goto LABEL_31;
    }
LABEL_30:
    BOOL v8 = 0;
  }
LABEL_31:

  return v8;
}

- (unint64_t)hash
{
  [(GEOPBTransitScheduleLookupParameters *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unint64_t v3 = 2654435761u * self->_lineId;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_transitId;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_referenceTripId;
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v5 = 0;
LABEL_8:
  uint64_t v6 = [(NSData *)self->_routingParameters hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v7 = 2654435761 * self->_includeAllDirectionNames;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_10;
    }
LABEL_12:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v6;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_10:
  uint64_t v8 = 2654435761 * self->_includeAllHeadsigns;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v7 = (unint64_t *)a3;
  [v7 readAll:0];
  unint64_t v4 = (BOOL *)v7;
  char v5 = *((unsigned char *)v7 + 52);
  if (v5)
  {
    self->_lineId = v7[2];
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v7 + 52);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v7 + 52) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_transitId = v7[5];
  *(unsigned char *)&self->_flags |= 4u;
  if ((*((unsigned char *)v7 + 52) & 2) != 0)
  {
LABEL_4:
    self->_referenceTripId = v7[3];
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_5:
  if (v7[4])
  {
    [(GEOPBTransitScheduleLookupParameters *)self setRoutingParameters:"setRoutingParameters:"];
    unint64_t v4 = (BOOL *)v7;
  }
  BOOL v6 = v4[52];
  if ((v6 & 8) != 0)
  {
    self->_includeAllDirectionNames = v4[48];
    *(unsigned char *)&self->_flags |= 8u;
    BOOL v6 = v4[52];
  }
  if ((v6 & 0x10) != 0)
  {
    self->_includeAllHeadsigns = v4[49];
    *(unsigned char *)&self->_flags |= 0x10u;
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
    [(GEOPBTransitScheduleLookupParameters *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingParameters, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end