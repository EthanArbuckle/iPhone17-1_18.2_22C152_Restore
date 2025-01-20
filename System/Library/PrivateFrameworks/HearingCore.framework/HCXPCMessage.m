@interface HCXPCMessage
+ (id)messageWithPayload:(id)a3;
+ (id)messageWithPayload:(id)a3 xpcMessage:(id)a4 andClient:(id)a5;
- (BOOL)hasEntitlement:(id)a3;
- (HCXPCClient)client;
- (HCXPCMessage)initWithPayload:(id)a3;
- (NSDictionary)payload;
- (NSError)error;
- (OS_xpc_object)xpcMessage;
- (id)description;
- (id)replyMessageWithPayload:(id)a3;
- (void)dealloc;
- (void)setClient:(id)a3;
- (void)setError:(id)a3;
- (void)setPayload:(id)a3;
- (void)setXpcMessage:(id)a3;
@end

@implementation HCXPCMessage

+ (id)messageWithPayload:(id)a3 xpcMessage:(id)a4 andClient:(id)a5
{
  if (a5)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = a3;
    v10 = [[HCXPCMessage alloc] initWithPayload:v9];

    [(HCXPCMessage *)v10 setXpcMessage:v8];
    [(HCXPCMessage *)v10 setClient:v7];
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (id)messageWithPayload:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPayload:v3];

  return v4;
}

- (HCXPCMessage)initWithPayload:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7.receiver = self;
    v7.super_class = (Class)HCXPCMessage;
    v5 = [(HCXPCMessage *)&v7 init];
    self = v5;
    if (v5) {
      [(HCXPCMessage *)v5 setPayload:v4];
    }
  }

  return self;
}

- (id)replyMessageWithPayload:(id)a3
{
  id v4 = a3;
  v5 = [(HCXPCMessage *)self xpcMessage];
  v6 = [(HCXPCMessage *)self client];
  objc_super v7 = +[HCXPCMessage messageWithPayload:v4 xpcMessage:v5 andClient:v6];

  return v7;
}

- (void)dealloc
{
  [(HCXPCMessage *)self setPayload:0];
  [(HCXPCMessage *)self setError:0];
  [(HCXPCMessage *)self setXpcMessage:0];
  v3.receiver = self;
  v3.super_class = (Class)HCXPCMessage;
  [(HCXPCMessage *)&v3 dealloc];
}

- (BOOL)hasEntitlement:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  v5 = [(HCXPCMessage *)self client];
  v6 = [v5 xpcConnection];

  if (v6
    && (long long v20 = 0u,
        long long v21 = 0u,
        xpc_connection_get_audit_token(),
        memset(&token, 0, sizeof(token)),
        (objc_super v7 = SecTaskCreateWithAuditToken(0, &token)) != 0))
  {
    id v8 = v7;
    CFErrorRef error = 0;
    CFTypeRef v9 = SecTaskCopyValueForEntitlement(v7, v4, &error);
    if (error)
    {
      HAInitializeLogging();
      v10 = [NSString stringWithFormat:@"Unable to get entitlements for client task. Error: %@", error];
      v11 = [NSString stringWithFormat:@"%s:%d %@", "-[HCXPCMessage hasEntitlement:]", 80, v10];
      v12 = (void *)HAEngineeringLog;
      if (os_log_type_enabled((os_log_t)HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = v11;
        v14 = v12;
        uint64_t v15 = [v13 UTF8String];
        token.val[0] = 136446210;
        *(void *)&token.val[1] = v15;
        _os_log_impl(&dword_1B8AF3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&token, 0xCu);
      }
      CFRelease(error);
    }
    if (v9)
    {
      CFTypeID v16 = CFGetTypeID(v9);
      BOOL v17 = v16 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v9) != 0;
      CFRelease(v9);
    }
    else
    {
      BOOL v17 = 0;
    }
    CFRelease(v8);
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)description
{
  objc_super v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)HCXPCMessage;
  id v4 = [(HCXPCMessage *)&v11 description];
  v5 = [(HCXPCMessage *)self error];
  v6 = [(HCXPCMessage *)self payload];
  objc_super v7 = [(HCXPCMessage *)self error];
  id v8 = [(HCXPCMessage *)self client];
  CFTypeRef v9 = [v3 stringWithFormat:@"%@ [%d | %@] {%@} - Client: %@", v4, v5 == 0, v6, v7, v8];

  return v9;
}

- (HCXPCClient)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  return (HCXPCClient *)WeakRetained;
}

- (void)setClient:(id)a3
{
}

- (OS_xpc_object)xpcMessage
{
  return self->_xpcMessage;
}

- (void)setXpcMessage:(id)a3
{
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_xpcMessage, 0);
  objc_destroyWeak((id *)&self->_client);
}

@end