@interface _MPCProtoDelegateInfoTokenE
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)expirationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)playerDelegateInfoData;
- (uint64_t)sessionID;
- (uint64_t)setExpirationDate:(uint64_t)result;
- (uint64_t)setSessionID:(uint64_t)result;
- (uint64_t)storefront;
- (unint64_t)hash;
- (void)setPlayerDelegateInfoData:(uint64_t)a1;
- (void)setStorefront:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation _MPCProtoDelegateInfoTokenE

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefront, 0);

  objc_storeStrong((id *)&self->_playerDelegateInfoData, 0);
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_playerDelegateInfoData hash];
  NSUInteger v4 = [(NSString *)self->_storefront hash];
  char has = (char)self->_has;
  if (has)
  {
    double expirationDate = self->_expirationDate;
    double v8 = -expirationDate;
    if (expirationDate >= 0.0) {
      double v8 = self->_expirationDate;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((has & 2) != 0) {
    unint64_t v11 = 2654435761u * self->_sessionID;
  }
  else {
    unint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  playerDelegateInfoData = self->_playerDelegateInfoData;
  if ((unint64_t)playerDelegateInfoData | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](playerDelegateInfoData, "isEqual:")) {
      goto LABEL_15;
    }
  }
  storefront = self->_storefront;
  if ((unint64_t)storefront | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](storefront, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_expirationDate != *((double *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 40) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_sessionID != *((void *)v4 + 2)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_playerDelegateInfoData copyWithZone:a3];
  BOOL v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_storefront copyWithZone:a3];
  long double v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_expirationDate;
    *(unsigned char *)(v5 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_sessionID;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  return (id)v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_playerDelegateInfoData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_storefront)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _MPCProtoDelegateInfoTokenEReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  playerDelegateInfoData = self->_playerDelegateInfoData;
  if (playerDelegateInfoData) {
    [v3 setObject:playerDelegateInfoData forKey:@"playerDelegateInfoData"];
  }
  storefront = self->_storefront;
  if (storefront) {
    [v4 setObject:storefront forKey:@"storefront"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v8 = [NSNumber numberWithDouble:self->_expirationDate];
    [v4 setObject:v8 forKey:@"expirationDate"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    long double v9 = [NSNumber numberWithUnsignedLongLong:self->_sessionID];
    [v4 setObject:v9 forKey:@"sessionID"];
  }

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MPCProtoDelegateInfoTokenE;
  id v4 = [(_MPCProtoDelegateInfoTokenE *)&v8 description];
  uint64_t v5 = [(_MPCProtoDelegateInfoTokenE *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (uint64_t)setExpirationDate:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 40) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setSessionID:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 40) |= 2u;
    *(void *)(result + 16) = a2;
  }
  return result;
}

- (void)setPlayerDelegateInfoData:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setStorefront:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (uint64_t)playerDelegateInfoData
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (uint64_t)storefront
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (double)expirationDate
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)sessionID
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

@end