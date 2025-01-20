@interface FCCGoalProgressConfigurationProtobuf
- (BOOL)hasAlmostThereConfiguration;
- (BOOL)hasAtypicalDayConfiguration;
- (BOOL)hasCompletionOffTrackConfiguration;
- (BOOL)hasExpirationDate;
- (BOOL)hasMinimumNumberOfActiveDays;
- (BOOL)hasUserEndOfDayDate;
- (BOOL)hasUserStartOfDayDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FCCAlmostThereConfigurationProtobuf)almostThereConfiguration;
- (FCCAtypicalDayConfigurationProtobuf)atypicalDayConfiguration;
- (FCCCompletionOffTrackConfigurationProtobuf)completionOffTrackConfiguration;
- (double)expirationDate;
- (double)userEndOfDayDate;
- (double)userStartOfDayDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)minimumNumberOfActiveDays;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlmostThereConfiguration:(id)a3;
- (void)setAtypicalDayConfiguration:(id)a3;
- (void)setCompletionOffTrackConfiguration:(id)a3;
- (void)setExpirationDate:(double)a3;
- (void)setHasExpirationDate:(BOOL)a3;
- (void)setHasMinimumNumberOfActiveDays:(BOOL)a3;
- (void)setHasUserEndOfDayDate:(BOOL)a3;
- (void)setHasUserStartOfDayDate:(BOOL)a3;
- (void)setMinimumNumberOfActiveDays:(int)a3;
- (void)setUserEndOfDayDate:(double)a3;
- (void)setUserStartOfDayDate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation FCCGoalProgressConfigurationProtobuf

- (void)setMinimumNumberOfActiveDays:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_minimumNumberOfActiveDays = a3;
}

- (void)setHasMinimumNumberOfActiveDays:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMinimumNumberOfActiveDays
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setUserStartOfDayDate:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_userStartOfDayDate = a3;
}

- (void)setHasUserStartOfDayDate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUserStartOfDayDate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setUserEndOfDayDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_userEndOfDayDate = a3;
}

- (void)setHasUserEndOfDayDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUserEndOfDayDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setExpirationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_expirationDate = a3;
}

- (void)setHasExpirationDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExpirationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasAlmostThereConfiguration
{
  return self->_almostThereConfiguration != 0;
}

- (BOOL)hasAtypicalDayConfiguration
{
  return self->_atypicalDayConfiguration != 0;
}

- (BOOL)hasCompletionOffTrackConfiguration
{
  return self->_completionOffTrackConfiguration != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCGoalProgressConfigurationProtobuf;
  v4 = [(FCCGoalProgressConfigurationProtobuf *)&v8 description];
  v5 = [(FCCGoalProgressConfigurationProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v13 = [NSNumber numberWithInt:self->_minimumNumberOfActiveDays];
    [v3 setObject:v13 forKey:@"minimumNumberOfActiveDays"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v14 = [NSNumber numberWithDouble:self->_userStartOfDayDate];
  [v3 setObject:v14 forKey:@"userStartOfDayDate"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_17:
  v15 = [NSNumber numberWithDouble:self->_userEndOfDayDate];
  [v3 setObject:v15 forKey:@"userEndOfDayDate"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    v5 = [NSNumber numberWithDouble:self->_expirationDate];
    [v3 setObject:v5 forKey:@"expirationDate"];
  }
LABEL_6:
  almostThereConfiguration = self->_almostThereConfiguration;
  if (almostThereConfiguration)
  {
    v7 = [(FCCAlmostThereConfigurationProtobuf *)almostThereConfiguration dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"almostThereConfiguration"];
  }
  atypicalDayConfiguration = self->_atypicalDayConfiguration;
  if (atypicalDayConfiguration)
  {
    v9 = [(FCCAtypicalDayConfigurationProtobuf *)atypicalDayConfiguration dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"atypicalDayConfiguration"];
  }
  completionOffTrackConfiguration = self->_completionOffTrackConfiguration;
  if (completionOffTrackConfiguration)
  {
    v11 = [(FCCCompletionOffTrackConfigurationProtobuf *)completionOffTrackConfiguration dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"completionOffTrackConfiguration"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCGoalProgressConfigurationProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_6:
  if (self->_almostThereConfiguration)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_atypicalDayConfiguration)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_completionOffTrackConfiguration)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[14] = self->_minimumNumberOfActiveDays;
    *((unsigned char *)v4 + 60) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v4 + 3) = *(void *)&self->_userStartOfDayDate;
  *((unsigned char *)v4 + 60) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_17:
  *((void *)v4 + 2) = *(void *)&self->_userEndOfDayDate;
  *((unsigned char *)v4 + 60) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    *((void *)v4 + 1) = *(void *)&self->_expirationDate;
    *((unsigned char *)v4 + 60) |= 1u;
  }
LABEL_6:
  id v6 = v4;
  if (self->_almostThereConfiguration)
  {
    objc_msgSend(v4, "setAlmostThereConfiguration:");
    id v4 = v6;
  }
  if (self->_atypicalDayConfiguration)
  {
    objc_msgSend(v6, "setAtypicalDayConfiguration:");
    id v4 = v6;
  }
  if (self->_completionOffTrackConfiguration)
  {
    objc_msgSend(v6, "setCompletionOffTrackConfiguration:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_minimumNumberOfActiveDays;
    *(unsigned char *)(v5 + 60) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(double *)(v5 + 16) = self->_userEndOfDayDate;
      *(unsigned char *)(v5 + 60) |= 2u;
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 24) = self->_userStartOfDayDate;
  *(unsigned char *)(v5 + 60) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if (has)
  {
LABEL_5:
    *(double *)(v5 + 8) = self->_expirationDate;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
LABEL_6:
  id v8 = [(FCCAlmostThereConfigurationProtobuf *)self->_almostThereConfiguration copyWithZone:a3];
  v9 = (void *)v6[4];
  v6[4] = v8;

  id v10 = [(FCCAtypicalDayConfigurationProtobuf *)self->_atypicalDayConfiguration copyWithZone:a3];
  v11 = (void *)v6[5];
  v6[5] = v10;

  id v12 = [(FCCCompletionOffTrackConfigurationProtobuf *)self->_completionOffTrackConfiguration copyWithZone:a3];
  v13 = (void *)v6[6];
  v6[6] = v12;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_minimumNumberOfActiveDays != *((_DWORD *)v4 + 14)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
LABEL_28:
    char v8 = 0;
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_userStartOfDayDate != *((double *)v4 + 3)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_userEndOfDayDate != *((double *)v4 + 2)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_28;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_expirationDate != *((double *)v4 + 1)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_28;
  }
  almostThereConfiguration = self->_almostThereConfiguration;
  if ((unint64_t)almostThereConfiguration | *((void *)v4 + 4)
    && !-[FCCAlmostThereConfigurationProtobuf isEqual:](almostThereConfiguration, "isEqual:"))
  {
    goto LABEL_28;
  }
  atypicalDayConfiguration = self->_atypicalDayConfiguration;
  if ((unint64_t)atypicalDayConfiguration | *((void *)v4 + 5))
  {
    if (!-[FCCAtypicalDayConfigurationProtobuf isEqual:](atypicalDayConfiguration, "isEqual:")) {
      goto LABEL_28;
    }
  }
  completionOffTrackConfiguration = self->_completionOffTrackConfiguration;
  if ((unint64_t)completionOffTrackConfiguration | *((void *)v4 + 6)) {
    char v8 = -[FCCCompletionOffTrackConfigurationProtobuf isEqual:](completionOffTrackConfiguration, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_29:

  return v8;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_minimumNumberOfActiveDays;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double userStartOfDayDate = self->_userStartOfDayDate;
  double v6 = -userStartOfDayDate;
  if (userStartOfDayDate >= 0.0) {
    double v6 = self->_userStartOfDayDate;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 2) != 0)
  {
    double userEndOfDayDate = self->_userEndOfDayDate;
    double v12 = -userEndOfDayDate;
    if (userEndOfDayDate >= 0.0) {
      double v12 = self->_userEndOfDayDate;
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
  if (has)
  {
    double expirationDate = self->_expirationDate;
    double v17 = -expirationDate;
    if (expirationDate >= 0.0) {
      double v17 = self->_expirationDate;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  unint64_t v20 = v9 ^ v4 ^ v10 ^ v15 ^ [(FCCAlmostThereConfigurationProtobuf *)self->_almostThereConfiguration hash];
  unint64_t v21 = [(FCCAtypicalDayConfigurationProtobuf *)self->_atypicalDayConfiguration hash];
  return v20 ^ v21 ^ [(FCCCompletionOffTrackConfigurationProtobuf *)self->_completionOffTrackConfiguration hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 60);
  if ((v6 & 8) != 0)
  {
    self->_minimumNumberOfActiveDays = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 8u;
    char v6 = *((unsigned char *)v4 + 60);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_double userStartOfDayDate = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v6 = *((unsigned char *)v4 + 60);
  if ((v6 & 2) == 0)
  {
LABEL_4:
    if ((v6 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_double userEndOfDayDate = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 60))
  {
LABEL_5:
    self->_double expirationDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_6:
  almostThereConfiguration = self->_almostThereConfiguration;
  uint64_t v8 = v5[4];
  long double v13 = v5;
  if (almostThereConfiguration)
  {
    if (!v8) {
      goto LABEL_16;
    }
    -[FCCAlmostThereConfigurationProtobuf mergeFrom:](almostThereConfiguration, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_16;
    }
    -[FCCGoalProgressConfigurationProtobuf setAlmostThereConfiguration:](self, "setAlmostThereConfiguration:");
  }
  uint64_t v5 = v13;
LABEL_16:
  atypicalDayConfiguration = self->_atypicalDayConfiguration;
  uint64_t v10 = v5[5];
  if (atypicalDayConfiguration)
  {
    if (!v10) {
      goto LABEL_22;
    }
    -[FCCAtypicalDayConfigurationProtobuf mergeFrom:](atypicalDayConfiguration, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_22;
    }
    -[FCCGoalProgressConfigurationProtobuf setAtypicalDayConfiguration:](self, "setAtypicalDayConfiguration:");
  }
  uint64_t v5 = v13;
LABEL_22:
  completionOffTrackConfiguration = self->_completionOffTrackConfiguration;
  uint64_t v12 = v5[6];
  if (completionOffTrackConfiguration)
  {
    if (v12) {
      -[FCCCompletionOffTrackConfigurationProtobuf mergeFrom:](completionOffTrackConfiguration, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[FCCGoalProgressConfigurationProtobuf setCompletionOffTrackConfiguration:](self, "setCompletionOffTrackConfiguration:");
  }
  MEMORY[0x1F41817F8]();
}

- (int)minimumNumberOfActiveDays
{
  return self->_minimumNumberOfActiveDays;
}

- (double)userStartOfDayDate
{
  return self->_userStartOfDayDate;
}

- (double)userEndOfDayDate
{
  return self->_userEndOfDayDate;
}

- (double)expirationDate
{
  return self->_expirationDate;
}

- (FCCAlmostThereConfigurationProtobuf)almostThereConfiguration
{
  return self->_almostThereConfiguration;
}

- (void)setAlmostThereConfiguration:(id)a3
{
}

- (FCCAtypicalDayConfigurationProtobuf)atypicalDayConfiguration
{
  return self->_atypicalDayConfiguration;
}

- (void)setAtypicalDayConfiguration:(id)a3
{
}

- (FCCCompletionOffTrackConfigurationProtobuf)completionOffTrackConfiguration
{
  return self->_completionOffTrackConfiguration;
}

- (void)setCompletionOffTrackConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionOffTrackConfiguration, 0);
  objc_storeStrong((id *)&self->_atypicalDayConfiguration, 0);
  objc_storeStrong((id *)&self->_almostThereConfiguration, 0);
}

@end