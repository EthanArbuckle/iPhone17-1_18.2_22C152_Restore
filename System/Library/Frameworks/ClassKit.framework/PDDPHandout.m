@interface PDDPHandout
+ (Class)classIdsType;
- (BOOL)hasAppIdentifier;
- (BOOL)hasDateCreated;
- (BOOL)hasDateDue;
- (BOOL)hasDateLastModified;
- (BOOL)hasDateLastReviewed;
- (BOOL)hasDateOfPublication;
- (BOOL)hasFlags;
- (BOOL)hasInstructions;
- (BOOL)hasIsReviewed;
- (BOOL)hasObjectId;
- (BOOL)hasPublicShareLink;
- (BOOL)hasPublishingState;
- (BOOL)hasStatus;
- (BOOL)hasTitle;
- (BOOL)hasType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReviewed;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)classIds;
- (NSString)appIdentifier;
- (NSString)instructions;
- (NSString)objectId;
- (NSString)publicShareLink;
- (NSString)title;
- (PDDPDate)dateCreated;
- (PDDPDate)dateDue;
- (PDDPDate)dateLastModified;
- (PDDPDate)dateLastReviewed;
- (PDDPDate)dateOfPublication;
- (PDDPStatus)status;
- (id)classIdsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)publishingStateAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsPublishingState:(id)a3;
- (int)StringAsType:(id)a3;
- (int)publishingState;
- (int)type;
- (int)version;
- (unint64_t)classIdsCount;
- (unint64_t)flags;
- (unint64_t)hash;
- (void)addClassIds:(id)a3;
- (void)clearClassIds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setClassIds:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateDue:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setDateLastReviewed:(id)a3;
- (void)setDateOfPublication:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setHasFlags:(BOOL)a3;
- (void)setHasIsReviewed:(BOOL)a3;
- (void)setHasPublishingState:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setInstructions:(id)a3;
- (void)setIsReviewed:(BOOL)a3;
- (void)setObjectId:(id)a3;
- (void)setPublicShareLink:(id)a3;
- (void)setPublishingState:(int)a3;
- (void)setStatus:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPHandout

- (BOOL)hasObjectId
{
  return self->_objectId != 0;
}

- (BOOL)hasAppIdentifier
{
  return self->_appIdentifier != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasInstructions
{
  return self->_instructions != 0;
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (BOOL)hasDateDue
{
  return self->_dateDue != 0;
}

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (BOOL)hasDateOfPublication
{
  return self->_dateOfPublication != 0;
}

- (void)setIsReviewed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isReviewed = a3;
}

- (void)setHasIsReviewed:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsReviewed
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasDateLastReviewed
{
  return self->_dateLastReviewed != 0;
}

- (int)publishingState
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_publishingState;
  }
  else {
    return 0;
  }
}

- (void)setPublishingState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_publishingState = a3;
}

- (void)setHasPublishingState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPublishingState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)publishingStateAsString:(int)a3
{
  if (a3 >= 9)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_1001F3A40[a3];
  }

  return v3;
}

- (int)StringAsPublishingState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_STATE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PENDING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PUBLISHING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PUBLISHED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UPDATING"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ERROR"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SUBMITTED"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SCHEDULING"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SCHEDULED"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (void)setFlags:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFlags
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 3)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_1001F3A88[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PRIVATE_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PUBLIC_TYPE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasPublicShareLink
{
  return self->_publicShareLink != 0;
}

- (void)setVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)clearClassIds
{
}

- (void)addClassIds:(id)a3
{
  id v4 = a3;
  classIds = self->_classIds;
  id v8 = v4;
  if (!classIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_classIds;
    self->_classIds = v6;

    id v4 = v8;
    classIds = self->_classIds;
  }
  [(NSMutableArray *)classIds addObject:v4];
}

- (unint64_t)classIdsCount
{
  return (unint64_t)[(NSMutableArray *)self->_classIds count];
}

- (id)classIdsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_classIds objectAtIndex:a3];
}

+ (Class)classIdsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPHandout;
  char v3 = [(PDDPHandout *)&v7 description];
  id v4 = [(PDDPHandout *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  objectId = self->_objectId;
  if (objectId) {
    [v3 setObject:objectId forKey:@"object_id"];
  }
  appIdentifier = self->_appIdentifier;
  if (appIdentifier) {
    [v4 setObject:appIdentifier forKey:@"app_identifier"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  instructions = self->_instructions;
  if (instructions) {
    [v4 setObject:instructions forKey:@"instructions"];
  }
  dateCreated = self->_dateCreated;
  if (dateCreated)
  {
    v10 = [(PDDPDate *)dateCreated dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"date_created"];
  }
  dateDue = self->_dateDue;
  if (dateDue)
  {
    v12 = [(PDDPDate *)dateDue dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"date_due"];
  }
  dateLastModified = self->_dateLastModified;
  if (dateLastModified)
  {
    v14 = [(PDDPDate *)dateLastModified dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"date_last_modified"];
  }
  dateOfPublication = self->_dateOfPublication;
  if (dateOfPublication)
  {
    v16 = [(PDDPDate *)dateOfPublication dictionaryRepresentation];
    [v4 setObject:v16 forKey:@"date_of_publication"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v17 = +[NSNumber numberWithBool:self->_isReviewed];
    [v4 setObject:v17 forKey:@"is_reviewed"];
  }
  dateLastReviewed = self->_dateLastReviewed;
  if (dateLastReviewed)
  {
    v19 = [(PDDPDate *)dateLastReviewed dictionaryRepresentation];
    [v4 setObject:v19 forKey:@"date_last_reviewed"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t publishingState = self->_publishingState;
    if (publishingState >= 9)
    {
      v21 = +[NSString stringWithFormat:@"(unknown: %i)", self->_publishingState];
    }
    else
    {
      v21 = off_1001F3A40[publishingState];
    }
    [v4 setObject:v21 forKey:@"publishing_state"];
  }
  status = self->_status;
  if (status)
  {
    v23 = [(PDDPStatus *)status dictionaryRepresentation];
    [v4 setObject:v23 forKey:@"status"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v25 = +[NSNumber numberWithUnsignedLongLong:self->_flags];
    [v4 setObject:v25 forKey:@"flags"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 3)
    {
      v27 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    else
    {
      v27 = off_1001F3A88[type];
    }
    [v4 setObject:v27 forKey:@"type"];
  }
  publicShareLink = self->_publicShareLink;
  if (publicShareLink) {
    [v4 setObject:publicShareLink forKey:@"public_share_link"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v29 = +[NSNumber numberWithInt:self->_version];
    [v4 setObject:v29 forKey:@"version"];
  }
  classIds = self->_classIds;
  if (classIds) {
    [v4 setObject:classIds forKey:@"class_ids"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100097A38((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_objectId) {
    PBDataWriterWriteStringField();
  }
  if (self->_appIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_instructions) {
    PBDataWriterWriteStringField();
  }
  if (self->_dateCreated) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dateDue) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dateLastModified) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dateOfPublication) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_dateLastReviewed) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_status) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_publicShareLink) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_classIds;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_objectId)
  {
    objc_msgSend(v4, "setObjectId:");
    id v4 = v10;
  }
  if (self->_appIdentifier)
  {
    objc_msgSend(v10, "setAppIdentifier:");
    id v4 = v10;
  }
  if (self->_title)
  {
    objc_msgSend(v10, "setTitle:");
    id v4 = v10;
  }
  if (self->_instructions)
  {
    objc_msgSend(v10, "setInstructions:");
    id v4 = v10;
  }
  if (self->_dateCreated)
  {
    objc_msgSend(v10, "setDateCreated:");
    id v4 = v10;
  }
  if (self->_dateDue)
  {
    objc_msgSend(v10, "setDateDue:");
    id v4 = v10;
  }
  if (self->_dateLastModified)
  {
    objc_msgSend(v10, "setDateLastModified:");
    id v4 = v10;
  }
  if (self->_dateOfPublication)
  {
    objc_msgSend(v10, "setDateOfPublication:");
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((unsigned char *)v4 + 128) = self->_isReviewed;
    *((unsigned char *)v4 + 132) |= 0x10u;
  }
  if (self->_dateLastReviewed)
  {
    objc_msgSend(v10, "setDateLastReviewed:");
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_publishingState;
    *((unsigned char *)v4 + 132) |= 2u;
  }
  if (self->_status)
  {
    objc_msgSend(v10, "setStatus:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_flags;
    *((unsigned char *)v4 + 132) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 30) = self->_type;
    *((unsigned char *)v4 + 132) |= 4u;
  }
  if (self->_publicShareLink)
  {
    objc_msgSend(v10, "setPublicShareLink:");
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v4 + 31) = self->_version;
    *((unsigned char *)v4 + 132) |= 8u;
  }
  if ([(PDDPHandout *)self classIdsCount])
  {
    [v10 clearClassIds];
    unint64_t v6 = [(PDDPHandout *)self classIdsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(PDDPHandout *)self classIdsAtIndex:i];
        [v10 addClassIds:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_objectId copyWithZone:a3];
  unint64_t v7 = (void *)v5[10];
  v5[10] = v6;

  id v8 = [(NSString *)self->_appIdentifier copyWithZone:a3];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(NSString *)self->_title copyWithZone:a3];
  long long v11 = (void *)v5[14];
  v5[14] = v10;

  id v12 = [(NSString *)self->_instructions copyWithZone:a3];
  long long v13 = (void *)v5[9];
  v5[9] = v12;

  id v14 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  v15 = (void *)v5[4];
  v5[4] = v14;

  id v16 = [(PDDPDate *)self->_dateDue copyWithZone:a3];
  v17 = (void *)v5[5];
  v5[5] = v16;

  id v18 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  v19 = (void *)v5[6];
  v5[6] = v18;

  id v20 = [(PDDPDate *)self->_dateOfPublication copyWithZone:a3];
  v21 = (void *)v5[8];
  v5[8] = v20;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((unsigned char *)v5 + 128) = self->_isReviewed;
    *((unsigned char *)v5 + 132) |= 0x10u;
  }
  id v22 = [(PDDPDate *)self->_dateLastReviewed copyWithZone:a3];
  v23 = (void *)v5[7];
  v5[7] = v22;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v5 + 24) = self->_publishingState;
    *((unsigned char *)v5 + 132) |= 2u;
  }
  id v24 = [(PDDPStatus *)self->_status copyWithZone:a3];
  v25 = (void *)v5[13];
  v5[13] = v24;

  char has = (char)self->_has;
  if (has)
  {
    v5[1] = self->_flags;
    *((unsigned char *)v5 + 132) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v5 + 30) = self->_type;
    *((unsigned char *)v5 + 132) |= 4u;
  }
  id v27 = [(NSString *)self->_publicShareLink copyWithZone:a3];
  v28 = (void *)v5[11];
  v5[11] = v27;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v5 + 31) = self->_version;
    *((unsigned char *)v5 + 132) |= 8u;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v29 = self->_classIds;
  id v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v31; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v37 != v32) {
          objc_enumerationMutation(v29);
        }
        id v34 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "copyWithZone:", a3, (void)v36);
        [v5 addClassIds:v34];
      }
      id v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v31);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_57;
  }
  objectId = self->_objectId;
  if ((unint64_t)objectId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](objectId, "isEqual:")) {
      goto LABEL_57;
    }
  }
  appIdentifier = self->_appIdentifier;
  if ((unint64_t)appIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](appIdentifier, "isEqual:")) {
      goto LABEL_57;
    }
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_57;
    }
  }
  instructions = self->_instructions;
  if ((unint64_t)instructions | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](instructions, "isEqual:")) {
      goto LABEL_57;
    }
  }
  dateCreated = self->_dateCreated;
  if ((unint64_t)dateCreated | *((void *)v4 + 4))
  {
    if (!-[PDDPDate isEqual:](dateCreated, "isEqual:")) {
      goto LABEL_57;
    }
  }
  dateDue = self->_dateDue;
  if ((unint64_t)dateDue | *((void *)v4 + 5))
  {
    if (!-[PDDPDate isEqual:](dateDue, "isEqual:")) {
      goto LABEL_57;
    }
  }
  dateLastModified = self->_dateLastModified;
  if ((unint64_t)dateLastModified | *((void *)v4 + 6))
  {
    if (!-[PDDPDate isEqual:](dateLastModified, "isEqual:")) {
      goto LABEL_57;
    }
  }
  dateOfPublication = self->_dateOfPublication;
  if ((unint64_t)dateOfPublication | *((void *)v4 + 8))
  {
    if (!-[PDDPDate isEqual:](dateOfPublication, "isEqual:")) {
      goto LABEL_57;
    }
  }
  char has = (char)self->_has;
  char v14 = *((unsigned char *)v4 + 132);
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 132) & 0x10) == 0) {
      goto LABEL_57;
    }
    if (self->_isReviewed)
    {
      if (!*((unsigned char *)v4 + 128)) {
        goto LABEL_57;
      }
    }
    else if (*((unsigned char *)v4 + 128))
    {
      goto LABEL_57;
    }
  }
  else if ((*((unsigned char *)v4 + 132) & 0x10) != 0)
  {
    goto LABEL_57;
  }
  dateLastReviewed = self->_dateLastReviewed;
  if ((unint64_t)dateLastReviewed | *((void *)v4 + 7))
  {
    if (!-[PDDPDate isEqual:](dateLastReviewed, "isEqual:")) {
      goto LABEL_57;
    }
    char has = (char)self->_has;
    char v14 = *((unsigned char *)v4 + 132);
  }
  if ((has & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_publishingState != *((_DWORD *)v4 + 24)) {
      goto LABEL_57;
    }
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_57;
  }
  status = self->_status;
  if ((unint64_t)status | *((void *)v4 + 13))
  {
    if (!-[PDDPStatus isEqual:](status, "isEqual:")) {
      goto LABEL_57;
    }
    char has = (char)self->_has;
    char v14 = *((unsigned char *)v4 + 132);
  }
  if (has)
  {
    if ((v14 & 1) == 0 || self->_flags != *((void *)v4 + 1)) {
      goto LABEL_57;
    }
  }
  else if (v14)
  {
    goto LABEL_57;
  }
  if ((has & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_type != *((_DWORD *)v4 + 30)) {
      goto LABEL_57;
    }
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_57;
  }
  publicShareLink = self->_publicShareLink;
  if ((unint64_t)publicShareLink | *((void *)v4 + 11))
  {
    if (-[NSString isEqual:](publicShareLink, "isEqual:"))
    {
      char has = (char)self->_has;
      char v14 = *((unsigned char *)v4 + 132);
      goto LABEL_50;
    }
LABEL_57:
    unsigned __int8 v19 = 0;
    goto LABEL_58;
  }
LABEL_50:
  if ((has & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_version != *((_DWORD *)v4 + 31)) {
      goto LABEL_57;
    }
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_57;
  }
  classIds = self->_classIds;
  if ((unint64_t)classIds | *((void *)v4 + 3)) {
    unsigned __int8 v19 = -[NSMutableArray isEqual:](classIds, "isEqual:");
  }
  else {
    unsigned __int8 v19 = 1;
  }
LABEL_58:

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v19 = [(NSString *)self->_objectId hash];
  NSUInteger v18 = [(NSString *)self->_appIdentifier hash];
  NSUInteger v17 = [(NSString *)self->_title hash];
  NSUInteger v16 = [(NSString *)self->_instructions hash];
  unint64_t v15 = [(PDDPDate *)self->_dateCreated hash];
  unint64_t v14 = [(PDDPDate *)self->_dateDue hash];
  unint64_t v13 = [(PDDPDate *)self->_dateLastModified hash];
  unint64_t v3 = [(PDDPDate *)self->_dateOfPublication hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v4 = 2654435761 * self->_isReviewed;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(PDDPDate *)self->_dateLastReviewed hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_publishingState;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(PDDPStatus *)self->_status hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v8 = 2654435761u * self->_flags;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_9:
      uint64_t v9 = 2654435761 * self->_type;
      goto LABEL_12;
    }
  }
  uint64_t v9 = 0;
LABEL_12:
  NSUInteger v10 = [(NSString *)self->_publicShareLink hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v11 = 2654435761 * self->_version;
  }
  else {
    uint64_t v11 = 0;
  }
  return v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ (unint64_t)[(NSMutableArray *)self->_classIds hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 10)) {
    -[PDDPHandout setObjectId:](self, "setObjectId:");
  }
  if (*((void *)v4 + 2)) {
    -[PDDPHandout setAppIdentifier:](self, "setAppIdentifier:");
  }
  if (*((void *)v4 + 14)) {
    -[PDDPHandout setTitle:](self, "setTitle:");
  }
  if (*((void *)v4 + 9)) {
    -[PDDPHandout setInstructions:](self, "setInstructions:");
  }
  dateCreated = self->_dateCreated;
  uint64_t v6 = *((void *)v4 + 4);
  if (dateCreated)
  {
    if (v6) {
      -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PDDPHandout setDateCreated:](self, "setDateCreated:");
  }
  dateDue = self->_dateDue;
  uint64_t v8 = *((void *)v4 + 5);
  if (dateDue)
  {
    if (v8) {
      -[PDDPDate mergeFrom:](dateDue, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PDDPHandout setDateDue:](self, "setDateDue:");
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v10 = *((void *)v4 + 6);
  if (dateLastModified)
  {
    if (v10) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[PDDPHandout setDateLastModified:](self, "setDateLastModified:");
  }
  dateOfPublication = self->_dateOfPublication;
  uint64_t v12 = *((void *)v4 + 8);
  if (dateOfPublication)
  {
    if (v12) {
      -[PDDPDate mergeFrom:](dateOfPublication, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[PDDPHandout setDateOfPublication:](self, "setDateOfPublication:");
  }
  if ((*((unsigned char *)v4 + 132) & 0x10) != 0)
  {
    self->_isReviewed = *((unsigned char *)v4 + 128);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  dateLastReviewed = self->_dateLastReviewed;
  uint64_t v14 = *((void *)v4 + 7);
  if (dateLastReviewed)
  {
    if (v14) {
      -[PDDPDate mergeFrom:](dateLastReviewed, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[PDDPHandout setDateLastReviewed:](self, "setDateLastReviewed:");
  }
  if ((*((unsigned char *)v4 + 132) & 2) != 0)
  {
    self->_uint64_t publishingState = *((_DWORD *)v4 + 24);
    *(unsigned char *)&self->_has |= 2u;
  }
  status = self->_status;
  uint64_t v16 = *((void *)v4 + 13);
  if (status)
  {
    if (v16) {
      -[PDDPStatus mergeFrom:](status, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[PDDPHandout setStatus:](self, "setStatus:");
  }
  char v17 = *((unsigned char *)v4 + 132);
  if (v17)
  {
    self->_flags = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v17 = *((unsigned char *)v4 + 132);
  }
  if ((v17 & 4) != 0)
  {
    self->_uint64_t type = *((_DWORD *)v4 + 30);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 11)) {
    -[PDDPHandout setPublicShareLink:](self, "setPublicShareLink:");
  }
  if ((*((unsigned char *)v4 + 132) & 8) != 0)
  {
    self->_version = *((_DWORD *)v4 + 31);
    *(unsigned char *)&self->_has |= 8u;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v18 = *((id *)v4 + 3);
  id v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v20; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        -[PDDPHandout addClassIds:](self, "addClassIds:", *(void *)(*((void *)&v23 + 1) + 8 * i), (void)v23);
      }
      id v20 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v20);
  }
}

- (NSString)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
{
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)instructions
{
  return self->_instructions;
}

- (void)setInstructions:(id)a3
{
}

- (PDDPDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
}

- (PDDPDate)dateDue
{
  return self->_dateDue;
}

- (void)setDateDue:(id)a3
{
}

- (PDDPDate)dateLastModified
{
  return self->_dateLastModified;
}

- (void)setDateLastModified:(id)a3
{
}

- (PDDPDate)dateOfPublication
{
  return self->_dateOfPublication;
}

- (void)setDateOfPublication:(id)a3
{
}

- (BOOL)isReviewed
{
  return self->_isReviewed;
}

- (PDDPDate)dateLastReviewed
{
  return self->_dateLastReviewed;
}

- (void)setDateLastReviewed:(id)a3
{
}

- (PDDPStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (unint64_t)flags
{
  return self->_flags;
}

- (NSString)publicShareLink
{
  return self->_publicShareLink;
}

- (void)setPublicShareLink:(id)a3
{
}

- (int)version
{
  return self->_version;
}

- (NSMutableArray)classIds
{
  return self->_classIds;
}

- (void)setClassIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_publicShareLink, 0);
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_dateOfPublication, 0);
  objc_storeStrong((id *)&self->_dateLastReviewed, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateDue, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_classIds, 0);

  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

@end