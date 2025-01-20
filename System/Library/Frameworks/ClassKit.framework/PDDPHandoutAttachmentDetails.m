@interface PDDPHandoutAttachmentDetails
- (BOOL)hasAppIdentifier;
- (BOOL)hasAttachmentId;
- (BOOL)hasAttachmentType;
- (BOOL)hasContextType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)appIdentifier;
- (NSString)attachmentId;
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
- (void)setContextType:(int)a3;
- (void)setHasAttachmentType:(BOOL)a3;
- (void)setHasContextType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPHandoutAttachmentDetails

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
    v3 = off_1001F4CD0[a3];
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
    char v3 = off_1001F4D10[a3 + 1];
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

- (BOOL)hasAppIdentifier
{
  return self->_appIdentifier != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPHandoutAttachmentDetails;
  id v3 = [(PDDPHandoutAttachmentDetails *)&v7 description];
  int v4 = [(PDDPHandoutAttachmentDetails *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  attachmentId = self->_attachmentId;
  if (attachmentId) {
    [v3 setObject:attachmentId forKey:@"attachment_id"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t attachmentType = self->_attachmentType;
    if (attachmentType >= 8)
    {
      v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_attachmentType];
    }
    else
    {
      v8 = off_1001F4CD0[attachmentType];
    }
    [v4 setObject:v8 forKey:@"attachment_type"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v9 = self->_contextType + 1;
    if (v9 >= 0x13)
    {
      v10 = +[NSString stringWithFormat:@"(unknown: %i)", self->_contextType];
    }
    else
    {
      v10 = off_1001F4D10[v9];
    }
    [v4 setObject:v10 forKey:@"context_type"];
  }
  appIdentifier = self->_appIdentifier;
  if (appIdentifier) {
    [v4 setObject:appIdentifier forKey:@"app_identifier"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000F8D00((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
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
  if (self->_attachmentId)
  {
    objc_msgSend(v4, "setAttachmentId:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 6) = self->_attachmentType;
    *((unsigned char *)v4 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 7) = self->_contextType;
    *((unsigned char *)v4 + 32) |= 2u;
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
  id v6 = [(NSString *)self->_attachmentId copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 6) = self->_attachmentType;
    *((unsigned char *)v5 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 7) = self->_contextType;
    *((unsigned char *)v5 + 32) |= 2u;
  }
  id v9 = [(NSString *)self->_appIdentifier copyWithZone:a3];
  v10 = (void *)v5[1];
  v5[1] = v9;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  attachmentId = self->_attachmentId;
  if ((unint64_t)attachmentId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](attachmentId, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_attachmentType != *((_DWORD *)v4 + 6)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_16:
    unsigned __int8 v7 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_contextType != *((_DWORD *)v4 + 7)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_16;
  }
  appIdentifier = self->_appIdentifier;
  if ((unint64_t)appIdentifier | *((void *)v4 + 1)) {
    unsigned __int8 v7 = -[NSString isEqual:](appIdentifier, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_attachmentId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_attachmentType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(NSString *)self->_appIdentifier hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_contextType;
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_appIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  id v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[PDDPHandoutAttachmentDetails setAttachmentId:](self, "setAttachmentId:");
    uint64_t v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 32);
  if (v5)
  {
    self->_uint64_t attachmentType = v4[6];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 32);
  }
  if ((v5 & 2) != 0)
  {
    self->_contextType = v4[7];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 1))
  {
    -[PDDPHandoutAttachmentDetails setAppIdentifier:](self, "setAppIdentifier:");
    uint64_t v4 = v6;
  }
}

- (NSString)attachmentId
{
  return self->_attachmentId;
}

- (void)setAttachmentId:(id)a3
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
  objc_storeStrong((id *)&self->_attachmentId, 0);

  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

@end