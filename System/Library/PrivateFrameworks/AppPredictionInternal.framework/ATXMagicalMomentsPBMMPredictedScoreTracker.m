@interface ATXMagicalMomentsPBMMPredictedScoreTracker
- (BOOL)hasAbGroup;
- (BOOL)hasAnchor;
- (BOOL)hasTopBundleId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)abGroup;
- (NSString)topBundleId;
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
- (void)setHasAnchor:(BOOL)a3;
- (void)setTopBundleId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMagicalMomentsPBMMPredictedScoreTracker

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
    v3 = off_1E68B67F8[a3];
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

- (BOOL)hasTopBundleId
{
  return self->_topBundleId != 0;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXMagicalMomentsPBMMPredictedScoreTracker;
  int v4 = [(ATXMagicalMomentsPBMMPredictedScoreTracker *)&v8 description];
  v5 = [(ATXMagicalMomentsPBMMPredictedScoreTracker *)self dictionaryRepresentation];
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
      v5 = off_1E68B67F8[anchor];
    }
    [v3 setObject:v5 forKey:@"anchor"];
  }
  topBundleId = self->_topBundleId;
  if (topBundleId) {
    [v3 setObject:topBundleId forKey:@"topBundleId"];
  }
  abGroup = self->_abGroup;
  if (abGroup) {
    [v3 setObject:abGroup forKey:@"abGroup"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMagicalMomentsPBMMPredictedScoreTrackerReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_topBundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_abGroup)
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
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v5 = v4;
  if (self->_topBundleId)
  {
    objc_msgSend(v4, "setTopBundleId:");
    id v4 = v5;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v5, "setAbGroup:");
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
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_topBundleId copyWithZone:a3];
  objc_super v8 = (void *)v6[3];
  v6[3] = v7;

  uint64_t v9 = [(NSString *)self->_abGroup copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_anchor != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  topBundleId = self->_topBundleId;
  if ((unint64_t)topBundleId | *((void *)v4 + 3)
    && !-[NSString isEqual:](topBundleId, "isEqual:"))
  {
    goto LABEL_11;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((void *)v4 + 1)) {
    char v7 = -[NSString isEqual:](abGroup, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_anchor;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_topBundleId hash] ^ v3;
  return v4 ^ [(NSString *)self->_abGroup hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[8])
  {
    self->_uint64_t anchor = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[ATXMagicalMomentsPBMMPredictedScoreTracker setTopBundleId:](self, "setTopBundleId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[ATXMagicalMomentsPBMMPredictedScoreTracker setAbGroup:](self, "setAbGroup:");
    NSUInteger v4 = v5;
  }
}

- (NSString)topBundleId
{
  return self->_topBundleId;
}

- (void)setTopBundleId:(id)a3
{
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBundleId, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end