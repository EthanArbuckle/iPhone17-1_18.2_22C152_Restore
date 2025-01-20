@interface GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSData)serializedState;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setSerializedState:(id)a3;
@end

@implementation GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"subscriptions.handlePairedDeviceStateUpdate" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateRequest;
  v7 = [(GEOXPCRequest *)&v15 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v6, "serializedState", &length);
    if (data)
    {
      v9 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
      uint64_t v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:a4];
      serializedState = v7->_serializedState;
      v7->_serializedState = (NSData *)v10;
    }
    v12 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateRequest;
  [(GEOXPCRequest *)&v7 encodeToXPCDictionary:v4];
  serializedState = self->_serializedState;
  if (serializedState)
  {
    id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:serializedState requiringSecureCoding:1 error:0];
    xpc_dictionary_set_data(v4, "serializedState", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- (NSData)serializedState
{
  return self->_serializedState;
}

- (void)setSerializedState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end