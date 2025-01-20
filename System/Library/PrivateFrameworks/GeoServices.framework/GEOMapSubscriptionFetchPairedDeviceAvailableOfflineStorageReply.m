@interface GEOMapSubscriptionFetchPairedDeviceAvailableOfflineStorageReply
- (BOOL)isValid;
- (GEOMapSubscriptionFetchPairedDeviceAvailableOfflineStorageReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (int64_t)availableBytes;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setAvailableBytes:(int64_t)a3;
@end

@implementation GEOMapSubscriptionFetchPairedDeviceAvailableOfflineStorageReply

- (GEOMapSubscriptionFetchPairedDeviceAvailableOfflineStorageReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapSubscriptionFetchPairedDeviceAvailableOfflineStorageReply;
  v7 = [(GEOXPCReply *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_availableBytes = xpc_dictionary_get_int64(v6, "availableBytes");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOMapSubscriptionFetchPairedDeviceAvailableOfflineStorageReply;
  id v4 = a3;
  [(GEOXPCReply *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "availableBytes", self->_availableBytes);
}

- (BOOL)isValid
{
  return 1;
}

- (int64_t)availableBytes
{
  return self->_availableBytes;
}

- (void)setAvailableBytes:(int64_t)a3
{
  self->_availableBytes = a3;
}

@end