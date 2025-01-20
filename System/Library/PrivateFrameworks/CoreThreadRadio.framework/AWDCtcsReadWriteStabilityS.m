@interface AWDCtcsReadWriteStabilityS
- (BOOL)hasCtcsReadWriteFailType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)ctcsReadWriteFailTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCtcsReadWriteFailType:(id)a3;
- (int)ctcsReadWriteFailType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCtcsReadWriteFailType:(int)a3;
- (void)setHasCtcsReadWriteFailType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCtcsReadWriteStabilityS

- (int)ctcsReadWriteFailType
{
  if (*(unsigned char *)&self->_has) {
    return self->_ctcsReadWriteFailType;
  }
  else {
    return 1;
  }
}

- (void)setCtcsReadWriteFailType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ctcsReadWriteFailType = a3;
}

- (void)setHasCtcsReadWriteFailType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCtcsReadWriteFailType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)ctcsReadWriteFailTypeAsString:(int)a3
{
  if ((a3 - 1) >= 6)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_1004956A8[a3 - 1];
  }
  return v3;
}

- (int)StringAsCtcsReadWriteFailType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"E_CTCS_FAIL_RETRIEVE_ALL_CREDENTIALS"])
  {

    return 1;
  }
  else if ([v3 isEqualToString:@"E_CTCS_FAIL_DELETE_CREDENTIALS"])
  {

    return 2;
  }
  else if ([v3 isEqualToString:@"E_CTCS_FAIL_RETRIEVE_BORDERAGENT_CREDENTIALS"])
  {

    return 3;
  }
  else if ([v3 isEqualToString:@"E_CTCS_FAIL_RETRIEVE_EXTENDED_PANID_CREDENTIALS"])
  {

    return 4;
  }
  else if ([v3 isEqualToString:@"E_CTCS_FAIL_RETRIEVE_PREFERRED_NETWORK"])
  {

    return 5;
  }
  else
  {
    if ([v3 isEqualToString:@"E_CTCS_FAIL_STORE_CREDENTIALS"]) {
      int v5 = 6;
    }
    else {
      int v5 = 1;
    }

    return v5;
  }
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDCtcsReadWriteStabilityS;
  id v3 = [(AWDCtcsReadWriteStabilityS *)&v7 description];
  v4 = [(AWDCtcsReadWriteStabilityS *)self dictionaryRepresentation];
  int v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = self->_ctcsReadWriteFailType - 1;
    if (v4 >= 6)
    {
      int v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_ctcsReadWriteFailType];
    }
    else
    {
      int v5 = off_1004956A8[v4];
    }
    [v3 setObject:v5 forKey:@"ctcs_read_write_fail_type"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCtcsReadWriteStabilitySReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_ctcsReadWriteFailType;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_ctcsReadWriteFailType;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_ctcsReadWriteFailType == *((_DWORD *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_ctcsReadWriteFailType;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_ctcsReadWriteFailType = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

@end