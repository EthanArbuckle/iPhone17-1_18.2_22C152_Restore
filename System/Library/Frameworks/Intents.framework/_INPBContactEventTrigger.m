@interface _INPBContactEventTrigger
+ (BOOL)supportsSecureCoding;
- (BOOL)hasTriggerContact;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBContact)triggerContact;
- (_INPBContactEventTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setTriggerContact:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBContactEventTrigger

- (void).cxx_destruct
{
}

- (_INPBContact)triggerContact
{
  return self->_triggerContact;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBContactEventTrigger *)self triggerContact];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"triggerContact"];

  return v3;
}

- (unint64_t)hash
{
  return [(_INPBContact *)self->_triggerContact hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_INPBContactEventTrigger *)self triggerContact];
    v6 = [v4 triggerContact];
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_INPBContactEventTrigger *)self triggerContact];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_INPBContactEventTrigger *)self triggerContact];
      v11 = [v4 triggerContact];
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
  v5 = [+[_INPBContactEventTrigger allocWithZone:](_INPBContactEventTrigger, "allocWithZone:") init];
  id v6 = [(_INPBContact *)self->_triggerContact copyWithZone:a3];
  [(_INPBContactEventTrigger *)v5 setTriggerContact:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBContactEventTrigger *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBContactEventTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBContactEventTrigger *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBContactEventTrigger *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBContactEventTrigger *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_INPBContactEventTrigger *)self triggerContact];

  if (v4)
  {
    v5 = [(_INPBContactEventTrigger *)self triggerContact];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBContactEventTriggerReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTriggerContact
{
  return self->_triggerContact != 0;
}

- (void)setTriggerContact:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end