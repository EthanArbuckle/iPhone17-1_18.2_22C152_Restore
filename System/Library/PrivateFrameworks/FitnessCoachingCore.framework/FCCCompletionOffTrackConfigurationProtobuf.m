@interface FCCCompletionOffTrackConfigurationProtobuf
+ (Class)coalescingRulesType;
- (BOOL)hasGoalBufferPercentage;
- (BOOL)hasIdentifier;
- (BOOL)hasPercentageOfDayRule;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FCCPercentageOfDayRuleProtobuf)percentageOfDayRule;
- (NSMutableArray)coalescingRules;
- (NSString)identifier;
- (double)goalBufferPercentage;
- (id)coalescingRulesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)allowedGoalTypes;
- (int)allowedGoalTypesAtIndex:(unint64_t)a3;
- (unint64_t)allowedGoalTypesCount;
- (unint64_t)coalescingRulesCount;
- (unint64_t)hash;
- (void)addAllowedGoalTypes:(int)a3;
- (void)addCoalescingRules:(id)a3;
- (void)clearAllowedGoalTypes;
- (void)clearCoalescingRules;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAllowedGoalTypes:(int *)a3 count:(unint64_t)a4;
- (void)setCoalescingRules:(id)a3;
- (void)setGoalBufferPercentage:(double)a3;
- (void)setHasGoalBufferPercentage:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setPercentageOfDayRule:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FCCCompletionOffTrackConfigurationProtobuf

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)FCCCompletionOffTrackConfigurationProtobuf;
  [(FCCCompletionOffTrackConfigurationProtobuf *)&v3 dealloc];
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
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
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
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
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCCompletionOffTrackConfigurationProtobuf;
  id v4 = [(FCCCompletionOffTrackConfigurationProtobuf *)&v8 description];
  v5 = [(FCCCompletionOffTrackConfigurationProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithDouble:self->_goalBufferPercentage];
    [v4 setObject:v6 forKey:@"goalBufferPercentage"];
  }
  if ([(NSMutableArray *)self->_coalescingRules count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_coalescingRules, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v8 = self->_coalescingRules;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"coalescingRules"];
  }
  percentageOfDayRule = self->_percentageOfDayRule;
  if (percentageOfDayRule)
  {
    v15 = [(FCCPercentageOfDayRuleProtobuf *)percentageOfDayRule dictionaryRepresentation];
    [v4 setObject:v15 forKey:@"percentageOfDayRule"];
  }
  v16 = PBRepeatedInt32NSArray();
  [v4 setObject:v16 forKey:@"allowedGoalTypes"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FCCCompletionOffTrackConfigurationProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_coalescingRules;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  if (self->_percentageOfDayRule) {
    PBDataWriterWriteSubmessage();
  }
  p_allowedGoalTypes = &self->_allowedGoalTypes;
  if (p_allowedGoalTypes->count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v11;
    }
    while (v11 < p_allowedGoalTypes->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v12;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 4) = *(void *)&self->_goalBufferPercentage;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  if ([(FCCCompletionOffTrackConfigurationProtobuf *)self coalescingRulesCount])
  {
    [v12 clearCoalescingRules];
    unint64_t v5 = [(FCCCompletionOffTrackConfigurationProtobuf *)self coalescingRulesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(FCCCompletionOffTrackConfigurationProtobuf *)self coalescingRulesAtIndex:i];
        [v12 addCoalescingRules:v8];
      }
    }
  }
  if (self->_percentageOfDayRule) {
    objc_msgSend(v12, "setPercentageOfDayRule:");
  }
  if ([(FCCCompletionOffTrackConfigurationProtobuf *)self allowedGoalTypesCount])
  {
    [v12 clearAllowedGoalTypes];
    unint64_t v9 = [(FCCCompletionOffTrackConfigurationProtobuf *)self allowedGoalTypesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        objc_msgSend(v12, "addAllowedGoalTypes:", -[FCCCompletionOffTrackConfigurationProtobuf allowedGoalTypesAtIndex:](self, "allowedGoalTypesAtIndex:", j));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 32) = self->_goalBufferPercentage;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = self->_coalescingRules;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (void)v17);
        [(id)v5 addCoalescingRules:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  id v14 = [(FCCPercentageOfDayRuleProtobuf *)self->_percentageOfDayRule copyWithZone:a3];
  long long v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  PBRepeatedInt32Copy();
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_14;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_goalBufferPercentage != *((double *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_14:
    char IsEqual = 0;
    goto LABEL_15;
  }
  coalescingRules = self->_coalescingRules;
  if ((unint64_t)coalescingRules | *((void *)v4 + 5)
    && !-[NSMutableArray isEqual:](coalescingRules, "isEqual:"))
  {
    goto LABEL_14;
  }
  percentageOfDayRule = self->_percentageOfDayRule;
  if ((unint64_t)percentageOfDayRule | *((void *)v4 + 7))
  {
    if (!-[FCCPercentageOfDayRuleProtobuf isEqual:](percentageOfDayRule, "isEqual:")) {
      goto LABEL_14;
    }
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_15:

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  if (*(unsigned char *)&self->_has)
  {
    double goalBufferPercentage = self->_goalBufferPercentage;
    double v6 = -goalBufferPercentage;
    if (goalBufferPercentage >= 0.0) {
      double v6 = self->_goalBufferPercentage;
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
  unint64_t v9 = v4 ^ v3;
  uint64_t v10 = [(NSMutableArray *)self->_coalescingRules hash];
  unint64_t v11 = v9 ^ v10 ^ [(FCCPercentageOfDayRuleProtobuf *)self->_percentageOfDayRule hash];
  return v11 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 6)) {
    -[FCCCompletionOffTrackConfigurationProtobuf setIdentifier:](self, "setIdentifier:");
  }
  if (*((unsigned char *)v4 + 64))
  {
    self->_double goalBufferPercentage = *((double *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = *((id *)v4 + 5);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        -[FCCCompletionOffTrackConfigurationProtobuf addCoalescingRules:](self, "addCoalescingRules:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  percentageOfDayRule = self->_percentageOfDayRule;
  uint64_t v11 = *((void *)v4 + 7);
  if (percentageOfDayRule)
  {
    if (v11) {
      -[FCCPercentageOfDayRuleProtobuf mergeFrom:](percentageOfDayRule, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[FCCCompletionOffTrackConfigurationProtobuf setPercentageOfDayRule:](self, "setPercentageOfDayRule:");
  }
  uint64_t v12 = objc_msgSend(v4, "allowedGoalTypesCount", (void)v15);
  if (v12)
  {
    uint64_t v13 = v12;
    for (uint64_t j = 0; j != v13; ++j)
      -[FCCCompletionOffTrackConfigurationProtobuf addAllowedGoalTypes:](self, "addAllowedGoalTypes:", [v4 allowedGoalTypesAtIndex:j]);
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
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
  objc_storeStrong((id *)&self->_coalescingRules, 0);
}

@end