@interface CLPLocationProcessingMetadata
- (BOOL)hasTripSourceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tripSourceTypeAsString:(int)a3;
- (int)StringAsTripSourceType:(id)a3;
- (int)tripSourceType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTripSourceType:(BOOL)a3;
- (void)setTripSourceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPLocationProcessingMetadata

- (int)tripSourceType
{
  if (*(unsigned char *)&self->_has) {
    return self->_tripSourceType;
  }
  else {
    return 0;
  }
}

- (void)setTripSourceType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_tripSourceType = a3;
}

- (void)setHasTripSourceType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTripSourceType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)tripSourceTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E6C35FD0[a3];
  }

  return v3;
}

- (int)StringAsTripSourceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Loc"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RtLoc"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Both"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPLocationProcessingMetadata;
  int v4 = [(CLPLocationProcessingMetadata *)&v8 description];
  v5 = [(CLPLocationProcessingMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t tripSourceType = self->_tripSourceType;
    if (tripSourceType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_tripSourceType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E6C35FD0[tripSourceType];
    }
    [v3 setObject:v5 forKey:@"tripSourceType"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLocationProcessingMetadataReadFrom((uint64_t)self, (uint64_t)a3);
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
    *((_DWORD *)a3 + 2) = self->_tripSourceType;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_tripSourceType;
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
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_tripSourceType == *((_DWORD *)v4 + 2))
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
    return 2654435761 * self->_tripSourceType;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_uint64_t tripSourceType = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

@end