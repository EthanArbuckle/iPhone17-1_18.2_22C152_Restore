@interface GEOTileEnumeration
- (BOOL)current;
- (GEOTileData)data;
- (GEOTileEnumeration)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSData)key;
- (NSString)eTag;
- (double)age;
- (unsigned)originalLoadReason;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setAge:(double)a3;
- (void)setCurrent:(BOOL)a3;
- (void)setData:(id)a3;
- (void)setETag:(id)a3;
- (void)setKey:(id)a3;
- (void)setOriginalLoadReason:(unsigned __int8)a3;
@end

@implementation GEOTileEnumeration

- (GEOTileEnumeration)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOTileEnumeration;
  v7 = [(GEOTileEnumeration *)&v20 init];
  if (v7)
  {
    v8 = xpc_dictionary_get_dictionary(v6, "data");
    if (v8)
    {
      v9 = [[GEOTileData alloc] initWithXPCDictionary:v8 error:a4];
      if (v9) {
        objc_storeStrong((id *)&v7->_data, v9);
      }
    }
    size_t length = 0;
    data = xpc_dictionary_get_data(v6, "key", &length);
    if (data)
    {
      v11 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
      uint64_t v12 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:a4];
      key = v7->_key;
      v7->_key = (NSData *)v12;
    }
    v7->_current = xpc_dictionary_get_BOOL(v6, "current");
    string = xpc_dictionary_get_string(v6, "eTag");
    if (string)
    {
      uint64_t v15 = [NSString stringWithUTF8String:string];
      eTag = v7->_eTag;
      v7->_eTag = (NSString *)v15;
    }
    v7->_originalLoadReason = xpc_dictionary_get_int64(v6, "originalLoadReason");
    v7->_age = xpc_dictionary_get_double(v6, "age");
    v17 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  if (self->_data)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    [(GEOTileData *)self->_data encodeToXPCDictionary:empty];
    xpc_dictionary_set_value(xdict, "data", empty);
  }
  key = self->_key;
  if (key)
  {
    id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:key requiringSecureCoding:1 error:0];
    xpc_dictionary_set_data(xdict, "key", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
  xpc_dictionary_set_BOOL(xdict, "current", self->_current);
  eTag = self->_eTag;
  if (eTag)
  {
    v8 = [(NSString *)eTag UTF8String];
    if (v8) {
      xpc_dictionary_set_string(xdict, "eTag", v8);
    }
  }
  xpc_dictionary_set_int64(xdict, "originalLoadReason", self->_originalLoadReason);
  xpc_dictionary_set_double(xdict, "age", self->_age);
}

- (GEOTileData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (BOOL)current
{
  return self->_current;
}

- (void)setCurrent:(BOOL)a3
{
  self->_current = a3;
}

- (NSString)eTag
{
  return self->_eTag;
}

- (void)setETag:(id)a3
{
}

- (unsigned)originalLoadReason
{
  return self->_originalLoadReason;
}

- (void)setOriginalLoadReason:(unsigned __int8)a3
{
  self->_originalLoadReason = a3;
}

- (double)age
{
  return self->_age;
}

- (void)setAge:(double)a3
{
  self->_age = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eTag, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end