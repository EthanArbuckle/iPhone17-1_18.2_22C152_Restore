@interface ATXMagicalMomentsPBMMEngagedTracker
- (BOOL)hasAbGroup;
- (BOOL)hasAnchor;
- (BOOL)hasBundleId;
- (BOOL)hasConsumerSubType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)abGroup;
- (NSString)bundleId;
- (NSString)consumerSubType;
- (id)anchorAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAnchor:(id)a3;
- (int)anchor;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbGroup:(id)a3;
- (void)setAnchor:(int)a3;
- (void)setBundleId:(id)a3;
- (void)setConsumerSubType:(id)a3;
- (void)setHasAnchor:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMagicalMomentsPBMMEngagedTracker

- (int)anchor
{
  if (*(unsigned char *)&self->_has) {
    return self->_anchor;
  }
  else {
    return 0;
  }
}

- (void)setAnchor:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_anchor = a3;
}

- (void)setHasAnchor:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAnchor
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)anchorAsString:(int)a3
{
  if (a3 >= 0x13)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E68B3978[a3];
  }
  return v3;
}

- (int)StringAsAnchor:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ANCHOR_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_BLUETOOTH_CONNECTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_BLUETOOTH_DISCONNECTED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_IDLE_TIME_BEGIN"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_IDLE_TIME_END"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_CARPLAY_CONNECTED"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_CARPLAY_DISCONNECTED"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_LOI_ENTRANCE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_LOI_EXIT"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_WORKOUT_START"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_WORKOUT_END"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_HEADING_HOME"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_HEADING_TO_WORK"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_FIRST_CALENDAR_EVENT_OF_DAY"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_LAST_CALENDAR_EVENT_OF_DAY"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_UPCOMING_SEMANTIC_EVENT"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_WIRED_AUDIO_DEVICE_CONNECTED"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_WIRED_AUDIO_DEVICE_DISCONNECTED"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_CHARGER_CONNECTED"])
  {
    int v4 = 18;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXMagicalMomentsPBMMEngagedTracker;
  int v4 = [(ATXMagicalMomentsPBMMEngagedTracker *)&v8 description];
  v5 = [(ATXMagicalMomentsPBMMEngagedTracker *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t anchor = self->_anchor;
    if (anchor >= 0x13)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_anchor);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E68B3978[anchor];
    }
    [v3 setObject:v5 forKey:@"anchor"];
  }
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }
  abGroup = self->_abGroup;
  if (abGroup) {
    [v3 setObject:abGroup forKey:@"abGroup"];
  }
  consumerSubType = self->_consumerSubType;
  if (consumerSubType) {
    [v3 setObject:consumerSubType forKey:@"consumerSubType"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMagicalMomentsPBMMEngagedTrackerReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_consumerSubType)
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
    v4[4] = self->_anchor;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v5 = v4;
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    id v4 = v5;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v5, "setAbGroup:");
    id v4 = v5;
  }
  if (self->_consumerSubType)
  {
    objc_msgSend(v5, "setConsumerSubType:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_anchor;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_bundleId copyWithZone:a3];
  objc_super v8 = (void *)v6[3];
  v6[3] = v7;

  uint64_t v9 = [(NSString *)self->_abGroup copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  uint64_t v11 = [(NSString *)self->_consumerSubType copyWithZone:a3];
  v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_anchor != *((_DWORD *)v4 + 4)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 3) && !-[NSString isEqual:](bundleId, "isEqual:")) {
    goto LABEL_13;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](abGroup, "isEqual:")) {
      goto LABEL_13;
    }
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((void *)v4 + 4)) {
    char v8 = -[NSString isEqual:](consumerSubType, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_anchor;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_bundleId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_abGroup hash];
  return v4 ^ v5 ^ [(NSString *)self->_consumerSubType hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[10])
  {
    self->_uint64_t anchor = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  NSUInteger v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[ATXMagicalMomentsPBMMEngagedTracker setBundleId:](self, "setBundleId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[ATXMagicalMomentsPBMMEngagedTracker setAbGroup:](self, "setAbGroup:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[ATXMagicalMomentsPBMMEngagedTracker setConsumerSubType:](self, "setConsumerSubType:");
    NSUInteger v4 = v5;
  }
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end