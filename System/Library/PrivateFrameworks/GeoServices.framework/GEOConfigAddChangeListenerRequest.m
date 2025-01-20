@interface GEOConfigAddChangeListenerRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOConfigAddChangeListenerRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOConfigAddChangeListenerRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSDictionary)keysAndSources;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setKeysAndSources:(id)a3;
@end

@implementation GEOConfigAddChangeListenerRequest

- (void).cxx_destruct
{
}

uint64_t __65__GEOConfigAddChangeListenerRequest_initWithXPCDictionary_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = NSString;
  id v6 = a3;
  v7 = [v5 stringWithUTF8String:a2];
  int64_t value = xpc_int64_get_value(v6);

  v9 = *(void **)(a1 + 32);
  v10 = [NSNumber numberWithUnsignedInteger:value];
  [v9 setObject:v10 forKey:v7];

  return 1;
}

void __59__GEOConfigAddChangeListenerRequest_encodeToXPCDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  int64_t v6 = [a3 longLongValue];
  v7 = *(void **)(a1 + 32);
  id v8 = v5;
  v9 = (const char *)[v8 UTF8String];

  xpc_dictionary_set_int64(v7, v9, v6);
}

- (void)setKeysAndSources:(id)a3
{
}

- (unint64_t)reply
{
  return 0;
}

- (BOOL)isValid
{
  v2 = [(GEOConfigAddChangeListenerRequest *)self keysAndSources];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSDictionary)keysAndSources
{
  return self->_keysAndSources;
}

- (GEOConfigAddChangeListenerRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"defaults.addChangeListenerFor" traits:a3 auditToken:a4 throttleToken:a5];
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOConfigAddChangeListenerRequest;
  [(GEOXPCRequest *)&v10 encodeToXPCDictionary:v4];
  if ([(NSDictionary *)self->_keysAndSources count])
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    keysAndSources = self->_keysAndSources;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__GEOConfigAddChangeListenerRequest_encodeToXPCDictionary___block_invoke;
    v8[3] = &unk_1E53E0928;
    id v7 = v5;
    id v9 = v7;
    [(NSDictionary *)keysAndSources enumerateKeysAndObjectsUsingBlock:v8];
    if (xpc_dictionary_get_count(v7)) {
      xpc_dictionary_set_value(v4, "kands", v7);
    }
  }
}

- (GEOConfigAddChangeListenerRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOConfigAddChangeListenerRequest;
  id v7 = [(GEOXPCRequest *)&v18 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    id v8 = xpc_dictionary_get_dictionary(v6, "kands");
    size_t count = xpc_dictionary_get_count(v8);
    if (count)
    {
      objc_super v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:count];
      applier[0] = MEMORY[0x1E4F143A8];
      applier[1] = 3221225472;
      applier[2] = __65__GEOConfigAddChangeListenerRequest_initWithXPCDictionary_error___block_invoke;
      applier[3] = &unk_1E53E9A78;
      id v11 = v10;
      id v17 = v11;
      xpc_dictionary_apply(v8, applier);
      uint64_t v12 = [v11 count];
      if (v12) {
        v13 = (void *)[v11 copy];
      }
      else {
        v13 = (void *)MEMORY[0x1E4F1CC08];
      }
      objc_storeStrong((id *)&v7->_keysAndSources, v13);
      if (v12) {
    }
      }
    v14 = v7;
  }

  return v7;
}

+ (Class)replyClass
{
  return 0;
}

@end