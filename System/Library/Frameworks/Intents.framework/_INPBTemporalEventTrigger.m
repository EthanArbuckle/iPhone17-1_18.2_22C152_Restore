@interface _INPBTemporalEventTrigger
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDateTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDateTimeRangeValue)dateTime;
- (_INPBTemporalEventTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDateTime:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBTemporalEventTrigger

- (_INPBTemporalEventTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBTemporalEventTrigger *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        v6 = (_INPBTemporalEventTrigger *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBTemporalEventTrigger *)self initWithData:v6];

    v6 = self;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBTemporalEventTrigger allocWithZone:](_INPBTemporalEventTrigger, "allocWithZone:") init];
  id v6 = [(_INPBDateTimeRangeValue *)self->_dateTime copyWithZone:a3];
  [(_INPBTemporalEventTrigger *)v5 setDateTime:v6];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_INPBTemporalEventTrigger *)self dateTime];
    id v6 = [v4 dateTime];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_INPBTemporalEventTrigger *)self dateTime];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_INPBTemporalEventTrigger *)self dateTime];
      v11 = [v4 dateTime];
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

- (void).cxx_destruct
{
}

- (_INPBDateTimeRangeValue)dateTime
{
  return self->_dateTime;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(_INPBTemporalEventTrigger *)self dateTime];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"dateTime"];

  return v3;
}

- (unint64_t)hash
{
  return [(_INPBDateTimeRangeValue *)self->_dateTime hash];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBTemporalEventTrigger *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_INPBTemporalEventTrigger *)self dateTime];

  if (v4)
  {
    v5 = [(_INPBTemporalEventTrigger *)self dateTime];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBTemporalEventTriggerReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasDateTime
{
  return self->_dateTime != 0;
}

- (void)setDateTime:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end