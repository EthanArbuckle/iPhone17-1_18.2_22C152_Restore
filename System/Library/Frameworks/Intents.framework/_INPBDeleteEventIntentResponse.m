@interface _INPBDeleteEventIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasConfirmationReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDeleteEventIntentResponse)initWithCoder:(id)a3;
- (id)confirmationReasonAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsConfirmationReason:(id)a3;
- (int)confirmationReason;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConfirmationReason:(int)a3;
- (void)setHasConfirmationReason:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBDeleteEventIntentResponse

- (int)confirmationReason
{
  return self->_confirmationReason;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBDeleteEventIntentResponse *)self hasConfirmationReason])
  {
    uint64_t v4 = [(_INPBDeleteEventIntentResponse *)self confirmationReason];
    if (v4 == 1)
    {
      v5 = @"DELETE_ALL_RECURRENCES";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v5 forKeyedSubscript:@"confirmationReason"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBDeleteEventIntentResponse *)self hasConfirmationReason]) {
    return 2654435761 * self->_confirmationReason;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBDeleteEventIntentResponse *)self hasConfirmationReason];
    if (v5 == [v4 hasConfirmationReason])
    {
      if (![(_INPBDeleteEventIntentResponse *)self hasConfirmationReason]
        || ![v4 hasConfirmationReason]
        || (int confirmationReason = self->_confirmationReason,
            confirmationReason == [v4 confirmationReason]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_INPBDeleteEventIntentResponse allocWithZone:a3] init];
  if ([(_INPBDeleteEventIntentResponse *)self hasConfirmationReason]) {
    [(_INPBDeleteEventIntentResponse *)v4 setConfirmationReason:[(_INPBDeleteEventIntentResponse *)self confirmationReason]];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBDeleteEventIntentResponse *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBDeleteEventIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBDeleteEventIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBDeleteEventIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBDeleteEventIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_INPBDeleteEventIntentResponse *)self hasConfirmationReason]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDeleteEventIntentResponseReadFrom(self, (uint64_t)a3);
}

- (int)StringAsConfirmationReason:(id)a3
{
  return 1;
}

- (id)confirmationReasonAsString:(int)a3
{
  if (a3 == 1)
  {
    id v4 = @"DELETE_ALL_RECURRENCES";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasConfirmationReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfirmationReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setConfirmationReason:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int confirmationReason = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end