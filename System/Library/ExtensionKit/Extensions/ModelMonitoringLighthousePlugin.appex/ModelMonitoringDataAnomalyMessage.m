@interface ModelMonitoringDataAnomalyMessage
+ (Class)dataStatesType;
- (BOOL)hasAnomalyType;
- (BOOL)hasOccuranceCount;
- (BOOL)hasTotalEventCount;
- (BOOL)hasTrialIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ModelMonitoringDataTrialIdentifier)trialIdentifier;
- (NSMutableArray)dataStates;
- (id)anomalyTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataStatesAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAnomalyType:(id)a3;
- (int)anomalyType;
- (int)occuranceCount;
- (int)totalEventCount;
- (unint64_t)dataStatesCount;
- (unint64_t)hash;
- (void)addDataStates:(id)a3;
- (void)clearDataStates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnomalyType:(int)a3;
- (void)setDataStates:(id)a3;
- (void)setHasAnomalyType:(BOOL)a3;
- (void)setHasOccuranceCount:(BOOL)a3;
- (void)setHasTotalEventCount:(BOOL)a3;
- (void)setOccuranceCount:(int)a3;
- (void)setTotalEventCount:(int)a3;
- (void)setTrialIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ModelMonitoringDataAnomalyMessage

- (int)anomalyType
{
  if (*(unsigned char *)&self->_has) {
    return self->_anomalyType;
  }
  else {
    return 0;
  }
}

- (void)setAnomalyType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_anomalyType = a3;
}

- (void)setHasAnomalyType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAnomalyType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)anomalyTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_10000C690[a3];
  }

  return v3;
}

- (int)StringAsAnomalyType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MODEL_SCORE_DISTRIBUTION_IN_EVENT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MODEL_SCORE_MEAN_LOCAL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MODEL_SCORE_ENTROPY_LOCAL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MODEL_SCORE_MEAN_GLOBAL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MODEL_SCORE_ENTROPY_GLOBAL"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setOccuranceCount:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_occuranceCount = a3;
}

- (void)setHasOccuranceCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOccuranceCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTotalEventCount:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_totalEventCount = a3;
}

- (void)setHasTotalEventCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalEventCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasTrialIdentifier
{
  return self->_trialIdentifier != 0;
}

- (void)clearDataStates
{
}

- (void)addDataStates:(id)a3
{
  id v4 = a3;
  dataStates = self->_dataStates;
  id v8 = v4;
  if (!dataStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_dataStates;
    self->_dataStates = v6;

    id v4 = v8;
    dataStates = self->_dataStates;
  }
  [(NSMutableArray *)dataStates addObject:v4];
}

- (unint64_t)dataStatesCount
{
  return (unint64_t)[(NSMutableArray *)self->_dataStates count];
}

- (id)dataStatesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_dataStates objectAtIndex:a3];
}

+ (Class)dataStatesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ModelMonitoringDataAnomalyMessage;
  char v3 = [(ModelMonitoringDataAnomalyMessage *)&v7 description];
  id v4 = [(ModelMonitoringDataAnomalyMessage *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t anomalyType = self->_anomalyType;
    if (anomalyType >= 6)
    {
      v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_anomalyType];
    }
    else
    {
      v6 = off_10000C690[anomalyType];
    }
    [v3 setObject:v6 forKey:@"anomalyType"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithInt:self->_occuranceCount];
    [v3 setObject:v7 forKey:@"occuranceCount"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    id v8 = +[NSNumber numberWithInt:self->_totalEventCount];
    [v3 setObject:v8 forKey:@"totalEventCount"];
  }
  trialIdentifier = self->_trialIdentifier;
  if (trialIdentifier)
  {
    v10 = [(ModelMonitoringDataTrialIdentifier *)trialIdentifier dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"trialIdentifier"];
  }
  if ([(NSMutableArray *)self->_dataStates count])
  {
    id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_dataStates, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = self->_dataStates;
    id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v19 + 1) + 8 * i) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"dataStates"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ModelMonitoringDataAnomalyMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_trialIdentifier) {
    PBDataWriterWriteSubmessage();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_dataStates;
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
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_anomalyType;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_occuranceCount;
  *((unsigned char *)v4 + 40) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[7] = self->_totalEventCount;
    *((unsigned char *)v4 + 40) |= 4u;
  }
LABEL_5:
  id v10 = v4;
  if (self->_trialIdentifier) {
    objc_msgSend(v4, "setTrialIdentifier:");
  }
  if ([(ModelMonitoringDataAnomalyMessage *)self dataStatesCount])
  {
    [v10 clearDataStates];
    unint64_t v6 = [(ModelMonitoringDataAnomalyMessage *)self dataStatesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(ModelMonitoringDataAnomalyMessage *)self dataStatesAtIndex:i];
        [v10 addDataStates:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 2) = self->_anomalyType;
    *((unsigned char *)v5 + 40) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 6) = self->_occuranceCount;
  *((unsigned char *)v5 + 40) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 7) = self->_totalEventCount;
    *((unsigned char *)v5 + 40) |= 4u;
  }
LABEL_5:
  id v8 = [(ModelMonitoringDataTrialIdentifier *)self->_trialIdentifier copyWithZone:a3];
  uint64_t v9 = (void *)v6[4];
  v6[4] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = self->_dataStates;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
        [v6 addDataStates:v15];
      }
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_anomalyType != *((_DWORD *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_21:
    unsigned __int8 v7 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_occuranceCount != *((_DWORD *)v4 + 6)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_totalEventCount != *((_DWORD *)v4 + 7)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_21;
  }
  trialIdentifier = self->_trialIdentifier;
  if ((unint64_t)trialIdentifier | *((void *)v4 + 4)
    && !-[ModelMonitoringDataTrialIdentifier isEqual:](trialIdentifier, "isEqual:"))
  {
    goto LABEL_21;
  }
  dataStates = self->_dataStates;
  if ((unint64_t)dataStates | *((void *)v4 + 2)) {
    unsigned __int8 v7 = -[NSMutableArray isEqual:](dataStates, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = 2654435761 * self->_anomalyType;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_occuranceCount;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_totalEventCount;
LABEL_8:
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(ModelMonitoringDataTrialIdentifier *)self->_trialIdentifier hash];
  return v6 ^ (unint64_t)[(NSMutableArray *)self->_dataStates hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 40);
  if (v6)
  {
    self->_uint64_t anomalyType = v4[2];
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 40);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v4[10] & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_occuranceCount = v4[6];
  *(unsigned char *)&self->_has |= 2u;
  if ((v4[10] & 4) != 0)
  {
LABEL_4:
    self->_totalEventCount = v4[7];
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  trialIdentifier = self->_trialIdentifier;
  uint64_t v8 = *((void *)v5 + 4);
  if (trialIdentifier)
  {
    if (v8) {
      -[ModelMonitoringDataTrialIdentifier mergeFrom:](trialIdentifier, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[ModelMonitoringDataAnomalyMessage setTrialIdentifier:](self, "setTrialIdentifier:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *((id *)v5 + 2);
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
        -[ModelMonitoringDataAnomalyMessage addDataStates:](self, "addDataStates:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (int)occuranceCount
{
  return self->_occuranceCount;
}

- (int)totalEventCount
{
  return self->_totalEventCount;
}

- (ModelMonitoringDataTrialIdentifier)trialIdentifier
{
  return self->_trialIdentifier;
}

- (void)setTrialIdentifier:(id)a3
{
}

- (NSMutableArray)dataStates
{
  return self->_dataStates;
}

- (void)setDataStates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialIdentifier, 0);

  objc_storeStrong((id *)&self->_dataStates, 0);
}

@end