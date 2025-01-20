@interface LACDTOMutableKVStoreWriteRequest
- (BOOL)bypassEntitlements;
- (BOOL)isEqual:(id)a3;
- (LACDTOKVStoreValue)value;
- (LACDTOMutableKVStoreWriteRequest)initWithKey:(int64_t)a3 value:(id)a4;
- (NSString)description;
- (NSUUID)contextUUID;
- (NSXPCConnection)connection;
- (int64_t)key;
- (void)setBypassEntitlements:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setContextUUID:(id)a3;
- (void)setKey:(int64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation LACDTOMutableKVStoreWriteRequest

- (LACDTOMutableKVStoreWriteRequest)initWithKey:(int64_t)a3 value:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LACDTOMutableKVStoreWriteRequest;
  v8 = [(LACDTOMutableKVStoreWriteRequest *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_key = a3;
    objc_storeStrong((id *)&v8->_value, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_270433F68])
  {
    id v5 = v4;
    int64_t v6 = [(LACDTOMutableKVStoreWriteRequest *)self key];
    if (v6 == [v5 key])
    {
      id v7 = [(LACDTOMutableKVStoreWriteRequest *)self value];
      uint64_t v8 = [v5 value];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(LACDTOMutableKVStoreWriteRequest *)self value];
        objc_super v11 = [v5 value];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_14;
        }
      }
      v14 = [(LACDTOMutableKVStoreWriteRequest *)self connection];
      uint64_t v15 = [v5 connection];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(LACDTOMutableKVStoreWriteRequest *)self connection];
        v18 = [v5 connection];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_14;
        }
      }
      v20 = [(LACDTOMutableKVStoreWriteRequest *)self contextUUID];
      uint64_t v21 = [v5 contextUUID];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(LACDTOMutableKVStoreWriteRequest *)self contextUUID];
        v24 = [v5 contextUUID];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_14;
        }
      }
      BOOL v27 = [(LACDTOMutableKVStoreWriteRequest *)self bypassEntitlements];
      int v13 = v27 ^ [v5 bypassEntitlements] ^ 1;
      goto LABEL_15;
    }
LABEL_14:
    LOBYTE(v13) = 0;
LABEL_15:

    goto LABEL_16;
  }
  LOBYTE(v13) = 0;
LABEL_16:

  return v13;
}

- (NSString)description
{
  v24[5] = *MEMORY[0x263EF8340];
  v20 = NSString;
  uint64_t v19 = objc_opt_class();
  v3 = NSString;
  v23 = objc_msgSend(NSNumber, "numberWithInteger:", -[LACDTOMutableKVStoreWriteRequest key](self, "key"));
  v22 = [v3 stringWithFormat:@"key: %@", v23];
  v24[0] = v22;
  id v4 = NSString;
  uint64_t v21 = [(LACDTOMutableKVStoreWriteRequest *)self value];
  id v5 = [v4 stringWithFormat:@"value: %@", v21];
  v24[1] = v5;
  int64_t v6 = NSString;
  id v7 = [(LACDTOMutableKVStoreWriteRequest *)self connection];
  uint64_t v8 = [v6 stringWithFormat:@"connection: %@", v7];
  v24[2] = v8;
  v9 = NSString;
  v10 = [(LACDTOMutableKVStoreWriteRequest *)self contextUUID];
  objc_super v11 = [v9 stringWithFormat:@"contextUUID: %@", v10];
  v24[3] = v11;
  int v12 = NSString;
  int v13 = objc_msgSend(NSNumber, "numberWithBool:", -[LACDTOMutableKVStoreWriteRequest bypassEntitlements](self, "bypassEntitlements"));
  v14 = [v12 stringWithFormat:@"bypassEntitlements: %@", v13];
  v24[4] = v14;
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:5];
  v16 = [v15 componentsJoinedByString:@"; "];
  v17 = [v20 stringWithFormat:@"<%@ %p; %@>", v19, self, v16];

  return (NSString *)v17;
}

- (int64_t)key
{
  return self->_key;
}

- (void)setKey:(int64_t)a3
{
  self->_key = a3;
}

- (LACDTOKVStoreValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSUUID)contextUUID
{
  return self->_contextUUID;
}

- (void)setContextUUID:(id)a3
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
  objc_storeStrong((id *)&self->_contextUUID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end