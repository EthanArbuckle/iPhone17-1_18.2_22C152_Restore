@interface PDDPAssetReference
+ (Class)classIdsType;
- (BOOL)hasAppIdentifier;
- (BOOL)hasCkOwnerName;
- (BOOL)hasCkShareOwnerName;
- (BOOL)hasCkShareRecordName;
- (BOOL)hasCkShareZoneName;
- (BOOL)hasCkUuid;
- (BOOL)hasCkZoneName;
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasDisplayOrder;
- (BOOL)hasDurationSeconds;
- (BOOL)hasFileSizeBytes;
- (BOOL)hasFileUrl;
- (BOOL)hasFileUttype;
- (BOOL)hasIcloudDriveContainerName;
- (BOOL)hasIcloudDriveRelativeFilePath;
- (BOOL)hasIsOriginal;
- (BOOL)hasObjectId;
- (BOOL)hasOriginalFilename;
- (BOOL)hasOwnerId;
- (BOOL)hasParentEntityType;
- (BOOL)hasParentObjectId;
- (BOOL)hasTitle;
- (BOOL)hasType;
- (BOOL)hasWebUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOriginal;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)classIds;
- (NSString)appIdentifier;
- (NSString)ckOwnerName;
- (NSString)ckShareOwnerName;
- (NSString)ckShareRecordName;
- (NSString)ckShareZoneName;
- (NSString)ckUuid;
- (NSString)ckZoneName;
- (NSString)fileUrl;
- (NSString)fileUttype;
- (NSString)icloudDriveContainerName;
- (NSString)icloudDriveRelativeFilePath;
- (NSString)objectId;
- (NSString)originalFilename;
- (NSString)ownerId;
- (NSString)parentObjectId;
- (NSString)title;
- (NSString)webUrl;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (double)durationSeconds;
- (id)classIdsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)parentEntityTypeAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsParentEntityType:(id)a3;
- (int)StringAsType:(id)a3;
- (int)displayOrder;
- (int)parentEntityType;
- (int)type;
- (int64_t)fileSizeBytes;
- (unint64_t)classIdsCount;
- (unint64_t)hash;
- (void)addClassIds:(id)a3;
- (void)clearClassIds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setCkOwnerName:(id)a3;
- (void)setCkShareOwnerName:(id)a3;
- (void)setCkShareRecordName:(id)a3;
- (void)setCkShareZoneName:(id)a3;
- (void)setCkUuid:(id)a3;
- (void)setCkZoneName:(id)a3;
- (void)setClassIds:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setDisplayOrder:(int)a3;
- (void)setDurationSeconds:(double)a3;
- (void)setFileSizeBytes:(int64_t)a3;
- (void)setFileUrl:(id)a3;
- (void)setFileUttype:(id)a3;
- (void)setHasDisplayOrder:(BOOL)a3;
- (void)setHasDurationSeconds:(BOOL)a3;
- (void)setHasFileSizeBytes:(BOOL)a3;
- (void)setHasIsOriginal:(BOOL)a3;
- (void)setHasParentEntityType:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIcloudDriveContainerName:(id)a3;
- (void)setIcloudDriveRelativeFilePath:(id)a3;
- (void)setIsOriginal:(BOOL)a3;
- (void)setObjectId:(id)a3;
- (void)setOriginalFilename:(id)a3;
- (void)setOwnerId:(id)a3;
- (void)setParentEntityType:(int)a3;
- (void)setParentObjectId:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int)a3;
- (void)setWebUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPAssetReference

- (int)type
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 4)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_1001F5470[a3];
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
  else if ([v3 isEqualToString:@"ICLOUD_DRIVE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WEB_URL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CLOUDKIT_ASSET"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasObjectId
{
  return self->_objectId != 0;
}

- (BOOL)hasParentObjectId
{
  return self->_parentObjectId != 0;
}

- (BOOL)hasCkZoneName
{
  return self->_ckZoneName != 0;
}

- (BOOL)hasCkOwnerName
{
  return self->_ckOwnerName != 0;
}

- (BOOL)hasCkUuid
{
  return self->_ckUuid != 0;
}

- (BOOL)hasAppIdentifier
{
  return self->_appIdentifier != 0;
}

- (BOOL)hasOwnerId
{
  return self->_ownerId != 0;
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (int)parentEntityType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_parentEntityType;
  }
  else {
    return 0;
  }
}

- (void)setParentEntityType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_parentEntityType = a3;
}

- (void)setHasParentEntityType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasParentEntityType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)parentEntityTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_1001F5490[a3];
  }

  return v3;
}

- (int)StringAsParentEntityType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PARENT_ENTITY_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"HANDOUT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HANDOUT_ATTACHMENT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SURVEY_STEP"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SURVEY_STEP_ANSWER"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MULTIPLE_CHOICE_OPTION_ITEM"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"STATE_CHANGE_PAYLOAD"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasIcloudDriveContainerName
{
  return self->_icloudDriveContainerName != 0;
}

- (BOOL)hasIcloudDriveRelativeFilePath
{
  return self->_icloudDriveRelativeFilePath != 0;
}

- (BOOL)hasFileUrl
{
  return self->_fileUrl != 0;
}

- (BOOL)hasCkShareZoneName
{
  return self->_ckShareZoneName != 0;
}

- (BOOL)hasCkShareOwnerName
{
  return self->_ckShareOwnerName != 0;
}

- (BOOL)hasCkShareRecordName
{
  return self->_ckShareRecordName != 0;
}

- (void)setIsOriginal:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isOriginal = a3;
}

- (void)setHasIsOriginal:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsOriginal
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
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

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setFileSizeBytes:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_fileSizeBytes = a3;
}

- (void)setHasFileSizeBytes:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFileSizeBytes
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasFileUttype
{
  return self->_fileUttype != 0;
}

- (void)setDisplayOrder:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_displayOrder = a3;
}

- (void)setHasDisplayOrder:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDisplayOrder
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasWebUrl
{
  return self->_webUrl != 0;
}

- (BOOL)hasOriginalFilename
{
  return self->_originalFilename != 0;
}

- (void)setDurationSeconds:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_durationSeconds = a3;
}

- (void)setHasDurationSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDurationSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPAssetReference;
  char v3 = [(PDDPAssetReference *)&v7 description];
  id v4 = [(PDDPAssetReference *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 4)
    {
      v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    else
    {
      v5 = off_1001F5470[type];
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  objectId = self->_objectId;
  if (objectId) {
    [v3 setObject:objectId forKey:@"object_id"];
  }
  parentObjectId = self->_parentObjectId;
  if (parentObjectId) {
    [v3 setObject:parentObjectId forKey:@"parent_object_id"];
  }
  ckZoneName = self->_ckZoneName;
  if (ckZoneName) {
    [v3 setObject:ckZoneName forKey:@"ck_zone_name"];
  }
  ckOwnerName = self->_ckOwnerName;
  if (ckOwnerName) {
    [v3 setObject:ckOwnerName forKey:@"ck_owner_name"];
  }
  ckUuid = self->_ckUuid;
  if (ckUuid) {
    [v3 setObject:ckUuid forKey:@"ck_uuid"];
  }
  appIdentifier = self->_appIdentifier;
  if (appIdentifier) {
    [v3 setObject:appIdentifier forKey:@"app_identifier"];
  }
  ownerId = self->_ownerId;
  if (ownerId) {
    [v3 setObject:ownerId forKey:@"owner_id"];
  }
  dateCreated = self->_dateCreated;
  if (dateCreated)
  {
    v14 = [(PDDPDate *)dateCreated dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"date_created"];
  }
  dateLastModified = self->_dateLastModified;
  if (dateLastModified)
  {
    v16 = [(PDDPDate *)dateLastModified dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"date_last_modified"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t parentEntityType = self->_parentEntityType;
    if (parentEntityType >= 7)
    {
      v18 = +[NSString stringWithFormat:@"(unknown: %i)", self->_parentEntityType];
    }
    else
    {
      v18 = off_1001F5490[parentEntityType];
    }
    [v3 setObject:v18 forKey:@"parent_entity_type"];
  }
  icloudDriveContainerName = self->_icloudDriveContainerName;
  if (icloudDriveContainerName) {
    [v3 setObject:icloudDriveContainerName forKey:@"icloud_drive_container_name"];
  }
  icloudDriveRelativeFilePath = self->_icloudDriveRelativeFilePath;
  if (icloudDriveRelativeFilePath) {
    [v3 setObject:icloudDriveRelativeFilePath forKey:@"icloud_drive_relative_file_path"];
  }
  fileUrl = self->_fileUrl;
  if (fileUrl) {
    [v3 setObject:fileUrl forKey:@"file_url"];
  }
  ckShareZoneName = self->_ckShareZoneName;
  if (ckShareZoneName) {
    [v3 setObject:ckShareZoneName forKey:@"ck_share_zone_name"];
  }
  ckShareOwnerName = self->_ckShareOwnerName;
  if (ckShareOwnerName) {
    [v3 setObject:ckShareOwnerName forKey:@"ck_share_owner_name"];
  }
  ckShareRecordName = self->_ckShareRecordName;
  if (ckShareRecordName) {
    [v3 setObject:ckShareRecordName forKey:@"ck_share_record_name"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v25 = +[NSNumber numberWithBool:self->_isOriginal];
    [v3 setObject:v25 forKey:@"is_original"];
  }
  classIds = self->_classIds;
  if (classIds) {
    [v3 setObject:classIds forKey:@"class_ids"];
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v28 = +[NSNumber numberWithLongLong:self->_fileSizeBytes];
    [v3 setObject:v28 forKey:@"file_size_bytes"];
  }
  fileUtuint64_t type = self->_fileUttype;
  if (fileUttype) {
    [v3 setObject:fileUttype forKey:@"file_uttype"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v30 = +[NSNumber numberWithInt:self->_displayOrder];
    [v3 setObject:v30 forKey:@"display_order"];
  }
  webUrl = self->_webUrl;
  if (webUrl) {
    [v3 setObject:webUrl forKey:@"web_url"];
  }
  originalFilename = self->_originalFilename;
  if (originalFilename) {
    [v3 setObject:originalFilename forKey:@"original_filename"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v33 = +[NSNumber numberWithDouble:self->_durationSeconds];
    [v3 setObject:v33 forKey:@"duration_seconds"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100116BC0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_objectId) {
    PBDataWriterWriteStringField();
  }
  if (self->_parentObjectId) {
    PBDataWriterWriteStringField();
  }
  if (self->_ckZoneName) {
    PBDataWriterWriteStringField();
  }
  if (self->_ckOwnerName) {
    PBDataWriterWriteStringField();
  }
  if (self->_ckUuid) {
    PBDataWriterWriteStringField();
  }
  if (self->_icloudDriveContainerName) {
    PBDataWriterWriteStringField();
  }
  if (self->_icloudDriveRelativeFilePath) {
    PBDataWriterWriteStringField();
  }
  if (self->_fileUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_appIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_ownerId) {
    PBDataWriterWriteStringField();
  }
  if (self->_ckShareZoneName) {
    PBDataWriterWriteStringField();
  }
  if (self->_ckShareOwnerName) {
    PBDataWriterWriteStringField();
  }
  if (self->_ckShareRecordName) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_fileUttype) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_webUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_originalFilename) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
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

  if (self->_dateCreated) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dateLastModified) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v4[48] = self->_type;
    *((unsigned char *)v4 + 212) |= 0x10u;
  }
  long long v11 = v4;
  if (self->_objectId)
  {
    objc_msgSend(v4, "setObjectId:");
    id v4 = v11;
  }
  if (self->_parentObjectId)
  {
    objc_msgSend(v11, "setParentObjectId:");
    id v4 = v11;
  }
  if (self->_ckZoneName)
  {
    objc_msgSend(v11, "setCkZoneName:");
    id v4 = v11;
  }
  if (self->_ckOwnerName)
  {
    objc_msgSend(v11, "setCkOwnerName:");
    id v4 = v11;
  }
  if (self->_ckUuid)
  {
    objc_msgSend(v11, "setCkUuid:");
    id v4 = v11;
  }
  if (self->_icloudDriveContainerName)
  {
    objc_msgSend(v11, "setIcloudDriveContainerName:");
    id v4 = v11;
  }
  if (self->_icloudDriveRelativeFilePath)
  {
    objc_msgSend(v11, "setIcloudDriveRelativeFilePath:");
    id v4 = v11;
  }
  if (self->_fileUrl)
  {
    objc_msgSend(v11, "setFileUrl:");
    id v4 = v11;
  }
  if (self->_appIdentifier)
  {
    objc_msgSend(v11, "setAppIdentifier:");
    id v4 = v11;
  }
  if (self->_ownerId)
  {
    objc_msgSend(v11, "setOwnerId:");
    id v4 = v11;
  }
  if (self->_ckShareZoneName)
  {
    objc_msgSend(v11, "setCkShareZoneName:");
    id v4 = v11;
  }
  if (self->_ckShareOwnerName)
  {
    objc_msgSend(v11, "setCkShareOwnerName:");
    id v4 = v11;
  }
  if (self->_ckShareRecordName)
  {
    objc_msgSend(v11, "setCkShareRecordName:");
    id v4 = v11;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((unsigned char *)v4 + 208) = self->_isOriginal;
    *((unsigned char *)v4 + 212) |= 0x20u;
  }
  if (self->_title)
  {
    objc_msgSend(v11, "setTitle:");
    id v4 = v11;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_fileSizeBytes;
    *((unsigned char *)v4 + 212) |= 2u;
  }
  if (self->_fileUttype)
  {
    objc_msgSend(v11, "setFileUttype:");
    id v4 = v11;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[26] = self->_displayOrder;
    *((unsigned char *)v4 + 212) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v4[42] = self->_parentEntityType;
    *((unsigned char *)v4 + 212) |= 8u;
  }
  if (self->_webUrl)
  {
    objc_msgSend(v11, "setWebUrl:");
    id v4 = v11;
  }
  if (self->_originalFilename)
  {
    objc_msgSend(v11, "setOriginalFilename:");
    id v4 = v11;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_durationSeconds;
    *((unsigned char *)v4 + 212) |= 1u;
  }
  if ([(PDDPAssetReference *)self classIdsCount])
  {
    [v11 clearClassIds];
    unint64_t v6 = [(PDDPAssetReference *)self classIdsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(PDDPAssetReference *)self classIdsAtIndex:i];
        [v11 addClassIds:v9];
      }
    }
  }
  if (self->_dateCreated) {
    objc_msgSend(v11, "setDateCreated:");
  }
  v10 = v11;
  if (self->_dateLastModified)
  {
    objc_msgSend(v11, "setDateLastModified:");
    v10 = v11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v5[48] = self->_type;
    *((unsigned char *)v5 + 212) |= 0x10u;
  }
  id v7 = [(NSString *)self->_objectId copyWithZone:a3];
  id v8 = (void *)v6[18];
  v6[18] = v7;

  id v9 = [(NSString *)self->_parentObjectId copyWithZone:a3];
  v10 = (void *)v6[22];
  v6[22] = v9;

  id v11 = [(NSString *)self->_ckZoneName copyWithZone:a3];
  long long v12 = (void *)v6[9];
  v6[9] = v11;

  id v13 = [(NSString *)self->_ckOwnerName copyWithZone:a3];
  long long v14 = (void *)v6[4];
  v6[4] = v13;

  id v15 = [(NSString *)self->_ckUuid copyWithZone:a3];
  v16 = (void *)v6[8];
  v6[8] = v15;

  id v17 = [(NSString *)self->_icloudDriveContainerName copyWithZone:a3];
  v18 = (void *)v6[16];
  v6[16] = v17;

  id v19 = [(NSString *)self->_icloudDriveRelativeFilePath copyWithZone:a3];
  v20 = (void *)v6[17];
  v6[17] = v19;

  id v21 = [(NSString *)self->_fileUrl copyWithZone:a3];
  v22 = (void *)v6[14];
  v6[14] = v21;

  id v23 = [(NSString *)self->_appIdentifier copyWithZone:a3];
  v24 = (void *)v6[3];
  v6[3] = v23;

  id v25 = [(NSString *)self->_ownerId copyWithZone:a3];
  v26 = (void *)v6[20];
  v6[20] = v25;

  id v27 = [(NSString *)self->_ckShareZoneName copyWithZone:a3];
  v28 = (void *)v6[7];
  v6[7] = v27;

  id v29 = [(NSString *)self->_ckShareOwnerName copyWithZone:a3];
  v30 = (void *)v6[5];
  v6[5] = v29;

  id v31 = [(NSString *)self->_ckShareRecordName copyWithZone:a3];
  v32 = (void *)v6[6];
  v6[6] = v31;

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((unsigned char *)v6 + 208) = self->_isOriginal;
    *((unsigned char *)v6 + 212) |= 0x20u;
  }
  id v33 = [(NSString *)self->_title copyWithZone:a3];
  v34 = (void *)v6[23];
  v6[23] = v33;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6[2] = self->_fileSizeBytes;
    *((unsigned char *)v6 + 212) |= 2u;
  }
  id v35 = [(NSString *)self->_fileUttype copyWithZone:a3];
  v36 = (void *)v6[15];
  v6[15] = v35;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v6 + 26) = self->_displayOrder;
    *((unsigned char *)v6 + 212) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_DWORD *)v6 + 42) = self->_parentEntityType;
    *((unsigned char *)v6 + 212) |= 8u;
  }
  id v38 = [(NSString *)self->_webUrl copyWithZone:a3];
  v39 = (void *)v6[25];
  v6[25] = v38;

  id v40 = [(NSString *)self->_originalFilename copyWithZone:a3];
  v41 = (void *)v6[19];
  v6[19] = v40;

  if (*(unsigned char *)&self->_has)
  {
    v6[1] = *(void *)&self->_durationSeconds;
    *((unsigned char *)v6 + 212) |= 1u;
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v42 = self->_classIds;
  id v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v43)
  {
    id v44 = v43;
    uint64_t v45 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v44; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v54 != v45) {
          objc_enumerationMutation(v42);
        }
        id v47 = objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * i), "copyWithZone:", a3, (void)v53);
        [v6 addClassIds:v47];
      }
      id v44 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v53 objects:v57 count:16];
    }
    while (v44);
  }

  id v48 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  v49 = (void *)v6[11];
  v6[11] = v48;

  id v50 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  v51 = (void *)v6[12];
  v6[12] = v50;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_77;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 212) & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 48)) {
      goto LABEL_77;
    }
  }
  else if ((*((unsigned char *)v4 + 212) & 0x10) != 0)
  {
    goto LABEL_77;
  }
  objectId = self->_objectId;
  if ((unint64_t)objectId | *((void *)v4 + 18) && !-[NSString isEqual:](objectId, "isEqual:")) {
    goto LABEL_77;
  }
  parentObjectId = self->_parentObjectId;
  if ((unint64_t)parentObjectId | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](parentObjectId, "isEqual:")) {
      goto LABEL_77;
    }
  }
  ckZoneName = self->_ckZoneName;
  if ((unint64_t)ckZoneName | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](ckZoneName, "isEqual:")) {
      goto LABEL_77;
    }
  }
  ckOwnerName = self->_ckOwnerName;
  if ((unint64_t)ckOwnerName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](ckOwnerName, "isEqual:")) {
      goto LABEL_77;
    }
  }
  ckUuid = self->_ckUuid;
  if ((unint64_t)ckUuid | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](ckUuid, "isEqual:")) {
      goto LABEL_77;
    }
  }
  icloudDriveContainerName = self->_icloudDriveContainerName;
  if ((unint64_t)icloudDriveContainerName | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](icloudDriveContainerName, "isEqual:")) {
      goto LABEL_77;
    }
  }
  icloudDriveRelativeFilePath = self->_icloudDriveRelativeFilePath;
  if ((unint64_t)icloudDriveRelativeFilePath | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](icloudDriveRelativeFilePath, "isEqual:")) {
      goto LABEL_77;
    }
  }
  fileUrl = self->_fileUrl;
  if ((unint64_t)fileUrl | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](fileUrl, "isEqual:")) {
      goto LABEL_77;
    }
  }
  appIdentifier = self->_appIdentifier;
  if ((unint64_t)appIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](appIdentifier, "isEqual:")) {
      goto LABEL_77;
    }
  }
  ownerId = self->_ownerId;
  if ((unint64_t)ownerId | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](ownerId, "isEqual:")) {
      goto LABEL_77;
    }
  }
  ckShareZoneName = self->_ckShareZoneName;
  if ((unint64_t)ckShareZoneName | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](ckShareZoneName, "isEqual:")) {
      goto LABEL_77;
    }
  }
  ckShareOwnerName = self->_ckShareOwnerName;
  if ((unint64_t)ckShareOwnerName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](ckShareOwnerName, "isEqual:")) {
      goto LABEL_77;
    }
  }
  ckShareRecordName = self->_ckShareRecordName;
  if ((unint64_t)ckShareRecordName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](ckShareRecordName, "isEqual:")) {
      goto LABEL_77;
    }
  }
  char has = (char)self->_has;
  char v19 = *((unsigned char *)v4 + 212);
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 212) & 0x20) == 0) {
      goto LABEL_77;
    }
    if (self->_isOriginal)
    {
      if (!*((unsigned char *)v4 + 208)) {
        goto LABEL_77;
      }
    }
    else if (*((unsigned char *)v4 + 208))
    {
      goto LABEL_77;
    }
  }
  else if ((*((unsigned char *)v4 + 212) & 0x20) != 0)
  {
    goto LABEL_77;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_77;
    }
    char has = (char)self->_has;
    char v19 = *((unsigned char *)v4 + 212);
  }
  if ((has & 2) != 0)
  {
    if ((v19 & 2) == 0 || self->_fileSizeBytes != *((void *)v4 + 2)) {
      goto LABEL_77;
    }
  }
  else if ((v19 & 2) != 0)
  {
    goto LABEL_77;
  }
  fileUtuint64_t type = self->_fileUttype;
  if ((unint64_t)fileUttype | *((void *)v4 + 15))
  {
    if (-[NSString isEqual:](fileUttype, "isEqual:"))
    {
      char has = (char)self->_has;
      char v19 = *((unsigned char *)v4 + 212);
      goto LABEL_52;
    }
LABEL_77:
    unsigned __int8 v27 = 0;
    goto LABEL_78;
  }
LABEL_52:
  if ((has & 4) != 0)
  {
    if ((v19 & 4) == 0 || self->_displayOrder != *((_DWORD *)v4 + 26)) {
      goto LABEL_77;
    }
  }
  else if ((v19 & 4) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 8) != 0)
  {
    if ((v19 & 8) == 0 || self->_parentEntityType != *((_DWORD *)v4 + 42)) {
      goto LABEL_77;
    }
  }
  else if ((v19 & 8) != 0)
  {
    goto LABEL_77;
  }
  webUrl = self->_webUrl;
  if ((unint64_t)webUrl | *((void *)v4 + 25) && !-[NSString isEqual:](webUrl, "isEqual:")) {
    goto LABEL_77;
  }
  originalFilename = self->_originalFilename;
  if ((unint64_t)originalFilename | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](originalFilename, "isEqual:")) {
      goto LABEL_77;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 212) & 1) == 0 || self->_durationSeconds != *((double *)v4 + 1)) {
      goto LABEL_77;
    }
  }
  else if (*((unsigned char *)v4 + 212))
  {
    goto LABEL_77;
  }
  classIds = self->_classIds;
  if ((unint64_t)classIds | *((void *)v4 + 10)
    && !-[NSMutableArray isEqual:](classIds, "isEqual:"))
  {
    goto LABEL_77;
  }
  dateCreated = self->_dateCreated;
  if ((unint64_t)dateCreated | *((void *)v4 + 11))
  {
    if (!-[PDDPDate isEqual:](dateCreated, "isEqual:")) {
      goto LABEL_77;
    }
  }
  dateLastModified = self->_dateLastModified;
  if ((unint64_t)dateLastModified | *((void *)v4 + 12)) {
    unsigned __int8 v27 = -[PDDPDate isEqual:](dateLastModified, "isEqual:");
  }
  else {
    unsigned __int8 v27 = 1;
  }
LABEL_78:

  return v27;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v33 = 2654435761 * self->_type;
  }
  else {
    uint64_t v33 = 0;
  }
  NSUInteger v32 = [(NSString *)self->_objectId hash];
  NSUInteger v31 = [(NSString *)self->_parentObjectId hash];
  NSUInteger v30 = [(NSString *)self->_ckZoneName hash];
  NSUInteger v29 = [(NSString *)self->_ckOwnerName hash];
  NSUInteger v28 = [(NSString *)self->_ckUuid hash];
  NSUInteger v27 = [(NSString *)self->_icloudDriveContainerName hash];
  NSUInteger v26 = [(NSString *)self->_icloudDriveRelativeFilePath hash];
  NSUInteger v25 = [(NSString *)self->_fileUrl hash];
  NSUInteger v24 = [(NSString *)self->_appIdentifier hash];
  NSUInteger v23 = [(NSString *)self->_ownerId hash];
  NSUInteger v22 = [(NSString *)self->_ckShareZoneName hash];
  NSUInteger v21 = [(NSString *)self->_ckShareOwnerName hash];
  NSUInteger v20 = [(NSString *)self->_ckShareRecordName hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v19 = 2654435761 * self->_isOriginal;
  }
  else {
    uint64_t v19 = 0;
  }
  NSUInteger v3 = [(NSString *)self->_title hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_fileSizeBytes;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_fileUttype hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v6 = 2654435761 * self->_displayOrder;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_12:
      uint64_t v7 = 2654435761 * self->_parentEntityType;
      goto LABEL_15;
    }
  }
  uint64_t v7 = 0;
LABEL_15:
  NSUInteger v8 = [(NSString *)self->_webUrl hash];
  NSUInteger v9 = [(NSString *)self->_originalFilename hash];
  if (*(unsigned char *)&self->_has)
  {
    double durationSeconds = self->_durationSeconds;
    double v12 = -durationSeconds;
    if (durationSeconds >= 0.0) {
      double v12 = self->_durationSeconds;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  NSUInteger v15 = v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  unint64_t v16 = (unint64_t)[(NSMutableArray *)self->_classIds hash];
  unint64_t v17 = v16 ^ [(PDDPDate *)self->_dateCreated hash];
  return v15 ^ v17 ^ [(PDDPDate *)self->_dateLastModified hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  id v5 = v4;
  if ((v4[53] & 0x10) != 0)
  {
    self->_uint64_t type = v4[48];
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 18)) {
    -[PDDPAssetReference setObjectId:](self, "setObjectId:");
  }
  if (*((void *)v5 + 22)) {
    -[PDDPAssetReference setParentObjectId:](self, "setParentObjectId:");
  }
  if (*((void *)v5 + 9)) {
    -[PDDPAssetReference setCkZoneName:](self, "setCkZoneName:");
  }
  if (*((void *)v5 + 4)) {
    -[PDDPAssetReference setCkOwnerName:](self, "setCkOwnerName:");
  }
  if (*((void *)v5 + 8)) {
    -[PDDPAssetReference setCkUuid:](self, "setCkUuid:");
  }
  if (*((void *)v5 + 16)) {
    -[PDDPAssetReference setIcloudDriveContainerName:](self, "setIcloudDriveContainerName:");
  }
  if (*((void *)v5 + 17)) {
    -[PDDPAssetReference setIcloudDriveRelativeFilePath:](self, "setIcloudDriveRelativeFilePath:");
  }
  if (*((void *)v5 + 14)) {
    -[PDDPAssetReference setFileUrl:](self, "setFileUrl:");
  }
  if (*((void *)v5 + 3)) {
    -[PDDPAssetReference setAppIdentifier:](self, "setAppIdentifier:");
  }
  if (*((void *)v5 + 20)) {
    -[PDDPAssetReference setOwnerId:](self, "setOwnerId:");
  }
  if (*((void *)v5 + 7)) {
    -[PDDPAssetReference setCkShareZoneName:](self, "setCkShareZoneName:");
  }
  if (*((void *)v5 + 5)) {
    -[PDDPAssetReference setCkShareOwnerName:](self, "setCkShareOwnerName:");
  }
  if (*((void *)v5 + 6)) {
    -[PDDPAssetReference setCkShareRecordName:](self, "setCkShareRecordName:");
  }
  if ((*((unsigned char *)v5 + 212) & 0x20) != 0)
  {
    self->_isOriginal = *((unsigned char *)v5 + 208);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  if (*((void *)v5 + 23)) {
    -[PDDPAssetReference setTitle:](self, "setTitle:");
  }
  if ((*((unsigned char *)v5 + 212) & 2) != 0)
  {
    self->_fileSizeBytes = *((void *)v5 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v5 + 15)) {
    -[PDDPAssetReference setFileUttype:](self, "setFileUttype:");
  }
  char v6 = *((unsigned char *)v5 + 212);
  if ((v6 & 4) != 0)
  {
    self->_displayOrder = *((_DWORD *)v5 + 26);
    *(unsigned char *)&self->_has |= 4u;
    char v6 = *((unsigned char *)v5 + 212);
  }
  if ((v6 & 8) != 0)
  {
    self->_uint64_t parentEntityType = *((_DWORD *)v5 + 42);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v5 + 25)) {
    -[PDDPAssetReference setWebUrl:](self, "setWebUrl:");
  }
  if (*((void *)v5 + 19)) {
    -[PDDPAssetReference setOriginalFilename:](self, "setOriginalFilename:");
  }
  if (*((unsigned char *)v5 + 212))
  {
    self->_double durationSeconds = *((double *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = *((id *)v5 + 10);
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        -[PDDPAssetReference addClassIds:](self, "addClassIds:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  dateCreated = self->_dateCreated;
  uint64_t v13 = *((void *)v5 + 11);
  if (dateCreated)
  {
    if (v13) {
      -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[PDDPAssetReference setDateCreated:](self, "setDateCreated:");
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v15 = *((void *)v5 + 12);
  if (dateLastModified)
  {
    if (v15) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[PDDPAssetReference setDateLastModified:](self, "setDateLastModified:");
  }
}

- (NSString)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
{
}

- (NSString)parentObjectId
{
  return self->_parentObjectId;
}

- (void)setParentObjectId:(id)a3
{
}

- (NSString)ckZoneName
{
  return self->_ckZoneName;
}

- (void)setCkZoneName:(id)a3
{
}

- (NSString)ckOwnerName
{
  return self->_ckOwnerName;
}

- (void)setCkOwnerName:(id)a3
{
}

- (NSString)ckUuid
{
  return self->_ckUuid;
}

- (void)setCkUuid:(id)a3
{
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (NSString)ownerId
{
  return self->_ownerId;
}

- (void)setOwnerId:(id)a3
{
}

- (PDDPDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
}

- (PDDPDate)dateLastModified
{
  return self->_dateLastModified;
}

- (void)setDateLastModified:(id)a3
{
}

- (NSString)icloudDriveContainerName
{
  return self->_icloudDriveContainerName;
}

- (void)setIcloudDriveContainerName:(id)a3
{
}

- (NSString)icloudDriveRelativeFilePath
{
  return self->_icloudDriveRelativeFilePath;
}

- (void)setIcloudDriveRelativeFilePath:(id)a3
{
}

- (NSString)fileUrl
{
  return self->_fileUrl;
}

- (void)setFileUrl:(id)a3
{
}

- (NSString)ckShareZoneName
{
  return self->_ckShareZoneName;
}

- (void)setCkShareZoneName:(id)a3
{
}

- (NSString)ckShareOwnerName
{
  return self->_ckShareOwnerName;
}

- (void)setCkShareOwnerName:(id)a3
{
}

- (NSString)ckShareRecordName
{
  return self->_ckShareRecordName;
}

- (void)setCkShareRecordName:(id)a3
{
}

- (BOOL)isOriginal
{
  return self->_isOriginal;
}

- (NSMutableArray)classIds
{
  return self->_classIds;
}

- (void)setClassIds:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (int64_t)fileSizeBytes
{
  return self->_fileSizeBytes;
}

- (NSString)fileUttype
{
  return self->_fileUttype;
}

- (void)setFileUttype:(id)a3
{
}

- (int)displayOrder
{
  return self->_displayOrder;
}

- (NSString)webUrl
{
  return self->_webUrl;
}

- (void)setWebUrl:(id)a3
{
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (void)setOriginalFilename:(id)a3
{
}

- (double)durationSeconds
{
  return self->_durationSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webUrl, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_parentObjectId, 0);
  objc_storeStrong((id *)&self->_ownerId, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_icloudDriveRelativeFilePath, 0);
  objc_storeStrong((id *)&self->_icloudDriveContainerName, 0);
  objc_storeStrong((id *)&self->_fileUttype, 0);
  objc_storeStrong((id *)&self->_fileUrl, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_classIds, 0);
  objc_storeStrong((id *)&self->_ckZoneName, 0);
  objc_storeStrong((id *)&self->_ckUuid, 0);
  objc_storeStrong((id *)&self->_ckShareZoneName, 0);
  objc_storeStrong((id *)&self->_ckShareRecordName, 0);
  objc_storeStrong((id *)&self->_ckShareOwnerName, 0);
  objc_storeStrong((id *)&self->_ckOwnerName, 0);

  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

@end