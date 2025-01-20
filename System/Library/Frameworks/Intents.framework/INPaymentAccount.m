@interface INPaymentAccount
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INAccountType)accountType;
- (INBalanceAmount)balance;
- (INBalanceAmount)secondaryBalance;
- (INPaymentAccount)initWithCoder:(id)a3;
- (INPaymentAccount)initWithNickname:(INSpeakableString *)nickname number:(NSString *)number accountType:(INAccountType)accountType organizationName:(INSpeakableString *)organizationName;
- (INPaymentAccount)initWithNickname:(INSpeakableString *)nickname number:(NSString *)number accountType:(INAccountType)accountType organizationName:(INSpeakableString *)organizationName balance:(INBalanceAmount *)balance secondaryBalance:(INBalanceAmount *)secondaryBalance;
- (INSpeakableString)nickname;
- (INSpeakableString)organizationName;
- (NSString)accountNumber;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INPaymentAccount

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  v6 = [(INPaymentAccount *)self nickname];

  if (v6)
  {
    v7 = [(INPaymentAccount *)self nickname];
    v8 = objc_msgSend(v7, "_intents_readableTitleWithLocalizer:", v5);
  }
  else
  {
    v9 = [(INPaymentAccount *)self accountNumber];

    if (v9) {
      [(INPaymentAccount *)self accountNumber];
    }
    else {
    v8 = INAccountTypeGetLocalizedName([(INPaymentAccount *)self accountType], v5);
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryBalance, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_accountNumber, 0);

  objc_storeStrong((id *)&self->_nickname, 0);
}

- (INBalanceAmount)secondaryBalance
{
  return self->_secondaryBalance;
}

- (INBalanceAmount)balance
{
  return self->_balance;
}

- (INSpeakableString)organizationName
{
  return self->_organizationName;
}

- (INAccountType)accountType
{
  return self->_accountType;
}

- (NSString)accountNumber
{
  return self->_accountNumber;
}

- (INSpeakableString)nickname
{
  return self->_nickname;
}

- (id)_dictionaryRepresentation
{
  v19[6] = *MEMORY[0x1E4F143B8];
  v18[0] = @"nickname";
  nickname = self->_nickname;
  uint64_t v4 = (uint64_t)nickname;
  if (!nickname)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v17 = (void *)v4;
  v19[0] = v4;
  v18[1] = @"accountNumber";
  accountNumber = self->_accountNumber;
  uint64_t v6 = (uint64_t)accountNumber;
  if (!accountNumber)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v16 = (void *)v6;
  v19[1] = v6;
  v18[2] = @"accountType";
  v7 = [NSNumber numberWithInteger:self->_accountType];
  v19[2] = v7;
  v18[3] = @"organizationName";
  organizationName = self->_organizationName;
  v9 = organizationName;
  if (!organizationName)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[3] = v9;
  v18[4] = @"balance";
  balance = self->_balance;
  v11 = balance;
  if (!balance)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[4] = v11;
  v18[5] = @"secondaryBalance";
  secondaryBalance = self->_secondaryBalance;
  v13 = secondaryBalance;
  if (!secondaryBalance)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[5] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:6];
  if (secondaryBalance)
  {
    if (balance) {
      goto LABEL_13;
    }
LABEL_20:

    if (organizationName) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }

  if (!balance) {
    goto LABEL_20;
  }
LABEL_13:
  if (organizationName) {
    goto LABEL_14;
  }
LABEL_21:

LABEL_14:
  if (accountNumber)
  {
    if (nickname) {
      goto LABEL_16;
    }
  }
  else
  {

    if (nickname) {
      goto LABEL_16;
    }
  }

LABEL_16:

  return v14;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  id v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INPaymentAccount;
  uint64_t v6 = [(INPaymentAccount *)&v11 description];
  v7 = [(INPaymentAccount *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INPaymentAccount *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_nickname];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"nickname");

  v9 = [v6 encodeObject:self->_accountNumber];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"accountNumber");

  unint64_t v10 = self->_accountType - 1;
  if (v10 > 6) {
    objc_super v11 = @"unknown";
  }
  else {
    objc_super v11 = off_1E55193D0[v10];
  }
  v12 = v11;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"accountType");

  v13 = [v6 encodeObject:self->_organizationName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"organizationName");

  v14 = [v6 encodeObject:self->_balance];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, @"balance");

  v15 = [v6 encodeObject:self->_secondaryBalance];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, @"secondaryBalance");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  nickname = self->_nickname;
  id v5 = a3;
  [v5 encodeObject:nickname forKey:@"nickname"];
  [v5 encodeObject:self->_accountNumber forKey:@"accountNumber"];
  [v5 encodeInteger:self->_accountType forKey:@"accountType"];
  [v5 encodeObject:self->_organizationName forKey:@"organizationName"];
  [v5 encodeObject:self->_balance forKey:@"balance"];
  [v5 encodeObject:self->_secondaryBalance forKey:@"secondaryBalance"];
}

- (INPaymentAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nickname"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"accountNumber"];

  uint64_t v10 = [v4 decodeIntegerForKey:@"accountType"];
  objc_super v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"organizationName"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"balance"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryBalance"];

  v14 = [(INPaymentAccount *)self initWithNickname:v5 number:v9 accountType:v10 organizationName:v11 balance:v12 secondaryBalance:v13];
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INPaymentAccount *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      nickname = self->_nickname;
      BOOL v11 = 0;
      if (nickname == v5->_nickname || -[INSpeakableString isEqual:](nickname, "isEqual:"))
      {
        accountNumber = self->_accountNumber;
        if ((accountNumber == v5->_accountNumber || -[NSString isEqual:](accountNumber, "isEqual:"))
          && self->_accountType == v5->_accountType)
        {
          organizationName = self->_organizationName;
          if (organizationName == v5->_organizationName || -[INSpeakableString isEqual:](organizationName, "isEqual:"))
          {
            balance = self->_balance;
            if (balance == v5->_balance || -[INBalanceAmount isEqual:](balance, "isEqual:"))
            {
              secondaryBalance = self->_secondaryBalance;
              if (secondaryBalance == v5->_secondaryBalance
                || -[INBalanceAmount isEqual:](secondaryBalance, "isEqual:"))
              {
                BOOL v11 = 1;
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INSpeakableString *)self->_nickname hash];
  NSUInteger v4 = [(NSString *)self->_accountNumber hash] ^ v3;
  id v5 = [NSNumber numberWithInteger:self->_accountType];
  uint64_t v6 = [v5 hash];
  unint64_t v7 = v4 ^ [(INSpeakableString *)self->_organizationName hash] ^ v6;
  unint64_t v8 = [(INBalanceAmount *)self->_balance hash];
  unint64_t v9 = v7 ^ v8 ^ [(INBalanceAmount *)self->_secondaryBalance hash];

  return v9;
}

- (INPaymentAccount)initWithNickname:(INSpeakableString *)nickname number:(NSString *)number accountType:(INAccountType)accountType organizationName:(INSpeakableString *)organizationName
{
  return [(INPaymentAccount *)self initWithNickname:nickname number:number accountType:accountType organizationName:organizationName balance:0 secondaryBalance:0];
}

- (INPaymentAccount)initWithNickname:(INSpeakableString *)nickname number:(NSString *)number accountType:(INAccountType)accountType organizationName:(INSpeakableString *)organizationName balance:(INBalanceAmount *)balance secondaryBalance:(INBalanceAmount *)secondaryBalance
{
  v14 = nickname;
  v15 = number;
  v16 = organizationName;
  v17 = balance;
  v18 = secondaryBalance;
  v31.receiver = self;
  v31.super_class = (Class)INPaymentAccount;
  v19 = [(INPaymentAccount *)&v31 init];
  if (v19)
  {
    uint64_t v20 = [(INSpeakableString *)v14 copy];
    v21 = v19->_nickname;
    v19->_nickname = (INSpeakableString *)v20;

    uint64_t v22 = [(NSString *)v15 copy];
    accountNumber = v19->_accountNumber;
    v19->_accountNumber = (NSString *)v22;

    v19->_accountType = accountType;
    uint64_t v24 = [(INSpeakableString *)v16 copy];
    v25 = v19->_organizationName;
    v19->_organizationName = (INSpeakableString *)v24;

    uint64_t v26 = [(INBalanceAmount *)v17 copy];
    v27 = v19->_balance;
    v19->_balance = (INBalanceAmount *)v26;

    uint64_t v28 = [(INBalanceAmount *)v18 copy];
    v29 = v19->_secondaryBalance;
    v19->_secondaryBalance = (INBalanceAmount *)v28;
  }
  return v19;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [v8 objectForKeyedSubscript:@"nickname"];
    BOOL v11 = [v7 decodeObjectOfClass:v9 from:v10];

    v12 = [v8 objectForKeyedSubscript:@"accountNumber"];
    v13 = [v8 objectForKeyedSubscript:@"accountType"];
    uint64_t v14 = INAccountTypeWithString(v13);

    uint64_t v15 = objc_opt_class();
    v16 = [v8 objectForKeyedSubscript:@"organizationName"];
    v17 = [v7 decodeObjectOfClass:v15 from:v16];

    uint64_t v18 = objc_opt_class();
    v19 = [v8 objectForKeyedSubscript:@"balance"];
    uint64_t v20 = [v7 decodeObjectOfClass:v18 from:v19];

    uint64_t v21 = objc_opt_class();
    uint64_t v22 = [v8 objectForKeyedSubscript:@"secondaryBalance"];
    v23 = [v7 decodeObjectOfClass:v21 from:v22];

    uint64_t v24 = (void *)[objc_alloc((Class)a1) initWithNickname:v11 number:v12 accountType:v14 organizationName:v17 balance:v20 secondaryBalance:v23];
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end