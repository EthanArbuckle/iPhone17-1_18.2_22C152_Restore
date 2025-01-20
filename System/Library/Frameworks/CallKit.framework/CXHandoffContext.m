@interface CXHandoffContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHandoffContext:(id)a3;
- (BOOL)isOutgoing;
- (CXHandle)remoteHandle;
- (CXHandoffContext)init;
- (CXHandoffContext)initWithCoder:(id)a3;
- (CXHandoffContext)initWithDictionaryRepresentation:(id)a3;
- (CXHandoffContext)initWithHandoffIdentifier:(id)a3;
- (NSDictionary)context;
- (NSDictionary)dictionaryRepresentation;
- (NSString)handoffIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContext:(id)a3;
- (void)setOutgoing:(BOOL)a3;
- (void)setRemoteHandle:(id)a3;
@end

@implementation CXHandoffContext

- (CXHandoffContext)initWithHandoffIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CXHandoffContext;
  v6 = [(CXHandoffContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_handoffIdentifier, a3);
  }

  return v7;
}

- (CXHandoffContext)init
{
  return 0;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CXHandoffContext *)self handoffIdentifier];
  [v3 appendFormat:@" handoffIdentifier=%@", v4];

  objc_msgSend(v3, "appendFormat:", @" isOutgoing=%d", -[CXHandoffContext isOutgoing](self, "isOutgoing"));
  id v5 = [(CXHandoffContext *)self remoteHandle];
  [v3 appendFormat:@" remoteHandle=%@", v5];

  v6 = [(CXHandoffContext *)self context];
  [v3 appendFormat:@" context=%@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (CXHandoffContext)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = NSStringFromSelector(sel_handoffIdentifier);
  v6 = [v4 objectForKeyedSubscript:v5];
  v7 = [(CXHandoffContext *)self initWithHandoffIdentifier:v6];

  if (v7)
  {
    v8 = NSStringFromSelector(sel_isOutgoing);
    objc_super v9 = [v4 objectForKeyedSubscript:v8];
    v7->_outgoing = [v9 BOOLValue];

    v10 = [v4 objectForKeyedSubscript:@"remoteHandleType"];
    uint64_t v11 = [v10 integerValue];

    v12 = [v4 objectForKeyedSubscript:@"remoteHandleValue"];
    v13 = [[CXHandle alloc] initWithType:v11 value:v12];
    remoteHandle = v7->_remoteHandle;
    v7->_remoteHandle = v13;

    v15 = NSStringFromSelector(sel_context);
    uint64_t v16 = [v4 objectForKeyedSubscript:v15];
    context = v7->_context;
    v7->_context = (NSDictionary *)v16;
  }
  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(CXHandoffContext *)self handoffIdentifier];
  id v5 = NSStringFromSelector(sel_handoffIdentifier);
  [v3 setObject:v4 forKeyedSubscript:v5];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[CXHandoffContext isOutgoing](self, "isOutgoing"));
  v7 = NSStringFromSelector(sel_isOutgoing);
  [v3 setObject:v6 forKeyedSubscript:v7];

  v8 = NSNumber;
  objc_super v9 = [(CXHandoffContext *)self remoteHandle];
  v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "type"));
  [v3 setObject:v10 forKeyedSubscript:@"remoteHandleType"];

  uint64_t v11 = [(CXHandoffContext *)self remoteHandle];
  v12 = [v11 value];
  [v3 setObject:v12 forKeyedSubscript:@"remoteHandleValue"];

  v13 = [(CXHandoffContext *)self context];
  v14 = NSStringFromSelector(sel_context);
  [v3 setObject:v13 forKeyedSubscript:v14];

  v15 = (void *)[v3 copy];

  return (NSDictionary *)v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXHandoffContext)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_handoffIdentifier);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];
  v8 = [(CXHandoffContext *)self initWithHandoffIdentifier:v7];

  if (v8)
  {
    objc_super v9 = NSStringFromSelector(sel_isOutgoing);
    v8->_outgoing = [v4 decodeBoolForKey:v9];

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = NSStringFromSelector(sel_remoteHandle);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    remoteHandle = v8->_remoteHandle;
    v8->_remoteHandle = (CXHandle *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, v19, objc_opt_class(), 0);
    v21 = NSStringFromSelector(sel_context);
    uint64_t v22 = [v4 decodeObjectOfClasses:v20 forKey:v21];
    context = v8->_context;
    v8->_context = (NSDictionary *)v22;
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXHandoffContext *)self handoffIdentifier];
  v6 = NSStringFromSelector(sel_handoffIdentifier);
  [v4 encodeObject:v5 forKey:v6];

  BOOL v7 = [(CXHandoffContext *)self isOutgoing];
  v8 = NSStringFromSelector(sel_isOutgoing);
  [v4 encodeBool:v7 forKey:v8];

  objc_super v9 = [(CXHandoffContext *)self remoteHandle];
  uint64_t v10 = NSStringFromSelector(sel_remoteHandle);
  [v4 encodeObject:v9 forKey:v10];

  id v12 = [(CXHandoffContext *)self context];
  uint64_t v11 = NSStringFromSelector(sel_context);
  [v4 encodeObject:v12 forKey:v11];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(CXHandoffContext *)self isEqualToHandoffContext:v4];

  return v5;
}

- (BOOL)isEqualToHandoffContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CXHandoffContext *)self handoffIdentifier];
  v6 = [v4 handoffIdentifier];
  if ([v5 isEqualToString:v6])
  {
    uint64_t v7 = [(CXHandoffContext *)self remoteHandle];
    uint64_t v8 = [v4 remoteHandle];
    if (v7 | v8 && ![(id)v7 isEqual:v8])
    {
      LOBYTE(v12) = 0;
    }
    else
    {
      uint64_t v9 = [(CXHandoffContext *)self context];
      uint64_t v10 = [v4 context];
      if (v9 | v10 && ![(id)v9 isEqual:v10])
      {
        LOBYTE(v12) = 0;
      }
      else
      {
        BOOL v11 = [(CXHandoffContext *)self isOutgoing];
        int v12 = v11 ^ [v4 isOutgoing] ^ 1;
      }
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(CXHandoffContext *)self handoffIdentifier];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(CXHandoffContext *)self remoteHandle];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(CXHandoffContext *)self context];
  uint64_t v8 = v6 ^ [v7 hash];
  BOOL v9 = [(CXHandoffContext *)self isOutgoing];
  uint64_t v10 = 1237;
  if (v9) {
    uint64_t v10 = 1231;
  }
  unint64_t v11 = v8 ^ v10;

  return v11;
}

- (NSString)handoffIdentifier
{
  return self->_handoffIdentifier;
}

- (BOOL)isOutgoing
{
  return self->_outgoing;
}

- (void)setOutgoing:(BOOL)a3
{
  self->_outgoing = a3;
}

- (CXHandle)remoteHandle
{
  return self->_remoteHandle;
}

- (void)setRemoteHandle:(id)a3
{
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_remoteHandle, 0);

  objc_storeStrong((id *)&self->_handoffIdentifier, 0);
}

@end