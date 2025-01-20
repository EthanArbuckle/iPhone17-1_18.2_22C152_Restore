@interface BMDistributedContextContextChangedMessage
- (BMDistributedContextContextChangedMessage)initWithMessageDictionary:(id)a3;
- (BMDistributedContextContextChangedMessage)initWithSubscriptionIdentifier:(id)a3 translatedEvent:(id)a4 messageIntent:(unint64_t)a5;
- (BMDistributedContextTranslatedEventMessage)translatedEvent;
- (NSNumber)protocolVersion;
- (NSString)messageVersion;
- (NSString)subscriptionIdentifier;
- (id)dictionaryRepresentation;
- (unint64_t)messageIntent;
- (void)setMessageIntent:(unint64_t)a3;
- (void)setMessageVersion:(id)a3;
- (void)setProtocolVersion:(id)a3;
- (void)setSubscriptionIdentifier:(id)a3;
- (void)setTranslatedEvent:(id)a3;
@end

@implementation BMDistributedContextContextChangedMessage

- (BMDistributedContextContextChangedMessage)initWithSubscriptionIdentifier:(id)a3 translatedEvent:(id)a4 messageIntent:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMDistributedContextContextChangedMessage;
  v11 = [(BMDistributedContextContextChangedMessage *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_subscriptionIdentifier, a3);
    objc_storeStrong((id *)&v12->_translatedEvent, a4);
    v12->_messageIntent = a5;
  }

  return v12;
}

- (id)dictionaryRepresentation
{
  v10[7] = *MEMORY[0x263EF8340];
  v9[0] = @"type";
  v9[1] = @"messageVersion";
  v10[0] = @"context";
  v10[1] = @"1.0";
  v10[2] = &unk_26D209C08;
  v9[2] = @"version";
  v9[3] = @"streamIdentifier";
  v3 = [(BMDistributedContextTranslatedEventMessage *)self->_translatedEvent streamIdentifier];
  v10[3] = v3;
  v9[4] = @"event";
  v4 = [(BMDistributedContextTranslatedEventMessage *)self->_translatedEvent eventData];
  v10[4] = v4;
  v9[5] = @"dataVersion";
  v5 = [(BMDistributedContextTranslatedEventMessage *)self->_translatedEvent eventDataVersion];
  v9[6] = @"identifier";
  subscriptionIdentifier = self->_subscriptionIdentifier;
  v10[5] = v5;
  v10[6] = subscriptionIdentifier;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:7];

  return v7;
}

- (BMDistributedContextContextChangedMessage)initWithMessageDictionary:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BMDistributedContextContextChangedMessage;
  v5 = [(BMDistributedContextContextChangedMessage *)&v27 init];
  if (!v5) {
    goto LABEL_10;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"messageVersion"];
  if (v6)
  {
    v7 = (void *)v6;
    uint64_t v8 = [v4 objectForKeyedSubscript:@"messageVersion"];
    if (v8)
    {
      id v9 = (void *)v8;
      id v10 = [v4 objectForKeyedSubscript:@"messageVersion"];
      char v11 = [v10 isEqualToString:@"1.0"];

      if ((v11 & 1) == 0) {
        goto LABEL_5;
      }
    }
    else
    {
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"identifier"];
    subscriptionIdentifier = v5->_subscriptionIdentifier;
    v5->_subscriptionIdentifier = (NSString *)v14;

    v16 = [BMDistributedContextTranslatedEventMessage alloc];
    v17 = [v4 objectForKeyedSubscript:@"streamIdentifier"];
    v18 = [v4 objectForKeyedSubscript:@"event"];
    v19 = [v4 objectForKeyedSubscript:@"dataVersion"];
    uint64_t v20 = [(BMDistributedContextTranslatedEventMessage *)v16 initWithStreamIdentifier:v17 eventData:v18 eventDataVersion:v19];
    translatedEvent = v5->_translatedEvent;
    v5->_translatedEvent = (BMDistributedContextTranslatedEventMessage *)v20;

    uint64_t v22 = [v4 objectForKeyedSubscript:@"messageVersion"];
    messageVersion = v5->_messageVersion;
    v5->_messageVersion = (NSString *)v22;

    uint64_t v24 = [v4 objectForKeyedSubscript:@"version"];
    protocolVersion = v5->_protocolVersion;
    v5->_protocolVersion = (NSNumber *)v24;

LABEL_10:
    v13 = v5;
    goto LABEL_11;
  }
LABEL_5:
  v12 = __biome_log_for_category();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[BMDistributedContextSubscribeMessage initWithMessageDictionary:fromRemoteDevice:localDevice:](v4);
  }

  v13 = 0;
LABEL_11:

  return v13;
}

- (NSString)subscriptionIdentifier
{
  return self->_subscriptionIdentifier;
}

- (void)setSubscriptionIdentifier:(id)a3
{
}

- (BMDistributedContextTranslatedEventMessage)translatedEvent
{
  return self->_translatedEvent;
}

- (void)setTranslatedEvent:(id)a3
{
}

- (NSString)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(id)a3
{
}

- (NSNumber)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(id)a3
{
}

- (unint64_t)messageIntent
{
  return self->_messageIntent;
}

- (void)setMessageIntent:(unint64_t)a3
{
  self->_messageIntent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_messageVersion, 0);
  objc_storeStrong((id *)&self->_translatedEvent, 0);
  objc_storeStrong((id *)&self->_subscriptionIdentifier, 0);
}

@end