@interface FCCAlmostThereConfigurationProtobuf
+ (Class)coalescingRulesType;
- (BOOL)hasGoalBufferPercentage;
- (BOOL)hasGoalType;
- (BOOL)hasIdentifier;
- (BOOL)hasMinimumPercentageComplete;
- (BOOL)hasTimeOfDayRule;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FCCTimeOfDayRuleProtobuf)timeOfDayRule;
- (NSMutableArray)coalescingRules;
- (NSString)identifier;
- (double)goalBufferPercentage;
- (double)minimumPercentageComplete;
- (id)coalescingRulesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)goalType;
- (unint64_t)coalescingRulesCount;
- (unint64_t)hash;
- (void)addCoalescingRules:(id)a3;
- (void)clearCoalescingRules;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCoalescingRules:(id)a3;
- (void)setGoalBufferPercentage:(double)a3;
- (void)setGoalType:(int)a3;
- (void)setHasGoalBufferPercentage:(BOOL)a3;
- (void)setHasGoalType:(BOOL)a3;
- (void)setHasMinimumPercentageComplete:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setMinimumPercentageComplete:(double)a3;
- (void)setTimeOfDayRule:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FCCAlmostThereConfigurationProtobuf

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setMinimumPercentageComplete:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_minimumPercentageComplete = a3;
}

- (void)setHasMinimumPercentageComplete:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinimumPercentageComplete
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setGoalBufferPercentage:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_goalBufferPercentage = a3;
}

- (void)setHasGoalBufferPercentage:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGoalBufferPercentage
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearCoalescingRules
{
}

- (void)addCoalescingRules:(id)a3
{
  id v4 = a3;
  coalescingRules = self->_coalescingRules;
  id v8 = v4;
  if (!coalescingRules)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_coalescingRules;
    self->_coalescingRules = v6;

    id v4 = v8;
    coalescingRules = self->_coalescingRules;
  }
  [(NSMutableArray *)coalescingRules addObject:v4];
}

- (unint64_t)coalescingRulesCount
{
  return [(NSMutableArray *)self->_coalescingRules count];
}

- (id)coalescingRulesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_coalescingRules objectAtIndex:a3];
}

+ (Class)coalescingRulesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTimeOfDayRule
{
  return self->_timeOfDayRule != 0;
}

- (void)setGoalType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_goalType = a3;
}

- (void)setHasGoalType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasGoalType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCAlmostThereConfigurationProtobuf;
  id v4 = [(FCCAlmostThereConfigurationProtobuf *)&v8 description];
  v5 = [(FCCAlmostThereConfigurationProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithDouble:self->_minimumPercentageComplete];
    [v4 setObject:v7 forKey:@"minimumPercentageComplete"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_goalBufferPercentage];
    [v4 setObject:v8 forKey:@"goalBufferPercentage"];
  }
  if ([(NSMutableArray *)self->_coalescingRules count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_coalescingRules, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v10 = self->_coalescingRules;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    [v4 setObject:v9 forKey:@"coalescingRules"];
  }
  timeOfDayRule = self->_timeOfDayRule;
  if (timeOfDayRule)
  {
    v17 = [(FCCTimeOfDayRuleProtobuf *)timeOfDayRule dictionaryRepresentation];
    [v4 setObject:v17 forKey:@"timeOfDayRule"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v18 = [NSNumber numberWithInt:self->_goalType];
    [v4 setObject:v18 forKey:@"goalType"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FCCAlmostThereConfigurationProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteDoubleField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_coalescingRules;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (self->_timeOfDayRule) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_minimumPercentageComplete;
    *((unsigned char *)v4 + 56) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_goalBufferPercentage;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  if ([(FCCAlmostThereConfigurationProtobuf *)self coalescingRulesCount])
  {
    [v10 clearCoalescingRules];
    unint64_t v6 = [(FCCAlmostThereConfigurationProtobuf *)self coalescingRulesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(FCCAlmostThereConfigurationProtobuf *)self coalescingRulesAtIndex:i];
        [v10 addCoalescingRules:v9];
      }
    }
  }
  if (self->_timeOfDayRule) {
    objc_msgSend(v10, "setTimeOfDayRule:");
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v10 + 8) = self->_goalType;
    *((unsigned char *)v10 + 56) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_minimumPercentageComplete;
    *(unsigned char *)(v5 + 56) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_goalBufferPercentage;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = self->_coalescingRules;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addCoalescingRules:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  id v15 = [(FCCTimeOfDayRuleProtobuf *)self->_timeOfDayRule copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_goalType;
    *(unsigned char *)(v5 + 56) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_22;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_minimumPercentageComplete != *((double *)v4 + 2)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
LABEL_22:
    BOOL v8 = 0;
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_goalBufferPercentage != *((double *)v4 + 1)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_22;
  }
  coalescingRules = self->_coalescingRules;
  if ((unint64_t)coalescingRules | *((void *)v4 + 3)
    && !-[NSMutableArray isEqual:](coalescingRules, "isEqual:"))
  {
    goto LABEL_22;
  }
  timeOfDayRule = self->_timeOfDayRule;
  if ((unint64_t)timeOfDayRule | *((void *)v4 + 6))
  {
    if (!-[FCCTimeOfDayRuleProtobuf isEqual:](timeOfDayRule, "isEqual:")) {
      goto LABEL_22;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 56) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_goalType != *((_DWORD *)v4 + 8)) {
      goto LABEL_22;
    }
    BOOL v8 = 1;
  }
LABEL_23:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double minimumPercentageComplete = self->_minimumPercentageComplete;
    double v7 = -minimumPercentageComplete;
    if (minimumPercentageComplete >= 0.0) {
      double v7 = self->_minimumPercentageComplete;
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
  if (has)
  {
    double goalBufferPercentage = self->_goalBufferPercentage;
    double v12 = -goalBufferPercentage;
    if (goalBufferPercentage >= 0.0) {
      double v12 = self->_goalBufferPercentage;
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
  uint64_t v15 = [(NSMutableArray *)self->_coalescingRules hash];
  unint64_t v16 = [(FCCTimeOfDayRuleProtobuf *)self->_timeOfDayRule hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v17 = 2654435761 * self->_goalType;
  }
  else {
    uint64_t v17 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 5)) {
    -[FCCAlmostThereConfigurationProtobuf setIdentifier:](self, "setIdentifier:");
  }
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 2) != 0)
  {
    self->_double minimumPercentageComplete = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 56);
  }
  if (v5)
  {
    self->_double goalBufferPercentage = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = *((id *)v4 + 3);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        -[FCCAlmostThereConfigurationProtobuf addCoalescingRules:](self, "addCoalescingRules:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  timeOfDayRule = self->_timeOfDayRule;
  uint64_t v12 = *((void *)v4 + 6);
  if (timeOfDayRule)
  {
    if (v12) {
      -[FCCTimeOfDayRuleProtobuf mergeFrom:](timeOfDayRule, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[FCCAlmostThereConfigurationProtobuf setTimeOfDayRule:](self, "setTimeOfDayRule:");
  }
  if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    self->_goalType = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)minimumPercentageComplete
{
  return self->_minimumPercentageComplete;
}

- (double)goalBufferPercentage
{
  return self->_goalBufferPercentage;
}

- (NSMutableArray)coalescingRules
{
  return self->_coalescingRules;
}

- (void)setCoalescingRules:(id)a3
{
}

- (FCCTimeOfDayRuleProtobuf)timeOfDayRule
{
  return self->_timeOfDayRule;
}

- (void)setTimeOfDayRule:(id)a3
{
}

- (int)goalType
{
  return self->_goalType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOfDayRule, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_coalescingRules, 0);
}

@end