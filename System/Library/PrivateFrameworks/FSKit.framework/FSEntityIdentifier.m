@interface FSEntityIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)defaultInstanceUUID;
+ (id)identifier;
+ (id)identifierWithUUID:(id)a3;
+ (id)identifierWithUUID:(id)a3 byteQualifier:(const char *)a4;
+ (id)identifierWithUUID:(id)a3 data:(id)a4;
+ (id)identifierWithUUID:(id)a3 longByteQualifier:(const char *)a4;
- (BOOL)isEqual:(id)a3;
- (FSEntityIdentifier)init;
- (FSEntityIdentifier)initWithBytes:(const char *)a3 length:(int)a4;
- (FSEntityIdentifier)initWithCoder:(id)a3;
- (FSEntityIdentifier)initWithCopiedUUID:(id)a3 data:(id)a4;
- (FSEntityIdentifier)initWithUUID:(id)a3;
- (FSEntityIdentifier)initWithUUID:(id)a3 byteQualifier:(const char *)a4;
- (FSEntityIdentifier)initWithUUID:(id)a3 data:(id)a4;
- (FSEntityIdentifier)initWithUUID:(id)a3 longByteQualifier:(const char *)a4;
- (NSData)qualifier;
- (NSData)uuidData;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setQualifier:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation FSEntityIdentifier

- (FSEntityIdentifier)initWithUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FSEntityIdentifier;
  v6 = [(FSEntityIdentifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uuid, a3);
  }

  return v7;
}

- (FSEntityIdentifier)init
{
  v3 = +[FSEntityIdentifier defaultInstanceUUID];
  v4 = [(FSEntityIdentifier *)self initWithUUID:v3];

  return v4;
}

- (FSEntityIdentifier)initWithCopiedUUID:(id)a3 data:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 length] == 4 || objc_msgSend(v8, "length") == 8)
  {
    v13.receiver = self;
    v13.super_class = (Class)FSEntityIdentifier;
    objc_super v9 = [(FSEntityIdentifier *)&v13 init];
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_uuid, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (FSEntityIdentifier)initWithUUID:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = (void *)[a4 copy];
  id v8 = [(FSEntityIdentifier *)self initWithCopiedUUID:v6 data:v7];

  return v8;
}

- (FSEntityIdentifier)initWithUUID:(id)a3 byteQualifier:(const char *)a4
{
  id v6 = (objc_class *)MEMORY[0x263EFF8F8];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithBytes:a4 length:4];
  objc_super v9 = [(FSEntityIdentifier *)self initWithCopiedUUID:v7 data:v8];

  return v9;
}

- (FSEntityIdentifier)initWithUUID:(id)a3 longByteQualifier:(const char *)a4
{
  id v6 = (objc_class *)MEMORY[0x263EFF8F8];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithBytes:a4 length:8];
  objc_super v9 = (void *)[v7 copy];

  v10 = [(FSEntityIdentifier *)self initWithUUID:v9 data:v8];
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uuid = self->_uuid;
  qualifier = self->_qualifier;
  id v8 = v5;
  objc_super v9 = (void *)[(NSUUID *)uuid copyWithZone:a3];
  if (qualifier)
  {
    uint64_t v10 = [(NSData *)self->_qualifier copyWithZone:a3];
    v11 = (void *)[v8 initWithCopiedUUID:v9 data:v10];

    id v8 = (id)v10;
  }
  else
  {
    v11 = (void *)[v8 initWithUUID:v9];
  }

  return v11;
}

+ (id)identifier
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)identifierWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithUUID:v4];

  return v5;
}

+ (id)identifierWithUUID:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithUUID:v7 data:v6];

  return v8;
}

+ (id)identifierWithUUID:(id)a3 byteQualifier:(const char *)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initWithUUID:v6 byteQualifier:a4];

  return v7;
}

+ (id)identifierWithUUID:(id)a3 longByteQualifier:(const char *)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initWithUUID:v6 longByteQualifier:a4];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    qualifier = self->_qualifier;
    if (!qualifier || v5[2] && -[NSData isEqual:](qualifier, "isEqual:")) {
      char v7 = [(NSUUID *)self->_uuid isEqual:v5[1]];
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  qualifier = self->_qualifier;
  if (qualifier) {
    uint64_t v4 = 997 * [(NSData *)qualifier hash];
  }
  else {
    uint64_t v4 = 0;
  }
  return [(NSUUID *)self->_uuid hash] + v4;
}

- (id)description
{
  qualifier = self->_qualifier;
  if (qualifier)
  {
    uint64_t v4 = 2 * [(NSData *)qualifier length];
    id v5 = [(NSData *)self->_qualifier debugDescription];
    id v6 = objc_msgSend(v5, "substringWithRange:", 1, v4);

    char v7 = NSString;
    id v8 = [(NSUUID *)self->_uuid description];
    objc_super v9 = [v7 stringWithFormat:@"%@-%@", v8, v6];
  }
  else
  {
    objc_super v9 = [(NSUUID *)self->_uuid description];
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_uuid forKey:@"FSEntityID.uuid"];
  qualifier = self->_qualifier;
  if (qualifier) {
    [v5 encodeObject:qualifier forKey:@"FSEntityID.qual"];
  }
}

- (FSEntityIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FSEntityIdentifier;
  id v5 = [(FSEntityIdentifier *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSEntityID.uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSEntityID.qual"];
    qualifier = v5->_qualifier;
    v5->_qualifier = (NSData *)v8;
  }
  return v5;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSData)qualifier
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQualifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (FSEntityIdentifier)initWithBytes:(const char *)a3 length:(int)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a4 == 16)
  {
    long long v8 = *(_OWORD *)a3;
    id v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v8];
    self = -[FSEntityIdentifier initWithUUID:](self, "initWithUUID:", v5, v8);

    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (NSData)uuidData
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = 0;
  v4[1] = 0;
  [(NSUUID *)self->_uuid getUUIDBytes:v4];
  id v2 = [MEMORY[0x263EFF8F8] dataWithBytes:v4 length:16];
  return (NSData *)v2;
}

+ (id)defaultInstanceUUID
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&defaultUUIDBytes];
  return v2;
}

@end