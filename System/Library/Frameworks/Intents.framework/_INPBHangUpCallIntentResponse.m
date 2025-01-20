@interface _INPBHangUpCallIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasHungUpCallType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBHangUpCallIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)hungUpCallTypeAsString:(int)a3;
- (int)StringAsHungUpCallType:(id)a3;
- (int)hungUpCallType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasHungUpCallType:(BOOL)a3;
- (void)setHungUpCallType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBHangUpCallIntentResponse

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBHangUpCallIntentResponse *)self hasHungUpCallType];
    if (v5 == [v4 hasHungUpCallType])
    {
      if (![(_INPBHangUpCallIntentResponse *)self hasHungUpCallType]
        || ![v4 hasHungUpCallType]
        || (int hungUpCallType = self->_hungUpCallType, hungUpCallType == [v4 hungUpCallType]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (int)hungUpCallType
{
  return self->_hungUpCallType;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBHangUpCallIntentResponse *)self hasHungUpCallType])
  {
    uint64_t v4 = [(_INPBHangUpCallIntentResponse *)self hungUpCallType];
    int v5 = v4 - 2;
    if (v4 - 2) < 9 && ((0x1EFu >> v5))
    {
      BOOL v6 = off_1E551F5B8[v5];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      BOOL v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v6 forKeyedSubscript:@"hungUpCallType"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBHangUpCallIntentResponse *)self hasHungUpCallType]) {
    return 2654435761 * self->_hungUpCallType;
  }
  else {
    return 0;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[_INPBHangUpCallIntentResponse allocWithZone:a3] init];
  if ([(_INPBHangUpCallIntentResponse *)self hasHungUpCallType]) {
    [(_INPBHangUpCallIntentResponse *)v4 setHungUpCallType:[(_INPBHangUpCallIntentResponse *)self hungUpCallType]];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBHangUpCallIntentResponse *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBHangUpCallIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBHangUpCallIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBHangUpCallIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBHangUpCallIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_INPBHangUpCallIntentResponse *)self hasHungUpCallType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBHangUpCallIntentResponseReadFrom(self, (uint64_t)a3);
}

- (int)StringAsHungUpCallType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"OUTGOING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MISSED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RECEIVED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LATEST"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"VOICEMAIL"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RINGING"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"IN_PROGRESS"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ON_HOLD"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 2;
  }

  return v4;
}

- (id)hungUpCallTypeAsString:(int)a3
{
  int v3 = a3 - 2;
  if (a3 - 2) < 9 && ((0x1EFu >> v3))
  {
    int v4 = off_1E551F5B8[v3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)setHasHungUpCallType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHungUpCallType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHungUpCallType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int hungUpCallType = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end