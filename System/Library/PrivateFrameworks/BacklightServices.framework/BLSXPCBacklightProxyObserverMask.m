@interface BLSXPCBacklightProxyObserverMask
+ (BOOL)supportsSecureCoding;
+ (id)maskForObserver:(id)a3;
+ (id)maskForObservingDidCompleteUpdateToState:(BOOL)a3 observingEventsArray:(BOOL)a4 didChangeAlwaysOnEnabled:(BOOL)a5 activatingWithEvent:(BOOL)a6 deactivatingWithEvent:(BOOL)a7 performingEvent:(BOOL)a8;
- (BLSXPCBacklightProxyObserverMask)initWithCoder:(id)a3;
- (BLSXPCBacklightProxyObserverMask)initWithObserver:(id)a3;
- (BLSXPCBacklightProxyObserverMask)initWithObservingDidCompleteUpdateToState:(BOOL)a3 observingEventsArray:(BOOL)a4 didChangeAlwaysOnEnabled:(BOOL)a5 activatingWithEvent:(BOOL)a6 deactivatingWithEvent:(BOOL)a7 performingEvent:(BOOL)a8;
- (BLSXPCBacklightProxyObserverMask)initWithXPCDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isObserving;
- (BOOL)isObservingActivatingWithEvent;
- (BOOL)isObservingDeactivatingWithEvent;
- (BOOL)isObservingDidChangeAlwaysOnEnabled;
- (BOOL)isObservingDidCompleteUpdateToState;
- (BOOL)isObservingEventsArray;
- (BOOL)isObservingPerformingEvent;
- (NSString)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BLSXPCBacklightProxyObserverMask

+ (id)maskForObserver:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithObserver:v4];

  return v5;
}

+ (id)maskForObservingDidCompleteUpdateToState:(BOOL)a3 observingEventsArray:(BOOL)a4 didChangeAlwaysOnEnabled:(BOOL)a5 activatingWithEvent:(BOOL)a6 deactivatingWithEvent:(BOOL)a7 performingEvent:(BOOL)a8
{
  v8 = (void *)[objc_alloc((Class)a1) initWithObservingDidCompleteUpdateToState:a3 observingEventsArray:a4 didChangeAlwaysOnEnabled:a5 activatingWithEvent:a6 deactivatingWithEvent:a7 performingEvent:a8];

  return v8;
}

- (BLSXPCBacklightProxyObserverMask)initWithObservingDidCompleteUpdateToState:(BOOL)a3 observingEventsArray:(BOOL)a4 didChangeAlwaysOnEnabled:(BOOL)a5 activatingWithEvent:(BOOL)a6 deactivatingWithEvent:(BOOL)a7 performingEvent:(BOOL)a8
{
  v15.receiver = self;
  v15.super_class = (Class)BLSXPCBacklightProxyObserverMask;
  result = [(BLSXPCBacklightProxyObserverMask *)&v15 init];
  if (result)
  {
    result->_observingDidCompleteUpdateToState = a3;
    result->_observingEventsArray = a4;
    result->_observingDidChangeAlwaysOnEnabled = a5;
    result->_observingActivatingWithEvent = a6;
    result->_observingDeactivatingWithEvent = a7;
    result->_observingPerformingEvent = a8;
  }
  return result;
}

- (BLSXPCBacklightProxyObserverMask)initWithObserver:(id)a3
{
  id v4 = a3;
  char v5 = objc_opt_respondsToSelector();
  if (v5) {
    char v6 = 1;
  }
  else {
    char v6 = objc_opt_respondsToSelector();
  }
  char v7 = objc_opt_respondsToSelector();
  char v8 = objc_opt_respondsToSelector();
  char v9 = objc_opt_respondsToSelector();
  v10 = [(BLSXPCBacklightProxyObserverMask *)self initWithObservingDidCompleteUpdateToState:v6 & 1 observingEventsArray:v5 & 1 didChangeAlwaysOnEnabled:v7 & 1 activatingWithEvent:v8 & 1 deactivatingWithEvent:v9 & 1 performingEvent:objc_opt_respondsToSelector() & 1];

  return v10;
}

- (BOOL)isObserving
{
  return self->_observingDidCompleteUpdateToState
      || self->_observingDidChangeAlwaysOnEnabled
      || self->_observingActivatingWithEvent
      || self->_observingDeactivatingWithEvent
      || self->_observingPerformingEvent;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_observingDidCompleteUpdateToState withName:@"didUpdateToState" ifEqualTo:1];
  id v5 = (id)[v3 appendBool:self->_observingEventsArray withName:@"eventsArray" ifEqualTo:1];
  id v6 = (id)[v3 appendBool:self->_observingDidChangeAlwaysOnEnabled withName:@"alwaysOnEnabled" ifEqualTo:1];
  id v7 = (id)[v3 appendBool:self->_observingActivatingWithEvent withName:@"activating" ifEqualTo:1];
  id v8 = (id)[v3 appendBool:self->_observingDeactivatingWithEvent withName:@"deactivating" ifEqualTo:1];
  id v9 = (id)[v3 appendBool:self->_observingPerformingEvent withName:@"performingEvent" ifEqualTo:1];
  v10 = [v3 build];

  return (NSString *)v10;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendBool:self->_observingDidCompleteUpdateToState];
  id v5 = (id)[v3 appendBool:self->_observingEventsArray];
  id v6 = (id)[v3 appendBool:self->_observingDidChangeAlwaysOnEnabled];
  id v7 = (id)[v3 appendBool:self->_observingActivatingWithEvent];
  id v8 = (id)[v3 appendBool:self->_observingDeactivatingWithEvent];
  id v9 = (id)[v3 appendBool:self->_observingPerformingEvent];
  unint64_t v10 = [v3 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  BOOL observingDidCompleteUpdateToState = self->_observingDidCompleteUpdateToState;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke;
  v38[3] = &unk_1E6107880;
  id v7 = v4;
  id v39 = v7;
  id v8 = (id)[v5 appendBool:observingDidCompleteUpdateToState counterpart:v38];
  BOOL observingEventsArray = self->_observingEventsArray;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke_2;
  v36[3] = &unk_1E6107880;
  id v10 = v7;
  id v37 = v10;
  id v11 = (id)[v5 appendBool:observingEventsArray counterpart:v36];
  BOOL observingDidChangeAlwaysOnEnabled = self->_observingDidChangeAlwaysOnEnabled;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke_3;
  v34[3] = &unk_1E6107880;
  id v13 = v10;
  id v35 = v13;
  id v14 = (id)[v5 appendBool:observingDidChangeAlwaysOnEnabled counterpart:v34];
  BOOL observingActivatingWithEvent = self->_observingActivatingWithEvent;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke_4;
  v32[3] = &unk_1E6107880;
  id v16 = v13;
  id v33 = v16;
  id v17 = (id)[v5 appendBool:observingActivatingWithEvent counterpart:v32];
  BOOL observingDeactivatingWithEvent = self->_observingDeactivatingWithEvent;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke_5;
  v30[3] = &unk_1E6107880;
  id v19 = v16;
  id v31 = v19;
  id v20 = (id)[v5 appendBool:observingDeactivatingWithEvent counterpart:v30];
  uint64_t observingPerformingEvent = self->_observingPerformingEvent;
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke_6;
  v28 = &unk_1E6107880;
  id v29 = v19;
  id v22 = v19;
  id v23 = (id)[v5 appendBool:observingPerformingEvent counterpart:&v25];
  LOBYTE(observingPerformingEvent) = objc_msgSend(v5, "isEqual", v25, v26, v27, v28);

  return observingPerformingEvent;
}

uint64_t __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) isObservingDidCompleteUpdateToState];
}

uint64_t __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) isObservingEventsArray];
}

uint64_t __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) isObservingDidChangeAlwaysOnEnabled];
}

uint64_t __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) isObservingActivatingWithEvent];
}

uint64_t __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) isObservingDeactivatingWithEvent];
}

uint64_t __44__BLSXPCBacklightProxyObserverMask_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) isObservingPerformingEvent];
}

- (BLSXPCBacklightProxyObserverMask)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (const char *)[@"didUpdateToState" UTF8String];
  id v6 = (const char *)[@"eventsArray" UTF8String];
  id v7 = (const char *)[@"alwaysOnEnabled" UTF8String];
  id v8 = (const char *)[@"activating" UTF8String];
  id v9 = (const char *)[@"deactivating" UTF8String];
  id v10 = (const char *)[@"performingEvent" UTF8String];
  BOOL v11 = xpc_dictionary_get_BOOL(v4, v5);
  BOOL v12 = xpc_dictionary_get_BOOL(v4, v6);
  BOOL v13 = xpc_dictionary_get_BOOL(v4, v7);
  BOOL v14 = xpc_dictionary_get_BOOL(v4, v8);
  BOOL v15 = xpc_dictionary_get_BOOL(v4, v9);
  BOOL v16 = xpc_dictionary_get_BOOL(v4, v10);

  return [(BLSXPCBacklightProxyObserverMask *)self initWithObservingDidCompleteUpdateToState:v11 observingEventsArray:v12 didChangeAlwaysOnEnabled:v13 activatingWithEvent:v14 deactivatingWithEvent:v15 performingEvent:v16];
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  id v4 = (const char *)[@"didUpdateToState" UTF8String];
  id v5 = (const char *)[@"eventsArray" UTF8String];
  id v6 = (const char *)[@"alwaysOnEnabled" UTF8String];
  id v7 = (const char *)[@"activating" UTF8String];
  id v8 = (const char *)[@"deactivating" UTF8String];
  id v9 = (const char *)[@"performingEvent" UTF8String];
  xpc_dictionary_set_BOOL(xdict, v4, self->_observingDidCompleteUpdateToState);
  xpc_dictionary_set_BOOL(xdict, v5, self->_observingEventsArray);
  xpc_dictionary_set_BOOL(xdict, v6, self->_observingDidChangeAlwaysOnEnabled);
  xpc_dictionary_set_BOOL(xdict, v7, self->_observingActivatingWithEvent);
  xpc_dictionary_set_BOOL(xdict, v8, self->_observingDeactivatingWithEvent);
  xpc_dictionary_set_BOOL(xdict, v9, self->_observingPerformingEvent);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSXPCBacklightProxyObserverMask)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"didUpdateToState"];
  uint64_t v6 = [v4 decodeBoolForKey:@"eventsArray"];
  uint64_t v7 = [v4 decodeBoolForKey:@"alwaysOnEnabled"];
  uint64_t v8 = [v4 decodeBoolForKey:@"activating"];
  uint64_t v9 = [v4 decodeBoolForKey:@"deactivating"];
  uint64_t v10 = [v4 decodeBoolForKey:@"performingEvent"];

  return [(BLSXPCBacklightProxyObserverMask *)self initWithObservingDidCompleteUpdateToState:v5 observingEventsArray:v6 didChangeAlwaysOnEnabled:v7 activatingWithEvent:v8 deactivatingWithEvent:v9 performingEvent:v10];
}

- (void)encodeWithCoder:(id)a3
{
  BOOL observingDidCompleteUpdateToState = self->_observingDidCompleteUpdateToState;
  id v5 = a3;
  [v5 encodeBool:observingDidCompleteUpdateToState forKey:@"didUpdateToState"];
  [v5 encodeBool:self->_observingEventsArray forKey:@"eventsArray"];
  [v5 encodeBool:self->_observingDidChangeAlwaysOnEnabled forKey:@"alwaysOnEnabled"];
  [v5 encodeBool:self->_observingActivatingWithEvent forKey:@"activating"];
  [v5 encodeBool:self->_observingDeactivatingWithEvent forKey:@"deactivating"];
  [v5 encodeBool:self->_observingPerformingEvent forKey:@"performingEvent"];
}

- (BOOL)isObservingDidCompleteUpdateToState
{
  return self->_observingDidCompleteUpdateToState;
}

- (BOOL)isObservingEventsArray
{
  return self->_observingEventsArray;
}

- (BOOL)isObservingDidChangeAlwaysOnEnabled
{
  return self->_observingDidChangeAlwaysOnEnabled;
}

- (BOOL)isObservingActivatingWithEvent
{
  return self->_observingActivatingWithEvent;
}

- (BOOL)isObservingDeactivatingWithEvent
{
  return self->_observingDeactivatingWithEvent;
}

- (BOOL)isObservingPerformingEvent
{
  return self->_observingPerformingEvent;
}

@end