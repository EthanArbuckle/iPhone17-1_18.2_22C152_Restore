@interface SECSFAEventRule
- (BOOL)hasAction;
- (BOOL)hasEventClass;
- (BOOL)hasEventType;
- (BOOL)hasMatch;
- (BOOL)hasMatchOnFirstFailure;
- (BOOL)hasProcessName;
- (BOOL)hasRepeatAfterSeconds;
- (BOOL)hasVersions;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchOnFirstFailure;
- (BOOL)readFrom:(id)a3;
- (NSData)match;
- (NSString)eventType;
- (NSString)processName;
- (SECSFAAction)action;
- (SECSFAVersionMatch)versions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventClassAsString:(int)a3;
- (int)StringAsEventClass:(id)a3;
- (int)eventClass;
- (int64_t)repeatAfterSeconds;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAction:(id)a3;
- (void)setEventClass:(int)a3;
- (void)setEventType:(id)a3;
- (void)setHasEventClass:(BOOL)a3;
- (void)setHasMatchOnFirstFailure:(BOOL)a3;
- (void)setHasRepeatAfterSeconds:(BOOL)a3;
- (void)setMatch:(id)a3;
- (void)setMatchOnFirstFailure:(BOOL)a3;
- (void)setProcessName:(id)a3;
- (void)setRepeatAfterSeconds:(int64_t)a3;
- (void)setVersions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECSFAEventRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versions, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_match, 0);
  objc_storeStrong((id *)&self->_eventType, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

- (BOOL)matchOnFirstFailure
{
  return self->_matchOnFirstFailure;
}

- (void)setVersions:(id)a3
{
}

- (SECSFAVersionMatch)versions
{
  return self->_versions;
}

- (void)setProcessName:(id)a3
{
}

- (NSString)processName
{
  return self->_processName;
}

- (int64_t)repeatAfterSeconds
{
  return self->_repeatAfterSeconds;
}

- (void)setAction:(id)a3
{
}

- (SECSFAAction)action
{
  return self->_action;
}

- (void)setMatch:(id)a3
{
}

- (NSData)match
{
  return self->_match;
}

- (void)setEventType:(id)a3
{
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (*((void *)v4 + 4))
  {
    -[SECSFAEventRule setEventType:](self, "setEventType:");
    id v4 = v9;
  }
  if (*((void *)v4 + 5))
  {
    -[SECSFAEventRule setMatch:](self, "setMatch:");
    id v4 = v9;
  }
  action = self->_action;
  uint64_t v6 = *((void *)v4 + 2);
  if (action)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[SECSFAAction mergeFrom:](action, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[SECSFAEventRule setAction:](self, "setAction:");
  }
  id v4 = v9;
LABEL_11:
  if (*((unsigned char *)v4 + 68))
  {
    self->_repeatAfterSeconds = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 6))
  {
    -[SECSFAEventRule setProcessName:](self, "setProcessName:");
    id v4 = v9;
  }
  if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    self->_eventClass = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
  versions = self->_versions;
  uint64_t v8 = *((void *)v4 + 7);
  if (versions)
  {
    if (!v8) {
      goto LABEL_23;
    }
    -[SECSFAVersionMatch mergeFrom:](versions, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_23;
    }
    -[SECSFAEventRule setVersions:](self, "setVersions:");
  }
  id v4 = v9;
LABEL_23:
  if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    self->_matchOnFirstFailure = *((unsigned char *)v4 + 64);
    *(unsigned char *)&self->_has |= 4u;
  }

  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_eventType hash];
  uint64_t v4 = [(NSData *)self->_match hash];
  unint64_t v5 = [(SECSFAAction *)self->_action hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_repeatAfterSeconds;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_processName hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_eventClass;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = [(SECSFAVersionMatch *)self->_versions hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v10 = 2654435761 * self->_matchOnFirstFailure;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  eventType = self->_eventType;
  if ((unint64_t)eventType | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](eventType, "isEqual:")) {
      goto LABEL_26;
    }
  }
  match = self->_match;
  if ((unint64_t)match | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](match, "isEqual:")) {
      goto LABEL_26;
    }
  }
  action = self->_action;
  if ((unint64_t)action | *((void *)v4 + 2))
  {
    if (!-[SECSFAAction isEqual:](action, "isEqual:")) {
      goto LABEL_26;
    }
  }
  char has = (char)self->_has;
  char v9 = *((unsigned char *)v4 + 68);
  if (has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_repeatAfterSeconds != *((void *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_26;
  }
  processName = self->_processName;
  if ((unint64_t)processName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](processName, "isEqual:")) {
      goto LABEL_26;
    }
    char has = (char)self->_has;
    char v9 = *((unsigned char *)v4 + 68);
  }
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_eventClass != *((_DWORD *)v4 + 6)) {
      goto LABEL_26;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_26;
  }
  versions = self->_versions;
  if ((unint64_t)versions | *((void *)v4 + 7))
  {
    if (!-[SECSFAVersionMatch isEqual:](versions, "isEqual:")) {
      goto LABEL_26;
    }
    char has = (char)self->_has;
    char v9 = *((unsigned char *)v4 + 68);
  }
  BOOL v12 = (v9 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v9 & 4) != 0)
    {
      if (self->_matchOnFirstFailure)
      {
        if (!*((unsigned char *)v4 + 64)) {
          goto LABEL_26;
        }
      }
      else if (*((unsigned char *)v4 + 64))
      {
        goto LABEL_26;
      }
      BOOL v12 = 1;
      goto LABEL_27;
    }
LABEL_26:
    BOOL v12 = 0;
  }
LABEL_27:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_eventType copyWithZone:a3];
  NSUInteger v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSData *)self->_match copyWithZone:a3];
  char v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  id v10 = [(SECSFAAction *)self->_action copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_repeatAfterSeconds;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  uint64_t v12 = [(NSString *)self->_processName copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_eventClass;
    *(unsigned char *)(v5 + 68) |= 2u;
  }
  id v14 = [(SECSFAVersionMatch *)self->_versions copyWithZone:a3];
  v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v5 + 64) = self->_matchOnFirstFailure;
    *(unsigned char *)(v5 + 68) |= 4u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_eventType)
  {
    objc_msgSend(v4, "setEventType:");
    id v4 = v5;
  }
  if (self->_match)
  {
    objc_msgSend(v5, "setMatch:");
    id v4 = v5;
  }
  if (self->_action)
  {
    objc_msgSend(v5, "setAction:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_repeatAfterSeconds;
    *((unsigned char *)v4 + 68) |= 1u;
  }
  if (self->_processName)
  {
    objc_msgSend(v5, "setProcessName:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_eventClass;
    *((unsigned char *)v4 + 68) |= 2u;
  }
  if (self->_versions)
  {
    objc_msgSend(v5, "setVersions:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v4 + 64) = self->_matchOnFirstFailure;
    *((unsigned char *)v4 + 68) |= 4u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_eventType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_match)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_action)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_processName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_versions)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SECSFAEventRuleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  eventType = self->_eventType;
  if (eventType) {
    [v3 setObject:eventType forKey:@"eventType"];
  }
  match = self->_match;
  if (match) {
    [v4 setObject:match forKey:@"match"];
  }
  action = self->_action;
  if (action)
  {
    uint64_t v8 = [(SECSFAAction *)action dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"action"];
  }
  if (*(unsigned char *)&self->_has)
  {
    char v9 = [NSNumber numberWithLongLong:self->_repeatAfterSeconds];
    [v4 setObject:v9 forKey:@"repeatAfterSeconds"];
  }
  processName = self->_processName;
  if (processName) {
    [v4 setObject:processName forKey:@"processName"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t eventClass = self->_eventClass;
    if eventClass < 0xF && ((0x7C03u >> eventClass))
    {
      uint64_t v12 = off_1E5475ED8[eventClass];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventClass);
      uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v4 setObject:v12 forKey:@"eventClass"];
  }
  versions = self->_versions;
  if (versions)
  {
    id v14 = [(SECSFAVersionMatch *)versions dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"versions"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v15 = [NSNumber numberWithBool:self->_matchOnFirstFailure];
    [v4 setObject:v15 forKey:@"matchOnFirstFailure"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SECSFAEventRule;
  id v4 = [(SECSFAEventRule *)&v8 description];
  id v5 = [(SECSFAEventRule *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasMatchOnFirstFailure
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasMatchOnFirstFailure:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setMatchOnFirstFailure:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_matchOnFirstFailure = a3;
}

- (BOOL)hasVersions
{
  return self->_versions != 0;
}

- (int)StringAsEventClass:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Errors"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"All"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Success"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"HardFailure"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SoftFailure"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"Note"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"Rockwell"])
  {
    int v4 = 14;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)eventClassAsString:(int)a3
{
  if a3 < 0xF && ((0x7C03u >> a3))
  {
    id v3 = off_1E5475ED8[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (BOOL)hasEventClass
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasEventClass:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setEventClass:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t eventClass = a3;
}

- (int)eventClass
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_eventClass;
  }
  else {
    return 0;
  }
}

- (BOOL)hasProcessName
{
  return self->_processName != 0;
}

- (BOOL)hasRepeatAfterSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRepeatAfterSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setRepeatAfterSeconds:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_repeatAfterSeconds = a3;
}

- (BOOL)hasAction
{
  return self->_action != 0;
}

- (BOOL)hasMatch
{
  return self->_match != 0;
}

- (BOOL)hasEventType
{
  return self->_eventType != 0;
}

@end