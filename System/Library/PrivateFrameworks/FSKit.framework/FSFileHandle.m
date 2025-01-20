@interface FSFileHandle
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FSFileHandle)initWithBase64:(id)a3;
- (FSFileHandle)initWithCoder:(id)a3;
- (FSFileHandle)initWithValue:(unint64_t)a3;
- (NSString)base64String;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)value;
- (void)encodeWithCoder:(id)a3;
- (void)setValue:(unint64_t)a3;
@end

@implementation FSFileHandle

- (FSFileHandle)initWithValue:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FSFileHandle;
  result = [(FSFileHandle *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

- (FSFileHandle)initWithBase64:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FSFileHandle;
  objc_super v5 = [(FSFileHandle *)&v11 init];
  if (v5)
  {
    id v6 = (id) [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64Encoding:v4];
    v7 = (const void *)[v6 bytes];
    unint64_t v8 = [v6 length];
    if (v8 >= 8) {
      size_t v9 = 8;
    }
    else {
      size_t v9 = v8;
    }
    memcpy(&v5->_value, v7, v9);
  }
  return v5;
}

- (NSString)base64String
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&self->_value length:8];
  v3 = [v2 base64EncodedStringWithOptions:1];

  return (NSString *)v3;
}

- (unint64_t)hash
{
  return self->_value;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && self->_value == v4[1];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (FSFileHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FSFileHandle;
  BOOL v5 = [(FSFileHandle *)&v7 init];
  if (v5) {
    v5->_value = [v4 decodeInt64ForKey:@"FSFileHandle.value"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t value = self->_value;
  return (id)[v4 initWithValue:value];
}

- (unint64_t)value
{
  return self->_value;
}

- (void)setValue:(unint64_t)a3
{
  self->_unint64_t value = a3;
}

@end