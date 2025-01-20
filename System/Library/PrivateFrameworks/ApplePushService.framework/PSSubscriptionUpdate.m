@interface PSSubscriptionUpdate
- (BOOL)hasSubscriptionsStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)subscriptionsStatusAsString:(int)a3;
- (int)StringAsSubscriptionsStatus:(id)a3;
- (int)subscriptionsStatus;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSubscriptionsStatus:(BOOL)a3;
- (void)setSubscriptionsStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSSubscriptionUpdate

- (int)subscriptionsStatus
{
  if (*(unsigned char *)&self->_has) {
    return self->_subscriptionsStatus;
  }
  else {
    return 0;
  }
}

- (void)setSubscriptionsStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_subscriptionsStatus = a3;
}

- (void)setHasSubscriptionsStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSubscriptionsStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)subscriptionsStatusAsString:(int)a3
{
  if (a3)
  {
    v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v4 = @"RESEND_SUBSCRIPTIONS";
  }
  return v4;
}

- (int)StringAsSubscriptionsStatus:(id)a3
{
  return 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PSSubscriptionUpdate;
  uint64_t v3 = [(PSSubscriptionUpdate *)&v7 description];
  v4 = [(PSSubscriptionUpdate *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    if (self->_subscriptionsStatus)
    {
      v4 = +[NSString stringWithFormat:@"(unknown: %i)", self->_subscriptionsStatus];
    }
    else
    {
      v4 = @"RESEND_SUBSCRIPTIONS";
    }
    [v3 setObject:v4 forKey:@"subscriptions_status"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100074C9C((uint64_t)self, (uint64_t)a3);
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
    *((_DWORD *)a3 + 2) = self->_subscriptionsStatus;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_subscriptionsStatus;
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
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_subscriptionsStatus == *((_DWORD *)v4 + 2))
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
    return 2654435761 * self->_subscriptionsStatus;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_subscriptionsStatus = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

@end