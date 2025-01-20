@interface GEOMapSubscriptionStateReply
- (BOOL)isValid;
- (GEOMapDataSubscriptionState)state;
- (GEOMapSubscriptionStateReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setState:(id)a3;
@end

@implementation GEOMapSubscriptionStateReply

- (GEOMapSubscriptionStateReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOMapSubscriptionStateReply;
  v7 = [(GEOXPCReply *)&v12 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v8 = xpc_dictionary_get_dictionary(v6, "state");
    if (v8)
    {
      v9 = [[GEOMapDataSubscriptionState alloc] initWithXPCDictionary:v8 error:a4];
      if (v9) {
        objc_storeStrong((id *)&v7->_state, v9);
      }
    }
    v10 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GEOMapSubscriptionStateReply;
  [(GEOXPCReply *)&v6 encodeToXPCDictionary:v4];
  if (self->_state)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    [(GEOMapDataSubscriptionState *)self->_state encodeToXPCDictionary:empty];
    xpc_dictionary_set_value(v4, "state", empty);
  }
}

- (BOOL)isValid
{
  return 1;
}

- (GEOMapDataSubscriptionState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end