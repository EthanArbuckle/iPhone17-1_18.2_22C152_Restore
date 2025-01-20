@interface GEOMAResourceFetchRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOMAResourceFetchRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOMAResourceFetchRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSDictionary)extras;
- (unint64_t)options;
- (unint64_t)reply;
- (unint64_t)type;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setExtras:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation GEOMAResourceFetchRequest

- (BOOL)isValid
{
  return 1;
}

- (GEOMAResourceFetchRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOMAResourceFetchRequest;
  v7 = [(GEOXPCRequest *)&v18 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_type = xpc_dictionary_get_int64(v6, "type");
    v8 = xpc_dictionary_get_dictionary(v6, "extras");
    size_t count = xpc_dictionary_get_count(v8);
    if (count)
    {
      v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:count];
      applier[0] = MEMORY[0x1E4F143A8];
      applier[1] = 3221225472;
      applier[2] = __57__GEOMAResourceFetchRequest_initWithXPCDictionary_error___block_invoke;
      applier[3] = &unk_1E53E9A78;
      id v11 = v10;
      id v17 = v11;
      xpc_dictionary_apply(v8, applier);
      uint64_t v12 = [v11 count];
      if (v12) {
        v13 = (void *)[v11 copy];
      }
      else {
        v13 = 0;
      }
      objc_storeStrong((id *)&v7->_extras, v13);
      if (v12) {
    }
      }
    v7->_options = xpc_dictionary_get_int64(v6, "options");
    v14 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMAResourceFetchRequest;
  [(GEOXPCRequest *)&v10 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "type", self->_type);
  if ([(NSDictionary *)self->_extras count])
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    extras = self->_extras;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__GEOMAResourceFetchRequest_encodeToXPCDictionary___block_invoke;
    v8[3] = &unk_1E53DFD80;
    id v7 = v5;
    id v9 = v7;
    [(NSDictionary *)extras enumerateKeysAndObjectsUsingBlock:v8];
    if (xpc_dictionary_get_count(v7)) {
      xpc_dictionary_set_value(v4, "extras", v7);
    }
  }
  xpc_dictionary_set_int64(v4, "options", self->_options);
}

- (void).cxx_destruct
{
}

- (unint64_t)reply
{
  return 1;
}

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)type
{
  return self->_type;
}

- (NSDictionary)extras
{
  return self->_extras;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)setExtras:(id)a3
{
}

- (GEOMAResourceFetchRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"MAResources.fetch" traits:a3 auditToken:a4 throttleToken:a5];
}

uint64_t __57__GEOMAResourceFetchRequest_initWithXPCDictionary_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  xpc_object_t v5 = NSString;
  id v6 = a3;
  id v7 = [v5 stringWithUTF8String:a2];
  string_ptr = xpc_string_get_string_ptr(v6);

  if (string_ptr)
  {
    id v9 = [NSString stringWithUTF8String:string_ptr];
    [*(id *)(a1 + 32) setObject:v9 forKey:v7];
  }
  return 1;
}

void __51__GEOMAResourceFetchRequest_encodeToXPCDictionary___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = a3;
  id v7 = (const char *)[v5 UTF8String];
  id v8 = v6;
  id v9 = (const char *)[v8 UTF8String];

  xpc_dictionary_set_string(v4, v7, v9);
}

- (unint64_t)options
{
  return self->_options;
}

@end