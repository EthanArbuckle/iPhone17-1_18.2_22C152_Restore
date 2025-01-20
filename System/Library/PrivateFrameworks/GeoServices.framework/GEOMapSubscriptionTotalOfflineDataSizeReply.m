@interface GEOMapSubscriptionTotalOfflineDataSizeReply
- (BOOL)isValid;
- (GEOMapSubscriptionTotalOfflineDataSizeReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)sizeInBytes;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setSizeInBytes:(unint64_t)a3;
@end

@implementation GEOMapSubscriptionTotalOfflineDataSizeReply

- (BOOL)isValid
{
  return 1;
}

- (GEOMapSubscriptionTotalOfflineDataSizeReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapSubscriptionTotalOfflineDataSizeReply;
  v7 = [(GEOXPCReply *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_sizeInBytes = xpc_dictionary_get_int64(v6, "sizeInBytes");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOMapSubscriptionTotalOfflineDataSizeReply;
  id v4 = a3;
  [(GEOXPCReply *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "sizeInBytes", self->_sizeInBytes);
}

- (unint64_t)sizeInBytes
{
  return self->_sizeInBytes;
}

- (void)setSizeInBytes:(unint64_t)a3
{
  self->_sizeInBytes = a3;
}

@end