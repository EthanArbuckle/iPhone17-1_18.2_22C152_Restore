@interface LACDTOKVStoreValue
- (BOOL)BOOLValue;
- (BOOL)isEqual:(id)a3;
- (LACDTOKVStoreValue)initWithBoolValue:(BOOL)a3;
- (LACDTOKVStoreValue)initWithData:(id)a3;
- (LACDTOKVStoreValue)initWithIntegerValue:(int64_t)a3;
- (id)data;
- (int64_t)integerValue;
@end

@implementation LACDTOKVStoreValue

- (LACDTOKVStoreValue)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACDTOKVStoreValue;
  v6 = [(LACDTOKVStoreValue *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

- (LACDTOKVStoreValue)initWithBoolValue:(BOOL)a3
{
  BOOL v7 = a3;
  v4 = [MEMORY[0x263EFF8F8] dataWithBytes:&v7 length:1];
  id v5 = [(LACDTOKVStoreValue *)self initWithData:v4];

  return v5;
}

- (LACDTOKVStoreValue)initWithIntegerValue:(int64_t)a3
{
  int64_t v7 = a3;
  v4 = [MEMORY[0x263EFF8F8] dataWithBytes:&v7 length:8];
  id v5 = [(LACDTOKVStoreValue *)self initWithData:v4];

  return v5;
}

- (BOOL)BOOLValue
{
  BOOL v3 = 1;
  v4 = [[LACDTOKVStoreValue alloc] initWithBoolValue:1];
  if (![(LACDTOKVStoreValue *)self isEqual:v4])
  {
    id v5 = [[LACDTOKVStoreValue alloc] initWithIntegerValue:1];
    BOOL v3 = [(LACDTOKVStoreValue *)self isEqual:v5];
  }
  return v3;
}

- (int64_t)integerValue
{
  id v3 = [(LACDTOKVStoreValue *)self data];
  if (![v3 length])
  {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:

    return v6;
  }
  v4 = [(LACDTOKVStoreValue *)self data];
  unint64_t v5 = [v4 length];

  if (v5 <= 8)
  {
    id v3 = [(LACDTOKVStoreValue *)self data];
    int64_t v6 = *(void *)[v3 bytes];
    goto LABEL_6;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)data
{
  return self->_data;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(LACDTOKVStoreValue *)self data];
    int64_t v7 = [v5 data];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [(LACDTOKVStoreValue *)self data];
      objc_super v9 = [v5 data];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
}

@end