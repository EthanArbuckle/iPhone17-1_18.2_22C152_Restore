@interface PDDPSurveyStep
+ (Class)classIdsType;
+ (Class)optionItemsType;
- (BOOL)hasAnswerFormatObjectId;
- (BOOL)hasAnswerFormatType;
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasDisplayOrder;
- (BOOL)hasMultipleChoiceType;
- (BOOL)hasObjectId;
- (BOOL)hasOpenResponseAllowMedia;
- (BOOL)hasOpenResponseMaximumTextLength;
- (BOOL)hasOpenResponseMinimumTextLength;
- (BOOL)hasOpenResponseTeacherProvidedText;
- (BOOL)hasOpenResponseType;
- (BOOL)hasParentObjectId;
- (BOOL)hasQuestionText;
- (BOOL)hasSliderMaximum;
- (BOOL)hasSliderMaximumLabel;
- (BOOL)hasSliderMiddleLabel;
- (BOOL)hasSliderMinimum;
- (BOOL)hasSliderMinimumLabel;
- (BOOL)hasSliderType;
- (BOOL)hasSurveyStepType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)openResponseAllowMedia;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)classIds;
- (NSMutableArray)optionItems;
- (NSString)answerFormatObjectId;
- (NSString)objectId;
- (NSString)openResponseTeacherProvidedText;
- (NSString)parentObjectId;
- (NSString)questionText;
- (NSString)sliderMaximumLabel;
- (NSString)sliderMiddleLabel;
- (NSString)sliderMinimumLabel;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (double)sliderMaximum;
- (double)sliderMinimum;
- (id)answerFormatTypeAsString:(int)a3;
- (id)classIdsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)multipleChoiceTypeAsString:(int)a3;
- (id)openResponseTypeAsString:(int)a3;
- (id)optionItemsAtIndex:(unint64_t)a3;
- (id)sliderTypeAsString:(int)a3;
- (id)surveyStepTypeAsString:(int)a3;
- (int)StringAsAnswerFormatType:(id)a3;
- (int)StringAsMultipleChoiceType:(id)a3;
- (int)StringAsOpenResponseType:(id)a3;
- (int)StringAsSliderType:(id)a3;
- (int)StringAsSurveyStepType:(id)a3;
- (int)answerFormatType;
- (int)displayOrder;
- (int)multipleChoiceType;
- (int)openResponseMaximumTextLength;
- (int)openResponseMinimumTextLength;
- (int)openResponseType;
- (int)sliderType;
- (int)surveyStepType;
- (int)version;
- (unint64_t)classIdsCount;
- (unint64_t)hash;
- (unint64_t)optionItemsCount;
- (void)addClassIds:(id)a3;
- (void)addOptionItems:(id)a3;
- (void)clearClassIds;
- (void)clearOptionItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnswerFormatObjectId:(id)a3;
- (void)setAnswerFormatType:(int)a3;
- (void)setClassIds:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setDisplayOrder:(int)a3;
- (void)setHasAnswerFormatType:(BOOL)a3;
- (void)setHasDisplayOrder:(BOOL)a3;
- (void)setHasMultipleChoiceType:(BOOL)a3;
- (void)setHasOpenResponseAllowMedia:(BOOL)a3;
- (void)setHasOpenResponseMaximumTextLength:(BOOL)a3;
- (void)setHasOpenResponseMinimumTextLength:(BOOL)a3;
- (void)setHasOpenResponseType:(BOOL)a3;
- (void)setHasSliderMaximum:(BOOL)a3;
- (void)setHasSliderMinimum:(BOOL)a3;
- (void)setHasSliderType:(BOOL)a3;
- (void)setHasSurveyStepType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setMultipleChoiceType:(int)a3;
- (void)setObjectId:(id)a3;
- (void)setOpenResponseAllowMedia:(BOOL)a3;
- (void)setOpenResponseMaximumTextLength:(int)a3;
- (void)setOpenResponseMinimumTextLength:(int)a3;
- (void)setOpenResponseTeacherProvidedText:(id)a3;
- (void)setOpenResponseType:(int)a3;
- (void)setOptionItems:(id)a3;
- (void)setParentObjectId:(id)a3;
- (void)setQuestionText:(id)a3;
- (void)setSliderMaximum:(double)a3;
- (void)setSliderMaximumLabel:(id)a3;
- (void)setSliderMiddleLabel:(id)a3;
- (void)setSliderMinimum:(double)a3;
- (void)setSliderMinimumLabel:(id)a3;
- (void)setSliderType:(int)a3;
- (void)setSurveyStepType:(int)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPSurveyStep

- (BOOL)hasObjectId
{
  return self->_objectId != 0;
}

- (BOOL)hasParentObjectId
{
  return self->_parentObjectId != 0;
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (void)setVersion:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasVersion
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (int)surveyStepType
{
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    return self->_surveyStepType;
  }
  else {
    return 0;
  }
}

- (void)setSurveyStepType:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_surveyStepType = a3;
}

- (void)setHasSurveyStepType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSurveyStepType
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)surveyStepTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"QUESTION_STEP_TYPE";
    }
    else
    {
      v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    v4 = @"UNKNOWN_STEP_TYPE";
  }
  return v4;
}

- (int)StringAsSurveyStepType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_STEP_TYPE"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"QUESTION_STEP_TYPE"];
  }

  return v4;
}

- (BOOL)hasQuestionText
{
  return self->_questionText != 0;
}

- (void)setDisplayOrder:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_displayOrder = a3;
}

- (void)setHasDisplayOrder:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDisplayOrder
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasAnswerFormatObjectId
{
  return self->_answerFormatObjectId != 0;
}

- (int)answerFormatType
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_answerFormatType;
  }
  else {
    return 0;
  }
}

- (void)setAnswerFormatType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_answerFormatType = a3;
}

- (void)setHasAnswerFormatType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAnswerFormatType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)answerFormatTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_1001F6480 + a3);
  }

  return v3;
}

- (int)StringAsAnswerFormatType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_FORMAT_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MULTIPLE_CHOICE_FORMAT_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SLIDER_FORMAT_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"OPEN_FORMAT_TYPE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)multipleChoiceType
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_multipleChoiceType;
  }
  else {
    return 0;
  }
}

- (void)setMultipleChoiceType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_multipleChoiceType = a3;
}

- (void)setHasMultipleChoiceType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMultipleChoiceType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)multipleChoiceTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_1001F64A0 + a3);
  }

  return v3;
}

- (int)StringAsMultipleChoiceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CUSTOM_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SMILEY_FACE_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"STAR_RATING_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"THUMB_UP_DOWN_TYPE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearOptionItems
{
}

- (void)addOptionItems:(id)a3
{
  id v4 = a3;
  optionItems = self->_optionItems;
  id v8 = v4;
  if (!optionItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_optionItems;
    self->_optionItems = v6;

    id v4 = v8;
    optionItems = self->_optionItems;
  }
  [(NSMutableArray *)optionItems addObject:v4];
}

- (unint64_t)optionItemsCount
{
  return (unint64_t)[(NSMutableArray *)self->_optionItems count];
}

- (id)optionItemsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_optionItems objectAtIndex:a3];
}

+ (Class)optionItemsType
{
  return (Class)objc_opt_class();
}

- (int)sliderType
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_sliderType;
  }
  else {
    return 0;
  }
}

- (void)setSliderType:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_sliderType = a3;
}

- (void)setHasSliderType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSliderType
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)sliderTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"CONTINUOUS_SLIDER_TYPE";
    }
    else
    {
      id v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    id v4 = @"UNKNOWN_SLIDER_TYPE";
  }
  return v4;
}

- (int)StringAsSliderType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_SLIDER_TYPE"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"CONTINUOUS_SLIDER_TYPE"];
  }

  return v4;
}

- (void)setSliderMinimum:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_sliderMinimum = a3;
}

- (void)setHasSliderMinimum:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasSliderMinimum
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSliderMaximum:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_sliderMaximum = a3;
}

- (void)setHasSliderMaximum:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasSliderMaximum
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasSliderMinimumLabel
{
  return self->_sliderMinimumLabel != 0;
}

- (BOOL)hasSliderMaximumLabel
{
  return self->_sliderMaximumLabel != 0;
}

- (BOOL)hasSliderMiddleLabel
{
  return self->_sliderMiddleLabel != 0;
}

- (int)openResponseType
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_openResponseType;
  }
  else {
    return 0;
  }
}

- (void)setOpenResponseType:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_openResponseType = a3;
}

- (void)setHasOpenResponseType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasOpenResponseType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)openResponseTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_1001F64C8 + a3);
  }

  return v3;
}

- (int)StringAsOpenResponseType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_OPEN_RESPONSE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"OPEN_RESPONSE_SHORT_FORM"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"OPEN_RESPONSE_LONG_FORM"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasOpenResponseTeacherProvidedText
{
  return self->_openResponseTeacherProvidedText != 0;
}

- (void)setOpenResponseAllowMedia:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_openResponseAllowMedia = a3;
}

- (void)setHasOpenResponseAllowMedia:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasOpenResponseAllowMedia
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setOpenResponseMinimumTextLength:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_openResponseMinimumTextLength = a3;
}

- (void)setHasOpenResponseMinimumTextLength:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasOpenResponseMinimumTextLength
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setOpenResponseMaximumTextLength:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_openResponseMaximumTextLength = a3;
}

- (void)setHasOpenResponseMaximumTextLength:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasOpenResponseMaximumTextLength
{
  return (*(_WORD *)&self->_has >> 5) & 1;
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
  v7.super_class = (Class)PDDPSurveyStep;
  __int16 v3 = [(PDDPSurveyStep *)&v7 description];
  id v4 = [(PDDPSurveyStep *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  objectId = self->_objectId;
  if (objectId) {
    [v3 setObject:objectId forKey:@"object_id"];
  }
  parentObjectId = self->_parentObjectId;
  if (parentObjectId) {
    [v4 setObject:parentObjectId forKey:@"parent_object_id"];
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
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v12 = +[NSNumber numberWithInt:self->_version];
    [v4 setObject:v12 forKey:@"version"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0)
  {
    int surveyStepType = self->_surveyStepType;
    if (surveyStepType)
    {
      if (surveyStepType == 1)
      {
        v14 = @"QUESTION_STEP_TYPE";
      }
      else
      {
        v14 = +[NSString stringWithFormat:@"(unknown: %i)", self->_surveyStepType];
      }
    }
    else
    {
      v14 = @"UNKNOWN_STEP_TYPE";
    }
    [v4 setObject:v14 forKey:@"survey_step_type"];
  }
  questionText = self->_questionText;
  if (questionText) {
    [v4 setObject:questionText forKey:@"question_text"];
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v16 = +[NSNumber numberWithInt:self->_displayOrder];
    [v4 setObject:v16 forKey:@"display_order"];
  }
  answerFormatObjectId = self->_answerFormatObjectId;
  if (answerFormatObjectId) {
    [v4 setObject:answerFormatObjectId forKey:@"answer_format_object_id"];
  }
  __int16 v18 = (__int16)self->_has;
  if ((v18 & 4) != 0)
  {
    uint64_t answerFormatType = self->_answerFormatType;
    if (answerFormatType >= 4)
    {
      v20 = +[NSString stringWithFormat:@"(unknown: %i)", self->_answerFormatType];
    }
    else
    {
      v20 = *(&off_1001F6480 + answerFormatType);
    }
    [v4 setObject:v20 forKey:@"answer_format_type"];

    __int16 v18 = (__int16)self->_has;
  }
  if ((v18 & 0x10) != 0)
  {
    uint64_t multipleChoiceType = self->_multipleChoiceType;
    if (multipleChoiceType >= 5)
    {
      v22 = +[NSString stringWithFormat:@"(unknown: %i)", self->_multipleChoiceType];
    }
    else
    {
      v22 = *(&off_1001F64A0 + multipleChoiceType);
    }
    [v4 setObject:v22 forKey:@"multiple_choice_type"];
  }
  if ([(NSMutableArray *)self->_optionItems count])
  {
    id v23 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_optionItems, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v24 = self->_optionItems;
    id v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v48;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v48 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [*(id *)(*((void *)&v47 + 1) + 8 * i) dictionaryRepresentation];
          [v23 addObject:v29];
        }
        id v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v26);
    }

    [v4 setObject:v23 forKey:@"option_items"];
  }
  __int16 v30 = (__int16)self->_has;
  if ((v30 & 0x100) != 0)
  {
    int sliderType = self->_sliderType;
    if (sliderType)
    {
      if (sliderType == 1)
      {
        v38 = @"CONTINUOUS_SLIDER_TYPE";
      }
      else
      {
        v38 = +[NSString stringWithFormat:@"(unknown: %i)", self->_sliderType];
      }
    }
    else
    {
      v38 = @"UNKNOWN_SLIDER_TYPE";
    }
    [v4 setObject:v38 forKey:@"slider_type"];

    __int16 v30 = (__int16)self->_has;
    if ((v30 & 2) == 0)
    {
LABEL_45:
      if ((v30 & 1) == 0) {
        goto LABEL_47;
      }
      goto LABEL_46;
    }
  }
  else if ((v30 & 2) == 0)
  {
    goto LABEL_45;
  }
  v46 = +[NSNumber numberWithDouble:self->_sliderMinimum];
  [v4 setObject:v46 forKey:@"slider_minimum"];

  if (*(_WORD *)&self->_has)
  {
LABEL_46:
    v31 = +[NSNumber numberWithDouble:self->_sliderMaximum];
    [v4 setObject:v31 forKey:@"slider_maximum"];
  }
LABEL_47:
  sliderMinimumLabel = self->_sliderMinimumLabel;
  if (sliderMinimumLabel) {
    [v4 setObject:sliderMinimumLabel forKey:@"slider_minimum_label"];
  }
  sliderMaximumLabel = self->_sliderMaximumLabel;
  if (sliderMaximumLabel) {
    [v4 setObject:sliderMaximumLabel forKey:@"slider_maximum_label"];
  }
  sliderMiddleLabel = self->_sliderMiddleLabel;
  if (sliderMiddleLabel) {
    [v4 setObject:sliderMiddleLabel forKey:@"slider_middle_label"];
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    uint64_t openResponseType = self->_openResponseType;
    if (openResponseType >= 3)
    {
      v36 = +[NSString stringWithFormat:@"(unknown: %i)", self->_openResponseType];
    }
    else
    {
      v36 = *(&off_1001F64C8 + openResponseType);
    }
    [v4 setObject:v36 forKey:@"open_response_type"];
  }
  openResponseTeacherProvidedText = self->_openResponseTeacherProvidedText;
  if (openResponseTeacherProvidedText) {
    [v4 setObject:openResponseTeacherProvidedText forKey:@"open_response_teacher_provided_text"];
  }
  __int16 v40 = (__int16)self->_has;
  if ((v40 & 0x800) != 0)
  {
    v44 = +[NSNumber numberWithBool:self->_openResponseAllowMedia];
    [v4 setObject:v44 forKey:@"open_response_allow_media"];

    __int16 v40 = (__int16)self->_has;
    if ((v40 & 0x40) == 0)
    {
LABEL_65:
      if ((v40 & 0x20) == 0) {
        goto LABEL_67;
      }
      goto LABEL_66;
    }
  }
  else if ((v40 & 0x40) == 0)
  {
    goto LABEL_65;
  }
  v45 = +[NSNumber numberWithInt:self->_openResponseMinimumTextLength];
  [v4 setObject:v45 forKey:@"open_response_minimum_text_length"];

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_66:
    v41 = +[NSNumber numberWithInt:self->_openResponseMaximumTextLength];
    [v4 setObject:v41 forKey:@"open_response_maximum_text_length"];
  }
LABEL_67:
  classIds = self->_classIds;
  if (classIds) {
    [v4 setObject:classIds forKey:@"class_ids"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10016D764((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_objectId) {
    PBDataWriterWriteStringField();
  }
  if (self->_parentObjectId) {
    PBDataWriterWriteStringField();
  }
  if (self->_dateCreated) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dateLastModified) {
    PBDataWriterWriteSubmessage();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_questionText) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_answerFormatObjectId) {
    PBDataWriterWriteStringField();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  objc_super v7 = self->_optionItems;
  id v8 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      v9 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v12 = (__int16)self->_has;
    if ((v12 & 2) == 0)
    {
LABEL_32:
      if ((v12 & 1) == 0) {
        goto LABEL_34;
      }
      goto LABEL_33;
    }
  }
  else if ((v12 & 2) == 0)
  {
    goto LABEL_32;
  }
  PBDataWriterWriteDoubleField();
  if (*(_WORD *)&self->_has) {
LABEL_33:
  }
    PBDataWriterWriteDoubleField();
LABEL_34:
  if (self->_sliderMinimumLabel) {
    PBDataWriterWriteStringField();
  }
  if (self->_sliderMaximumLabel) {
    PBDataWriterWriteStringField();
  }
  if (self->_sliderMiddleLabel) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_openResponseTeacherProvidedText) {
    PBDataWriterWriteStringField();
  }
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x800) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v13 = (__int16)self->_has;
    if ((v13 & 0x40) == 0)
    {
LABEL_46:
      if ((v13 & 0x20) == 0) {
        goto LABEL_48;
      }
      goto LABEL_47;
    }
  }
  else if ((v13 & 0x40) == 0)
  {
    goto LABEL_46;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
LABEL_47:
  }
    PBDataWriterWriteInt32Field();
LABEL_48:
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v14 = self->_classIds;
  v15 = (char *)[(NSMutableArray *)v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteStringField();
      }
      v16 = (char *)[(NSMutableArray *)v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v18 = v4;
  if (self->_objectId)
  {
    objc_msgSend(v4, "setObjectId:");
    id v4 = v18;
  }
  if (self->_parentObjectId)
  {
    objc_msgSend(v18, "setParentObjectId:");
    id v4 = v18;
  }
  if (self->_dateCreated)
  {
    objc_msgSend(v18, "setDateCreated:");
    id v4 = v18;
  }
  if (self->_dateLastModified)
  {
    objc_msgSend(v18, "setDateLastModified:");
    id v4 = v18;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((_DWORD *)v4 + 40) = self->_version;
    *((_WORD *)v4 + 84) |= 0x400u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)v4 + 39) = self->_surveyStepType;
    *((_WORD *)v4 + 84) |= 0x200u;
  }
  if (self->_questionText)
  {
    objc_msgSend(v18, "setQuestionText:");
    id v4 = v18;
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_displayOrder;
    *((_WORD *)v4 + 84) |= 8u;
  }
  if (self->_answerFormatObjectId)
  {
    objc_msgSend(v18, "setAnswerFormatObjectId:");
    id v4 = v18;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_answerFormatType;
    *((_WORD *)v4 + 84) |= 4u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 17) = self->_multipleChoiceType;
    *((_WORD *)v4 + 84) |= 0x10u;
  }
  if ([(PDDPSurveyStep *)self optionItemsCount])
  {
    [v18 clearOptionItems];
    unint64_t v7 = [(PDDPSurveyStep *)self optionItemsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(PDDPSurveyStep *)self optionItemsAtIndex:i];
        [v18 addOptionItems:v10];
      }
    }
  }
  __int16 v11 = (__int16)self->_has;
  __int16 v12 = v18;
  if ((v11 & 0x100) != 0)
  {
    *((_DWORD *)v18 + 38) = self->_sliderType;
    *((_WORD *)v18 + 84) |= 0x100u;
    __int16 v11 = (__int16)self->_has;
    if ((v11 & 2) == 0)
    {
LABEL_29:
      if ((v11 & 1) == 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_29;
  }
  *((void *)v18 + 2) = *(void *)&self->_sliderMinimum;
  *((_WORD *)v18 + 84) |= 2u;
  if (*(_WORD *)&self->_has)
  {
LABEL_30:
    *((void *)v18 + 1) = *(void *)&self->_sliderMaximum;
    *((_WORD *)v18 + 84) |= 1u;
  }
LABEL_31:
  if (self->_sliderMinimumLabel)
  {
    objc_msgSend(v18, "setSliderMinimumLabel:");
    __int16 v12 = v18;
  }
  if (self->_sliderMaximumLabel)
  {
    objc_msgSend(v18, "setSliderMaximumLabel:");
    __int16 v12 = v18;
  }
  if (self->_sliderMiddleLabel)
  {
    objc_msgSend(v18, "setSliderMiddleLabel:");
    __int16 v12 = v18;
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v12[24] = self->_openResponseType;
    *((_WORD *)v12 + 84) |= 0x80u;
  }
  if (self->_openResponseTeacherProvidedText)
  {
    objc_msgSend(v18, "setOpenResponseTeacherProvidedText:");
    __int16 v12 = v18;
  }
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x800) == 0)
  {
    if ((v13 & 0x40) == 0) {
      goto LABEL_43;
    }
LABEL_56:
    v12[21] = self->_openResponseMinimumTextLength;
    *((_WORD *)v12 + 84) |= 0x40u;
    if ((*(_WORD *)&self->_has & 0x20) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  *((unsigned char *)v12 + 164) = self->_openResponseAllowMedia;
  *((_WORD *)v12 + 84) |= 0x800u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x40) != 0) {
    goto LABEL_56;
  }
LABEL_43:
  if ((v13 & 0x20) != 0)
  {
LABEL_44:
    v12[20] = self->_openResponseMaximumTextLength;
    *((_WORD *)v12 + 84) |= 0x20u;
  }
LABEL_45:
  if ([(PDDPSurveyStep *)self classIdsCount])
  {
    [v18 clearClassIds];
    unint64_t v14 = [(PDDPSurveyStep *)self classIdsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t j = 0; j != v15; ++j)
      {
        uint64_t v17 = [(PDDPSurveyStep *)self classIdsAtIndex:j];
        [v18 addClassIds:v17];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_objectId copyWithZone:a3];
  unint64_t v7 = (void *)v5[9];
  v5[9] = v6;

  id v8 = [(NSString *)self->_parentObjectId copyWithZone:a3];
  v9 = (void *)v5[14];
  v5[14] = v8;

  id v10 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  __int16 v11 = (void *)v5[6];
  v5[6] = v10;

  id v12 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  __int16 v13 = (void *)v5[7];
  v5[7] = v12;

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((_DWORD *)v5 + 40) = self->_version;
    *((_WORD *)v5 + 84) |= 0x400u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)v5 + 39) = self->_surveyStepType;
    *((_WORD *)v5 + 84) |= 0x200u;
  }
  id v15 = [(NSString *)self->_questionText copyWithZone:a3];
  v16 = (void *)v5[15];
  v5[15] = v15;

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v5 + 16) = self->_displayOrder;
    *((_WORD *)v5 + 84) |= 8u;
  }
  id v17 = [(NSString *)self->_answerFormatObjectId copyWithZone:a3];
  id v18 = (void *)v5[3];
  v5[3] = v17;

  __int16 v19 = (__int16)self->_has;
  if ((v19 & 4) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_answerFormatType;
    *((_WORD *)v5 + 84) |= 4u;
    __int16 v19 = (__int16)self->_has;
  }
  if ((v19 & 0x10) != 0)
  {
    *((_DWORD *)v5 + 17) = self->_multipleChoiceType;
    *((_WORD *)v5 + 84) |= 0x10u;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v20 = self->_optionItems;
  id v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v22; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v48 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = [*(id *)(*((void *)&v47 + 1) + 8 * i) copyWithZone:a3];
        [v5 addOptionItems:v25];
      }
      id v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v22);
  }

  __int16 v26 = (__int16)self->_has;
  if ((v26 & 0x100) != 0)
  {
    *((_DWORD *)v5 + 38) = self->_sliderType;
    *((_WORD *)v5 + 84) |= 0x100u;
    __int16 v26 = (__int16)self->_has;
    if ((v26 & 2) == 0)
    {
LABEL_20:
      if ((v26 & 1) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if ((v26 & 2) == 0)
  {
    goto LABEL_20;
  }
  v5[2] = *(void *)&self->_sliderMinimum;
  *((_WORD *)v5 + 84) |= 2u;
  if (*(_WORD *)&self->_has)
  {
LABEL_21:
    v5[1] = *(void *)&self->_sliderMaximum;
    *((_WORD *)v5 + 84) |= 1u;
  }
LABEL_22:
  id v27 = [(NSString *)self->_sliderMinimumLabel copyWithZone:a3];
  v28 = (void *)v5[18];
  v5[18] = v27;

  id v29 = [(NSString *)self->_sliderMaximumLabel copyWithZone:a3];
  __int16 v30 = (void *)v5[16];
  v5[16] = v29;

  id v31 = [(NSString *)self->_sliderMiddleLabel copyWithZone:a3];
  v32 = (void *)v5[17];
  v5[17] = v31;

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *((_DWORD *)v5 + 24) = self->_openResponseType;
    *((_WORD *)v5 + 84) |= 0x80u;
  }
  id v33 = [(NSString *)self->_openResponseTeacherProvidedText copyWithZone:a3];
  v34 = (void *)v5[11];
  v5[11] = v33;

  __int16 v35 = (__int16)self->_has;
  if ((v35 & 0x800) != 0)
  {
    *((unsigned char *)v5 + 164) = self->_openResponseAllowMedia;
    *((_WORD *)v5 + 84) |= 0x800u;
    __int16 v35 = (__int16)self->_has;
    if ((v35 & 0x40) == 0)
    {
LABEL_26:
      if ((v35 & 0x20) == 0) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
  }
  else if ((v35 & 0x40) == 0)
  {
    goto LABEL_26;
  }
  *((_DWORD *)v5 + 21) = self->_openResponseMinimumTextLength;
  *((_WORD *)v5 + 84) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_27:
    *((_DWORD *)v5 + 20) = self->_openResponseMaximumTextLength;
    *((_WORD *)v5 + 84) |= 0x20u;
  }
LABEL_28:
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v36 = self->_classIds;
  id v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v38; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v44 != v39) {
          objc_enumerationMutation(v36);
        }
        id v41 = objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * (void)j), "copyWithZone:", a3, (void)v43);
        [v5 addClassIds:v41];
      }
      id v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v38);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_93;
  }
  objectId = self->_objectId;
  if ((unint64_t)objectId | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](objectId, "isEqual:")) {
      goto LABEL_93;
    }
  }
  parentObjectId = self->_parentObjectId;
  if ((unint64_t)parentObjectId | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](parentObjectId, "isEqual:")) {
      goto LABEL_93;
    }
  }
  dateCreated = self->_dateCreated;
  if ((unint64_t)dateCreated | *((void *)v4 + 6))
  {
    if (!-[PDDPDate isEqual:](dateCreated, "isEqual:")) {
      goto LABEL_93;
    }
  }
  dateLastModified = self->_dateLastModified;
  if ((unint64_t)dateLastModified | *((void *)v4 + 7))
  {
    if (!-[PDDPDate isEqual:](dateLastModified, "isEqual:")) {
      goto LABEL_93;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v10 = *((_WORD *)v4 + 84);
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 84) & 0x400) == 0 || self->_version != *((_DWORD *)v4 + 40)) {
      goto LABEL_93;
    }
  }
  else if ((*((_WORD *)v4 + 84) & 0x400) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 84) & 0x200) == 0 || self->_surveyStepType != *((_DWORD *)v4 + 39)) {
      goto LABEL_93;
    }
  }
  else if ((*((_WORD *)v4 + 84) & 0x200) != 0)
  {
    goto LABEL_93;
  }
  questionText = self->_questionText;
  if ((unint64_t)questionText | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](questionText, "isEqual:")) {
      goto LABEL_93;
    }
    __int16 has = (__int16)self->_has;
    __int16 v10 = *((_WORD *)v4 + 84);
  }
  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_displayOrder != *((_DWORD *)v4 + 16)) {
      goto LABEL_93;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_93;
  }
  answerFormatObjectId = self->_answerFormatObjectId;
  if ((unint64_t)answerFormatObjectId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](answerFormatObjectId, "isEqual:")) {
      goto LABEL_93;
    }
    __int16 has = (__int16)self->_has;
    __int16 v10 = *((_WORD *)v4 + 84);
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_answerFormatType != *((_DWORD *)v4 + 8)) {
      goto LABEL_93;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_93;
  }
  if ((has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_multipleChoiceType != *((_DWORD *)v4 + 17)) {
      goto LABEL_93;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_93;
  }
  optionItems = self->_optionItems;
  if ((unint64_t)optionItems | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](optionItems, "isEqual:")) {
      goto LABEL_93;
    }
    __int16 has = (__int16)self->_has;
    __int16 v10 = *((_WORD *)v4 + 84);
  }
  if ((has & 0x100) != 0)
  {
    if ((v10 & 0x100) == 0 || self->_sliderType != *((_DWORD *)v4 + 38)) {
      goto LABEL_93;
    }
  }
  else if ((v10 & 0x100) != 0)
  {
    goto LABEL_93;
  }
  if ((has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_sliderMinimum != *((double *)v4 + 2)) {
      goto LABEL_93;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_93;
  }
  if (has)
  {
    if ((v10 & 1) == 0 || self->_sliderMaximum != *((double *)v4 + 1)) {
      goto LABEL_93;
    }
  }
  else if (v10)
  {
    goto LABEL_93;
  }
  sliderMinimumLabel = self->_sliderMinimumLabel;
  if ((unint64_t)sliderMinimumLabel | *((void *)v4 + 18)
    && !-[NSString isEqual:](sliderMinimumLabel, "isEqual:"))
  {
    goto LABEL_93;
  }
  sliderMaximumLabel = self->_sliderMaximumLabel;
  if ((unint64_t)sliderMaximumLabel | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](sliderMaximumLabel, "isEqual:")) {
      goto LABEL_93;
    }
  }
  sliderMiddleLabel = self->_sliderMiddleLabel;
  if ((unint64_t)sliderMiddleLabel | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](sliderMiddleLabel, "isEqual:")) {
      goto LABEL_93;
    }
  }
  __int16 v17 = (__int16)self->_has;
  __int16 v18 = *((_WORD *)v4 + 84);
  if ((v17 & 0x80) != 0)
  {
    if ((v18 & 0x80) == 0 || self->_openResponseType != *((_DWORD *)v4 + 24)) {
      goto LABEL_93;
    }
  }
  else if ((v18 & 0x80) != 0)
  {
    goto LABEL_93;
  }
  openResponseTeacherProvidedText = self->_openResponseTeacherProvidedText;
  if ((unint64_t)openResponseTeacherProvidedText | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](openResponseTeacherProvidedText, "isEqual:")) {
      goto LABEL_93;
    }
    __int16 v17 = (__int16)self->_has;
    __int16 v18 = *((_WORD *)v4 + 84);
  }
  if ((v17 & 0x800) != 0)
  {
    if ((v18 & 0x800) != 0)
    {
      if (self->_openResponseAllowMedia)
      {
        if (!*((unsigned char *)v4 + 164)) {
          goto LABEL_93;
        }
        goto LABEL_81;
      }
      if (!*((unsigned char *)v4 + 164)) {
        goto LABEL_81;
      }
    }
LABEL_93:
    unsigned __int8 v21 = 0;
    goto LABEL_94;
  }
  if ((v18 & 0x800) != 0) {
    goto LABEL_93;
  }
LABEL_81:
  if ((v17 & 0x40) != 0)
  {
    if ((v18 & 0x40) == 0 || self->_openResponseMinimumTextLength != *((_DWORD *)v4 + 21)) {
      goto LABEL_93;
    }
  }
  else if ((v18 & 0x40) != 0)
  {
    goto LABEL_93;
  }
  if ((v17 & 0x20) != 0)
  {
    if ((v18 & 0x20) == 0 || self->_openResponseMaximumTextLength != *((_DWORD *)v4 + 20)) {
      goto LABEL_93;
    }
  }
  else if ((v18 & 0x20) != 0)
  {
    goto LABEL_93;
  }
  classIds = self->_classIds;
  if ((unint64_t)classIds | *((void *)v4 + 5)) {
    unsigned __int8 v21 = -[NSMutableArray isEqual:](classIds, "isEqual:");
  }
  else {
    unsigned __int8 v21 = 1;
  }
LABEL_94:

  return v21;
}

- (unint64_t)hash
{
  NSUInteger v38 = [(NSString *)self->_objectId hash];
  NSUInteger v37 = [(NSString *)self->_parentObjectId hash];
  unint64_t v36 = [(PDDPDate *)self->_dateCreated hash];
  unint64_t v35 = [(PDDPDate *)self->_dateLastModified hash];
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    uint64_t v34 = 2654435761 * self->_version;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v34 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_3:
      uint64_t v33 = 2654435761 * self->_surveyStepType;
      goto LABEL_6;
    }
  }
  uint64_t v33 = 0;
LABEL_6:
  NSUInteger v32 = [(NSString *)self->_questionText hash];
  if ((*(_WORD *)&self->_has & 8) != 0) {
    uint64_t v31 = 2654435761 * self->_displayOrder;
  }
  else {
    uint64_t v31 = 0;
  }
  NSUInteger v30 = [(NSString *)self->_answerFormatObjectId hash];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v29 = 2654435761 * self->_answerFormatType;
    if ((has & 0x10) != 0) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v29 = 0;
    if ((has & 0x10) != 0)
    {
LABEL_11:
      uint64_t v28 = 2654435761 * self->_multipleChoiceType;
      goto LABEL_14;
    }
  }
  uint64_t v28 = 0;
LABEL_14:
  id v26 = [(NSMutableArray *)self->_optionItems hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 0x100) != 0)
  {
    uint64_t v5 = 2654435761 * self->_sliderType;
    if ((v4 & 2) != 0) {
      goto LABEL_16;
    }
LABEL_21:
    unint64_t v10 = 0;
    goto LABEL_24;
  }
  uint64_t v5 = 0;
  if ((v4 & 2) == 0) {
    goto LABEL_21;
  }
LABEL_16:
  double sliderMinimum = self->_sliderMinimum;
  double v7 = -sliderMinimum;
  if (sliderMinimum >= 0.0) {
    double v7 = self->_sliderMinimum;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_24:
  if (v4)
  {
    double sliderMaximum = self->_sliderMaximum;
    double v13 = -sliderMaximum;
    if (sliderMaximum >= 0.0) {
      double v13 = self->_sliderMaximum;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  NSUInteger v16 = [(NSString *)self->_sliderMinimumLabel hash];
  NSUInteger v17 = [(NSString *)self->_sliderMaximumLabel hash];
  NSUInteger v18 = [(NSString *)self->_sliderMiddleLabel hash];
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    uint64_t v19 = 2654435761 * self->_openResponseType;
  }
  else {
    uint64_t v19 = 0;
  }
  NSUInteger v20 = [(NSString *)self->_openResponseTeacherProvidedText hash];
  __int16 v21 = (__int16)self->_has;
  if ((v21 & 0x800) == 0)
  {
    uint64_t v22 = 0;
    if ((v21 & 0x40) != 0) {
      goto LABEL_37;
    }
LABEL_40:
    uint64_t v23 = 0;
    if ((v21 & 0x20) != 0) {
      goto LABEL_38;
    }
LABEL_41:
    uint64_t v24 = 0;
    return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v5 ^ v10 ^ v11 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v22 ^ v23 ^ v24 ^ (unint64_t)[(NSMutableArray *)self->_classIds hash];
  }
  uint64_t v22 = 2654435761 * self->_openResponseAllowMedia;
  if ((v21 & 0x40) == 0) {
    goto LABEL_40;
  }
LABEL_37:
  uint64_t v23 = 2654435761 * self->_openResponseMinimumTextLength;
  if ((v21 & 0x20) == 0) {
    goto LABEL_41;
  }
LABEL_38:
  uint64_t v24 = 2654435761 * self->_openResponseMaximumTextLength;
  return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v5 ^ v10 ^ v11 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v22 ^ v23 ^ v24 ^ (unint64_t)[(NSMutableArray *)self->_classIds hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 9)) {
    -[PDDPSurveyStep setObjectId:](self, "setObjectId:");
  }
  if (*((void *)v4 + 14)) {
    -[PDDPSurveyStep setParentObjectId:](self, "setParentObjectId:");
  }
  dateCreated = self->_dateCreated;
  uint64_t v6 = *((void *)v4 + 6);
  if (dateCreated)
  {
    if (v6) {
      -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PDDPSurveyStep setDateCreated:](self, "setDateCreated:");
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v8 = *((void *)v4 + 7);
  if (dateLastModified)
  {
    if (v8) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PDDPSurveyStep setDateLastModified:](self, "setDateLastModified:");
  }
  __int16 v9 = *((_WORD *)v4 + 84);
  if ((v9 & 0x400) != 0)
  {
    self->_version = *((_DWORD *)v4 + 40);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v9 = *((_WORD *)v4 + 84);
  }
  if ((v9 & 0x200) != 0)
  {
    self->_int surveyStepType = *((_DWORD *)v4 + 39);
    *(_WORD *)&self->_has |= 0x200u;
  }
  if (*((void *)v4 + 15)) {
    -[PDDPSurveyStep setQuestionText:](self, "setQuestionText:");
  }
  if ((*((_WORD *)v4 + 84) & 8) != 0)
  {
    self->_displayOrder = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 3)) {
    -[PDDPSurveyStep setAnswerFormatObjectId:](self, "setAnswerFormatObjectId:");
  }
  __int16 v10 = *((_WORD *)v4 + 84);
  if ((v10 & 4) != 0)
  {
    self->_uint64_t answerFormatType = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 4u;
    __int16 v10 = *((_WORD *)v4 + 84);
  }
  if ((v10 & 0x10) != 0)
  {
    self->_uint64_t multipleChoiceType = *((_DWORD *)v4 + 17);
    *(_WORD *)&self->_has |= 0x10u;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = *((id *)v4 + 13);
  id v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        [(PDDPSurveyStep *)self addOptionItems:*(void *)(*((void *)&v27 + 1) + 8 * i)];
      }
      id v13 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v13);
  }

  __int16 v16 = *((_WORD *)v4 + 84);
  if ((v16 & 0x100) != 0)
  {
    self->_int sliderType = *((_DWORD *)v4 + 38);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v16 = *((_WORD *)v4 + 84);
    if ((v16 & 2) == 0)
    {
LABEL_38:
      if ((v16 & 1) == 0) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
  }
  else if ((v16 & 2) == 0)
  {
    goto LABEL_38;
  }
  self->_double sliderMinimum = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  if (*((_WORD *)v4 + 84))
  {
LABEL_39:
    self->_double sliderMaximum = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_40:
  if (*((void *)v4 + 18)) {
    -[PDDPSurveyStep setSliderMinimumLabel:](self, "setSliderMinimumLabel:");
  }
  if (*((void *)v4 + 16)) {
    -[PDDPSurveyStep setSliderMaximumLabel:](self, "setSliderMaximumLabel:");
  }
  if (*((void *)v4 + 17)) {
    -[PDDPSurveyStep setSliderMiddleLabel:](self, "setSliderMiddleLabel:");
  }
  if ((*((_WORD *)v4 + 84) & 0x80) != 0)
  {
    self->_uint64_t openResponseType = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_has |= 0x80u;
  }
  if (*((void *)v4 + 11)) {
    -[PDDPSurveyStep setOpenResponseTeacherProvidedText:](self, "setOpenResponseTeacherProvidedText:");
  }
  __int16 v17 = *((_WORD *)v4 + 84);
  if ((v17 & 0x800) != 0)
  {
    self->_openResponseAllowMedia = *((unsigned char *)v4 + 164);
    *(_WORD *)&self->_has |= 0x800u;
    __int16 v17 = *((_WORD *)v4 + 84);
    if ((v17 & 0x40) == 0)
    {
LABEL_52:
      if ((v17 & 0x20) == 0) {
        goto LABEL_54;
      }
      goto LABEL_53;
    }
  }
  else if ((v17 & 0x40) == 0)
  {
    goto LABEL_52;
  }
  self->_openResponseMinimumTextLength = *((_DWORD *)v4 + 21);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 84) & 0x20) != 0)
  {
LABEL_53:
    self->_openResponseMaximumTextLength = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_54:
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v18 = *((id *)v4 + 5);
  id v19 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v20; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        -[PDDPSurveyStep addClassIds:](self, "addClassIds:", *(void *)(*((void *)&v23 + 1) + 8 * (void)j), (void)v23);
      }
      id v20 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
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

- (NSString)parentObjectId
{
  return self->_parentObjectId;
}

- (void)setParentObjectId:(id)a3
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

- (int)version
{
  return self->_version;
}

- (NSString)questionText
{
  return self->_questionText;
}

- (void)setQuestionText:(id)a3
{
}

- (int)displayOrder
{
  return self->_displayOrder;
}

- (NSString)answerFormatObjectId
{
  return self->_answerFormatObjectId;
}

- (void)setAnswerFormatObjectId:(id)a3
{
}

- (NSMutableArray)optionItems
{
  return self->_optionItems;
}

- (void)setOptionItems:(id)a3
{
}

- (double)sliderMinimum
{
  return self->_sliderMinimum;
}

- (double)sliderMaximum
{
  return self->_sliderMaximum;
}

- (NSString)sliderMinimumLabel
{
  return self->_sliderMinimumLabel;
}

- (void)setSliderMinimumLabel:(id)a3
{
}

- (NSString)sliderMaximumLabel
{
  return self->_sliderMaximumLabel;
}

- (void)setSliderMaximumLabel:(id)a3
{
}

- (NSString)sliderMiddleLabel
{
  return self->_sliderMiddleLabel;
}

- (void)setSliderMiddleLabel:(id)a3
{
}

- (NSString)openResponseTeacherProvidedText
{
  return self->_openResponseTeacherProvidedText;
}

- (void)setOpenResponseTeacherProvidedText:(id)a3
{
}

- (BOOL)openResponseAllowMedia
{
  return self->_openResponseAllowMedia;
}

- (int)openResponseMinimumTextLength
{
  return self->_openResponseMinimumTextLength;
}

- (int)openResponseMaximumTextLength
{
  return self->_openResponseMaximumTextLength;
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
  objc_storeStrong((id *)&self->_sliderMinimumLabel, 0);
  objc_storeStrong((id *)&self->_sliderMiddleLabel, 0);
  objc_storeStrong((id *)&self->_sliderMaximumLabel, 0);
  objc_storeStrong((id *)&self->_questionText, 0);
  objc_storeStrong((id *)&self->_parentObjectId, 0);
  objc_storeStrong((id *)&self->_optionItems, 0);
  objc_storeStrong((id *)&self->_openResponseTeacherProvidedText, 0);
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_classIds, 0);

  objc_storeStrong((id *)&self->_answerFormatObjectId, 0);
}

@end