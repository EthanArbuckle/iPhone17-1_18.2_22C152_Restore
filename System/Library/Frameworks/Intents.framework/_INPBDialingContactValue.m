@interface _INPBDialingContactValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDialingContact;
- (BOOL)hasDialingPhoneLabel;
- (BOOL)hasDialingPhoneNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBContactValue)dialingContact;
- (_INPBDialingContactValue)initWithCoder:(id)a3;
- (_INPBStringValue)dialingPhoneLabel;
- (_INPBStringValue)dialingPhoneNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDialingContact:(id)a3;
- (void)setDialingPhoneLabel:(id)a3;
- (void)setDialingPhoneNumber:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBDialingContactValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialingPhoneNumber, 0);
  objc_storeStrong((id *)&self->_dialingPhoneLabel, 0);

  objc_storeStrong((id *)&self->_dialingContact, 0);
}

- (_INPBStringValue)dialingPhoneNumber
{
  return self->_dialingPhoneNumber;
}

- (_INPBStringValue)dialingPhoneLabel
{
  return self->_dialingPhoneLabel;
}

- (_INPBContactValue)dialingContact
{
  return self->_dialingContact;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBDialingContactValue *)self dialingContact];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"dialingContact"];

  v6 = [(_INPBDialingContactValue *)self dialingPhoneLabel];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"dialingPhoneLabel"];

  v8 = [(_INPBDialingContactValue *)self dialingPhoneNumber];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"dialingPhoneNumber"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBContactValue *)self->_dialingContact hash];
  unint64_t v4 = [(_INPBStringValue *)self->_dialingPhoneLabel hash] ^ v3;
  return v4 ^ [(_INPBStringValue *)self->_dialingPhoneNumber hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBDialingContactValue *)self dialingContact];
  v6 = [v4 dialingContact];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBDialingContactValue *)self dialingContact];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBDialingContactValue *)self dialingContact];
    v10 = [v4 dialingContact];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBDialingContactValue *)self dialingPhoneLabel];
  v6 = [v4 dialingPhoneLabel];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBDialingContactValue *)self dialingPhoneLabel];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBDialingContactValue *)self dialingPhoneLabel];
    v15 = [v4 dialingPhoneLabel];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBDialingContactValue *)self dialingPhoneNumber];
  v6 = [v4 dialingPhoneNumber];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBDialingContactValue *)self dialingPhoneNumber];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBDialingContactValue *)self dialingPhoneNumber];
    v20 = [v4 dialingPhoneNumber];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBDialingContactValue allocWithZone:](_INPBDialingContactValue, "allocWithZone:") init];
  id v6 = [(_INPBContactValue *)self->_dialingContact copyWithZone:a3];
  [(_INPBDialingContactValue *)v5 setDialingContact:v6];

  id v7 = [(_INPBStringValue *)self->_dialingPhoneLabel copyWithZone:a3];
  [(_INPBDialingContactValue *)v5 setDialingPhoneLabel:v7];

  id v8 = [(_INPBStringValue *)self->_dialingPhoneNumber copyWithZone:a3];
  [(_INPBDialingContactValue *)v5 setDialingPhoneNumber:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBDialingContactValue *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBDialingContactValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBDialingContactValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBDialingContactValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBDialingContactValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(_INPBDialingContactValue *)self dialingContact];

  if (v4)
  {
    v5 = [(_INPBDialingContactValue *)self dialingContact];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBDialingContactValue *)self dialingPhoneLabel];

  if (v6)
  {
    uint64_t v7 = [(_INPBDialingContactValue *)self dialingPhoneLabel];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBDialingContactValue *)self dialingPhoneNumber];

  if (v8)
  {
    v9 = [(_INPBDialingContactValue *)self dialingPhoneNumber];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDialingContactValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasDialingPhoneNumber
{
  return self->_dialingPhoneNumber != 0;
}

- (void)setDialingPhoneNumber:(id)a3
{
}

- (BOOL)hasDialingPhoneLabel
{
  return self->_dialingPhoneLabel != 0;
}

- (void)setDialingPhoneLabel:(id)a3
{
}

- (BOOL)hasDialingContact
{
  return self->_dialingContact != 0;
}

- (void)setDialingContact:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end