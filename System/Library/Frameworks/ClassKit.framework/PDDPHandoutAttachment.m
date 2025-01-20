@interface PDDPHandoutAttachment
+ (Class)classIdsType;
+ (Class)contextPathType;
- (BOOL)contextSourceIsCatalog;
- (BOOL)hasAppBundleIdentifier;
- (BOOL)hasAppIdentifier;
- (BOOL)hasAppName;
- (BOOL)hasAppStoreIdentifier;
- (BOOL)hasContentStoreIdentifier;
- (BOOL)hasContextCustomTypeName;
- (BOOL)hasContextSourceIsCatalog;
- (BOOL)hasContextSummary;
- (BOOL)hasContextType;
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasDisplayOrder;
- (BOOL)hasIsLocked;
- (BOOL)hasObjectId;
- (BOOL)hasObjectIdPath;
- (BOOL)hasParentObjectId;
- (BOOL)hasPermissionType;
- (BOOL)hasShareType;
- (BOOL)hasStableObjectIdPath;
- (BOOL)hasTimeExpectationInSeconds;
- (BOOL)hasTitle;
- (BOOL)hasType;
- (BOOL)hasUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocked;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)classIds;
- (NSMutableArray)contextPaths;
- (NSString)appBundleIdentifier;
- (NSString)appIdentifier;
- (NSString)appName;
- (NSString)appStoreIdentifier;
- (NSString)contentStoreIdentifier;
- (NSString)contextCustomTypeName;
- (NSString)contextSummary;
- (NSString)objectId;
- (NSString)objectIdPath;
- (NSString)parentObjectId;
- (NSString)stableObjectIdPath;
- (NSString)title;
- (NSString)url;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (double)timeExpectationInSeconds;
- (id)classIdsAtIndex:(unint64_t)a3;
- (id)contextPathAtIndex:(unint64_t)a3;
- (id)contextTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)permissionTypeAsString:(int)a3;
- (id)shareTypeAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsContextType:(id)a3;
- (int)StringAsPermissionType:(id)a3;
- (int)StringAsShareType:(id)a3;
- (int)StringAsType:(id)a3;
- (int)contextType;
- (int)displayOrder;
- (int)permissionType;
- (int)shareType;
- (int)type;
- (unint64_t)classIdsCount;
- (unint64_t)contextPathsCount;
- (unint64_t)hash;
- (void)addClassIds:(id)a3;
- (void)addContextPath:(id)a3;
- (void)clearClassIds;
- (void)clearContextPaths;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAppStoreIdentifier:(id)a3;
- (void)setClassIds:(id)a3;
- (void)setContentStoreIdentifier:(id)a3;
- (void)setContextCustomTypeName:(id)a3;
- (void)setContextPaths:(id)a3;
- (void)setContextSourceIsCatalog:(BOOL)a3;
- (void)setContextSummary:(id)a3;
- (void)setContextType:(int)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setDisplayOrder:(int)a3;
- (void)setHasContextSourceIsCatalog:(BOOL)a3;
- (void)setHasContextType:(BOOL)a3;
- (void)setHasDisplayOrder:(BOOL)a3;
- (void)setHasIsLocked:(BOOL)a3;
- (void)setHasPermissionType:(BOOL)a3;
- (void)setHasShareType:(BOOL)a3;
- (void)setHasTimeExpectationInSeconds:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIsLocked:(BOOL)a3;
- (void)setObjectId:(id)a3;
- (void)setObjectIdPath:(id)a3;
- (void)setParentObjectId:(id)a3;
- (void)setPermissionType:(int)a3;
- (void)setShareType:(int)a3;
- (void)setStableObjectIdPath:(id)a3;
- (void)setTimeExpectationInSeconds:(double)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPHandoutAttachment

- (int)type
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 8)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_1001F31B8 + a3);
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

- (BOOL)hasObjectId
{
  return self->_objectId != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasParentObjectId
{
  return self->_parentObjectId != 0;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (BOOL)hasAppBundleIdentifier
{
  return self->_appBundleIdentifier != 0;
}

- (BOOL)hasAppStoreIdentifier
{
  return self->_appStoreIdentifier != 0;
}

- (BOOL)hasAppName
{
  return self->_appName != 0;
}

- (void)clearContextPaths
{
}

- (void)addContextPath:(id)a3
{
  id v4 = a3;
  contextPaths = self->_contextPaths;
  id v8 = v4;
  if (!contextPaths)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_contextPaths;
    self->_contextPaths = v6;

    id v4 = v8;
    contextPaths = self->_contextPaths;
  }
  [(NSMutableArray *)contextPaths addObject:v4];
}

- (unint64_t)contextPathsCount
{
  return (unint64_t)[(NSMutableArray *)self->_contextPaths count];
}

- (id)contextPathAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_contextPaths objectAtIndex:a3];
}

+ (Class)contextPathType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasObjectIdPath
{
  return self->_objectIdPath != 0;
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

- (void)setIsLocked:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_isLocked = a3;
}

- (void)setHasIsLocked:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasIsLocked
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasContentStoreIdentifier
{
  return self->_contentStoreIdentifier != 0;
}

- (int)shareType
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_shareType;
  }
  else {
    return 0;
  }
}

- (void)setShareType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_shareType = a3;
}

- (void)setHasShareType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasShareType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)shareTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_1001F31F8 + a3);
  }

  return v3;
}

- (int)StringAsShareType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_SHARE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"COPY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ONE_TO_ONE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ONE_TO_MANY"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasAppIdentifier
{
  return self->_appIdentifier != 0;
}

- (int)permissionType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_permissionType;
  }
  else {
    return 0;
  }
}

- (void)setPermissionType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_permissionType = a3;
}

- (void)setHasPermissionType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPermissionType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)permissionTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_1001F3218 + a3);
  }

  return v3;
}

- (int)StringAsPermissionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PERMISSION_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VIEW_ONLY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CAN_MAKE_CHANGES"])
  {
    int v4 = 2;
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
    char v3 = *(&off_1001F3230 + a3 + 1);
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

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (BOOL)hasStableObjectIdPath
{
  return self->_stableObjectIdPath != 0;
}

- (BOOL)hasContextCustomTypeName
{
  return self->_contextCustomTypeName != 0;
}

- (BOOL)hasContextSummary
{
  return self->_contextSummary != 0;
}

- (void)setContextSourceIsCatalog:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_contextSourceIsCatalog = a3;
}

- (void)setHasContextSourceIsCatalog:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasContextSourceIsCatalog
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setTimeExpectationInSeconds:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timeExpectationInSeconds = a3;
}

- (void)setHasTimeExpectationInSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeExpectationInSeconds
{
  return *(unsigned char *)&self->_has & 1;
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

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPHandoutAttachment;
  char v3 = [(PDDPHandoutAttachment *)&v7 description];
  id v4 = [(PDDPHandoutAttachment *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 8)
    {
      v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    else
    {
      v5 = *(&off_1001F31B8 + type);
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  objectId = self->_objectId;
  if (objectId) {
    [v3 setObject:objectId forKey:@"object_id"];
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  parentObjectId = self->_parentObjectId;
  if (parentObjectId) {
    [v3 setObject:parentObjectId forKey:@"parent_object_id"];
  }
  url = self->_url;
  if (url) {
    [v3 setObject:url forKey:@"url"];
  }
  appBundleIdentifier = self->_appBundleIdentifier;
  if (appBundleIdentifier) {
    [v3 setObject:appBundleIdentifier forKey:@"app_bundle_identifier"];
  }
  appStoreIdentifier = self->_appStoreIdentifier;
  if (appStoreIdentifier) {
    [v3 setObject:appStoreIdentifier forKey:@"app_store_identifier"];
  }
  appName = self->_appName;
  if (appName) {
    [v3 setObject:appName forKey:@"app_name"];
  }
  contextPaths = self->_contextPaths;
  if (contextPaths) {
    [v3 setObject:contextPaths forKey:@"context_path"];
  }
  objectIdPath = self->_objectIdPath;
  if (objectIdPath) {
    [v3 setObject:objectIdPath forKey:@"object_id_path"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v16 = +[NSNumber numberWithInt:self->_displayOrder];
    [v3 setObject:v16 forKey:@"display_order"];

    char has = (char)self->_has;
  }
  if (has < 0)
  {
    v17 = +[NSNumber numberWithBool:self->_isLocked];
    [v3 setObject:v17 forKey:@"is_locked"];
  }
  contentStoreIdentifier = self->_contentStoreIdentifier;
  if (contentStoreIdentifier) {
    [v3 setObject:contentStoreIdentifier forKey:@"content_store_identifier"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t shareType = self->_shareType;
    if (shareType >= 4)
    {
      v20 = +[NSString stringWithFormat:@"(unknown: %i)", self->_shareType];
    }
    else
    {
      v20 = *(&off_1001F31F8 + shareType);
    }
    [v3 setObject:v20 forKey:@"share_type"];
  }
  appIdentifier = self->_appIdentifier;
  if (appIdentifier) {
    [v3 setObject:appIdentifier forKey:@"app_identifier"];
  }
  char v22 = (char)self->_has;
  if ((v22 & 8) != 0)
  {
    uint64_t permissionType = self->_permissionType;
    if (permissionType >= 3)
    {
      v24 = +[NSString stringWithFormat:@"(unknown: %i)", self->_permissionType];
    }
    else
    {
      v24 = *(&off_1001F3218 + permissionType);
    }
    [v3 setObject:v24 forKey:@"permission_type"];

    char v22 = (char)self->_has;
  }
  if ((v22 & 2) != 0)
  {
    int v25 = self->_contextType + 1;
    if (v25 >= 0x13)
    {
      v26 = +[NSString stringWithFormat:@"(unknown: %i)", self->_contextType];
    }
    else
    {
      v26 = *(&off_1001F3230 + v25);
    }
    [v3 setObject:v26 forKey:@"context_type"];
  }
  dateLastModified = self->_dateLastModified;
  if (dateLastModified)
  {
    v28 = [(PDDPDate *)dateLastModified dictionaryRepresentation];
    [v3 setObject:v28 forKey:@"date_last_modified"];
  }
  stableObjectIdPath = self->_stableObjectIdPath;
  if (stableObjectIdPath) {
    [v3 setObject:stableObjectIdPath forKey:@"stable_object_id_path"];
  }
  contextCustomTypeName = self->_contextCustomTypeName;
  if (contextCustomTypeName) {
    [v3 setObject:contextCustomTypeName forKey:@"context_custom_type_name"];
  }
  contextSummary = self->_contextSummary;
  if (contextSummary) {
    [v3 setObject:contextSummary forKey:@"context_summary"];
  }
  char v32 = (char)self->_has;
  if ((v32 & 0x40) != 0)
  {
    v33 = +[NSNumber numberWithBool:self->_contextSourceIsCatalog];
    [v3 setObject:v33 forKey:@"context_source_is_catalog"];

    char v32 = (char)self->_has;
  }
  if (v32)
  {
    v34 = +[NSNumber numberWithDouble:self->_timeExpectationInSeconds];
    [v3 setObject:v34 forKey:@"time_expectation_in_seconds"];
  }
  classIds = self->_classIds;
  if (classIds) {
    [v3 setObject:classIds forKey:@"class_ids"];
  }
  dateCreated = self->_dateCreated;
  if (dateCreated)
  {
    v37 = [(PDDPDate *)dateCreated dictionaryRepresentation];
    [v3 setObject:v37 forKey:@"date_created"];
  }
  id v38 = v3;

  return v38;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10005D718((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_objectId) {
    PBDataWriterWriteStringField();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_parentObjectId) {
    PBDataWriterWriteStringField();
  }
  if (self->_url) {
    PBDataWriterWriteStringField();
  }
  if (self->_appBundleIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_appStoreIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_appName) {
    PBDataWriterWriteStringField();
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v5 = self->_contextPaths;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  if (self->_objectIdPath) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if (has < 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_contentStoreIdentifier) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_appIdentifier) {
    PBDataWriterWriteStringField();
  }
  char v11 = (char)self->_has;
  if ((v11 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v11 = (char)self->_has;
  }
  if ((v11 & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_dateLastModified) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_stableObjectIdPath) {
    PBDataWriterWriteStringField();
  }
  if (self->_contextCustomTypeName) {
    PBDataWriterWriteStringField();
  }
  if (self->_contextSummary) {
    PBDataWriterWriteStringField();
  }
  char v12 = (char)self->_has;
  if ((v12 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v12 = (char)self->_has;
  }
  if (v12) {
    PBDataWriterWriteDoubleField();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v13 = self->_classIds;
  v14 = (char *)[(NSMutableArray *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteStringField();
      }
      v15 = (char *)[(NSMutableArray *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }

  if (self->_dateCreated) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v4[42] = self->_type;
    *((unsigned char *)v4 + 188) |= 0x20u;
  }
  id v17 = v4;
  if (self->_objectId) {
    objc_msgSend(v4, "setObjectId:");
  }
  if (self->_title) {
    objc_msgSend(v17, "setTitle:");
  }
  if (self->_parentObjectId) {
    objc_msgSend(v17, "setParentObjectId:");
  }
  if (self->_url) {
    objc_msgSend(v17, "setUrl:");
  }
  if (self->_appBundleIdentifier) {
    objc_msgSend(v17, "setAppBundleIdentifier:");
  }
  if (self->_appStoreIdentifier) {
    objc_msgSend(v17, "setAppStoreIdentifier:");
  }
  if (self->_appName) {
    objc_msgSend(v17, "setAppName:");
  }
  if ([(PDDPHandoutAttachment *)self contextPathsCount])
  {
    [v17 clearContextPaths];
    unint64_t v5 = [(PDDPHandoutAttachment *)self contextPathsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PDDPHandoutAttachment *)self contextPathAtIndex:i];
        [v17 addContextPath:v8];
      }
    }
  }
  if (self->_objectIdPath) {
    objc_msgSend(v17, "setObjectIdPath:");
  }
  char has = (char)self->_has;
  v10 = v17;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v17 + 28) = self->_displayOrder;
    *((unsigned char *)v17 + 188) |= 4u;
    char has = (char)self->_has;
  }
  if (has < 0)
  {
    *((unsigned char *)v17 + 185) = self->_isLocked;
    *((unsigned char *)v17 + 188) |= 0x80u;
  }
  if (self->_contentStoreIdentifier)
  {
    objc_msgSend(v17, "setContentStoreIdentifier:");
    v10 = v17;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v10[37] = self->_shareType;
    *((unsigned char *)v10 + 188) |= 0x10u;
  }
  if (self->_appIdentifier)
  {
    objc_msgSend(v17, "setAppIdentifier:");
    v10 = v17;
  }
  char v11 = (char)self->_has;
  if ((v11 & 8) != 0)
  {
    v10[36] = self->_permissionType;
    *((unsigned char *)v10 + 188) |= 8u;
    char v11 = (char)self->_has;
  }
  if ((v11 & 2) != 0)
  {
    v10[22] = self->_contextType;
    *((unsigned char *)v10 + 188) |= 2u;
  }
  if (self->_dateLastModified)
  {
    objc_msgSend(v17, "setDateLastModified:");
    v10 = v17;
  }
  if (self->_stableObjectIdPath)
  {
    objc_msgSend(v17, "setStableObjectIdPath:");
    v10 = v17;
  }
  if (self->_contextCustomTypeName)
  {
    objc_msgSend(v17, "setContextCustomTypeName:");
    v10 = v17;
  }
  if (self->_contextSummary)
  {
    objc_msgSend(v17, "setContextSummary:");
    v10 = v17;
  }
  char v12 = (char)self->_has;
  if ((v12 & 0x40) != 0)
  {
    *((unsigned char *)v10 + 184) = self->_contextSourceIsCatalog;
    *((unsigned char *)v10 + 188) |= 0x40u;
    char v12 = (char)self->_has;
  }
  if (v12)
  {
    *((void *)v10 + 1) = *(void *)&self->_timeExpectationInSeconds;
    *((unsigned char *)v10 + 188) |= 1u;
  }
  if ([(PDDPHandoutAttachment *)self classIdsCount])
  {
    [v17 clearClassIds];
    unint64_t v13 = [(PDDPHandoutAttachment *)self classIdsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t j = 0; j != v14; ++j)
      {
        uint64_t v16 = [(PDDPHandoutAttachment *)self classIdsAtIndex:j];
        [v17 addClassIds:v16];
      }
    }
  }
  if (self->_dateCreated) {
    objc_msgSend(v17, "setDateCreated:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v5[42] = self->_type;
    *((unsigned char *)v5 + 188) |= 0x20u;
  }
  id v7 = [(NSString *)self->_objectId copyWithZone:a3];
  uint64_t v8 = (void *)v6[15];
  v6[15] = v7;

  id v9 = [(NSString *)self->_title copyWithZone:a3];
  v10 = (void *)v6[20];
  v6[20] = v9;

  id v11 = [(NSString *)self->_parentObjectId copyWithZone:a3];
  char v12 = (void *)v6[17];
  v6[17] = v11;

  id v13 = [(NSString *)self->_url copyWithZone:a3];
  unint64_t v14 = (void *)v6[22];
  v6[22] = v13;

  id v15 = [(NSString *)self->_appBundleIdentifier copyWithZone:a3];
  uint64_t v16 = (void *)v6[2];
  v6[2] = v15;

  id v17 = [(NSString *)self->_appStoreIdentifier copyWithZone:a3];
  long long v18 = (void *)v6[5];
  v6[5] = v17;

  id v19 = [(NSString *)self->_appName copyWithZone:a3];
  long long v20 = (void *)v6[4];
  v6[4] = v19;

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v21 = self->_contextPaths;
  id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v23; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v58 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = [*(id *)(*((void *)&v57 + 1) + 8 * i) copyWithZone:a3];
        [v6 addContextPath:v26];
      }
      id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v57 objects:v62 count:16];
    }
    while (v23);
  }

  id v27 = [(NSString *)self->_objectIdPath copyWithZone:a3];
  v28 = (void *)v6[16];
  v6[16] = v27;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v6 + 28) = self->_displayOrder;
    *((unsigned char *)v6 + 188) |= 4u;
    char has = (char)self->_has;
  }
  if (has < 0)
  {
    *((unsigned char *)v6 + 185) = self->_isLocked;
    *((unsigned char *)v6 + 188) |= 0x80u;
  }
  id v30 = [(NSString *)self->_contentStoreIdentifier copyWithZone:a3];
  v31 = (void *)v6[7];
  v6[7] = v30;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v6 + 37) = self->_shareType;
    *((unsigned char *)v6 + 188) |= 0x10u;
  }
  id v32 = [(NSString *)self->_appIdentifier copyWithZone:a3];
  v33 = (void *)v6[3];
  v6[3] = v32;

  char v34 = (char)self->_has;
  if ((v34 & 8) != 0)
  {
    *((_DWORD *)v6 + 36) = self->_permissionType;
    *((unsigned char *)v6 + 188) |= 8u;
    char v34 = (char)self->_has;
  }
  if ((v34 & 2) != 0)
  {
    *((_DWORD *)v6 + 22) = self->_contextType;
    *((unsigned char *)v6 + 188) |= 2u;
  }
  id v35 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  v36 = (void *)v6[13];
  v6[13] = v35;

  id v37 = [(NSString *)self->_stableObjectIdPath copyWithZone:a3];
  id v38 = (void *)v6[19];
  v6[19] = v37;

  id v39 = [(NSString *)self->_contextCustomTypeName copyWithZone:a3];
  v40 = (void *)v6[8];
  v6[8] = v39;

  id v41 = [(NSString *)self->_contextSummary copyWithZone:a3];
  v42 = (void *)v6[10];
  v6[10] = v41;

  char v43 = (char)self->_has;
  if ((v43 & 0x40) != 0)
  {
    *((unsigned char *)v6 + 184) = self->_contextSourceIsCatalog;
    *((unsigned char *)v6 + 188) |= 0x40u;
    char v43 = (char)self->_has;
  }
  if (v43)
  {
    v6[1] = *(void *)&self->_timeExpectationInSeconds;
    *((unsigned char *)v6 + 188) |= 1u;
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v44 = self->_classIds;
  id v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v45)
  {
    id v46 = v45;
    uint64_t v47 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v46; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v54 != v47) {
          objc_enumerationMutation(v44);
        }
        id v49 = objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * (void)j), "copyWithZone:", a3, (void)v53);
        [v6 addClassIds:v49];
      }
      id v46 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v46);
  }

  id v50 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  v51 = (void *)v6[12];
  v6[12] = v50;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_84;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 188) & 0x20) == 0 || self->_type != *((_DWORD *)v4 + 42)) {
      goto LABEL_84;
    }
  }
  else if ((*((unsigned char *)v4 + 188) & 0x20) != 0)
  {
    goto LABEL_84;
  }
  objectId = self->_objectId;
  if ((unint64_t)objectId | *((void *)v4 + 15) && !-[NSString isEqual:](objectId, "isEqual:")) {
    goto LABEL_84;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_84;
    }
  }
  parentObjectId = self->_parentObjectId;
  if ((unint64_t)parentObjectId | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](parentObjectId, "isEqual:")) {
      goto LABEL_84;
    }
  }
  url = self->_url;
  if ((unint64_t)url | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](url, "isEqual:")) {
      goto LABEL_84;
    }
  }
  appBundleIdentifier = self->_appBundleIdentifier;
  if ((unint64_t)appBundleIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](appBundleIdentifier, "isEqual:")) {
      goto LABEL_84;
    }
  }
  appStoreIdentifier = self->_appStoreIdentifier;
  if ((unint64_t)appStoreIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](appStoreIdentifier, "isEqual:")) {
      goto LABEL_84;
    }
  }
  appName = self->_appName;
  if ((unint64_t)appName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](appName, "isEqual:")) {
      goto LABEL_84;
    }
  }
  contextPaths = self->_contextPaths;
  if ((unint64_t)contextPaths | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](contextPaths, "isEqual:")) {
      goto LABEL_84;
    }
  }
  objectIdPath = self->_objectIdPath;
  if ((unint64_t)objectIdPath | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](objectIdPath, "isEqual:")) {
      goto LABEL_84;
    }
  }
  char has = (char)self->_has;
  char v15 = *((unsigned char *)v4 + 188);
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 188) & 4) == 0 || self->_displayOrder != *((_DWORD *)v4 + 28)) {
      goto LABEL_84;
    }
  }
  else if ((*((unsigned char *)v4 + 188) & 4) != 0)
  {
    goto LABEL_84;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((*((unsigned char *)v4 + 188) & 0x80) == 0) {
      goto LABEL_84;
    }
    if (self->_isLocked)
    {
      if (!*((unsigned char *)v4 + 185)) {
        goto LABEL_84;
      }
    }
    else if (*((unsigned char *)v4 + 185))
    {
      goto LABEL_84;
    }
  }
  else if ((*((unsigned char *)v4 + 188) & 0x80) != 0)
  {
    goto LABEL_84;
  }
  contentStoreIdentifier = self->_contentStoreIdentifier;
  if ((unint64_t)contentStoreIdentifier | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](contentStoreIdentifier, "isEqual:")) {
      goto LABEL_84;
    }
    char has = (char)self->_has;
    char v15 = *((unsigned char *)v4 + 188);
  }
  if ((has & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_shareType != *((_DWORD *)v4 + 37)) {
      goto LABEL_84;
    }
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_84;
  }
  appIdentifier = self->_appIdentifier;
  if ((unint64_t)appIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](appIdentifier, "isEqual:")) {
      goto LABEL_84;
    }
    char has = (char)self->_has;
    char v15 = *((unsigned char *)v4 + 188);
  }
  if ((has & 8) != 0)
  {
    if ((v15 & 8) == 0 || self->_permissionType != *((_DWORD *)v4 + 36)) {
      goto LABEL_84;
    }
  }
  else if ((v15 & 8) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 2) != 0)
  {
    if ((v15 & 2) == 0 || self->_contextType != *((_DWORD *)v4 + 22)) {
      goto LABEL_84;
    }
  }
  else if ((v15 & 2) != 0)
  {
    goto LABEL_84;
  }
  dateLastModified = self->_dateLastModified;
  if ((unint64_t)dateLastModified | *((void *)v4 + 13) && !-[PDDPDate isEqual:](dateLastModified, "isEqual:")) {
    goto LABEL_84;
  }
  stableObjectIdPath = self->_stableObjectIdPath;
  if ((unint64_t)stableObjectIdPath | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](stableObjectIdPath, "isEqual:")) {
      goto LABEL_84;
    }
  }
  contextCustomTypeName = self->_contextCustomTypeName;
  if ((unint64_t)contextCustomTypeName | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](contextCustomTypeName, "isEqual:")) {
      goto LABEL_84;
    }
  }
  contextSummary = self->_contextSummary;
  if ((unint64_t)contextSummary | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](contextSummary, "isEqual:")) {
      goto LABEL_84;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 188) & 0x40) != 0)
    {
      if (self->_contextSourceIsCatalog)
      {
        if (!*((unsigned char *)v4 + 184)) {
          goto LABEL_84;
        }
        goto LABEL_75;
      }
      if (!*((unsigned char *)v4 + 184)) {
        goto LABEL_75;
      }
    }
LABEL_84:
    unsigned __int8 v24 = 0;
    goto LABEL_85;
  }
  if ((*((unsigned char *)v4 + 188) & 0x40) != 0) {
    goto LABEL_84;
  }
LABEL_75:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 188) & 1) == 0 || self->_timeExpectationInSeconds != *((double *)v4 + 1)) {
      goto LABEL_84;
    }
  }
  else if (*((unsigned char *)v4 + 188))
  {
    goto LABEL_84;
  }
  classIds = self->_classIds;
  if ((unint64_t)classIds | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](classIds, "isEqual:"))
  {
    goto LABEL_84;
  }
  dateCreated = self->_dateCreated;
  if ((unint64_t)dateCreated | *((void *)v4 + 12)) {
    unsigned __int8 v24 = -[PDDPDate isEqual:](dateCreated, "isEqual:");
  }
  else {
    unsigned __int8 v24 = 1;
  }
LABEL_85:

  return v24;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v33 = 2654435761 * self->_type;
  }
  else {
    uint64_t v33 = 0;
  }
  NSUInteger v32 = [(NSString *)self->_objectId hash];
  NSUInteger v31 = [(NSString *)self->_title hash];
  NSUInteger v30 = [(NSString *)self->_parentObjectId hash];
  NSUInteger v29 = [(NSString *)self->_url hash];
  NSUInteger v28 = [(NSString *)self->_appBundleIdentifier hash];
  NSUInteger v27 = [(NSString *)self->_appStoreIdentifier hash];
  NSUInteger v26 = [(NSString *)self->_appName hash];
  unint64_t v25 = (unint64_t)[(NSMutableArray *)self->_contextPaths hash];
  NSUInteger v24 = [(NSString *)self->_objectIdPath hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v23 = 2654435761 * self->_displayOrder;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v23 = 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0)
    {
LABEL_6:
      uint64_t v22 = 2654435761 * self->_isLocked;
      goto LABEL_9;
    }
  }
  uint64_t v22 = 0;
LABEL_9:
  NSUInteger v21 = [(NSString *)self->_contentStoreIdentifier hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    NSUInteger v3 = [(NSString *)self->_appIdentifier hash];
  }
  else {
    NSUInteger v3 = [(NSString *)self->_appIdentifier hash];
  }
  NSUInteger v4 = v3;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v5 = 2654435761 * self->_permissionType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_14:
      uint64_t v6 = 2654435761 * self->_contextType;
      goto LABEL_17;
    }
  }
  uint64_t v6 = 0;
LABEL_17:
  unint64_t v7 = [(PDDPDate *)self->_dateLastModified hash];
  NSUInteger v8 = [(NSString *)self->_stableObjectIdPath hash];
  NSUInteger v9 = [(NSString *)self->_contextCustomTypeName hash];
  NSUInteger v10 = [(NSString *)self->_contextSummary hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    uint64_t v11 = 2654435761 * self->_contextSourceIsCatalog;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_19;
    }
LABEL_24:
    unint64_t v16 = 0;
    goto LABEL_27;
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_24;
  }
LABEL_19:
  double timeExpectationInSeconds = self->_timeExpectationInSeconds;
  double v13 = -timeExpectationInSeconds;
  if (timeExpectationInSeconds >= 0.0) {
    double v13 = self->_timeExpectationInSeconds;
  }
  long double v14 = floor(v13 + 0.5);
  double v15 = (v13 - v14) * 1.84467441e19;
  unint64_t v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  if (v15 >= 0.0)
  {
    if (v15 > 0.0) {
      v16 += (unint64_t)v15;
    }
  }
  else
  {
    v16 -= (unint64_t)fabs(v15);
  }
LABEL_27:
  NSUInteger v17 = v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v16;
  unint64_t v18 = (unint64_t)[(NSMutableArray *)self->_classIds hash];
  return v17 ^ v18 ^ [(PDDPDate *)self->_dateCreated hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  id v5 = v4;
  if ((v4[47] & 0x20) != 0)
  {
    self->_uint64_t type = v4[42];
    *(unsigned char *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 15)) {
    -[PDDPHandoutAttachment setObjectId:](self, "setObjectId:");
  }
  if (*((void *)v5 + 20)) {
    -[PDDPHandoutAttachment setTitle:](self, "setTitle:");
  }
  if (*((void *)v5 + 17)) {
    -[PDDPHandoutAttachment setParentObjectId:](self, "setParentObjectId:");
  }
  if (*((void *)v5 + 22)) {
    -[PDDPHandoutAttachment setUrl:](self, "setUrl:");
  }
  if (*((void *)v5 + 2)) {
    -[PDDPHandoutAttachment setAppBundleIdentifier:](self, "setAppBundleIdentifier:");
  }
  if (*((void *)v5 + 5)) {
    -[PDDPHandoutAttachment setAppStoreIdentifier:](self, "setAppStoreIdentifier:");
  }
  if (*((void *)v5 + 4)) {
    -[PDDPHandoutAttachment setAppName:](self, "setAppName:");
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = *((id *)v5 + 9);
  id v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        [(PDDPHandoutAttachment *)self addContextPath:*(void *)(*((void *)&v27 + 1) + 8 * i)];
      }
      id v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }

  if (*((void *)v5 + 16)) {
    -[PDDPHandoutAttachment setObjectIdPath:](self, "setObjectIdPath:");
  }
  char v11 = *((unsigned char *)v5 + 188);
  if ((v11 & 4) != 0)
  {
    self->_displayOrder = *((_DWORD *)v5 + 28);
    *(unsigned char *)&self->_has |= 4u;
    char v11 = *((unsigned char *)v5 + 188);
  }
  if (v11 < 0)
  {
    self->_isLocked = *((unsigned char *)v5 + 185);
    *(unsigned char *)&self->_has |= 0x80u;
  }
  if (*((void *)v5 + 7)) {
    -[PDDPHandoutAttachment setContentStoreIdentifier:](self, "setContentStoreIdentifier:");
  }
  if ((*((unsigned char *)v5 + 188) & 0x10) != 0)
  {
    self->_uint64_t shareType = *((_DWORD *)v5 + 37);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v5 + 3)) {
    -[PDDPHandoutAttachment setAppIdentifier:](self, "setAppIdentifier:");
  }
  char v12 = *((unsigned char *)v5 + 188);
  if ((v12 & 8) != 0)
  {
    self->_uint64_t permissionType = *((_DWORD *)v5 + 36);
    *(unsigned char *)&self->_has |= 8u;
    char v12 = *((unsigned char *)v5 + 188);
  }
  if ((v12 & 2) != 0)
  {
    self->_contextType = *((_DWORD *)v5 + 22);
    *(unsigned char *)&self->_has |= 2u;
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v14 = *((void *)v5 + 13);
  if (dateLastModified)
  {
    if (v14) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[PDDPHandoutAttachment setDateLastModified:](self, "setDateLastModified:");
  }
  if (*((void *)v5 + 19)) {
    -[PDDPHandoutAttachment setStableObjectIdPath:](self, "setStableObjectIdPath:");
  }
  if (*((void *)v5 + 8)) {
    -[PDDPHandoutAttachment setContextCustomTypeName:](self, "setContextCustomTypeName:");
  }
  if (*((void *)v5 + 10)) {
    -[PDDPHandoutAttachment setContextSummary:](self, "setContextSummary:");
  }
  char v15 = *((unsigned char *)v5 + 188);
  if ((v15 & 0x40) != 0)
  {
    self->_contextSourceIsCatalog = *((unsigned char *)v5 + 184);
    *(unsigned char *)&self->_has |= 0x40u;
    char v15 = *((unsigned char *)v5 + 188);
  }
  if (v15)
  {
    self->_double timeExpectationInSeconds = *((double *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = *((id *)v5 + 6);
  id v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v18; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        -[PDDPHandoutAttachment addClassIds:](self, "addClassIds:", *(void *)(*((void *)&v23 + 1) + 8 * (void)j), (void)v23);
      }
      id v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  dateCreated = self->_dateCreated;
  uint64_t v22 = *((void *)v5 + 12);
  if (dateCreated)
  {
    if (v22) {
      -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[PDDPHandoutAttachment setDateCreated:](self, "setDateCreated:");
  }
}

- (NSString)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)parentObjectId
{
  return self->_parentObjectId;
}

- (void)setParentObjectId:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (NSString)appStoreIdentifier
{
  return self->_appStoreIdentifier;
}

- (void)setAppStoreIdentifier:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSMutableArray)contextPaths
{
  return self->_contextPaths;
}

- (void)setContextPaths:(id)a3
{
}

- (NSString)objectIdPath
{
  return self->_objectIdPath;
}

- (void)setObjectIdPath:(id)a3
{
}

- (int)displayOrder
{
  return self->_displayOrder;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (NSString)contentStoreIdentifier
{
  return self->_contentStoreIdentifier;
}

- (void)setContentStoreIdentifier:(id)a3
{
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (PDDPDate)dateLastModified
{
  return self->_dateLastModified;
}

- (void)setDateLastModified:(id)a3
{
}

- (NSString)stableObjectIdPath
{
  return self->_stableObjectIdPath;
}

- (void)setStableObjectIdPath:(id)a3
{
}

- (NSString)contextCustomTypeName
{
  return self->_contextCustomTypeName;
}

- (void)setContextCustomTypeName:(id)a3
{
}

- (NSString)contextSummary
{
  return self->_contextSummary;
}

- (void)setContextSummary:(id)a3
{
}

- (BOOL)contextSourceIsCatalog
{
  return self->_contextSourceIsCatalog;
}

- (double)timeExpectationInSeconds
{
  return self->_timeExpectationInSeconds;
}

- (NSMutableArray)classIds
{
  return self->_classIds;
}

- (void)setClassIds:(id)a3
{
}

- (PDDPDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_stableObjectIdPath, 0);
  objc_storeStrong((id *)&self->_parentObjectId, 0);
  objc_storeStrong((id *)&self->_objectIdPath, 0);
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_contextSummary, 0);
  objc_storeStrong((id *)&self->_contextPaths, 0);
  objc_storeStrong((id *)&self->_contextCustomTypeName, 0);
  objc_storeStrong((id *)&self->_contentStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_classIds, 0);
  objc_storeStrong((id *)&self->_appStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);

  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end