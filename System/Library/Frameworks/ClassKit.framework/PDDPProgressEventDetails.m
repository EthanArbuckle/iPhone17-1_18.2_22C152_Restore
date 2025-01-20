@interface PDDPProgressEventDetails
- (BOOL)hasActivityId;
- (BOOL)hasActivityInfo;
- (BOOL)hasActivityItemInfo;
- (BOOL)hasAppIdentifier;
- (BOOL)hasAttachmentId;
- (BOOL)hasAttachmentType;
- (BOOL)hasClassId;
- (BOOL)hasContextType;
- (BOOL)hasHandoutAuthorizedObjectId;
- (BOOL)hasHandoutId;
- (BOOL)hasObjectIdPath;
- (BOOL)hasParentObjectId;
- (BOOL)hasProgressInfo;
- (BOOL)hasRangeInfo;
- (BOOL)hasTimeIntervalInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)activityId;
- (NSString)appIdentifier;
- (NSString)attachmentId;
- (NSString)classId;
- (NSString)handoutAuthorizedObjectId;
- (NSString)handoutId;
- (NSString)objectIdPath;
- (NSString)parentObjectId;
- (PDDPActivityInfo)activityInfo;
- (PDDPActivityReportItem)activityItemInfo;
- (PDDPRange)rangeInfo;
- (PDDPTimeIntervalInfo)timeIntervalInfo;
- (id)attachmentTypeAsString:(int)a3;
- (id)contextTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)progressInfoAsString:(int)a3;
- (int)StringAsAttachmentType:(id)a3;
- (int)StringAsContextType:(id)a3;
- (int)StringAsProgressInfo:(id)a3;
- (int)attachmentType;
- (int)contextType;
- (int)progressInfo;
- (unint64_t)hash;
- (void)clearOneofValuesForProgressInfo;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityId:(id)a3;
- (void)setActivityInfo:(id)a3;
- (void)setActivityItemInfo:(id)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setAttachmentId:(id)a3;
- (void)setAttachmentType:(int)a3;
- (void)setClassId:(id)a3;
- (void)setContextType:(int)a3;
- (void)setHandoutAuthorizedObjectId:(id)a3;
- (void)setHandoutId:(id)a3;
- (void)setHasAttachmentType:(BOOL)a3;
- (void)setHasContextType:(BOOL)a3;
- (void)setHasProgressInfo:(BOOL)a3;
- (void)setObjectIdPath:(id)a3;
- (void)setParentObjectId:(id)a3;
- (void)setProgressInfo:(int)a3;
- (void)setRangeInfo:(id)a3;
- (void)setTimeIntervalInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPProgressEventDetails

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
    char v3 = off_1001F5F00[a3 + 1];
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
    id v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    id v3 = off_1001F5F98[a3];
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

- (BOOL)hasParentObjectId
{
  return self->_parentObjectId != 0;
}

- (BOOL)hasObjectIdPath
{
  return self->_objectIdPath != 0;
}

- (BOOL)hasAppIdentifier
{
  return self->_appIdentifier != 0;
}

- (BOOL)hasHandoutAuthorizedObjectId
{
  return self->_handoutAuthorizedObjectId != 0;
}

- (BOOL)hasActivityItemInfo
{
  return self->_activityItemInfo != 0;
}

- (void)setActivityItemInfo:(id)a3
{
  int v4 = (PDDPActivityReportItem *)a3;
  [(PDDPProgressEventDetails *)self clearOneofValuesForProgressInfo];
  *(unsigned char *)&self->_has |= 4u;
  self->_progressInfo = 1;
  activityItemInfo = self->_activityItemInfo;
  self->_activityItemInfo = v4;
}

- (BOOL)hasRangeInfo
{
  return self->_rangeInfo != 0;
}

- (void)setRangeInfo:(id)a3
{
  int v4 = (PDDPRange *)a3;
  [(PDDPProgressEventDetails *)self clearOneofValuesForProgressInfo];
  *(unsigned char *)&self->_has |= 4u;
  self->_progressInfo = 2;
  rangeInfo = self->_rangeInfo;
  self->_rangeInfo = v4;
}

- (BOOL)hasTimeIntervalInfo
{
  return self->_timeIntervalInfo != 0;
}

- (void)setTimeIntervalInfo:(id)a3
{
  int v4 = (PDDPTimeIntervalInfo *)a3;
  [(PDDPProgressEventDetails *)self clearOneofValuesForProgressInfo];
  *(unsigned char *)&self->_has |= 4u;
  self->_progressInfo = 3;
  timeIntervalInfo = self->_timeIntervalInfo;
  self->_timeIntervalInfo = v4;
}

- (BOOL)hasActivityInfo
{
  return self->_activityInfo != 0;
}

- (void)setActivityInfo:(id)a3
{
  int v4 = (PDDPActivityInfo *)a3;
  [(PDDPProgressEventDetails *)self clearOneofValuesForProgressInfo];
  *(unsigned char *)&self->_has |= 4u;
  self->_progressInfo = 4;
  activityInfo = self->_activityInfo;
  self->_activityInfo = v4;
}

- (int)progressInfo
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_progressInfo;
  }
  else {
    return 0;
  }
}

- (void)setProgressInfo:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_progressInfo = a3;
}

- (void)setHasProgressInfo:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasProgressInfo
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)progressInfoAsString:(int)a3
{
  if (a3 >= 5)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_1001F5FD8[a3];
  }

  return v3;
}

- (int)StringAsProgressInfo:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"activity_item_info"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"range_info"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"time_interval_info"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"activity_info"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForProgressInfo
{
  *(unsigned char *)&self->_has &= ~4u;
  self->_progressInfo = 0;
  activityItemInfo = self->_activityItemInfo;
  self->_activityItemInfo = 0;

  rangeInfo = self->_rangeInfo;
  self->_rangeInfo = 0;

  timeIntervalInfo = self->_timeIntervalInfo;
  self->_timeIntervalInfo = 0;

  activityInfo = self->_activityInfo;
  self->_activityInfo = 0;
}

- (BOOL)hasActivityId
{
  return self->_activityId != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPProgressEventDetails;
  id v3 = [(PDDPProgressEventDetails *)&v7 description];
  int v4 = [(PDDPProgressEventDetails *)self dictionaryRepresentation];
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
  if ((has & 2) != 0)
  {
    unsigned int v9 = self->_contextType + 1;
    if (v9 >= 0x13)
    {
      v10 = +[NSString stringWithFormat:@"(unknown: %i)", self->_contextType];
    }
    else
    {
      v10 = off_1001F5F00[v9];
    }
    [v4 setObject:v10 forKey:@"context_type"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t attachmentType = self->_attachmentType;
    if (attachmentType >= 8)
    {
      v12 = +[NSString stringWithFormat:@"(unknown: %i)", self->_attachmentType];
    }
    else
    {
      v12 = off_1001F5F98[attachmentType];
    }
    [v4 setObject:v12 forKey:@"attachment_type"];
  }
  parentObjectId = self->_parentObjectId;
  if (parentObjectId) {
    [v4 setObject:parentObjectId forKey:@"parent_object_id"];
  }
  objectIdPath = self->_objectIdPath;
  if (objectIdPath) {
    [v4 setObject:objectIdPath forKey:@"object_id_path"];
  }
  appIdentifier = self->_appIdentifier;
  if (appIdentifier) {
    [v4 setObject:appIdentifier forKey:@"app_identifier"];
  }
  handoutAuthorizedObjectId = self->_handoutAuthorizedObjectId;
  if (handoutAuthorizedObjectId) {
    [v4 setObject:handoutAuthorizedObjectId forKey:@"handout_authorized_object_id"];
  }
  activityItemInfo = self->_activityItemInfo;
  if (activityItemInfo)
  {
    v18 = [(PDDPActivityReportItem *)activityItemInfo dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"activity_item_info"];
  }
  rangeInfo = self->_rangeInfo;
  if (rangeInfo)
  {
    v20 = [(PDDPRange *)rangeInfo dictionaryRepresentation];
    [v4 setObject:v20 forKey:@"range_info"];
  }
  timeIntervalInfo = self->_timeIntervalInfo;
  if (timeIntervalInfo)
  {
    v22 = [(PDDPTimeIntervalInfo *)timeIntervalInfo dictionaryRepresentation];
    [v4 setObject:v22 forKey:@"time_interval_info"];
  }
  activityInfo = self->_activityInfo;
  if (activityInfo)
  {
    v24 = [(PDDPActivityInfo *)activityInfo dictionaryRepresentation];
    [v4 setObject:v24 forKey:@"activity_info"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t progressInfo = self->_progressInfo;
    if (progressInfo >= 5)
    {
      v26 = +[NSString stringWithFormat:@"(unknown: %i)", self->_progressInfo];
    }
    else
    {
      v26 = off_1001F5FD8[progressInfo];
    }
    [v4 setObject:v26 forKey:@"progress_info"];
  }
  activityId = self->_activityId;
  if (activityId) {
    [v4 setObject:activityId forKey:@"activity_id"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100146358((uint64_t)self, (uint64_t)a3);
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
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_parentObjectId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_objectIdPath)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_appIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_handoutAuthorizedObjectId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_activityItemInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_rangeInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_timeIntervalInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_activityInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_activityId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[26] = self->_progressInfo;
    *((unsigned char *)v4 + 128) |= 4u;
  }
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
  if ((has & 2) != 0)
  {
    v4[16] = self->_contextType;
    *((unsigned char *)v4 + 128) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[12] = self->_attachmentType;
    *((unsigned char *)v4 + 128) |= 1u;
  }
  if (self->_parentObjectId)
  {
    objc_msgSend(v6, "setParentObjectId:");
    id v4 = v6;
  }
  if (self->_objectIdPath)
  {
    objc_msgSend(v6, "setObjectIdPath:");
    id v4 = v6;
  }
  if (self->_appIdentifier)
  {
    objc_msgSend(v6, "setAppIdentifier:");
    id v4 = v6;
  }
  if (self->_handoutAuthorizedObjectId)
  {
    objc_msgSend(v6, "setHandoutAuthorizedObjectId:");
    id v4 = v6;
  }
  if (self->_activityItemInfo)
  {
    objc_msgSend(v6, "setActivityItemInfo:");
    id v4 = v6;
  }
  if (self->_rangeInfo)
  {
    objc_msgSend(v6, "setRangeInfo:");
    id v4 = v6;
  }
  if (self->_timeIntervalInfo)
  {
    objc_msgSend(v6, "setTimeIntervalInfo:");
    id v4 = v6;
  }
  if (self->_activityInfo)
  {
    objc_msgSend(v6, "setActivityInfo:");
    id v4 = v6;
  }
  if (self->_activityId)
  {
    objc_msgSend(v6, "setActivityId:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v5[26] = self->_progressInfo;
    *((unsigned char *)v5 + 128) |= 4u;
  }
  id v7 = [(NSString *)self->_classId copyWithZone:a3];
  v8 = (void *)v6[7];
  v6[7] = v7;

  id v9 = [(NSString *)self->_handoutId copyWithZone:a3];
  v10 = (void *)v6[10];
  v6[10] = v9;

  id v11 = [(NSString *)self->_attachmentId copyWithZone:a3];
  v12 = (void *)v6[5];
  v6[5] = v11;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v6 + 16) = self->_contextType;
    *((unsigned char *)v6 + 128) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v6 + 12) = self->_attachmentType;
    *((unsigned char *)v6 + 128) |= 1u;
  }
  id v14 = [(NSString *)self->_parentObjectId copyWithZone:a3];
  v15 = (void *)v6[12];
  v6[12] = v14;

  id v16 = [(NSString *)self->_objectIdPath copyWithZone:a3];
  v17 = (void *)v6[11];
  v6[11] = v16;

  id v18 = [(NSString *)self->_appIdentifier copyWithZone:a3];
  v19 = (void *)v6[4];
  v6[4] = v18;

  id v20 = [(NSString *)self->_handoutAuthorizedObjectId copyWithZone:a3];
  v21 = (void *)v6[9];
  v6[9] = v20;

  id v22 = [(PDDPActivityReportItem *)self->_activityItemInfo copyWithZone:a3];
  v23 = (void *)v6[3];
  v6[3] = v22;

  id v24 = [(PDDPRange *)self->_rangeInfo copyWithZone:a3];
  v25 = (void *)v6[14];
  v6[14] = v24;

  id v26 = [(PDDPTimeIntervalInfo *)self->_timeIntervalInfo copyWithZone:a3];
  v27 = (void *)v6[15];
  v6[15] = v26;

  id v28 = [(PDDPActivityInfo *)self->_activityInfo copyWithZone:a3];
  v29 = (void *)v6[2];
  v6[2] = v28;

  id v30 = [(NSString *)self->_activityId copyWithZone:a3];
  v31 = (void *)v6[1];
  v6[1] = v30;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 128) & 4) == 0 || self->_progressInfo != *((_DWORD *)v4 + 26)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 4) != 0)
  {
LABEL_41:
    unsigned __int8 v17 = 0;
    goto LABEL_42;
  }
  classId = self->_classId;
  if ((unint64_t)classId | *((void *)v4 + 7) && !-[NSString isEqual:](classId, "isEqual:")) {
    goto LABEL_41;
  }
  handoutId = self->_handoutId;
  if ((unint64_t)handoutId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](handoutId, "isEqual:")) {
      goto LABEL_41;
    }
  }
  attachmentId = self->_attachmentId;
  if ((unint64_t)attachmentId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](attachmentId, "isEqual:")) {
      goto LABEL_41;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 128) & 2) == 0 || self->_contextType != *((_DWORD *)v4 + 16)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 2) != 0)
  {
    goto LABEL_41;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 128) & 1) == 0 || self->_attachmentType != *((_DWORD *)v4 + 12)) {
      goto LABEL_41;
    }
  }
  else if (*((unsigned char *)v4 + 128))
  {
    goto LABEL_41;
  }
  parentObjectId = self->_parentObjectId;
  if ((unint64_t)parentObjectId | *((void *)v4 + 12)
    && !-[NSString isEqual:](parentObjectId, "isEqual:"))
  {
    goto LABEL_41;
  }
  objectIdPath = self->_objectIdPath;
  if ((unint64_t)objectIdPath | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](objectIdPath, "isEqual:")) {
      goto LABEL_41;
    }
  }
  appIdentifier = self->_appIdentifier;
  if ((unint64_t)appIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](appIdentifier, "isEqual:")) {
      goto LABEL_41;
    }
  }
  handoutAuthorizedObjectId = self->_handoutAuthorizedObjectId;
  if ((unint64_t)handoutAuthorizedObjectId | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](handoutAuthorizedObjectId, "isEqual:")) {
      goto LABEL_41;
    }
  }
  activityItemInfo = self->_activityItemInfo;
  if ((unint64_t)activityItemInfo | *((void *)v4 + 3))
  {
    if (!-[PDDPActivityReportItem isEqual:](activityItemInfo, "isEqual:")) {
      goto LABEL_41;
    }
  }
  rangeInfo = self->_rangeInfo;
  if ((unint64_t)rangeInfo | *((void *)v4 + 14))
  {
    if (!-[PDDPRange isEqual:](rangeInfo, "isEqual:")) {
      goto LABEL_41;
    }
  }
  timeIntervalInfo = self->_timeIntervalInfo;
  if ((unint64_t)timeIntervalInfo | *((void *)v4 + 15))
  {
    if (!-[PDDPTimeIntervalInfo isEqual:](timeIntervalInfo, "isEqual:")) {
      goto LABEL_41;
    }
  }
  activityInfo = self->_activityInfo;
  if ((unint64_t)activityInfo | *((void *)v4 + 2))
  {
    if (!-[PDDPActivityInfo isEqual:](activityInfo, "isEqual:")) {
      goto LABEL_41;
    }
  }
  activityId = self->_activityId;
  if ((unint64_t)activityId | *((void *)v4 + 1)) {
    unsigned __int8 v17 = -[NSString isEqual:](activityId, "isEqual:");
  }
  else {
    unsigned __int8 v17 = 1;
  }
LABEL_42:

  return v17;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_progressInfo;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_classId hash];
  NSUInteger v5 = [(NSString *)self->_handoutId hash];
  NSUInteger v6 = [(NSString *)self->_attachmentId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_contextType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_attachmentType;
LABEL_9:
  NSUInteger v9 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v10 = v7 ^ v8 ^ [(NSString *)self->_parentObjectId hash];
  unint64_t v11 = v9 ^ v10 ^ [(NSString *)self->_objectIdPath hash];
  NSUInteger v12 = [(NSString *)self->_appIdentifier hash];
  unint64_t v13 = v12 ^ [(NSString *)self->_handoutAuthorizedObjectId hash];
  unint64_t v14 = v13 ^ [(PDDPActivityReportItem *)self->_activityItemInfo hash];
  unint64_t v15 = v11 ^ v14 ^ [(PDDPRange *)self->_rangeInfo hash];
  unint64_t v16 = [(PDDPTimeIntervalInfo *)self->_timeIntervalInfo hash];
  unint64_t v17 = v16 ^ [(PDDPActivityInfo *)self->_activityInfo hash];
  return v15 ^ v17 ^ [(NSString *)self->_activityId hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  NSUInteger v5 = v4;
  if ((v4[32] & 4) != 0)
  {
    self->_uint64_t progressInfo = v4[26];
    *(unsigned char *)&self->_has |= 4u;
  }
  unint64_t v15 = v4;
  if (*((void *)v4 + 7))
  {
    -[PDDPProgressEventDetails setClassId:](self, "setClassId:");
    NSUInteger v5 = v15;
  }
  if (*((void *)v5 + 10))
  {
    [(PDDPProgressEventDetails *)self setHandoutId:"setHandoutId:"];
    NSUInteger v5 = v15;
  }
  if (*((void *)v5 + 5))
  {
    -[PDDPProgressEventDetails setAttachmentId:](self, "setAttachmentId:");
    NSUInteger v5 = v15;
  }
  char v6 = *((unsigned char *)v5 + 128);
  if ((v6 & 2) != 0)
  {
    self->_contextType = v5[16];
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v5 + 128);
  }
  if (v6)
  {
    self->_uint64_t attachmentType = v5[12];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v5 + 12))
  {
    -[PDDPProgressEventDetails setParentObjectId:](self, "setParentObjectId:");
    NSUInteger v5 = v15;
  }
  if (*((void *)v5 + 11))
  {
    -[PDDPProgressEventDetails setObjectIdPath:](self, "setObjectIdPath:");
    NSUInteger v5 = v15;
  }
  if (*((void *)v5 + 4))
  {
    -[PDDPProgressEventDetails setAppIdentifier:](self, "setAppIdentifier:");
    NSUInteger v5 = v15;
  }
  if (*((void *)v5 + 9))
  {
    [(PDDPProgressEventDetails *)self setHandoutAuthorizedObjectId:"setHandoutAuthorizedObjectId:"];
    NSUInteger v5 = v15;
  }
  activityItemInfo = self->_activityItemInfo;
  uint64_t v8 = *((void *)v5 + 3);
  if (activityItemInfo)
  {
    if (!v8) {
      goto LABEL_27;
    }
    -[PDDPActivityReportItem mergeFrom:](activityItemInfo, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_27;
    }
    -[PDDPProgressEventDetails setActivityItemInfo:](self, "setActivityItemInfo:");
  }
  NSUInteger v5 = v15;
LABEL_27:
  rangeInfo = self->_rangeInfo;
  uint64_t v10 = *((void *)v5 + 14);
  if (rangeInfo)
  {
    if (!v10) {
      goto LABEL_33;
    }
    -[PDDPRange mergeFrom:](rangeInfo, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_33;
    }
    -[PDDPProgressEventDetails setRangeInfo:](self, "setRangeInfo:");
  }
  NSUInteger v5 = v15;
LABEL_33:
  timeIntervalInfo = self->_timeIntervalInfo;
  uint64_t v12 = *((void *)v5 + 15);
  if (timeIntervalInfo)
  {
    if (!v12) {
      goto LABEL_39;
    }
    -[PDDPTimeIntervalInfo mergeFrom:](timeIntervalInfo, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_39;
    }
    -[PDDPProgressEventDetails setTimeIntervalInfo:](self, "setTimeIntervalInfo:");
  }
  NSUInteger v5 = v15;
LABEL_39:
  activityInfo = self->_activityInfo;
  uint64_t v14 = *((void *)v5 + 2);
  if (activityInfo)
  {
    if (!v14) {
      goto LABEL_45;
    }
    activityInfo = (PDDPActivityInfo *)-[PDDPActivityInfo mergeFrom:](activityInfo, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_45;
    }
    activityInfo = (PDDPActivityInfo *)-[PDDPProgressEventDetails setActivityInfo:](self, "setActivityInfo:");
  }
  NSUInteger v5 = v15;
LABEL_45:
  if (*((void *)v5 + 1))
  {
    activityInfo = (PDDPActivityInfo *)-[PDDPProgressEventDetails setActivityId:](self, "setActivityId:");
    NSUInteger v5 = v15;
  }

  _objc_release_x1(activityInfo, v5);
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

- (NSString)parentObjectId
{
  return self->_parentObjectId;
}

- (void)setParentObjectId:(id)a3
{
}

- (NSString)objectIdPath
{
  return self->_objectIdPath;
}

- (void)setObjectIdPath:(id)a3
{
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (NSString)handoutAuthorizedObjectId
{
  return self->_handoutAuthorizedObjectId;
}

- (void)setHandoutAuthorizedObjectId:(id)a3
{
}

- (PDDPActivityReportItem)activityItemInfo
{
  return self->_activityItemInfo;
}

- (PDDPRange)rangeInfo
{
  return self->_rangeInfo;
}

- (PDDPTimeIntervalInfo)timeIntervalInfo
{
  return self->_timeIntervalInfo;
}

- (PDDPActivityInfo)activityInfo
{
  return self->_activityInfo;
}

- (NSString)activityId
{
  return self->_activityId;
}

- (void)setActivityId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeIntervalInfo, 0);
  objc_storeStrong((id *)&self->_rangeInfo, 0);
  objc_storeStrong((id *)&self->_parentObjectId, 0);
  objc_storeStrong((id *)&self->_objectIdPath, 0);
  objc_storeStrong((id *)&self->_handoutId, 0);
  objc_storeStrong((id *)&self->_handoutAuthorizedObjectId, 0);
  objc_storeStrong((id *)&self->_classId, 0);
  objc_storeStrong((id *)&self->_attachmentId, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_activityItemInfo, 0);
  objc_storeStrong((id *)&self->_activityInfo, 0);

  objc_storeStrong((id *)&self->_activityId, 0);
}

@end