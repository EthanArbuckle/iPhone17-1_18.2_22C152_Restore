@interface FCCAtypicalDayConfigurationProtobuf
- (BOOL)hasIdentifier;
- (BOOL)hasMinimumAheadPercentage;
- (BOOL)hasMinimumBehindPercentage;
- (BOOL)hasPercentageOfDayRule;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FCCPercentageOfDayRuleProtobuf)percentageOfDayRule;
- (NSString)identifier;
- (double)minimumAheadPercentage;
- (double)minimumBehindPercentage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)allowedGoalTypes;
- (int)allowedGoalTypesAtIndex:(unint64_t)a3;
- (unint64_t)allowedGoalTypesCount;
- (unint64_t)hash;
- (void)addAllowedGoalTypes:(int)a3;
- (void)clearAllowedGoalTypes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAllowedGoalTypes:(int *)a3 count:(unint64_t)a4;
- (void)setHasMinimumAheadPercentage:(BOOL)a3;
- (void)setHasMinimumBehindPercentage:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setMinimumAheadPercentage:(double)a3;
- (void)setMinimumBehindPercentage:(double)a3;
- (void)setPercentageOfDayRule:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FCCAtypicalDayConfigurationProtobuf

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)FCCAtypicalDayConfigurationProtobuf;
  [(FCCAtypicalDayConfigurationProtobuf *)&v3 dealloc];
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setMinimumAheadPercentage:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_minimumAheadPercentage = a3;
}

- (void)setHasMinimumAheadPercentage:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMinimumAheadPercentage
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMinimumBehindPercentage:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_minimumBehindPercentage = a3;
}

- (void)setHasMinimumBehindPercentage:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinimumBehindPercentage
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasPercentageOfDayRule
{
  return self->_percentageOfDayRule != 0;
}

- (unint64_t)allowedGoalTypesCount
{
  return self->_allowedGoalTypes.count;
}

- (int)allowedGoalTypes
{
  return self->_allowedGoalTypes.list;
}

- (void)clearAllowedGoalTypes
{
}

- (void)addAllowedGoalTypes:(int)a3
{
}

- (int)allowedGoalTypesAtIndex:(unint64_t)a3
{
  p_allowedGoalTypes = &self->_allowedGoalTypes;
  unint64_t count = self->_allowedGoalTypes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_allowedGoalTypes->list[a3];
}

- (void)setAllowedGoalTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCAtypicalDayConfigurationProtobuf;
  v4 = [(FCCAtypicalDayConfigurationProtobuf *)&v8 description];
  v5 = [(FCCAtypicalDayConfigurationProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v7 = [NSNumber numberWithDouble:self->_minimumAheadPercentage];
    [v4 setObject:v7 forKey:@"minimumAheadPercentage"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_minimumBehindPercentage];
    [v4 setObject:v8 forKey:@"minimumBehindPercentage"];
  }
  percentageOfDayRule = self->_percentageOfDayRule;
  if (percentageOfDayRule)
  {
    v10 = [(FCCPercentageOfDayRuleProtobuf *)percentageOfDayRule dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"percentageOfDayRule"];
  }
  v11 = PBRepeatedInt32NSArray();
  [v4 setObject:v11 forKey:@"allowedGoalTypes"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FCCAtypicalDayConfigurationProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v8;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v8;
  }
  if (self->_percentageOfDayRule)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  p_allowedGoalTypes = &self->_allowedGoalTypes;
  if (p_allowedGoalTypes->count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v8;
      ++v7;
    }
    while (v7 < p_allowedGoalTypes->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v9;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 4) = *(void *)&self->_minimumAheadPercentage;
    *((unsigned char *)v4 + 64) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v4 + 5) = *(void *)&self->_minimumBehindPercentage;
    *((unsigned char *)v4 + 64) |= 2u;
  }
  if (self->_percentageOfDayRule) {
    objc_msgSend(v9, "setPercentageOfDayRule:");
  }
  if ([(FCCAtypicalDayConfigurationProtobuf *)self allowedGoalTypesCount])
  {
    [v9 clearAllowedGoalTypes];
    unint64_t v6 = [(FCCAtypicalDayConfigurationProtobuf *)self allowedGoalTypesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        objc_msgSend(v9, "addAllowedGoalTypes:", -[FCCAtypicalDayConfigurationProtobuf allowedGoalTypesAtIndex:](self, "allowedGoalTypesAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 32) = self->_minimumAheadPercentage;
    *(unsigned char *)(v5 + 64) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 40) = self->_minimumBehindPercentage;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
  id v9 = [(FCCPercentageOfDayRuleProtobuf *)self->_percentageOfDayRule copyWithZone:a3];
  v10 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v9;

  PBRepeatedInt32Copy();
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_minimumAheadPercentage != *((double *)v4 + 4)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_17:
    char IsEqual = 0;
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_minimumBehindPercentage != *((double *)v4 + 5)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_17;
  }
  percentageOfDayRule = self->_percentageOfDayRule;
  if ((unint64_t)percentageOfDayRule | *((void *)v4 + 7)
    && !-[FCCPercentageOfDayRuleProtobuf isEqual:](percentageOfDayRule, "isEqual:"))
  {
    goto LABEL_17;
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_18:

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  char has = (char)self->_has;
  if (has)
  {
    double minimumAheadPercentage = self->_minimumAheadPercentage;
    double v7 = -minimumAheadPercentage;
    if (minimumAheadPercentage >= 0.0) {
      double v7 = self->_minimumAheadPercentage;
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
  if ((has & 2) != 0)
  {
    double minimumBehindPercentage = self->_minimumBehindPercentage;
    double v12 = -minimumBehindPercentage;
    if (minimumBehindPercentage >= 0.0) {
      double v12 = self->_minimumBehindPercentage;
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
  unint64_t v15 = v5 ^ v3 ^ v10 ^ [(FCCPercentageOfDayRuleProtobuf *)self->_percentageOfDayRule hash];
  return v15 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = (double *)a3;
  v11 = v4;
  if (*((void *)v4 + 6))
  {
    -[FCCAtypicalDayConfigurationProtobuf setIdentifier:](self, "setIdentifier:");
    id v4 = v11;
  }
  char v5 = *((unsigned char *)v4 + 64);
  if (v5)
  {
    self->_double minimumAheadPercentage = v4[4];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 64);
  }
  if ((v5 & 2) != 0)
  {
    self->_double minimumBehindPercentage = v4[5];
    *(unsigned char *)&self->_has |= 2u;
  }
  percentageOfDayRule = self->_percentageOfDayRule;
  uint64_t v7 = *((void *)v4 + 7);
  if (percentageOfDayRule)
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[FCCPercentageOfDayRuleProtobuf mergeFrom:](percentageOfDayRule, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[FCCAtypicalDayConfigurationProtobuf setPercentageOfDayRule:](self, "setPercentageOfDayRule:");
  }
  id v4 = v11;
LABEL_13:
  uint64_t v8 = [v4 allowedGoalTypesCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t i = 0; i != v9; ++i)
      -[FCCAtypicalDayConfigurationProtobuf addAllowedGoalTypes:](self, "addAllowedGoalTypes:", [v11 allowedGoalTypesAtIndex:i]);
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)minimumAheadPercentage
{
  return self->_minimumAheadPercentage;
}

- (double)minimumBehindPercentage
{
  return self->_minimumBehindPercentage;
}

- (FCCPercentageOfDayRuleProtobuf)percentageOfDayRule
{
  return self->_percentageOfDayRule;
}

- (void)setPercentageOfDayRule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentageOfDayRule, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end