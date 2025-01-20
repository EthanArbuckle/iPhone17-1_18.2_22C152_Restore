@interface BLTPBSetNotificationsCriticalAlertRequest
- (BOOL)hasCriticalAlertSetting;
- (BOOL)hasSectionID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)sectionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)criticalAlertSettingAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCriticalAlertSetting:(id)a3;
- (int)criticalAlertSetting;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCriticalAlertSetting:(int)a3;
- (void)setHasCriticalAlertSetting:(BOOL)a3;
- (void)setSectionID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBSetNotificationsCriticalAlertRequest

- (int)criticalAlertSetting
{
  if (*(unsigned char *)&self->_has) {
    return self->_criticalAlertSetting;
  }
  else {
    return 0;
  }
}

- (void)setCriticalAlertSetting:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_criticalAlertSetting = a3;
}

- (void)setHasCriticalAlertSetting:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCriticalAlertSetting
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)criticalAlertSettingAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_264684000[a3];
  }
  return v3;
}

- (int)StringAsCriticalAlertSetting:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NotSupported"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Off"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"On"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasSectionID
{
  return self->_sectionID != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBSetNotificationsCriticalAlertRequest;
  int v4 = [(BLTPBSetNotificationsCriticalAlertRequest *)&v8 description];
  v5 = [(BLTPBSetNotificationsCriticalAlertRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t criticalAlertSetting = self->_criticalAlertSetting;
    if (criticalAlertSetting >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_criticalAlertSetting);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_264684000[criticalAlertSetting];
    }
    [v3 setObject:v5 forKey:@"criticalAlertSetting"];
  }
  sectionID = self->_sectionID;
  if (sectionID) {
    [v3 setObject:sectionID forKey:@"sectionID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBSetNotificationsCriticalAlertRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_sectionID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_criticalAlertSetting;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_sectionID)
  {
    id v5 = v4;
    objc_msgSend(v4, "setSectionID:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_criticalAlertSetting;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_sectionID copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_criticalAlertSetting != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  sectionID = self->_sectionID;
  if ((unint64_t)sectionID | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](sectionID, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_criticalAlertSetting;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_sectionID hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[6])
  {
    self->_uint64_t criticalAlertSetting = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    uint64_t v5 = v4;
    -[BLTPBSetNotificationsCriticalAlertRequest setSectionID:](self, "setSectionID:");
    id v4 = v5;
  }
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end