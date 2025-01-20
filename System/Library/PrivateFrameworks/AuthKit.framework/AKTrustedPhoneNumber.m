@interface AKTrustedPhoneNumber
- (AKTrustedPhoneNumber)initWithJSONDictionary:(id)a3;
- (AKTrustedPhoneNumber)numberWithDialCode;
- (NSNumber)identifier;
- (NSString)number;
- (NSString)obfuscatedNumber;
- (NSString)pushMode;
- (id)description;
- (void)setIdentifier:(id)a3;
- (void)setNumber:(id)a3;
- (void)setNumberWithDialCode:(id)a3;
- (void)setObfuscatedNumber:(id)a3;
- (void)setPushMode:(id)a3;
@end

@implementation AKTrustedPhoneNumber

- (AKTrustedPhoneNumber)initWithJSONDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AKTrustedPhoneNumber;
  v5 = [(AKTrustedPhoneNumber *)&v19 init];
  if (v5)
  {
    v6 = NSNumber;
    v7 = [v4 objectForKeyedSubscript:@"id"];
    uint64_t v8 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "intValue"));
    identifier = v5->_identifier;
    v5->_identifier = (NSNumber *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"numberWithDialCode"];
    numberWithDialCode = v5->_numberWithDialCode;
    v5->_numberWithDialCode = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"number"];
    number = v5->_number;
    v5->_number = (NSString *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"obfuscatedNumber"];
    obfuscatedNumber = v5->_obfuscatedNumber;
    v5->_obfuscatedNumber = (NSString *)v14;

    uint64_t v16 = [v4 objectForKeyedSubscript:@"pushMode"];
    pushMode = v5->_pushMode;
    v5->_pushMode = (NSString *)v16;
  }
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"id: %@\nnumber with dial code: %@\nmode: %@", self->_identifier, self->_numberWithDialCode, self->_pushMode];
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)number
{
  return self->_number;
}

- (void)setNumber:(id)a3
{
}

- (AKTrustedPhoneNumber)numberWithDialCode
{
  return (AKTrustedPhoneNumber *)self->_numberWithDialCode;
}

- (void)setNumberWithDialCode:(id)a3
{
}

- (NSString)obfuscatedNumber
{
  return self->_obfuscatedNumber;
}

- (void)setObfuscatedNumber:(id)a3
{
}

- (NSString)pushMode
{
  return self->_pushMode;
}

- (void)setPushMode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushMode, 0);
  objc_storeStrong((id *)&self->_obfuscatedNumber, 0);
  objc_storeStrong((id *)&self->_numberWithDialCode, 0);
  objc_storeStrong((id *)&self->_number, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end