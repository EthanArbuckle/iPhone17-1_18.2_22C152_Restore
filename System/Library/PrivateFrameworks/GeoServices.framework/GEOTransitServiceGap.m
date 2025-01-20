@interface GEOTransitServiceGap
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAbsEndTime;
- (BOOL)hasAbsStartTime;
- (BOOL)hasAppearsBeforeSuggestedRouteIndex;
- (BOOL)hasDisplayMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedString)displayMessage;
- (GEOTransitServiceGap)initWithDictionary:(id)a3;
- (GEOTransitServiceGap)initWithJSON:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)routeListInsertBeforeIndex;
- (unsigned)absEndTime;
- (unsigned)absStartTime;
- (unsigned)appearsBeforeSuggestedRouteIndex;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsEndTime:(unsigned int)a3;
- (void)setAbsStartTime:(unsigned int)a3;
- (void)setAppearsBeforeSuggestedRouteIndex:(unsigned int)a3;
- (void)setDisplayMessage:(id)a3;
- (void)setHasAbsEndTime:(BOOL)a3;
- (void)setHasAbsStartTime:(BOOL)a3;
- (void)setHasAppearsBeforeSuggestedRouteIndex:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitServiceGap

- (unsigned)appearsBeforeSuggestedRouteIndex
{
  return self->_appearsBeforeSuggestedRouteIndex;
}

- (void)setAppearsBeforeSuggestedRouteIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_appearsBeforeSuggestedRouteIndex = a3;
}

- (void)setHasAppearsBeforeSuggestedRouteIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasAppearsBeforeSuggestedRouteIndex
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)absStartTime
{
  return self->_absStartTime;
}

- (void)setAbsStartTime:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_absStartTime = a3;
}

- (void)setHasAbsStartTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasAbsStartTime
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)absEndTime
{
  return self->_absEndTime;
}

- (void)setAbsEndTime:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_absEndTime = a3;
}

- (void)setHasAbsEndTime:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAbsEndTime
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)hasDisplayMessage
{
  return self->_displayMessage != 0;
}

- (GEOFormattedString)displayMessage
{
  return self->_displayMessage;
}

- (void)setDisplayMessage:(id)a3
{
}

- (NSString)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitServiceGap;
  v4 = [(GEOTransitServiceGap *)&v8 description];
  v5 = [(GEOTransitServiceGap *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitServiceGap _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_27;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 36);
  if ((v5 & 4) == 0)
  {
    if ((*(unsigned char *)(a1 + 36) & 2) == 0) {
      goto LABEL_4;
    }
LABEL_16:
    v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
    if (a2) {
      v15 = @"absStartTime";
    }
    else {
      v15 = @"abs_start_time";
    }
    [v4 setObject:v14 forKey:v15];

    if ((*(unsigned char *)(a1 + 36) & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 32)];
  if (a2) {
    v13 = @"appearsBeforeSuggestedRouteIndex";
  }
  else {
    v13 = @"appears_before_suggested_route_index";
  }
  [v4 setObject:v12 forKey:v13];

  char v5 = *(unsigned char *)(a1 + 36);
  if ((v5 & 2) != 0) {
    goto LABEL_16;
  }
LABEL_4:
  if (v5)
  {
LABEL_5:
    v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    if (a2) {
      v7 = @"absEndTime";
    }
    else {
      v7 = @"abs_end_time";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_9:
  objc_super v8 = [(id)a1 displayMessage];
  v9 = v8;
  if (v8)
  {
    if (a2)
    {
      v10 = [v8 jsonRepresentation];
      v11 = @"displayMessage";
    }
    else
    {
      v10 = [v8 dictionaryRepresentation];
      v11 = @"display_message";
    }
    [v4 setObject:v10 forKey:v11];
  }
  v16 = *(void **)(a1 + 8);
  if (v16)
  {
    v17 = [v16 dictionaryRepresentation];
    v18 = v17;
    if (a2)
    {
      v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __50__GEOTransitServiceGap__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E53D8860;
      id v20 = v19;
      id v24 = v20;
      [v18 enumerateKeysAndObjectsUsingBlock:v23];
      id v21 = v20;

      v18 = v21;
    }
    [v4 setObject:v18 forKey:@"Unknown Fields"];
  }
LABEL_27:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitServiceGap _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEOTransitServiceGap__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitServiceGap)initWithDictionary:(id)a3
{
  return (GEOTransitServiceGap *)-[GEOTransitServiceGap _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"appearsBeforeSuggestedRouteIndex";
      }
      else {
        v6 = @"appears_before_suggested_route_index";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAppearsBeforeSuggestedRouteIndex:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"absStartTime";
      }
      else {
        objc_super v8 = @"abs_start_time";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAbsStartTime:", objc_msgSend(v9, "unsignedIntValue"));
      }

      if (a3) {
        id v10 = @"absEndTime";
      }
      else {
        id v10 = @"abs_end_time";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAbsEndTime:", objc_msgSend(v11, "unsignedIntValue"));
      }

      if (a3) {
        v12 = @"displayMessage";
      }
      else {
        v12 = @"display_message";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v15 = [(GEOFormattedString *)v14 initWithJSON:v13];
        }
        else {
          uint64_t v15 = [(GEOFormattedString *)v14 initWithDictionary:v13];
        }
        v16 = (void *)v15;
        [a1 setDisplayMessage:v15];
      }
    }
  }

  return a1;
}

- (GEOTransitServiceGap)initWithJSON:(id)a3
{
  return (GEOTransitServiceGap *)-[GEOTransitServiceGap _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitServiceGapIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitServiceGapReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_displayMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [(GEOTransitServiceGap *)self readAll:0];
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_appearsBeforeSuggestedRouteIndex;
    *((unsigned char *)v6 + 36) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 7) = self->_absStartTime;
  *((unsigned char *)v6 + 36) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    *((_DWORD *)v6 + 6) = self->_absEndTime;
    *((unsigned char *)v6 + 36) |= 1u;
  }
LABEL_5:
  if (self->_displayMessage)
  {
    objc_msgSend(v6, "setDisplayMessage:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 28) = self->_absStartTime;
    *(unsigned char *)(v5 + 36) |= 2u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 32) = self->_appearsBeforeSuggestedRouteIndex;
  *(unsigned char *)(v5 + 36) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (flags)
  {
LABEL_4:
    *(_DWORD *)(v5 + 24) = self->_absEndTime;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
LABEL_5:
  id v8 = [(GEOFormattedString *)self->_displayMessage copyWithZone:a3];
  v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  [(GEOTransitServiceGap *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_appearsBeforeSuggestedRouteIndex != *((_DWORD *)v4 + 8)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
LABEL_19:
    char v6 = 0;
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_absStartTime != *((_DWORD *)v4 + 7)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_absEndTime != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_19;
  }
  displayMessage = self->_displayMessage;
  if ((unint64_t)displayMessage | *((void *)v4 + 2)) {
    char v6 = -[GEOFormattedString isEqual:](displayMessage, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  [(GEOTransitServiceGap *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(GEOFormattedString *)self->_displayMessage hash];
  }
  uint64_t v3 = 2654435761 * self->_appearsBeforeSuggestedRouteIndex;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_absStartTime;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_absEndTime;
  return v4 ^ v3 ^ v5 ^ [(GEOFormattedString *)self->_displayMessage hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = (unsigned int *)a3;
  [v8 readAll:0];
  uint64_t v4 = v8;
  char v5 = *((unsigned char *)v8 + 36);
  if ((v5 & 4) != 0)
  {
    self->_appearsBeforeSuggestedRouteIndex = v8[8];
    *(unsigned char *)&self->_flags |= 4u;
    char v5 = *((unsigned char *)v8 + 36);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v8[9] & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_absStartTime = v8[7];
  *(unsigned char *)&self->_flags |= 2u;
  if (v8[9])
  {
LABEL_4:
    self->_absEndTime = v8[6];
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_5:
  displayMessage = self->_displayMessage;
  uint64_t v7 = *((void *)v8 + 2);
  if (displayMessage)
  {
    if (!v7) {
      goto LABEL_14;
    }
    -[GEOFormattedString mergeFrom:](displayMessage, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_14;
    }
    -[GEOTransitServiceGap setDisplayMessage:](self, "setDisplayMessage:");
  }
  uint64_t v4 = v8;
LABEL_14:
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
    [(GEOTransitServiceGap *)self readAll:0];
    displayMessage = self->_displayMessage;
    [(GEOFormattedString *)displayMessage clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMessage, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (NSDate)startDate
{
  if ([(GEOTransitServiceGap *)self hasAbsStartTime])
  {
    BOOL v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)-[GEOTransitServiceGap absStartTime](self, "absStartTime"));
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  if ([(GEOTransitServiceGap *)self hasAbsEndTime])
  {
    BOOL v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)-[GEOTransitServiceGap absEndTime](self, "absEndTime"));
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSDate *)v3;
}

- (unint64_t)routeListInsertBeforeIndex
{
  if ([(GEOTransitServiceGap *)self hasAppearsBeforeSuggestedRouteIndex]) {
    return [(GEOTransitServiceGap *)self appearsBeforeSuggestedRouteIndex];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

@end