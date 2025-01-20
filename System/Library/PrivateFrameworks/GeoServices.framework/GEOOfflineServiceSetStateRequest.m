@interface GEOOfflineServiceSetStateRequest
+ (Class)replyClass;
- ($BD055F43A5DF7FBAA8066526AB28D3ED)savedState;
- ($BD055F43A5DF7FBAA8066526AB28D3ED)state;
- (BOOL)isValid;
- (GEOOfflineServiceSetStateRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOOfflineServiceSetStateRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setSavedState:(id)a3;
- (void)setState:(id)a3;
@end

@implementation GEOOfflineServiceSetStateRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOOfflineServiceSetStateRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"offlinestate.setState" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOOfflineServiceSetStateRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOOfflineServiceSetStateRequest;
  v7 = [(GEOXPCRequest *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_state.raw = xpc_dictionary_get_int64(v6, "state");
    v7->_savedState.raw = xpc_dictionary_get_int64(v6, "savedState");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOOfflineServiceSetStateRequest;
  id v4 = a3;
  [(GEOXPCRequest *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "state", self->_state.raw);
  xpc_dictionary_set_int64(v4, "savedState", self->_savedState.raw);
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- ($BD055F43A5DF7FBAA8066526AB28D3ED)state
{
  return ($BD055F43A5DF7FBAA8066526AB28D3ED)self->_state.raw;
}

- (void)setState:(id)a3
{
  self->_state.raw = a3.var0;
}

- ($BD055F43A5DF7FBAA8066526AB28D3ED)savedState
{
  return ($BD055F43A5DF7FBAA8066526AB28D3ED)self->_savedState.raw;
}

- (void)setSavedState:(id)a3
{
  self->_savedState.raw = a3.var0;
}

@end