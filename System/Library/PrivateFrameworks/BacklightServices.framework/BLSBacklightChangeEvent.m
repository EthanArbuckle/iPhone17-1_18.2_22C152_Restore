@interface BLSBacklightChangeEvent
+ (BOOL)supportsSecureCoding;
- (BLSBacklightChangeEvent)initWithCoder:(id)a3;
- (BLSBacklightChangeEvent)initWithEventID:(unint64_t)a3 state:(int64_t)a4 previousState:(int64_t)a5 changeRequest:(id)a6;
- (BLSBacklightChangeEvent)initWithXPCDictionary:(id)a3;
- (BLSBacklightChangeRequest)changeRequest;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)bls_shortLoggingString;
- (int64_t)previousState;
- (int64_t)state;
- (unint64_t)eventID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BLSBacklightChangeEvent

- (BLSBacklightChangeEvent)initWithEventID:(unint64_t)a3 state:(int64_t)a4 previousState:(int64_t)a5 changeRequest:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)BLSBacklightChangeEvent;
  v12 = [(BLSBacklightChangeEvent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_eventID = a3;
    v12->_state = a4;
    v12->_previousState = a5;
    objc_storeStrong((id *)&v12->_changeRequest, a6);
  }

  return v13;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendUInt64:self->_eventID withName:@"id"];
  v5 = NSStringFromBLSBacklightState(self->_state);
  [v3 appendString:v5 withName:@"state"];

  v6 = NSStringFromBLSBacklightState(self->_previousState);
  [v3 appendString:v6 withName:@"previousState"];

  id v7 = (id)[v3 appendObject:self->_changeRequest withName:@"request"];
  v8 = [v3 build];

  return (NSString *)v8;
}

- (id)bls_shortLoggingString
{
  v3 = objc_opt_new();
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __49__BLSBacklightChangeEvent_bls_shortLoggingString__block_invoke;
  v10 = &unk_1E6106FA8;
  id v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:0 block:&v7];
  v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return v5;
}

void __49__BLSBacklightChangeEvent_bls_shortLoggingString__block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 24);
  if (v2 != v3)
  {
    id v4 = *(void **)(a1 + 40);
    v5 = NSStringFromBLSBacklightState(v2);
    [v4 appendString:v5 withName:0];

    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  }
  v6 = *(void **)(a1 + 40);
  uint64_t v7 = NSStringFromBLSBacklightState(v2);
  [v6 appendString:v7 withName:@"->"];

  id v12 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  v9 = [v12 explanation];
  v10 = NSStringFromBLSBacklightChangeSourceEvent([v12 sourceEvent]);
  [v8 appendString:v9 withName:v10];

  id v11 = (id)[*(id *)(a1 + 40) appendUInt64:*(void *)(*(void *)(a1 + 32) + 8) withName:0];
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendUnsignedInteger:self->_eventID];
  id v5 = (id)[v3 appendUnsignedInteger:HIDWORD(self->_eventID)];
  id v6 = (id)[v3 appendInteger:self->_state];
  id v7 = (id)[v3 appendInteger:self->_previousState];
  id v8 = (id)[v3 appendObject:self->_changeRequest];
  unint64_t v9 = [v3 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BLSBacklightChangeEvent *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t eventID = self->_eventID;
      if (eventID == [(BLSBacklightChangeEvent *)v5 eventID]
        && (int64_t state = self->_state, state == [(BLSBacklightChangeEvent *)v5 state])
        && (int64_t previousState = self->_previousState,
            previousState == [(BLSBacklightChangeEvent *)v5 previousState]))
      {
        changeRequest = self->_changeRequest;
        v10 = [(BLSBacklightChangeEvent *)v5 changeRequest];
        char v11 = [(BLSBacklightChangeRequest *)changeRequest isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (BLSBacklightChangeEvent)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (const char *)[@"id" UTF8String];
  id v6 = (const char *)[@"state" UTF8String];
  id v7 = (const char *)[@"previousState" UTF8String];
  id v8 = (const char *)[@"request" UTF8String];
  int64_t int64 = xpc_dictionary_get_int64(v4, v5);
  int64_t v10 = xpc_dictionary_get_int64(v4, v6);
  int64_t v11 = xpc_dictionary_get_int64(v4, v7);
  id v12 = xpc_dictionary_get_dictionary(v4, v8);
  if (v12)
  {
    v13 = [[BLSBacklightChangeRequest alloc] initWithXPCDictionary:v12];
  }
  else
  {
    v14 = bls_backlight_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BLSBacklightChangeEvent initWithXPCDictionary:]((uint64_t)v4, v14);
    }

    v13 = 0;
  }
  objc_super v15 = [(BLSBacklightChangeEvent *)self initWithEventID:int64 state:v10 previousState:v11 changeRequest:v13];

  return v15;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (const char *)[@"id" UTF8String];
  id v6 = (const char *)[@"state" UTF8String];
  id v7 = (const char *)[@"previousState" UTF8String];
  id v8 = (const char *)[@"request" UTF8String];
  xpc_dictionary_set_int64(v4, v5, self->_eventID);
  xpc_dictionary_set_int64(v4, v6, self->_state);
  xpc_dictionary_set_int64(v4, v7, self->_previousState);
  xpc_object_t value = xpc_dictionary_create(0, 0, 0);
  [(BLSBacklightChangeRequest *)self->_changeRequest encodeWithXPCDictionary:value];
  xpc_dictionary_set_value(v4, v8, value);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSBacklightChangeEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"id"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"state"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"previousState"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"request"];

  unint64_t v9 = [(BLSBacklightChangeEvent *)self initWithEventID:v5 state:v6 previousState:v7 changeRequest:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t eventID = self->_eventID;
  id v5 = a3;
  [v5 encodeInt64:eventID forKey:@"id"];
  [v5 encodeInteger:self->_state forKey:@"state"];
  [v5 encodeInteger:self->_previousState forKey:@"previousState"];
  [v5 encodeObject:self->_changeRequest forKey:@"request"];
}

- (unint64_t)eventID
{
  return self->_eventID;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)previousState
{
  return self->_previousState;
}

- (BLSBacklightChangeRequest)changeRequest
{
  return self->_changeRequest;
}

- (void).cxx_destruct
{
}

- (void)initWithXPCDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B55DE000, a2, OS_LOG_TYPE_FAULT, "change request missing from encoding: %@", (uint8_t *)&v2, 0xCu);
}

@end