@interface INBillPayee
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INBillPayee)initWithCoder:(id)a3;
- (INBillPayee)initWithNickname:(INSpeakableString *)nickname number:(NSString *)number organizationName:(INSpeakableString *)organizationName;
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

@implementation INBillPayee

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  v6 = [(INBillPayee *)self nickname];

  if (v6)
  {
    v7 = [(INBillPayee *)self nickname];
LABEL_3:
    v8 = v7;
    v9 = objc_msgSend(v7, "_intents_readableTitleWithLocalizer:", v5);

    goto LABEL_6;
  }
  v10 = [(INBillPayee *)self accountNumber];

  if (!v10)
  {
    v7 = [(INBillPayee *)self organizationName];
    goto LABEL_3;
  }
  v9 = [(INBillPayee *)self accountNumber];
LABEL_6:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_accountNumber, 0);

  objc_storeStrong((id *)&self->_nickname, 0);
}

- (INSpeakableString)organizationName
{
  return self->_organizationName;
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
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"nickname";
  nickname = self->_nickname;
  v4 = nickname;
  if (!nickname)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"accountNumber";
  accountNumber = self->_accountNumber;
  v6 = accountNumber;
  if (!accountNumber)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"organizationName";
  organizationName = self->_organizationName;
  v8 = organizationName;
  if (!organizationName)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (organizationName)
  {
    if (accountNumber) {
      goto LABEL_9;
    }
LABEL_14:

    if (nickname) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!accountNumber) {
    goto LABEL_14;
  }
LABEL_9:
  if (nickname) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v9;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  id v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INBillPayee;
  v6 = [(INBillPayee *)&v11 description];
  v7 = [(INBillPayee *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INBillPayee *)self descriptionAtIndent:0];
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

  v10 = [v6 encodeObject:self->_organizationName];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"organizationName");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  nickname = self->_nickname;
  id v5 = a3;
  [v5 encodeObject:nickname forKey:@"nickname"];
  [v5 encodeObject:self->_accountNumber forKey:@"accountNumber"];
  [v5 encodeObject:self->_organizationName forKey:@"organizationName"];
}

- (INBillPayee)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nickname"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"accountNumber"];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"organizationName"];

  objc_super v11 = [(INBillPayee *)self initWithNickname:v5 number:v9 organizationName:v10];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INBillPayee *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      nickname = self->_nickname;
      BOOL v9 = 0;
      if (nickname == v5->_nickname || -[INSpeakableString isEqual:](nickname, "isEqual:"))
      {
        accountNumber = self->_accountNumber;
        if (accountNumber == v5->_accountNumber || -[NSString isEqual:](accountNumber, "isEqual:"))
        {
          organizationName = self->_organizationName;
          if (organizationName == v5->_organizationName || -[INSpeakableString isEqual:](organizationName, "isEqual:")) {
            BOOL v9 = 1;
          }
        }
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INSpeakableString *)self->_nickname hash];
  NSUInteger v4 = [(NSString *)self->_accountNumber hash] ^ v3;
  return v4 ^ [(INSpeakableString *)self->_organizationName hash];
}

- (INBillPayee)initWithNickname:(INSpeakableString *)nickname number:(NSString *)number organizationName:(INSpeakableString *)organizationName
{
  v8 = nickname;
  BOOL v9 = number;
  v10 = organizationName;
  v19.receiver = self;
  v19.super_class = (Class)INBillPayee;
  objc_super v11 = [(INBillPayee *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [(INSpeakableString *)v8 copy];
    v13 = v11->_nickname;
    v11->_nickname = (INSpeakableString *)v12;

    uint64_t v14 = [(NSString *)v9 copy];
    accountNumber = v11->_accountNumber;
    v11->_accountNumber = (NSString *)v14;

    uint64_t v16 = [(INSpeakableString *)v10 copy];
    v17 = v11->_organizationName;
    v11->_organizationName = (INSpeakableString *)v16;
  }
  return v11;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    v10 = [v8 objectForKeyedSubscript:@"nickname"];
    objc_super v11 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v12 = [v8 objectForKeyedSubscript:@"accountNumber"];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = [v8 objectForKeyedSubscript:@"organizationName"];
    v15 = [v7 decodeObjectOfClass:v13 from:v14];

    uint64_t v16 = (void *)[objc_alloc((Class)a1) initWithNickname:v11 number:v12 organizationName:v15];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end