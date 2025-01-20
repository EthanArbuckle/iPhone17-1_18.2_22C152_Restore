@interface _INPBCarHeadUnit
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBluetoothIdentifier;
- (BOOL)hasIAP2Identifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bluetoothIdentifier;
- (NSString)iAP2Identifier;
- (_INPBCarHeadUnit)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBluetoothIdentifier:(id)a3;
- (void)setIAP2Identifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCarHeadUnit

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iAP2Identifier, 0);

  objc_storeStrong((id *)&self->_bluetoothIdentifier, 0);
}

- (NSString)iAP2Identifier
{
  return self->_iAP2Identifier;
}

- (NSString)bluetoothIdentifier
{
  return self->_bluetoothIdentifier;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_bluetoothIdentifier)
  {
    v4 = [(_INPBCarHeadUnit *)self bluetoothIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"bluetoothIdentifier"];
  }
  if (self->_iAP2Identifier)
  {
    v6 = [(_INPBCarHeadUnit *)self iAP2Identifier];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"iAP2Identifier"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bluetoothIdentifier hash];
  return [(NSString *)self->_iAP2Identifier hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBCarHeadUnit *)self bluetoothIdentifier];
  v6 = [v4 bluetoothIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBCarHeadUnit *)self bluetoothIdentifier];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBCarHeadUnit *)self bluetoothIdentifier];
    v10 = [v4 bluetoothIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBCarHeadUnit *)self iAP2Identifier];
  v6 = [v4 iAP2Identifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBCarHeadUnit *)self iAP2Identifier];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_INPBCarHeadUnit *)self iAP2Identifier];
    v15 = [v4 iAP2Identifier];
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
  v5 = [+[_INPBCarHeadUnit allocWithZone:](_INPBCarHeadUnit, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_bluetoothIdentifier copyWithZone:a3];
  [(_INPBCarHeadUnit *)v5 setBluetoothIdentifier:v6];

  uint64_t v7 = (void *)[(NSString *)self->_iAP2Identifier copyWithZone:a3];
  [(_INPBCarHeadUnit *)v5 setIAP2Identifier:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCarHeadUnit *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCarHeadUnit)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCarHeadUnit *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCarHeadUnit *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCarHeadUnit *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_INPBCarHeadUnit *)self bluetoothIdentifier];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(_INPBCarHeadUnit *)self iAP2Identifier];

  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCarHeadUnitReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasIAP2Identifier
{
  return self->_iAP2Identifier != 0;
}

- (void)setIAP2Identifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  iAP2Identifier = self->_iAP2Identifier;
  self->_iAP2Identifier = v4;

  MEMORY[0x1F41817F8](v4, iAP2Identifier);
}

- (BOOL)hasBluetoothIdentifier
{
  return self->_bluetoothIdentifier != 0;
}

- (void)setBluetoothIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  bluetoothIdentifier = self->_bluetoothIdentifier;
  self->_bluetoothIdentifier = v4;

  MEMORY[0x1F41817F8](v4, bluetoothIdentifier);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end