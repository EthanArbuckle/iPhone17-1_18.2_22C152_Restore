@interface FSFileName
+ (BOOL)supportsSecureCoding;
+ (id)nameWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)nameWithCString:(const char *)a3;
+ (id)nameWithData:(id)a3;
+ (id)nameWithString:(id)a3;
- (FSFileName)initWithBytes:(const char *)a3 length:(unint64_t)a4;
- (FSFileName)initWithCString:(const char *)a3;
- (FSFileName)initWithCoder:(id)a3;
- (FSFileName)initWithData:(id)a3;
- (FSFileName)initWithString:(id)a3;
- (NSData)data;
- (NSString)debugDescription;
- (NSString)string;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
@end

@implementation FSFileName

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be encoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v6);
  }
  data = self->_data;
  v5 = v7;
  if (data)
  {
    [v7 encodeObject:data forKey:@"FSFileNameData"];
    v5 = v7;
  }
}

- (FSFileName)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be decoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v8);
  }
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSFileNameData"];
  if (v5)
  {
    id v6 = [(FSFileName *)self initWithData:v5];
  }
  else
  {

    id v6 = 0;
  }

  return v6;
}

- (FSFileName)initWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];

  return [(FSFileName *)self initWithBytes:v5 length:v6];
}

- (FSFileName)initWithString:(id)a3
{
  v3 = self;
  if (a3)
  {
    v3 = -[FSFileName initWithCString:](self, "initWithCString:", [a3 UTF8String]);
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (FSFileName)initWithBytes:(const char *)a3 length:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)FSFileName;
  uint64_t v6 = [(FSFileName *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", a3, strnlen(a3, a4));
    data = v6->_data;
    v6->_data = (NSData *)v7;
  }
  return v6;
}

- (FSFileName)initWithCString:(const char *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FSFileName;
  id v4 = [(FSFileName *)&v9 init];
  if (v4)
  {
    if (a3) {
      size_t v5 = strlen(a3);
    }
    else {
      size_t v5 = 0;
    }
    uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithBytes:a3 length:v5];
    data = v4->_data;
    v4->_data = (NSData *)v6;
  }
  return v4;
}

+ (id)nameWithString:(id)a3
{
  id v4 = a3;
  size_t v5 = (void *)[objc_alloc((Class)a1) initWithString:v4];

  return v5;
}

+ (id)nameWithCString:(const char *)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithCString:a3];
  return v3;
}

+ (id)nameWithData:(id)a3
{
  id v4 = a3;
  size_t v5 = (void *)[objc_alloc((Class)a1) initWithData:v4];

  return v5;
}

+ (id)nameWithBytes:(const char *)a3 length:(unint64_t)a4
{
  id v4 = (void *)[objc_alloc((Class)a1) initWithBytes:a3 length:a4];
  return v4;
}

- (NSString)string
{
  data = self->_data;
  if (data && [(NSData *)data length]) {
    id v4 = (__CFString *)[[NSString alloc] initWithData:self->_data encoding:4];
  }
  else {
    id v4 = &stru_26FFF08C0;
  }
  return (NSString *)v4;
}

- (NSData)data
{
  return self->_data;
}

- (NSString)debugDescription
{
  v2 = [(FSFileName *)self string];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = &stru_26FFF08C0;
  }

  return (NSString *)v4;
}

- (unint64_t)hash
{
  return [(NSData *)self->_data hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  data = self->_data;
  if (data && [(NSData *)data length] && [(NSData *)self->_data bytes])
  {
    uint64_t v6 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    uint64_t v7 = self->_data;
    return (id)[v6 initWithData:v7];
  }
  else
  {
    objc_super v9 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    return (id)[v9 initWithCString:""];
  }
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end