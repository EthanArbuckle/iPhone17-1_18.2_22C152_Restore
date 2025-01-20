@interface DCCredentialElement
+ (BOOL)supportsSecureCoding;
- (DCCredentialElement)initWithCoder:(id)a3;
- (DCCredentialElement)initWithElementIdentifier:(id)a3;
- (DCCredentialElement)initWithElementIdentifier:(id)a3 BOOLValue:(BOOL)a4;
- (DCCredentialElement)initWithElementIdentifier:(id)a3 arrayValue:(id)a4;
- (DCCredentialElement)initWithElementIdentifier:(id)a3 dataValue:(id)a4;
- (DCCredentialElement)initWithElementIdentifier:(id)a3 dateValue:(id)a4;
- (DCCredentialElement)initWithElementIdentifier:(id)a3 dictionaryValue:(id)a4;
- (DCCredentialElement)initWithElementIdentifier:(id)a3 doubleValue:(double)a4;
- (DCCredentialElement)initWithElementIdentifier:(id)a3 intValue:(int64_t)a4;
- (DCCredentialElement)initWithElementIdentifier:(id)a3 stringValue:(id)a4;
- (DCCredentialElement)initWithElementIdentifier:(id)a3 stringValue:(id)a4 dataValue:(id)a5 dateValue:(id)a6 numberValue:(id)a7 arrayValue:(id)a8 dictionaryValue:(id)a9 numericTypeHint:(unint64_t)a10;
- (NSArray)arrayValue;
- (NSData)dataValue;
- (NSDate)dateValue;
- (NSDictionary)dictionaryValue;
- (NSNumber)numberValue;
- (NSString)elementIdentifier;
- (NSString)stringValue;
- (id)description;
- (unint64_t)numericTypeHint;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DCCredentialElement

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v17 = a3;
  v4 = [(DCCredentialElement *)self elementIdentifier];
  [v17 encodeObject:v4 forKey:0x26C59B720];

  v5 = [(DCCredentialElement *)self stringValue];

  if (v5)
  {
    v6 = [(DCCredentialElement *)self stringValue];
    [v17 encodeObject:v6 forKey:0x26C59BB00];
  }
  v7 = [(DCCredentialElement *)self dateValue];

  if (v7)
  {
    v8 = [(DCCredentialElement *)self dateValue];
    [v17 encodeObject:v8 forKey:0x26C59BB20];
  }
  v9 = [(DCCredentialElement *)self dataValue];

  if (v9)
  {
    v10 = [(DCCredentialElement *)self dataValue];
    [v17 encodeObject:v10 forKey:0x26C59BB40];
  }
  v11 = [(DCCredentialElement *)self numberValue];

  if (v11)
  {
    v12 = [(DCCredentialElement *)self numberValue];
    [v17 encodeObject:v12 forKey:0x26C59BB60];
  }
  v13 = [(DCCredentialElement *)self arrayValue];

  if (v13)
  {
    v14 = [(DCCredentialElement *)self arrayValue];
    [v17 encodeObject:v14 forKey:0x26C59BB80];
  }
  v15 = [(DCCredentialElement *)self dictionaryValue];

  if (v15)
  {
    v16 = [(DCCredentialElement *)self dictionaryValue];
    [v17 encodeObject:v16 forKey:0x26C59BBA0];
  }
  objc_msgSend(v17, "encodeInteger:forKey:", -[DCCredentialElement numericTypeHint](self, "numericTypeHint"), 0x26C59BBC0);
}

- (DCCredentialElement)initWithCoder:(id)a3
{
  v36.receiver = self;
  v36.super_class = (Class)DCCredentialElement;
  id v3 = a3;
  v4 = [(DCCredentialElement *)&v36 init];
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B720];
  elementIdentifier = v4->_elementIdentifier;
  v4->_elementIdentifier = (NSString *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59BB00];
  stringValue = v4->_stringValue;
  v4->_stringValue = (NSString *)v7;

  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59BB40];
  dataValue = v4->_dataValue;
  v4->_dataValue = (NSData *)v9;

  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59BB20];
  dateValue = v4->_dateValue;
  v4->_dateValue = (NSDate *)v11;

  uint64_t v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59BB60];
  numberValue = v4->_numberValue;
  v4->_numberValue = (NSNumber *)v13;

  v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  v22 = objc_msgSend(v15, "setWithObjects:", v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
  uint64_t v23 = [v3 decodeObjectOfClasses:v22 forKey:0x26C59BB80];
  arrayValue = v4->_arrayValue;
  v4->_arrayValue = (NSArray *)v23;

  v25 = (void *)MEMORY[0x263EFFA08];
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  v32 = objc_msgSend(v25, "setWithObjects:", v26, v27, v28, v29, v30, v31, objc_opt_class(), 0);
  uint64_t v33 = [v3 decodeObjectOfClasses:v32 forKey:0x26C59BBA0];
  dictionaryValue = v4->_dictionaryValue;
  v4->_dictionaryValue = (NSDictionary *)v33;

  LODWORD(v32) = [v3 decodeIntForKey:0x26C59BBC0];
  v4->_numericTypeHint = (int)v32;
  return v4;
}

- (DCCredentialElement)initWithElementIdentifier:(id)a3 stringValue:(id)a4 dataValue:(id)a5 dateValue:(id)a6 numberValue:(id)a7 arrayValue:(id)a8 dictionaryValue:(id)a9 numericTypeHint:(unint64_t)a10
{
  v39.receiver = self;
  v39.super_class = (Class)DCCredentialElement;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  uint64_t v23 = [(DCCredentialElement *)&v39 init];
  uint64_t v24 = [v22 copy];

  elementIdentifier = v23->_elementIdentifier;
  v23->_elementIdentifier = (NSString *)v24;

  uint64_t v26 = [v21 copy];
  stringValue = v23->_stringValue;
  v23->_stringValue = (NSString *)v26;

  uint64_t v28 = [v19 copy];
  dateValue = v23->_dateValue;
  v23->_dateValue = (NSDate *)v28;

  uint64_t v30 = [v20 copy];
  dataValue = v23->_dataValue;
  v23->_dataValue = (NSData *)v30;

  uint64_t v32 = [v18 copy];
  numberValue = v23->_numberValue;
  v23->_numberValue = (NSNumber *)v32;

  uint64_t v34 = [v17 copy];
  arrayValue = v23->_arrayValue;
  v23->_arrayValue = (NSArray *)v34;

  uint64_t v36 = [v16 copy];
  dictionaryValue = v23->_dictionaryValue;
  v23->_dictionaryValue = (NSDictionary *)v36;

  v23->_numericTypeHint = a10;
  return v23;
}

- (DCCredentialElement)initWithElementIdentifier:(id)a3
{
  return [(DCCredentialElement *)self initWithElementIdentifier:a3 stringValue:0 dataValue:0 dateValue:0 numberValue:0 arrayValue:0 dictionaryValue:0 numericTypeHint:0];
}

- (DCCredentialElement)initWithElementIdentifier:(id)a3 stringValue:(id)a4
{
  return [(DCCredentialElement *)self initWithElementIdentifier:a3 stringValue:a4 dataValue:0 dateValue:0 numberValue:0 arrayValue:0 dictionaryValue:0 numericTypeHint:0];
}

- (DCCredentialElement)initWithElementIdentifier:(id)a3 dataValue:(id)a4
{
  return [(DCCredentialElement *)self initWithElementIdentifier:a3 stringValue:0 dataValue:a4 dateValue:0 numberValue:0 arrayValue:0 dictionaryValue:0 numericTypeHint:0];
}

- (DCCredentialElement)initWithElementIdentifier:(id)a3 dateValue:(id)a4
{
  return [(DCCredentialElement *)self initWithElementIdentifier:a3 stringValue:0 dataValue:0 dateValue:a4 numberValue:0 arrayValue:0 dictionaryValue:0 numericTypeHint:0];
}

- (DCCredentialElement)initWithElementIdentifier:(id)a3 arrayValue:(id)a4
{
  return [(DCCredentialElement *)self initWithElementIdentifier:a3 stringValue:0 dataValue:0 dateValue:0 numberValue:0 arrayValue:a4 dictionaryValue:0 numericTypeHint:0];
}

- (DCCredentialElement)initWithElementIdentifier:(id)a3 dictionaryValue:(id)a4
{
  return [(DCCredentialElement *)self initWithElementIdentifier:a3 stringValue:0 dataValue:0 dateValue:0 numberValue:0 arrayValue:0 dictionaryValue:a4 numericTypeHint:0];
}

- (DCCredentialElement)initWithElementIdentifier:(id)a3 intValue:(int64_t)a4
{
  v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithInteger:a4];
  uint64_t v9 = [(DCCredentialElement *)self initWithElementIdentifier:v7 stringValue:0 dataValue:0 dateValue:0 numberValue:v8 arrayValue:0 dictionaryValue:0 numericTypeHint:1];

  return v9;
}

- (DCCredentialElement)initWithElementIdentifier:(id)a3 doubleValue:(double)a4
{
  v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithDouble:a4];
  uint64_t v9 = [(DCCredentialElement *)self initWithElementIdentifier:v7 stringValue:0 dataValue:0 dateValue:0 numberValue:v8 arrayValue:0 dictionaryValue:0 numericTypeHint:2];

  return v9;
}

- (DCCredentialElement)initWithElementIdentifier:(id)a3 BOOLValue:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithBool:v4];
  uint64_t v9 = [(DCCredentialElement *)self initWithElementIdentifier:v7 stringValue:0 dataValue:0 dateValue:0 numberValue:v8 arrayValue:0 dictionaryValue:0 numericTypeHint:3];

  return v9;
}

- (id)description
{
  id v3 = [(DCCredentialElement *)self stringValue];

  if (v3)
  {
    BOOL v4 = NSString;
    uint64_t v5 = [(DCCredentialElement *)self elementIdentifier];
    v6 = [(DCCredentialElement *)self stringValue];
    [v4 stringWithFormat:@"DCCredentialElement identifier = %@; string value = %@", v5, v6];
    uint64_t v11 = LABEL_7:;
LABEL_8:

    goto LABEL_9;
  }
  id v7 = [(DCCredentialElement *)self dateValue];

  if (v7)
  {
    v8 = NSString;
    uint64_t v5 = [(DCCredentialElement *)self elementIdentifier];
    v6 = [(DCCredentialElement *)self dateValue];
    [v8 stringWithFormat:@"DCCredentialElement identifier = %@; date value = %@", v5, v6];
    goto LABEL_7;
  }
  uint64_t v9 = [(DCCredentialElement *)self dataValue];

  if (v9)
  {
    v10 = NSString;
    uint64_t v5 = [(DCCredentialElement *)self elementIdentifier];
    v6 = [(DCCredentialElement *)self dataValue];
    [v10 stringWithFormat:@"DCCredentialElement identifier = %@; data value = %@", v5, v6];
    goto LABEL_7;
  }
  uint64_t v13 = [(DCCredentialElement *)self numberValue];

  if (v13)
  {
    v14 = NSString;
    uint64_t v5 = [(DCCredentialElement *)self elementIdentifier];
    v6 = [(DCCredentialElement *)self numberValue];
    v15 = DCCredentialElementNumericTypeHintToString([(DCCredentialElement *)self numericTypeHint]);
    objc_msgSend(v14, "stringWithFormat:", @"DCCredentialElement identifier = %@; number value = %@, type hint = %@",
      v5,
      v6,
    uint64_t v11 = v15);

    goto LABEL_8;
  }
  id v16 = [(DCCredentialElement *)self arrayValue];

  if (v16)
  {
    id v17 = NSString;
    uint64_t v5 = [(DCCredentialElement *)self elementIdentifier];
    v6 = [(DCCredentialElement *)self arrayValue];
    [v17 stringWithFormat:@"DCCredentialElement identifier = %@; array value = %@", v5, v6];
    goto LABEL_7;
  }
  id v18 = [(DCCredentialElement *)self dictionaryValue];

  id v19 = NSString;
  uint64_t v20 = [(DCCredentialElement *)self elementIdentifier];
  uint64_t v5 = (void *)v20;
  if (v18)
  {
    v6 = [(DCCredentialElement *)self dictionaryValue];
    [v19 stringWithFormat:@"DCCredentialElement identifier = %@; dictionary value = %@", v5, v6];
    goto LABEL_7;
  }
  uint64_t v11 = [v19 stringWithFormat:@"DCCredentialElement identifier = %@ no value", v20];;
LABEL_9:

  return v11;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (NSDate)dateValue
{
  return self->_dateValue;
}

- (NSNumber)numberValue
{
  return self->_numberValue;
}

- (NSArray)arrayValue
{
  return self->_arrayValue;
}

- (NSDictionary)dictionaryValue
{
  return self->_dictionaryValue;
}

- (unint64_t)numericTypeHint
{
  return self->_numericTypeHint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryValue, 0);
  objc_storeStrong((id *)&self->_arrayValue, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);

  objc_storeStrong((id *)&self->_elementIdentifier, 0);
}

@end