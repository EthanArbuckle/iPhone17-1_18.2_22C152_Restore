@interface GEOPairedDeviceProgress
+ (BOOL)isValid:(id)a3;
- (BOOL)hasByteCompletedCount;
- (BOOL)hasByteTotalCount;
- (BOOL)hasFractionCompleted;
- (BOOL)hasIsIndeterminate;
- (BOOL)hasKind;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIndeterminate;
- (BOOL)readFrom:(id)a3;
- (GEOPairedDeviceProgress)initWithDictionary:(id)a3;
- (GEOPairedDeviceProgress)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (float)fractionCompleted;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)kindAsString:(int)a3;
- (int)StringAsKind:(id)a3;
- (int)kind;
- (unint64_t)byteCompletedCount;
- (unint64_t)byteTotalCount;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setByteCompletedCount:(unint64_t)a3;
- (void)setByteTotalCount:(unint64_t)a3;
- (void)setFractionCompleted:(float)a3;
- (void)setHasByteCompletedCount:(BOOL)a3;
- (void)setHasByteTotalCount:(BOOL)a3;
- (void)setHasFractionCompleted:(BOOL)a3;
- (void)setHasIsIndeterminate:(BOOL)a3;
- (void)setHasKind:(BOOL)a3;
- (void)setIsIndeterminate:(BOOL)a3;
- (void)setKind:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPairedDeviceProgress

- (BOOL)isIndeterminate
{
  return self->_isIndeterminate;
}

- (void)setIsIndeterminate:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_isIndeterminate = a3;
}

- (void)setHasIsIndeterminate:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasIsIndeterminate
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (float)fractionCompleted
{
  return self->_fractionCompleted;
}

- (void)setFractionCompleted:(float)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_fractionCompleted = a3;
}

- (void)setHasFractionCompleted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasFractionCompleted
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (int)kind
{
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    return self->_kind;
  }
  else {
    return 1;
  }
}

- (void)setKind:(int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_kind = a3;
}

- (void)setHasKind:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasKind
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)kindAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"KIND_FILE";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsKind:(id)a3
{
  return 1;
}

- (unint64_t)byteTotalCount
{
  return self->_byteTotalCount;
}

- (void)setByteTotalCount:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_byteTotalCount = a3;
}

- (void)setHasByteTotalCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasByteTotalCount
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unint64_t)byteCompletedCount
{
  return self->_byteCompletedCount;
}

- (void)setByteCompletedCount:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_byteCompletedCount = a3;
}

- (void)setHasByteCompletedCount:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasByteCompletedCount
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPairedDeviceProgress;
  v4 = [(GEOPairedDeviceProgress *)&v8 description];
  v5 = [(GEOPairedDeviceProgress *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPairedDeviceProgress _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_19;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v6 = *(unsigned char *)(a1 + 44);
  if ((v6 & 0x10) != 0)
  {
    v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    if (a2) {
      objc_super v8 = @"isIndeterminate";
    }
    else {
      objc_super v8 = @"is_indeterminate";
    }
    [v4 setObject:v7 forKey:v8];

    char v6 = *(unsigned char *)(a1 + 44);
  }
  if ((v6 & 4) != 0)
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 32);
    v18 = [NSNumber numberWithFloat:v5];
    if (a2) {
      v19 = @"fractionCompleted";
    }
    else {
      v19 = @"fraction_completed";
    }
    [v4 setObject:v18 forKey:v19];

    char v6 = *(unsigned char *)(a1 + 44);
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_30;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_9;
  }
  if (*(_DWORD *)(a1 + 36) == 1)
  {
    v20 = @"KIND_FILE";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 36));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  [v4 setObject:v20 forKey:@"kind"];

  char v6 = *(unsigned char *)(a1 + 44);
  if ((v6 & 2) == 0)
  {
LABEL_10:
    if ((v6 & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_11;
  }
LABEL_30:
  v21 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
  if (a2) {
    v22 = @"byteTotalCount";
  }
  else {
    v22 = @"byte_total_count";
  }
  [v4 setObject:v21 forKey:v22];

  if (*(unsigned char *)(a1 + 44))
  {
LABEL_11:
    v9 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
    if (a2) {
      v10 = @"byteCompletedCount";
    }
    else {
      v10 = @"byte_completed_count";
    }
    [v4 setObject:v9 forKey:v10];
  }
LABEL_15:
  v11 = *(void **)(a1 + 8);
  if (v11)
  {
    v12 = [v11 dictionaryRepresentation];
    v13 = v12;
    if (a2)
    {
      v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __53__GEOPairedDeviceProgress__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E53D8860;
      id v15 = v14;
      id v24 = v15;
      [v13 enumerateKeysAndObjectsUsingBlock:v23];
      id v16 = v15;

      v13 = v16;
    }
    [v4 setObject:v13 forKey:@"Unknown Fields"];
  }
LABEL_19:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPairedDeviceProgress _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOPairedDeviceProgress__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPairedDeviceProgress)initWithDictionary:(id)a3
{
  return (GEOPairedDeviceProgress *)-[GEOPairedDeviceProgress _initWithDictionary:isJSON:](self, a3, 0);
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
  if (a3) {
    char v6 = @"isIndeterminate";
  }
  else {
    char v6 = @"is_indeterminate";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsIndeterminate:", objc_msgSend(v7, "BOOLValue"));
  }

  if (a3) {
    objc_super v8 = @"fractionCompleted";
  }
  else {
    objc_super v8 = @"fraction_completed";
  }
  v9 = [v5 objectForKeyedSubscript:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 floatValue];
    objc_msgSend(a1, "setFractionCompleted:");
  }

  id v10 = [v5 objectForKeyedSubscript:@"kind"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v10 isEqualToString:@"KIND_FILE"];
    uint64_t v11 = 1;
LABEL_17:
    [a1 setKind:v11];
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v10 intValue];
    goto LABEL_17;
  }
LABEL_18:

  if (a3) {
    v12 = @"byteTotalCount";
  }
  else {
    v12 = @"byte_total_count";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setByteTotalCount:", objc_msgSend(v13, "unsignedLongLongValue"));
  }

  if (a3) {
    v14 = @"byteCompletedCount";
  }
  else {
    v14 = @"byte_completed_count";
  }
  id v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setByteCompletedCount:", objc_msgSend(v15, "unsignedLongLongValue"));
  }

LABEL_29:
  return a1;
}

- (GEOPairedDeviceProgress)initWithJSON:(id)a3
{
  return (GEOPairedDeviceProgress *)-[GEOPairedDeviceProgress _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPairedDeviceProgressIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPairedDeviceProgressReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  if (*(unsigned char *)&self->_flags) {
LABEL_6:
  }
    PBDataWriterWriteUint64Field();
LABEL_7:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOPairedDeviceProgress *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    v5[40] = self->_isIndeterminate;
    v5[44] |= 0x10u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 8) = LODWORD(self->_fractionCompleted);
  v5[44] |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)v5 + 9) = self->_kind;
  v5[44] |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  *((void *)v5 + 3) = self->_byteTotalCount;
  v5[44] |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_6:
    *((void *)v5 + 2) = self->_byteCompletedCount;
    v5[44] |= 1u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *(unsigned char *)(v4 + 40) = self->_isIndeterminate;
    *(unsigned char *)(v4 + 44) |= 0x10u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v4 + 32) = self->_fractionCompleted;
  *(unsigned char *)(v4 + 44) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    *(void *)(v4 + 24) = self->_byteTotalCount;
    *(unsigned char *)(v4 + 44) |= 2u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_10:
  *(_DWORD *)(v4 + 36) = self->_kind;
  *(unsigned char *)(v4 + 44) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if (flags)
  {
LABEL_6:
    *(void *)(v4 + 16) = self->_byteCompletedCount;
    *(unsigned char *)(v4 + 44) |= 1u;
  }
LABEL_7:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  [(GEOPairedDeviceProgress *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x10) != 0)
    {
      if (self->_isIndeterminate)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_29;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_10;
      }
    }
LABEL_29:
    BOOL v5 = 0;
    goto LABEL_30;
  }
  if ((*((unsigned char *)v4 + 44) & 0x10) != 0) {
    goto LABEL_29;
  }
LABEL_10:
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_fractionCompleted != *((float *)v4 + 8)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0 || self->_kind != *((_DWORD *)v4 + 9)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_byteTotalCount != *((void *)v4 + 3)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_29;
  }
  BOOL v5 = (*((unsigned char *)v4 + 44) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_byteCompletedCount != *((void *)v4 + 2)) {
      goto LABEL_29;
    }
    BOOL v5 = 1;
  }
LABEL_30:

  return v5;
}

- (unint64_t)hash
{
  [(GEOPairedDeviceProgress *)self readAll:1];
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    uint64_t v4 = 2654435761 * self->_isIndeterminate;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float fractionCompleted = self->_fractionCompleted;
  double v6 = fractionCompleted;
  if (fractionCompleted < 0.0) {
    double v6 = -fractionCompleted;
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
LABEL_11:
  if ((flags & 8) == 0)
  {
    uint64_t v10 = 0;
    if ((flags & 2) != 0) {
      goto LABEL_13;
    }
LABEL_16:
    unint64_t v11 = 0;
    if (flags) {
      goto LABEL_14;
    }
LABEL_17:
    unint64_t v12 = 0;
    return v9 ^ v4 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v10 = 2654435761 * self->_kind;
  if ((flags & 2) == 0) {
    goto LABEL_16;
  }
LABEL_13:
  unint64_t v11 = 2654435761u * self->_byteTotalCount;
  if ((flags & 1) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  unint64_t v12 = 2654435761u * self->_byteCompletedCount;
  return v9 ^ v4 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 44);
  if ((v4 & 0x10) != 0)
  {
    self->_isIndeterminate = *((unsigned char *)v5 + 40);
    *(unsigned char *)&self->_flags |= 0x10u;
    char v4 = *((unsigned char *)v5 + 44);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v5 + 44) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_float fractionCompleted = *((float *)v5 + 8);
  *(unsigned char *)&self->_flags |= 4u;
  char v4 = *((unsigned char *)v5 + 44);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_kind = *((_DWORD *)v5 + 9);
  *(unsigned char *)&self->_flags |= 8u;
  char v4 = *((unsigned char *)v5 + 44);
  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_byteTotalCount = *((void *)v5 + 3);
  *(unsigned char *)&self->_flags |= 2u;
  if (*((unsigned char *)v5 + 44))
  {
LABEL_6:
    self->_byteCompletedCount = *((void *)v5 + 2);
    *(unsigned char *)&self->_flags |= 1u;
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
    [(GEOPairedDeviceProgress *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end