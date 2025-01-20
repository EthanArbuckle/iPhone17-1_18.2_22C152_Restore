@interface GEOConfigKeyChangeNotification
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOConfigKeyChangeNotification)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOConfigKeyChangeNotification)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSArray)keyStrings;
- (unint64_t)keyOptions;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setKeyOptions:(unint64_t)a3;
- (void)setKeyStrings:(id)a3;
@end

@implementation GEOConfigKeyChangeNotification

- (void).cxx_destruct
{
}

- (void)setKeyOptions:(unint64_t)a3
{
  self->_keyOptions = a3;
}

- (void)setKeyStrings:(id)a3
{
}

- (GEOConfigKeyChangeNotification)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"defaults.keysChanged" traits:a3 auditToken:a4 throttleToken:a5];
}

- (unint64_t)reply
{
  return 0;
}

- (void)encodeToXPCDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOConfigKeyChangeNotification;
  [(GEOXPCRequest *)&v17 encodeToXPCDictionary:v4];
  if ([(NSArray *)self->_keyStrings count])
  {
    xpc_object_t v5 = xpc_array_create(0, 0);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self->_keyStrings;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(id *)(*((void *)&v13 + 1) + 8 * v10);
          v12 = (const char *)objc_msgSend(v11, "UTF8String", (void)v13);
          if (v12) {
            xpc_array_set_string(v5, 0xFFFFFFFFFFFFFFFFLL, v12);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v8);
    }

    if (xpc_array_get_count(v5)) {
      xpc_dictionary_set_value(v4, "keys", v5);
    }
  }
  xpc_dictionary_set_int64(v4, "options", self->_keyOptions);
}

- (BOOL)isValid
{
  v3 = [(GEOConfigKeyChangeNotification *)self keyStrings];
  if ([v3 count]) {
    BOOL v4 = [(GEOConfigKeyChangeNotification *)self keyOptions] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (NSArray)keyStrings
{
  return self->_keyStrings;
}

- (unint64_t)keyOptions
{
  return self->_keyOptions;
}

- (GEOConfigKeyChangeNotification)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOConfigKeyChangeNotification;
  uint64_t v7 = [(GEOXPCRequest *)&v18 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    uint64_t v8 = xpc_dictionary_get_array(v6, "keys");
    size_t count = xpc_array_get_count(v8);
    uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:count];
    if (count)
    {
      for (size_t i = 0; i != count; ++i)
      {
        string = xpc_array_get_string(v8, i);
        if (string)
        {
          long long v13 = [NSString stringWithUTF8String:string];
          [v10 addObject:v13];
        }
      }
    }
    uint64_t v14 = [v10 count];
    if (v14) {
      long long v15 = (void *)[v10 copy];
    }
    else {
      long long v15 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v7->_keyStrings, v15);
    if (v14) {

    }
    v7->_keyOptions = xpc_dictionary_get_int64(v6, "options");
    long long v16 = v7;
  }

  return v7;
}

+ (Class)replyClass
{
  return 0;
}

@end