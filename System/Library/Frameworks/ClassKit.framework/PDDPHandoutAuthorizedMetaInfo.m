@interface PDDPHandoutAuthorizedMetaInfo
- (BOOL)hasAttachmentId;
- (BOOL)hasAttachmentType;
- (BOOL)hasClassId;
- (BOOL)hasHandoutAuthorizedObjectId;
- (BOOL)hasHandoutId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)attachmentId;
- (NSString)classId;
- (NSString)handoutAuthorizedObjectId;
- (NSString)handoutId;
- (id)attachmentTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAttachmentType:(id)a3;
- (int)attachmentType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttachmentId:(id)a3;
- (void)setAttachmentType:(int)a3;
- (void)setClassId:(id)a3;
- (void)setHandoutAuthorizedObjectId:(id)a3;
- (void)setHandoutId:(id)a3;
- (void)setHasAttachmentType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPHandoutAuthorizedMetaInfo

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
    v3 = *(&off_1001F6440 + a3);
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

- (BOOL)hasAttachmentId
{
  return self->_attachmentId != 0;
}

- (BOOL)hasHandoutAuthorizedObjectId
{
  return self->_handoutAuthorizedObjectId != 0;
}

- (BOOL)hasClassId
{
  return self->_classId != 0;
}

- (BOOL)hasHandoutId
{
  return self->_handoutId != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPHandoutAuthorizedMetaInfo;
  id v3 = [(PDDPHandoutAuthorizedMetaInfo *)&v7 description];
  int v4 = [(PDDPHandoutAuthorizedMetaInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t attachmentType = self->_attachmentType;
    if (attachmentType >= 8)
    {
      v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_attachmentType];
    }
    else
    {
      v5 = *(&off_1001F6440 + attachmentType);
    }
    [v3 setObject:v5 forKey:@"attachment_type"];
  }
  attachmentId = self->_attachmentId;
  if (attachmentId) {
    [v3 setObject:attachmentId forKey:@"attachment_id"];
  }
  handoutAuthorizedObjectId = self->_handoutAuthorizedObjectId;
  if (handoutAuthorizedObjectId) {
    [v3 setObject:handoutAuthorizedObjectId forKey:@"handout_authorized_object_id"];
  }
  classId = self->_classId;
  if (classId) {
    [v3 setObject:classId forKey:@"class_id"];
  }
  handoutId = self->_handoutId;
  if (handoutId) {
    [v3 setObject:handoutId forKey:@"handout_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100169D78((uint64_t)self, (uint64_t)a3);
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
  if (self->_attachmentId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_handoutAuthorizedObjectId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_classId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_handoutId)
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
    v4[4] = self->_attachmentType;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  id v5 = v4;
  if (self->_attachmentId)
  {
    objc_msgSend(v4, "setAttachmentId:");
    id v4 = v5;
  }
  if (self->_handoutAuthorizedObjectId)
  {
    objc_msgSend(v5, "setHandoutAuthorizedObjectId:");
    id v4 = v5;
  }
  if (self->_classId)
  {
    objc_msgSend(v5, "setClassId:");
    id v4 = v5;
  }
  if (self->_handoutId)
  {
    objc_msgSend(v5, "setHandoutId:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_attachmentType;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  id v7 = [(NSString *)self->_attachmentId copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  id v9 = [(NSString *)self->_handoutAuthorizedObjectId copyWithZone:a3];
  v10 = (void *)v6[4];
  v6[4] = v9;

  id v11 = [(NSString *)self->_classId copyWithZone:a3];
  v12 = (void *)v6[3];
  v6[3] = v11;

  id v13 = [(NSString *)self->_handoutId copyWithZone:a3];
  v14 = (void *)v6[5];
  v6[5] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_attachmentType != *((_DWORD *)v4 + 4)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    unsigned __int8 v9 = 0;
    goto LABEL_16;
  }
  attachmentId = self->_attachmentId;
  if ((unint64_t)attachmentId | *((void *)v4 + 1)
    && !-[NSString isEqual:](attachmentId, "isEqual:"))
  {
    goto LABEL_15;
  }
  handoutAuthorizedObjectId = self->_handoutAuthorizedObjectId;
  if ((unint64_t)handoutAuthorizedObjectId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](handoutAuthorizedObjectId, "isEqual:")) {
      goto LABEL_15;
    }
  }
  classId = self->_classId;
  if ((unint64_t)classId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](classId, "isEqual:")) {
      goto LABEL_15;
    }
  }
  handoutId = self->_handoutId;
  if ((unint64_t)handoutId | *((void *)v4 + 5)) {
    unsigned __int8 v9 = -[NSString isEqual:](handoutId, "isEqual:");
  }
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_attachmentType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(NSString *)self->_attachmentId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_handoutAuthorizedObjectId hash];
  unint64_t v6 = v4 ^ v5 ^ [(NSString *)self->_classId hash];
  return v6 ^ [(NSString *)self->_handoutId hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[12])
  {
    self->_uint64_t attachmentType = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  NSUInteger v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[PDDPHandoutAuthorizedMetaInfo setAttachmentId:](self, "setAttachmentId:");
    unint64_t v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    [(PDDPHandoutAuthorizedMetaInfo *)self setHandoutAuthorizedObjectId:"setHandoutAuthorizedObjectId:"];
    unint64_t v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[PDDPHandoutAuthorizedMetaInfo setClassId:](self, "setClassId:");
    unint64_t v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    [(PDDPHandoutAuthorizedMetaInfo *)self setHandoutId:"setHandoutId:"];
    unint64_t v4 = v5;
  }
}

- (NSString)attachmentId
{
  return self->_attachmentId;
}

- (void)setAttachmentId:(id)a3
{
}

- (NSString)handoutAuthorizedObjectId
{
  return self->_handoutAuthorizedObjectId;
}

- (void)setHandoutAuthorizedObjectId:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handoutId, 0);
  objc_storeStrong((id *)&self->_handoutAuthorizedObjectId, 0);
  objc_storeStrong((id *)&self->_classId, 0);

  objc_storeStrong((id *)&self->_attachmentId, 0);
}

@end