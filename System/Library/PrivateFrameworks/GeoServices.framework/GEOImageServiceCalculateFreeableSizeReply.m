@interface GEOImageServiceCalculateFreeableSizeReply
- (BOOL)isValid;
- (GEOImageServiceCalculateFreeableSizeReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)size;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation GEOImageServiceCalculateFreeableSizeReply

- (GEOImageServiceCalculateFreeableSizeReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOImageServiceCalculateFreeableSizeReply;
  v7 = [(GEOXPCReply *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_size = xpc_dictionary_get_int64(v6, "size");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOImageServiceCalculateFreeableSizeReply;
  id v4 = a3;
  [(GEOXPCReply *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "size", self->_size);
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

@end