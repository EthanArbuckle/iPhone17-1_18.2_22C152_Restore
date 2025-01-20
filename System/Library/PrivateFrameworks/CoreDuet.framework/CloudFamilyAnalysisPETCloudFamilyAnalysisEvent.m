@interface CloudFamilyAnalysisPETCloudFamilyAnalysisEvent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CloudFamilyAnalysisPETContactEvents)contactEvents;
- (NSString)collectionId;
- (NSString)sessionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)batch;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBatch:(int)a3;
- (void)setCollectionId:(id)a3;
- (void)setContactEvents:(id)a3;
- (void)setSessionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CloudFamilyAnalysisPETCloudFamilyAnalysisEvent

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CloudFamilyAnalysisPETCloudFamilyAnalysisEvent;
  v4 = [(CloudFamilyAnalysisPETCloudFamilyAnalysisEvent *)&v8 description];
  v5 = [(CloudFamilyAnalysisPETCloudFamilyAnalysisEvent *)self dictionaryRepresentation];
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
    v9 = [(CloudFamilyAnalysisPETContactEvents *)contactEvents dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"contactEvents"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CloudFamilyAnalysisPETCloudFamilyAnalysisEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_collectionId) {
    -[CloudFamilyAnalysisPETCloudFamilyAnalysisEvent writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (!self->_sessionId) {
    -[CloudFamilyAnalysisPETCloudFamilyAnalysisEvent writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  if (!self->_contactEvents) {
    -[CloudFamilyAnalysisPETCloudFamilyAnalysisEvent writeTo:]();
  }
  PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  collectionId = self->_collectionId;
  v5 = a3;
  [v5 setCollectionId:collectionId];
  [v5 setSessionId:self->_sessionId];
  v5[2] = self->_batch;
  [v5 setContactEvents:self->_contactEvents];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_collectionId copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_sessionId copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  *(_DWORD *)(v5 + 8) = self->_batch;
  id v10 = [(CloudFamilyAnalysisPETContactEvents *)self->_contactEvents copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((collectionId = self->_collectionId, !((unint64_t)collectionId | v4[2]))
     || -[NSString isEqual:](collectionId, "isEqual:"))
    && ((sessionId = self->_sessionId, !((unint64_t)sessionId | v4[4]))
     || -[NSString isEqual:](sessionId, "isEqual:"))
    && self->_batch == *((_DWORD *)v4 + 2))
  {
    contactEvents = self->_contactEvents;
    if ((unint64_t)contactEvents | v4[3]) {
      char v8 = -[CloudFamilyAnalysisPETContactEvents isEqual:](contactEvents, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_collectionId hash];
  NSUInteger v4 = [(NSString *)self->_sessionId hash] ^ v3;
  uint64_t v5 = 2654435761 * self->_batch;
  return v4 ^ [(CloudFamilyAnalysisPETContactEvents *)self->_contactEvents hash] ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int *)a3;
  v7 = v4;
  if (*((void *)v4 + 2))
  {
    -[CloudFamilyAnalysisPETCloudFamilyAnalysisEvent setCollectionId:](self, "setCollectionId:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[CloudFamilyAnalysisPETCloudFamilyAnalysisEvent setSessionId:](self, "setSessionId:");
    NSUInteger v4 = v7;
  }
  self->_batch = v4[2];
  contactEvents = self->_contactEvents;
  uint64_t v6 = *((void *)v4 + 3);
  if (contactEvents)
  {
    if (!v6) {
      goto LABEL_11;
    }
    contactEvents = (CloudFamilyAnalysisPETContactEvents *)-[CloudFamilyAnalysisPETContactEvents mergeFrom:](contactEvents, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    contactEvents = (CloudFamilyAnalysisPETContactEvents *)-[CloudFamilyAnalysisPETCloudFamilyAnalysisEvent setContactEvents:](self, "setContactEvents:");
  }
  NSUInteger v4 = v7;
LABEL_11:
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

- (CloudFamilyAnalysisPETContactEvents)contactEvents
{
  return self->_contactEvents;
}

- (void)setContactEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_contactEvents, 0);
  objc_storeStrong((id *)&self->_collectionId, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CloudFamilyAnalysisPETCloudFamilyAnalysisEvent writeTo:]", "CloudFamilyAnalysisPETCloudFamilyAnalysisEvent.m", 115, "nil != self->_collectionId");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[CloudFamilyAnalysisPETCloudFamilyAnalysisEvent writeTo:]", "CloudFamilyAnalysisPETCloudFamilyAnalysisEvent.m", 120, "nil != self->_sessionId");
}

- (void)writeTo:.cold.3()
{
  __assert_rtn("-[CloudFamilyAnalysisPETCloudFamilyAnalysisEvent writeTo:]", "CloudFamilyAnalysisPETCloudFamilyAnalysisEvent.m", 129, "self->_contactEvents != nil");
}

@end