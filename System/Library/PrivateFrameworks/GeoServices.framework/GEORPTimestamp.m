@interface GEORPTimestamp
+ (BOOL)isValid:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPTimestamp)initWithDictionary:(id)a3;
- (GEORPTimestamp)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)nanos;
- (int64_t)seconds;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setNanos:(int)a3;
- (void)setSeconds:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPTimestamp

- (int64_t)seconds
{
  return self->_seconds;
}

- (void)setSeconds:(int64_t)a3
{
  self->_seconds = a3;
}

- (int)nanos
{
  return self->_nanos;
}

- (void)setNanos:(int)a3
{
  self->_nanos = a3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPTimestamp;
  v4 = [(GEORPTimestamp *)&v8 description];
  v5 = [(GEORPTimestamp *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    v3 = [NSNumber numberWithLongLong:*(void *)(a1 + 8)];
    [v2 setObject:v3 forKey:@"seconds"];

    v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 16)];
    [v2 setObject:v4 forKey:@"nanos"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEORPTimestamp)initWithDictionary:(id)a3
{
  return (GEORPTimestamp *)-[GEORPTimestamp _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"seconds"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSeconds:", objc_msgSend(v4, "longLongValue"));
      }

      v5 = [v3 objectForKeyedSubscript:@"nanos"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setNanos:", objc_msgSend(v5, "intValue"));
      }
    }
  }

  return a1;
}

- (GEORPTimestamp)initWithJSON:(id)a3
{
  return (GEORPTimestamp *)-[GEORPTimestamp _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPTimestampIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPTimestampReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  [(GEORPTimestamp *)self readAll:0];
  v4[1] = self->_seconds;
  *((_DWORD *)v4 + 4) = self->_nanos;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 1) = self->_seconds;
  *((_DWORD *)result + 4) = self->_nanos;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && ([(GEORPTimestamp *)self readAll:1],
        [v4 readAll:1],
        self->_seconds == *((void *)v4 + 1))
    && self->_nanos == *((_DWORD *)v4 + 4);

  return v5;
}

- (unint64_t)hash
{
  return (2654435761 * self->_nanos) ^ (2654435761 * self->_seconds);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  self->_seconds = *((void *)v4 + 1);
  int v5 = *((_DWORD *)v4 + 4);

  self->_nanos = v5;
}

@end