@interface ATXPBDigestTimeline
- (BOOL)hasDigestRemovedTimestamp;
- (BOOL)hasFirstCollapsedViewTimestamp;
- (BOOL)hasFirstScheduledViewTimestamp;
- (BOOL)hasFirstUpcomingViewTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)digestRemovedTimestamp;
- (double)firstCollapsedViewTimestamp;
- (double)firstScheduledViewTimestamp;
- (double)firstUpcomingViewTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDigestRemovedTimestamp:(double)a3;
- (void)setFirstCollapsedViewTimestamp:(double)a3;
- (void)setFirstScheduledViewTimestamp:(double)a3;
- (void)setFirstUpcomingViewTimestamp:(double)a3;
- (void)setHasDigestRemovedTimestamp:(BOOL)a3;
- (void)setHasFirstCollapsedViewTimestamp:(BOOL)a3;
- (void)setHasFirstScheduledViewTimestamp:(BOOL)a3;
- (void)setHasFirstUpcomingViewTimestamp:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBDigestTimeline

- (void)setFirstUpcomingViewTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_firstUpcomingViewTimestamp = a3;
}

- (void)setHasFirstUpcomingViewTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFirstUpcomingViewTimestamp
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setFirstCollapsedViewTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_firstCollapsedViewTimestamp = a3;
}

- (void)setHasFirstCollapsedViewTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFirstCollapsedViewTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setFirstScheduledViewTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_firstScheduledViewTimestamp = a3;
}

- (void)setHasFirstScheduledViewTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFirstScheduledViewTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDigestRemovedTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_digestRemovedTimestamp = a3;
}

- (void)setHasDigestRemovedTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDigestRemovedTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBDigestTimeline;
  v4 = [(ATXPBDigestTimeline *)&v8 description];
  v5 = [(ATXPBDigestTimeline *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v7 = [NSNumber numberWithDouble:self->_firstUpcomingViewTimestamp];
    [v3 setObject:v7 forKey:@"firstUpcomingViewTimestamp"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithDouble:self->_firstCollapsedViewTimestamp];
  [v3 setObject:v8 forKey:@"firstCollapsedViewTimestamp"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v9 = [NSNumber numberWithDouble:self->_firstScheduledViewTimestamp];
  [v3 setObject:v9 forKey:@"firstScheduledViewTimestamp"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    v5 = [NSNumber numberWithDouble:self->_digestRemovedTimestamp];
    [v3 setObject:v5 forKey:@"digestRemovedTimestamp"];
  }
LABEL_6:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBDigestTimelineReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteDoubleField();
  if (*(unsigned char *)&self->_has) {
LABEL_5:
  }
    PBDataWriterWriteDoubleField();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = *(void *)&self->_firstUpcomingViewTimestamp;
    *((unsigned char *)v4 + 40) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = *(void *)&self->_firstCollapsedViewTimestamp;
  *((unsigned char *)v4 + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v4[3] = *(void *)&self->_firstScheduledViewTimestamp;
  *((unsigned char *)v4 + 40) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    v4[1] = *(void *)&self->_digestRemovedTimestamp;
    *((unsigned char *)v4 + 40) |= 1u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)result + 4) = *(void *)&self->_firstUpcomingViewTimestamp;
    *((unsigned char *)result + 40) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = *(void *)&self->_firstCollapsedViewTimestamp;
  *((unsigned char *)result + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((void *)result + 3) = *(void *)&self->_firstScheduledViewTimestamp;
  *((unsigned char *)result + 40) |= 4u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_5:
  *((void *)result + 1) = *(void *)&self->_digestRemovedTimestamp;
  *((unsigned char *)result + 40) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_firstUpcomingViewTimestamp != *((double *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_firstCollapsedViewTimestamp != *((double *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_firstScheduledViewTimestamp != *((double *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_digestRemovedTimestamp != *((double *)v4 + 1)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    double firstUpcomingViewTimestamp = self->_firstUpcomingViewTimestamp;
    double v6 = -firstUpcomingViewTimestamp;
    if (firstUpcomingViewTimestamp >= 0.0) {
      double v6 = self->_firstUpcomingViewTimestamp;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 2) != 0)
  {
    double firstCollapsedViewTimestamp = self->_firstCollapsedViewTimestamp;
    double v11 = -firstCollapsedViewTimestamp;
    if (firstCollapsedViewTimestamp >= 0.0) {
      double v11 = self->_firstCollapsedViewTimestamp;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 4) != 0)
  {
    double firstScheduledViewTimestamp = self->_firstScheduledViewTimestamp;
    double v16 = -firstScheduledViewTimestamp;
    if (firstScheduledViewTimestamp >= 0.0) {
      double v16 = self->_firstScheduledViewTimestamp;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if (has)
  {
    double digestRemovedTimestamp = self->_digestRemovedTimestamp;
    double v21 = -digestRemovedTimestamp;
    if (digestRemovedTimestamp >= 0.0) {
      double v21 = self->_digestRemovedTimestamp;
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
  return v9 ^ v4 ^ v14 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 8) != 0)
  {
    self->_double firstUpcomingViewTimestamp = *((double *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_double firstCollapsedViewTimestamp = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_double firstScheduledViewTimestamp = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 40))
  {
LABEL_5:
    self->_double digestRemovedTimestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_6:
}

- (double)firstUpcomingViewTimestamp
{
  return self->_firstUpcomingViewTimestamp;
}

- (double)firstCollapsedViewTimestamp
{
  return self->_firstCollapsedViewTimestamp;
}

- (double)firstScheduledViewTimestamp
{
  return self->_firstScheduledViewTimestamp;
}

- (double)digestRemovedTimestamp
{
  return self->_digestRemovedTimestamp;
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  char v5 = [(ATXPBDigestTimeline *)self init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      long double v7 = [v6 objectForKeyedSubscript:@"firstUpcomingViewTimestamp"];
      double v8 = +[ATXJSONHelper unwrapObject:v7];

      if (v8)
      {
        unint64_t v9 = [v6 objectForKeyedSubscript:@"firstUpcomingViewTimestamp"];
        v10 = +[ATXJSONHelper unwrapObject:v9];
        [v10 doubleValue];
        -[ATXPBDigestTimeline setFirstUpcomingViewTimestamp:](v5, "setFirstUpcomingViewTimestamp:");
      }
      double v11 = [v6 objectForKeyedSubscript:@"firstCollapsedViewTimestamp"];
      long double v12 = +[ATXJSONHelper unwrapObject:v11];

      if (v12)
      {
        double v13 = [v6 objectForKeyedSubscript:@"firstCollapsedViewTimestamp"];
        unint64_t v14 = +[ATXJSONHelper unwrapObject:v13];
        [v14 doubleValue];
        -[ATXPBDigestTimeline setFirstUpcomingViewTimestamp:](v5, "setFirstUpcomingViewTimestamp:");
      }
      v15 = [v6 objectForKeyedSubscript:@"firstScheduledViewTimestamp"];
      double v16 = +[ATXJSONHelper unwrapObject:v15];

      if (v16)
      {
        long double v17 = [v6 objectForKeyedSubscript:@"firstScheduledViewTimestamp"];
        double v18 = +[ATXJSONHelper unwrapObject:v17];
        [v18 doubleValue];
        -[ATXPBDigestTimeline setFirstUpcomingViewTimestamp:](v5, "setFirstUpcomingViewTimestamp:");
      }
      unint64_t v19 = [v6 objectForKeyedSubscript:@"digestRemovedTimestamp"];
      v20 = +[ATXJSONHelper unwrapObject:v19];

      if (v20)
      {
        double v21 = [v6 objectForKeyedSubscript:@"digestRemovedTimestamp"];
        long double v22 = +[ATXJSONHelper unwrapObject:v21];
        [v22 doubleValue];
        -[ATXPBDigestTimeline setFirstUpcomingViewTimestamp:](v5, "setFirstUpcomingViewTimestamp:");
      }
    }
  }

  return v5;
}

- (id)jsonRepresentation
{
  v23[4] = *MEMORY[0x1E4F143B8];
  v22[0] = @"firstUpcomingViewTimestamp";
  BOOL v21 = [(ATXPBDigestTimeline *)self hasFirstUpcomingViewTimestamp];
  if (v21)
  {
    char v3 = NSNumber;
    [(ATXPBDigestTimeline *)self firstUpcomingViewTimestamp];
    v20 = objc_msgSend(v3, "numberWithDouble:");
    uint64_t v4 = +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:");
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
    v20 = (void *)v4;
  }
  v23[0] = v4;
  v22[1] = @"firstCollapsedViewTimestamp";
  BOOL v18 = [(ATXPBDigestTimeline *)self hasFirstCollapsedViewTimestamp];
  if (v18)
  {
    char v5 = NSNumber;
    [(ATXPBDigestTimeline *)self firstCollapsedViewTimestamp];
    unint64_t v19 = objc_msgSend(v5, "numberWithDouble:");
    id v6 = +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:");
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
    unint64_t v19 = v6;
  }
  v23[1] = v6;
  v22[2] = @"firstScheduledViewTimestamp";
  BOOL v7 = [(ATXPBDigestTimeline *)self hasFirstScheduledViewTimestamp];
  uint64_t v8 = 0x1E5D03000uLL;
  if (v7)
  {
    unint64_t v9 = NSNumber;
    [(ATXPBDigestTimeline *)self firstScheduledViewTimestamp];
    v10 = objc_msgSend(v9, "numberWithDouble:");
    double v11 = +[ATXJSONHelper wrapObject:v10];
  }
  else
  {
    double v11 = [MEMORY[0x1E4F1CA98] null];
    v10 = v11;
  }
  v23[2] = v11;
  v22[3] = @"digestRemovedTimestamp";
  BOOL v12 = [(ATXPBDigestTimeline *)self hasDigestRemovedTimestamp];
  if (v12)
  {
    double v13 = NSNumber;
    [(ATXPBDigestTimeline *)self digestRemovedTimestamp];
    uint64_t v8 = objc_msgSend(v13, "numberWithDouble:");
    +[ATXJSONHelper wrapObject:v8];
  }
  else
  {
    [MEMORY[0x1E4F1CA98] null];
  unint64_t v14 = };
  v23[3] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];
  if (v12)
  {

    unint64_t v14 = (void *)v8;
  }

  if (v7) {
  if (v18)
  }

  if (v21) {

  }
  return v15;
}

@end