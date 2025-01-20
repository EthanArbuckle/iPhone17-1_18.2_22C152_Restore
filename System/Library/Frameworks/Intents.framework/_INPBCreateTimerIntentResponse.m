@interface _INPBCreateTimerIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCreatedTimer;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBCreateTimerIntentResponse)initWithCoder:(id)a3;
- (_INPBTimer)createdTimer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCreatedTimer:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCreateTimerIntentResponse

- (void).cxx_destruct
{
}

- (_INPBTimer)createdTimer
{
  return self->_createdTimer;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBCreateTimerIntentResponse *)self createdTimer];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"createdTimer"];

  return v3;
}

- (unint64_t)hash
{
  return [(_INPBTimer *)self->_createdTimer hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_INPBCreateTimerIntentResponse *)self createdTimer];
    v6 = [v4 createdTimer];
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_INPBCreateTimerIntentResponse *)self createdTimer];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_INPBCreateTimerIntentResponse *)self createdTimer];
      v11 = [v4 createdTimer];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBCreateTimerIntentResponse allocWithZone:](_INPBCreateTimerIntentResponse, "allocWithZone:") init];
  id v6 = [(_INPBTimer *)self->_createdTimer copyWithZone:a3];
  [(_INPBCreateTimerIntentResponse *)v5 setCreatedTimer:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCreateTimerIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCreateTimerIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCreateTimerIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCreateTimerIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCreateTimerIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_INPBCreateTimerIntentResponse *)self createdTimer];

  if (v4)
  {
    v5 = [(_INPBCreateTimerIntentResponse *)self createdTimer];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCreateTimerIntentResponseReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasCreatedTimer
{
  return self->_createdTimer != 0;
}

- (void)setCreatedTimer:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end