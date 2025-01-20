@interface _INPBFinancialAccountValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAccountNickname;
- (BOOL)hasAccountNumber;
- (BOOL)hasAccountType;
- (BOOL)hasBalance;
- (BOOL)hasOrganizationName;
- (BOOL)hasSecondaryBalance;
- (BOOL)hasValueMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)accountNumber;
- (_INPBBalanceAmountValue)balance;
- (_INPBBalanceAmountValue)secondaryBalance;
- (_INPBDataString)accountNickname;
- (_INPBDataString)organizationName;
- (_INPBFinancialAccountValue)initWithCoder:(id)a3;
- (_INPBValueMetadata)valueMetadata;
- (id)accountTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsAccountType:(id)a3;
- (int)accountType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountNickname:(id)a3;
- (void)setAccountNumber:(id)a3;
- (void)setAccountType:(int)a3;
- (void)setBalance:(id)a3;
- (void)setHasAccountType:(BOOL)a3;
- (void)setOrganizationName:(id)a3;
- (void)setSecondaryBalance:(id)a3;
- (void)setValueMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBFinancialAccountValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_secondaryBalance, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_accountNumber, 0);

  objc_storeStrong((id *)&self->_accountNickname, 0);
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (_INPBBalanceAmountValue)secondaryBalance
{
  return self->_secondaryBalance;
}

- (_INPBDataString)organizationName
{
  return self->_organizationName;
}

- (_INPBBalanceAmountValue)balance
{
  return self->_balance;
}

- (int)accountType
{
  return self->_accountType;
}

- (NSString)accountNumber
{
  return self->_accountNumber;
}

- (_INPBDataString)accountNickname
{
  return self->_accountNickname;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBFinancialAccountValue *)self accountNickname];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"accountNickname"];

  if (self->_accountNumber)
  {
    v6 = [(_INPBFinancialAccountValue *)self accountNumber];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"accountNumber"];
  }
  if ([(_INPBFinancialAccountValue *)self hasAccountType])
  {
    uint64_t v8 = [(_INPBFinancialAccountValue *)self accountType];
    if ((v8 - 1) >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E551B830[(v8 - 1)];
    }
    [v3 setObject:v9 forKeyedSubscript:@"accountType"];
  }
  v10 = [(_INPBFinancialAccountValue *)self balance];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"balance"];

  v12 = [(_INPBFinancialAccountValue *)self organizationName];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"organizationName"];

  v14 = [(_INPBFinancialAccountValue *)self secondaryBalance];
  v15 = [v14 dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"secondaryBalance"];

  v16 = [(_INPBFinancialAccountValue *)self valueMetadata];
  v17 = [v16 dictionaryRepresentation];
  [v3 setObject:v17 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBDataString *)self->_accountNickname hash];
  NSUInteger v4 = [(NSString *)self->_accountNumber hash];
  if ([(_INPBFinancialAccountValue *)self hasAccountType]) {
    uint64_t v5 = 2654435761 * self->_accountType;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(_INPBBalanceAmountValue *)self->_balance hash];
  unint64_t v7 = [(_INPBDataString *)self->_organizationName hash];
  unint64_t v8 = v7 ^ [(_INPBBalanceAmountValue *)self->_secondaryBalance hash];
  return v6 ^ v8 ^ [(_INPBValueMetadata *)self->_valueMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  uint64_t v5 = [(_INPBFinancialAccountValue *)self accountNickname];
  unint64_t v6 = [v4 accountNickname];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v7 = [(_INPBFinancialAccountValue *)self accountNickname];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    v9 = [(_INPBFinancialAccountValue *)self accountNickname];
    v10 = [v4 accountNickname];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBFinancialAccountValue *)self accountNumber];
  unint64_t v6 = [v4 accountNumber];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v12 = [(_INPBFinancialAccountValue *)self accountNumber];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBFinancialAccountValue *)self accountNumber];
    v15 = [v4 accountNumber];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  int v17 = [(_INPBFinancialAccountValue *)self hasAccountType];
  if (v17 != [v4 hasAccountType]) {
    goto LABEL_36;
  }
  if ([(_INPBFinancialAccountValue *)self hasAccountType])
  {
    if ([v4 hasAccountType])
    {
      int accountType = self->_accountType;
      if (accountType != [v4 accountType]) {
        goto LABEL_36;
      }
    }
  }
  uint64_t v5 = [(_INPBFinancialAccountValue *)self balance];
  unint64_t v6 = [v4 balance];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v19 = [(_INPBFinancialAccountValue *)self balance];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_INPBFinancialAccountValue *)self balance];
    v22 = [v4 balance];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBFinancialAccountValue *)self organizationName];
  unint64_t v6 = [v4 organizationName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v24 = [(_INPBFinancialAccountValue *)self organizationName];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(_INPBFinancialAccountValue *)self organizationName];
    v27 = [v4 organizationName];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBFinancialAccountValue *)self secondaryBalance];
  unint64_t v6 = [v4 secondaryBalance];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v29 = [(_INPBFinancialAccountValue *)self secondaryBalance];
  if (v29)
  {
    v30 = (void *)v29;
    v31 = [(_INPBFinancialAccountValue *)self secondaryBalance];
    v32 = [v4 secondaryBalance];
    int v33 = [v31 isEqual:v32];

    if (!v33) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBFinancialAccountValue *)self valueMetadata];
  unint64_t v6 = [v4 valueMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v34 = [(_INPBFinancialAccountValue *)self valueMetadata];
    if (!v34)
    {

LABEL_39:
      BOOL v39 = 1;
      goto LABEL_37;
    }
    v35 = (void *)v34;
    v36 = [(_INPBFinancialAccountValue *)self valueMetadata];
    v37 = [v4 valueMetadata];
    char v38 = [v36 isEqual:v37];

    if (v38) {
      goto LABEL_39;
    }
  }
  else
  {
LABEL_35:
  }
LABEL_36:
  BOOL v39 = 0;
LABEL_37:

  return v39;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBFinancialAccountValue allocWithZone:](_INPBFinancialAccountValue, "allocWithZone:") init];
  id v6 = [(_INPBDataString *)self->_accountNickname copyWithZone:a3];
  [(_INPBFinancialAccountValue *)v5 setAccountNickname:v6];

  uint64_t v7 = (void *)[(NSString *)self->_accountNumber copyWithZone:a3];
  [(_INPBFinancialAccountValue *)v5 setAccountNumber:v7];

  if ([(_INPBFinancialAccountValue *)self hasAccountType]) {
    [(_INPBFinancialAccountValue *)v5 setAccountType:[(_INPBFinancialAccountValue *)self accountType]];
  }
  id v8 = [(_INPBBalanceAmountValue *)self->_balance copyWithZone:a3];
  [(_INPBFinancialAccountValue *)v5 setBalance:v8];

  id v9 = [(_INPBDataString *)self->_organizationName copyWithZone:a3];
  [(_INPBFinancialAccountValue *)v5 setOrganizationName:v9];

  id v10 = [(_INPBBalanceAmountValue *)self->_secondaryBalance copyWithZone:a3];
  [(_INPBFinancialAccountValue *)v5 setSecondaryBalance:v10];

  id v11 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBFinancialAccountValue *)v5 setValueMetadata:v11];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBFinancialAccountValue *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBFinancialAccountValue)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBFinancialAccountValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBFinancialAccountValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBFinancialAccountValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v16 = a3;
  id v4 = [(_INPBFinancialAccountValue *)self accountNickname];

  if (v4)
  {
    uint64_t v5 = [(_INPBFinancialAccountValue *)self accountNickname];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBFinancialAccountValue *)self accountNumber];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBFinancialAccountValue *)self hasAccountType]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v7 = [(_INPBFinancialAccountValue *)self balance];

  if (v7)
  {
    id v8 = [(_INPBFinancialAccountValue *)self balance];
    PBDataWriterWriteSubmessage();
  }
  id v9 = [(_INPBFinancialAccountValue *)self organizationName];

  if (v9)
  {
    id v10 = [(_INPBFinancialAccountValue *)self organizationName];
    PBDataWriterWriteSubmessage();
  }
  id v11 = [(_INPBFinancialAccountValue *)self secondaryBalance];

  if (v11)
  {
    uint64_t v12 = [(_INPBFinancialAccountValue *)self secondaryBalance];
    PBDataWriterWriteSubmessage();
  }
  v13 = [(_INPBFinancialAccountValue *)self valueMetadata];

  v14 = v16;
  if (v13)
  {
    v15 = [(_INPBFinancialAccountValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();

    v14 = v16;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBFinancialAccountValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (void)setValueMetadata:(id)a3
{
}

- (BOOL)hasSecondaryBalance
{
  return self->_secondaryBalance != 0;
}

- (void)setSecondaryBalance:(id)a3
{
}

- (BOOL)hasOrganizationName
{
  return self->_organizationName != 0;
}

- (void)setOrganizationName:(id)a3
{
}

- (BOOL)hasBalance
{
  return self->_balance != 0;
}

- (void)setBalance:(id)a3
{
}

- (int)StringAsAccountType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CHECKING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CREDIT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DEBIT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"INVESTMENT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MORTGAGE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PREPAID"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SAVING"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)accountTypeAsString:(int)a3
{
  if ((a3 - 1) >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551B830[a3 - 1];
  }

  return v3;
}

- (void)setHasAccountType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAccountType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAccountType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int accountType = a3;
  }
}

- (BOOL)hasAccountNumber
{
  return self->_accountNumber != 0;
}

- (void)setAccountNumber:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  accountNumber = self->_accountNumber;
  self->_accountNumber = v4;

  MEMORY[0x1F41817F8](v4, accountNumber);
}

- (BOOL)hasAccountNickname
{
  return self->_accountNickname != 0;
}

- (void)setAccountNickname:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end