@interface PDDPAttachmentEventDetails
- (BOOL)hasAppIdentifier;
- (BOOL)hasAttachmentId;
- (BOOL)hasAttachmentType;
- (BOOL)hasClassId;
- (BOOL)hasContextType;
- (BOOL)hasEventRecipientId;
- (BOOL)hasHandoutId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)appIdentifier;
- (NSString)attachmentId;
- (NSString)classId;
- (NSString)eventRecipientId;
- (NSString)handoutId;
- (id)attachmentTypeAsString:(int)a3;
- (id)contextTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAttachmentType:(id)a3;
- (int)StringAsContextType:(id)a3;
- (int)attachmentType;
- (int)contextType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setAttachmentId:(id)a3;
- (void)setAttachmentType:(int)a3;
- (void)setClassId:(id)a3;
- (void)setContextType:(int)a3;
- (void)setEventRecipientId:(id)a3;
- (void)setHandoutId:(id)a3;
- (void)setHasAttachmentType:(BOOL)a3;
- (void)setHasContextType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPAttachmentEventDetails

- (BOOL)hasClassId
{
  return self->_classId != 0;
}

- (BOOL)hasHandoutId
{
  return self->_handoutId != 0;
}

- (BOOL)hasAttachmentId
{
  return self->_attachmentId != 0;
}

- (int)attachmentType
{
  if (*(unsigned char *)&self->_has) {
    return self->_attachmentType;
  }
  else {
    return 0;
  }
}

- (void)setAttachmentType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_attachmentType = a3;
}

- (void)setHasAttachmentType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAttachmentType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)attachmentTypeAsString:(int)a3
{
  if (a3 >= 8)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = *(&off_1001F2798 + a3);
  }

  return v3;
}

- (int)StringAsAttachmentType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"URL_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CONTEXT_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ASSET_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"APP_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HAND_IN_REQUEST_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SURVEY_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ASSESSMENT_TYPE"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)contextType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_contextType;
  }
  else {
    return -1;
  }
}

- (void)setContextType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_contextType = a3;
}

- (void)setHasContextType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasContextType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)contextTypeAsString:(int)a3
{
  if ((a3 + 1) >= 0x13)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_1001F27D8 + a3 + 1);
  }

  return v3;
}

- (int)StringAsContextType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CONTEXT_TYPE"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"APP"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CHAPTER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SECTION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LEVEL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PAGE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TASK"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CHALLENGE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"QUIZ"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"EXERCISE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"LESSON"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"BOOK"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"GAME"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"DOCUMENT"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"AUDIO"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"VIDEO"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"COURSE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"CUSTOM"])
  {
    int v4 = 17;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (BOOL)hasEventRecipientId
{
  return self->_eventRecipientId != 0;
}

- (BOOL)hasAppIdentifier
{
  return self->_appIdentifier != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPAttachmentEventDetails;
  id v3 = [(PDDPAttachmentEventDetails *)&v7 description];
  int v4 = [(PDDPAttachmentEventDetails *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  classId = self->_classId;
  if (classId) {
    [v3 setObject:classId forKey:@"class_id"];
  }
  handoutId = self->_handoutId;
  if (handoutId) {
    [v4 setObject:handoutId forKey:@"handout_id"];
  }
  attachmentId = self->_attachmentId;
  if (attachmentId) {
    [v4 setObject:attachmentId forKey:@"attachment_id"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t attachmentType = self->_attachmentType;
    if (attachmentType >= 8)
    {
      v10 = +[NSString stringWithFormat:@"(unknown: %i)", self->_attachmentType];
    }
    else
    {
      v10 = *(&off_1001F2798 + attachmentType);
    }
    [v4 setObject:v10 forKey:@"attachment_type"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    int v11 = self->_contextType + 1;
    if (v11 >= 0x13)
    {
      v12 = +[NSString stringWithFormat:@"(unknown: %i)", self->_contextType];
    }
    else
    {
      v12 = *(&off_1001F27D8 + v11);
    }
    [v4 setObject:v12 forKey:@"context_type"];
  }
  eventRecipientId = self->_eventRecipientId;
  if (eventRecipientId) {
    [v4 setObject:eventRecipientId forKey:@"event_recipient_id"];
  }
  appIdentifier = self->_appIdentifier;
  if (appIdentifier) {
    [v4 setObject:appIdentifier forKey:@"app_identifier"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10003D4EC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_classId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_handoutId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_attachmentId)
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
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_eventRecipientId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_appIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_classId)
  {
    objc_msgSend(v4, "setClassId:");
    id v4 = v6;
  }
  if (self->_handoutId)
  {
    objc_msgSend(v6, "setHandoutId:");
    id v4 = v6;
  }
  if (self->_attachmentId)
  {
    objc_msgSend(v6, "setAttachmentId:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 6) = self->_attachmentType;
    *((unsigned char *)v4 + 64) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_contextType;
    *((unsigned char *)v4 + 64) |= 2u;
  }
  if (self->_eventRecipientId)
  {
    objc_msgSend(v6, "setEventRecipientId:");
    id v4 = v6;
  }
  if (self->_appIdentifier)
  {
    objc_msgSend(v6, "setAppIdentifier:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_classId copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(NSString *)self->_handoutId copyWithZone:a3];
  v9 = (void *)v5[7];
  v5[7] = v8;

  id v10 = [(NSString *)self->_attachmentId copyWithZone:a3];
  int v11 = (void *)v5[2];
  v5[2] = v10;

  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 6) = self->_attachmentType;
    *((unsigned char *)v5 + 64) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_contextType;
    *((unsigned char *)v5 + 64) |= 2u;
  }
  id v13 = [(NSString *)self->_eventRecipientId copyWithZone:a3];
  v14 = (void *)v5[6];
  v5[6] = v13;

  id v15 = [(NSString *)self->_appIdentifier copyWithZone:a3];
  v16 = (void *)v5[1];
  v5[1] = v15;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  classId = self->_classId;
  if ((unint64_t)classId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](classId, "isEqual:")) {
      goto LABEL_22;
    }
  }
  handoutId = self->_handoutId;
  if ((unint64_t)handoutId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](handoutId, "isEqual:")) {
      goto LABEL_22;
    }
  }
  attachmentId = self->_attachmentId;
  if ((unint64_t)attachmentId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](attachmentId, "isEqual:")) {
      goto LABEL_22;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_attachmentType != *((_DWORD *)v4 + 6)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_22:
    unsigned __int8 v10 = 0;
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_contextType != *((_DWORD *)v4 + 10)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_22;
  }
  eventRecipientId = self->_eventRecipientId;
  if ((unint64_t)eventRecipientId | *((void *)v4 + 6)
    && !-[NSString isEqual:](eventRecipientId, "isEqual:"))
  {
    goto LABEL_22;
  }
  appIdentifier = self->_appIdentifier;
  if ((unint64_t)appIdentifier | *((void *)v4 + 1)) {
    unsigned __int8 v10 = -[NSString isEqual:](appIdentifier, "isEqual:");
  }
  else {
    unsigned __int8 v10 = 1;
  }
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_classId hash];
  NSUInteger v4 = [(NSString *)self->_handoutId hash];
  NSUInteger v5 = [(NSString *)self->_attachmentId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = 2654435761 * self->_attachmentType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_contextType;
LABEL_6:
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v9 = v7 ^ [(NSString *)self->_eventRecipientId hash];
  return v8 ^ v9 ^ [(NSString *)self->_appIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int *)a3;
  uint64_t v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[PDDPAttachmentEventDetails setClassId:](self, "setClassId:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 7))
  {
    [(PDDPAttachmentEventDetails *)self setHandoutId:"setHandoutId:"];
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[PDDPAttachmentEventDetails setAttachmentId:](self, "setAttachmentId:");
    NSUInteger v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 64);
  if (v5)
  {
    self->_uint64_t attachmentType = v4[6];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 64);
  }
  if ((v5 & 2) != 0)
  {
    self->_contextType = v4[10];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 6))
  {
    -[PDDPAttachmentEventDetails setEventRecipientId:](self, "setEventRecipientId:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 1))
  {
    -[PDDPAttachmentEventDetails setAppIdentifier:](self, "setAppIdentifier:");
    NSUInteger v4 = v6;
  }
}

- (NSString)classId
{
  return self->_classId;
}

- (void)setClassId:(id)a3
{
}

- (NSString)handoutId
{
  return self->_handoutId;
}

- (void)setHandoutId:(id)a3
{
}

- (NSString)attachmentId
{
  return self->_attachmentId;
}

- (void)setAttachmentId:(id)a3
{
}

- (NSString)eventRecipientId
{
  return self->_eventRecipientId;
}

- (void)setEventRecipientId:(id)a3
{
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handoutId, 0);
  objc_storeStrong((id *)&self->_eventRecipientId, 0);
  objc_storeStrong((id *)&self->_classId, 0);
  objc_storeStrong((id *)&self->_attachmentId, 0);

  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

@end