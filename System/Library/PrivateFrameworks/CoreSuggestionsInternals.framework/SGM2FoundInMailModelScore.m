@interface SGM2FoundInMailModelScore
- (BOOL)correct;
- (BOOL)hasContactDetail;
- (BOOL)hasCorrect;
- (BOOL)hasKey;
- (BOOL)hasMode;
- (BOOL)hasModel;
- (BOOL)hasResult;
- (BOOL)hasSupervision;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)result;
- (NSString)key;
- (id)contactDetailAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)modeAsString:(int)a3;
- (id)modelAsString:(int)a3;
- (id)supervisionAsString:(int)a3;
- (int)StringAsContactDetail:(id)a3;
- (int)StringAsMode:(id)a3;
- (int)StringAsModel:(id)a3;
- (int)StringAsSupervision:(id)a3;
- (int)contactDetail;
- (int)mode;
- (int)model;
- (int)supervision;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContactDetail:(int)a3;
- (void)setCorrect:(BOOL)a3;
- (void)setHasContactDetail:(BOOL)a3;
- (void)setHasCorrect:(BOOL)a3;
- (void)setHasMode:(BOOL)a3;
- (void)setHasModel:(BOOL)a3;
- (void)setHasResult:(BOOL)a3;
- (void)setHasSupervision:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setMode:(int)a3;
- (void)setModel:(int)a3;
- (void)setResult:(BOOL)a3;
- (void)setSupervision:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2FoundInMailModelScore

- (void).cxx_destruct
{
}

- (BOOL)correct
{
  return self->_correct;
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
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[SGM2FoundInMailModelScore setKey:](self, "setKey:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 4) != 0)
  {
    self->_model = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 0x20) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_contactDetail = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_result = *((unsigned char *)v4 + 37);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_correct = *((unsigned char *)v4 + 36);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_17:
  self->_mode = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
LABEL_9:
    self->_supervision = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_10:
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v4 = 2654435761 * self->_model;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_contactDetail;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_result;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_correct;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_11:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_mode;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v9 = 2654435761 * self->_supervision;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_39;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_39;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_model != *((_DWORD *)v4 + 7)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_39;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_contactDetail != *((_DWORD *)v4 + 2)) {
      goto LABEL_39;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x20) == 0) {
      goto LABEL_39;
    }
    if (self->_result)
    {
      if (!*((unsigned char *)v4 + 37)) {
        goto LABEL_39;
      }
    }
    else if (*((unsigned char *)v4 + 37))
    {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x20) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x10) != 0)
    {
      if (self->_correct)
      {
        if (!*((unsigned char *)v4 + 36)) {
          goto LABEL_39;
        }
        goto LABEL_30;
      }
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_30;
      }
    }
LABEL_39:
    BOOL v6 = 0;
    goto LABEL_40;
  }
  if ((*((unsigned char *)v4 + 40) & 0x10) != 0) {
    goto LABEL_39;
  }
LABEL_30:
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_mode != *((_DWORD *)v4 + 6)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_39;
  }
  BOOL v6 = (*((unsigned char *)v4 + 40) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_supervision != *((_DWORD *)v4 + 8)) {
      goto LABEL_39;
    }
    BOOL v6 = 1;
  }
LABEL_40:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_model;
    *(unsigned char *)(v5 + 40) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 8) = self->_contactDetail;
  *(unsigned char *)(v5 + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *(unsigned char *)(v5 + 37) = self->_result;
  *(unsigned char *)(v5 + 40) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    *(_DWORD *)(v5 + 24) = self->_mode;
    *(unsigned char *)(v5 + 40) |= 2u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return (id)v5;
    }
    goto LABEL_7;
  }
LABEL_12:
  *(unsigned char *)(v5 + 36) = self->_correct;
  *(unsigned char *)(v5 + 40) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_13;
  }
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    *(_DWORD *)(v5 + 32) = self->_supervision;
    *(unsigned char *)(v5 + 40) |= 8u;
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
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 7) = self->_model;
    *((unsigned char *)v4 + 40) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 2) = self->_contactDetail;
  *((unsigned char *)v4 + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((unsigned char *)v4 + 37) = self->_result;
  *((unsigned char *)v4 + 40) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((unsigned char *)v4 + 36) = self->_correct;
  *((unsigned char *)v4 + 40) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)v4 + 6) = self->_mode;
  *((unsigned char *)v4 + 40) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_9:
    *((_DWORD *)v4 + 8) = self->_supervision;
    *((unsigned char *)v4 + 40) |= 8u;
  }
LABEL_10:
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
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_9:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_10:
}

- (BOOL)readFrom:(id)a3
{
  return SGM2FoundInMailModelScoreReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 4) != 0)
  {
    uint64_t model = self->_model;
    if (model >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_model);
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v8 = off_1E65B55A8[model];
    }
    [v4 setObject:v8 forKey:@"model"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t contactDetail = self->_contactDetail;
    if (contactDetail >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_contactDetail);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E65B55C8[contactDetail];
    }
    [v4 setObject:v10 forKey:@"contactDetail"];

    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    v11 = [NSNumber numberWithBool:self->_result];
    [v4 setObject:v11 forKey:@"result"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_15:
      if ((has & 2) == 0) {
        goto LABEL_16;
      }
LABEL_20:
      uint64_t mode = self->_mode;
      if (mode >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_mode);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = off_1E65B55F0[mode];
      }
      [v4 setObject:v14 forKey:@"mode"];

      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_28;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_15;
  }
  v12 = [NSNumber numberWithBool:self->_correct];
  [v4 setObject:v12 forKey:@"correct"];

  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_20;
  }
LABEL_16:
  if ((has & 8) != 0)
  {
LABEL_24:
    uint64_t supervision = self->_supervision;
    if (supervision >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_supervision);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E65B5608[supervision];
    }
    [v4 setObject:v16 forKey:@"supervision"];
  }
LABEL_28:
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2FoundInMailModelScore;
  id v4 = [(SGM2FoundInMailModelScore *)&v8 description];
  uint64_t v5 = [(SGM2FoundInMailModelScore *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsSupervision:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMFoundInMailSupervisionTypeNone"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMFoundInMailSupervisionTypeContact"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMFoundInMailSupervisionTypeAppleContact"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMFoundInMailSupervisionTypePreviousModel"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)supervisionAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65B5608[a3];
  }
  return v3;
}

- (BOOL)hasSupervision
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasSupervision:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setSupervision:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uint64_t supervision = a3;
}

- (int)supervision
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_supervision;
  }
  else {
    return 0;
  }
}

- (int)StringAsMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGFoundInMailModelModeTraining"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGFoundInMailModelModeEvaluation"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGFoundInMailModelModePrediction"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)modeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65B55F0[a3];
  }
  return v3;
}

- (BOOL)hasMode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setMode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t mode = a3;
}

- (int)mode
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_mode;
  }
  else {
    return 0;
  }
}

- (BOOL)hasCorrect
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasCorrect:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setCorrect:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_correct = a3;
}

- (BOOL)hasResult
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasResult:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setResult:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_result = a3;
}

- (int)StringAsContactDetail:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMContactDetailTypeEmail"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailTypePhone"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailTypeAddress"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailTypeOther"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailTypeBirthday"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)contactDetailAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65B55C8[a3];
  }
  return v3;
}

- (BOOL)hasContactDetail
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasContactDetail:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setContactDetail:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t contactDetail = a3;
}

- (int)contactDetail
{
  if (*(unsigned char *)&self->_has) {
    return self->_contactDetail;
  }
  else {
    return 0;
  }
}

- (int)StringAsModel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMFoundInMailModelTypeRegex"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMFoundInMailModelTypeLogistic"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMFoundInMailModelTypeLinear"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMFoundInMailModelTypeNaiveBayes"])
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
    id v3 = off_1E65B55A8[a3];
  }
  return v3;
}

- (BOOL)hasModel
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasModel:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setModel:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_uint64_t model = a3;
}

- (int)model
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
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
    return (NSString *)@"FoundInMailModelScore";
  }
}

@end