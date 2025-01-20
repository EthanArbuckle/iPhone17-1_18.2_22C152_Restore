@interface FTCPPETParticipant
- (BOOL)isContact;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)hashedId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHashedId:(unint64_t)a3;
- (void)setIsContact:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation FTCPPETParticipant

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FTCPPETParticipant;
  v4 = [(FTCPPETParticipant *)&v8 description];
  v5 = [(FTCPPETParticipant *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithUnsignedLongLong:self->_hashedId];
  [v3 setObject:v4 forKey:@"hashedId"];

  v5 = [NSNumber numberWithBool:self->_isContact];
  [v3 setObject:v5 forKey:@"isContact"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FTCPPETParticipantReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = self->_hashedId;
  *((unsigned char *)a3 + 16) = self->_isContact;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 1) = self->_hashedId;
  *((unsigned char *)result + 16) = self->_isContact;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()] && self->_hashedId == *((void *)v4 + 1))
  {
    if (self->_isContact) {
      BOOL v5 = v4[16] != 0;
    }
    else {
      BOOL v5 = v4[16] == 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return (2654435761 * self->_isContact) ^ (2654435761u * self->_hashedId);
}

- (void)mergeFrom:(id)a3
{
  self->_hashedId = *((void *)a3 + 1);
  self->_isContact = *((unsigned char *)a3 + 16);
}

- (unint64_t)hashedId
{
  return self->_hashedId;
}

- (void)setHashedId:(unint64_t)a3
{
  self->_hashedId = a3;
}

- (BOOL)isContact
{
  return self->_isContact;
}

- (void)setIsContact:(BOOL)a3
{
  self->_isContact = a3;
}

@end