@interface DRSProtoRequestDescription
- (BOOL)hasBuild;
- (BOOL)hasContextDictionaryData;
- (BOOL)hasIssueCategory;
- (BOOL)hasRequestTime;
- (BOOL)hasTeamId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)contextDictionaryData;
- (NSString)build;
- (NSString)issueCategory;
- (NSString)teamId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)requestTime;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuild:(id)a3;
- (void)setContextDictionaryData:(id)a3;
- (void)setHasRequestTime:(BOOL)a3;
- (void)setIssueCategory:(id)a3;
- (void)setRequestTime:(unint64_t)a3;
- (void)setTeamId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DRSProtoRequestDescription

- (BOOL)hasTeamId
{
  return self->_teamId != 0;
}

- (BOOL)hasIssueCategory
{
  return self->_issueCategory != 0;
}

- (BOOL)hasContextDictionaryData
{
  return self->_contextDictionaryData != 0;
}

- (void)setRequestTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_requestTime = a3;
}

- (void)setHasRequestTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DRSProtoRequestDescription;
  v4 = [(DRSProtoRequestDescription *)&v8 description];
  v5 = [(DRSProtoRequestDescription *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  teamId = self->_teamId;
  if (teamId) {
    [v3 setObject:teamId forKey:@"team_id"];
  }
  issueCategory = self->_issueCategory;
  if (issueCategory) {
    [v4 setObject:issueCategory forKey:@"issue_category"];
  }
  contextDictionaryData = self->_contextDictionaryData;
  if (contextDictionaryData) {
    [v4 setObject:contextDictionaryData forKey:@"context_dictionary_data"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithUnsignedLongLong:self->_requestTime];
    [v4 setObject:v8 forKey:@"request_time"];
  }
  build = self->_build;
  if (build) {
    [v4 setObject:build forKey:@"build"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoRequestDescriptionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_teamId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_issueCategory)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_contextDictionaryData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_build)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_teamId)
  {
    objc_msgSend(v4, "setTeamId:");
    id v4 = v5;
  }
  if (self->_issueCategory)
  {
    objc_msgSend(v5, "setIssueCategory:");
    id v4 = v5;
  }
  if (self->_contextDictionaryData)
  {
    objc_msgSend(v5, "setContextDictionaryData:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_requestTime;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if (self->_build)
  {
    objc_msgSend(v5, "setBuild:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_teamId copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_issueCategory copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSData *)self->_contextDictionaryData copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_requestTime;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v12 = [(NSString *)self->_build copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  teamId = self->_teamId;
  if ((unint64_t)teamId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](teamId, "isEqual:")) {
      goto LABEL_15;
    }
  }
  issueCategory = self->_issueCategory;
  if ((unint64_t)issueCategory | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](issueCategory, "isEqual:")) {
      goto LABEL_15;
    }
  }
  contextDictionaryData = self->_contextDictionaryData;
  if ((unint64_t)contextDictionaryData | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](contextDictionaryData, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_requestTime != *((void *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  build = self->_build;
  if ((unint64_t)build | *((void *)v4 + 2)) {
    char v9 = -[NSString isEqual:](build, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_teamId hash];
  NSUInteger v4 = [(NSString *)self->_issueCategory hash];
  uint64_t v5 = [(NSData *)self->_contextDictionaryData hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v6 = 2654435761u * self->_requestTime;
  }
  else {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_build hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (unint64_t *)a3;
  uint64_t v5 = v4;
  if (v4[5])
  {
    -[DRSProtoRequestDescription setTeamId:](self, "setTeamId:");
    NSUInteger v4 = v5;
  }
  if (v4[4])
  {
    -[DRSProtoRequestDescription setIssueCategory:](self, "setIssueCategory:");
    NSUInteger v4 = v5;
  }
  if (v4[3])
  {
    -[DRSProtoRequestDescription setContextDictionaryData:](self, "setContextDictionaryData:");
    NSUInteger v4 = v5;
  }
  if (v4[6])
  {
    self->_requestTime = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[2])
  {
    -[DRSProtoRequestDescription setBuild:](self, "setBuild:");
    NSUInteger v4 = v5;
  }
}

- (NSString)teamId
{
  return self->_teamId;
}

- (void)setTeamId:(id)a3
{
}

- (NSString)issueCategory
{
  return self->_issueCategory;
}

- (void)setIssueCategory:(id)a3
{
}

- (NSData)contextDictionaryData
{
  return self->_contextDictionaryData;
}

- (void)setContextDictionaryData:(id)a3
{
}

- (unint64_t)requestTime
{
  return self->_requestTime;
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamId, 0);
  objc_storeStrong((id *)&self->_issueCategory, 0);
  objc_storeStrong((id *)&self->_contextDictionaryData, 0);

  objc_storeStrong((id *)&self->_build, 0);
}

@end