@interface GEOOfflineServiceOfflineStateChanged
+ (id)messageName;
- ($BD055F43A5DF7FBAA8066526AB28D3ED)currentState;
- ($BD055F43A5DF7FBAA8066526AB28D3ED)savedState;
- (BOOL)isValid;
- (GEOOfflineServiceOfflineStateChanged)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setCurrentState:(id)a3;
- (void)setSavedState:(id)a3;
@end

@implementation GEOOfflineServiceOfflineStateChanged

+ (id)messageName
{
  return @"OfflineStateChanged";
}

- (GEOOfflineServiceOfflineStateChanged)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOOfflineServiceOfflineStateChanged;
  v7 = [(GEOXPCMessage *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_savedState.raw = xpc_dictionary_get_int64(v6, "savedState");
    v7->_currentState.raw = xpc_dictionary_get_int64(v6, "currentState");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOOfflineServiceOfflineStateChanged;
  id v4 = a3;
  [(GEOXPCMessage *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "savedState", self->_savedState.raw);
  xpc_dictionary_set_int64(v4, "currentState", self->_currentState.raw);
}

- (BOOL)isValid
{
  return 1;
}

- ($BD055F43A5DF7FBAA8066526AB28D3ED)savedState
{
  return ($BD055F43A5DF7FBAA8066526AB28D3ED)self->_savedState.raw;
}

- (void)setSavedState:(id)a3
{
  self->_savedState.raw = a3.var0;
}

- ($BD055F43A5DF7FBAA8066526AB28D3ED)currentState
{
  return ($BD055F43A5DF7FBAA8066526AB28D3ED)self->_currentState.raw;
}

- (void)setCurrentState:(id)a3
{
  self->_currentState.raw = a3.var0;
}

@end