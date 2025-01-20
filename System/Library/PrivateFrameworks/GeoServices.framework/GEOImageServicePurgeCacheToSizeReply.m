@interface GEOImageServicePurgeCacheToSizeReply
- (BOOL)isValid;
- (GEOImageServicePurgeCacheToSizeReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)amountDeleted;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setAmountDeleted:(unint64_t)a3;
@end

@implementation GEOImageServicePurgeCacheToSizeReply

- (GEOImageServicePurgeCacheToSizeReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOImageServicePurgeCacheToSizeReply;
  v7 = [(GEOXPCReply *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_amountDeleted = xpc_dictionary_get_int64(v6, "amountDeleted");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOImageServicePurgeCacheToSizeReply;
  id v4 = a3;
  [(GEOXPCReply *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "amountDeleted", self->_amountDeleted);
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)amountDeleted
{
  return self->_amountDeleted;
}

- (void)setAmountDeleted:(unint64_t)a3
{
  self->_amountDeleted = a3;
}

@end