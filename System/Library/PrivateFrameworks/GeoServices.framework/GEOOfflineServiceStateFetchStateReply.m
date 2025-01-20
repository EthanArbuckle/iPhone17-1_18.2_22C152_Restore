@interface GEOOfflineServiceStateFetchStateReply
- ($BD055F43A5DF7FBAA8066526AB28D3ED)currentState;
- ($BD055F43A5DF7FBAA8066526AB28D3ED)savedState;
- (BOOL)isValid;
- (GEOOfflineServiceStateFetchStateReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)currentSuggestedState;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setCurrentState:(id)a3;
- (void)setCurrentSuggestedState:(unint64_t)a3;
- (void)setSavedState:(id)a3;
@end

@implementation GEOOfflineServiceStateFetchStateReply

- (BOOL)isValid
{
  return 1;
}

- (GEOOfflineServiceStateFetchStateReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOOfflineServiceStateFetchStateReply;
  v7 = [(GEOXPCReply *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_savedState.raw = xpc_dictionary_get_int64(v6, "savedState");
    v7->_currentState.raw = xpc_dictionary_get_int64(v6, "currentState");
    v7->_currentSuggestedState = xpc_dictionary_get_int64(v6, "currentSuggestedState");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOOfflineServiceStateFetchStateReply;
  id v4 = a3;
  [(GEOXPCReply *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "savedState", self->_savedState.raw);
  xpc_dictionary_set_int64(v4, "currentState", self->_currentState.raw);
  xpc_dictionary_set_int64(v4, "currentSuggestedState", self->_currentSuggestedState);
}

- ($BD055F43A5DF7FBAA8066526AB28D3ED)savedState
{
  return ($BD055F43A5DF7FBAA8066526AB28D3ED)self->_savedState.raw;
}

- ($BD055F43A5DF7FBAA8066526AB28D3ED)currentState
{
  return ($BD055F43A5DF7FBAA8066526AB28D3ED)self->_currentState.raw;
}

- (void)setSavedState:(id)a3
{
  self->_savedState.raw = a3.var0;
}

- (void)setCurrentSuggestedState:(unint64_t)a3
{
  self->_currentSuggestedState = a3;
}

- (void)setCurrentState:(id)a3
{
  self->_currentState.raw = a3.var0;
}

- (unint64_t)currentSuggestedState
{
  return self->_currentSuggestedState;
}

@end