@interface GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryReply
- (BOOL)isValid;
- (GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSData)serializedSummary;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setSerializedSummary:(id)a3;
@end

@implementation GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryReply

- (GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryReply;
  v7 = [(GEOXPCReply *)&v15 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v6, "serializedSummary", &length);
    if (data)
    {
      v9 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
      uint64_t v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:a4];
      serializedSummary = v7->_serializedSummary;
      v7->_serializedSummary = (NSData *)v10;
    }
    v12 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryReply;
  [(GEOXPCReply *)&v7 encodeToXPCDictionary:v4];
  serializedSummary = self->_serializedSummary;
  if (serializedSummary)
  {
    id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:serializedSummary requiringSecureCoding:1 error:0];
    xpc_dictionary_set_data(v4, "serializedSummary", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
}

- (BOOL)isValid
{
  return 1;
}

- (NSData)serializedSummary
{
  return self->_serializedSummary;
}

- (void)setSerializedSummary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end