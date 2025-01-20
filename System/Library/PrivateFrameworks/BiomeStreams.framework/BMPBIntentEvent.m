@interface BMPBIntentEvent
- (BOOL)donatedBySiri;
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasBundleID;
- (BOOL)hasDonatedBySiri;
- (BOOL)hasGroupIdentifier;
- (BOOL)hasIntentClass;
- (BOOL)hasIntentHandlingStatus;
- (BOOL)hasIntentType;
- (BOOL)hasIntentVerb;
- (BOOL)hasInteraction;
- (BOOL)hasInteractionDirection;
- (BOOL)hasItemID;
- (BOOL)hasSourceId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)interaction;
- (NSString)bundleID;
- (NSString)groupIdentifier;
- (NSString)intentClass;
- (NSString)intentVerb;
- (NSString)itemID;
- (NSString)sourceId;
- (double)absoluteTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)intentHandlingStatusAsString:(int)a3;
- (id)intentTypeAsString:(int)a3;
- (id)interactionDirectionAsString:(int)a3;
- (int)StringAsIntentHandlingStatus:(id)a3;
- (int)StringAsIntentType:(id)a3;
- (int)StringAsInteractionDirection:(id)a3;
- (int)intentHandlingStatus;
- (int)intentType;
- (int)interactionDirection;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setBundleID:(id)a3;
- (void)setDonatedBySiri:(BOOL)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setHasDonatedBySiri:(BOOL)a3;
- (void)setHasIntentHandlingStatus:(BOOL)a3;
- (void)setHasIntentType:(BOOL)a3;
- (void)setHasInteractionDirection:(BOOL)a3;
- (void)setIntentClass:(id)a3;
- (void)setIntentHandlingStatus:(int)a3;
- (void)setIntentType:(int)a3;
- (void)setIntentVerb:(id)a3;
- (void)setInteraction:(id)a3;
- (void)setInteractionDirection:(int)a3;
- (void)setItemID:(id)a3;
- (void)setSourceId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBIntentEvent

- (NSString)sourceId
{
  return self->_sourceId;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (NSData)interaction
{
  return self->_interaction;
}

- (int)interactionDirection
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_interactionDirection;
  }
  else {
    return 0;
  }
}

- (NSString)intentVerb
{
  return self->_intentVerb;
}

- (int)intentType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_intentType;
  }
  else {
    return 0;
  }
}

- (int)intentHandlingStatus
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_intentHandlingStatus;
  }
  else {
    return 0;
  }
}

- (NSString)intentClass
{
  return self->_intentClass;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (BOOL)donatedBySiri
{
  return self->_donatedBySiri;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBIntentEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceId, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_intentVerb, 0);
  objc_storeStrong((id *)&self->_intentClass, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)setAbsoluteTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (BOOL)hasSourceId
{
  return self->_sourceId != 0;
}

- (BOOL)hasIntentClass
{
  return self->_intentClass != 0;
}

- (BOOL)hasIntentVerb
{
  return self->_intentVerb != 0;
}

- (void)setIntentType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_intentType = a3;
}

- (void)setHasIntentType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIntentType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)intentTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    char v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    char v3 = *(&off_1E55D7640 + a3);
  }

  return v3;
}

- (int)StringAsIntentType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"System"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Custom"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Generic"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setIntentHandlingStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_intentHandlingStatus = a3;
}

- (void)setHasIntentHandlingStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIntentHandlingStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)intentHandlingStatusAsString:(int)a3
{
  if (a3 >= 7)
  {
    char v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    char v3 = *(&off_1E55D7660 + a3);
  }

  return v3;
}

- (int)StringAsIntentHandlingStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unspecified"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Ready"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"InProgress"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Success"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Failure"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"DeferredToApplication"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"UserConfirmationRequired"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasInteraction
{
  return self->_interaction != 0;
}

- (BOOL)hasItemID
{
  return self->_itemID != 0;
}

- (void)setDonatedBySiri:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_donatedBySiri = a3;
}

- (void)setHasDonatedBySiri:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDonatedBySiri
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setInteractionDirection:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_interactionDirection = a3;
}

- (void)setHasInteractionDirection:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasInteractionDirection
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)interactionDirectionAsString:(int)a3
{
  if (a3 >= 4)
  {
    char v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    char v3 = *(&off_1E55D7698 + a3);
  }

  return v3;
}

- (int)StringAsInteractionDirection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Incoming"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Outgoing"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Bidirectional"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasGroupIdentifier
{
  return self->_groupIdentifier != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBIntentEvent;
  int v4 = [(BMPBIntentEvent *)&v8 description];
  v5 = [(BMPBIntentEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int v4 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
    [v3 setObject:v4 forKey:@"absoluteTimestamp"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  sourceId = self->_sourceId;
  if (sourceId) {
    [v3 setObject:sourceId forKey:@"sourceId"];
  }
  intentClass = self->_intentClass;
  if (intentClass) {
    [v3 setObject:intentClass forKey:@"intentClass"];
  }
  intentVerb = self->_intentVerb;
  if (intentVerb) {
    [v3 setObject:intentVerb forKey:@"intentVerb"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t intentType = self->_intentType;
    if (intentType >= 4)
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_intentType);
    }
    else
    {
      v11 = *(&off_1E55D7640 + intentType);
    }
    [v3 setObject:v11 forKey:@"intentType"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t intentHandlingStatus = self->_intentHandlingStatus;
    if (intentHandlingStatus >= 7)
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_intentHandlingStatus);
    }
    else
    {
      v13 = *(&off_1E55D7660 + intentHandlingStatus);
    }
    [v3 setObject:v13 forKey:@"intentHandlingStatus"];
  }
  interaction = self->_interaction;
  if (interaction) {
    [v3 setObject:interaction forKey:@"interaction"];
  }
  itemID = self->_itemID;
  if (itemID) {
    [v3 setObject:itemID forKey:@"itemID"];
  }
  char v16 = (char)self->_has;
  if ((v16 & 0x10) != 0)
  {
    v17 = [NSNumber numberWithBool:self->_donatedBySiri];
    [v3 setObject:v17 forKey:@"donatedBySiri"];

    char v16 = (char)self->_has;
  }
  if ((v16 & 8) != 0)
  {
    uint64_t interactionDirection = self->_interactionDirection;
    if (interactionDirection >= 4)
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_interactionDirection);
    }
    else
    {
      v19 = *(&off_1E55D7698 + interactionDirection);
    }
    [v3 setObject:v19 forKey:@"interactionDirection"];
  }
  groupIdentifier = self->_groupIdentifier;
  if (groupIdentifier) {
    [v3 setObject:groupIdentifier forKey:@"groupIdentifier"];
  }

  return v3;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
  }
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_sourceId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_intentClass)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_intentVerb)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_interaction)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if (self->_itemID)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
    char v6 = (char)self->_has;
  }
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_groupIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_absoluteTimestamp;
    *((unsigned char *)v4 + 92) |= 1u;
  }
  id v7 = v4;
  if (self->_bundleID)
  {
    objc_msgSend(v4, "setBundleID:");
    id v4 = v7;
  }
  if (self->_sourceId)
  {
    objc_msgSend(v7, "setSourceId:");
    id v4 = v7;
  }
  if (self->_intentClass)
  {
    objc_msgSend(v7, "setIntentClass:");
    id v4 = v7;
  }
  if (self->_intentVerb)
  {
    objc_msgSend(v7, "setIntentVerb:");
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_intentType;
    *((unsigned char *)v4 + 92) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_intentHandlingStatus;
    *((unsigned char *)v4 + 92) |= 2u;
  }
  if (self->_interaction)
  {
    objc_msgSend(v7, "setInteraction:");
    id v4 = v7;
  }
  if (self->_itemID)
  {
    objc_msgSend(v7, "setItemID:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((unsigned char *)v4 + 88) = self->_donatedBySiri;
    *((unsigned char *)v4 + 92) |= 0x10u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 8) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_interactionDirection;
    *((unsigned char *)v4 + 92) |= 8u;
  }
  if (self->_groupIdentifier)
  {
    objc_msgSend(v7, "setGroupIdentifier:");
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(unsigned char *)(v5 + 92) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_bundleID copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  uint64_t v9 = [(NSString *)self->_sourceId copyWithZone:a3];
  v10 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v9;

  uint64_t v11 = [(NSString *)self->_intentClass copyWithZone:a3];
  v12 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v11;

  uint64_t v13 = [(NSString *)self->_intentVerb copyWithZone:a3];
  v14 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v13;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_intentType;
    *(unsigned char *)(v6 + 92) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_intentHandlingStatus;
    *(unsigned char *)(v6 + 92) |= 2u;
  }
  uint64_t v16 = [(NSData *)self->_interaction copyWithZone:a3];
  v17 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v16;

  uint64_t v18 = [(NSString *)self->_itemID copyWithZone:a3];
  v19 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v18;

  char v20 = (char)self->_has;
  if ((v20 & 0x10) != 0)
  {
    *(unsigned char *)(v6 + 88) = self->_donatedBySiri;
    *(unsigned char *)(v6 + 92) |= 0x10u;
    char v20 = (char)self->_has;
  }
  if ((v20 & 8) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_interactionDirection;
    *(unsigned char *)(v6 + 92) |= 8u;
  }
  uint64_t v21 = [(NSString *)self->_groupIdentifier copyWithZone:a3];
  v22 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v21;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 92) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_44;
    }
  }
  else if (*((unsigned char *)v4 + 92))
  {
    goto LABEL_44;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 2) && !-[NSString isEqual:](bundleID, "isEqual:")) {
    goto LABEL_44;
  }
  sourceId = self->_sourceId;
  if ((unint64_t)sourceId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](sourceId, "isEqual:")) {
      goto LABEL_44;
    }
  }
  intentClass = self->_intentClass;
  if ((unint64_t)intentClass | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](intentClass, "isEqual:")) {
      goto LABEL_44;
    }
  }
  intentVerb = self->_intentVerb;
  if ((unint64_t)intentVerb | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](intentVerb, "isEqual:")) {
      goto LABEL_44;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 4) == 0 || self->_intentType != *((_DWORD *)v4 + 11)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 2) == 0 || self->_intentHandlingStatus != *((_DWORD *)v4 + 10)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 2) != 0)
  {
    goto LABEL_44;
  }
  interaction = self->_interaction;
  if ((unint64_t)interaction | *((void *)v4 + 7) && !-[NSData isEqual:](interaction, "isEqual:")) {
    goto LABEL_44;
  }
  itemID = self->_itemID;
  if ((unint64_t)itemID | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](itemID, "isEqual:")) {
      goto LABEL_44;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 0x10) != 0)
    {
      if (self->_donatedBySiri)
      {
        if (!*((unsigned char *)v4 + 88)) {
          goto LABEL_44;
        }
        goto LABEL_37;
      }
      if (!*((unsigned char *)v4 + 88)) {
        goto LABEL_37;
      }
    }
LABEL_44:
    char v12 = 0;
    goto LABEL_45;
  }
  if ((*((unsigned char *)v4 + 92) & 0x10) != 0) {
    goto LABEL_44;
  }
LABEL_37:
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 8) == 0 || self->_interactionDirection != *((_DWORD *)v4 + 16)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 8) != 0)
  {
    goto LABEL_44;
  }
  groupIdentifier = self->_groupIdentifier;
  if ((unint64_t)groupIdentifier | *((void *)v4 + 3)) {
    char v12 = -[NSString isEqual:](groupIdentifier, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_45:

  return v12;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double absoluteTimestamp = self->_absoluteTimestamp;
    double v5 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0) {
      double v5 = self->_absoluteTimestamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v18 = [(NSString *)self->_bundleID hash];
  NSUInteger v8 = [(NSString *)self->_sourceId hash];
  NSUInteger v9 = [(NSString *)self->_intentClass hash];
  NSUInteger v10 = [(NSString *)self->_intentVerb hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v11 = 2654435761 * self->_intentType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_11:
      uint64_t v12 = 2654435761 * self->_intentHandlingStatus;
      goto LABEL_14;
    }
  }
  uint64_t v12 = 0;
LABEL_14:
  uint64_t v13 = [(NSData *)self->_interaction hash];
  NSUInteger v14 = [(NSString *)self->_itemID hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v15 = 2654435761 * self->_donatedBySiri;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_16;
    }
LABEL_18:
    uint64_t v16 = 0;
    return v18 ^ v3 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ [(NSString *)self->_groupIdentifier hash];
  }
  uint64_t v15 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_18;
  }
LABEL_16:
  uint64_t v16 = 2654435761 * self->_interactionDirection;
  return v18 ^ v3 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ [(NSString *)self->_groupIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 92))
  {
    self->_double absoluteTimestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v7 = v4;
  if (*((void *)v4 + 2))
  {
    -[BMPBIntentEvent setBundleID:](self, "setBundleID:");
    id v4 = v7;
  }
  if (*((void *)v4 + 10))
  {
    -[BMPBIntentEvent setSourceId:](self, "setSourceId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[BMPBIntentEvent setIntentClass:](self, "setIntentClass:");
    id v4 = v7;
  }
  if (*((void *)v4 + 6))
  {
    -[BMPBIntentEvent setIntentVerb:](self, "setIntentVerb:");
    id v4 = v7;
  }
  char v5 = *((unsigned char *)v4 + 92);
  if ((v5 & 4) != 0)
  {
    self->_uint64_t intentType = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 92);
  }
  if ((v5 & 2) != 0)
  {
    self->_uint64_t intentHandlingStatus = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 7))
  {
    -[BMPBIntentEvent setInteraction:](self, "setInteraction:");
    id v4 = v7;
  }
  if (*((void *)v4 + 9))
  {
    -[BMPBIntentEvent setItemID:](self, "setItemID:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 92);
  if ((v6 & 0x10) != 0)
  {
    self->_donatedBySiri = *((unsigned char *)v4 + 88);
    *(unsigned char *)&self->_has |= 0x10u;
    char v6 = *((unsigned char *)v4 + 92);
  }
  if ((v6 & 8) != 0)
  {
    self->_uint64_t interactionDirection = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 3))
  {
    -[BMPBIntentEvent setGroupIdentifier:](self, "setGroupIdentifier:");
    id v4 = v7;
  }
}

- (void)setBundleID:(id)a3
{
}

- (void)setSourceId:(id)a3
{
}

- (void)setIntentClass:(id)a3
{
}

- (void)setIntentVerb:(id)a3
{
}

- (void)setInteraction:(id)a3
{
}

- (void)setItemID:(id)a3
{
}

- (void)setGroupIdentifier:(id)a3
{
}

@end