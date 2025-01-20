@interface CATEndPoint
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEndPoint:(id)a3;
- (CATAddress)address;
- (CATEndPoint)init;
- (CATEndPoint)initWithAddress:(id)a3 port:(unsigned int)a4;
- (CATEndPoint)initWithData:(id)a3;
- (NSData)data;
- (id)description;
- (unint64_t)hash;
- (unsigned)port;
@end

@implementation CATEndPoint

- (CATEndPoint)init
{
  v3 = objc_opt_new();
  v4 = [(CATEndPoint *)self initWithData:v3];

  return v4;
}

- (CATEndPoint)initWithData:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CATEndPoint;
  v6 = [(CATEndPoint *)&v18 init];
  if (v6)
  {
    v7 = [MEMORY[0x263EFF990] dataWithData:v5];
    if ([v7 length] && (unint64_t)objc_msgSend(v7, "length") <= 0xF)
    {
      v17 = [MEMORY[0x263F08690] currentHandler];
      [v17 handleFailureInMethod:a2 object:v6 file:@"CATEndPoint.m" lineNumber:35 description:@"The provided data is not long enough to be a sockaddr."];
    }
    if ([v7 length])
    {
      uint64_t v8 = [v7 mutableBytes];
      int v9 = *(unsigned __int8 *)(v8 + 1);
      if (v9 == 30 || v9 == 2)
      {
        v6->_port = bswap32(*(unsigned __int16 *)(v8 + 2)) >> 16;
        *(_WORD *)(v8 + 2) = 0;
      }
    }
    uint64_t v10 = [MEMORY[0x263EFF8F8] dataWithData:v5];
    data = v6->_data;
    v6->_data = (NSData *)v10;

    v12 = [CATAddress alloc];
    v13 = (void *)[v7 copy];
    uint64_t v14 = [(CATAddress *)v12 initWithData:v13];
    address = v6->_address;
    v6->_address = (CATAddress *)v14;
  }
  return v6;
}

- (CATEndPoint)initWithAddress:(id)a3 port:(unsigned int)a4
{
  v7 = [a3 data];
  uint64_t v8 = (void *)[v7 mutableCopy];

  if ([v8 length] && (unint64_t)objc_msgSend(v8, "length") <= 0xF)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"CATEndPoint.m" lineNumber:60 description:@"The provided data is not long enough to be a sockaddr."];
  }
  if ([v8 length])
  {
    uint64_t v9 = [v8 mutableBytes];
    int v10 = *(unsigned __int8 *)(v9 + 1);
    if (v10 == 30 || v10 == 2) {
      *(_WORD *)(v9 + 2) = bswap32(a4) >> 16;
    }
  }
  v11 = [(CATEndPoint *)self initWithData:v8];

  return v11;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)CATEndPoint;
  v4 = [(CATEndPoint *)&v9 description];
  id v5 = [(CATEndPoint *)self address];
  v6 = [v5 address];
  v7 = [v3 stringWithFormat:@"%@ address: %@ port: %d", v4, v6, -[CATEndPoint port](self, "port")];

  return v7;
}

- (unint64_t)hash
{
  v2 = [(CATEndPoint *)self data];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqualToEndPoint:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CATEndPoint *)self data];
  uint64_t v6 = [v4 data];

  if (v5 | v6) {
    char v7 = [(id)v5 isEqual:v6];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CATEndPoint *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CATEndPoint *)self isEqualToEndPoint:v4];
  }

  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (CATAddress)address
{
  return self->_address;
}

- (unsigned)port
{
  return self->_port;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end