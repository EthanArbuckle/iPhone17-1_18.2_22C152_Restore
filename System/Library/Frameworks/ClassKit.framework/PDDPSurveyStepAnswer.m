@interface PDDPSurveyStepAnswer
+ (Class)classIdsType;
- (BOOL)hasAnswerType;
- (BOOL)hasContinuousSliderAnswerValue;
- (BOOL)hasCreatedBy;
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasMultipleChoiceSelectedIndexValue;
- (BOOL)hasObjectId;
- (BOOL)hasSurveyId;
- (BOOL)hasSurveyStepId;
- (BOOL)hasTextAnswerValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)classIds;
- (NSString)createdBy;
- (NSString)objectId;
- (NSString)surveyId;
- (NSString)surveyStepId;
- (NSString)textAnswerValue;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (double)continuousSliderAnswerValue;
- (id)answerTypeAsString:(int)a3;
- (id)classIdsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAnswerType:(id)a3;
- (int)answerType;
- (int)multipleChoiceSelectedIndexValue;
- (unint64_t)classIdsCount;
- (unint64_t)hash;
- (void)addClassIds:(id)a3;
- (void)clearClassIds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnswerType:(int)a3;
- (void)setClassIds:(id)a3;
- (void)setContinuousSliderAnswerValue:(double)a3;
- (void)setCreatedBy:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setHasAnswerType:(BOOL)a3;
- (void)setHasContinuousSliderAnswerValue:(BOOL)a3;
- (void)setHasMultipleChoiceSelectedIndexValue:(BOOL)a3;
- (void)setMultipleChoiceSelectedIndexValue:(int)a3;
- (void)setObjectId:(id)a3;
- (void)setSurveyId:(id)a3;
- (void)setSurveyStepId:(id)a3;
- (void)setTextAnswerValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPSurveyStepAnswer

- (BOOL)hasObjectId
{
  return self->_objectId != 0;
}

- (BOOL)hasSurveyId
{
  return self->_surveyId != 0;
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (BOOL)hasCreatedBy
{
  return self->_createdBy != 0;
}

- (int)answerType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_answerType;
  }
  else {
    return 0;
  }
}

- (void)setAnswerType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_answerType = a3;
}

- (void)setHasAnswerType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAnswerType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)answerTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_1001F5DB8 + a3);
  }

  return v3;
}

- (int)StringAsAnswerType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_RESPONSE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MULTIPLE_CHOICE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"OPEN_RESPONSE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CONTINUOUS_SLIDER"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasSurveyStepId
{
  return self->_surveyStepId != 0;
}

- (void)setMultipleChoiceSelectedIndexValue:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_multipleChoiceSelectedIndexValue = a3;
}

- (void)setHasMultipleChoiceSelectedIndexValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMultipleChoiceSelectedIndexValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasTextAnswerValue
{
  return self->_textAnswerValue != 0;
}

- (void)setContinuousSliderAnswerValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_continuousSliderAnswerValue = a3;
}

- (void)setHasContinuousSliderAnswerValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContinuousSliderAnswerValue
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

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPSurveyStepAnswer;
  char v3 = [(PDDPSurveyStepAnswer *)&v7 description];
  id v4 = [(PDDPSurveyStepAnswer *)self dictionaryRepresentation];
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
  surveyId = self->_surveyId;
  if (surveyId) {
    [v4 setObject:surveyId forKey:@"survey_id"];
  }
  dateCreated = self->_dateCreated;
  if (dateCreated)
  {
    id v8 = [(PDDPDate *)dateCreated dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"date_created"];
  }
  dateLastModified = self->_dateLastModified;
  if (dateLastModified)
  {
    v10 = [(PDDPDate *)dateLastModified dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"date_last_modified"];
  }
  createdBy = self->_createdBy;
  if (createdBy) {
    [v4 setObject:createdBy forKey:@"created_by"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t answerType = self->_answerType;
    if (answerType >= 4)
    {
      v13 = +[NSString stringWithFormat:@"(unknown: %i)", self->_answerType];
    }
    else
    {
      v13 = *(&off_1001F5DB8 + answerType);
    }
    [v4 setObject:v13 forKey:@"answer_type"];
  }
  surveyStepId = self->_surveyStepId;
  if (surveyStepId) {
    [v4 setObject:surveyStepId forKey:@"survey_step_id"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v15 = +[NSNumber numberWithInt:self->_multipleChoiceSelectedIndexValue];
    [v4 setObject:v15 forKey:@"multiple_choice_selected_index_value"];
  }
  textAnswerValue = self->_textAnswerValue;
  if (textAnswerValue) {
    [v4 setObject:textAnswerValue forKey:@"text_answer_value"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v17 = +[NSNumber numberWithDouble:self->_continuousSliderAnswerValue];
    [v4 setObject:v17 forKey:@"continuous_slider_answer_value"];
  }
  classIds = self->_classIds;
  if (classIds) {
    [v4 setObject:classIds forKey:@"class_ids"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100138C84((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_objectId) {
    PBDataWriterWriteStringField();
  }
  if (self->_surveyId) {
    PBDataWriterWriteStringField();
  }
  if (self->_dateCreated) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dateLastModified) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_createdBy) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_surveyStepId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_textAnswerValue) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_classIds;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_objectId)
  {
    objc_msgSend(v4, "setObjectId:");
    id v4 = v9;
  }
  if (self->_surveyId)
  {
    objc_msgSend(v9, "setSurveyId:");
    id v4 = v9;
  }
  if (self->_dateCreated)
  {
    objc_msgSend(v9, "setDateCreated:");
    id v4 = v9;
  }
  if (self->_dateLastModified)
  {
    objc_msgSend(v9, "setDateLastModified:");
    id v4 = v9;
  }
  if (self->_createdBy)
  {
    objc_msgSend(v9, "setCreatedBy:");
    id v4 = v9;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_answerType;
    *((unsigned char *)v4 + 96) |= 2u;
  }
  if (self->_surveyStepId)
  {
    objc_msgSend(v9, "setSurveyStepId:");
    id v4 = v9;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_multipleChoiceSelectedIndexValue;
    *((unsigned char *)v4 + 96) |= 4u;
  }
  if (self->_textAnswerValue)
  {
    objc_msgSend(v9, "setTextAnswerValue:");
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_continuousSliderAnswerValue;
    *((unsigned char *)v4 + 96) |= 1u;
  }
  if ([(PDDPSurveyStepAnswer *)self classIdsCount])
  {
    [v9 clearClassIds];
    unint64_t v5 = [(PDDPSurveyStepAnswer *)self classIdsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PDDPSurveyStepAnswer *)self classIdsAtIndex:i];
        [v9 addClassIds:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_objectId copyWithZone:a3];
  objc_super v7 = (void *)v5[8];
  v5[8] = v6;

  id v8 = [(NSString *)self->_surveyId copyWithZone:a3];
  id v9 = (void *)v5[9];
  v5[9] = v8;

  id v10 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  long long v11 = (void *)v5[5];
  v5[5] = v10;

  id v12 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  long long v13 = (void *)v5[6];
  v5[6] = v12;

  id v14 = [(NSString *)self->_createdBy copyWithZone:a3];
  v15 = (void *)v5[4];
  v5[4] = v14;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_answerType;
    *((unsigned char *)v5 + 96) |= 2u;
  }
  id v16 = [(NSString *)self->_surveyStepId copyWithZone:a3];
  v17 = (void *)v5[10];
  v5[10] = v16;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v5 + 14) = self->_multipleChoiceSelectedIndexValue;
    *((unsigned char *)v5 + 96) |= 4u;
  }
  id v18 = [(NSString *)self->_textAnswerValue copyWithZone:a3];
  v19 = (void *)v5[11];
  v5[11] = v18;

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = *(void *)&self->_continuousSliderAnswerValue;
    *((unsigned char *)v5 + 96) |= 1u;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v20 = self->_classIds;
  id v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v22; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "copyWithZone:", a3, (void)v27);
        [v5 addClassIds:v25];
      }
      id v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v22);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  objectId = self->_objectId;
  if ((unint64_t)objectId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](objectId, "isEqual:")) {
      goto LABEL_35;
    }
  }
  surveyId = self->_surveyId;
  if ((unint64_t)surveyId | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](surveyId, "isEqual:")) {
      goto LABEL_35;
    }
  }
  dateCreated = self->_dateCreated;
  if ((unint64_t)dateCreated | *((void *)v4 + 5))
  {
    if (!-[PDDPDate isEqual:](dateCreated, "isEqual:")) {
      goto LABEL_35;
    }
  }
  dateLastModified = self->_dateLastModified;
  if ((unint64_t)dateLastModified | *((void *)v4 + 6))
  {
    if (!-[PDDPDate isEqual:](dateLastModified, "isEqual:")) {
      goto LABEL_35;
    }
  }
  createdBy = self->_createdBy;
  if ((unint64_t)createdBy | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](createdBy, "isEqual:")) {
      goto LABEL_35;
    }
  }
  char has = (char)self->_has;
  char v11 = *((unsigned char *)v4 + 96);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 2) == 0 || self->_answerType != *((_DWORD *)v4 + 4)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
    goto LABEL_35;
  }
  surveyStepId = self->_surveyStepId;
  if ((unint64_t)surveyStepId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](surveyStepId, "isEqual:")) {
      goto LABEL_35;
    }
    char has = (char)self->_has;
    char v11 = *((unsigned char *)v4 + 96);
  }
  if ((has & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_multipleChoiceSelectedIndexValue != *((_DWORD *)v4 + 14)) {
      goto LABEL_35;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_35;
  }
  textAnswerValue = self->_textAnswerValue;
  if ((unint64_t)textAnswerValue | *((void *)v4 + 11))
  {
    if (-[NSString isEqual:](textAnswerValue, "isEqual:"))
    {
      char has = (char)self->_has;
      char v11 = *((unsigned char *)v4 + 96);
      goto LABEL_28;
    }
LABEL_35:
    unsigned __int8 v15 = 0;
    goto LABEL_36;
  }
LABEL_28:
  if (has)
  {
    if ((v11 & 1) == 0 || self->_continuousSliderAnswerValue != *((double *)v4 + 1)) {
      goto LABEL_35;
    }
  }
  else if (v11)
  {
    goto LABEL_35;
  }
  classIds = self->_classIds;
  if ((unint64_t)classIds | *((void *)v4 + 3)) {
    unsigned __int8 v15 = -[NSMutableArray isEqual:](classIds, "isEqual:");
  }
  else {
    unsigned __int8 v15 = 1;
  }
LABEL_36:

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v17 = [(NSString *)self->_objectId hash];
  NSUInteger v16 = [(NSString *)self->_surveyId hash];
  unint64_t v3 = [(PDDPDate *)self->_dateCreated hash];
  unint64_t v4 = [(PDDPDate *)self->_dateLastModified hash];
  NSUInteger v5 = [(NSString *)self->_createdBy hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_answerType;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_surveyStepId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v8 = 2654435761 * self->_multipleChoiceSelectedIndexValue;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = [(NSString *)self->_textAnswerValue hash];
  if (*(unsigned char *)&self->_has)
  {
    double continuousSliderAnswerValue = self->_continuousSliderAnswerValue;
    double v12 = -continuousSliderAnswerValue;
    if (continuousSliderAnswerValue >= 0.0) {
      double v12 = self->_continuousSliderAnswerValue;
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
  return v16 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ (unint64_t)[(NSMutableArray *)self->_classIds hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 8)) {
    -[PDDPSurveyStepAnswer setObjectId:](self, "setObjectId:");
  }
  if (*((void *)v4 + 9)) {
    -[PDDPSurveyStepAnswer setSurveyId:](self, "setSurveyId:");
  }
  dateCreated = self->_dateCreated;
  uint64_t v6 = *((void *)v4 + 5);
  if (dateCreated)
  {
    if (v6) {
      -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PDDPSurveyStepAnswer setDateCreated:](self, "setDateCreated:");
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v8 = *((void *)v4 + 6);
  if (dateLastModified)
  {
    if (v8) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PDDPSurveyStepAnswer setDateLastModified:](self, "setDateLastModified:");
  }
  if (*((void *)v4 + 4)) {
    -[PDDPSurveyStepAnswer setCreatedBy:](self, "setCreatedBy:");
  }
  if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
    self->_uint64_t answerType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 10)) {
    -[PDDPSurveyStepAnswer setSurveyStepId:](self, "setSurveyStepId:");
  }
  if ((*((unsigned char *)v4 + 96) & 4) != 0)
  {
    self->_multipleChoiceSelectedIndexValue = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 11)) {
    -[PDDPSurveyStepAnswer setTextAnswerValue:](self, "setTextAnswerValue:");
  }
  if (*((unsigned char *)v4 + 96))
  {
    self->_double continuousSliderAnswerValue = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *((id *)v4 + 3);
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[PDDPSurveyStepAnswer addClassIds:](self, "addClassIds:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (NSString)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
{
}

- (NSString)surveyId
{
  return self->_surveyId;
}

- (void)setSurveyId:(id)a3
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

- (NSString)createdBy
{
  return self->_createdBy;
}

- (void)setCreatedBy:(id)a3
{
}

- (NSString)surveyStepId
{
  return self->_surveyStepId;
}

- (void)setSurveyStepId:(id)a3
{
}

- (int)multipleChoiceSelectedIndexValue
{
  return self->_multipleChoiceSelectedIndexValue;
}

- (NSString)textAnswerValue
{
  return self->_textAnswerValue;
}

- (void)setTextAnswerValue:(id)a3
{
}

- (double)continuousSliderAnswerValue
{
  return self->_continuousSliderAnswerValue;
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
  objc_storeStrong((id *)&self->_textAnswerValue, 0);
  objc_storeStrong((id *)&self->_surveyStepId, 0);
  objc_storeStrong((id *)&self->_surveyId, 0);
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_createdBy, 0);

  objc_storeStrong((id *)&self->_classIds, 0);
}

@end