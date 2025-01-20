@interface PDDPEvent
+ (Class)extraInfoType;
- (BOOL)hasAttachmentEventDetails;
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasEventDetails;
- (BOOL)hasEventDetailsType;
- (BOOL)hasEventType;
- (BOOL)hasHandoutEventDetails;
- (BOOL)hasObjectId;
- (BOOL)hasProgressEventDetails;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)extraInfos;
- (NSString)objectId;
- (PDDPAttachmentEventDetails)attachmentEventDetails;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (PDDPHandoutEventDetails)handoutEventDetails;
- (PDDPProgressEventDetails)progressEventDetails;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventDetailsAsString:(int)a3;
- (id)eventDetailsTypeAsString:(int)a3;
- (id)eventTypeAsString:(int)a3;
- (id)extraInfoAtIndex:(unint64_t)a3;
- (int)StringAsEventDetails:(id)a3;
- (int)StringAsEventDetailsType:(id)a3;
- (int)StringAsEventType:(id)a3;
- (int)eventDetails;
- (int)eventDetailsType;
- (int)eventType;
- (unint64_t)extraInfosCount;
- (unint64_t)hash;
- (void)addExtraInfo:(id)a3;
- (void)clearExtraInfos;
- (void)clearOneofValuesForEventDetails;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttachmentEventDetails:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setEventDetails:(int)a3;
- (void)setEventDetailsType:(int)a3;
- (void)setEventType:(int)a3;
- (void)setExtraInfos:(id)a3;
- (void)setHandoutEventDetails:(id)a3;
- (void)setHasEventDetails:(BOOL)a3;
- (void)setHasEventDetailsType:(BOOL)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setObjectId:(id)a3;
- (void)setProgressEventDetails:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPEvent

- (BOOL)hasObjectId
{
  return self->_objectId != 0;
}

- (int)eventType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_eventType;
  }
  else {
    return 0;
  }
}

- (void)setEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEventType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)eventTypeAsString:(int)a3
{
  if (!(!v4 & v3))
  {
    v7 = @"UNKNOWN_EVENT_TYPE";
    switch(a3)
    {
      case 0:
        goto LABEL_12;
      case 1:
        v7 = @"ASSIGN_HANDOUT_TYPE";
        return v7;
      case 2:
        v7 = @"UPDATE_HANDOUT_TYPE";
        return v7;
      case 3:
        v7 = @"TRY_AGAIN_TYPE";
        return v7;
      case 4:
        v7 = @"REVIEW_ATTACHMENT_TYPE";
        return v7;
      case 5:
        v7 = @"CANCEL_TRY_AGAIN_TYPE";
        return v7;
      case 6:
        v7 = @"CANCEL_REVIEW_ATTACHMENT_TYPE";
        return v7;
      case 7:
        v7 = @"DELETE_HANDOUT_TYPE";
        return v7;
      case 8:
        v7 = @"MARK_HANDOUT_DONE_TYPE";
        return v7;
      default:
        JUMPOUT(0);
    }
  }
  switch(a3)
  {
    case 'e':
      v7 = @"OPEN_HANDOUT_TYPE";
      break;
    case 'f':
      v7 = @"OPEN_ATTACHMENT_TYPE";
      break;
    case 'g':
      v7 = @"MARK_DONE_TYPE";
      break;
    case 'h':
      v7 = @"MARK_DONE_LATE_TYPE";
      break;
    case 'i':
      v7 = @"MARK_NOT_DONE_TYPE";
      break;
    default:
      v7 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_12:
      break;
  }
  return v7;
}

- (int)StringAsEventType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_EVENT_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ASSIGN_HANDOUT_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"UPDATE_HANDOUT_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TRY_AGAIN_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"REVIEW_ATTACHMENT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CANCEL_TRY_AGAIN_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CANCEL_REVIEW_ATTACHMENT_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"DELETE_HANDOUT_TYPE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"MARK_HANDOUT_DONE_TYPE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"OPEN_HANDOUT_TYPE"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"OPEN_ATTACHMENT_TYPE"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"MARK_DONE_TYPE"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"MARK_DONE_LATE_TYPE"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"MARK_NOT_DONE_TYPE"])
  {
    int v4 = 105;
  }
  else if ([v3 isEqualToString:@"SCORE_TYPE"])
  {
    int v4 = 201;
  }
  else if ([v3 isEqualToString:@"TIME_SPENT_TYPE"])
  {
    int v4 = 202;
  }
  else if ([v3 isEqualToString:@"BINARY_TYPE"])
  {
    int v4 = 203;
  }
  else if ([v3 isEqualToString:@"QUANTITY_TYPE"])
  {
    int v4 = 204;
  }
  else if ([v3 isEqualToString:@"RANGE_TYPE"])
  {
    int v4 = 205;
  }
  else if ([v3 isEqualToString:@"ACTIVITY_STARTED_TYPE"])
  {
    int v4 = 206;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (void)clearExtraInfos
{
}

- (void)addExtraInfo:(id)a3
{
  id v4 = a3;
  extraInfos = self->_extraInfos;
  id v8 = v4;
  if (!extraInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_extraInfos;
    self->_extraInfos = v6;

    id v4 = v8;
    extraInfos = self->_extraInfos;
  }
  [(NSMutableArray *)extraInfos addObject:v4];
}

- (unint64_t)extraInfosCount
{
  return (unint64_t)[(NSMutableArray *)self->_extraInfos count];
}

- (id)extraInfoAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_extraInfos objectAtIndex:a3];
}

+ (Class)extraInfoType
{
  return (Class)objc_opt_class();
}

- (int)eventDetailsType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_eventDetailsType;
  }
  else {
    return 0;
  }
}

- (void)setEventDetailsType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_eventDetailsType = a3;
}

- (void)setHasEventDetailsType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventDetailsType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)eventDetailsTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_1001F6000[a3];
  }

  return v3;
}

- (int)StringAsEventDetailsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_EVENT_DETAILS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"HANDOUT_EVENT_DETAILS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ATTACHMENT_EVENT_DETAILS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PROGRESS_EVENT_DETAILS"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasHandoutEventDetails
{
  return self->_handoutEventDetails != 0;
}

- (void)setHandoutEventDetails:(id)a3
{
  int v4 = (PDDPHandoutEventDetails *)a3;
  [(PDDPEvent *)self clearOneofValuesForEventDetails];
  *(unsigned char *)&self->_has |= 1u;
  self->_eventDetails = 1;
  handoutEventDetails = self->_handoutEventDetails;
  self->_handoutEventDetails = v4;
}

- (BOOL)hasAttachmentEventDetails
{
  return self->_attachmentEventDetails != 0;
}

- (void)setAttachmentEventDetails:(id)a3
{
  int v4 = (PDDPAttachmentEventDetails *)a3;
  [(PDDPEvent *)self clearOneofValuesForEventDetails];
  *(unsigned char *)&self->_has |= 1u;
  self->_eventDetails = 2;
  attachmentEventDetails = self->_attachmentEventDetails;
  self->_attachmentEventDetails = v4;
}

- (BOOL)hasProgressEventDetails
{
  return self->_progressEventDetails != 0;
}

- (void)setProgressEventDetails:(id)a3
{
  int v4 = (PDDPProgressEventDetails *)a3;
  [(PDDPEvent *)self clearOneofValuesForEventDetails];
  *(unsigned char *)&self->_has |= 1u;
  self->_eventDetails = 3;
  progressEventDetails = self->_progressEventDetails;
  self->_progressEventDetails = v4;
}

- (int)eventDetails
{
  if (*(unsigned char *)&self->_has) {
    return self->_eventDetails;
  }
  else {
    return 0;
  }
}

- (void)setEventDetails:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_eventDetails = a3;
}

- (void)setHasEventDetails:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventDetails
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)eventDetailsAsString:(int)a3
{
  if (a3 >= 4)
  {
    id v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    id v3 = off_1001F6020[a3];
  }

  return v3;
}

- (int)StringAsEventDetails:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"handout_event_details"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"attachment_event_details"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"progress_event_details"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForEventDetails
{
  *(unsigned char *)&self->_has &= ~1u;
  self->_eventDetails = 0;
  handoutEventDetails = self->_handoutEventDetails;
  self->_handoutEventDetails = 0;

  attachmentEventDetails = self->_attachmentEventDetails;
  self->_attachmentEventDetails = 0;

  progressEventDetails = self->_progressEventDetails;
  self->_progressEventDetails = 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPEvent;
  id v3 = [(PDDPEvent *)&v7 description];
  int v4 = [(PDDPEvent *)self dictionaryRepresentation];
  uint64_t v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  uint64_t v5 = +[NSMutableDictionary dictionary];
  v6 = v5;
  objectId = self->_objectId;
  if (objectId) {
    [v5 setObject:objectId forKey:@"object_id"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    int eventType = self->_eventType;
    if (!v4 & v3)
    {
      int v9 = eventType - 101;
      uint64_t v10 = (eventType - 101);
      switch(v9)
      {
        case 0:
          v11 = @"OPEN_HANDOUT_TYPE";
          break;
        case 1:
          v11 = @"OPEN_ATTACHMENT_TYPE";
          break;
        case 2:
          v11 = @"MARK_DONE_TYPE";
          break;
        case 3:
          v11 = @"MARK_DONE_LATE_TYPE";
          break;
        case 4:
          v11 = @"MARK_NOT_DONE_TYPE";
          break;
        default:
          v11 = +[NSString stringWithFormat:@"(unknown: %i)", v10];
          break;
      }
    }
    else
    {
      v11 = @"UNKNOWN_EVENT_TYPE";
      switch(eventType)
      {
        case 0:
          break;
        case 1:
          v11 = @"ASSIGN_HANDOUT_TYPE";
          break;
        case 2:
          v11 = @"UPDATE_HANDOUT_TYPE";
          break;
        case 3:
          v11 = @"TRY_AGAIN_TYPE";
          break;
        case 4:
          v11 = @"REVIEW_ATTACHMENT_TYPE";
          break;
        case 5:
          v11 = @"CANCEL_TRY_AGAIN_TYPE";
          break;
        case 6:
          v11 = @"CANCEL_REVIEW_ATTACHMENT_TYPE";
          break;
        case 7:
          v11 = @"DELETE_HANDOUT_TYPE";
          break;
        case 8:
          v11 = @"MARK_HANDOUT_DONE_TYPE";
          break;
        default:
          JUMPOUT(0);
      }
    }
    [v6 setObject:v11 forKey:@"event_type"];
  }
  dateCreated = self->_dateCreated;
  if (dateCreated)
  {
    v13 = [(PDDPDate *)dateCreated dictionaryRepresentation];
    [v6 setObject:v13 forKey:@"date_created"];
  }
  dateLastModified = self->_dateLastModified;
  if (dateLastModified)
  {
    v15 = [(PDDPDate *)dateLastModified dictionaryRepresentation];
    [v6 setObject:v15 forKey:@"date_last_modified"];
  }
  if ([(NSMutableArray *)self->_extraInfos count])
  {
    id v16 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_extraInfos, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v17 = self->_extraInfos;
    id v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v35;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [*(id *)(*((void *)&v34 + 1) + 8 * i) dictionaryRepresentation];
          [v16 addObject:v22];
        }
        id v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v19);
    }

    [v6 setObject:v16 forKey:@"extra_info"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t eventDetailsType = self->_eventDetailsType;
    if (eventDetailsType >= 4)
    {
      v24 = +[NSString stringWithFormat:@"(unknown: %i)", self->_eventDetailsType];
    }
    else
    {
      v24 = off_1001F6000[eventDetailsType];
    }
    [v6 setObject:v24 forKey:@"event_details_type"];
  }
  handoutEventDetails = self->_handoutEventDetails;
  if (handoutEventDetails)
  {
    v26 = [(PDDPHandoutEventDetails *)handoutEventDetails dictionaryRepresentation];
    [v6 setObject:v26 forKey:@"handout_event_details"];
  }
  attachmentEventDetails = self->_attachmentEventDetails;
  if (attachmentEventDetails)
  {
    v28 = [(PDDPAttachmentEventDetails *)attachmentEventDetails dictionaryRepresentation];
    [v6 setObject:v28 forKey:@"attachment_event_details"];
  }
  progressEventDetails = self->_progressEventDetails;
  if (progressEventDetails)
  {
    v30 = [(PDDPProgressEventDetails *)progressEventDetails dictionaryRepresentation];
    [v6 setObject:v30 forKey:@"progress_event_details"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t eventDetails = self->_eventDetails;
    if (eventDetails >= 4)
    {
      v32 = +[NSString stringWithFormat:@"(unknown: %i)", self->_eventDetails];
    }
    else
    {
      v32 = off_1001F6020[eventDetails];
    }
    [v6 setObject:v32 forKey:@"event_details"];
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100148A80((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_objectId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_dateCreated) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dateLastModified) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_extraInfos;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      int v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_handoutEventDetails) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_attachmentEventDetails) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_progressEventDetails) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[8] = self->_eventDetails;
    *((unsigned char *)v4 + 80) |= 1u;
  }
  long long v10 = v4;
  if (self->_objectId)
  {
    objc_msgSend(v4, "setObjectId:");
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[10] = self->_eventType;
    *((unsigned char *)v4 + 80) |= 4u;
  }
  if (self->_dateCreated) {
    objc_msgSend(v10, "setDateCreated:");
  }
  if (self->_dateLastModified) {
    objc_msgSend(v10, "setDateLastModified:");
  }
  if ([(PDDPEvent *)self extraInfosCount])
  {
    [v10 clearExtraInfos];
    unint64_t v5 = [(PDDPEvent *)self extraInfosCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PDDPEvent *)self extraInfoAtIndex:i];
        [v10 addExtraInfo:v8];
      }
    }
  }
  int v9 = v10;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v10[9] = self->_eventDetailsType;
    *((unsigned char *)v10 + 80) |= 2u;
  }
  if (self->_handoutEventDetails)
  {
    objc_msgSend(v10, "setHandoutEventDetails:");
    int v9 = v10;
  }
  if (self->_attachmentEventDetails)
  {
    objc_msgSend(v10, "setAttachmentEventDetails:");
    int v9 = v10;
  }
  if (self->_progressEventDetails)
  {
    objc_msgSend(v10, "setProgressEventDetails:");
    int v9 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[8] = self->_eventDetails;
    *((unsigned char *)v5 + 80) |= 1u;
  }
  id v7 = [(NSString *)self->_objectId copyWithZone:a3];
  uint64_t v8 = (void *)v6[8];
  v6[8] = v7;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v6 + 10) = self->_eventType;
    *((unsigned char *)v6 + 80) |= 4u;
  }
  id v9 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  long long v10 = (void *)v6[2];
  v6[2] = v9;

  id v11 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  long long v12 = (void *)v6[3];
  v6[3] = v11;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v13 = self->_extraInfos;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "copyWithZone:", a3, (void)v26);
        [v6 addExtraInfo:v18];
      }
      id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v15);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 9) = self->_eventDetailsType;
    *((unsigned char *)v6 + 80) |= 2u;
  }
  id v19 = -[PDDPHandoutEventDetails copyWithZone:](self->_handoutEventDetails, "copyWithZone:", a3, (void)v26);
  uint64_t v20 = (void *)v6[7];
  v6[7] = v19;

  id v21 = [(PDDPAttachmentEventDetails *)self->_attachmentEventDetails copyWithZone:a3];
  v22 = (void *)v6[1];
  v6[1] = v21;

  id v23 = [(PDDPProgressEventDetails *)self->_progressEventDetails copyWithZone:a3];
  v24 = (void *)v6[9];
  v6[9] = v23;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 80);
  if (has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_eventDetails != *((_DWORD *)v4 + 8)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_32;
  }
  objectId = self->_objectId;
  if ((unint64_t)objectId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](objectId, "isEqual:"))
    {
LABEL_32:
      unsigned __int8 v14 = 0;
      goto LABEL_33;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 80);
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_eventType != *((_DWORD *)v4 + 10)) {
      goto LABEL_32;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_32;
  }
  dateCreated = self->_dateCreated;
  if ((unint64_t)dateCreated | *((void *)v4 + 2) && !-[PDDPDate isEqual:](dateCreated, "isEqual:")) {
    goto LABEL_32;
  }
  dateLastModified = self->_dateLastModified;
  if ((unint64_t)dateLastModified | *((void *)v4 + 3))
  {
    if (!-[PDDPDate isEqual:](dateLastModified, "isEqual:")) {
      goto LABEL_32;
    }
  }
  extraInfos = self->_extraInfos;
  if ((unint64_t)extraInfos | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](extraInfos, "isEqual:")) {
      goto LABEL_32;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_eventDetailsType != *((_DWORD *)v4 + 9)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_32;
  }
  handoutEventDetails = self->_handoutEventDetails;
  if ((unint64_t)handoutEventDetails | *((void *)v4 + 7)
    && !-[PDDPHandoutEventDetails isEqual:](handoutEventDetails, "isEqual:"))
  {
    goto LABEL_32;
  }
  attachmentEventDetails = self->_attachmentEventDetails;
  if ((unint64_t)attachmentEventDetails | *((void *)v4 + 1))
  {
    if (!-[PDDPAttachmentEventDetails isEqual:](attachmentEventDetails, "isEqual:")) {
      goto LABEL_32;
    }
  }
  progressEventDetails = self->_progressEventDetails;
  if ((unint64_t)progressEventDetails | *((void *)v4 + 9)) {
    unsigned __int8 v14 = -[PDDPProgressEventDetails isEqual:](progressEventDetails, "isEqual:");
  }
  else {
    unsigned __int8 v14 = 1;
  }
LABEL_33:

  return v14;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_eventDetails;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_objectId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v5 = 2654435761 * self->_eventType;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = [(PDDPDate *)self->_dateCreated hash];
  unint64_t v7 = [(PDDPDate *)self->_dateLastModified hash];
  unint64_t v8 = (unint64_t)[(NSMutableArray *)self->_extraInfos hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_eventDetailsType;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(PDDPHandoutEventDetails *)self->_handoutEventDetails hash];
  unint64_t v11 = [(PDDPAttachmentEventDetails *)self->_attachmentEventDetails hash];
  return v10 ^ v11 ^ [(PDDPProgressEventDetails *)self->_progressEventDetails hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  id v5 = v4;
  if (v4[20])
  {
    self->_uint64_t eventDetails = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 8)) {
    -[PDDPEvent setObjectId:](self, "setObjectId:");
  }
  if ((*((unsigned char *)v5 + 80) & 4) != 0)
  {
    self->_int eventType = *((_DWORD *)v5 + 10);
    *(unsigned char *)&self->_has |= 4u;
  }
  dateCreated = self->_dateCreated;
  uint64_t v7 = *((void *)v5 + 2);
  if (dateCreated)
  {
    if (v7) {
      -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[PDDPEvent setDateCreated:](self, "setDateCreated:");
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v9 = *((void *)v5 + 3);
  if (dateLastModified)
  {
    if (v9) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[PDDPEvent setDateLastModified:](self, "setDateLastModified:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = *((id *)v5 + 6);
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        -[PDDPEvent addExtraInfo:](self, "addExtraInfo:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
      }
      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  if ((*((unsigned char *)v5 + 80) & 2) != 0)
  {
    self->_uint64_t eventDetailsType = *((_DWORD *)v5 + 9);
    *(unsigned char *)&self->_has |= 2u;
  }
  handoutEventDetails = self->_handoutEventDetails;
  uint64_t v16 = *((void *)v5 + 7);
  if (handoutEventDetails)
  {
    if (v16) {
      -[PDDPHandoutEventDetails mergeFrom:](handoutEventDetails, "mergeFrom:");
    }
  }
  else if (v16)
  {
    [(PDDPEvent *)self setHandoutEventDetails:"setHandoutEventDetails:"];
  }
  attachmentEventDetails = self->_attachmentEventDetails;
  uint64_t v18 = *((void *)v5 + 1);
  if (attachmentEventDetails)
  {
    if (v18) {
      -[PDDPAttachmentEventDetails mergeFrom:](attachmentEventDetails, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[PDDPEvent setAttachmentEventDetails:](self, "setAttachmentEventDetails:");
  }
  progressEventDetails = self->_progressEventDetails;
  uint64_t v20 = *((void *)v5 + 9);
  if (progressEventDetails)
  {
    if (v20) {
      -[PDDPProgressEventDetails mergeFrom:](progressEventDetails, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[PDDPEvent setProgressEventDetails:](self, "setProgressEventDetails:");
  }
}

- (NSString)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
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

- (NSMutableArray)extraInfos
{
  return self->_extraInfos;
}

- (void)setExtraInfos:(id)a3
{
}

- (PDDPHandoutEventDetails)handoutEventDetails
{
  return self->_handoutEventDetails;
}

- (PDDPAttachmentEventDetails)attachmentEventDetails
{
  return self->_attachmentEventDetails;
}

- (PDDPProgressEventDetails)progressEventDetails
{
  return self->_progressEventDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressEventDetails, 0);
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_handoutEventDetails, 0);
  objc_storeStrong((id *)&self->_extraInfos, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);

  objc_storeStrong((id *)&self->_attachmentEventDetails, 0);
}

@end