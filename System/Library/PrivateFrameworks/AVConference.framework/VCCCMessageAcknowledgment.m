@interface VCCCMessageAcknowledgment
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)transactionID;
- (unsigned)status;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setStatus:(unsigned int)a3;
- (void)setTransactionID:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCCCMessageAcknowledgment

- (void)setStatus:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCCCMessageAcknowledgment;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCCCMessageAcknowledgment description](&v3, sel_description), -[VCCCMessageAcknowledgment dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_transactionID), @"transactionID");
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_status), @"status");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCCCMessageAcknowledgmentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteUint64Field();
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = self->_transactionID;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 4) = self->_status;
    *((unsigned char *)a3 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 1) = self->_transactionID;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 4) = self->_status;
    *((unsigned char *)result + 20) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_transactionID != *((void *)a3 + 1)) {
      goto LABEL_7;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 20) & 1) == 0;
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 20) & 1) != 0 && self->_status == *((_DWORD *)a3 + 4))
      {
        LOBYTE(v5) = 1;
        return v5;
      }
LABEL_7:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_status;
  }
  else {
    uint64_t v2 = 0;
  }
  return v2 ^ (2654435761u * self->_transactionID);
}

- (void)mergeFrom:(id)a3
{
  self->_transactionID = *((void *)a3 + 1);
  if (*((unsigned char *)a3 + 20))
  {
    self->_status = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(unint64_t)a3
{
  self->_transactionID = a3;
}

- (unsigned)status
{
  return self->_status;
}

@end