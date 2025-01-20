@interface GEOAddressCorrectionUpdateResponse
+ (BOOL)isValid:(id)a3;
- (BOOL)hasRetryScheduleInDays;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAddressCorrectionUpdateResponse)initWithDictionary:(id)a3;
- (GEOAddressCorrectionUpdateResponse)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)retryScheduleInDays;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRetryScheduleInDays:(BOOL)a3;
- (void)setRetryScheduleInDays:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAddressCorrectionUpdateResponse

- (unsigned)retryScheduleInDays
{
  return self->_retryScheduleInDays;
}

- (void)setRetryScheduleInDays:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_retryScheduleInDays = a3;
}

- (void)setHasRetryScheduleInDays:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasRetryScheduleInDays
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAddressCorrectionUpdateResponse;
  v4 = [(GEOAddressCorrectionUpdateResponse *)&v8 description];
  v5 = [(GEOAddressCorrectionUpdateResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 12))
    {
      v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 8)];
      [v2 setObject:v3 forKey:@"retryScheduleInDays"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEOAddressCorrectionUpdateResponse)initWithDictionary:(id)a3
{
  return (GEOAddressCorrectionUpdateResponse *)-[GEOAddressCorrectionUpdateResponse _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"retryScheduleInDays"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRetryScheduleInDays:", objc_msgSend(v4, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOAddressCorrectionUpdateResponse)initWithJSON:(id)a3
{
  return (GEOAddressCorrectionUpdateResponse *)-[GEOAddressCorrectionUpdateResponse _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAddressCorrectionUpdateResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAddressCorrectionUpdateResponseReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  [(GEOAddressCorrectionUpdateResponse *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v4[2] = self->_retryScheduleInDays;
    *((unsigned char *)v4 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)result + 2) = self->_retryScheduleInDays;
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
  [(GEOAddressCorrectionUpdateResponse *)self readAll:1];
  [v4 readAll:1];
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_retryScheduleInDays == *((_DWORD *)v4 + 2))
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
  if (*(unsigned char *)&self->_flags) {
    return 2654435761 * self->_retryScheduleInDays;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  id v4 = (unsigned int *)a3;
  [v4 readAll:0];
  if (v4[3])
  {
    self->_retryScheduleInDays = v4[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end