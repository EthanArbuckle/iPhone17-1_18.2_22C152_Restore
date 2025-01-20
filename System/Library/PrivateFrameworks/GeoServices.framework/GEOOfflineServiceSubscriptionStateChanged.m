@interface GEOOfflineServiceSubscriptionStateChanged
+ (id)messageName;
- (BOOL)isSubscribed;
- (BOOL)isValid;
- (GEOOfflineServiceSubscriptionStateChanged)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)currentState;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setCurrentState:(unint64_t)a3;
- (void)setIsSubscribed:(BOOL)a3;
@end

@implementation GEOOfflineServiceSubscriptionStateChanged

+ (id)messageName
{
  return @"OfflineServiceDisconnected";
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)isSubscribed
{
  return self->_isSubscribed;
}

- (GEOOfflineServiceSubscriptionStateChanged)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOOfflineServiceSubscriptionStateChanged;
  v7 = [(GEOXPCMessage *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_isSubscribed = xpc_dictionary_get_BOOL(v6, "isSubscribed");
    v7->_currentState = xpc_dictionary_get_int64(v6, "currentState");
    v8 = v7;
  }

  return v7;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setIsSubscribed:(BOOL)a3
{
  self->_isSubscribed = a3;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOOfflineServiceSubscriptionStateChanged;
  id v4 = a3;
  [(GEOXPCMessage *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_BOOL(v4, "isSubscribed", self->_isSubscribed);
  xpc_dictionary_set_int64(v4, "currentState", self->_currentState);
}

@end