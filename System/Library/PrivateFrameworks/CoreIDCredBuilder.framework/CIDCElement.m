@interface CIDCElement
- (CIDCElement)initWithElementIdentifier:(id)a3 arrayValue:(id)a4;
- (CIDCElement)initWithElementIdentifier:(id)a3 dataValue:(id)a4;
- (CIDCElement)initWithElementIdentifier:(id)a3 dateValue:(id)a4;
- (CIDCElement)initWithElementIdentifier:(id)a3 dictionaryValue:(id)a4;
- (CIDCElement)initWithElementIdentifier:(id)a3 integerKeyedDictionaryValue:(id)a4;
- (CIDCElement)initWithElementIdentifier:(id)a3 numberValue:(id)a4;
- (CIDCElement)initWithElementIdentifier:(id)a3 stringValue:(id)a4;
- (CIDCElement)initWithElementIdentifier:(id)a3 stringValue:(id)a4 dataValue:(id)a5 dateValue:(id)a6 numberValue:(id)a7 arrayValue:(id)a8 dictionaryValue:(id)a9 integerKeyedDictionaryValue:(id)a10;
- (NSArray)arrayValue;
- (NSData)dataValue;
- (NSDate)dateValue;
- (NSDictionary)dictionaryValue;
- (NSDictionary)integerKeyedDictionaryValue;
- (NSNumber)numberValue;
- (NSString)elementIdentifier;
- (NSString)stringValue;
- (void)setArrayValue:(id)a3;
- (void)setDataValue:(id)a3;
- (void)setDateValue:(id)a3;
- (void)setDictionaryValue:(id)a3;
- (void)setElementIdentifier:(id)a3;
- (void)setIntegerKeyedDictionaryValue:(id)a3;
- (void)setNumberValue:(id)a3;
- (void)setStringValue:(id)a3;
@end

@implementation CIDCElement

- (CIDCElement)initWithElementIdentifier:(id)a3 stringValue:(id)a4 dataValue:(id)a5 dateValue:(id)a6 numberValue:(id)a7 arrayValue:(id)a8 dictionaryValue:(id)a9 integerKeyedDictionaryValue:(id)a10
{
  v26.receiver = self;
  v26.super_class = (Class)CIDCElement;
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = [(CIDCElement *)&v26 init];
  -[CIDCElement setElementIdentifier:](v24, "setElementIdentifier:", v23, v26.receiver, v26.super_class);

  [(CIDCElement *)v24 setStringValue:v22];
  [(CIDCElement *)v24 setDateValue:v20];

  [(CIDCElement *)v24 setDataValue:v21];
  [(CIDCElement *)v24 setNumberValue:v19];

  [(CIDCElement *)v24 setArrayValue:v18];
  [(CIDCElement *)v24 setDictionaryValue:v17];

  [(CIDCElement *)v24 setIntegerKeyedDictionaryValue:v16];
  return v24;
}

- (CIDCElement)initWithElementIdentifier:(id)a3 stringValue:(id)a4
{
  return [(CIDCElement *)self initWithElementIdentifier:a3 stringValue:a4 dataValue:0 dateValue:0 numberValue:0 arrayValue:0 dictionaryValue:0 integerKeyedDictionaryValue:0];
}

- (CIDCElement)initWithElementIdentifier:(id)a3 dataValue:(id)a4
{
  return [(CIDCElement *)self initWithElementIdentifier:a3 stringValue:0 dataValue:a4 dateValue:0 numberValue:0 arrayValue:0 dictionaryValue:0 integerKeyedDictionaryValue:0];
}

- (CIDCElement)initWithElementIdentifier:(id)a3 dateValue:(id)a4
{
  return [(CIDCElement *)self initWithElementIdentifier:a3 stringValue:0 dataValue:0 dateValue:a4 numberValue:0 arrayValue:0 dictionaryValue:0 integerKeyedDictionaryValue:0];
}

- (CIDCElement)initWithElementIdentifier:(id)a3 numberValue:(id)a4
{
  return [(CIDCElement *)self initWithElementIdentifier:a3 stringValue:0 dataValue:0 dateValue:0 numberValue:a4 arrayValue:0 dictionaryValue:0 integerKeyedDictionaryValue:0];
}

- (CIDCElement)initWithElementIdentifier:(id)a3 arrayValue:(id)a4
{
  return [(CIDCElement *)self initWithElementIdentifier:a3 stringValue:0 dataValue:0 dateValue:0 numberValue:0 arrayValue:a4 dictionaryValue:0 integerKeyedDictionaryValue:0];
}

- (CIDCElement)initWithElementIdentifier:(id)a3 dictionaryValue:(id)a4
{
  return [(CIDCElement *)self initWithElementIdentifier:a3 stringValue:0 dataValue:0 dateValue:0 numberValue:0 arrayValue:0 dictionaryValue:a4 integerKeyedDictionaryValue:0];
}

- (CIDCElement)initWithElementIdentifier:(id)a3 integerKeyedDictionaryValue:(id)a4
{
  return [(CIDCElement *)self initWithElementIdentifier:a3 stringValue:0 dataValue:0 dateValue:0 numberValue:0 arrayValue:0 dictionaryValue:0 integerKeyedDictionaryValue:a4];
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (void)setElementIdentifier:(id)a3
{
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
}

- (NSDate)dateValue
{
  return self->_dateValue;
}

- (void)setDateValue:(id)a3
{
}

- (NSNumber)numberValue
{
  return self->_numberValue;
}

- (void)setNumberValue:(id)a3
{
}

- (NSArray)arrayValue
{
  return self->_arrayValue;
}

- (void)setArrayValue:(id)a3
{
}

- (NSDictionary)dictionaryValue
{
  return self->_dictionaryValue;
}

- (void)setDictionaryValue:(id)a3
{
}

- (NSDictionary)integerKeyedDictionaryValue
{
  return self->_integerKeyedDictionaryValue;
}

- (void)setIntegerKeyedDictionaryValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_integerKeyedDictionaryValue, 0);
  objc_storeStrong((id *)&self->_dictionaryValue, 0);
  objc_storeStrong((id *)&self->_arrayValue, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);

  objc_storeStrong((id *)&self->_elementIdentifier, 0);
}

@end