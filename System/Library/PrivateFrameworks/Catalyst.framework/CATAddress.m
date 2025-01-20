@interface CATAddress
+ (id)any;
+ (id)localWiFi;
- (BOOL)isAny;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAddress:(id)a3;
- (BOOL)isLocalWiFi;
- (CATAddress)init;
- (CATAddress)initWithData:(id)a3;
- (CATAddress)initWithString:(id)a3;
- (NSData)data;
- (NSString)address;
- (id)description;
- (unint64_t)hash;
@end

@implementation CATAddress

- (NSString)address
{
  if (!self->_address)
  {
    NSUInteger v4 = [(NSData *)self->_data length];
    data = self->_data;
    if (v4 < 0x10)
    {
      if ([(NSData *)data length])
      {
        v20 = [MEMORY[0x263F08690] currentHandler];
        [v20 handleFailureInMethod:a2 object:self file:@"CATAddress.m" lineNumber:46 description:@"The provided data is not long enough to be a sockaddr."];
      }
      address = self->_address;
      self->_address = (NSString *)&stru_26C4A6940;
      goto LABEL_13;
    }
    uint64_t v6 = [(NSData *)data bytes];
    v7 = [MEMORY[0x263EFF990] data];
    v8 = v7;
    int v9 = *(unsigned __int8 *)(v6 + 1);
    if (v9 == 30)
    {
      v10 = (const void *)(v6 + 8);
      uint64_t v11 = 47;
    }
    else
    {
      if (v9 != 2)
      {
        v10 = 0;
        goto LABEL_12;
      }
      v10 = (const void *)(v6 + 4);
      uint64_t v11 = 17;
    }
    [v7 setLength:v11];
LABEL_12:
    int v13 = *(unsigned __int8 *)(v6 + 1);
    id v14 = v8;
    inet_ntop(v13, v10, (char *)[v14 mutableBytes], objc_msgSend(v14, "length"));
    id v15 = [NSString alloc];
    address = (NSString *)v14;
    v16 = (NSString *)objc_msgSend(v15, "initWithUTF8String:", -[NSString bytes](address, "bytes"));
    v17 = self->_address;
    self->_address = v16;

LABEL_13:
  }
  v18 = self->_address;

  return v18;
}

- (BOOL)isAny
{
  v3 = [(CATAddress *)self data];
  unint64_t v4 = [v3 length];

  BOOL result = v4 >= 0x10
        && ([(CATAddress *)self data],
            id v5 = objc_claimAutoreleasedReturnValue(),
            uint64_t v6 = [v5 bytes],
            v5,
            *(unsigned char *)(v6 + 1) == 2)
        && *(_DWORD *)(v6 + 4) == 0;
  return result;
}

- (BOOL)isLocalWiFi
{
  v3 = [(CATAddress *)self data];
  unint64_t v4 = [v3 length];

  BOOL result = v4 >= 0x10
        && ([(CATAddress *)self data],
            id v5 = objc_claimAutoreleasedReturnValue(),
            uint64_t v6 = [v5 bytes],
            v5,
            *(unsigned char *)(v6 + 1) == 2)
        && *(_DWORD *)(v6 + 4) == 65193;
  return result;
}

+ (id)any
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __17__CATAddress_any__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (any_onceToken != -1) {
    dispatch_once(&any_onceToken, block);
  }
  v2 = (void *)any_any;

  return v2;
}

void __17__CATAddress_any__block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x263EF8340];
  v5[1] = 0;
  v5[0] = 528;
  v2 = [MEMORY[0x263EFF8F8] dataWithBytes:v5 length:16];
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) initWithData:v2];
  unint64_t v4 = (void *)any_any;
  any_any = v3;
}

+ (id)localWiFi
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__CATAddress_localWiFi__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (localWiFi_onceToken != -1) {
    dispatch_once(&localWiFi_onceToken, block);
  }
  v2 = (void *)localWiFi_localWiFi;

  return v2;
}

void __23__CATAddress_localWiFi__block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x263EF8340];
  v5[1] = 0;
  v5[0] = 0xFEA900000210;
  v2 = [MEMORY[0x263EFF8F8] dataWithBytes:v5 length:16];
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) initWithData:v2];
  unint64_t v4 = (void *)localWiFi_localWiFi;
  localWiFi_localWiFi = v3;
}

- (CATAddress)initWithString:(id)a3
{
  v7 = 0;
  memset(&v8, 0, sizeof(v8));
  v8.ai_flags = 4;
  if (getaddrinfo((const char *)[a3 UTF8String], 0, &v8, &v7))
  {
    unint64_t v4 = 0;
  }
  else
  {
    id v5 = [MEMORY[0x263EFF8F8] dataWithBytes:v7->ai_addr length:v7->ai_addrlen];
    freeaddrinfo(v7);
    self = [(CATAddress *)self initWithData:v5];

    unint64_t v4 = self;
  }

  return v4;
}

- (CATAddress)initWithData:(id)a3
{
  id v5 = a3;
  if ([v5 length] && (unint64_t)objc_msgSend(v5, "length") <= 0xF)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"CATAddress.m" lineNumber:146 description:@"The provided data is not long enough to be a sockaddr."];
  }
  v11.receiver = self;
  v11.super_class = (Class)CATAddress;
  uint64_t v6 = [(CATAddress *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFF8F8] dataWithData:v5];
    data = v6->_data;
    v6->_data = (NSData *)v7;
  }
  return v6;
}

- (CATAddress)init
{
  return [(CATAddress *)self initWithData:0];
}

- (id)description
{
  if ([(CATAddress *)self isAny])
  {
    uint64_t v3 = NSString;
    v12.receiver = self;
    v12.super_class = (Class)CATAddress;
    unint64_t v4 = [(CATAddress *)&v12 description];
    id v5 = [(CATAddress *)self address];
    [v3 stringWithFormat:@"%@ address: ANY %@", v4, v5];
  }
  else
  {
    BOOL v6 = [(CATAddress *)self isLocalWiFi];
    uint64_t v7 = NSString;
    if (v6)
    {
      v11.receiver = self;
      v11.super_class = (Class)CATAddress;
      unint64_t v4 = [(CATAddress *)&v11 description];
      id v5 = [(CATAddress *)self address];
      [v7 stringWithFormat:@"%@ address: LOCAL WIFI %@", v4, v5];
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)CATAddress;
      unint64_t v4 = [(CATAddress *)&v10 description];
      id v5 = [(CATAddress *)self address];
      [v7 stringWithFormat:@"%@ address: %@", v4, v5];
    }
  addrinfo v8 = };

  return v8;
}

- (unint64_t)hash
{
  v2 = [(CATAddress *)self data];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqualToAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CATAddress *)self data];
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
  id v4 = (CATAddress *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CATAddress *)self isEqualToAddress:v4];
  }

  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_address, 0);
}

@end