@interface INCarHeadUnit
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INCarHeadUnit)initWithBluetoothIdentifier:(NSString *)bluetoothIdentifier iAP2Identifier:(NSString *)iAP2Identifier;
- (INCarHeadUnit)initWithCoder:(id)a3;
- (NSString)bluetoothIdentifier;
- (NSString)description;
- (NSString)iAP2Identifier;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INCarHeadUnit

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iAP2Identifier, 0);

  objc_storeStrong((id *)&self->_bluetoothIdentifier, 0);
}

- (NSString)iAP2Identifier
{
  return self->_iAP2Identifier;
}

- (NSString)bluetoothIdentifier
{
  return self->_bluetoothIdentifier;
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"bluetoothIdentifier";
  bluetoothIdentifier = self->_bluetoothIdentifier;
  v4 = bluetoothIdentifier;
  if (!bluetoothIdentifier)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"iAP2Identifier";
  v10[0] = v4;
  iAP2Identifier = self->_iAP2Identifier;
  v6 = iAP2Identifier;
  if (!iAP2Identifier)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (iAP2Identifier)
  {
    if (bluetoothIdentifier) {
      goto LABEL_7;
    }
  }
  else
  {

    if (bluetoothIdentifier) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v7;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INCarHeadUnit;
  v6 = [(INCarHeadUnit *)&v11 description];
  v7 = [(INCarHeadUnit *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INCarHeadUnit *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_bluetoothIdentifier];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"bluetoothIdentifier");

  v9 = [v6 encodeObject:self->_iAP2Identifier];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"iAP2Identifier");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  bluetoothIdentifier = self->_bluetoothIdentifier;
  id v5 = a3;
  [v5 encodeObject:bluetoothIdentifier forKey:@"bluetoothIdentifier"];
  [v5 encodeObject:self->_iAP2Identifier forKey:@"iAP2Identifier"];
}

- (INCarHeadUnit)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"bluetoothIdentifier"];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  objc_super v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"iAP2Identifier"];

  v13 = [(INCarHeadUnit *)self initWithBluetoothIdentifier:v8 iAP2Identifier:v12];
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INCarHeadUnit *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      bluetoothIdentifier = self->_bluetoothIdentifier;
      BOOL v8 = 0;
      if (bluetoothIdentifier == v5->_bluetoothIdentifier
        || -[NSString isEqual:](bluetoothIdentifier, "isEqual:"))
      {
        iAP2Identifier = self->_iAP2Identifier;
        if (iAP2Identifier == v5->_iAP2Identifier || -[NSString isEqual:](iAP2Identifier, "isEqual:")) {
          BOOL v8 = 1;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bluetoothIdentifier hash];
  return [(NSString *)self->_iAP2Identifier hash] ^ v3;
}

- (INCarHeadUnit)initWithBluetoothIdentifier:(NSString *)bluetoothIdentifier iAP2Identifier:(NSString *)iAP2Identifier
{
  uint64_t v6 = bluetoothIdentifier;
  v7 = iAP2Identifier;
  v14.receiver = self;
  v14.super_class = (Class)INCarHeadUnit;
  BOOL v8 = [(INCarHeadUnit *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [(NSString *)v6 copy];
    uint64_t v10 = v8->_bluetoothIdentifier;
    v8->_bluetoothIdentifier = (NSString *)v9;

    uint64_t v11 = [(NSString *)v7 copy];
    v12 = v8->_iAP2Identifier;
    v8->_iAP2Identifier = (NSString *)v11;
  }
  return v8;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 objectForKeyedSubscript:@"bluetoothIdentifier"];
    BOOL v8 = [v6 objectForKeyedSubscript:@"iAP2Identifier"];
    uint64_t v9 = (void *)[objc_alloc((Class)a1) initWithBluetoothIdentifier:v7 iAP2Identifier:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end