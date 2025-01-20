@interface _INPBTimestamp
+ (BOOL)supportsSecureCoding;
- (BOOL)hasNanos;
- (BOOL)hasSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBTimestamp)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)nanos;
- (int64_t)seconds;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasNanos:(BOOL)a3;
- (void)setHasSeconds:(BOOL)a3;
- (void)setNanos:(int)a3;
- (void)setSeconds:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBTimestamp

- (int64_t)seconds
{
  return self->_seconds;
}

- (int)nanos
{
  return self->_nanos;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBTimestamp *)self hasNanos])
  {
    v4 = objc_msgSend(NSNumber, "numberWithInt:", -[_INPBTimestamp nanos](self, "nanos"));
    [v3 setObject:v4 forKeyedSubscript:@"nanos"];
  }
  if ([(_INPBTimestamp *)self hasSeconds])
  {
    v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_INPBTimestamp seconds](self, "seconds"));
    [v3 setObject:v5 forKeyedSubscript:@"seconds"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBTimestamp *)self hasNanos]) {
    uint64_t v3 = 2654435761 * self->_nanos;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(_INPBTimestamp *)self hasSeconds]) {
    uint64_t v4 = 2654435761 * self->_seconds;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v8 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBTimestamp *)self hasNanos];
    if (v5 == [v4 hasNanos])
    {
      if (![(_INPBTimestamp *)self hasNanos]
        || ![v4 hasNanos]
        || (int nanos = self->_nanos, nanos == [v4 nanos]))
      {
        int v7 = [(_INPBTimestamp *)self hasSeconds];
        if (v7 == [v4 hasSeconds])
        {
          if (![(_INPBTimestamp *)self hasSeconds]
            || ![v4 hasSeconds]
            || (int64_t seconds = self->_seconds, seconds == [v4 seconds]))
          {
            BOOL v8 = 1;
          }
        }
      }
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_INPBTimestamp allocWithZone:a3] init];
  if ([(_INPBTimestamp *)self hasNanos]) {
    [(_INPBTimestamp *)v4 setNanos:[(_INPBTimestamp *)self nanos]];
  }
  if ([(_INPBTimestamp *)self hasSeconds]) {
    [(_INPBTimestamp *)v4 setSeconds:[(_INPBTimestamp *)self seconds]];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBTimestamp *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBTimestamp)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBTimestamp *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBTimestamp *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBTimestamp *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_INPBTimestamp *)self hasNanos]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBTimestamp *)self hasSeconds]) {
    PBDataWriterWriteInt64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBTimestampReadFrom(self, (uint64_t)a3);
}

- (void)setHasSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSeconds
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSeconds:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int64_t seconds = a3;
}

- (void)setHasNanos:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNanos
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNanos:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int nanos = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end