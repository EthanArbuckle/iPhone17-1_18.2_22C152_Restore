@interface HDCodableRoutineLocationRequest
- (BOOL)hasLocationType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)locationTypeAsString:(int)a3;
- (int)StringAsLocationType:(id)a3;
- (int)locationType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLocationType:(BOOL)a3;
- (void)setLocationType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableRoutineLocationRequest

- (int)locationType
{
  if (*(unsigned char *)&self->_has) {
    return self->_locationType;
  }
  else {
    return 1;
  }
}

- (void)setLocationType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_locationType = a3;
}

- (void)setHasLocationType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLocationType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)locationTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"CurrentLocation";
  }
  else if (a3 == 2)
  {
    v4 = @"CachedLocation";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsLocationType:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"CurrentLocation"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"CachedLocation"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableRoutineLocationRequest;
  int v4 = [(HDCodableRoutineLocationRequest *)&v8 description];
  v5 = [(HDCodableRoutineLocationRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int locationType = self->_locationType;
    if (locationType == 1)
    {
      v5 = @"CurrentLocation";
    }
    else if (locationType == 2)
    {
      v5 = @"CachedLocation";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_locationType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v5 forKey:@"locationType"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableRoutineLocationRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
    *((_DWORD *)a3 + 2) = self->_locationType;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_locationType;
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
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_locationType == *((_DWORD *)v4 + 2))
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
    return 2654435761 * self->_locationType;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_int locationType = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

@end