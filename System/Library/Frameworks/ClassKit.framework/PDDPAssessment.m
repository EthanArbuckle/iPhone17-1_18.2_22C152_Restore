@interface PDDPAssessment
+ (Class)instructionAssetsType;
- (BOOL)allowLateSubmissions;
- (BOOL)hasAggregateDataAsset;
- (BOOL)hasAllowLateSubmissions;
- (BOOL)hasAssessmentMode;
- (BOOL)hasBaseAsset;
- (BOOL)hasBaseMarkupAsset;
- (BOOL)hasCreatedByFamilyName;
- (BOOL)hasCreatedByGivenName;
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasEtag;
- (BOOL)hasMakerUserId;
- (BOOL)hasObjectId;
- (BOOL)hasParentObjectId;
- (BOOL)hasQuestionDataAsset;
- (BOOL)hasTakerTimeLimitInSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)instructionAssets;
- (NSString)createdByFamilyName;
- (NSString)createdByGivenName;
- (NSString)etag;
- (NSString)makerUserId;
- (NSString)objectId;
- (NSString)parentObjectId;
- (PDDPAsset)aggregateDataAsset;
- (PDDPAsset)baseAsset;
- (PDDPAsset)baseMarkupAsset;
- (PDDPAsset)questionDataAsset;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (double)takerTimeLimitInSeconds;
- (id)assessmentModeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)instructionAssetsAtIndex:(unint64_t)a3;
- (int)StringAsAssessmentMode:(id)a3;
- (int)assessmentMode;
- (unint64_t)hash;
- (unint64_t)instructionAssetsCount;
- (void)addInstructionAssets:(id)a3;
- (void)clearInstructionAssets;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAggregateDataAsset:(id)a3;
- (void)setAllowLateSubmissions:(BOOL)a3;
- (void)setAssessmentMode:(int)a3;
- (void)setBaseAsset:(id)a3;
- (void)setBaseMarkupAsset:(id)a3;
- (void)setCreatedByFamilyName:(id)a3;
- (void)setCreatedByGivenName:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setEtag:(id)a3;
- (void)setHasAllowLateSubmissions:(BOOL)a3;
- (void)setHasAssessmentMode:(BOOL)a3;
- (void)setHasTakerTimeLimitInSeconds:(BOOL)a3;
- (void)setInstructionAssets:(id)a3;
- (void)setMakerUserId:(id)a3;
- (void)setObjectId:(id)a3;
- (void)setParentObjectId:(id)a3;
- (void)setQuestionDataAsset:(id)a3;
- (void)setTakerTimeLimitInSeconds:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPAssessment

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

- (BOOL)hasMakerUserId
{
  return self->_makerUserId != 0;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (void)setAllowLateSubmissions:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_allowLateSubmissions = a3;
}

- (void)setHasAllowLateSubmissions:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAllowLateSubmissions
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTakerTimeLimitInSeconds:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_takerTimeLimitInSeconds = a3;
}

- (void)setHasTakerTimeLimitInSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTakerTimeLimitInSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)assessmentMode
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_assessmentMode;
  }
  else {
    return 0;
  }
}

- (void)setAssessmentMode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_assessmentMode = a3;
}

- (void)setHasAssessmentMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAssessmentMode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)assessmentModeAsString:(int)a3
{
  if (a3 >= 3)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_1001F4F40[a3];
  }

  return v3;
}

- (int)StringAsAssessmentMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_MODE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"OPEN_MODE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LOCKED_TO_SCHOOLWORK_MODE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasCreatedByGivenName
{
  return self->_createdByGivenName != 0;
}

- (BOOL)hasCreatedByFamilyName
{
  return self->_createdByFamilyName != 0;
}

- (BOOL)hasBaseAsset
{
  return self->_baseAsset != 0;
}

- (BOOL)hasBaseMarkupAsset
{
  return self->_baseMarkupAsset != 0;
}

- (BOOL)hasQuestionDataAsset
{
  return self->_questionDataAsset != 0;
}

- (BOOL)hasAggregateDataAsset
{
  return self->_aggregateDataAsset != 0;
}

- (void)clearInstructionAssets
{
}

- (void)addInstructionAssets:(id)a3
{
  id v4 = a3;
  instructionAssets = self->_instructionAssets;
  id v8 = v4;
  if (!instructionAssets)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_instructionAssets;
    self->_instructionAssets = v6;

    id v4 = v8;
    instructionAssets = self->_instructionAssets;
  }
  [(NSMutableArray *)instructionAssets addObject:v4];
}

- (unint64_t)instructionAssetsCount
{
  return (unint64_t)[(NSMutableArray *)self->_instructionAssets count];
}

- (id)instructionAssetsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_instructionAssets objectAtIndex:a3];
}

+ (Class)instructionAssetsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPAssessment;
  id v3 = [(PDDPAssessment *)&v7 description];
  id v4 = [(PDDPAssessment *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
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
  makerUserId = self->_makerUserId;
  if (makerUserId) {
    [v4 setObject:makerUserId forKey:@"maker_user_id"];
  }
  etag = self->_etag;
  if (etag) {
    [v4 setObject:etag forKey:@"etag"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v14 = +[NSNumber numberWithBool:self->_allowLateSubmissions];
    [v4 setObject:v14 forKey:@"allow_late_submissions"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_15:
      if ((has & 2) == 0) {
        goto LABEL_23;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_15;
  }
  v15 = +[NSNumber numberWithDouble:self->_takerTimeLimitInSeconds];
  [v4 setObject:v15 forKey:@"taker_time_limit_in_seconds"];

  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_23;
  }
LABEL_19:
  uint64_t assessmentMode = self->_assessmentMode;
  if (assessmentMode >= 3)
  {
    v17 = +[NSString stringWithFormat:@"(unknown: %i)", self->_assessmentMode];
  }
  else
  {
    v17 = off_1001F4F40[assessmentMode];
  }
  [v4 setObject:v17 forKey:@"assessment_mode"];

LABEL_23:
  createdByGivenName = self->_createdByGivenName;
  if (createdByGivenName) {
    [v4 setObject:createdByGivenName forKey:@"created_by_given_name"];
  }
  createdByFamilyName = self->_createdByFamilyName;
  if (createdByFamilyName) {
    [v4 setObject:createdByFamilyName forKey:@"created_by_family_name"];
  }
  baseAsset = self->_baseAsset;
  if (baseAsset)
  {
    v21 = [(PDDPAsset *)baseAsset dictionaryRepresentation];
    [v4 setObject:v21 forKey:@"base_asset"];
  }
  baseMarkupAsset = self->_baseMarkupAsset;
  if (baseMarkupAsset)
  {
    v23 = [(PDDPAsset *)baseMarkupAsset dictionaryRepresentation];
    [v4 setObject:v23 forKey:@"base_markup_asset"];
  }
  questionDataAsset = self->_questionDataAsset;
  if (questionDataAsset)
  {
    v25 = [(PDDPAsset *)questionDataAsset dictionaryRepresentation];
    [v4 setObject:v25 forKey:@"question_data_asset"];
  }
  aggregateDataAsset = self->_aggregateDataAsset;
  if (aggregateDataAsset)
  {
    v27 = [(PDDPAsset *)aggregateDataAsset dictionaryRepresentation];
    [v4 setObject:v27 forKey:@"aggregate_data_asset"];
  }
  if ([(NSMutableArray *)self->_instructionAssets count])
  {
    id v28 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_instructionAssets, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v29 = self->_instructionAssets;
    id v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v37;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v37 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = [*(id *)(*((void *)&v36 + 1) + 8 * i) dictionaryRepresentation];
          [v28 addObject:v34];
        }
        id v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v31);
    }

    [v4 setObject:v28 forKey:@"instruction_assets"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000FDB8C((uint64_t)self, (uint64_t)a3);
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
  if (self->_makerUserId) {
    PBDataWriterWriteStringField();
  }
  if (self->_etag) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_15:
      if ((has & 2) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_16:
  }
    PBDataWriterWriteInt32Field();
LABEL_17:
  if (self->_createdByGivenName) {
    PBDataWriterWriteStringField();
  }
  if (self->_createdByFamilyName) {
    PBDataWriterWriteStringField();
  }
  if (self->_baseAsset) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_baseMarkupAsset) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_questionDataAsset) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_aggregateDataAsset) {
    PBDataWriterWriteSubmessage();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_instructionAssets;
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
        PBDataWriterWriteSubmessage();
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
  if (self->_parentObjectId)
  {
    objc_msgSend(v10, "setParentObjectId:");
    id v4 = v10;
  }
  if (self->_dateCreated)
  {
    objc_msgSend(v10, "setDateCreated:");
    id v4 = v10;
  }
  if (self->_dateLastModified)
  {
    objc_msgSend(v10, "setDateLastModified:");
    id v4 = v10;
  }
  if (self->_makerUserId)
  {
    objc_msgSend(v10, "setMakerUserId:");
    id v4 = v10;
  }
  if (self->_etag)
  {
    objc_msgSend(v10, "setEtag:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 128) = self->_allowLateSubmissions;
    *((unsigned char *)v4 + 132) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_15:
      if ((has & 2) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_15;
  }
  *((void *)v4 + 1) = *(void *)&self->_takerTimeLimitInSeconds;
  *((unsigned char *)v4 + 132) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_16:
    *((_DWORD *)v4 + 6) = self->_assessmentMode;
    *((unsigned char *)v4 + 132) |= 2u;
  }
LABEL_17:
  if (self->_createdByGivenName) {
    objc_msgSend(v10, "setCreatedByGivenName:");
  }
  if (self->_createdByFamilyName) {
    objc_msgSend(v10, "setCreatedByFamilyName:");
  }
  if (self->_baseAsset) {
    objc_msgSend(v10, "setBaseAsset:");
  }
  if (self->_baseMarkupAsset) {
    objc_msgSend(v10, "setBaseMarkupAsset:");
  }
  if (self->_questionDataAsset) {
    objc_msgSend(v10, "setQuestionDataAsset:");
  }
  if (self->_aggregateDataAsset) {
    objc_msgSend(v10, "setAggregateDataAsset:");
  }
  if ([(PDDPAssessment *)self instructionAssetsCount])
  {
    [v10 clearInstructionAssets];
    unint64_t v6 = [(PDDPAssessment *)self instructionAssetsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(PDDPAssessment *)self instructionAssetsAtIndex:i];
        [v10 addInstructionAssets:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_objectId copyWithZone:a3];
  unint64_t v7 = (void *)v5[13];
  v5[13] = v6;

  id v8 = [(NSString *)self->_parentObjectId copyWithZone:a3];
  uint64_t v9 = (void *)v5[14];
  v5[14] = v8;

  id v10 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  long long v11 = (void *)v5[8];
  v5[8] = v10;

  id v12 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  long long v13 = (void *)v5[9];
  v5[9] = v12;

  id v14 = [(NSString *)self->_makerUserId copyWithZone:a3];
  v15 = (void *)v5[12];
  v5[12] = v14;

  id v16 = [(NSString *)self->_etag copyWithZone:a3];
  v17 = (void *)v5[10];
  v5[10] = v16;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v5 + 128) = self->_allowLateSubmissions;
    *((unsigned char *)v5 + 132) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[1] = *(void *)&self->_takerTimeLimitInSeconds;
  *((unsigned char *)v5 + 132) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 6) = self->_assessmentMode;
    *((unsigned char *)v5 + 132) |= 2u;
  }
LABEL_5:
  id v19 = [(NSString *)self->_createdByGivenName copyWithZone:a3];
  v20 = (void *)v5[7];
  v5[7] = v19;

  id v21 = [(NSString *)self->_createdByFamilyName copyWithZone:a3];
  v22 = (void *)v5[6];
  v5[6] = v21;

  id v23 = [(PDDPAsset *)self->_baseAsset copyWithZone:a3];
  v24 = (void *)v5[4];
  v5[4] = v23;

  id v25 = [(PDDPAsset *)self->_baseMarkupAsset copyWithZone:a3];
  v26 = (void *)v5[5];
  v5[5] = v25;

  id v27 = [(PDDPAsset *)self->_questionDataAsset copyWithZone:a3];
  id v28 = (void *)v5[15];
  v5[15] = v27;

  id v29 = [(PDDPAsset *)self->_aggregateDataAsset copyWithZone:a3];
  id v30 = (void *)v5[2];
  v5[2] = v29;

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v31 = self->_instructionAssets;
  id v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v33; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v39 != v34) {
          objc_enumerationMutation(v31);
        }
        id v36 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "copyWithZone:", a3, (void)v38);
        [v5 addInstructionAssets:v36];
      }
      id v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v33);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  objectId = self->_objectId;
  if ((unint64_t)objectId | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](objectId, "isEqual:")) {
      goto LABEL_46;
    }
  }
  parentObjectId = self->_parentObjectId;
  if ((unint64_t)parentObjectId | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](parentObjectId, "isEqual:")) {
      goto LABEL_46;
    }
  }
  dateCreated = self->_dateCreated;
  if ((unint64_t)dateCreated | *((void *)v4 + 8))
  {
    if (!-[PDDPDate isEqual:](dateCreated, "isEqual:")) {
      goto LABEL_46;
    }
  }
  dateLastModified = self->_dateLastModified;
  if ((unint64_t)dateLastModified | *((void *)v4 + 9))
  {
    if (!-[PDDPDate isEqual:](dateLastModified, "isEqual:")) {
      goto LABEL_46;
    }
  }
  makerUserId = self->_makerUserId;
  if ((unint64_t)makerUserId | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](makerUserId, "isEqual:")) {
      goto LABEL_46;
    }
  }
  etag = self->_etag;
  if ((unint64_t)etag | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](etag, "isEqual:")) {
      goto LABEL_46;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 132) & 4) != 0)
    {
      if (self->_allowLateSubmissions)
      {
        if (!*((unsigned char *)v4 + 128)) {
          goto LABEL_46;
        }
        goto LABEL_22;
      }
      if (!*((unsigned char *)v4 + 128)) {
        goto LABEL_22;
      }
    }
LABEL_46:
    unsigned __int8 v18 = 0;
    goto LABEL_47;
  }
  if ((*((unsigned char *)v4 + 132) & 4) != 0) {
    goto LABEL_46;
  }
LABEL_22:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 132) & 1) == 0 || self->_takerTimeLimitInSeconds != *((double *)v4 + 1)) {
      goto LABEL_46;
    }
  }
  else if (*((unsigned char *)v4 + 132))
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 132) & 2) == 0 || self->_assessmentMode != *((_DWORD *)v4 + 6)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 132) & 2) != 0)
  {
    goto LABEL_46;
  }
  createdByGivenName = self->_createdByGivenName;
  if ((unint64_t)createdByGivenName | *((void *)v4 + 7)
    && !-[NSString isEqual:](createdByGivenName, "isEqual:"))
  {
    goto LABEL_46;
  }
  createdByFamilyName = self->_createdByFamilyName;
  if ((unint64_t)createdByFamilyName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](createdByFamilyName, "isEqual:")) {
      goto LABEL_46;
    }
  }
  baseAsset = self->_baseAsset;
  if ((unint64_t)baseAsset | *((void *)v4 + 4))
  {
    if (!-[PDDPAsset isEqual:](baseAsset, "isEqual:")) {
      goto LABEL_46;
    }
  }
  baseMarkupAsset = self->_baseMarkupAsset;
  if ((unint64_t)baseMarkupAsset | *((void *)v4 + 5))
  {
    if (!-[PDDPAsset isEqual:](baseMarkupAsset, "isEqual:")) {
      goto LABEL_46;
    }
  }
  questionDataAsset = self->_questionDataAsset;
  if ((unint64_t)questionDataAsset | *((void *)v4 + 15))
  {
    if (!-[PDDPAsset isEqual:](questionDataAsset, "isEqual:")) {
      goto LABEL_46;
    }
  }
  aggregateDataAsset = self->_aggregateDataAsset;
  if ((unint64_t)aggregateDataAsset | *((void *)v4 + 2))
  {
    if (!-[PDDPAsset isEqual:](aggregateDataAsset, "isEqual:")) {
      goto LABEL_46;
    }
  }
  instructionAssets = self->_instructionAssets;
  if ((unint64_t)instructionAssets | *((void *)v4 + 11)) {
    unsigned __int8 v18 = -[NSMutableArray isEqual:](instructionAssets, "isEqual:");
  }
  else {
    unsigned __int8 v18 = 1;
  }
LABEL_47:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_objectId hash];
  NSUInteger v4 = [(NSString *)self->_parentObjectId hash];
  unint64_t v5 = [(PDDPDate *)self->_dateCreated hash];
  unint64_t v6 = [(PDDPDate *)self->_dateLastModified hash];
  NSUInteger v7 = [(NSString *)self->_makerUserId hash];
  NSUInteger v8 = [(NSString *)self->_etag hash];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v10 = 2654435761 * self->_allowLateSubmissions;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v15 = 0;
    goto LABEL_11;
  }
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double takerTimeLimitInSeconds = self->_takerTimeLimitInSeconds;
  double v12 = -takerTimeLimitInSeconds;
  if (takerTimeLimitInSeconds >= 0.0) {
    double v12 = self->_takerTimeLimitInSeconds;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  unint64_t v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0) {
      v15 += (unint64_t)v14;
    }
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_11:
  if ((has & 2) != 0) {
    uint64_t v16 = 2654435761 * self->_assessmentMode;
  }
  else {
    uint64_t v16 = 0;
  }
  NSUInteger v17 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10;
  unint64_t v18 = v15 ^ v16 ^ [(NSString *)self->_createdByGivenName hash];
  unint64_t v19 = v18 ^ [(NSString *)self->_createdByFamilyName hash];
  unint64_t v20 = v17 ^ v19 ^ [(PDDPAsset *)self->_baseAsset hash];
  unint64_t v21 = [(PDDPAsset *)self->_baseMarkupAsset hash];
  unint64_t v22 = v21 ^ [(PDDPAsset *)self->_questionDataAsset hash];
  unint64_t v23 = v22 ^ [(PDDPAsset *)self->_aggregateDataAsset hash];
  return v20 ^ v23 ^ (unint64_t)[(NSMutableArray *)self->_instructionAssets hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 13)) {
    -[PDDPAssessment setObjectId:](self, "setObjectId:");
  }
  if (*((void *)v4 + 14)) {
    -[PDDPAssessment setParentObjectId:](self, "setParentObjectId:");
  }
  dateCreated = self->_dateCreated;
  uint64_t v6 = *((void *)v4 + 8);
  if (dateCreated)
  {
    if (v6) {
      -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PDDPAssessment setDateCreated:](self, "setDateCreated:");
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v8 = *((void *)v4 + 9);
  if (dateLastModified)
  {
    if (v8) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PDDPAssessment setDateLastModified:](self, "setDateLastModified:");
  }
  if (*((void *)v4 + 12)) {
    -[PDDPAssessment setMakerUserId:](self, "setMakerUserId:");
  }
  if (*((void *)v4 + 10)) {
    -[PDDPAssessment setEtag:](self, "setEtag:");
  }
  char v9 = *((unsigned char *)v4 + 132);
  if ((v9 & 4) != 0)
  {
    self->_allowLateSubmissions = *((unsigned char *)v4 + 128);
    *(unsigned char *)&self->_has |= 4u;
    char v9 = *((unsigned char *)v4 + 132);
    if ((v9 & 1) == 0)
    {
LABEL_21:
      if ((v9 & 2) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 132) & 1) == 0)
  {
    goto LABEL_21;
  }
  self->_double takerTimeLimitInSeconds = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 132) & 2) != 0)
  {
LABEL_22:
    self->_uint64_t assessmentMode = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_23:
  if (*((void *)v4 + 7)) {
    -[PDDPAssessment setCreatedByGivenName:](self, "setCreatedByGivenName:");
  }
  if (*((void *)v4 + 6)) {
    -[PDDPAssessment setCreatedByFamilyName:](self, "setCreatedByFamilyName:");
  }
  baseAsset = self->_baseAsset;
  uint64_t v11 = *((void *)v4 + 4);
  if (baseAsset)
  {
    if (v11) {
      -[PDDPAsset mergeFrom:](baseAsset, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[PDDPAssessment setBaseAsset:](self, "setBaseAsset:");
  }
  baseMarkupAsset = self->_baseMarkupAsset;
  uint64_t v13 = *((void *)v4 + 5);
  if (baseMarkupAsset)
  {
    if (v13) {
      -[PDDPAsset mergeFrom:](baseMarkupAsset, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[PDDPAssessment setBaseMarkupAsset:](self, "setBaseMarkupAsset:");
  }
  questionDataAsset = self->_questionDataAsset;
  uint64_t v15 = *((void *)v4 + 15);
  if (questionDataAsset)
  {
    if (v15) {
      -[PDDPAsset mergeFrom:](questionDataAsset, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[PDDPAssessment setQuestionDataAsset:](self, "setQuestionDataAsset:");
  }
  aggregateDataAsset = self->_aggregateDataAsset;
  uint64_t v17 = *((void *)v4 + 2);
  if (aggregateDataAsset)
  {
    if (v17) {
      -[PDDPAsset mergeFrom:](aggregateDataAsset, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[PDDPAssessment setAggregateDataAsset:](self, "setAggregateDataAsset:");
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v18 = *((id *)v4 + 11);
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
        -[PDDPAssessment addInstructionAssets:](self, "addInstructionAssets:", *(void *)(*((void *)&v23 + 1) + 8 * i), (void)v23);
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

- (NSString)makerUserId
{
  return self->_makerUserId;
}

- (void)setMakerUserId:(id)a3
{
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (BOOL)allowLateSubmissions
{
  return self->_allowLateSubmissions;
}

- (double)takerTimeLimitInSeconds
{
  return self->_takerTimeLimitInSeconds;
}

- (NSString)createdByGivenName
{
  return self->_createdByGivenName;
}

- (void)setCreatedByGivenName:(id)a3
{
}

- (NSString)createdByFamilyName
{
  return self->_createdByFamilyName;
}

- (void)setCreatedByFamilyName:(id)a3
{
}

- (PDDPAsset)baseAsset
{
  return self->_baseAsset;
}

- (void)setBaseAsset:(id)a3
{
}

- (PDDPAsset)baseMarkupAsset
{
  return self->_baseMarkupAsset;
}

- (void)setBaseMarkupAsset:(id)a3
{
}

- (PDDPAsset)questionDataAsset
{
  return self->_questionDataAsset;
}

- (void)setQuestionDataAsset:(id)a3
{
}

- (PDDPAsset)aggregateDataAsset
{
  return self->_aggregateDataAsset;
}

- (void)setAggregateDataAsset:(id)a3
{
}

- (NSMutableArray)instructionAssets
{
  return self->_instructionAssets;
}

- (void)setInstructionAssets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_questionDataAsset, 0);
  objc_storeStrong((id *)&self->_parentObjectId, 0);
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_makerUserId, 0);
  objc_storeStrong((id *)&self->_instructionAssets, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_createdByGivenName, 0);
  objc_storeStrong((id *)&self->_createdByFamilyName, 0);
  objc_storeStrong((id *)&self->_baseMarkupAsset, 0);
  objc_storeStrong((id *)&self->_baseAsset, 0);

  objc_storeStrong((id *)&self->_aggregateDataAsset, 0);
}

@end