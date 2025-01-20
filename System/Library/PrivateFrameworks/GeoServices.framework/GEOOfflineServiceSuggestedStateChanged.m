@interface GEOOfflineServiceSuggestedStateChanged
+ (id)messageName;
- (BOOL)isValid;
- (GEOOfflineServiceSuggestedStateChanged)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)currentState;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setCurrentState:(unint64_t)a3;
@end

@implementation GEOOfflineServiceSuggestedStateChanged

+ (id)messageName
{
  return @"OfflineSuggestionChanged";
}

- (GEOOfflineServiceSuggestedStateChanged)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOOfflineServiceSuggestedStateChanged;
  v7 = [(GEOXPCMessage *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_currentState = xpc_dictionary_get_int64(v6, "currentState");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOOfflineServiceSuggestedStateChanged;
  id v4 = a3;
  [(GEOXPCMessage *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "currentState", self->_currentState);
}

- (BOOL)isValid
{
  return [(GEOOfflineServiceSuggestedStateChanged *)self currentState] != 0;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

@end