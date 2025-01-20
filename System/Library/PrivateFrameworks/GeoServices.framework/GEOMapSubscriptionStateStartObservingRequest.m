@interface GEOMapSubscriptionStateStartObservingRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (BOOL)sendInitialUpdate;
- (GEOMapSubscriptionStateStartObservingRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOMapSubscriptionStateStartObservingRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSArray)identifiers;
- (NSArray)pairedDeviceIdentifiers;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setPairedDeviceIdentifiers:(id)a3;
- (void)setSendInitialUpdate:(BOOL)a3;
@end

@implementation GEOMapSubscriptionStateStartObservingRequest

+ (Class)replyClass
{
  return 0;
}

- (GEOMapSubscriptionStateStartObservingRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"subscriptions.startObservingStateForSubscriptions" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOMapSubscriptionStateStartObservingRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)GEOMapSubscriptionStateStartObservingRequest;
  v7 = [(GEOXPCRequest *)&v26 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v8 = xpc_dictionary_get_array(v6, "identifiers");
    size_t count = xpc_array_get_count(v8);
    v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:count];
    if (count)
    {
      for (size_t i = 0; i != count; ++i)
      {
        string = xpc_array_get_string(v8, i);
        if (string)
        {
          v13 = [NSString stringWithUTF8String:string];
          [v10 addObject:v13];
        }
      }
    }
    uint64_t v14 = [v10 count];
    if (v14) {
      v15 = (void *)[v10 copy];
    }
    else {
      v15 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v7->_identifiers, v15);
    if (v14) {

    }
    v16 = xpc_dictionary_get_array(v6, "pairedDeviceIdentifiers");
    size_t v17 = xpc_array_get_count(v16);
    v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v17];
    if (v17)
    {
      for (size_t j = 0; j != v17; ++j)
      {
        v20 = xpc_array_get_string(v16, j);
        if (v20)
        {
          v21 = [NSString stringWithUTF8String:v20];
          [v18 addObject:v21];
        }
      }
    }
    uint64_t v22 = [v18 count];
    if (v22) {
      v23 = (void *)[v18 copy];
    }
    else {
      v23 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v7->_pairedDeviceIdentifiers, v23);
    if (v22) {

    }
    v7->_sendInitialUpdate = xpc_dictionary_get_BOOL(v6, "sendInitialUpdate");
    v24 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)GEOMapSubscriptionStateStartObservingRequest;
  [(GEOXPCRequest *)&v28 encodeToXPCDictionary:v4];
  if ([(NSArray *)self->_identifiers count])
  {
    xpc_object_t v5 = xpc_array_create(0, 0);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = self->_identifiers;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = (const char *)[*(id *)(*((void *)&v24 + 1) + 8 * v10) UTF8String];
          if (v11) {
            xpc_array_set_string(v5, 0xFFFFFFFFFFFFFFFFLL, v11);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v8);
    }

    if (xpc_array_get_count(v5)) {
      xpc_dictionary_set_value(v4, "identifiers", v5);
    }
  }
  if ([(NSArray *)self->_pairedDeviceIdentifiers count])
  {
    xpc_object_t v12 = xpc_array_create(0, 0);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v13 = self->_pairedDeviceIdentifiers;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v20 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(id *)(*((void *)&v20 + 1) + 8 * v17);
          v19 = (const char *)objc_msgSend(v18, "UTF8String", (void)v20);
          if (v19) {
            xpc_array_set_string(v12, 0xFFFFFFFFFFFFFFFFLL, v19);
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v20 objects:v29 count:16];
      }
      while (v15);
    }

    if (xpc_array_get_count(v12)) {
      xpc_dictionary_set_value(v4, "pairedDeviceIdentifiers", v12);
    }
  }
  xpc_dictionary_set_BOOL(v4, "sendInitialUpdate", self->_sendInitialUpdate);
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 0;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (NSArray)pairedDeviceIdentifiers
{
  return self->_pairedDeviceIdentifiers;
}

- (void)setPairedDeviceIdentifiers:(id)a3
{
}

- (BOOL)sendInitialUpdate
{
  return self->_sendInitialUpdate;
}

- (void)setSendInitialUpdate:(BOOL)a3
{
  self->_sendInitialUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceIdentifiers, 0);

  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end