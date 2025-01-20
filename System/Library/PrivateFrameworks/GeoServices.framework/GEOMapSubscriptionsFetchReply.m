@interface GEOMapSubscriptionsFetchReply
- (BOOL)isValid;
- (GEOMapSubscriptionsFetchReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSArray)subscriptions;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setSubscriptions:(id)a3;
@end

@implementation GEOMapSubscriptionsFetchReply

- (BOOL)isValid
{
  return 1;
}

- (GEOMapSubscriptionsFetchReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOMapSubscriptionsFetchReply;
  v7 = [(GEOXPCReply *)&v19 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v6, "subscriptions", &length);
    if (data)
    {
      v9 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
      v10 = (void *)MEMORY[0x1E4F28DC0];
      v11 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v12 = objc_opt_class();
      v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
      uint64_t v14 = [v10 unarchivedObjectOfClasses:v13 fromData:v9 error:a4];
      subscriptions = v7->_subscriptions;
      v7->_subscriptions = (NSArray *)v14;
    }
    v16 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GEOMapSubscriptionsFetchReply;
  [(GEOXPCReply *)&v6 encodeToXPCDictionary:v4];
  if ([(NSArray *)self->_subscriptions count])
  {
    id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_subscriptions requiringSecureCoding:1 error:0];
    xpc_dictionary_set_data(v4, "subscriptions", (const void *)[v5 bytes], objc_msgSend(v5, "length"));
  }
}

- (void).cxx_destruct
{
}

- (void)setSubscriptions:(id)a3
{
}

- (NSArray)subscriptions
{
  return self->_subscriptions;
}

@end