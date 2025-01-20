@interface _INPBPayloadSuccess
+ (BOOL)supportsSecureCoding;
- (BOOL)hasResolvedKeyPath;
- (BOOL)hasResolvedValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)resolvedKeyPath;
- (_INPBIntentSlotValue)resolvedValue;
- (_INPBPayloadSuccess)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setResolvedKeyPath:(id)a3;
- (void)setResolvedValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPayloadSuccess

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBPayloadSuccess *)self resolvedKeyPath];
  v6 = [v4 resolvedKeyPath];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBPayloadSuccess *)self resolvedKeyPath];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBPayloadSuccess *)self resolvedKeyPath];
    v10 = [v4 resolvedKeyPath];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBPayloadSuccess *)self resolvedValue];
  v6 = [v4 resolvedValue];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBPayloadSuccess *)self resolvedValue];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_INPBPayloadSuccess *)self resolvedValue];
    v15 = [v4 resolvedValue];
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

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_resolvedKeyPath)
  {
    id v4 = [(_INPBPayloadSuccess *)self resolvedKeyPath];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"resolvedKeyPath"];
  }
  v6 = [(_INPBPayloadSuccess *)self resolvedValue];
  uint64_t v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"resolvedValue"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedValue, 0);

  objc_storeStrong((id *)&self->_resolvedKeyPath, 0);
}

- (_INPBIntentSlotValue)resolvedValue
{
  return self->_resolvedValue;
}

- (NSString)resolvedKeyPath
{
  return self->_resolvedKeyPath;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_resolvedKeyPath hash];
  return [(_INPBIntentSlotValue *)self->_resolvedValue hash] ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBPayloadSuccess allocWithZone:](_INPBPayloadSuccess, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_resolvedKeyPath copyWithZone:a3];
  [(_INPBPayloadSuccess *)v5 setResolvedKeyPath:v6];

  id v7 = [(_INPBIntentSlotValue *)self->_resolvedValue copyWithZone:a3];
  [(_INPBPayloadSuccess *)v5 setResolvedValue:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPayloadSuccess *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPayloadSuccess)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPayloadSuccess *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPayloadSuccess *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPayloadSuccess *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(_INPBPayloadSuccess *)self resolvedKeyPath];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(_INPBPayloadSuccess *)self resolvedValue];

  if (v5)
  {
    id v6 = [(_INPBPayloadSuccess *)self resolvedValue];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPayloadSuccessReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasResolvedValue
{
  return self->_resolvedValue != 0;
}

- (void)setResolvedValue:(id)a3
{
}

- (BOOL)hasResolvedKeyPath
{
  return self->_resolvedKeyPath != 0;
}

- (void)setResolvedKeyPath:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  resolvedKeyPath = self->_resolvedKeyPath;
  self->_resolvedKeyPath = v4;

  MEMORY[0x1F41817F8](v4, resolvedKeyPath);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end