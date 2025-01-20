@interface _INPBSearchForAccountsIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAccountNickname;
- (BOOL)hasAccountType;
- (BOOL)hasIntentMetadata;
- (BOOL)hasOrganizationName;
- (BOOL)hasRequestedBalanceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDataString)accountNickname;
- (_INPBDataString)organizationName;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSearchForAccountsIntent)initWithCoder:(id)a3;
- (id)accountTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)requestedBalanceTypeAsString:(int)a3;
- (int)StringAsAccountType:(id)a3;
- (int)StringAsRequestedBalanceType:(id)a3;
- (int)accountType;
- (int)requestedBalanceType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountNickname:(id)a3;
- (void)setAccountType:(int)a3;
- (void)setHasAccountType:(BOOL)a3;
- (void)setHasRequestedBalanceType:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setRequestedBalanceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSearchForAccountsIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_accountNickname, 0);
}

- (int)requestedBalanceType
{
  return self->_requestedBalanceType;
}

- (_INPBDataString)organizationName
{
  return self->_organizationName;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)accountType
{
  return self->_accountType;
}

- (_INPBDataString)accountNickname
{
  return self->_accountNickname;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSearchForAccountsIntent *)self accountNickname];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"accountNickname"];

  if ([(_INPBSearchForAccountsIntent *)self hasAccountType])
  {
    uint64_t v6 = [(_INPBSearchForAccountsIntent *)self accountType];
    if ((v6 - 1) >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E5518928[(v6 - 1)];
    }
    [v3 setObject:v7 forKeyedSubscript:@"accountType"];
  }
  v8 = [(_INPBSearchForAccountsIntent *)self intentMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"intentMetadata"];

  v10 = [(_INPBSearchForAccountsIntent *)self organizationName];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"organizationName"];

  if ([(_INPBSearchForAccountsIntent *)self hasRequestedBalanceType])
  {
    uint64_t v12 = [(_INPBSearchForAccountsIntent *)self requestedBalanceType];
    if ((v12 - 1) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E5518960[(v12 - 1)];
    }
    [v3 setObject:v13 forKeyedSubscript:@"requestedBalanceType"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBDataString *)self->_accountNickname hash];
  if ([(_INPBSearchForAccountsIntent *)self hasAccountType]) {
    uint64_t v4 = 2654435761 * self->_accountType;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v6 = [(_INPBDataString *)self->_organizationName hash];
  if ([(_INPBSearchForAccountsIntent *)self hasRequestedBalanceType]) {
    uint64_t v7 = 2654435761 * self->_requestedBalanceType;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  unint64_t v5 = [(_INPBSearchForAccountsIntent *)self accountNickname];
  unint64_t v6 = [v4 accountNickname];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_20;
  }
  uint64_t v7 = [(_INPBSearchForAccountsIntent *)self accountNickname];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBSearchForAccountsIntent *)self accountNickname];
    v10 = [v4 accountNickname];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  int v12 = [(_INPBSearchForAccountsIntent *)self hasAccountType];
  if (v12 != [v4 hasAccountType]) {
    goto LABEL_21;
  }
  if ([(_INPBSearchForAccountsIntent *)self hasAccountType])
  {
    if ([v4 hasAccountType])
    {
      int accountType = self->_accountType;
      if (accountType != [v4 accountType]) {
        goto LABEL_21;
      }
    }
  }
  unint64_t v5 = [(_INPBSearchForAccountsIntent *)self intentMetadata];
  unint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_20;
  }
  uint64_t v14 = [(_INPBSearchForAccountsIntent *)self intentMetadata];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBSearchForAccountsIntent *)self intentMetadata];
    v17 = [v4 intentMetadata];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForAccountsIntent *)self organizationName];
  unint64_t v6 = [v4 organizationName];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v19 = [(_INPBSearchForAccountsIntent *)self organizationName];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_INPBSearchForAccountsIntent *)self organizationName];
    v22 = [v4 organizationName];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  int v26 = [(_INPBSearchForAccountsIntent *)self hasRequestedBalanceType];
  if (v26 == [v4 hasRequestedBalanceType])
  {
    if (![(_INPBSearchForAccountsIntent *)self hasRequestedBalanceType]
      || ![v4 hasRequestedBalanceType]
      || (int requestedBalanceType = self->_requestedBalanceType,
          requestedBalanceType == [v4 requestedBalanceType]))
    {
      BOOL v24 = 1;
      goto LABEL_22;
    }
  }
LABEL_21:
  BOOL v24 = 0;
LABEL_22:

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBSearchForAccountsIntent allocWithZone:](_INPBSearchForAccountsIntent, "allocWithZone:") init];
  id v6 = [(_INPBDataString *)self->_accountNickname copyWithZone:a3];
  [(_INPBSearchForAccountsIntent *)v5 setAccountNickname:v6];

  if ([(_INPBSearchForAccountsIntent *)self hasAccountType]) {
    [(_INPBSearchForAccountsIntent *)v5 setAccountType:[(_INPBSearchForAccountsIntent *)self accountType]];
  }
  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSearchForAccountsIntent *)v5 setIntentMetadata:v7];

  id v8 = [(_INPBDataString *)self->_organizationName copyWithZone:a3];
  [(_INPBSearchForAccountsIntent *)v5 setOrganizationName:v8];

  if ([(_INPBSearchForAccountsIntent *)self hasRequestedBalanceType]) {
    [(_INPBSearchForAccountsIntent *)v5 setRequestedBalanceType:[(_INPBSearchForAccountsIntent *)self requestedBalanceType]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSearchForAccountsIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSearchForAccountsIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSearchForAccountsIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSearchForAccountsIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSearchForAccountsIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(_INPBSearchForAccountsIntent *)self accountNickname];

  if (v4)
  {
    unint64_t v5 = [(_INPBSearchForAccountsIntent *)self accountNickname];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSearchForAccountsIntent *)self hasAccountType]) {
    PBDataWriterWriteInt32Field();
  }
  id v6 = [(_INPBSearchForAccountsIntent *)self intentMetadata];

  if (v6)
  {
    uint64_t v7 = [(_INPBSearchForAccountsIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBSearchForAccountsIntent *)self organizationName];

  if (v8)
  {
    v9 = [(_INPBSearchForAccountsIntent *)self organizationName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSearchForAccountsIntent *)self hasRequestedBalanceType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchForAccountsIntentReadFrom(self, (uint64_t)a3);
}

- (int)StringAsRequestedBalanceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MONEY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"POINTS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MILES"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)requestedBalanceTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5518960[a3 - 1];
  }

  return v3;
}

- (void)setHasRequestedBalanceType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequestedBalanceType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRequestedBalanceType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int requestedBalanceType = a3;
  }
}

- (BOOL)hasOrganizationName
{
  return self->_organizationName != 0;
}

- (void)setOrganizationName:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
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
    id v3 = off_1E5518928[a3 - 1];
  }

  return v3;
}

- (void)setHasAccountType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
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