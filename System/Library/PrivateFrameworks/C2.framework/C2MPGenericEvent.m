@interface C2MPGenericEvent
+ (Class)metricType;
- (BOOL)hasName;
- (BOOL)hasTimestampEnd;
- (BOOL)hasTimestampStart;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)metrics;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)metricAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unint64_t)metricsCount;
- (unint64_t)timestampEnd;
- (unint64_t)timestampStart;
- (void)addMetric:(id)a3;
- (void)clearMetrics;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestampEnd:(BOOL)a3;
- (void)setHasTimestampStart:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setMetrics:(id)a3;
- (void)setName:(id)a3;
- (void)setTimestampEnd:(unint64_t)a3;
- (void)setTimestampStart:(unint64_t)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation C2MPGenericEvent

- (void)addMetric:(id)a3
{
  id v4 = a3;
  metrics = self->_metrics;
  id v8 = v4;
  if (!metrics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_metrics;
    self->_metrics = v6;

    id v4 = v8;
    metrics = self->_metrics;
  }
  [(NSMutableArray *)metrics addObject:v4];
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setTimestampStart:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestampStart = a3;
}

- (void)setTimestampEnd:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestampEnd = a3;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 > 200)
  {
    if (a3 == 201)
    {
      id v4 = @"cloudkit_client";
    }
    else
    {
      if (a3 != 301)
      {
LABEL_12:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      id v4 = @"server";
    }
  }
  else
  {
    if (a3)
    {
      if (a3 == 101)
      {
        id v4 = @"cloudkit";
        return v4;
      }
      goto LABEL_12;
    }
    id v4 = @"none";
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"none"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"cloudkit"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"cloudkit_client"])
  {
    int v4 = 201;
  }
  else if ([v3 isEqualToString:@"server"])
  {
    int v4 = 301;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setHasTimestampStart:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestampStart
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasTimestampEnd:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampEnd
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearMetrics
{
}

- (unint64_t)metricsCount
{
  return [(NSMutableArray *)self->_metrics count];
}

- (id)metricAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_metrics objectAtIndex:a3];
}

+ (Class)metricType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)C2MPGenericEvent;
  int v4 = [(C2MPGenericEvent *)&v8 description];
  v5 = [(C2MPGenericEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    int type = self->_type;
    if (type > 200)
    {
      if (type == 201)
      {
        v5 = @"cloudkit_client";
        goto LABEL_12;
      }
      if (type == 301)
      {
        v5 = @"server";
        goto LABEL_12;
      }
    }
    else
    {
      if (!type)
      {
        v5 = @"none";
        goto LABEL_12;
      }
      if (type == 101)
      {
        v5 = @"cloudkit";
LABEL_12:
        [v3 setObject:v5 forKey:@"type"];

        goto LABEL_13;
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_13:
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedLongLong:self->_timestampStart];
    [v3 setObject:v8 forKey:@"timestamp_start"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithUnsignedLongLong:self->_timestampEnd];
    [v3 setObject:v9 forKey:@"timestamp_end"];
  }
  if ([(NSMutableArray *)self->_metrics count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_metrics, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v11 = self->_metrics;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKey:@"metric"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return C2MPGenericEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint64Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_metrics;
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
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[10] = self->_type;
    *((unsigned char *)v4 + 44) |= 4u;
  }
  v10 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_timestampStart;
    *((unsigned char *)v4 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = self->_timestampEnd;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  if ([(C2MPGenericEvent *)self metricsCount])
  {
    [v10 clearMetrics];
    unint64_t v6 = [(C2MPGenericEvent *)self metricsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(C2MPGenericEvent *)self metricAtIndex:i];
        [v10 addMetric:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_type;
    *(unsigned char *)(v5 + 44) |= 4u;
  }
  uint64_t v7 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_timestampStart;
    *(unsigned char *)(v6 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v6 + 8) = self->_timestampEnd;
    *(unsigned char *)(v6 + 44) |= 1u;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v10 = self->_metrics;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
        [(id)v6 addMetric:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_type != *((_DWORD *)v4 + 10)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_22;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
    {
LABEL_22:
      char v8 = 0;
      goto LABEL_23;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_timestampStart != *((void *)v4 + 2)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_22;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_timestampEnd != *((void *)v4 + 1)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_22;
  }
  metrics = self->_metrics;
  if ((unint64_t)metrics | *((void *)v4 + 3)) {
    char v8 = -[NSMutableArray isEqual:](metrics, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_23:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_name hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v5 = 2654435761u * self->_timestampStart;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ [(NSMutableArray *)self->_metrics hash];
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v6 = 2654435761u * self->_timestampEnd;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSMutableArray *)self->_metrics hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = a3;
  id v5 = v4;
  if ((v4[11] & 4) != 0)
  {
    self->_int type = v4[10];
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 4)) {
    -[C2MPGenericEvent setName:](self, "setName:");
  }
  char v6 = *((unsigned char *)v5 + 44);
  if ((v6 & 2) != 0)
  {
    self->_timestampStart = *((void *)v5 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v5 + 44);
  }
  if (v6)
  {
    self->_timestampEnd = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v5 + 3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[C2MPGenericEvent addMetric:](self, "addMetric:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)timestampStart
{
  return self->_timestampStart;
}

- (unint64_t)timestampEnd
{
  return self->_timestampEnd;
}

- (NSMutableArray)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

@end