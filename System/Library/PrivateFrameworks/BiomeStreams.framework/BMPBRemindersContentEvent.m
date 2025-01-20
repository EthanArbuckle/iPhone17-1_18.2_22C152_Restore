@interface BMPBRemindersContentEvent
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasCompletionDateTimestamp;
- (BOOL)hasContentProtection;
- (BOOL)hasDomainId;
- (BOOL)hasDueDateTimestamp;
- (BOOL)hasIsAllDay;
- (BOOL)hasNotes;
- (BOOL)hasPersonaId;
- (BOOL)hasPriority;
- (BOOL)hasTitle;
- (BOOL)hasUniqueId;
- (BOOL)isAllDay;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)contentProtection;
- (NSString)domainId;
- (NSString)notes;
- (NSString)personaId;
- (NSString)title;
- (NSString)uniqueId;
- (double)absoluteTimestamp;
- (double)completionDateTimestamp;
- (double)dueDateTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)priority;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setCompletionDateTimestamp:(double)a3;
- (void)setContentProtection:(id)a3;
- (void)setDomainId:(id)a3;
- (void)setDueDateTimestamp:(double)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setHasCompletionDateTimestamp:(BOOL)a3;
- (void)setHasDueDateTimestamp:(BOOL)a3;
- (void)setHasIsAllDay:(BOOL)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setIsAllDay:(BOOL)a3;
- (void)setNotes:(id)a3;
- (void)setPersonaId:(id)a3;
- (void)setPriority:(int)a3;
- (void)setTitle:(id)a3;
- (void)setUniqueId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBRemindersContentEvent

- (BOOL)hasUniqueId
{
  return self->_uniqueId != 0;
}

- (BOOL)hasDomainId
{
  return self->_domainId != 0;
}

- (void)setAbsoluteTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasNotes
{
  return self->_notes != 0;
}

- (void)setIsAllDay:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isAllDay = a3;
}

- (void)setHasIsAllDay:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsAllDay
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setCompletionDateTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_completionDateTimestamp = a3;
}

- (void)setHasCompletionDateTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCompletionDateTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDueDateTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_dueDateTimestamp = a3;
}

- (void)setHasDueDateTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDueDateTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPriority:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPriority
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasContentProtection
{
  return self->_contentProtection != 0;
}

- (BOOL)hasPersonaId
{
  return self->_personaId != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBRemindersContentEvent;
  v4 = [(BMPBRemindersContentEvent *)&v8 description];
  v5 = [(BMPBRemindersContentEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  uniqueId = self->_uniqueId;
  if (uniqueId) {
    [v3 setObject:uniqueId forKey:@"uniqueId"];
  }
  domainId = self->_domainId;
  if (domainId) {
    [v4 setObject:domainId forKey:@"domainId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
    [v4 setObject:v7 forKey:@"absoluteTimestamp"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  notes = self->_notes;
  if (notes) {
    [v4 setObject:notes forKey:@"notes"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v15 = [NSNumber numberWithBool:self->_isAllDay];
    [v4 setObject:v15 forKey:@"isAllDay"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  v16 = [NSNumber numberWithDouble:self->_completionDateTimestamp];
  [v4 setObject:v16 forKey:@"completionDateTimestamp"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_25:
  v17 = [NSNumber numberWithDouble:self->_dueDateTimestamp];
  [v4 setObject:v17 forKey:@"dueDateTimestamp"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_15:
    v11 = [NSNumber numberWithInt:self->_priority];
    [v4 setObject:v11 forKey:@"priority"];
  }
LABEL_16:
  contentProtection = self->_contentProtection;
  if (contentProtection) {
    [v4 setObject:contentProtection forKey:@"contentProtection"];
  }
  personaId = self->_personaId;
  if (personaId) {
    [v4 setObject:personaId forKey:@"personaId"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBRemindersContentEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uniqueId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_domainId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_notes)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_15:
    PBDataWriterWriteSint32Field();
    id v4 = v6;
  }
LABEL_16:
  if (self->_contentProtection)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_personaId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uniqueId)
  {
    objc_msgSend(v4, "setUniqueId:");
    id v4 = v6;
  }
  if (self->_domainId)
  {
    objc_msgSend(v6, "setDomainId:");
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_absoluteTimestamp;
    *((unsigned char *)v4 + 92) |= 1u;
  }
  if (self->_title)
  {
    objc_msgSend(v6, "setTitle:");
    id v4 = v6;
  }
  if (self->_notes)
  {
    objc_msgSend(v6, "setNotes:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((unsigned char *)v4 + 88) = self->_isAllDay;
    *((unsigned char *)v4 + 92) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  *((void *)v4 + 2) = *(void *)&self->_completionDateTimestamp;
  *((unsigned char *)v4 + 92) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_25:
  *((void *)v4 + 3) = *(void *)&self->_dueDateTimestamp;
  *((unsigned char *)v4 + 92) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_15:
    *((_DWORD *)v4 + 16) = self->_priority;
    *((unsigned char *)v4 + 92) |= 8u;
  }
LABEL_16:
  if (self->_contentProtection)
  {
    objc_msgSend(v6, "setContentProtection:");
    id v4 = v6;
  }
  if (self->_personaId)
  {
    objc_msgSend(v6, "setPersonaId:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uniqueId copyWithZone:a3];
  v7 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v6;

  uint64_t v8 = [(NSString *)self->_domainId copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(unsigned char *)(v5 + 92) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_title copyWithZone:a3];
  v11 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v10;

  uint64_t v12 = [(NSString *)self->_notes copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 88) = self->_isAllDay;
    *(unsigned char *)(v5 + 92) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *(double *)(v5 + 24) = self->_dueDateTimestamp;
      *(unsigned char *)(v5 + 92) |= 4u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v5 + 16) = self->_completionDateTimestamp;
  *(unsigned char *)(v5 + 92) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    *(_DWORD *)(v5 + 64) = self->_priority;
    *(unsigned char *)(v5 + 92) |= 8u;
  }
LABEL_8:
  uint64_t v15 = [(NSString *)self->_contentProtection copyWithZone:a3];
  v16 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v15;

  uint64_t v17 = [(NSString *)self->_personaId copyWithZone:a3];
  v18 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v17;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  uniqueId = self->_uniqueId;
  if ((unint64_t)uniqueId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](uniqueId, "isEqual:")) {
      goto LABEL_42;
    }
  }
  domainId = self->_domainId;
  if ((unint64_t)domainId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](domainId, "isEqual:")) {
      goto LABEL_42;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 92) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_42;
    }
  }
  else if (*((unsigned char *)v4 + 92))
  {
    goto LABEL_42;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 9) && !-[NSString isEqual:](title, "isEqual:")) {
    goto LABEL_42;
  }
  notes = self->_notes;
  if ((unint64_t)notes | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](notes, "isEqual:")) {
      goto LABEL_42;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 0x10) != 0)
    {
      if (self->_isAllDay)
      {
        if (!*((unsigned char *)v4 + 88)) {
          goto LABEL_42;
        }
        goto LABEL_23;
      }
      if (!*((unsigned char *)v4 + 88)) {
        goto LABEL_23;
      }
    }
LABEL_42:
    char v11 = 0;
    goto LABEL_43;
  }
  if ((*((unsigned char *)v4 + 92) & 0x10) != 0) {
    goto LABEL_42;
  }
LABEL_23:
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 2) == 0 || self->_completionDateTimestamp != *((double *)v4 + 2)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 4) == 0 || self->_dueDateTimestamp != *((double *)v4 + 3)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 4) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 8) == 0 || self->_priority != *((_DWORD *)v4 + 16)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 8) != 0)
  {
    goto LABEL_42;
  }
  contentProtection = self->_contentProtection;
  if ((unint64_t)contentProtection | *((void *)v4 + 4)
    && !-[NSString isEqual:](contentProtection, "isEqual:"))
  {
    goto LABEL_42;
  }
  personaId = self->_personaId;
  if ((unint64_t)personaId | *((void *)v4 + 7)) {
    char v11 = -[NSString isEqual:](personaId, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_43:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uniqueId hash];
  NSUInteger v4 = [(NSString *)self->_domainId hash];
  if (*(unsigned char *)&self->_has)
  {
    double absoluteTimestamp = self->_absoluteTimestamp;
    double v7 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0) {
      double v7 = self->_absoluteTimestamp;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_title hash];
  NSUInteger v11 = [(NSString *)self->_notes hash];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t v13 = 2654435761 * self->_isAllDay;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v18 = 0;
    goto LABEL_19;
  }
  uint64_t v13 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  double completionDateTimestamp = self->_completionDateTimestamp;
  double v15 = -completionDateTimestamp;
  if (completionDateTimestamp >= 0.0) {
    double v15 = self->_completionDateTimestamp;
  }
  long double v16 = floor(v15 + 0.5);
  double v17 = (v15 - v16) * 1.84467441e19;
  unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0) {
      v18 += (unint64_t)v17;
    }
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
LABEL_19:
  if ((has & 4) != 0)
  {
    double dueDateTimestamp = self->_dueDateTimestamp;
    double v21 = -dueDateTimestamp;
    if (dueDateTimestamp >= 0.0) {
      double v21 = self->_dueDateTimestamp;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((has & 8) != 0) {
    uint64_t v24 = 2654435761 * self->_priority;
  }
  else {
    uint64_t v24 = 0;
  }
  NSUInteger v25 = v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v13 ^ v18;
  NSUInteger v26 = v19 ^ v24 ^ [(NSString *)self->_contentProtection hash];
  return v25 ^ v26 ^ [(NSString *)self->_personaId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 10))
  {
    -[BMPBRemindersContentEvent setUniqueId:](self, "setUniqueId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[BMPBRemindersContentEvent setDomainId:](self, "setDomainId:");
    id v4 = v6;
  }
  if (*((unsigned char *)v4 + 92))
  {
    self->_double absoluteTimestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 9))
  {
    -[BMPBRemindersContentEvent setTitle:](self, "setTitle:");
    id v4 = v6;
  }
  if (*((void *)v4 + 6))
  {
    -[BMPBRemindersContentEvent setNotes:](self, "setNotes:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 92);
  if ((v5 & 0x10) != 0)
  {
    self->_isAllDay = *((unsigned char *)v4 + 88);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)v4 + 92);
    if ((v5 & 2) == 0)
    {
LABEL_13:
      if ((v5 & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 2) == 0)
  {
    goto LABEL_13;
  }
  self->_double completionDateTimestamp = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 92);
  if ((v5 & 4) == 0)
  {
LABEL_14:
    if ((v5 & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_25:
  self->_double dueDateTimestamp = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 92) & 8) != 0)
  {
LABEL_15:
    self->_priority = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_16:
  if (*((void *)v4 + 4))
  {
    -[BMPBRemindersContentEvent setContentProtection:](self, "setContentProtection:");
    id v4 = v6;
  }
  if (*((void *)v4 + 7))
  {
    -[BMPBRemindersContentEvent setPersonaId:](self, "setPersonaId:");
    id v4 = v6;
  }
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)setUniqueId:(id)a3
{
}

- (NSString)domainId
{
  return self->_domainId;
}

- (void)setDomainId:(id)a3
{
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (double)completionDateTimestamp
{
  return self->_completionDateTimestamp;
}

- (double)dueDateTimestamp
{
  return self->_dueDateTimestamp;
}

- (int)priority
{
  return self->_priority;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void)setContentProtection:(id)a3
{
}

- (NSString)personaId
{
  return self->_personaId;
}

- (void)setPersonaId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_domainId, 0);

  objc_storeStrong((id *)&self->_contentProtection, 0);
}

@end