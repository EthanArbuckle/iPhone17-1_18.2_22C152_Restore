@interface PDDPHandoutReportItem
+ (Class)additionalReportsType;
- (BOOL)hasAttachmentId;
- (BOOL)hasClassId;
- (BOOL)hasEndDate;
- (BOOL)hasGranularity;
- (BOOL)hasHandoutId;
- (BOOL)hasIsCompleted;
- (BOOL)hasReport;
- (BOOL)hasReportItemId;
- (BOOL)hasStartDate;
- (BOOL)hasStudentId;
- (BOOL)hasType;
- (BOOL)isCompleted;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)additionalReports;
- (NSString)attachmentId;
- (NSString)classId;
- (NSString)handoutId;
- (NSString)reportItemId;
- (NSString)studentId;
- (PDDPActivityReport)report;
- (PDDPDate)endDate;
- (PDDPDate)startDate;
- (id)additionalReportsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)granularityAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsGranularity:(id)a3;
- (int)StringAsType:(id)a3;
- (int)granularity;
- (int)type;
- (unint64_t)additionalReportsCount;
- (unint64_t)hash;
- (void)addAdditionalReports:(id)a3;
- (void)clearAdditionalReports;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdditionalReports:(id)a3;
- (void)setAttachmentId:(id)a3;
- (void)setClassId:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setGranularity:(int)a3;
- (void)setHandoutId:(id)a3;
- (void)setHasGranularity:(BOOL)a3;
- (void)setHasIsCompleted:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIsCompleted:(BOOL)a3;
- (void)setReport:(id)a3;
- (void)setReportItemId:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setStudentId:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPHandoutReportItem

- (int)type
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 5)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_1001F62F8 + a3);
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
  else if ([v3 isEqualToString:@"BEFORE_DUE_DATE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AFTER_DUE_DATE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AFTER_REVIEWED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NO_DUE_DATE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)granularity
{
  if (*(unsigned char *)&self->_has) {
    return self->_granularity;
  }
  else {
    return 0;
  }
}

- (void)setGranularity:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_granularity = a3;
}

- (void)setHasGranularity:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGranularity
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)granularityAsString:(int)a3
{
  if (a3 >= 5)
  {
    id v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    id v3 = *(&off_1001F6320 + a3);
  }

  return v3;
}

- (int)StringAsGranularity:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_GRANULARITY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DAILY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EVERY_7_DAY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EVERY_30_DAY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"COMPLETE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasHandoutId
{
  return self->_handoutId != 0;
}

- (BOOL)hasStudentId
{
  return self->_studentId != 0;
}

- (BOOL)hasClassId
{
  return self->_classId != 0;
}

- (BOOL)hasStartDate
{
  return self->_startDate != 0;
}

- (BOOL)hasEndDate
{
  return self->_endDate != 0;
}

- (BOOL)hasAttachmentId
{
  return self->_attachmentId != 0;
}

- (void)setIsCompleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isCompleted = a3;
}

- (void)setHasIsCompleted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsCompleted
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasReport
{
  return self->_report != 0;
}

- (void)clearAdditionalReports
{
}

- (void)addAdditionalReports:(id)a3
{
  id v4 = a3;
  additionalReports = self->_additionalReports;
  id v8 = v4;
  if (!additionalReports)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_additionalReports;
    self->_additionalReports = v6;

    id v4 = v8;
    additionalReports = self->_additionalReports;
  }
  [(NSMutableArray *)additionalReports addObject:v4];
}

- (unint64_t)additionalReportsCount
{
  return (unint64_t)[(NSMutableArray *)self->_additionalReports count];
}

- (id)additionalReportsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_additionalReports objectAtIndex:a3];
}

+ (Class)additionalReportsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasReportItemId
{
  return self->_reportItemId != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPHandoutReportItem;
  char v3 = [(PDDPHandoutReportItem *)&v7 description];
  id v4 = [(PDDPHandoutReportItem *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 5)
    {
      v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    else
    {
      v6 = *(&off_1001F62F8 + type);
    }
    [v3 setObject:v6 forKey:@"type"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t granularity = self->_granularity;
    if (granularity >= 5)
    {
      id v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_granularity];
    }
    else
    {
      id v8 = *(&off_1001F6320 + granularity);
    }
    [v3 setObject:v8 forKey:@"granularity"];
  }
  handoutId = self->_handoutId;
  if (handoutId) {
    [v3 setObject:handoutId forKey:@"handout_id"];
  }
  studentId = self->_studentId;
  if (studentId) {
    [v3 setObject:studentId forKey:@"student_id"];
  }
  classId = self->_classId;
  if (classId) {
    [v3 setObject:classId forKey:@"class_id"];
  }
  startDate = self->_startDate;
  if (startDate)
  {
    v13 = [(PDDPDate *)startDate dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"start_date"];
  }
  endDate = self->_endDate;
  if (endDate)
  {
    v15 = [(PDDPDate *)endDate dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"end_date"];
  }
  attachmentId = self->_attachmentId;
  if (attachmentId) {
    [v3 setObject:attachmentId forKey:@"attachment_id"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v17 = +[NSNumber numberWithBool:self->_isCompleted];
    [v3 setObject:v17 forKey:@"is_completed"];
  }
  report = self->_report;
  if (report)
  {
    v19 = [(PDDPActivityReport *)report dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"report"];
  }
  if ([(NSMutableArray *)self->_additionalReports count])
  {
    id v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_additionalReports, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v21 = self->_additionalReports;
    id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v30;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v30 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v29 + 1) + 8 * i) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKey:@"additional_reports"];
  }
  reportItemId = self->_reportItemId;
  if (reportItemId) {
    [v3 setObject:reportItemId forKey:@"report_item_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10015DE70((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_handoutId) {
    PBDataWriterWriteStringField();
  }
  if (self->_studentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_classId) {
    PBDataWriterWriteStringField();
  }
  if (self->_startDate) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_endDate) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_attachmentId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_report) {
    PBDataWriterWriteSubmessage();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_additionalReports;
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

  if (self->_reportItemId) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[22] = self->_type;
    *((unsigned char *)v4 + 96) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[10] = self->_granularity;
    *((unsigned char *)v4 + 96) |= 1u;
  }
  v10 = v4;
  if (self->_handoutId)
  {
    objc_msgSend(v4, "setHandoutId:");
    id v4 = v10;
  }
  if (self->_studentId)
  {
    objc_msgSend(v10, "setStudentId:");
    id v4 = v10;
  }
  if (self->_classId)
  {
    objc_msgSend(v10, "setClassId:");
    id v4 = v10;
  }
  if (self->_startDate)
  {
    objc_msgSend(v10, "setStartDate:");
    id v4 = v10;
  }
  if (self->_endDate)
  {
    objc_msgSend(v10, "setEndDate:");
    id v4 = v10;
  }
  if (self->_attachmentId)
  {
    objc_msgSend(v10, "setAttachmentId:");
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v4 + 92) = self->_isCompleted;
    *((unsigned char *)v4 + 96) |= 4u;
  }
  if (self->_report) {
    objc_msgSend(v10, "setReport:");
  }
  if ([(PDDPHandoutReportItem *)self additionalReportsCount])
  {
    [v10 clearAdditionalReports];
    unint64_t v6 = [(PDDPHandoutReportItem *)self additionalReportsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(PDDPHandoutReportItem *)self additionalReportsAtIndex:i];
        [v10 addAdditionalReports:v9];
      }
    }
  }
  if (self->_reportItemId) {
    objc_msgSend(v10, "setReportItemId:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[22] = self->_type;
    *((unsigned char *)v5 + 96) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v5[10] = self->_granularity;
    *((unsigned char *)v5 + 96) |= 1u;
  }
  id v8 = [(NSString *)self->_handoutId copyWithZone:a3];
  uint64_t v9 = (void *)v6[6];
  v6[6] = v8;

  id v10 = [(NSString *)self->_studentId copyWithZone:a3];
  long long v11 = (void *)v6[10];
  v6[10] = v10;

  id v12 = [(NSString *)self->_classId copyWithZone:a3];
  long long v13 = (void *)v6[3];
  v6[3] = v12;

  id v14 = [(PDDPDate *)self->_startDate copyWithZone:a3];
  v15 = (void *)v6[9];
  v6[9] = v14;

  id v16 = [(PDDPDate *)self->_endDate copyWithZone:a3];
  v17 = (void *)v6[4];
  v6[4] = v16;

  id v18 = [(NSString *)self->_attachmentId copyWithZone:a3];
  v19 = (void *)v6[2];
  v6[2] = v18;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v6 + 92) = self->_isCompleted;
    *((unsigned char *)v6 + 96) |= 4u;
  }
  id v20 = [(PDDPActivityReport *)self->_report copyWithZone:a3];
  v21 = (void *)v6[7];
  v6[7] = v20;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v22 = self->_additionalReports;
  id v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v24; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "copyWithZone:", a3, (void)v31);
        [v6 addAdditionalReports:v27];
      }
      id v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v24);
  }

  id v28 = [(NSString *)self->_reportItemId copyWithZone:a3];
  long long v29 = (void *)v6[8];
  v6[8] = v28;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 2) == 0 || self->_type != *((_DWORD *)v4 + 22)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
    goto LABEL_38;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_granularity != *((_DWORD *)v4 + 10)) {
      goto LABEL_38;
    }
  }
  else if (*((unsigned char *)v4 + 96))
  {
    goto LABEL_38;
  }
  handoutId = self->_handoutId;
  if ((unint64_t)handoutId | *((void *)v4 + 6) && !-[NSString isEqual:](handoutId, "isEqual:")) {
    goto LABEL_38;
  }
  studentId = self->_studentId;
  if ((unint64_t)studentId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](studentId, "isEqual:")) {
      goto LABEL_38;
    }
  }
  classId = self->_classId;
  if ((unint64_t)classId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](classId, "isEqual:")) {
      goto LABEL_38;
    }
  }
  startDate = self->_startDate;
  if ((unint64_t)startDate | *((void *)v4 + 9))
  {
    if (!-[PDDPDate isEqual:](startDate, "isEqual:")) {
      goto LABEL_38;
    }
  }
  endDate = self->_endDate;
  if ((unint64_t)endDate | *((void *)v4 + 4))
  {
    if (!-[PDDPDate isEqual:](endDate, "isEqual:")) {
      goto LABEL_38;
    }
  }
  attachmentId = self->_attachmentId;
  if ((unint64_t)attachmentId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](attachmentId, "isEqual:")) {
      goto LABEL_38;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 4) != 0)
    {
      if (self->_isCompleted)
      {
        if (!*((unsigned char *)v4 + 92)) {
          goto LABEL_38;
        }
        goto LABEL_32;
      }
      if (!*((unsigned char *)v4 + 92)) {
        goto LABEL_32;
      }
    }
LABEL_38:
    unsigned __int8 v14 = 0;
    goto LABEL_39;
  }
  if ((*((unsigned char *)v4 + 96) & 4) != 0) {
    goto LABEL_38;
  }
LABEL_32:
  report = self->_report;
  if ((unint64_t)report | *((void *)v4 + 7) && !-[PDDPActivityReport isEqual:](report, "isEqual:")) {
    goto LABEL_38;
  }
  additionalReports = self->_additionalReports;
  if ((unint64_t)additionalReports | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](additionalReports, "isEqual:")) {
      goto LABEL_38;
    }
  }
  reportItemId = self->_reportItemId;
  if ((unint64_t)reportItemId | *((void *)v4 + 8)) {
    unsigned __int8 v14 = -[NSString isEqual:](reportItemId, "isEqual:");
  }
  else {
    unsigned __int8 v14 = 1;
  }
LABEL_39:

  return v14;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_type;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_granularity;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_handoutId hash];
  NSUInteger v6 = [(NSString *)self->_studentId hash];
  NSUInteger v7 = [(NSString *)self->_classId hash];
  unint64_t v8 = [(PDDPDate *)self->_startDate hash];
  unint64_t v9 = [(PDDPDate *)self->_endDate hash];
  NSUInteger v10 = [(NSString *)self->_attachmentId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_isCompleted;
  }
  else {
    uint64_t v11 = 0;
  }
  NSUInteger v12 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  unint64_t v13 = v11 ^ [(PDDPActivityReport *)self->_report hash];
  unint64_t v14 = v13 ^ (unint64_t)[(NSMutableArray *)self->_additionalReports hash];
  return v12 ^ v14 ^ [(NSString *)self->_reportItemId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  NSUInteger v5 = v4;
  char v6 = *((unsigned char *)v4 + 96);
  if ((v6 & 2) != 0)
  {
    self->_uint64_t type = v4[22];
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 96);
  }
  if (v6)
  {
    self->_uint64_t granularity = v4[10];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 6)) {
    [(PDDPHandoutReportItem *)self setHandoutId:"setHandoutId:"];
  }
  if (*((void *)v5 + 10)) {
    -[PDDPHandoutReportItem setStudentId:](self, "setStudentId:");
  }
  if (*((void *)v5 + 3)) {
    -[PDDPHandoutReportItem setClassId:](self, "setClassId:");
  }
  startDate = self->_startDate;
  uint64_t v8 = *((void *)v5 + 9);
  if (startDate)
  {
    if (v8) {
      -[PDDPDate mergeFrom:](startDate, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PDDPHandoutReportItem setStartDate:](self, "setStartDate:");
  }
  endDate = self->_endDate;
  uint64_t v10 = *((void *)v5 + 4);
  if (endDate)
  {
    if (v10) {
      -[PDDPDate mergeFrom:](endDate, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[PDDPHandoutReportItem setEndDate:](self, "setEndDate:");
  }
  if (*((void *)v5 + 2)) {
    -[PDDPHandoutReportItem setAttachmentId:](self, "setAttachmentId:");
  }
  if ((v5[24] & 4) != 0)
  {
    self->_isCompleted = *((unsigned char *)v5 + 92);
    *(unsigned char *)&self->_has |= 4u;
  }
  report = self->_report;
  uint64_t v12 = *((void *)v5 + 7);
  if (report)
  {
    if (v12) {
      -[PDDPActivityReport mergeFrom:](report, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[PDDPHandoutReportItem setReport:](self, "setReport:");
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = *((id *)v5 + 1);
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[PDDPHandoutReportItem addAdditionalReports:](self, "addAdditionalReports:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
      }
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }

  if (*((void *)v5 + 8)) {
    -[PDDPHandoutReportItem setReportItemId:](self, "setReportItemId:");
  }
}

- (NSString)handoutId
{
  return self->_handoutId;
}

- (void)setHandoutId:(id)a3
{
}

- (NSString)studentId
{
  return self->_studentId;
}

- (void)setStudentId:(id)a3
{
}

- (NSString)classId
{
  return self->_classId;
}

- (void)setClassId:(id)a3
{
}

- (PDDPDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (PDDPDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSString)attachmentId
{
  return self->_attachmentId;
}

- (void)setAttachmentId:(id)a3
{
}

- (BOOL)isCompleted
{
  return self->_isCompleted;
}

- (PDDPActivityReport)report
{
  return self->_report;
}

- (void)setReport:(id)a3
{
}

- (NSMutableArray)additionalReports
{
  return self->_additionalReports;
}

- (void)setAdditionalReports:(id)a3
{
}

- (NSString)reportItemId
{
  return self->_reportItemId;
}

- (void)setReportItemId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_studentId, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_reportItemId, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_handoutId, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_classId, 0);
  objc_storeStrong((id *)&self->_attachmentId, 0);

  objc_storeStrong((id *)&self->_additionalReports, 0);
}

@end