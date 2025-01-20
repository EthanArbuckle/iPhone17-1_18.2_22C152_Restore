@interface GEOPBOfflineServiceMetrics
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBOfflineServiceMetrics

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBOfflineServiceMetrics;
  v4 = [(GEOPBOfflineServiceMetrics *)&v8 description];
  v5 = [(GEOPBOfflineServiceMetrics *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBOfflineServiceMetrics _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_21;
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 1) == 0)
  {
    if ((*(unsigned char *)(a1 + 28) & 2) == 0) {
      goto LABEL_4;
    }
LABEL_10:
    objc_super v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
    if (a2) {
      v9 = @"stopTimeMs";
    }
    else {
      v9 = @"stop_time_ms";
    }
    [v4 setObject:v8 forKey:v9];

    if ((*(unsigned char *)(a1 + 28) & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_14;
  }
  v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
  if (a2) {
    v7 = @"startTimeMs";
  }
  else {
    v7 = @"start_time_ms";
  }
  [v4 setObject:v6 forKey:v7];

  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 2) != 0) {
    goto LABEL_10;
  }
LABEL_4:
  if ((v5 & 4) != 0)
  {
LABEL_14:
    uint64_t v10 = *(int *)(a1 + 24);
    if (v10 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E53F5A60[v10];
    }
    if (a2) {
      v12 = @"serviceId";
    }
    else {
      v12 = @"service_id";
    }
    [v4 setObject:v11 forKey:v12];
  }
LABEL_21:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBOfflineServiceMetrics _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBOfflineServiceMetricsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((void *)result + 1) = self->_startTimeMs;
    *((unsigned char *)result + 28) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = self->_stopTimeMs;
  *((unsigned char *)result + 28) |= 2u;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 6) = self->_serviceId;
  *((unsigned char *)result + 28) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_startTimeMs != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_stopTimeMs != *((void *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_serviceId != *((_DWORD *)v4 + 6)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  unint64_t v2 = 2654435761u * self->_startTimeMs;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_stopTimeMs;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_serviceId;
  return v3 ^ v2 ^ v4;
}

@end