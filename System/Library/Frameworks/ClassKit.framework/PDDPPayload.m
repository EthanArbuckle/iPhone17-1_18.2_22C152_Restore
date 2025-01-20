@interface PDDPPayload
- (BOOL)hasAction;
- (BOOL)hasActionFlags;
- (BOOL)hasAssessment;
- (BOOL)hasAsset;
- (BOOL)hasAttachment;
- (BOOL)hasAuthStatus;
- (BOOL)hasClassInfo;
- (BOOL)hasClassMember;
- (BOOL)hasClassZone;
- (BOOL)hasCollection;
- (BOOL)hasCollectionItem;
- (BOOL)hasCompletionStatus;
- (BOOL)hasHandout;
- (BOOL)hasPayloadSize;
- (BOOL)hasPerson;
- (BOOL)hasQueryZone;
- (BOOL)hasRecipient;
- (BOOL)hasSchedule;
- (BOOL)hasScheduledEvent;
- (BOOL)hasStateChange;
- (BOOL)hasStatus;
- (BOOL)hasSurvey;
- (BOOL)hasSurveyStep;
- (BOOL)hasSurveyStepAnswer;
- (BOOL)hasTakerWork;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PDDPAssessment)assessment;
- (PDDPAssetReference)asset;
- (PDDPAuthorizationStatus)authStatus;
- (PDDPClass)classInfo;
- (PDDPClassMember)classMember;
- (PDDPClassZone)classZone;
- (PDDPCollection)collection;
- (PDDPCollectionItem)collectionItem;
- (PDDPCompletionStatus)completionStatus;
- (PDDPHandout)handout;
- (PDDPHandoutAttachment)attachment;
- (PDDPHandoutRecipient)recipient;
- (PDDPPerson)person;
- (PDDPSchedule)schedule;
- (PDDPScheduledEvent)scheduledEvent;
- (PDDPSchoolworkQueryZone)queryZone;
- (PDDPStateChange)stateChange;
- (PDDPStatus)status;
- (PDDPSurvey)survey;
- (PDDPSurveyStep)surveyStep;
- (PDDPSurveyStepAnswer)surveyStepAnswer;
- (PDDPTakerWork)takerWork;
- (id)actionAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsAction:(id)a3;
- (int)StringAsType:(id)a3;
- (int)action;
- (int)payloadSize;
- (int)type;
- (unint64_t)actionFlags;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAction:(int)a3;
- (void)setActionFlags:(unint64_t)a3;
- (void)setAssessment:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAttachment:(id)a3;
- (void)setAuthStatus:(id)a3;
- (void)setClassInfo:(id)a3;
- (void)setClassMember:(id)a3;
- (void)setClassZone:(id)a3;
- (void)setCollection:(id)a3;
- (void)setCollectionItem:(id)a3;
- (void)setCompletionStatus:(id)a3;
- (void)setHandout:(id)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setHasActionFlags:(BOOL)a3;
- (void)setHasPayloadSize:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setPayloadSize:(int)a3;
- (void)setPerson:(id)a3;
- (void)setQueryZone:(id)a3;
- (void)setRecipient:(id)a3;
- (void)setSchedule:(id)a3;
- (void)setScheduledEvent:(id)a3;
- (void)setStateChange:(id)a3;
- (void)setStatus:(id)a3;
- (void)setSurvey:(id)a3;
- (void)setSurveyStep:(id)a3;
- (void)setSurveyStepAnswer:(id)a3;
- (void)setTakerWork:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPPayload

- (void)setPayloadSize:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_payloadSize = a3;
}

- (void)setHasPayloadSize:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPayloadSize
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)typeAsString:(int)a3
{
  if a3 < 0x27 && ((0x7FFFFE91DFuLL >> a3))
  {
    char v3 = off_1001F5AD8[a3];
  }
  else
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
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
  else if ([v3 isEqualToString:@"STATUS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HANDOUT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ATTACHMENT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RECIPIENT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CLASS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PERSON"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CLASS_MEMBER"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CLASS_ZONE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"ASSET"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"AUTHORIZATION_STATUS"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"COMPLETION_STATUS"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"STATE_CHANGE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"COLLECTION"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"COLLECTION_ITEM"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"ARCHIVED_HANDOUT"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"ARCHIVED_HANDOUT_ATTACHMENT"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"ARCHIVED_ASSET_REFERENCE"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"SURVEY"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"SURVEY_STEP"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"SURVEY_STEP_ANSWER"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"ARCHIVED_SURVEY"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"ARCHIVED_SURVEY_STEP"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"SCHEDULE"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"SCHEDULED_EVENT"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"ASSESSMENT"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"TAKER_WORK"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"ARCHIVED_ASSESSMENT"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"RETURNED_HANDOUT"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"RETURNED_ATTACHMENT"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"RETURNED_ASSESSMENT"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"RETURNED_TAKER_WORK"])
  {
    int v4 = 38;
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

- (BOOL)hasHandout
{
  return self->_handout != 0;
}

- (BOOL)hasAttachment
{
  return self->_attachment != 0;
}

- (BOOL)hasRecipient
{
  return self->_recipient != 0;
}

- (BOOL)hasClassInfo
{
  return self->_classInfo != 0;
}

- (BOOL)hasPerson
{
  return self->_person != 0;
}

- (BOOL)hasClassMember
{
  return self->_classMember != 0;
}

- (BOOL)hasClassZone
{
  return self->_classZone != 0;
}

- (BOOL)hasAsset
{
  return self->_asset != 0;
}

- (BOOL)hasAuthStatus
{
  return self->_authStatus != 0;
}

- (BOOL)hasCompletionStatus
{
  return self->_completionStatus != 0;
}

- (int)action
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAction
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)actionAsString:(int)a3
{
  if (a3 >= 6)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_1001F5C10[a3];
  }

  return v3;
}

- (int)StringAsAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ACTION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CREATE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CHANGE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DELETE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"REPLACE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"REPAIR"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasStateChange
{
  return self->_stateChange != 0;
}

- (BOOL)hasQueryZone
{
  return self->_queryZone != 0;
}

- (BOOL)hasCollection
{
  return self->_collection != 0;
}

- (BOOL)hasCollectionItem
{
  return self->_collectionItem != 0;
}

- (BOOL)hasSurvey
{
  return self->_survey != 0;
}

- (BOOL)hasSurveyStep
{
  return self->_surveyStep != 0;
}

- (BOOL)hasSurveyStepAnswer
{
  return self->_surveyStepAnswer != 0;
}

- (void)setActionFlags:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_actionFlags = a3;
}

- (void)setHasActionFlags:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActionFlags
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSchedule
{
  return self->_schedule != 0;
}

- (BOOL)hasScheduledEvent
{
  return self->_scheduledEvent != 0;
}

- (BOOL)hasAssessment
{
  return self->_assessment != 0;
}

- (BOOL)hasTakerWork
{
  return self->_takerWork != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPPayload;
  id v3 = [(PDDPPayload *)&v7 description];
  int v4 = [(PDDPPayload *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = +[NSNumber numberWithInt:self->_payloadSize];
    [v3 setObject:v5 forKey:@"payload_size"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    unsigned int type = self->_type;
    if (type < 0x27 && ((0x7FFFFE91DFuLL >> type) & 1) != 0)
    {
      objc_super v7 = off_1001F5AD8[type];
    }
    else
    {
      objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    [v3 setObject:v7 forKey:@"type"];
  }
  status = self->_status;
  if (status)
  {
    v9 = [(PDDPStatus *)status dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"status"];
  }
  handout = self->_handout;
  if (handout)
  {
    v11 = [(PDDPHandout *)handout dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"handout"];
  }
  attachment = self->_attachment;
  if (attachment)
  {
    v13 = [(PDDPHandoutAttachment *)attachment dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"attachment"];
  }
  recipient = self->_recipient;
  if (recipient)
  {
    v15 = [(PDDPHandoutRecipient *)recipient dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"recipient"];
  }
  classInfo = self->_classInfo;
  if (classInfo)
  {
    v17 = [(PDDPClass *)classInfo dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"class_info"];
  }
  person = self->_person;
  if (person)
  {
    v19 = [(PDDPPerson *)person dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"person"];
  }
  classMember = self->_classMember;
  if (classMember)
  {
    v21 = [(PDDPClassMember *)classMember dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"class_member"];
  }
  classZone = self->_classZone;
  if (classZone)
  {
    v23 = [(PDDPClassZone *)classZone dictionaryRepresentation];
    [v3 setObject:v23 forKey:@"class_zone"];
  }
  asset = self->_asset;
  if (asset)
  {
    v25 = [(PDDPAssetReference *)asset dictionaryRepresentation];
    [v3 setObject:v25 forKey:@"asset"];
  }
  authStatus = self->_authStatus;
  if (authStatus)
  {
    v27 = [(PDDPAuthorizationStatus *)authStatus dictionaryRepresentation];
    [v3 setObject:v27 forKey:@"auth_status"];
  }
  completionStatus = self->_completionStatus;
  if (completionStatus)
  {
    v29 = [(PDDPCompletionStatus *)completionStatus dictionaryRepresentation];
    [v3 setObject:v29 forKey:@"completion_status"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t action = self->_action;
    if (action >= 6)
    {
      v31 = +[NSString stringWithFormat:@"(unknown: %i)", self->_action];
    }
    else
    {
      v31 = off_1001F5C10[action];
    }
    [v3 setObject:v31 forKey:@"action"];
  }
  stateChange = self->_stateChange;
  if (stateChange)
  {
    v33 = [(PDDPStateChange *)stateChange dictionaryRepresentation];
    [v3 setObject:v33 forKey:@"state_change"];
  }
  queryZone = self->_queryZone;
  if (queryZone)
  {
    v35 = [(PDDPSchoolworkQueryZone *)queryZone dictionaryRepresentation];
    [v3 setObject:v35 forKey:@"query_zone"];
  }
  collection = self->_collection;
  if (collection)
  {
    v37 = [(PDDPCollection *)collection dictionaryRepresentation];
    [v3 setObject:v37 forKey:@"collection"];
  }
  collectionItem = self->_collectionItem;
  if (collectionItem)
  {
    v39 = [(PDDPCollectionItem *)collectionItem dictionaryRepresentation];
    [v3 setObject:v39 forKey:@"collection_item"];
  }
  survey = self->_survey;
  if (survey)
  {
    v41 = [(PDDPSurvey *)survey dictionaryRepresentation];
    [v3 setObject:v41 forKey:@"survey"];
  }
  surveyStep = self->_surveyStep;
  if (surveyStep)
  {
    v43 = [(PDDPSurveyStep *)surveyStep dictionaryRepresentation];
    [v3 setObject:v43 forKey:@"survey_step"];
  }
  surveyStepAnswer = self->_surveyStepAnswer;
  if (surveyStepAnswer)
  {
    v45 = [(PDDPSurveyStepAnswer *)surveyStepAnswer dictionaryRepresentation];
    [v3 setObject:v45 forKey:@"survey_step_answer"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v46 = +[NSNumber numberWithUnsignedLongLong:self->_actionFlags];
    [v3 setObject:v46 forKey:@"action_flags"];
  }
  schedule = self->_schedule;
  if (schedule)
  {
    v48 = [(PDDPSchedule *)schedule dictionaryRepresentation];
    [v3 setObject:v48 forKey:@"schedule"];
  }
  scheduledEvent = self->_scheduledEvent;
  if (scheduledEvent)
  {
    v50 = [(PDDPScheduledEvent *)scheduledEvent dictionaryRepresentation];
    [v3 setObject:v50 forKey:@"scheduled_event"];
  }
  assessment = self->_assessment;
  if (assessment)
  {
    v52 = [(PDDPAssessment *)assessment dictionaryRepresentation];
    [v3 setObject:v52 forKey:@"assessment"];
  }
  takerWork = self->_takerWork;
  if (takerWork)
  {
    v54 = [(PDDPTakerWork *)takerWork dictionaryRepresentation];
    [v3 setObject:v54 forKey:@"taker_work"];
  }
  id v55 = v3;

  return v55;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001292AC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_status)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_handout)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_attachment)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_recipient)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_classInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_person)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_classMember)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_classZone)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_asset)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_authStatus)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_completionStatus)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_stateChange)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_queryZone)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_collection)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_collectionItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_survey)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_surveyStep)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_surveyStepAnswer)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
  if (self->_schedule)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_scheduledEvent)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_assessment)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_takerWork)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[28] = self->_payloadSize;
    *((unsigned char *)v4 + 212) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v4[52] = self->_type;
    *((unsigned char *)v4 + 212) |= 8u;
  }
  id v6 = v4;
  if (self->_status)
  {
    objc_msgSend(v4, "setStatus:");
    id v4 = v6;
  }
  if (self->_handout)
  {
    objc_msgSend(v6, "setHandout:");
    id v4 = v6;
  }
  if (self->_attachment)
  {
    objc_msgSend(v6, "setAttachment:");
    id v4 = v6;
  }
  if (self->_recipient)
  {
    objc_msgSend(v6, "setRecipient:");
    id v4 = v6;
  }
  if (self->_classInfo)
  {
    objc_msgSend(v6, "setClassInfo:");
    id v4 = v6;
  }
  if (self->_person)
  {
    objc_msgSend(v6, "setPerson:");
    id v4 = v6;
  }
  if (self->_classMember)
  {
    objc_msgSend(v6, "setClassMember:");
    id v4 = v6;
  }
  if (self->_classZone)
  {
    objc_msgSend(v6, "setClassZone:");
    id v4 = v6;
  }
  if (self->_asset)
  {
    objc_msgSend(v6, "setAsset:");
    id v4 = v6;
  }
  if (self->_authStatus)
  {
    objc_msgSend(v6, "setAuthStatus:");
    id v4 = v6;
  }
  if (self->_completionStatus)
  {
    objc_msgSend(v6, "setCompletionStatus:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[4] = self->_action;
    *((unsigned char *)v4 + 212) |= 2u;
  }
  if (self->_stateChange)
  {
    objc_msgSend(v6, "setStateChange:");
    id v4 = v6;
  }
  if (self->_queryZone)
  {
    objc_msgSend(v6, "setQueryZone:");
    id v4 = v6;
  }
  if (self->_collection)
  {
    objc_msgSend(v6, "setCollection:");
    id v4 = v6;
  }
  if (self->_collectionItem)
  {
    objc_msgSend(v6, "setCollectionItem:");
    id v4 = v6;
  }
  if (self->_survey)
  {
    objc_msgSend(v6, "setSurvey:");
    id v4 = v6;
  }
  if (self->_surveyStep)
  {
    objc_msgSend(v6, "setSurveyStep:");
    id v4 = v6;
  }
  if (self->_surveyStepAnswer)
  {
    objc_msgSend(v6, "setSurveyStepAnswer:");
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_actionFlags;
    *((unsigned char *)v4 + 212) |= 1u;
  }
  if (self->_schedule)
  {
    objc_msgSend(v6, "setSchedule:");
    id v4 = v6;
  }
  if (self->_scheduledEvent)
  {
    objc_msgSend(v6, "setScheduledEvent:");
    id v4 = v6;
  }
  if (self->_assessment)
  {
    objc_msgSend(v6, "setAssessment:");
    id v4 = v6;
  }
  if (self->_takerWork)
  {
    objc_msgSend(v6, "setTakerWork:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[28] = self->_payloadSize;
    *((unsigned char *)v5 + 212) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v5[52] = self->_type;
    *((unsigned char *)v5 + 212) |= 8u;
  }
  id v8 = [(PDDPStatus *)self->_status copyWithZone:a3];
  v9 = (void *)v6[21];
  v6[21] = v8;

  id v10 = [(PDDPHandout *)self->_handout copyWithZone:a3];
  v11 = (void *)v6[13];
  v6[13] = v10;

  id v12 = [(PDDPHandoutAttachment *)self->_attachment copyWithZone:a3];
  v13 = (void *)v6[5];
  v6[5] = v12;

  id v14 = [(PDDPHandoutRecipient *)self->_recipient copyWithZone:a3];
  v15 = (void *)v6[17];
  v6[17] = v14;

  id v16 = [(PDDPClass *)self->_classInfo copyWithZone:a3];
  v17 = (void *)v6[7];
  v6[7] = v16;

  id v18 = [(PDDPPerson *)self->_person copyWithZone:a3];
  v19 = (void *)v6[15];
  v6[15] = v18;

  id v20 = [(PDDPClassMember *)self->_classMember copyWithZone:a3];
  v21 = (void *)v6[8];
  v6[8] = v20;

  id v22 = [(PDDPClassZone *)self->_classZone copyWithZone:a3];
  v23 = (void *)v6[9];
  v6[9] = v22;

  id v24 = [(PDDPAssetReference *)self->_asset copyWithZone:a3];
  v25 = (void *)v6[4];
  v6[4] = v24;

  id v26 = [(PDDPAuthorizationStatus *)self->_authStatus copyWithZone:a3];
  v27 = (void *)v6[6];
  v6[6] = v26;

  id v28 = [(PDDPCompletionStatus *)self->_completionStatus copyWithZone:a3];
  v29 = (void *)v6[12];
  v6[12] = v28;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 4) = self->_action;
    *((unsigned char *)v6 + 212) |= 2u;
  }
  id v30 = [(PDDPStateChange *)self->_stateChange copyWithZone:a3];
  v31 = (void *)v6[20];
  v6[20] = v30;

  id v32 = [(PDDPSchoolworkQueryZone *)self->_queryZone copyWithZone:a3];
  v33 = (void *)v6[16];
  v6[16] = v32;

  id v34 = [(PDDPCollection *)self->_collection copyWithZone:a3];
  v35 = (void *)v6[10];
  v6[10] = v34;

  id v36 = [(PDDPCollectionItem *)self->_collectionItem copyWithZone:a3];
  v37 = (void *)v6[11];
  v6[11] = v36;

  id v38 = [(PDDPSurvey *)self->_survey copyWithZone:a3];
  v39 = (void *)v6[22];
  v6[22] = v38;

  id v40 = [(PDDPSurveyStep *)self->_surveyStep copyWithZone:a3];
  v41 = (void *)v6[23];
  v6[23] = v40;

  id v42 = [(PDDPSurveyStepAnswer *)self->_surveyStepAnswer copyWithZone:a3];
  v43 = (void *)v6[24];
  v6[24] = v42;

  if (*(unsigned char *)&self->_has)
  {
    v6[1] = self->_actionFlags;
    *((unsigned char *)v6 + 212) |= 1u;
  }
  id v44 = [(PDDPSchedule *)self->_schedule copyWithZone:a3];
  v45 = (void *)v6[18];
  v6[18] = v44;

  id v46 = [(PDDPScheduledEvent *)self->_scheduledEvent copyWithZone:a3];
  v47 = (void *)v6[19];
  v6[19] = v46;

  id v48 = [(PDDPAssessment *)self->_assessment copyWithZone:a3];
  v49 = (void *)v6[3];
  v6[3] = v48;

  id v50 = [(PDDPTakerWork *)self->_takerWork copyWithZone:a3];
  v51 = (void *)v6[25];
  v6[25] = v50;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_66;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 212) & 4) == 0 || self->_payloadSize != *((_DWORD *)v4 + 28)) {
      goto LABEL_66;
    }
  }
  else if ((*((unsigned char *)v4 + 212) & 4) != 0)
  {
LABEL_66:
    unsigned __int8 v27 = 0;
    goto LABEL_67;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 212) & 8) == 0 || self->_type != *((_DWORD *)v4 + 52)) {
      goto LABEL_66;
    }
  }
  else if ((*((unsigned char *)v4 + 212) & 8) != 0)
  {
    goto LABEL_66;
  }
  status = self->_status;
  if ((unint64_t)status | *((void *)v4 + 21) && !-[PDDPStatus isEqual:](status, "isEqual:")) {
    goto LABEL_66;
  }
  handout = self->_handout;
  if ((unint64_t)handout | *((void *)v4 + 13))
  {
    if (!-[PDDPHandout isEqual:](handout, "isEqual:")) {
      goto LABEL_66;
    }
  }
  attachment = self->_attachment;
  if ((unint64_t)attachment | *((void *)v4 + 5))
  {
    if (!-[PDDPHandoutAttachment isEqual:](attachment, "isEqual:")) {
      goto LABEL_66;
    }
  }
  recipient = self->_recipient;
  if ((unint64_t)recipient | *((void *)v4 + 17))
  {
    if (!-[PDDPHandoutRecipient isEqual:](recipient, "isEqual:")) {
      goto LABEL_66;
    }
  }
  classInfo = self->_classInfo;
  if ((unint64_t)classInfo | *((void *)v4 + 7))
  {
    if (!-[PDDPClass isEqual:](classInfo, "isEqual:")) {
      goto LABEL_66;
    }
  }
  person = self->_person;
  if ((unint64_t)person | *((void *)v4 + 15))
  {
    if (!-[PDDPPerson isEqual:](person, "isEqual:")) {
      goto LABEL_66;
    }
  }
  classMember = self->_classMember;
  if ((unint64_t)classMember | *((void *)v4 + 8))
  {
    if (!-[PDDPClassMember isEqual:](classMember, "isEqual:")) {
      goto LABEL_66;
    }
  }
  classZone = self->_classZone;
  if ((unint64_t)classZone | *((void *)v4 + 9))
  {
    if (!-[PDDPClassZone isEqual:](classZone, "isEqual:")) {
      goto LABEL_66;
    }
  }
  asset = self->_asset;
  if ((unint64_t)asset | *((void *)v4 + 4))
  {
    if (!-[PDDPAssetReference isEqual:](asset, "isEqual:")) {
      goto LABEL_66;
    }
  }
  authStatus = self->_authStatus;
  if ((unint64_t)authStatus | *((void *)v4 + 6))
  {
    if (!-[PDDPAuthorizationStatus isEqual:](authStatus, "isEqual:")) {
      goto LABEL_66;
    }
  }
  completionStatus = self->_completionStatus;
  if ((unint64_t)completionStatus | *((void *)v4 + 12))
  {
    if (!-[PDDPCompletionStatus isEqual:](completionStatus, "isEqual:")) {
      goto LABEL_66;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 212) & 2) == 0 || self->_action != *((_DWORD *)v4 + 4)) {
      goto LABEL_66;
    }
  }
  else if ((*((unsigned char *)v4 + 212) & 2) != 0)
  {
    goto LABEL_66;
  }
  stateChange = self->_stateChange;
  if ((unint64_t)stateChange | *((void *)v4 + 20) && !-[PDDPStateChange isEqual:](stateChange, "isEqual:")) {
    goto LABEL_66;
  }
  queryZone = self->_queryZone;
  if ((unint64_t)queryZone | *((void *)v4 + 16))
  {
    if (!-[PDDPSchoolworkQueryZone isEqual:](queryZone, "isEqual:")) {
      goto LABEL_66;
    }
  }
  collection = self->_collection;
  if ((unint64_t)collection | *((void *)v4 + 10))
  {
    if (!-[PDDPCollection isEqual:](collection, "isEqual:")) {
      goto LABEL_66;
    }
  }
  collectionItem = self->_collectionItem;
  if ((unint64_t)collectionItem | *((void *)v4 + 11))
  {
    if (!-[PDDPCollectionItem isEqual:](collectionItem, "isEqual:")) {
      goto LABEL_66;
    }
  }
  survey = self->_survey;
  if ((unint64_t)survey | *((void *)v4 + 22))
  {
    if (!-[PDDPSurvey isEqual:](survey, "isEqual:")) {
      goto LABEL_66;
    }
  }
  surveyStep = self->_surveyStep;
  if ((unint64_t)surveyStep | *((void *)v4 + 23))
  {
    if (!-[PDDPSurveyStep isEqual:](surveyStep, "isEqual:")) {
      goto LABEL_66;
    }
  }
  surveyStepAnswer = self->_surveyStepAnswer;
  if ((unint64_t)surveyStepAnswer | *((void *)v4 + 24))
  {
    if (!-[PDDPSurveyStepAnswer isEqual:](surveyStepAnswer, "isEqual:")) {
      goto LABEL_66;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 212) & 1) == 0 || self->_actionFlags != *((void *)v4 + 1)) {
      goto LABEL_66;
    }
  }
  else if (*((unsigned char *)v4 + 212))
  {
    goto LABEL_66;
  }
  schedule = self->_schedule;
  if ((unint64_t)schedule | *((void *)v4 + 18) && !-[PDDPSchedule isEqual:](schedule, "isEqual:")) {
    goto LABEL_66;
  }
  scheduledEvent = self->_scheduledEvent;
  if ((unint64_t)scheduledEvent | *((void *)v4 + 19))
  {
    if (!-[PDDPScheduledEvent isEqual:](scheduledEvent, "isEqual:")) {
      goto LABEL_66;
    }
  }
  assessment = self->_assessment;
  if ((unint64_t)assessment | *((void *)v4 + 3))
  {
    if (!-[PDDPAssessment isEqual:](assessment, "isEqual:")) {
      goto LABEL_66;
    }
  }
  takerWork = self->_takerWork;
  if ((unint64_t)takerWork | *((void *)v4 + 25)) {
    unsigned __int8 v27 = -[PDDPTakerWork isEqual:](takerWork, "isEqual:");
  }
  else {
    unsigned __int8 v27 = 1;
  }
LABEL_67:

  return v27;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v28 = 2654435761 * self->_payloadSize;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v28 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v27 = 2654435761 * self->_type;
      goto LABEL_6;
    }
  }
  uint64_t v27 = 0;
LABEL_6:
  unint64_t v26 = [(PDDPStatus *)self->_status hash];
  unint64_t v25 = [(PDDPHandout *)self->_handout hash];
  unint64_t v24 = [(PDDPHandoutAttachment *)self->_attachment hash];
  unint64_t v23 = [(PDDPHandoutRecipient *)self->_recipient hash];
  unint64_t v22 = [(PDDPClass *)self->_classInfo hash];
  unint64_t v21 = [(PDDPPerson *)self->_person hash];
  unint64_t v20 = [(PDDPClassMember *)self->_classMember hash];
  unint64_t v19 = [(PDDPClassZone *)self->_classZone hash];
  unint64_t v18 = [(PDDPAssetReference *)self->_asset hash];
  unint64_t v17 = [(PDDPAuthorizationStatus *)self->_authStatus hash];
  unint64_t v16 = [(PDDPCompletionStatus *)self->_completionStatus hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_action;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(PDDPStateChange *)self->_stateChange hash];
  unint64_t v5 = [(PDDPSchoolworkQueryZone *)self->_queryZone hash];
  unint64_t v6 = [(PDDPCollection *)self->_collection hash];
  unint64_t v7 = [(PDDPCollectionItem *)self->_collectionItem hash];
  unint64_t v8 = [(PDDPSurvey *)self->_survey hash];
  unint64_t v9 = [(PDDPSurveyStep *)self->_surveyStep hash];
  unint64_t v10 = [(PDDPSurveyStepAnswer *)self->_surveyStepAnswer hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v11 = 2654435761u * self->_actionFlags;
  }
  else {
    unint64_t v11 = 0;
  }
  unint64_t v12 = v27 ^ v28 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(PDDPSchedule *)self->_schedule hash];
  unint64_t v13 = [(PDDPScheduledEvent *)self->_scheduledEvent hash];
  unint64_t v14 = v13 ^ [(PDDPAssessment *)self->_assessment hash];
  return v12 ^ v14 ^ [(PDDPTakerWork *)self->_takerWork hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (int *)a3;
  unint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 212);
  if ((v6 & 4) != 0)
  {
    self->_payloadSize = v4[28];
    *(unsigned char *)&self->_has |= 4u;
    char v6 = *((unsigned char *)v4 + 212);
  }
  if ((v6 & 8) != 0)
  {
    self->_unsigned int type = v4[52];
    *(unsigned char *)&self->_has |= 8u;
  }
  status = self->_status;
  uint64_t v8 = *((void *)v5 + 21);
  v51 = v5;
  if (status)
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[PDDPStatus mergeFrom:](status, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[PDDPPayload setStatus:](self, "setStatus:");
  }
  unint64_t v5 = v51;
LABEL_11:
  handout = self->_handout;
  uint64_t v10 = *((void *)v5 + 13);
  if (handout)
  {
    if (!v10) {
      goto LABEL_17;
    }
    -[PDDPHandout mergeFrom:](handout, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_17;
    }
    [(PDDPPayload *)self setHandout:"setHandout:"];
  }
  unint64_t v5 = v51;
LABEL_17:
  attachment = self->_attachment;
  uint64_t v12 = *((void *)v5 + 5);
  if (attachment)
  {
    if (!v12) {
      goto LABEL_23;
    }
    -[PDDPHandoutAttachment mergeFrom:](attachment, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_23;
    }
    -[PDDPPayload setAttachment:](self, "setAttachment:");
  }
  unint64_t v5 = v51;
LABEL_23:
  recipient = self->_recipient;
  uint64_t v14 = *((void *)v5 + 17);
  if (recipient)
  {
    if (!v14) {
      goto LABEL_29;
    }
    -[PDDPHandoutRecipient mergeFrom:](recipient, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_29;
    }
    -[PDDPPayload setRecipient:](self, "setRecipient:");
  }
  unint64_t v5 = v51;
LABEL_29:
  classInfo = self->_classInfo;
  uint64_t v16 = *((void *)v5 + 7);
  if (classInfo)
  {
    if (!v16) {
      goto LABEL_35;
    }
    -[PDDPClass mergeFrom:](classInfo, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_35;
    }
    -[PDDPPayload setClassInfo:](self, "setClassInfo:");
  }
  unint64_t v5 = v51;
LABEL_35:
  person = self->_person;
  uint64_t v18 = *((void *)v5 + 15);
  if (person)
  {
    if (!v18) {
      goto LABEL_41;
    }
    -[PDDPPerson mergeFrom:](person, "mergeFrom:");
  }
  else
  {
    if (!v18) {
      goto LABEL_41;
    }
    -[PDDPPayload setPerson:](self, "setPerson:");
  }
  unint64_t v5 = v51;
LABEL_41:
  classMember = self->_classMember;
  uint64_t v20 = *((void *)v5 + 8);
  if (classMember)
  {
    if (!v20) {
      goto LABEL_47;
    }
    -[PDDPClassMember mergeFrom:](classMember, "mergeFrom:");
  }
  else
  {
    if (!v20) {
      goto LABEL_47;
    }
    -[PDDPPayload setClassMember:](self, "setClassMember:");
  }
  unint64_t v5 = v51;
LABEL_47:
  classZone = self->_classZone;
  uint64_t v22 = *((void *)v5 + 9);
  if (classZone)
  {
    if (!v22) {
      goto LABEL_53;
    }
    -[PDDPClassZone mergeFrom:](classZone, "mergeFrom:");
  }
  else
  {
    if (!v22) {
      goto LABEL_53;
    }
    -[PDDPPayload setClassZone:](self, "setClassZone:");
  }
  unint64_t v5 = v51;
LABEL_53:
  asset = self->_asset;
  uint64_t v24 = *((void *)v5 + 4);
  if (asset)
  {
    if (!v24) {
      goto LABEL_59;
    }
    -[PDDPAssetReference mergeFrom:](asset, "mergeFrom:");
  }
  else
  {
    if (!v24) {
      goto LABEL_59;
    }
    -[PDDPPayload setAsset:](self, "setAsset:");
  }
  unint64_t v5 = v51;
LABEL_59:
  authStatus = self->_authStatus;
  uint64_t v26 = *((void *)v5 + 6);
  if (authStatus)
  {
    if (!v26) {
      goto LABEL_65;
    }
    -[PDDPAuthorizationStatus mergeFrom:](authStatus, "mergeFrom:");
  }
  else
  {
    if (!v26) {
      goto LABEL_65;
    }
    -[PDDPPayload setAuthStatus:](self, "setAuthStatus:");
  }
  unint64_t v5 = v51;
LABEL_65:
  completionStatus = self->_completionStatus;
  uint64_t v28 = *((void *)v5 + 12);
  if (completionStatus)
  {
    if (!v28) {
      goto LABEL_71;
    }
    -[PDDPCompletionStatus mergeFrom:](completionStatus, "mergeFrom:");
  }
  else
  {
    if (!v28) {
      goto LABEL_71;
    }
    -[PDDPPayload setCompletionStatus:](self, "setCompletionStatus:");
  }
  unint64_t v5 = v51;
LABEL_71:
  if ((v5[53] & 2) != 0)
  {
    self->_uint64_t action = v5[4];
    *(unsigned char *)&self->_has |= 2u;
  }
  stateChange = self->_stateChange;
  uint64_t v30 = *((void *)v5 + 20);
  if (stateChange)
  {
    if (!v30) {
      goto LABEL_79;
    }
    -[PDDPStateChange mergeFrom:](stateChange, "mergeFrom:");
  }
  else
  {
    if (!v30) {
      goto LABEL_79;
    }
    -[PDDPPayload setStateChange:](self, "setStateChange:");
  }
  unint64_t v5 = v51;
LABEL_79:
  queryZone = self->_queryZone;
  uint64_t v32 = *((void *)v5 + 16);
  if (queryZone)
  {
    if (!v32) {
      goto LABEL_85;
    }
    -[PDDPSchoolworkQueryZone mergeFrom:](queryZone, "mergeFrom:");
  }
  else
  {
    if (!v32) {
      goto LABEL_85;
    }
    -[PDDPPayload setQueryZone:](self, "setQueryZone:");
  }
  unint64_t v5 = v51;
LABEL_85:
  collection = self->_collection;
  uint64_t v34 = *((void *)v5 + 10);
  if (collection)
  {
    if (!v34) {
      goto LABEL_91;
    }
    -[PDDPCollection mergeFrom:](collection, "mergeFrom:");
  }
  else
  {
    if (!v34) {
      goto LABEL_91;
    }
    -[PDDPPayload setCollection:](self, "setCollection:");
  }
  unint64_t v5 = v51;
LABEL_91:
  collectionItem = self->_collectionItem;
  uint64_t v36 = *((void *)v5 + 11);
  if (collectionItem)
  {
    if (!v36) {
      goto LABEL_97;
    }
    -[PDDPCollectionItem mergeFrom:](collectionItem, "mergeFrom:");
  }
  else
  {
    if (!v36) {
      goto LABEL_97;
    }
    -[PDDPPayload setCollectionItem:](self, "setCollectionItem:");
  }
  unint64_t v5 = v51;
LABEL_97:
  survey = self->_survey;
  uint64_t v38 = *((void *)v5 + 22);
  if (survey)
  {
    if (!v38) {
      goto LABEL_103;
    }
    -[PDDPSurvey mergeFrom:](survey, "mergeFrom:");
  }
  else
  {
    if (!v38) {
      goto LABEL_103;
    }
    -[PDDPPayload setSurvey:](self, "setSurvey:");
  }
  unint64_t v5 = v51;
LABEL_103:
  surveyStep = self->_surveyStep;
  uint64_t v40 = *((void *)v5 + 23);
  if (surveyStep)
  {
    if (!v40) {
      goto LABEL_109;
    }
    -[PDDPSurveyStep mergeFrom:](surveyStep, "mergeFrom:");
  }
  else
  {
    if (!v40) {
      goto LABEL_109;
    }
    -[PDDPPayload setSurveyStep:](self, "setSurveyStep:");
  }
  unint64_t v5 = v51;
LABEL_109:
  surveyStepAnswer = self->_surveyStepAnswer;
  uint64_t v42 = *((void *)v5 + 24);
  if (surveyStepAnswer)
  {
    if (!v42) {
      goto LABEL_115;
    }
    -[PDDPSurveyStepAnswer mergeFrom:](surveyStepAnswer, "mergeFrom:");
  }
  else
  {
    if (!v42) {
      goto LABEL_115;
    }
    -[PDDPPayload setSurveyStepAnswer:](self, "setSurveyStepAnswer:");
  }
  unint64_t v5 = v51;
LABEL_115:
  if (v5[53])
  {
    self->_actionFlags = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  schedule = self->_schedule;
  uint64_t v44 = *((void *)v5 + 18);
  if (schedule)
  {
    if (!v44) {
      goto LABEL_123;
    }
    -[PDDPSchedule mergeFrom:](schedule, "mergeFrom:");
  }
  else
  {
    if (!v44) {
      goto LABEL_123;
    }
    -[PDDPPayload setSchedule:](self, "setSchedule:");
  }
  unint64_t v5 = v51;
LABEL_123:
  scheduledEvent = self->_scheduledEvent;
  uint64_t v46 = *((void *)v5 + 19);
  if (scheduledEvent)
  {
    if (!v46) {
      goto LABEL_129;
    }
    -[PDDPScheduledEvent mergeFrom:](scheduledEvent, "mergeFrom:");
  }
  else
  {
    if (!v46) {
      goto LABEL_129;
    }
    -[PDDPPayload setScheduledEvent:](self, "setScheduledEvent:");
  }
  unint64_t v5 = v51;
LABEL_129:
  assessment = self->_assessment;
  uint64_t v48 = *((void *)v5 + 3);
  if (assessment)
  {
    if (!v48) {
      goto LABEL_135;
    }
    -[PDDPAssessment mergeFrom:](assessment, "mergeFrom:");
  }
  else
  {
    if (!v48) {
      goto LABEL_135;
    }
    -[PDDPPayload setAssessment:](self, "setAssessment:");
  }
  unint64_t v5 = v51;
LABEL_135:
  takerWork = self->_takerWork;
  uint64_t v50 = *((void *)v5 + 25);
  if (takerWork)
  {
    if (!v50) {
      goto LABEL_141;
    }
    takerWork = (PDDPTakerWork *)-[PDDPTakerWork mergeFrom:](takerWork, "mergeFrom:");
  }
  else
  {
    if (!v50) {
      goto LABEL_141;
    }
    takerWork = (PDDPTakerWork *)-[PDDPPayload setTakerWork:](self, "setTakerWork:");
  }
  unint64_t v5 = v51;
LABEL_141:

  _objc_release_x1(takerWork, v5);
}

- (int)payloadSize
{
  return self->_payloadSize;
}

- (PDDPStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (PDDPHandout)handout
{
  return self->_handout;
}

- (void)setHandout:(id)a3
{
}

- (PDDPHandoutAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
}

- (PDDPHandoutRecipient)recipient
{
  return self->_recipient;
}

- (void)setRecipient:(id)a3
{
}

- (PDDPClass)classInfo
{
  return self->_classInfo;
}

- (void)setClassInfo:(id)a3
{
}

- (PDDPPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
}

- (PDDPClassMember)classMember
{
  return self->_classMember;
}

- (void)setClassMember:(id)a3
{
}

- (PDDPClassZone)classZone
{
  return self->_classZone;
}

- (void)setClassZone:(id)a3
{
}

- (PDDPAssetReference)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (PDDPAuthorizationStatus)authStatus
{
  return self->_authStatus;
}

- (void)setAuthStatus:(id)a3
{
}

- (PDDPCompletionStatus)completionStatus
{
  return self->_completionStatus;
}

- (void)setCompletionStatus:(id)a3
{
}

- (PDDPStateChange)stateChange
{
  return self->_stateChange;
}

- (void)setStateChange:(id)a3
{
}

- (PDDPSchoolworkQueryZone)queryZone
{
  return self->_queryZone;
}

- (void)setQueryZone:(id)a3
{
}

- (PDDPCollection)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
}

- (PDDPCollectionItem)collectionItem
{
  return self->_collectionItem;
}

- (void)setCollectionItem:(id)a3
{
}

- (PDDPSurvey)survey
{
  return self->_survey;
}

- (void)setSurvey:(id)a3
{
}

- (PDDPSurveyStep)surveyStep
{
  return self->_surveyStep;
}

- (void)setSurveyStep:(id)a3
{
}

- (PDDPSurveyStepAnswer)surveyStepAnswer
{
  return self->_surveyStepAnswer;
}

- (void)setSurveyStepAnswer:(id)a3
{
}

- (unint64_t)actionFlags
{
  return self->_actionFlags;
}

- (PDDPSchedule)schedule
{
  return self->_schedule;
}

- (void)setSchedule:(id)a3
{
}

- (PDDPScheduledEvent)scheduledEvent
{
  return self->_scheduledEvent;
}

- (void)setScheduledEvent:(id)a3
{
}

- (PDDPAssessment)assessment
{
  return self->_assessment;
}

- (void)setAssessment:(id)a3
{
}

- (PDDPTakerWork)takerWork
{
  return self->_takerWork;
}

- (void)setTakerWork:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_takerWork, 0);
  objc_storeStrong((id *)&self->_surveyStepAnswer, 0);
  objc_storeStrong((id *)&self->_surveyStep, 0);
  objc_storeStrong((id *)&self->_survey, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_stateChange, 0);
  objc_storeStrong((id *)&self->_scheduledEvent, 0);
  objc_storeStrong((id *)&self->_schedule, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_queryZone, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_handout, 0);
  objc_storeStrong((id *)&self->_completionStatus, 0);
  objc_storeStrong((id *)&self->_collectionItem, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_classZone, 0);
  objc_storeStrong((id *)&self->_classMember, 0);
  objc_storeStrong((id *)&self->_classInfo, 0);
  objc_storeStrong((id *)&self->_authStatus, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_asset, 0);

  objc_storeStrong((id *)&self->_assessment, 0);
}

@end