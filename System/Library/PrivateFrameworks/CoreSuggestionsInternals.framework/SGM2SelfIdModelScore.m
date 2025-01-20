@interface SGM2SelfIdModelScore
- (BOOL)hasKey;
- (BOOL)hasModel;
- (BOOL)hasResult;
- (BOOL)hasSupervision;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)result;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)modelAsString:(int)a3;
- (id)supervisionAsString:(int)a3;
- (int)StringAsModel:(id)a3;
- (int)StringAsSupervision:(id)a3;
- (int)model;
- (int)supervision;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasModel:(BOOL)a3;
- (void)setHasResult:(BOOL)a3;
- (void)setHasSupervision:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setModel:(int)a3;
- (void)setResult:(BOOL)a3;
- (void)setSupervision:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2SelfIdModelScore

- (void).cxx_destruct
{
}

- (BOOL)result
{
  return self->_result;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[SGM2SelfIdModelScore setKey:](self, "setKey:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 28);
  if (v5)
  {
    self->_model = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_result = *((unsigned char *)v4 + 24);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_6:
    self->_supervision = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_7:
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_model;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_result;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_supervision;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_model != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) != 0)
    {
      if (self->_result)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_21;
        }
        goto LABEL_17;
      }
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_17;
      }
    }
LABEL_21:
    BOOL v6 = 0;
    goto LABEL_22;
  }
  if ((*((unsigned char *)v4 + 28) & 4) != 0) {
    goto LABEL_21;
  }
LABEL_17:
  BOOL v6 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_supervision != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
    BOOL v6 = 1;
  }
LABEL_22:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(unsigned char *)(v5 + 24) = self->_result;
    *(unsigned char *)(v5 + 28) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 16) = self->_model;
  *(unsigned char *)(v5 + 28) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 20) = self->_supervision;
    *(unsigned char *)(v5 + 28) |= 2u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_key)
  {
    id v6 = v4;
    objc_msgSend(v4, "setKey:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 4) = self->_model;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((unsigned char *)v4 + 24) = self->_result;
  *((unsigned char *)v4 + 28) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 5) = self->_supervision;
    *((unsigned char *)v4 + 28) |= 2u;
  }
LABEL_7:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_7:
}

- (BOOL)readFrom:(id)a3
{
  return SGM2SelfIdModelScoreReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    v9 = [NSNumber numberWithBool:self->_result];
    [v4 setObject:v9 forKey:@"result"];

    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_16;
    }
LABEL_12:
    uint64_t supervision = self->_supervision;
    if (supervision >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_supervision);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E65B51E8[supervision];
    }
    [v4 setObject:v11 forKey:@"supervision"];

    goto LABEL_16;
  }
  uint64_t model = self->_model;
  if (model >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_model);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E65B51C8[model];
  }
  [v4 setObject:v8 forKey:@"model"];

  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 2) != 0) {
    goto LABEL_12;
  }
LABEL_16:
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2SelfIdModelScore;
  id v4 = [(SGM2SelfIdModelScore *)&v8 description];
  uint64_t v5 = [(SGM2SelfIdModelScore *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsSupervision:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMSelfIdSupervisionTypeNone"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMSelfIdSupervisionTypeContact"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMSelfIdSupervisionTypeAppleContact"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMSelfIdSupervisionTypePreviousModel"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMSelfIdSupervisionTypeRegex"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)supervisionAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65B51E8[a3];
  }
  return v3;
}

- (BOOL)hasSupervision
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasSupervision:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setSupervision:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t supervision = a3;
}

- (int)supervision
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_supervision;
  }
  else {
    return 0;
  }
}

- (BOOL)hasResult
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasResult:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setResult:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_result = a3;
}

- (int)StringAsModel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMSelfIdModelTypeRegex"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMSelfIdModelTypeLogistic"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMSelfIdModelTypeLinear"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMSelfIdModelTypeCoreNLP"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)modelAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65B51C8[a3];
  }
  return v3;
}

- (BOOL)hasModel
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasModel:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setModel:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t model = a3;
}

- (int)model
{
  if (*(unsigned char *)&self->_has) {
    return self->_model;
  }
  else {
    return 0;
  }
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (NSString)key
{
  if (self->_key) {
    return self->_key;
  }
  else {
    return (NSString *)@"SelfIdModelScore";
  }
}

@end