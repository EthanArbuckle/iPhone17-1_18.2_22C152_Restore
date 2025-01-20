@interface ATXMPBInstalledAppClipSessionEngagementTracker
- (BOOL)hasAbGroup;
- (BOOL)hasConsumerSubType;
- (BOOL)hasEngagementType;
- (BOOL)hasNumSuggestionsShown;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)abGroup;
- (NSString)consumerSubType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)engagementTypeAsString:(int)a3;
- (int)StringAsEngagementType:(id)a3;
- (int)engagementType;
- (unint64_t)hash;
- (unsigned)numSuggestionsShown;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbGroup:(id)a3;
- (void)setConsumerSubType:(id)a3;
- (void)setEngagementType:(int)a3;
- (void)setHasEngagementType:(BOOL)a3;
- (void)setHasNumSuggestionsShown:(BOOL)a3;
- (void)setNumSuggestionsShown:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMPBInstalledAppClipSessionEngagementTracker

- (int)engagementType
{
  if (*(unsigned char *)&self->_has) {
    return self->_engagementType;
  }
  else {
    return 0;
  }
}

- (void)setEngagementType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_engagementType = a3;
}

- (void)setHasEngagementType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEngagementType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)engagementTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E68B2640[a3];
  }
  return v3;
}

- (int)StringAsEngagementType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Shown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Engaged"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Rejected"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (void)setNumSuggestionsShown:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numSuggestionsShown = a3;
}

- (void)setHasNumSuggestionsShown:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumSuggestionsShown
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXMPBInstalledAppClipSessionEngagementTracker;
  int v4 = [(ATXMPBInstalledAppClipSessionEngagementTracker *)&v8 description];
  v5 = [(ATXMPBInstalledAppClipSessionEngagementTracker *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t engagementType = self->_engagementType;
    if (engagementType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_engagementType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E68B2640[engagementType];
    }
    [v3 setObject:v5 forKey:@"engagementType"];
  }
  consumerSubType = self->_consumerSubType;
  if (consumerSubType) {
    [v3 setObject:consumerSubType forKey:@"consumerSubType"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_numSuggestionsShown];
    [v3 setObject:v7 forKey:@"numSuggestionsShown"];
  }
  abGroup = self->_abGroup;
  if (abGroup) {
    [v3 setObject:abGroup forKey:@"abGroup"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBInstalledAppClipSessionEngagementTrackerReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
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
    v4[6] = self->_engagementType;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v5 = v4;
  if (self->_consumerSubType)
  {
    objc_msgSend(v4, "setConsumerSubType:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[7] = self->_numSuggestionsShown;
    *((unsigned char *)v4 + 32) |= 2u;
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
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_engagementType;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_consumerSubType copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_numSuggestionsShown;
    *(unsigned char *)(v6 + 32) |= 2u;
  }
  uint64_t v9 = [(NSString *)self->_abGroup copyWithZone:a3];
  v10 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v9;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_engagementType != *((_DWORD *)v4 + 6)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_17;
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](consumerSubType, "isEqual:"))
    {
LABEL_17:
      char v8 = 0;
      goto LABEL_18;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_numSuggestionsShown != *((_DWORD *)v4 + 7)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_17;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((void *)v4 + 1)) {
    char v8 = -[NSString isEqual:](abGroup, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_engagementType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_consumerSubType hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_numSuggestionsShown;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_abGroup hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[8])
  {
    self->_uint64_t engagementType = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[ATXMPBInstalledAppClipSessionEngagementTracker setConsumerSubType:](self, "setConsumerSubType:");
    NSUInteger v4 = v5;
  }
  if ((v4[8] & 2) != 0)
  {
    self->_numSuggestionsShown = v4[7];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 1))
  {
    -[ATXMPBInstalledAppClipSessionEngagementTracker setAbGroup:](self, "setAbGroup:");
    NSUInteger v4 = v5;
  }
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
}

- (unsigned)numSuggestionsShown
{
  return self->_numSuggestionsShown;
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
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end