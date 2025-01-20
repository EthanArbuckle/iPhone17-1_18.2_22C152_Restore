@interface EDPETBatchedWrapper
- (BOOL)hasQuotaEvent;
- (BOOL)hasRawData;
- (BOOL)hasSubmittedEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (EDPETQuotaReachedEvent)quotaEvent;
- (EDPETSubmittedEvent)submittedEvent;
- (NSData)rawData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setQuotaEvent:(id)a3;
- (void)setRawData:(id)a3;
- (void)setSubmittedEvent:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation EDPETBatchedWrapper

- (BOOL)hasQuotaEvent
{
  return self->_quotaEvent != 0;
}

- (BOOL)hasSubmittedEvent
{
  return self->_submittedEvent != 0;
}

- (BOOL)hasRawData
{
  return self->_rawData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)EDPETBatchedWrapper;
  v4 = [(EDPETBatchedWrapper *)&v8 description];
  v5 = [(EDPETBatchedWrapper *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  quotaEvent = self->_quotaEvent;
  if (quotaEvent)
  {
    v5 = [(EDPETQuotaReachedEvent *)quotaEvent dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"quota_event"];
  }
  submittedEvent = self->_submittedEvent;
  if (submittedEvent)
  {
    v7 = [(EDPETSubmittedEvent *)submittedEvent dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"submitted_event"];
  }
  rawData = self->_rawData;
  if (rawData) {
    [v3 setObject:rawData forKey:@"raw_data"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return EDPETBatchedWrapperReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_quotaEvent) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_submittedEvent) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_rawData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_quotaEvent) {
    objc_msgSend(v4, "setQuotaEvent:");
  }
  if (self->_submittedEvent) {
    objc_msgSend(v4, "setSubmittedEvent:");
  }
  if (self->_rawData) {
    objc_msgSend(v4, "setRawData:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(EDPETQuotaReachedEvent *)self->_quotaEvent copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(EDPETSubmittedEvent *)self->_submittedEvent copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSData *)self->_rawData copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((quotaEvent = self->_quotaEvent, !((unint64_t)quotaEvent | v4[1]))
     || -[EDPETQuotaReachedEvent isEqual:](quotaEvent, "isEqual:"))
    && ((submittedEvent = self->_submittedEvent, !((unint64_t)submittedEvent | v4[3]))
     || -[EDPETSubmittedEvent isEqual:](submittedEvent, "isEqual:")))
  {
    rawData = self->_rawData;
    if ((unint64_t)rawData | v4[2]) {
      char v8 = -[NSData isEqual:](rawData, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(EDPETQuotaReachedEvent *)self->_quotaEvent hash];
  unint64_t v4 = [(EDPETSubmittedEvent *)self->_submittedEvent hash] ^ v3;
  return v4 ^ [(NSData *)self->_rawData hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  quotaEvent = self->_quotaEvent;
  v9 = v4;
  uint64_t v6 = v4[1];
  if (quotaEvent)
  {
    if (v6) {
      -[EDPETQuotaReachedEvent mergeFrom:](quotaEvent, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[EDPETBatchedWrapper setQuotaEvent:](self, "setQuotaEvent:");
  }
  submittedEvent = self->_submittedEvent;
  uint64_t v8 = v9[3];
  if (submittedEvent)
  {
    if (v8) {
      -[EDPETSubmittedEvent mergeFrom:](submittedEvent, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[EDPETBatchedWrapper setSubmittedEvent:](self, "setSubmittedEvent:");
  }
  if (v9[2]) {
    -[EDPETBatchedWrapper setRawData:](self, "setRawData:");
  }
}

- (EDPETQuotaReachedEvent)quotaEvent
{
  return self->_quotaEvent;
}

- (void)setQuotaEvent:(id)a3
{
}

- (EDPETSubmittedEvent)submittedEvent
{
  return self->_submittedEvent;
}

- (void)setSubmittedEvent:(id)a3
{
}

- (NSData)rawData
{
  return self->_rawData;
}

- (void)setRawData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submittedEvent, 0);
  objc_storeStrong((id *)&self->_rawData, 0);

  objc_storeStrong((id *)&self->_quotaEvent, 0);
}

@end