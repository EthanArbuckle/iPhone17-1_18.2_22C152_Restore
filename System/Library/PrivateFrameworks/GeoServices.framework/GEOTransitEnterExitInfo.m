@interface GEOTransitEnterExitInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)displayStop;
- (BOOL)hasAccessPointIndex;
- (BOOL)hasDisplayStop;
- (BOOL)hasStopIndex;
- (BOOL)hasTransferTime;
- (BOOL)hasUncertainArrival;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)uncertainArrival;
- (GEOTransitEnterExitInfo)initWithDictionary:(id)a3;
- (GEOTransitEnterExitInfo)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)accessPointIndex;
- (unsigned)stopIndex;
- (unsigned)transferTime;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccessPointIndex:(unsigned int)a3;
- (void)setDisplayStop:(BOOL)a3;
- (void)setHasAccessPointIndex:(BOOL)a3;
- (void)setHasDisplayStop:(BOOL)a3;
- (void)setHasStopIndex:(BOOL)a3;
- (void)setHasTransferTime:(BOOL)a3;
- (void)setHasUncertainArrival:(BOOL)a3;
- (void)setStopIndex:(unsigned int)a3;
- (void)setTransferTime:(unsigned int)a3;
- (void)setUncertainArrival:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitEnterExitInfo

- (unsigned)accessPointIndex
{
  return self->_accessPointIndex;
}

- (void)setAccessPointIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_accessPointIndex = a3;
}

- (void)setHasAccessPointIndex:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAccessPointIndex
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)stopIndex
{
  return self->_stopIndex;
}

- (void)setStopIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_stopIndex = a3;
}

- (void)setHasStopIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStopIndex
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)displayStop
{
  return self->_displayStop;
}

- (void)setDisplayStop:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_displayStop = a3;
}

- (void)setHasDisplayStop:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasDisplayStop
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (unsigned)transferTime
{
  return self->_transferTime;
}

- (void)setTransferTime:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_transferTime = a3;
}

- (void)setHasTransferTime:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTransferTime
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)uncertainArrival
{
  return self->_uncertainArrival;
}

- (void)setUncertainArrival:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_uncertainArrival = a3;
}

- (void)setHasUncertainArrival:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasUncertainArrival
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitEnterExitInfo;
  v4 = [(GEOTransitEnterExitInfo *)&v8 description];
  v5 = [(GEOTransitEnterExitInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitEnterExitInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_15;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 32);
  if (v5)
  {
    v15 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
    if (a2) {
      v16 = @"accessPointIndex";
    }
    else {
      v16 = @"access_point_index";
    }
    [v4 setObject:v15 forKey:v16];

    char v5 = *(unsigned char *)(a1 + 32);
    if ((v5 & 2) == 0)
    {
LABEL_4:
      if ((v5 & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_26;
    }
  }
  else if ((*(unsigned char *)(a1 + 32) & 2) == 0)
  {
    goto LABEL_4;
  }
  v17 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
  if (a2) {
    v18 = @"stopIndex";
  }
  else {
    v18 = @"stop_index";
  }
  [v4 setObject:v17 forKey:v18];

  char v5 = *(unsigned char *)(a1 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_26:
  v19 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 28)];
  if (a2) {
    v20 = @"displayStop";
  }
  else {
    v20 = @"display_stop";
  }
  [v4 setObject:v19 forKey:v20];

  char v5 = *(unsigned char *)(a1 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
LABEL_30:
  v21 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
  if (a2) {
    v22 = @"transferTime";
  }
  else {
    v22 = @"transfer_time";
  }
  [v4 setObject:v21 forKey:v22];

  if ((*(unsigned char *)(a1 + 32) & 0x10) != 0)
  {
LABEL_7:
    v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 29)];
    if (a2) {
      v7 = @"uncertainArrival";
    }
    else {
      v7 = @"uncertain_arrival";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_11:
  objc_super v8 = *(void **)(a1 + 8);
  if (v8)
  {
    v9 = [v8 dictionaryRepresentation];
    v10 = v9;
    if (a2)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __53__GEOTransitEnterExitInfo__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E53D8860;
      id v12 = v11;
      id v24 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v23];
      id v13 = v12;

      v10 = v13;
    }
    [v4 setObject:v10 forKey:@"Unknown Fields"];
  }
LABEL_15:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitEnterExitInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOTransitEnterExitInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitEnterExitInfo)initWithDictionary:(id)a3
{
  return (GEOTransitEnterExitInfo *)-[GEOTransitEnterExitInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"accessPointIndex";
      }
      else {
        v6 = @"access_point_index";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAccessPointIndex:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"stopIndex";
      }
      else {
        objc_super v8 = @"stop_index";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStopIndex:", objc_msgSend(v9, "unsignedIntValue"));
      }

      if (a3) {
        id v10 = @"displayStop";
      }
      else {
        id v10 = @"display_stop";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDisplayStop:", objc_msgSend(v11, "BOOLValue"));
      }

      if (a3) {
        id v12 = @"transferTime";
      }
      else {
        id v12 = @"transfer_time";
      }
      id v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTransferTime:", objc_msgSend(v13, "unsignedIntValue"));
      }

      if (a3) {
        v14 = @"uncertainArrival";
      }
      else {
        v14 = @"uncertain_arrival";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setUncertainArrival:", objc_msgSend(v15, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOTransitEnterExitInfo)initWithJSON:(id)a3
{
  return (GEOTransitEnterExitInfo *)-[GEOTransitEnterExitInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitEnterExitInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitEnterExitInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOTransitEnterExitInfo *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[4] = self->_accessPointIndex;
    *((unsigned char *)v5 + 32) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[5] = self->_stopIndex;
  *((unsigned char *)v5 + 32) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((unsigned char *)v5 + 28) = self->_displayStop;
  *((unsigned char *)v5 + 32) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v5[6] = self->_transferTime;
  *((unsigned char *)v5 + 32) |= 4u;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_6:
    *((unsigned char *)v5 + 29) = self->_uncertainArrival;
    *((unsigned char *)v5 + 32) |= 0x10u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v4 + 16) = self->_accessPointIndex;
    *(unsigned char *)(v4 + 32) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 20) = self->_stopIndex;
  *(unsigned char *)(v4 + 32) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    *(_DWORD *)(v4 + 24) = self->_transferTime;
    *(unsigned char *)(v4 + 32) |= 4u;
    if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_10:
  *(unsigned char *)(v4 + 28) = self->_displayStop;
  *(unsigned char *)(v4 + 32) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((flags & 0x10) != 0)
  {
LABEL_6:
    *(unsigned char *)(v4 + 29) = self->_uncertainArrival;
    *(unsigned char *)(v4 + 32) |= 0x10u;
  }
LABEL_7:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  [(GEOTransitEnterExitInfo *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_accessPointIndex != *((_DWORD *)v4 + 4)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_stopIndex != *((_DWORD *)v4 + 5)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0) {
      goto LABEL_27;
    }
    if (self->_displayStop)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_transferTime != *((_DWORD *)v4 + 6)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_27;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 0x10) == 0;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x10) != 0)
    {
      if (self->_uncertainArrival)
      {
        if (!*((unsigned char *)v4 + 29)) {
          goto LABEL_27;
        }
      }
      else if (*((unsigned char *)v4 + 29))
      {
        goto LABEL_27;
      }
      BOOL v5 = 1;
      goto LABEL_28;
    }
LABEL_27:
    BOOL v5 = 0;
  }
LABEL_28:

  return v5;
}

- (unint64_t)hash
{
  [(GEOTransitEnterExitInfo *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_accessPointIndex;
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_stopIndex;
      if ((*(unsigned char *)&self->_flags & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_displayStop;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
LABEL_9:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_transferTime;
  if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_uncertainArrival;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 32);
  if (v4)
  {
    self->_accessPointIndex = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 32);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v5 + 32) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_stopIndex = *((_DWORD *)v5 + 5);
  *(unsigned char *)&self->_flags |= 2u;
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_displayStop = *((unsigned char *)v5 + 28);
  *(unsigned char *)&self->_flags |= 8u;
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 4) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_transferTime = *((_DWORD *)v5 + 6);
  *(unsigned char *)&self->_flags |= 4u;
  if ((*((unsigned char *)v5 + 32) & 0x10) != 0)
  {
LABEL_6:
    self->_uncertainArrival = *((unsigned char *)v5 + 29);
    *(unsigned char *)&self->_flags |= 0x10u;
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
    [(GEOTransitEnterExitInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end