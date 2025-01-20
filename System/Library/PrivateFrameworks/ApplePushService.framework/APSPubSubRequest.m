@interface APSPubSubRequest
- (APSPubSubRequest)initWithMetadata:(id)a3 messageID:(id)a4 userName:(id)a5 token:(id)a6 subscriptionType:(int)a7 connectionType:(int64_t)a8 retryCount:(unint64_t)a9;
- (APSPubSubRequest)initWithSubscriptionChannels:(id)a3 unsubscriptionChannels:(id)a4 messageID:(id)a5 userName:(id)a6 token:(id)a7 subscriptionType:(int)a8 connectionType:(int64_t)a9 retryCount:(unint64_t)a10;
- (BOOL)isEqual:(id)a3;
- (NSArray)subscriptionChannels;
- (NSArray)unsubscriptionChannels;
- (NSData)metadata;
- (NSData)token;
- (NSNumber)messageID;
- (NSString)userName;
- (OS_dispatch_source)timeoutSource;
- (id)description;
- (int)subscriptionType;
- (int64_t)connectionType;
- (unint64_t)retryCount;
- (void)setConnectionType:(int64_t)a3;
- (void)setMessageID:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setSubscriptionType:(int)a3;
- (void)setTimeoutSource:(id)a3;
- (void)setToken:(id)a3;
- (void)setUserName:(id)a3;
@end

@implementation APSPubSubRequest

- (APSPubSubRequest)initWithSubscriptionChannels:(id)a3 unsubscriptionChannels:(id)a4 messageID:(id)a5 userName:(id)a6 token:(id)a7 subscriptionType:(int)a8 connectionType:(int64_t)a9 retryCount:(unint64_t)a10
{
  id v17 = a3;
  id v18 = a4;
  id v24 = a5;
  id v23 = a6;
  id v19 = a7;
  v25.receiver = self;
  v25.super_class = (Class)APSPubSubRequest;
  v20 = [(APSPubSubRequest *)&v25 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_subscriptionChannels, a3);
    objc_storeStrong((id *)&v21->_unsubscriptionChannels, a4);
    objc_storeStrong((id *)&v21->_messageID, a5);
    objc_storeStrong((id *)&v21->_userName, a6);
    objc_storeStrong((id *)&v21->_token, a7);
    v21->_subscriptionType = a8;
    v21->_connectionType = a9;
    v21->_retryCount = a10;
  }

  return v21;
}

- (APSPubSubRequest)initWithMetadata:(id)a3 messageID:(id)a4 userName:(id)a5 token:(id)a6 subscriptionType:(int)a7 connectionType:(int64_t)a8 retryCount:(unint64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v22 = a5;
  id v18 = a6;
  v23.receiver = self;
  v23.super_class = (Class)APSPubSubRequest;
  id v19 = [(APSPubSubRequest *)&v23 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_metadata, a3);
    objc_storeStrong((id *)&v20->_messageID, a4);
    objc_storeStrong((id *)&v20->_userName, a5);
    objc_storeStrong((id *)&v20->_token, a6);
    v20->_subscriptionType = a7;
    v20->_connectionType = a8;
    v20->_retryCount = a9;
  }

  return v20;
}

- (id)description
{
  v3 = [(APSPubSubRequest *)self messageID];
  v4 = +[NSString stringWithFormat:@"<APSPubsubRequest %p: %@>", self, v3];

  return v4;
}

- (NSData)metadata
{
  metadata = self->_metadata;
  if (metadata)
  {
    v3 = metadata;
    goto LABEL_9;
  }
  v5 = [(APSPubSubRequest *)self subscriptionChannels];
  if ([v5 count])
  {
  }
  else
  {
    v6 = [(APSPubSubRequest *)self unsubscriptionChannels];
    id v7 = [v6 count];

    if (!v7)
    {
      v3 = 0;
      goto LABEL_9;
    }
  }
  v8 = +[APSLog courierOversized];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = sub_100006494([(APSPubSubRequest *)self connectionType]);
    v10 = [(APSPubSubRequest *)self subscriptionChannels];
    v11 = [(APSPubSubRequest *)self unsubscriptionChannels];
    int v16 = 138413058;
    id v17 = self;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    v21 = v10;
    __int16 v22 = 2112;
    objc_super v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending pubsub request %@ on interface %@ with subscription channels: %@ unsubscription channels: %@", (uint8_t *)&v16, 0x2Au);
  }
  v12 = [(APSPubSubRequest *)self subscriptionChannels];
  v13 = [(APSPubSubRequest *)self unsubscriptionChannels];
  v14 = +[PSChannelSubscriptionsRequestPayload createPayloadForSubscriptionChannels:v12 unsubscriptionChannels:v13 subscriptionType:[(APSPubSubRequest *)self subscriptionType]];
  v3 = [v14 data];

LABEL_9:
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 messageID];
    id v7 = [(APSPubSubRequest *)self messageID];
    if (v6 == v7)
    {
      v9 = [v5 subscriptionChannels];
      v10 = [(APSPubSubRequest *)self subscriptionChannels];
      if ([v9 isEqual:v10])
      {
        v11 = [v5 unsubscriptionChannels];
        v12 = [(APSPubSubRequest *)self unsubscriptionChannels];
        unsigned __int8 v8 = [v11 isEqual:v12];
      }
      else
      {
        unsigned __int8 v8 = 0;
      }
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (NSArray)subscriptionChannels
{
  return self->_subscriptionChannels;
}

- (NSArray)unsubscriptionChannels
{
  return self->_unsubscriptionChannels;
}

- (NSNumber)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setUserName:(id)a3
{
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (int)subscriptionType
{
  return self->_subscriptionType;
}

- (void)setSubscriptionType:(int)a3
{
  self->_subscriptionType = a3;
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (void)setConnectionType:(int64_t)a3
{
  self->_connectionType = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (void)setMetadata:(id)a3
{
}

- (OS_dispatch_source)timeoutSource
{
  return self->_timeoutSource;
}

- (void)setTimeoutSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutSource, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_unsubscriptionChannels, 0);
  objc_storeStrong((id *)&self->_subscriptionChannels, 0);
}

@end