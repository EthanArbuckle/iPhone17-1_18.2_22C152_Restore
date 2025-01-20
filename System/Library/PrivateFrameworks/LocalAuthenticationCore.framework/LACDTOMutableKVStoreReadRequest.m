@interface LACDTOMutableKVStoreReadRequest
- (BOOL)bypassEntitlements;
- (BOOL)isEqual:(id)a3;
- (LACDTOMutableKVStoreReadRequest)initWithKey:(int64_t)a3;
- (NSString)description;
- (NSXPCConnection)connection;
- (int64_t)key;
- (void)setBypassEntitlements:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setKey:(int64_t)a3;
@end

@implementation LACDTOMutableKVStoreReadRequest

- (LACDTOMutableKVStoreReadRequest)initWithKey:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LACDTOMutableKVStoreReadRequest;
  result = [(LACDTOMutableKVStoreReadRequest *)&v5 init];
  if (result) {
    result->_key = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_27043DED8])
  {
    id v5 = v4;
    int64_t v6 = [(LACDTOMutableKVStoreReadRequest *)self key];
    if (v6 == [v5 key])
    {
      v7 = [(LACDTOMutableKVStoreReadRequest *)self connection];
      uint64_t v8 = [v5 connection];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(LACDTOMutableKVStoreReadRequest *)self connection];
        v11 = [v5 connection];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_5;
        }
      }
      BOOL v14 = [(LACDTOMutableKVStoreReadRequest *)self bypassEntitlements];
      int v13 = v14 ^ [v5 bypassEntitlements] ^ 1;
      goto LABEL_9;
    }
LABEL_5:
    LOBYTE(v13) = 0;
LABEL_9:

    goto LABEL_10;
  }
  LOBYTE(v13) = 0;
LABEL_10:

  return v13;
}

- (NSString)description
{
  v18[3] = *MEMORY[0x263EF8340];
  v17 = NSString;
  uint64_t v3 = objc_opt_class();
  id v4 = NSString;
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[LACDTOMutableKVStoreReadRequest key](self, "key"));
  int64_t v6 = [v4 stringWithFormat:@"key: %@", v5];
  v18[0] = v6;
  v7 = NSString;
  uint64_t v8 = [(LACDTOMutableKVStoreReadRequest *)self connection];
  v9 = [v7 stringWithFormat:@"connection: %@", v8];
  v18[1] = v9;
  v10 = NSString;
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[LACDTOMutableKVStoreReadRequest bypassEntitlements](self, "bypassEntitlements"));
  int v12 = [v10 stringWithFormat:@"bypassEntitlements: %@", v11];
  v18[2] = v12;
  int v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  BOOL v14 = [v13 componentsJoinedByString:@"; "];
  v15 = [v17 stringWithFormat:@"<%@ %p; %@>", v3, self, v14];

  return (NSString *)v15;
}

- (int64_t)key
{
  return self->_key;
}

- (void)setKey:(int64_t)a3
{
  self->_key = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (BOOL)bypassEntitlements
{
  return self->_bypassEntitlements;
}

- (void)setBypassEntitlements:(BOOL)a3
{
  self->_bypassEntitlements = a3;
}

- (void).cxx_destruct
{
}

@end