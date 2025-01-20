@interface GEOMapSubscriptionFetchLastUpdatedDateReply
- (BOOL)isValid;
- (GEOMapSubscriptionFetchLastUpdatedDateReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (double)timestamp;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation GEOMapSubscriptionFetchLastUpdatedDateReply

- (BOOL)isValid
{
  return 1;
}

- (GEOMapSubscriptionFetchLastUpdatedDateReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapSubscriptionFetchLastUpdatedDateReply;
  v7 = [(GEOXPCReply *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_timestamp = xpc_dictionary_get_double(v6, "timestamp");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOMapSubscriptionFetchLastUpdatedDateReply;
  id v4 = a3;
  [(GEOXPCReply *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_double(v4, "timestamp", self->_timestamp);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end