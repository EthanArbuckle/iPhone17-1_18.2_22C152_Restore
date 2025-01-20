@interface MailIntelligencePETMailIntelligenceAnalysisEvent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MailIntelligencePETContactEvents)contactEvents;
- (NSString)collectionId;
- (NSString)sessionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)batch;
- (unint64_t)hash;
- (unint64_t)mailIntelligenceUserId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBatch:(int)a3;
- (void)setCollectionId:(id)a3;
- (void)setContactEvents:(id)a3;
- (void)setMailIntelligenceUserId:(unint64_t)a3;
- (void)setSessionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MailIntelligencePETMailIntelligenceAnalysisEvent

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MailIntelligencePETMailIntelligenceAnalysisEvent;
  v4 = [(MailIntelligencePETMailIntelligenceAnalysisEvent *)&v8 description];
  v5 = [(MailIntelligencePETMailIntelligenceAnalysisEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  collectionId = self->_collectionId;
  if (collectionId) {
    [v3 setObject:collectionId forKey:@"collectionId"];
  }
  sessionId = self->_sessionId;
  if (sessionId) {
    [v4 setObject:sessionId forKey:@"sessionId"];
  }
  v7 = [NSNumber numberWithInt:self->_batch];
  [v4 setObject:v7 forKey:@"batch"];

  contactEvents = self->_contactEvents;
  if (contactEvents)
  {
    v9 = [(MailIntelligencePETContactEvents *)contactEvents dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"contactEvents"];
  }
  v10 = [NSNumber numberWithUnsignedLongLong:self->_mailIntelligenceUserId];
  [v4 setObject:v10 forKey:@"mailIntelligenceUserId"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MailIntelligencePETMailIntelligenceAnalysisEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_collectionId) {
    -[MailIntelligencePETMailIntelligenceAnalysisEvent writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (!self->_sessionId) {
    -[MailIntelligencePETMailIntelligenceAnalysisEvent writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  if (!self->_contactEvents) {
    -[MailIntelligencePETMailIntelligenceAnalysisEvent writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  collectionId = self->_collectionId;
  id v5 = a3;
  [v5 setCollectionId:collectionId];
  [v5 setSessionId:self->_sessionId];
  *((_DWORD *)v5 + 4) = self->_batch;
  [v5 setContactEvents:self->_contactEvents];
  *((void *)v5 + 1) = self->_mailIntelligenceUserId;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_collectionId copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_sessionId copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  *(_DWORD *)(v5 + 16) = self->_batch;
  id v10 = [(MailIntelligencePETContactEvents *)self->_contactEvents copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  *(void *)(v5 + 8) = self->_mailIntelligenceUserId;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v8 = [v4 isMemberOfClass:objc_opt_class()]
    && ((collectionId = self->_collectionId, !((unint64_t)collectionId | *((void *)v4 + 3)))
     || -[NSString isEqual:](collectionId, "isEqual:"))
    && ((sessionId = self->_sessionId, !((unint64_t)sessionId | *((void *)v4 + 5)))
     || -[NSString isEqual:](sessionId, "isEqual:"))
    && self->_batch == *((_DWORD *)v4 + 4)
    && ((contactEvents = self->_contactEvents, !((unint64_t)contactEvents | *((void *)v4 + 4)))
     || -[MailIntelligencePETContactEvents isEqual:](contactEvents, "isEqual:"))
    && self->_mailIntelligenceUserId == *((void *)v4 + 1);

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_collectionId hash];
  NSUInteger v4 = [(NSString *)self->_sessionId hash] ^ v3;
  uint64_t v5 = 2654435761 * self->_batch;
  return v4 ^ [(MailIntelligencePETContactEvents *)self->_contactEvents hash] ^ v5 ^ (2654435761u
                                                                                           * self->_mailIntelligenceUserId);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*((void *)v4 + 3))
  {
    -[MailIntelligencePETMailIntelligenceAnalysisEvent setCollectionId:](self, "setCollectionId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 5))
  {
    -[MailIntelligencePETMailIntelligenceAnalysisEvent setSessionId:](self, "setSessionId:");
    id v4 = v7;
  }
  self->_batch = *((_DWORD *)v4 + 4);
  contactEvents = self->_contactEvents;
  uint64_t v6 = *((void *)v4 + 4);
  if (contactEvents)
  {
    if (!v6) {
      goto LABEL_11;
    }
    contactEvents = (MailIntelligencePETContactEvents *)-[MailIntelligencePETContactEvents mergeFrom:](contactEvents, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    contactEvents = (MailIntelligencePETContactEvents *)-[MailIntelligencePETMailIntelligenceAnalysisEvent setContactEvents:](self, "setContactEvents:");
  }
  id v4 = v7;
LABEL_11:
  self->_mailIntelligenceUserId = *((void *)v4 + 1);
  MEMORY[0x1F41817F8](contactEvents, v4);
}

- (NSString)collectionId
{
  return self->_collectionId;
}

- (void)setCollectionId:(id)a3
{
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (int)batch
{
  return self->_batch;
}

- (void)setBatch:(int)a3
{
  self->_batch = a3;
}

- (MailIntelligencePETContactEvents)contactEvents
{
  return self->_contactEvents;
}

- (void)setContactEvents:(id)a3
{
}

- (unint64_t)mailIntelligenceUserId
{
  return self->_mailIntelligenceUserId;
}

- (void)setMailIntelligenceUserId:(unint64_t)a3
{
  self->_mailIntelligenceUserId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_contactEvents, 0);
  objc_storeStrong((id *)&self->_collectionId, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[MailIntelligencePETMailIntelligenceAnalysisEvent writeTo:]", "MailIntelligencePETMailIntelligenceAnalysisEvent.m", 122, "nil != self->_collectionId");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[MailIntelligencePETMailIntelligenceAnalysisEvent writeTo:]", "MailIntelligencePETMailIntelligenceAnalysisEvent.m", 127, "nil != self->_sessionId");
}

- (void)writeTo:.cold.3()
{
  __assert_rtn("-[MailIntelligencePETMailIntelligenceAnalysisEvent writeTo:]", "MailIntelligencePETMailIntelligenceAnalysisEvent.m", 136, "self->_contactEvents != nil");
}

@end