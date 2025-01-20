@interface _INPBBillPayeeValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAccountNumber;
- (BOOL)hasNickname;
- (BOOL)hasOrganizationName;
- (BOOL)hasValueMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)accountNumber;
- (_INPBBillPayeeValue)initWithCoder:(id)a3;
- (_INPBDataString)nickname;
- (_INPBDataString)organizationName;
- (_INPBValueMetadata)valueMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountNumber:(id)a3;
- (void)setNickname:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setValueMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBBillPayeeValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_nickname, 0);

  objc_storeStrong((id *)&self->_accountNumber, 0);
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (_INPBDataString)organizationName
{
  return self->_organizationName;
}

- (_INPBDataString)nickname
{
  return self->_nickname;
}

- (NSString)accountNumber
{
  return self->_accountNumber;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_accountNumber)
  {
    v4 = [(_INPBBillPayeeValue *)self accountNumber];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"accountNumber"];
  }
  v6 = [(_INPBBillPayeeValue *)self nickname];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"nickname"];

  v8 = [(_INPBBillPayeeValue *)self organizationName];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"organizationName"];

  v10 = [(_INPBBillPayeeValue *)self valueMetadata];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_accountNumber hash];
  unint64_t v4 = [(_INPBDataString *)self->_nickname hash] ^ v3;
  unint64_t v5 = [(_INPBDataString *)self->_organizationName hash];
  return v4 ^ v5 ^ [(_INPBValueMetadata *)self->_valueMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(_INPBBillPayeeValue *)self accountNumber];
  v6 = [v4 accountNumber];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_INPBBillPayeeValue *)self accountNumber];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBBillPayeeValue *)self accountNumber];
    v10 = [v4 accountNumber];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBBillPayeeValue *)self nickname];
  v6 = [v4 nickname];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_INPBBillPayeeValue *)self nickname];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBBillPayeeValue *)self nickname];
    v15 = [v4 nickname];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBBillPayeeValue *)self organizationName];
  v6 = [v4 organizationName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_INPBBillPayeeValue *)self organizationName];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBBillPayeeValue *)self organizationName];
    v20 = [v4 organizationName];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBBillPayeeValue *)self valueMetadata];
  v6 = [v4 valueMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_INPBBillPayeeValue *)self valueMetadata];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(_INPBBillPayeeValue *)self valueMetadata];
    v25 = [v4 valueMetadata];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBBillPayeeValue allocWithZone:](_INPBBillPayeeValue, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_accountNumber copyWithZone:a3];
  [(_INPBBillPayeeValue *)v5 setAccountNumber:v6];

  id v7 = [(_INPBDataString *)self->_nickname copyWithZone:a3];
  [(_INPBBillPayeeValue *)v5 setNickname:v7];

  id v8 = [(_INPBDataString *)self->_organizationName copyWithZone:a3];
  [(_INPBBillPayeeValue *)v5 setOrganizationName:v8];

  id v9 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBBillPayeeValue *)v5 setValueMetadata:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBBillPayeeValue *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBBillPayeeValue)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBBillPayeeValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBBillPayeeValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBBillPayeeValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  id v4 = [(_INPBBillPayeeValue *)self accountNumber];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  unint64_t v5 = [(_INPBBillPayeeValue *)self nickname];

  if (v5)
  {
    id v6 = [(_INPBBillPayeeValue *)self nickname];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBBillPayeeValue *)self organizationName];

  if (v7)
  {
    id v8 = [(_INPBBillPayeeValue *)self organizationName];
    PBDataWriterWriteSubmessage();
  }
  id v9 = [(_INPBBillPayeeValue *)self valueMetadata];

  if (v9)
  {
    v10 = [(_INPBBillPayeeValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBBillPayeeValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (void)setValueMetadata:(id)a3
{
}

- (BOOL)hasOrganizationName
{
  return self->_organizationName != 0;
}

- (void)setOrganizationName:(id)a3
{
}

- (BOOL)hasNickname
{
  return self->_nickname != 0;
}

- (void)setNickname:(id)a3
{
}

- (BOOL)hasAccountNumber
{
  return self->_accountNumber != 0;
}

- (void)setAccountNumber:(id)a3
{
  self->_accountNumber = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end