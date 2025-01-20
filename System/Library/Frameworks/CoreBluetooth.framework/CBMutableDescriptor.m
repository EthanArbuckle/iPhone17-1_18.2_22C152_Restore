@interface CBMutableDescriptor
- (CBMutableDescriptor)initWithCharacteristic:(id)a3 dictionary:(id)a4;
- (CBMutableDescriptor)initWithType:(CBUUID *)UUID value:(id)value;
- (NSNumber)ID;
- (id)description;
- (void)setID:(id)a3;
@end

@implementation CBMutableDescriptor

- (CBMutableDescriptor)initWithType:(CBUUID *)UUID value:(id)value
{
  v7 = UUID;
  id v8 = value;
  v9 = +[CBUUID UUIDWithString:@"2901"];
  BOOL v10 = [(CBUUID *)v7 isEqual:v9];

  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_13;
    }
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = v11;
    v13 = @"Expecting NSString value type for User Description descriptor";
    SEL v14 = a2;
    v15 = self;
    uint64_t v16 = 78;
    goto LABEL_17;
  }
  v17 = +[CBUUID UUIDWithString:@"2904"];
  BOOL v18 = [(CBUUID *)v7 isEqual:v17];

  if (v18)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_13;
    }
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = v11;
    v13 = @"Expecting NSData value type for Format descriptor";
    SEL v14 = a2;
    v15 = self;
    uint64_t v16 = 80;
    goto LABEL_17;
  }
  v19 = +[CBUUID UUIDWithString:@"2906"];
  BOOL v20 = [(CBUUID *)v7 isEqual:v19];

  if (v20)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) == 0 || ([v8 length])
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      v12 = v11;
      v13 = @"Valid range must be an even number of bytes";
      SEL v14 = a2;
      v15 = self;
      uint64_t v16 = 82;
LABEL_17:
      [v11 handleFailureInMethod:v14 object:v15 file:@"CBDescriptor.m" lineNumber:v16 description:v13];
    }
  }
  else
  {
    v21 = [(CBUUID *)v7 data];
    uint64_t v22 = [v21 length];

    if (v22 == 16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v11 = [MEMORY[0x1E4F28B00] currentHandler];
        v12 = v11;
        v13 = @"Expecting NSData value type for 128-bit descriptor";
        SEL v14 = a2;
        v15 = self;
        uint64_t v16 = 84;
        goto LABEL_17;
      }
    }
  }
LABEL_13:
  v26.receiver = self;
  v26.super_class = (Class)CBMutableDescriptor;
  v23 = [(CBAttribute *)&v26 initWithUUID:v7];
  v24 = v23;
  if (v23) {
    [(CBDescriptor *)v23 setValue:v8];
  }

  return v24;
}

- (CBMutableDescriptor)initWithCharacteristic:(id)a3 dictionary:(id)a4
{
  id v5 = a4;
  v6 = [v5 objectForKeyedSubscript:@"kCBMsgArgUUID"];
  v7 = +[CBUUID UUIDWithData:v6];

  id v8 = [v5 objectForKeyedSubscript:@"kCBMsgArgData"];
  v9 = [(CBMutableDescriptor *)self initWithType:v7 value:v8];
  if (v9)
  {
    uint64_t v10 = [v5 objectForKeyedSubscript:@"kCBMsgArgAttributeID"];
    ID = v9->_ID;
    v9->_ID = (NSNumber *)v10;
  }
  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CBAttribute *)self UUID];
  v6 = [(CBDescriptor *)self value];
  v7 = [v3 stringWithFormat:@"<%@: %p UUID = %@, Value = %@>", v4, self, v5, v6];

  return v7;
}

- (NSNumber)ID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end