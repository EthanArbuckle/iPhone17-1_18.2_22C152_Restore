@interface HKHealthWrapCodablePayloadHeader
+ (Class)keyValuePairsType;
- (BOOL)hasApplicationData;
- (BOOL)hasChannel;
- (BOOL)hasEndDate;
- (BOOL)hasPayloadIdentifier;
- (BOOL)hasPayloadType;
- (BOOL)hasStartDate;
- (BOOL)hasSubjectUUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)applicationData;
- (NSData)subjectUUID;
- (NSMutableArray)keyValuePairs;
- (NSString)channel;
- (NSString)payloadIdentifier;
- (NSString)payloadType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keyValuePairsAtIndex:(unint64_t)a3;
- (int64_t)endDate;
- (int64_t)startDate;
- (unint64_t)hash;
- (unint64_t)keyValuePairsCount;
- (void)addKeyValuePairs:(id)a3;
- (void)clearKeyValuePairs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApplicationData:(id)a3;
- (void)setChannel:(id)a3;
- (void)setEndDate:(int64_t)a3;
- (void)setHasEndDate:(BOOL)a3;
- (void)setHasStartDate:(BOOL)a3;
- (void)setKeyValuePairs:(id)a3;
- (void)setPayloadIdentifier:(id)a3;
- (void)setPayloadType:(id)a3;
- (void)setStartDate:(int64_t)a3;
- (void)setSubjectUUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKHealthWrapCodablePayloadHeader

- (BOOL)hasChannel
{
  return self->_channel != 0;
}

- (BOOL)hasPayloadType
{
  return self->_payloadType != 0;
}

- (BOOL)hasSubjectUUID
{
  return self->_subjectUUID != 0;
}

- (void)setStartDate:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEndDate:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasPayloadIdentifier
{
  return self->_payloadIdentifier != 0;
}

- (BOOL)hasApplicationData
{
  return self->_applicationData != 0;
}

- (void)clearKeyValuePairs
{
}

- (void)addKeyValuePairs:(id)a3
{
  id v4 = a3;
  keyValuePairs = self->_keyValuePairs;
  id v8 = v4;
  if (!keyValuePairs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_keyValuePairs;
    self->_keyValuePairs = v6;

    id v4 = v8;
    keyValuePairs = self->_keyValuePairs;
  }
  [(NSMutableArray *)keyValuePairs addObject:v4];
}

- (unint64_t)keyValuePairsCount
{
  return [(NSMutableArray *)self->_keyValuePairs count];
}

- (id)keyValuePairsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_keyValuePairs objectAtIndex:a3];
}

+ (Class)keyValuePairsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKHealthWrapCodablePayloadHeader;
  id v4 = [(HKHealthWrapCodablePayloadHeader *)&v8 description];
  v5 = [(HKHealthWrapCodablePayloadHeader *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  channel = self->_channel;
  if (channel) {
    [v3 setObject:channel forKey:@"channel"];
  }
  payloadType = self->_payloadType;
  if (payloadType) {
    [v4 setObject:payloadType forKey:@"payloadType"];
  }
  subjectUUID = self->_subjectUUID;
  if (subjectUUID) {
    [v4 setObject:subjectUUID forKey:@"subjectUUID"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithLongLong:self->_startDate];
    [v4 setObject:v9 forKey:@"startDate"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v10 = [NSNumber numberWithLongLong:self->_endDate];
    [v4 setObject:v10 forKey:@"endDate"];
  }
  payloadIdentifier = self->_payloadIdentifier;
  if (payloadIdentifier) {
    [v4 setObject:payloadIdentifier forKey:@"payloadIdentifier"];
  }
  applicationData = self->_applicationData;
  if (applicationData) {
    [v4 setObject:applicationData forKey:@"applicationData"];
  }
  if ([(NSMutableArray *)self->_keyValuePairs count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_keyValuePairs, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v14 = self->_keyValuePairs;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (void)v21);
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"keyValuePairs"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKHealthWrapCodablePayloadHeaderReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_channel) {
    PBDataWriterWriteStringField();
  }
  if (self->_payloadType) {
    PBDataWriterWriteStringField();
  }
  if (self->_subjectUUID) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_payloadIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_applicationData) {
    PBDataWriterWriteDataField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_keyValuePairs;
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
  id v10 = v4;
  if (self->_channel)
  {
    objc_msgSend(v4, "setChannel:");
    id v4 = v10;
  }
  if (self->_payloadType)
  {
    objc_msgSend(v10, "setPayloadType:");
    id v4 = v10;
  }
  if (self->_subjectUUID)
  {
    objc_msgSend(v10, "setSubjectUUID:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_startDate;
    *((unsigned char *)v4 + 72) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = self->_endDate;
    *((unsigned char *)v4 + 72) |= 1u;
  }
  if (self->_payloadIdentifier) {
    objc_msgSend(v10, "setPayloadIdentifier:");
  }
  if (self->_applicationData) {
    objc_msgSend(v10, "setApplicationData:");
  }
  if ([(HKHealthWrapCodablePayloadHeader *)self keyValuePairsCount])
  {
    [v10 clearKeyValuePairs];
    unint64_t v6 = [(HKHealthWrapCodablePayloadHeader *)self keyValuePairsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(HKHealthWrapCodablePayloadHeader *)self keyValuePairsAtIndex:i];
        [v10 addKeyValuePairs:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_channel copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_payloadType copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  uint64_t v10 = [(NSData *)self->_subjectUUID copyWithZone:a3];
  long long v11 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v10;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_startDate;
    *(unsigned char *)(v5 + 72) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_endDate;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  uint64_t v13 = [(NSString *)self->_payloadIdentifier copyWithZone:a3];
  long long v14 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v13;

  uint64_t v15 = [(NSData *)self->_applicationData copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v15;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v17 = self->_keyValuePairs;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "copyWithZone:", a3, (void)v24);
        [(id)v5 addKeyValuePairs:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v19);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  channel = self->_channel;
  if ((unint64_t)channel | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](channel, "isEqual:")) {
      goto LABEL_24;
    }
  }
  payloadType = self->_payloadType;
  if ((unint64_t)payloadType | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](payloadType, "isEqual:")) {
      goto LABEL_24;
    }
  }
  subjectUUID = self->_subjectUUID;
  if ((unint64_t)subjectUUID | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](subjectUUID, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_startDate != *((void *)v4 + 2)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
LABEL_24:
    char v11 = 0;
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_endDate != *((void *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_24;
  }
  payloadIdentifier = self->_payloadIdentifier;
  if ((unint64_t)payloadIdentifier | *((void *)v4 + 6)
    && !-[NSString isEqual:](payloadIdentifier, "isEqual:"))
  {
    goto LABEL_24;
  }
  applicationData = self->_applicationData;
  if ((unint64_t)applicationData | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](applicationData, "isEqual:")) {
      goto LABEL_24;
    }
  }
  keyValuePairs = self->_keyValuePairs;
  if ((unint64_t)keyValuePairs | *((void *)v4 + 5)) {
    char v11 = -[NSMutableArray isEqual:](keyValuePairs, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_25:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_channel hash];
  NSUInteger v4 = [(NSString *)self->_payloadType hash];
  uint64_t v5 = [(NSData *)self->_subjectUUID hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_startDate;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_endDate;
LABEL_6:
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v9 = v7 ^ [(NSString *)self->_payloadIdentifier hash];
  uint64_t v10 = v8 ^ v9 ^ [(NSData *)self->_applicationData hash];
  return v10 ^ [(NSMutableArray *)self->_keyValuePairs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[HKHealthWrapCodablePayloadHeader setChannel:](self, "setChannel:");
  }
  if (*((void *)v4 + 7)) {
    -[HKHealthWrapCodablePayloadHeader setPayloadType:](self, "setPayloadType:");
  }
  if (*((void *)v4 + 8)) {
    -[HKHealthWrapCodablePayloadHeader setSubjectUUID:](self, "setSubjectUUID:");
  }
  char v5 = *((unsigned char *)v4 + 72);
  if ((v5 & 2) != 0)
  {
    self->_startDate = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 72);
  }
  if (v5)
  {
    self->_endDate = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 6)) {
    -[HKHealthWrapCodablePayloadHeader setPayloadIdentifier:](self, "setPayloadIdentifier:");
  }
  if (*((void *)v4 + 3)) {
    -[HKHealthWrapCodablePayloadHeader setApplicationData:](self, "setApplicationData:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 5);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        -[HKHealthWrapCodablePayloadHeader addKeyValuePairs:](self, "addKeyValuePairs:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSString)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(id)a3
{
}

- (NSData)subjectUUID
{
  return self->_subjectUUID;
}

- (void)setSubjectUUID:(id)a3
{
}

- (int64_t)startDate
{
  return self->_startDate;
}

- (int64_t)endDate
{
  return self->_endDate;
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (void)setPayloadIdentifier:(id)a3
{
}

- (NSData)applicationData
{
  return self->_applicationData;
}

- (void)setApplicationData:(id)a3
{
}

- (NSMutableArray)keyValuePairs
{
  return self->_keyValuePairs;
}

- (void)setKeyValuePairs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjectUUID, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
  objc_storeStrong((id *)&self->_keyValuePairs, 0);
  objc_storeStrong((id *)&self->_channel, 0);

  objc_storeStrong((id *)&self->_applicationData, 0);
}

@end