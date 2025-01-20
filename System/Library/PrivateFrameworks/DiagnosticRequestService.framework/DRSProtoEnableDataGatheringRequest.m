@interface DRSProtoEnableDataGatheringRequest
- (BOOL)hasIsContinue;
- (BOOL)hasLogType;
- (BOOL)hasRequestDescription;
- (BOOL)isContinue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DRSProtoRequestDescription)requestDescription;
- (NSString)logType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsContinue:(BOOL)a3;
- (void)setIsContinue:(BOOL)a3;
- (void)setLogType:(id)a3;
- (void)setRequestDescription:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DRSProtoEnableDataGatheringRequest

- (BOOL)hasRequestDescription
{
  return self->_requestDescription != 0;
}

- (BOOL)hasLogType
{
  return self->_logType != 0;
}

- (void)setIsContinue:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isContinue = a3;
}

- (void)setHasIsContinue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsContinue
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DRSProtoEnableDataGatheringRequest;
  v4 = [(DRSProtoEnableDataGatheringRequest *)&v8 description];
  v5 = [(DRSProtoEnableDataGatheringRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  requestDescription = self->_requestDescription;
  if (requestDescription)
  {
    v5 = [(DRSProtoRequestDescription *)requestDescription dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"request_description"];
  }
  logType = self->_logType;
  if (logType) {
    [v3 setObject:logType forKey:@"log_type"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithBool:self->_isContinue];
    [v3 setObject:v7 forKey:@"is_continue"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoEnableDataGatheringRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestDescription)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_logType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestDescription)
  {
    objc_msgSend(v4, "setRequestDescription:");
    id v4 = v5;
  }
  if (self->_logType)
  {
    objc_msgSend(v5, "setLogType:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_isContinue;
    v4[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(DRSProtoRequestDescription *)self->_requestDescription copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_logType copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_isContinue;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  requestDescription = self->_requestDescription;
  if ((unint64_t)requestDescription | *((void *)v4 + 2))
  {
    if (!-[DRSProtoRequestDescription isEqual:](requestDescription, "isEqual:")) {
      goto LABEL_8;
    }
  }
  logType = self->_logType;
  if ((unint64_t)logType | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](logType, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      BOOL v7 = 0;
      goto LABEL_9;
    }
    if (self->_isContinue)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_8;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_8;
    }
    BOOL v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DRSProtoRequestDescription *)self->_requestDescription hash];
  NSUInteger v4 = [(NSString *)self->_logType hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_isContinue;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  requestDescription = self->_requestDescription;
  uint64_t v6 = *((void *)v4 + 2);
  id v7 = v4;
  if (requestDescription)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[DRSProtoRequestDescription mergeFrom:](requestDescription, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[DRSProtoEnableDataGatheringRequest setRequestDescription:](self, "setRequestDescription:");
  }
  id v4 = v7;
LABEL_7:
  if (*((void *)v4 + 1))
  {
    -[DRSProtoEnableDataGatheringRequest setLogType:](self, "setLogType:");
    id v4 = v7;
  }
  if (*((unsigned char *)v4 + 28))
  {
    self->_isContinue = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (DRSProtoRequestDescription)requestDescription
{
  return self->_requestDescription;
}

- (void)setRequestDescription:(id)a3
{
}

- (NSString)logType
{
  return self->_logType;
}

- (void)setLogType:(id)a3
{
}

- (BOOL)isContinue
{
  return self->_isContinue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDescription, 0);

  objc_storeStrong((id *)&self->_logType, 0);
}

@end