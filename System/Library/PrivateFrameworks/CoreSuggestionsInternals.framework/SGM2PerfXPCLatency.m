@interface SGM2PerfXPCLatency
- (BOOL)hasKey;
- (BOOL)hasMethod;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)methodAsString:(int)a3;
- (int)StringAsMethod:(id)a3;
- (int)method;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMethod:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setMethod:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2PerfXPCLatency

- (void).cxx_destruct
{
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = (int *)a3;
  if (*((void *)v4 + 1))
  {
    v5 = v4;
    -[SGM2PerfXPCLatency setKey:](self, "setKey:");
    v4 = v5;
  }
  if (v4[5])
  {
    self->_method = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_method;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_method == *((_DWORD *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_method;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_key)
  {
    id v5 = v4;
    objc_msgSend(v4, "setKey:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_method;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SGM2PerfXPCLatencyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  if (*(unsigned char *)&self->_has)
  {
    if (self->_method)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_method);
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v6 = @"SGMSuggestionsFromMessage";
    }
    [v4 setObject:v6 forKey:@"method"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2PerfXPCLatency;
  id v4 = [(SGM2PerfXPCLatency *)&v8 description];
  id v5 = [(SGM2PerfXPCLatency *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsMethod:(id)a3
{
  return 0;
}

- (id)methodAsString:(int)a3
{
  if (a3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = @"SGMSuggestionsFromMessage";
  }
  return v4;
}

- (BOOL)hasMethod
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasMethod:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setMethod:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_method = a3;
}

- (int)method
{
  if (*(unsigned char *)&self->_has) {
    return self->_method;
  }
  else {
    return 0;
  }
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (NSString)key
{
  if (self->_key) {
    return self->_key;
  }
  else {
    return (NSString *)@"PerfXPCLatency";
  }
}

@end