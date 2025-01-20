@interface SGM2HarvestCost
- (BOOL)harvestedOnBattery;
- (BOOL)hasDocumentSource;
- (BOOL)hasHarvestSource;
- (BOOL)hasHarvestedOnBattery;
- (BOOL)hasHighPriority;
- (BOOL)hasReceivedOnBattery;
- (BOOL)highPriority;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)receivedOnBattery;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)documentSourceAsString:(int)a3;
- (id)harvestSourceAsString:(int)a3;
- (int)StringAsDocumentSource:(id)a3;
- (int)StringAsHarvestSource:(id)a3;
- (int)documentSource;
- (int)harvestSource;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDocumentSource:(int)a3;
- (void)setHarvestSource:(int)a3;
- (void)setHarvestedOnBattery:(BOOL)a3;
- (void)setHasDocumentSource:(BOOL)a3;
- (void)setHasHarvestSource:(BOOL)a3;
- (void)setHasHarvestedOnBattery:(BOOL)a3;
- (void)setHasHighPriority:(BOOL)a3;
- (void)setHasReceivedOnBattery:(BOOL)a3;
- (void)setHighPriority:(BOOL)a3;
- (void)setReceivedOnBattery:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2HarvestCost

- (BOOL)harvestedOnBattery
{
  return self->_harvestedOnBattery;
}

- (BOOL)receivedOnBattery
{
  return self->_receivedOnBattery;
}

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if (v5)
  {
    self->_documentSource = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 20);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_highPriority = *((unsigned char *)v4 + 17);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_receivedOnBattery = *((unsigned char *)v4 + 18);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_harvestedOnBattery = *((unsigned char *)v4 + 16);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
LABEL_6:
    self->_harvestSource = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_7:
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_documentSource;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_highPriority;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_receivedOnBattery;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_harvestedOnBattery;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_harvestSource;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_documentSource != *((_DWORD *)v4 + 2)) {
      goto LABEL_35;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 8) == 0) {
      goto LABEL_35;
    }
    if (self->_highPriority)
    {
      if (!*((unsigned char *)v4 + 17)) {
        goto LABEL_35;
      }
    }
    else if (*((unsigned char *)v4 + 17))
    {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 8) != 0)
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 0x10) == 0) {
      goto LABEL_35;
    }
    if (self->_receivedOnBattery)
    {
      if (!*((unsigned char *)v4 + 18)) {
        goto LABEL_35;
      }
    }
    else if (*((unsigned char *)v4 + 18))
    {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 0x10) != 0)
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) != 0)
    {
      if (self->_harvestedOnBattery)
      {
        if (!*((unsigned char *)v4 + 16)) {
          goto LABEL_35;
        }
        goto LABEL_31;
      }
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_31;
      }
    }
LABEL_35:
    BOOL v5 = 0;
    goto LABEL_36;
  }
  if ((*((unsigned char *)v4 + 20) & 4) != 0) {
    goto LABEL_35;
  }
LABEL_31:
  BOOL v5 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_harvestSource != *((_DWORD *)v4 + 3)) {
      goto LABEL_35;
    }
    BOOL v5 = 1;
  }
LABEL_36:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_documentSource;
    *((unsigned char *)result + 20) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 17) = self->_highPriority;
  *((unsigned char *)result + 20) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((unsigned char *)result + 18) = self->_receivedOnBattery;
  *((unsigned char *)result + 20) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((unsigned char *)result + 16) = self->_harvestedOnBattery;
  *((unsigned char *)result + 20) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 3) = self->_harvestSource;
  *((unsigned char *)result + 20) |= 2u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_documentSource;
    *((unsigned char *)v4 + 20) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v4 + 17) = self->_highPriority;
  *((unsigned char *)v4 + 20) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((unsigned char *)v4 + 18) = self->_receivedOnBattery;
  *((unsigned char *)v4 + 20) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  *((unsigned char *)v4 + 16) = self->_harvestedOnBattery;
  *((unsigned char *)v4 + 20) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    v4[3] = self->_harvestSource;
    *((unsigned char *)v4 + 20) |= 2u;
  }
LABEL_7:
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
}

- (BOOL)readFrom:(id)a3
{
  return SGM2HarvestCostReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t documentSource = self->_documentSource;
    if (documentSource >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_documentSource);
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v6 = off_1E65B63B8[documentSource];
    }
    [v3 setObject:v6 forKey:@"documentSource"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_highPriority];
    [v3 setObject:v7 forKey:@"highPriority"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_8:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
LABEL_13:
      v9 = [NSNumber numberWithBool:self->_harvestedOnBattery];
      [v3 setObject:v9 forKey:@"harvestedOnBattery"];

      if ((*(unsigned char *)&self->_has & 2) == 0) {
        goto LABEL_18;
      }
LABEL_14:
      uint64_t harvestSource = self->_harvestSource;
      if (harvestSource >= 9)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_harvestSource);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = off_1E65B63F8[harvestSource];
      }
      [v3 setObject:v11 forKey:@"harvestSource"];

      goto LABEL_18;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_8;
  }
  v8 = [NSNumber numberWithBool:self->_receivedOnBattery];
  [v3 setObject:v8 forKey:@"receivedOnBattery"];

  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_13;
  }
LABEL_9:
  if ((has & 2) != 0) {
    goto LABEL_14;
  }
LABEL_18:
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2HarvestCost;
  id v4 = [(SGM2HarvestCost *)&v8 description];
  id v5 = [(SGM2HarvestCost *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsHarvestSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGM2HarvestSourceInMemory"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGM2HarvestSourceRealtime"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGM2HarvestSourceRealtimeNoBudget"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGM2HarvestSourceOnDiskOverflow"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGM2HarvestSourceOnDiskNoBudget"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SGM2HarvestSourceOnDiskTimeout"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SGM2HarvestSourceOnDiskClosed"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SGM2HarvestSourceOnDiskLegacy"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SGM2HarvestSourceProactiveHarvesting"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)harvestSourceAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65B63F8[a3];
  }
  return v3;
}

- (BOOL)hasHarvestSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasHarvestSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setHarvestSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t harvestSource = a3;
}

- (int)harvestSource
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_harvestSource;
  }
  else {
    return 0;
  }
}

- (BOOL)hasHarvestedOnBattery
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasHarvestedOnBattery:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setHarvestedOnBattery:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_harvestedOnBattery = a3;
}

- (BOOL)hasReceivedOnBattery
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasReceivedOnBattery:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setReceivedOnBattery:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_receivedOnBattery = a3;
}

- (BOOL)hasHighPriority
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasHighPriority:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setHighPriority:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_highPriority = a3;
}

- (int)StringAsDocumentSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"otherFirstParty"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"otherThirdParty"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Safari"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"News"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Mail"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Messages"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Notes"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Reminders"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)documentSourceAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65B63B8[a3];
  }
  return v3;
}

- (BOOL)hasDocumentSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDocumentSource:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDocumentSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t documentSource = a3;
}

- (int)documentSource
{
  if (*(unsigned char *)&self->_has) {
    return self->_documentSource;
  }
  else {
    return 0;
  }
}

@end