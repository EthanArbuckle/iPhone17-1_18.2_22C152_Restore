@interface DRSProtoDecisionResult
- (BOOL)accepted;
- (BOOL)hasAccepted;
- (BOOL)hasRejectionReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)rejectionReason;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccepted:(BOOL)a3;
- (void)setHasAccepted:(BOOL)a3;
- (void)setRejectionReason:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DRSProtoDecisionResult

- (void)setAccepted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_accepted = a3;
}

- (void)setHasAccepted:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAccepted
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasRejectionReason
{
  return self->_rejectionReason != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DRSProtoDecisionResult;
  v4 = [(DRSProtoDecisionResult *)&v8 description];
  v5 = [(DRSProtoDecisionResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithBool:self->_accepted];
    [v3 setObject:v4 forKey:@"accepted"];
  }
  rejectionReason = self->_rejectionReason;
  if (rejectionReason) {
    [v3 setObject:rejectionReason forKey:@"rejection_reason"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoDecisionResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_rejectionReason)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_accepted;
    v4[20] |= 1u;
  }
  if (self->_rejectionReason)
  {
    id v5 = v4;
    objc_msgSend(v4, "setRejectionReason:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_accepted;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_rejectionReason copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 20))
    {
      if (self->_accepted)
      {
        if (*((unsigned char *)v4 + 16)) {
          goto LABEL_12;
        }
      }
      else if (!*((unsigned char *)v4 + 16))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    char v5 = 0;
    goto LABEL_7;
  }
  if (*((unsigned char *)v4 + 20)) {
    goto LABEL_6;
  }
LABEL_12:
  rejectionReason = self->_rejectionReason;
  if ((unint64_t)rejectionReason | *((void *)v4 + 1)) {
    char v5 = -[NSString isEqual:](rejectionReason, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_accepted;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_rejectionReason hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[20])
  {
    self->_accepted = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    char v5 = v4;
    -[DRSProtoDecisionResult setRejectionReason:](self, "setRejectionReason:");
    id v4 = v5;
  }
}

- (BOOL)accepted
{
  return self->_accepted;
}

- (NSString)rejectionReason
{
  return self->_rejectionReason;
}

- (void)setRejectionReason:(id)a3
{
}

- (void).cxx_destruct
{
}

@end