@interface _NBPhoneNumberDesc
- (NSArray)possibleLength;
- (NSArray)possibleLengthLocalOnly;
- (NSData)nationalNumberMatcherData;
- (NSData)possibleNumberMatcherData;
- (NSString)exampleNumber;
- (NSString)nationalNumberPattern;
- (NSString)possibleNumberPattern;
- (_NBPhoneNumberDesc)initWithEntry:(id)a3;
- (id)description;
@end

@implementation _NBPhoneNumberDesc

- (_NBPhoneNumberDesc)initWithEntry:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_NBPhoneNumberDesc;
  v5 = [(_NBPhoneNumberDesc *)&v22 init];
  v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = objc_msgSend(v4, "nb_safeStringAtIndex:", 2);
    nationalNumberPattern = v6->_nationalNumberPattern;
    v6->_nationalNumberPattern = (NSString *)v7;

    uint64_t v9 = objc_msgSend(v4, "nb_safeStringAtIndex:", 3);
    possibleNumberPattern = v6->_possibleNumberPattern;
    v6->_possibleNumberPattern = (NSString *)v9;

    uint64_t v11 = objc_msgSend(v4, "nb_safeArrayAtIndex:", 9);
    possibleLength = v6->_possibleLength;
    v6->_possibleLength = (NSArray *)v11;

    uint64_t v13 = objc_msgSend(v4, "nb_safeArrayAtIndex:", 10);
    possibleLengthLocalOnly = v6->_possibleLengthLocalOnly;
    v6->_possibleLengthLocalOnly = (NSArray *)v13;

    uint64_t v15 = objc_msgSend(v4, "nb_safeStringAtIndex:", 6);
    exampleNumber = v6->_exampleNumber;
    v6->_exampleNumber = (NSString *)v15;

    uint64_t v17 = objc_msgSend(v4, "nb_safeDataAtIndex:", 7);
    nationalNumberMatcherData = v6->_nationalNumberMatcherData;
    v6->_nationalNumberMatcherData = (NSData *)v17;

    uint64_t v19 = objc_msgSend(v4, "nb_safeDataAtIndex:", 8);
    possibleNumberMatcherData = v6->_possibleNumberMatcherData;
    v6->_possibleNumberMatcherData = (NSData *)v19;
  }
  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(_NBPhoneNumberDesc *)self nationalNumberPattern];
  v5 = [(_NBPhoneNumberDesc *)self possibleNumberPattern];
  v6 = [(_NBPhoneNumberDesc *)self possibleLength];
  uint64_t v7 = [(_NBPhoneNumberDesc *)self possibleLengthLocalOnly];
  v8 = [(_NBPhoneNumberDesc *)self exampleNumber];
  uint64_t v9 = [v3 stringWithFormat:@"nationalNumberPattern[%@] possibleNumberPattern[%@] possibleLength[%@] possibleLengthLocalOnly[%@] exampleNumber[%@]", v4, v5, v6, v7, v8];

  return v9;
}

- (NSString)nationalNumberPattern
{
  return self->_nationalNumberPattern;
}

- (NSString)possibleNumberPattern
{
  return self->_possibleNumberPattern;
}

- (NSArray)possibleLength
{
  return self->_possibleLength;
}

- (NSArray)possibleLengthLocalOnly
{
  return self->_possibleLengthLocalOnly;
}

- (NSString)exampleNumber
{
  return self->_exampleNumber;
}

- (NSData)nationalNumberMatcherData
{
  return self->_nationalNumberMatcherData;
}

- (NSData)possibleNumberMatcherData
{
  return self->_possibleNumberMatcherData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleNumberMatcherData, 0);
  objc_storeStrong((id *)&self->_nationalNumberMatcherData, 0);
  objc_storeStrong((id *)&self->_exampleNumber, 0);
  objc_storeStrong((id *)&self->_possibleLengthLocalOnly, 0);
  objc_storeStrong((id *)&self->_possibleLength, 0);
  objc_storeStrong((id *)&self->_possibleNumberPattern, 0);

  objc_storeStrong((id *)&self->_nationalNumberPattern, 0);
}

@end