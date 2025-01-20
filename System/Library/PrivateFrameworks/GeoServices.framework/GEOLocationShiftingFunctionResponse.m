@interface GEOLocationShiftingFunctionResponse
- (BOOL)isValid;
- (GEOLocationShiftFunctionResponse)function;
- (GEOLocationShiftingFunctionResponse)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setFunction:(id)a3;
@end

@implementation GEOLocationShiftingFunctionResponse

- (GEOLocationShiftingFunctionResponse)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOLocationShiftingFunctionResponse;
  v7 = [(GEOXPCReply *)&v15 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v6, "function", &length);
    if (data)
    {
      v9 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
      uint64_t v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:a4];
      function = v7->_function;
      v7->_function = (GEOLocationShiftFunctionResponse *)v10;
    }
    v12 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOLocationShiftingFunctionResponse;
  [(GEOXPCReply *)&v7 encodeToXPCDictionary:v4];
  function = self->_function;
  if (function)
  {
    id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:function requiringSecureCoding:1 error:0];
    xpc_dictionary_set_data(v4, "function", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
}

- (BOOL)isValid
{
  return 1;
}

- (GEOLocationShiftFunctionResponse)function
{
  return self->_function;
}

- (void)setFunction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end