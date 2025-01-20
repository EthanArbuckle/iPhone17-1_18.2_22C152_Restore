@interface OTSupportSOSMessage
- (BOOL)hasSupported;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)supportedAsString:(int)a3;
- (int)StringAsSupported:(id)a3;
- (int)supported;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSupported:(BOOL)a3;
- (void)setSupported:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTSupportSOSMessage

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_supported = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_supported;
  }
  else {
    return 0;
  }
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
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_supported == *((_DWORD *)v4 + 2))
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

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_supported;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_supported;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    MEMORY[0x270F58560](a3, self->_supported, 1);
  }
}

- (BOOL)readFrom:(id)a3
{
  return OTSupportSOSMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t supported = self->_supported;
    if (supported >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_supported);
      BOOL v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v5 = off_264315010[supported];
    }
    [v3 setObject:v5 forKey:@"supported"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)OTSupportSOSMessage;
  id v4 = [(OTSupportSOSMessage *)&v8 description];
  BOOL v5 = [(OTSupportSOSMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsSupported:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"supported"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"not_supported"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)supportedAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_264315010[a3];
  }
  return v3;
}

- (BOOL)hasSupported
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasSupported:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setSupported:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t supported = a3;
}

- (int)supported
{
  if (*(unsigned char *)&self->_has) {
    return self->_supported;
  }
  else {
    return 0;
  }
}

@end