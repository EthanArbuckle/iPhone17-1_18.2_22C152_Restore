@interface CCDeviceRecord
+ (id)genSQLCreateStatements;
+ (id)recordFromDatabaseValueRow:(id)a3;
+ (id)tableName;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToItemRecord:(id)a3;
- (CCDeviceRecord)init;
- (CCDeviceRecord)initWithDatabaseValueRow:(id)a3;
- (NSNumber)deviceRowId;
- (NSString)description;
- (NSString)deviceId;
- (unint64_t)hash;
- (unsigned)options;
@end

@implementation CCDeviceRecord

- (CCDeviceRecord)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

+ (id)recordFromDatabaseValueRow:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDatabaseValueRow:v3];

  return v4;
}

+ (id)genSQLCreateStatements
{
  v5[1] = *MEMORY[0x263EF8340];
  objc_msgSend(NSString, "stringWithFormat:", @"CREATE TABLE IF NOT EXISTS \"%@\" (\"%@\" integer PRIMARY KEY, \"%@\" varchar NOT NULL, \"%@\" integer);",
    @"device",
    @"device_row_id",
    @"device_id",
  id v2 = @"options");
  v5[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)tableName
{
  return @"device";
}

- (CCDeviceRecord)initWithDatabaseValueRow:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CCDeviceRecord;
  v5 = [(CCDeviceRecord *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 numberValueAtColumnIndex:0];
    deviceRowId = v5->_deviceRowId;
    v5->_deviceRowId = (NSNumber *)v6;

    uint64_t v8 = [v4 stringValueAtColumnIndex:1];
    deviceId = v5->_deviceId;
    v5->_deviceId = (NSString *)v8;

    v10 = [v4 numberValueAtColumnIndex:2];
    v5->_options = [v10 unsignedCharValue];
  }
  return v5;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)CCDeviceRecord;
  id v3 = [(CCDeviceRecord *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" deviceRowId: %@, deviceId: %@ options %X", self->_deviceRowId, self->_deviceId, self->_options];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CCDeviceRecord *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CCDeviceRecord *)self isEqualToItemRecord:v5];

  return v6;
}

- (BOOL)isEqualToItemRecord:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    deviceRowId = self->_deviceRowId;
    v7 = [v4 deviceRowId];
    if ([(NSNumber *)deviceRowId isEqual:v7])
    {
      deviceId = self->_deviceId;
      v9 = [v5 deviceId];
      if ([(NSString *)deviceId isEqual:v9])
      {
        int options = self->_options;
        BOOL v11 = options == [v5 options];
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_deviceRowId hash];
  NSUInteger v4 = [(NSString *)self->_deviceId hash] ^ v3;
  v5 = [NSNumber numberWithUnsignedChar:self->_options];
  unint64_t v6 = v4 ^ [v5 hash];

  return v6;
}

- (NSNumber)deviceRowId
{
  return self->_deviceRowId;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (unsigned)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceId, 0);

  objc_storeStrong((id *)&self->_deviceRowId, 0);
}

@end