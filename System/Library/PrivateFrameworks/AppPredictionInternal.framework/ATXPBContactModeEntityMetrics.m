@interface ATXPBContactModeEntityMetrics
- (BOOL)hasActivityState;
- (BOOL)hasBundleId;
- (BOOL)hasNumUniqueIncomingInteractionSenders;
- (BOOL)hasNumUniqueOutgoingInteractionRecipients;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)activityState;
- (NSString)bundleId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)numUniqueIncomingInteractionSenders;
- (unsigned)numUniqueOutgoingInteractionRecipients;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityState:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setHasNumUniqueIncomingInteractionSenders:(BOOL)a3;
- (void)setHasNumUniqueOutgoingInteractionRecipients:(BOOL)a3;
- (void)setNumUniqueIncomingInteractionSenders:(unsigned int)a3;
- (void)setNumUniqueOutgoingInteractionRecipients:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBContactModeEntityMetrics

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)setNumUniqueOutgoingInteractionRecipients:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numUniqueOutgoingInteractionRecipients = a3;
}

- (void)setHasNumUniqueOutgoingInteractionRecipients:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumUniqueOutgoingInteractionRecipients
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumUniqueIncomingInteractionSenders:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numUniqueIncomingInteractionSenders = a3;
}

- (void)setHasNumUniqueIncomingInteractionSenders:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumUniqueIncomingInteractionSenders
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasActivityState
{
  return self->_activityState != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBContactModeEntityMetrics;
  v4 = [(ATXPBContactModeEntityMetrics *)&v8 description];
  v5 = [(ATXPBContactModeEntityMetrics *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_numUniqueOutgoingInteractionRecipients];
    [v4 setObject:v7 forKey:@"numUniqueOutgoingInteractionRecipients"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_numUniqueIncomingInteractionSenders];
    [v4 setObject:v8 forKey:@"numUniqueIncomingInteractionSenders"];
  }
  activityState = self->_activityState;
  if (activityState) {
    [v4 setObject:activityState forKey:@"activityState"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBContactModeEntityMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_activityState)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 7) = self->_numUniqueOutgoingInteractionRecipients;
    *((unsigned char *)v4 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 6) = self->_numUniqueIncomingInteractionSenders;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  if (self->_activityState)
  {
    objc_msgSend(v6, "setActivityState:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_bundleId copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_numUniqueOutgoingInteractionRecipients;
    *(unsigned char *)(v5 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 24) = self->_numUniqueIncomingInteractionSenders;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_activityState copyWithZone:a3];
  v10 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_numUniqueOutgoingInteractionRecipients != *((_DWORD *)v4 + 7)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_numUniqueIncomingInteractionSenders != *((_DWORD *)v4 + 6)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_16;
  }
  activityState = self->_activityState;
  if ((unint64_t)activityState | *((void *)v4 + 1)) {
    char v7 = -[NSString isEqual:](activityState, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_numUniqueOutgoingInteractionRecipients;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(NSString *)self->_activityState hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_numUniqueIncomingInteractionSenders;
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_activityState hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  uint64_t v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[ATXPBContactModeEntityMetrics setBundleId:](self, "setBundleId:");
    uint64_t v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_numUniqueOutgoingInteractionRecipients = v4[7];
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 32);
  }
  if (v5)
  {
    self->_numUniqueIncomingInteractionSenders = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    -[ATXPBContactModeEntityMetrics setActivityState:](self, "setActivityState:");
    uint64_t v4 = v6;
  }
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (unsigned)numUniqueOutgoingInteractionRecipients
{
  return self->_numUniqueOutgoingInteractionRecipients;
}

- (unsigned)numUniqueIncomingInteractionSenders
{
  return self->_numUniqueIncomingInteractionSenders;
}

- (NSString)activityState
{
  return self->_activityState;
}

- (void)setActivityState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_activityState, 0);
}

@end