@interface GEORPCorrectedFlag
+ (BOOL)isValid:(id)a3;
- (BOOL)correctedValue;
- (BOOL)hasCorrectedValue;
- (BOOL)hasFlag;
- (BOOL)hasOriginalValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)originalValue;
- (BOOL)readFrom:(id)a3;
- (GEORPCorrectedFlag)initWithDictionary:(id)a3;
- (GEORPCorrectedFlag)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)flagAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsFlag:(id)a3;
- (int)flag;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCorrectedValue:(BOOL)a3;
- (void)setFlag:(int)a3;
- (void)setHasCorrectedValue:(BOOL)a3;
- (void)setHasFlag:(BOOL)a3;
- (void)setHasOriginalValue:(BOOL)a3;
- (void)setOriginalValue:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPCorrectedFlag

- (int)flag
{
  if (*(unsigned char *)&self->_flags) {
    return self->_flag;
  }
  else {
    return 0;
  }
}

- (void)setFlag:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_flag = a3;
}

- (void)setHasFlag:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasFlag
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)flagAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"FLAG_TYPE_ACCEPTS_APPLE_PAY";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"FLAG_TYPE_UNKNOWN";
  }
  return v4;
}

- (int)StringAsFlag:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FLAG_TYPE_UNKNOWN"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"FLAG_TYPE_ACCEPTS_APPLE_PAY"];
  }

  return v4;
}

- (BOOL)originalValue
{
  return self->_originalValue;
}

- (void)setOriginalValue:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_originalValue = a3;
}

- (void)setHasOriginalValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasOriginalValue
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)correctedValue
{
  return self->_correctedValue;
}

- (void)setCorrectedValue:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_correctedValue = a3;
}

- (void)setHasCorrectedValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCorrectedValue
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPCorrectedFlag;
  int v4 = [(GEORPCorrectedFlag *)&v8 description];
  v5 = [(GEORPCorrectedFlag *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPCorrectedFlag _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 16);
    if (v5)
    {
      int v6 = *(_DWORD *)(a1 + 8);
      if (v6)
      {
        if (v6 == 1)
        {
          v7 = @"FLAG_TYPE_ACCEPTS_APPLE_PAY";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 8));
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v7 = @"FLAG_TYPE_UNKNOWN";
      }
      [v4 setObject:v7 forKey:@"flag"];

      char v5 = *(unsigned char *)(a1 + 16);
    }
    if ((v5 & 4) != 0)
    {
      objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 13)];
      if (a2) {
        v9 = @"originalValue";
      }
      else {
        v9 = @"original_value";
      }
      [v4 setObject:v8 forKey:v9];

      char v5 = *(unsigned char *)(a1 + 16);
    }
    if ((v5 & 2) != 0)
    {
      v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 12)];
      if (a2) {
        v11 = @"correctedValue";
      }
      else {
        v11 = @"corrected_value";
      }
      [v4 setObject:v10 forKey:v11];
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
  return -[GEORPCorrectedFlag _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPCorrectedFlag)initWithDictionary:(id)a3
{
  return (GEORPCorrectedFlag *)-[GEORPCorrectedFlag _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_22;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_22;
  }
  int v6 = [v5 objectForKeyedSubscript:@"flag"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"FLAG_TYPE_UNKNOWN"]) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = [v7 isEqualToString:@"FLAG_TYPE_ACCEPTS_APPLE_PAY"];
    }

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_10:
    [a1 setFlag:v8];
  }

  if (a3) {
    v9 = @"originalValue";
  }
  else {
    v9 = @"original_value";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setOriginalValue:", objc_msgSend(v10, "BOOLValue"));
  }

  if (a3) {
    v11 = @"correctedValue";
  }
  else {
    v11 = @"corrected_value";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCorrectedValue:", objc_msgSend(v12, "BOOLValue"));
  }

LABEL_22:
  return a1;
}

- (GEORPCorrectedFlag)initWithJSON:(id)a3
{
  return (GEORPCorrectedFlag *)-[GEORPCorrectedFlag _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPCorrectedFlagIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPCorrectedFlagReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
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
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEORPCorrectedFlag *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[2] = self->_flag;
    *((unsigned char *)v5 + 16) |= 1u;
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
  *((unsigned char *)v5 + 13) = self->_originalValue;
  *((unsigned char *)v5 + 16) |= 4u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    *((unsigned char *)v5 + 12) = self->_correctedValue;
    *((unsigned char *)v5 + 16) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)result + 2) = self->_flag;
    *((unsigned char *)result + 16) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 13) = self->_originalValue;
  *((unsigned char *)result + 16) |= 4u;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    return result;
  }
LABEL_4:
  *((unsigned char *)result + 12) = self->_correctedValue;
  *((unsigned char *)result + 16) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  [(GEORPCorrectedFlag *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_flag != *((_DWORD *)v4 + 2)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 4) == 0) {
      goto LABEL_17;
    }
    if (self->_originalValue)
    {
      if (!*((unsigned char *)v4 + 13)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)v4 + 13))
    {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 4) != 0)
  {
    goto LABEL_17;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) != 0)
    {
      if (self->_correctedValue)
      {
        if (!*((unsigned char *)v4 + 12)) {
          goto LABEL_17;
        }
      }
      else if (*((unsigned char *)v4 + 12))
      {
        goto LABEL_17;
      }
      BOOL v5 = 1;
      goto LABEL_18;
    }
LABEL_17:
    BOOL v5 = 0;
  }
LABEL_18:

  return v5;
}

- (unint64_t)hash
{
  [(GEORPCorrectedFlag *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v3 = 2654435761 * self->_flag;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_originalValue;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_correctedValue;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 16);
  if (v4)
  {
    self->_flag = *((_DWORD *)v5 + 2);
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 16);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v5 + 16) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_originalValue = *((unsigned char *)v5 + 13);
  *(unsigned char *)&self->_flags |= 4u;
  if ((*((unsigned char *)v5 + 16) & 2) != 0)
  {
LABEL_4:
    self->_correctedValue = *((unsigned char *)v5 + 12);
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_5:
}

@end