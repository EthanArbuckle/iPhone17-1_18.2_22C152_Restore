@interface AVFigRoutingContextCommandOutputDeviceConfiguration
+ (void)initialize;
- (AVFigRoutingContextCommandOutputDeviceConfiguration)init;
- (AVFigRoutingContextCommandOutputDeviceConfiguration)initWithRoutingContextComandResponse:(__CFDictionary *)a3;
- (BOOL)automaticallyAllowsConnectionsFromPeersInHomeGroup;
- (BOOL)onlyAllowsConnectionsFromPeersInHomeGroup;
- (NSArray)peersInHomeGroup;
- (NSData)devicePublicKey;
- (NSString)deviceID;
- (NSString)deviceName;
- (NSString)devicePassword;
- (void)dealloc;
@end

@implementation AVFigRoutingContextCommandOutputDeviceConfiguration

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (AVFigRoutingContextCommandOutputDeviceConfiguration)init
{
  return [(AVFigRoutingContextCommandOutputDeviceConfiguration *)self initWithRoutingContextComandResponse:0];
}

- (AVFigRoutingContextCommandOutputDeviceConfiguration)initWithRoutingContextComandResponse:(__CFDictionary *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVFigRoutingContextCommandOutputDeviceConfiguration;
  v4 = [(AVFigRoutingContextCommandOutputDeviceConfiguration *)&v8 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  if (!a3)
  {
    v4->_response = 0;
    goto LABEL_6;
  }
  v6 = (__CFDictionary *)CFRetain(a3);
  v5->_response = v6;
  if (!v6)
  {
LABEL_7:
    a3 = 0;
    goto LABEL_6;
  }
  a3 = v5;
LABEL_6:

  return (AVFigRoutingContextCommandOutputDeviceConfiguration *)a3;
}

- (void)dealloc
{
  response = self->_response;
  if (response) {
    CFRelease(response);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVFigRoutingContextCommandOutputDeviceConfiguration;
  [(AVFigRoutingContextCommandOutputDeviceConfiguration *)&v4 dealloc];
}

- (NSString)deviceName
{
  return (NSString *)CFDictionaryGetValue(self->_response, (const void *)*MEMORY[0x1E4F20500]);
}

- (NSString)devicePassword
{
  return (NSString *)CFDictionaryGetValue(self->_response, (const void *)*MEMORY[0x1E4F20518]);
}

- (NSString)deviceID
{
  return (NSString *)CFDictionaryGetValue(self->_response, (const void *)*MEMORY[0x1E4F204D0]);
}

- (NSData)devicePublicKey
{
  return (NSData *)CFDictionaryGetValue(self->_response, (const void *)*MEMORY[0x1E4F204E0]);
}

- (BOOL)automaticallyAllowsConnectionsFromPeersInHomeGroup
{
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(self->_response, (const void *)*MEMORY[0x1E4F20508]);
  if (Value) {
    LOBYTE(Value) = CFBooleanGetValue(Value) != 0;
  }
  return (char)Value;
}

- (BOOL)onlyAllowsConnectionsFromPeersInHomeGroup
{
  BOOL v3 = [(AVFigRoutingContextCommandOutputDeviceConfiguration *)self automaticallyAllowsConnectionsFromPeersInHomeGroup];
  if (v3)
  {
    CFDictionaryGetValue(self->_response, (const void *)*MEMORY[0x1E4F20510]);
    LOBYTE(v3) = FigCFEqual() == 0;
  }
  return v3;
}

- (NSArray)peersInHomeGroup
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  CFBooleanRef Value = (void *)CFDictionaryGetValue(self->_response, (const void *)*MEMORY[0x1E4F204F8]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = Value;
  uint64_t v5 = [Value countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    uint64_t v8 = *MEMORY[0x1E4F204D0];
    uint64_t v9 = *MEMORY[0x1E4F204E0];
    uint64_t v10 = *MEMORY[0x1E4F204D8];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        v12 = -[AVOutputDeviceAuthorizedPeer initWithID:publicKey:hasAdministratorPrivileges:]([AVOutputDeviceAuthorizedPeer alloc], "initWithID:publicKey:hasAdministratorPrivileges:", [*(id *)(*((void *)&v15 + 1) + 8 * v11) objectForKeyedSubscript:v8], objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11), "objectForKeyedSubscript:", v9), objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11), "objectForKeyedSubscript:", v10), "unsignedIntegerValue") == 1);
        [(NSArray *)v3 addObject:v12];

        ++v11;
      }
      while (v6 != v11);
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  return v3;
}

@end