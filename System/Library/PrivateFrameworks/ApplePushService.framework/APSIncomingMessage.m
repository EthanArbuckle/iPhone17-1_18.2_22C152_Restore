@interface APSIncomingMessage
- (BOOL)isTracingEnabled;
- (BOOL)wasFromStorage;
- (BOOL)wasLastMessageFromStorage;
- (NSData)perAppToken;
- (NSData)token;
- (NSData)tracingUUID;
- (NSDate)expirationDate;
- (NSDate)timestamp;
- (NSString)channelID;
- (int64_t)incomingInterface;
- (int64_t)priority;
- (unint64_t)pushType;
- (unsigned)pushFlags;
- (void)setChannelID:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFromStorage:(BOOL)a3;
- (void)setIncomingInterface:(int64_t)a3;
- (void)setLastMessageFromStorage:(BOOL)a3;
- (void)setPerAppToken:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setPushFlags:(unsigned int)a3;
- (void)setPushType:(unint64_t)a3;
- (void)setTimestamp:(id)a3;
- (void)setToken:(id)a3;
- (void)setTracingEnabled:(BOOL)a3;
- (void)setTracingUUID:(id)a3;
@end

@implementation APSIncomingMessage

- (NSDate)timestamp
{
  return (NSDate *)[(APSIncomingMessage *)self objectForKey:@"APSIncomingMessageTimestamp"];
}

- (void)setTimestamp:(id)a3
{
}

- (NSDate)expirationDate
{
  return (NSDate *)[(APSIncomingMessage *)self objectForKey:@"APSIncomingMessageExpirationDateKey"];
}

- (void)setExpirationDate:(id)a3
{
}

- (NSData)token
{
  return (NSData *)[(APSIncomingMessage *)self objectForKey:@"APSIncomingMessageToken"];
}

- (void)setToken:(id)a3
{
}

- (NSData)perAppToken
{
  return (NSData *)[(APSIncomingMessage *)self objectForKey:@"APSIncomingMessagePerAppToken"];
}

- (void)setPerAppToken:(id)a3
{
}

- (BOOL)wasFromStorage
{
  v2 = [(APSIncomingMessage *)self objectForKey:@"APSIncomingMessageFromStorage"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setFromStorage:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(APSIncomingMessage *)self setObject:v4 forKey:@"APSIncomingMessageFromStorage"];
}

- (BOOL)wasLastMessageFromStorage
{
  v2 = [(APSIncomingMessage *)self objectForKey:@"APSIncomingMessageLastMessageFromStorage"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setLastMessageFromStorage:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(APSIncomingMessage *)self setObject:v4 forKey:@"APSIncomingMessageLastMessageFromStorage"];
}

- (void)setPriority:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  [(APSIncomingMessage *)self setObject:v4 forKey:@"APSProtocolMessagePriority"];
}

- (int64_t)priority
{
  v2 = [(APSIncomingMessage *)self objectForKey:@"APSProtocolMessagePriority"];
  unsigned __int8 v3 = v2;
  if (v2 && (uint64_t)[v2 integerValue] <= 9)
  {
    if ((uint64_t)[v3 integerValue] < 5) {
      int64_t v4 = 1;
    }
    else {
      int64_t v4 = 5;
    }
  }
  else
  {
    int64_t v4 = 10;
  }

  return v4;
}

- (void)setTracingEnabled:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(APSIncomingMessage *)self setObject:v4 forKey:@"APSIncomingMessageTracingEnabled"];
}

- (BOOL)isTracingEnabled
{
  v2 = [(APSIncomingMessage *)self objectForKey:@"APSIncomingMessageTracingEnabled"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setTracingUUID:(id)a3
{
}

- (NSData)tracingUUID
{
  return (NSData *)[(APSIncomingMessage *)self objectForKey:@"APSIncomingMessageTracingUUID"];
}

- (unint64_t)pushType
{
  v2 = [(APSIncomingMessage *)self objectForKey:@"APSIncomingMessagePushType"];
  unint64_t v3 = [v2 unsignedShortValue];

  return v3;
}

- (void)setPushType:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)a3];
  [(APSIncomingMessage *)self setObject:v4 forKey:@"APSIncomingMessagePushType"];
}

- (void)setPushFlags:(unsigned int)a3
{
  id v4 = +[NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(APSIncomingMessage *)self setObject:v4 forKey:@"APSIncomingMessagePushFlags"];
}

- (unsigned)pushFlags
{
  v2 = [(APSIncomingMessage *)self objectForKey:@"APSIncomingMessagePushFlags"];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (void)setChannelID:(id)a3
{
}

- (NSString)channelID
{
  return (NSString *)[(APSIncomingMessage *)self objectForKey:@"APSIncomingMessageChannelID"];
}

- (void)setIncomingInterface:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  [(APSIncomingMessage *)self setObject:v4 forKey:@"APSIncomingMessageIncomingInterfaceKey"];
}

- (int64_t)incomingInterface
{
  unsigned int v3 = (void *)xpc_copy_entitlements_for_self();
  id v4 = v3;
  if (v3 && xpc_dictionary_get_BOOL(v3, "com.apple.aps.incoming-message-interface"))
  {
    v5 = [(APSIncomingMessage *)self objectForKey:@"APSIncomingMessageIncomingInterfaceKey"];
    id v6 = [v5 integerValue];
  }
  else
  {
    id v6 = 0;
  }

  return (int64_t)v6;
}

@end