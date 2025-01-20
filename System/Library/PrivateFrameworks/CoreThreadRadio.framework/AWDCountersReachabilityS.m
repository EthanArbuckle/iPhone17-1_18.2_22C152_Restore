@interface AWDCountersReachabilityS
- (BOOL)hasLinkLossNbrChildCount;
- (BOOL)hasLinkLossNbrRouterCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)linkLossNbrChildCount;
- (unsigned)linkLossNbrRouterCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLinkLossNbrChildCount:(BOOL)a3;
- (void)setHasLinkLossNbrRouterCount:(BOOL)a3;
- (void)setLinkLossNbrChildCount:(unsigned int)a3;
- (void)setLinkLossNbrRouterCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersReachabilityS

- (void)setLinkLossNbrRouterCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_linkLossNbrRouterCount = a3;
}

- (void)setHasLinkLossNbrRouterCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLinkLossNbrRouterCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLinkLossNbrChildCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_linkLossNbrChildCount = a3;
}

- (void)setHasLinkLossNbrChildCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLinkLossNbrChildCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDCountersReachabilityS;
  char v3 = [(AWDCountersReachabilityS *)&v7 description];
  v4 = [(AWDCountersReachabilityS *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_linkLossNbrRouterCount];
    [v3 setObject:v5 forKey:@"link_loss_nbr_router_count"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_linkLossNbrChildCount];
    [v3 setObject:v6 forKey:@"link_loss_nbr_child_count"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCountersReachabilitySReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
    if ((*(unsigned char *)&self->_has & 1) == 0)
    {
LABEL_3:
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v5;

LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[3] = self->_linkLossNbrRouterCount;
    *((unsigned char *)v4 + 16) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0)
    {
LABEL_3:
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_linkLossNbrChildCount;
  *((unsigned char *)v4 + 16) |= 1u;

LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return result;
    }
LABEL_5:
    *((_DWORD *)result + 2) = self->_linkLossNbrChildCount;
    *((unsigned char *)result + 16) |= 1u;
    return result;
  }
  *((_DWORD *)result + 3) = self->_linkLossNbrRouterCount;
  *((unsigned char *)result + 16) |= 2u;
  if (*(unsigned char *)&self->_has) {
    goto LABEL_5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_linkLossNbrRouterCount != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_linkLossNbrChildCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v2 = 2654435761 * self->_linkLossNbrRouterCount;
    if (*(unsigned char *)&self->_has) {
      return (2654435761 * self->_linkLossNbrChildCount) ^ v2;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      return (2654435761 * self->_linkLossNbrChildCount) ^ v2;
    }
  }
  return v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((v4[4] & 2) != 0)
  {
    self->_linkLossNbrRouterCount = v4[3];
    *(unsigned char *)&self->_has |= 2u;
    if ((v4[4] & 1) == 0)
    {
LABEL_3:
      goto LABEL_5;
    }
  }
  else if ((v4[4] & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_linkLossNbrChildCount = v4[2];
  *(unsigned char *)&self->_has |= 1u;

LABEL_5:
}

- (unsigned)linkLossNbrRouterCount
{
  return self->_linkLossNbrRouterCount;
}

- (unsigned)linkLossNbrChildCount
{
  return self->_linkLossNbrChildCount;
}

@end