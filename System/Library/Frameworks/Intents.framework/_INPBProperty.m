@interface _INPBProperty
+ (BOOL)supportsSecureCoding;
- (BOOL)hasPayload;
- (BOOL)hasRole;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)role;
- (_INPBIntentSlotValue)payload;
- (_INPBProperty)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPayload:(id)a3;
- (void)setRole:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBProperty

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBProperty *)self payload];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"payload"];

  if (self->_role)
  {
    v6 = [(_INPBProperty *)self role];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"role"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentSlotValue *)self->_payload hash];
  return [(NSString *)self->_role hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);

  objc_storeStrong((id *)&self->_payload, 0);
}

- (NSString)role
{
  return self->_role;
}

- (_INPBIntentSlotValue)payload
{
  return self->_payload;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBProperty *)self payload];
  v6 = [v4 payload];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBProperty *)self payload];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBProperty *)self payload];
    v10 = [v4 payload];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBProperty *)self role];
  v6 = [v4 role];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBProperty *)self role];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_INPBProperty *)self role];
    v15 = [v4 role];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBProperty allocWithZone:](_INPBProperty, "allocWithZone:") init];
  id v6 = [(_INPBIntentSlotValue *)self->_payload copyWithZone:a3];
  [(_INPBProperty *)v5 setPayload:v6];

  uint64_t v7 = (void *)[(NSString *)self->_role copyWithZone:a3];
  [(_INPBProperty *)v5 setRole:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBProperty *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBProperty)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBProperty *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBProperty *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBProperty *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(_INPBProperty *)self payload];

  if (v4)
  {
    v5 = [(_INPBProperty *)self payload];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBProperty *)self role];

  if (v6) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPropertyReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasRole
{
  return self->_role != 0;
}

- (void)setRole:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  role = self->_role;
  self->_role = v4;

  MEMORY[0x1F41817F8](v4, role);
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
}

- (void)setPayload:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end