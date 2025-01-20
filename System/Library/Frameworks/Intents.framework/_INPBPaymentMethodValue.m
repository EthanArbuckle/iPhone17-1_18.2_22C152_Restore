@interface _INPBPaymentMethodValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIcon;
- (BOOL)hasIdentificationHint;
- (BOOL)hasName;
- (BOOL)hasType;
- (BOOL)hasValueMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identificationHint;
- (NSString)name;
- (_INPBImageValue)icon;
- (_INPBPaymentMethodValue)initWithCoder:(id)a3;
- (_INPBValueMetadata)valueMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIdentificationHint:(id)a3;
- (void)setName:(id)a3;
- (void)setType:(int)a3;
- (void)setValueMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPaymentMethodValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identificationHint, 0);

  objc_storeStrong((id *)&self->_icon, 0);
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (int)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identificationHint
{
  return self->_identificationHint;
}

- (_INPBImageValue)icon
{
  return self->_icon;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBPaymentMethodValue *)self icon];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"icon"];

  if (self->_identificationHint)
  {
    v6 = [(_INPBPaymentMethodValue *)self identificationHint];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"identificationHint"];
  }
  if (self->_name)
  {
    v8 = [(_INPBPaymentMethodValue *)self name];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"name"];
  }
  if ([(_INPBPaymentMethodValue *)self hasType])
  {
    uint64_t v10 = [(_INPBPaymentMethodValue *)self type];
    if ((v10 - 1) >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E5518BE8[(v10 - 1)];
    }
    [v3 setObject:v11 forKeyedSubscript:@"type"];
  }
  v12 = [(_INPBPaymentMethodValue *)self valueMetadata];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBImageValue *)self->_icon hash];
  NSUInteger v4 = [(NSString *)self->_identificationHint hash];
  NSUInteger v5 = [(NSString *)self->_name hash];
  if ([(_INPBPaymentMethodValue *)self hasType]) {
    uint64_t v6 = 2654435761 * self->_type;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(_INPBValueMetadata *)self->_valueMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  NSUInteger v5 = [(_INPBPaymentMethodValue *)self icon];
  uint64_t v6 = [v4 icon];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_25;
  }
  uint64_t v7 = [(_INPBPaymentMethodValue *)self icon];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBPaymentMethodValue *)self icon];
    uint64_t v10 = [v4 icon];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBPaymentMethodValue *)self identificationHint];
  uint64_t v6 = [v4 identificationHint];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_25;
  }
  uint64_t v12 = [(_INPBPaymentMethodValue *)self identificationHint];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBPaymentMethodValue *)self identificationHint];
    v15 = [v4 identificationHint];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBPaymentMethodValue *)self name];
  uint64_t v6 = [v4 name];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_25;
  }
  uint64_t v17 = [(_INPBPaymentMethodValue *)self name];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBPaymentMethodValue *)self name];
    v20 = [v4 name];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  int v22 = [(_INPBPaymentMethodValue *)self hasType];
  if (v22 != [v4 hasType]) {
    goto LABEL_26;
  }
  if ([(_INPBPaymentMethodValue *)self hasType])
  {
    if ([v4 hasType])
    {
      int type = self->_type;
      if (type != [v4 type]) {
        goto LABEL_26;
      }
    }
  }
  NSUInteger v5 = [(_INPBPaymentMethodValue *)self valueMetadata];
  uint64_t v6 = [v4 valueMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v24 = [(_INPBPaymentMethodValue *)self valueMetadata];
    if (!v24)
    {

LABEL_29:
      BOOL v29 = 1;
      goto LABEL_27;
    }
    v25 = (void *)v24;
    v26 = [(_INPBPaymentMethodValue *)self valueMetadata];
    v27 = [v4 valueMetadata];
    char v28 = [v26 isEqual:v27];

    if (v28) {
      goto LABEL_29;
    }
  }
  else
  {
LABEL_25:
  }
LABEL_26:
  BOOL v29 = 0;
LABEL_27:

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[_INPBPaymentMethodValue allocWithZone:](_INPBPaymentMethodValue, "allocWithZone:") init];
  id v6 = [(_INPBImageValue *)self->_icon copyWithZone:a3];
  [(_INPBPaymentMethodValue *)v5 setIcon:v6];

  uint64_t v7 = (void *)[(NSString *)self->_identificationHint copyWithZone:a3];
  [(_INPBPaymentMethodValue *)v5 setIdentificationHint:v7];

  v8 = (void *)[(NSString *)self->_name copyWithZone:a3];
  [(_INPBPaymentMethodValue *)v5 setName:v8];

  if ([(_INPBPaymentMethodValue *)self hasType]) {
    [(_INPBPaymentMethodValue *)v5 setType:[(_INPBPaymentMethodValue *)self type]];
  }
  id v9 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBPaymentMethodValue *)v5 setValueMetadata:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPaymentMethodValue *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPaymentMethodValue)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPaymentMethodValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPaymentMethodValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPaymentMethodValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  id v4 = [(_INPBPaymentMethodValue *)self icon];

  if (v4)
  {
    NSUInteger v5 = [(_INPBPaymentMethodValue *)self icon];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBPaymentMethodValue *)self identificationHint];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(_INPBPaymentMethodValue *)self name];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBPaymentMethodValue *)self hasType]) {
    PBDataWriterWriteInt32Field();
  }
  v8 = [(_INPBPaymentMethodValue *)self valueMetadata];

  id v9 = v11;
  if (v8)
  {
    uint64_t v10 = [(_INPBPaymentMethodValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();

    id v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPaymentMethodValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (void)setValueMetadata:(id)a3
{
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CHECKING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SAVINGS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BROKERAGE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DEBIT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CREDIT"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PREPAID"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"STORE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"APPLE_PAY"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5518BE8[a3 - 1];
  }

  return v3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int type = a3;
  }
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setName:(id)a3
{
  self->_name = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasIdentificationHint
{
  return self->_identificationHint != 0;
}

- (void)setIdentificationHint:(id)a3
{
  self->_identificationHint = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasIcon
{
  return self->_icon != 0;
}

- (void)setIcon:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end