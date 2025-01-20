@interface AWDCountersEngagementS
- (BOOL)hasChildNodesCount;
- (BOOL)hasRouterNodesCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)childNodesCount;
- (unsigned)routerNodesCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChildNodesCount:(unsigned int)a3;
- (void)setHasChildNodesCount:(BOOL)a3;
- (void)setHasRouterNodesCount:(BOOL)a3;
- (void)setRouterNodesCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersEngagementS

- (void)setRouterNodesCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_routerNodesCount = a3;
}

- (void)setHasRouterNodesCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRouterNodesCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setChildNodesCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_childNodesCount = a3;
}

- (void)setHasChildNodesCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChildNodesCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDCountersEngagementS;
  char v3 = [(AWDCountersEngagementS *)&v7 description];
  v4 = [(AWDCountersEngagementS *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_routerNodesCount];
    [v3 setObject:v5 forKey:@"router_nodes_count"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_childNodesCount];
    [v3 setObject:v6 forKey:@"child_nodes_count"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCountersEngagementSReadFrom((uint64_t)self, (uint64_t)a3);
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
    v4[3] = self->_routerNodesCount;
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
  v4[2] = self->_childNodesCount;
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
    *((_DWORD *)result + 2) = self->_childNodesCount;
    *((unsigned char *)result + 16) |= 1u;
    return result;
  }
  *((_DWORD *)result + 3) = self->_routerNodesCount;
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
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_routerNodesCount != *((_DWORD *)v4 + 3)) {
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
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_childNodesCount != *((_DWORD *)v4 + 2)) {
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
    unint64_t v2 = 2654435761 * self->_routerNodesCount;
    if (*(unsigned char *)&self->_has) {
      return (2654435761 * self->_childNodesCount) ^ v2;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      return (2654435761 * self->_childNodesCount) ^ v2;
    }
  }
  return v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((v4[4] & 2) != 0)
  {
    self->_routerNodesCount = v4[3];
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
  self->_childNodesCount = v4[2];
  *(unsigned char *)&self->_has |= 1u;

LABEL_5:
}

- (unsigned)routerNodesCount
{
  return self->_routerNodesCount;
}

- (unsigned)childNodesCount
{
  return self->_childNodesCount;
}

@end