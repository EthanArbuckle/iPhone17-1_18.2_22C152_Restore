@interface NEPacket
+ (BOOL)supportsSecureCoding;
- (NEFlowMetaData)metadata;
- (NEPacket)initWithCoder:(id)a3;
- (NEPacket)initWithData:(NSData *)data protocolFamily:(sa_family_t)protocolFamily;
- (NETrafficDirection)direction;
- (NSData)data;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initWithData:(char)a3 protocolFamily:(void *)a4 metadata:;
- (sa_family_t)protocolFamily;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NEPacket

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpose, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (NEFlowMetaData)metadata
{
  return (NEFlowMetaData *)objc_getProperty(self, a2, 32, 1);
}

- (NETrafficDirection)direction
{
  return self->_direction;
}

- (sa_family_t)protocolFamily
{
  return self->_protocolFamily;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[NEPacket allocWithZone:a3];
  v5 = [(NEPacket *)self data];
  char v6 = [(NEPacket *)self protocolFamily];
  v7 = [(NEPacket *)self metadata];
  v8 = -[NEPacket initWithData:protocolFamily:metadata:]((id *)&v4->super.isa, v5, v6, v7);

  return v8;
}

- (id)initWithData:(char)a3 protocolFamily:(void *)a4 metadata:
{
  id v8 = a2;
  id v9 = a4;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)NEPacket;
    v10 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 2, a2);
      *((unsigned char *)a1 + 8) = a3;
      objc_storeStrong(a1 + 4, a4);
    }
  }

  return a1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NEPacket *)self data];
  [v4 encodeObject:v5 forKey:@"data"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEPacket protocolFamily](self, "protocolFamily") != 0, @"protocolFamily");
  id v6 = [(NEPacket *)self metadata];
  [v4 encodeObject:v6 forKey:@"metadata"];
}

- (NEPacket)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NEPacket;
  v5 = [(NEPacket *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    v5->_protocolFamily = [v4 decodeIntForKey:@"protocolFamily"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];
    metadata = v5->_metadata;
    v5->_metadata = (NEFlowMetaData *)v8;
  }
  return v5;
}

- (NEPacket)initWithData:(NSData *)data protocolFamily:(sa_family_t)protocolFamily
{
  return (NEPacket *)-[NEPacket initWithData:protocolFamily:metadata:]((id *)&self->super.isa, data, protocolFamily, 0);
}

- (void)dealloc
{
  if (self && objc_getProperty(self, a2, 48, 1))
  {
    Property = (os_unfair_lock_s *)objc_getProperty(self, v3, 48, 1);
    -[NEFilterPacketInterpose freePacket:](Property, self);
    objc_setProperty_atomic(self, v5, 0, 48);
  }
  v6.receiver = self;
  v6.super_class = (Class)NEPacket;
  [(NEPacket *)&v6 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end