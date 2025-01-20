@interface CellularLteRsrpRsrqSinr
+ (Class)instValuesType;
- (BOOL)hasAvgValues;
- (BOOL)hasCallId;
- (BOOL)hasNumSubs;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)instValues;
- (NSString)callId;
- (RsrpRsrqSinr)avgValues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)instValuesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)instValuesCount;
- (unint64_t)timestamp;
- (unsigned)numSubs;
- (unsigned)subsId;
- (void)addInstValues:(id)a3;
- (void)clearInstValues;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAvgValues:(id)a3;
- (void)setCallId:(id)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInstValues:(id)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularLteRsrpRsrqSinr

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCallId
{
  return self->_callId != 0;
}

- (BOOL)hasAvgValues
{
  return self->_avgValues != 0;
}

- (void)clearInstValues
{
}

- (void)addInstValues:(id)a3
{
  id v4 = a3;
  instValues = self->_instValues;
  id v8 = v4;
  if (!instValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_instValues;
    self->_instValues = v6;

    id v4 = v8;
    instValues = self->_instValues;
  }
  [(NSMutableArray *)instValues addObject:v4];
}

- (unint64_t)instValuesCount
{
  return (unint64_t)[(NSMutableArray *)self->_instValues count];
}

- (id)instValuesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_instValues objectAtIndex:a3];
}

+ (Class)instValuesType
{
  return (Class)objc_opt_class();
}

- (void)setNumSubs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumSubs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularLteRsrpRsrqSinr;
  char v3 = [(CellularLteRsrpRsrqSinr *)&v7 description];
  id v4 = [(CellularLteRsrpRsrqSinr *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  callId = self->_callId;
  if (callId) {
    [v3 setObject:callId forKey:@"call_id"];
  }
  avgValues = self->_avgValues;
  if (avgValues)
  {
    objc_super v7 = [(RsrpRsrqSinr *)avgValues dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"avg_values"];
  }
  if ([(NSMutableArray *)self->_instValues count])
  {
    id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_instValues, "count")];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v9 = self->_instValues;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v19 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"inst_values"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v16 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
    [v3 setObject:v16 forKey:@"num_subs"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v17 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v17 forKey:@"subs_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000DC63C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_callId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_avgValues) {
    PBDataWriterWriteSubmessage();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_instValues;
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
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  id v10 = v4;
  if (self->_callId)
  {
    [v4 setCallId:];
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_numSubs;
    *((unsigned char *)v4 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_subsId;
    *((unsigned char *)v4 + 48) |= 4u;
  }
  if (self->_avgValues) {
    [v10 setAvgValues:];
  }
  if ([(CellularLteRsrpRsrqSinr *)self instValuesCount])
  {
    [v10 clearInstValues];
    unint64_t v6 = [(CellularLteRsrpRsrqSinr *)self instValuesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(CellularLteRsrpRsrqSinr *)self instValuesAtIndex:i];
        [v10 addInstValues:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  id v7 = [(NSString *)self->_callId copyWithZone:a3];
  id v8 = (void *)v6[3];
  v6[3] = v7;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v6 + 10) = self->_numSubs;
    *((unsigned char *)v6 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v6 + 11) = self->_subsId;
    *((unsigned char *)v6 + 48) |= 4u;
  }
  id v10 = [(RsrpRsrqSinr *)self->_avgValues copyWithZone:a3];
  long long v11 = (void *)v6[2];
  v6[2] = v10;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v12 = self->_instValues;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v19 + 1) + 8 * i) copyWithZone:a3];
        [v6 addInstValues:v17];
      }
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_24;
  }
  callId = self->_callId;
  if ((unint64_t)callId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](callId, "isEqual:"))
    {
LABEL_24:
      unsigned __int8 v9 = 0;
      goto LABEL_25;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_numSubs != *((_DWORD *)v4 + 10)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_subsId != *((_DWORD *)v4 + 11)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_24;
  }
  avgValues = self->_avgValues;
  if ((unint64_t)avgValues | *((void *)v4 + 2) && !-[RsrpRsrqSinr isEqual:](avgValues, "isEqual:")) {
    goto LABEL_24;
  }
  instValues = self->_instValues;
  if ((unint64_t)instValues | *((void *)v4 + 4)) {
    unsigned __int8 v9 = -[NSMutableArray isEqual:](instValues, "isEqual:");
  }
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_25:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_callId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_numSubs;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_subsId;
LABEL_9:
  unint64_t v7 = v4 ^ v3 ^ v5 ^ v6 ^ [(RsrpRsrqSinr *)self->_avgValues hash];
  return v7 ^ (unint64_t)[(NSMutableArray *)self->_instValues hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  id v5 = v4;
  if (v4[6])
  {
    self->_timestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[3]) {
    -[CellularLteRsrpRsrqSinr setCallId:](self, "setCallId:");
  }
  char v6 = *((unsigned char *)v5 + 48);
  if ((v6 & 2) != 0)
  {
    self->_numSubs = *((_DWORD *)v5 + 10);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v5 + 48);
  }
  if ((v6 & 4) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 11);
    *(unsigned char *)&self->_has |= 4u;
  }
  avgValues = self->_avgValues;
  uint64_t v8 = *((void *)v5 + 2);
  if (avgValues)
  {
    if (v8) {
      -[RsrpRsrqSinr mergeFrom:](avgValues, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[CellularLteRsrpRsrqSinr setAvgValues:](self, "setAvgValues:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *((id *)v5 + 4);
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
        -[CellularLteRsrpRsrqSinr addInstValues:](self, "addInstValues:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)callId
{
  return self->_callId;
}

- (void)setCallId:(id)a3
{
}

- (RsrpRsrqSinr)avgValues
{
  return self->_avgValues;
}

- (void)setAvgValues:(id)a3
{
}

- (NSMutableArray)instValues
{
  return self->_instValues;
}

- (void)setInstValues:(id)a3
{
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instValues, 0);
  objc_storeStrong((id *)&self->_callId, 0);

  objc_storeStrong((id *)&self->_avgValues, 0);
}

@end