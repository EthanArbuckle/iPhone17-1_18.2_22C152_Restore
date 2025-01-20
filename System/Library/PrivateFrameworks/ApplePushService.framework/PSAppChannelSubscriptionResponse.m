@interface PSAppChannelSubscriptionResponse
+ (Class)subscriptionChannelResponseType;
+ (Class)unsubscriptionChannelResponseType;
- (BOOL)hasAppId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)subscriptionChannelResponses;
- (NSMutableArray)unsubscriptionChannelResponses;
- (NSString)appId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)subscriptionChannelResponseAtIndex:(unint64_t)a3;
- (id)unsubscriptionChannelResponseAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)subscriptionChannelResponsesCount;
- (unint64_t)unsubscriptionChannelResponsesCount;
- (void)addSubscriptionChannelResponse:(id)a3;
- (void)addUnsubscriptionChannelResponse:(id)a3;
- (void)clearSubscriptionChannelResponses;
- (void)clearUnsubscriptionChannelResponses;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppId:(id)a3;
- (void)setSubscriptionChannelResponses:(id)a3;
- (void)setUnsubscriptionChannelResponses:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSAppChannelSubscriptionResponse

- (BOOL)hasAppId
{
  return self->_appId != 0;
}

- (void)clearSubscriptionChannelResponses
{
}

- (void)addSubscriptionChannelResponse:(id)a3
{
  id v4 = a3;
  subscriptionChannelResponses = self->_subscriptionChannelResponses;
  id v8 = v4;
  if (!subscriptionChannelResponses)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_subscriptionChannelResponses;
    self->_subscriptionChannelResponses = v6;

    id v4 = v8;
    subscriptionChannelResponses = self->_subscriptionChannelResponses;
  }
  [(NSMutableArray *)subscriptionChannelResponses addObject:v4];
}

- (unint64_t)subscriptionChannelResponsesCount
{
  return (unint64_t)[(NSMutableArray *)self->_subscriptionChannelResponses count];
}

- (id)subscriptionChannelResponseAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_subscriptionChannelResponses objectAtIndex:a3];
}

+ (Class)subscriptionChannelResponseType
{
  return (Class)objc_opt_class();
}

- (void)clearUnsubscriptionChannelResponses
{
}

- (void)addUnsubscriptionChannelResponse:(id)a3
{
  id v4 = a3;
  unsubscriptionChannelResponses = self->_unsubscriptionChannelResponses;
  id v8 = v4;
  if (!unsubscriptionChannelResponses)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_unsubscriptionChannelResponses;
    self->_unsubscriptionChannelResponses = v6;

    id v4 = v8;
    unsubscriptionChannelResponses = self->_unsubscriptionChannelResponses;
  }
  [(NSMutableArray *)unsubscriptionChannelResponses addObject:v4];
}

- (unint64_t)unsubscriptionChannelResponsesCount
{
  return (unint64_t)[(NSMutableArray *)self->_unsubscriptionChannelResponses count];
}

- (id)unsubscriptionChannelResponseAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_unsubscriptionChannelResponses objectAtIndex:a3];
}

+ (Class)unsubscriptionChannelResponseType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PSAppChannelSubscriptionResponse;
  v3 = [(PSAppChannelSubscriptionResponse *)&v7 description];
  id v4 = [(PSAppChannelSubscriptionResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  appId = self->_appId;
  if (appId) {
    [v3 setObject:appId forKey:@"app_id"];
  }
  if ([(NSMutableArray *)self->_subscriptionChannelResponses count])
  {
    id v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_subscriptionChannelResponses, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    objc_super v7 = self->_subscriptionChannelResponses;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v25 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"subscription_channel_response"];
  }
  if ([(NSMutableArray *)self->_unsubscriptionChannelResponses count])
  {
    id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_unsubscriptionChannelResponses, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v14 = self->_unsubscriptionChannelResponses;
    id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)j), "dictionaryRepresentation", (void)v21);
          [v13 addObject:v19];
        }
        id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"unsubscription_channel_response"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100072E04(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_appId) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_subscriptionChannelResponses;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_unsubscriptionChannelResponses;
  v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (self->_appId) {
    objc_msgSend(v12, "setAppId:");
  }
  if ([(PSAppChannelSubscriptionResponse *)self subscriptionChannelResponsesCount])
  {
    [v12 clearSubscriptionChannelResponses];
    unint64_t v4 = [(PSAppChannelSubscriptionResponse *)self subscriptionChannelResponsesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(PSAppChannelSubscriptionResponse *)self subscriptionChannelResponseAtIndex:i];
        [v12 addSubscriptionChannelResponse:v7];
      }
    }
  }
  if ([(PSAppChannelSubscriptionResponse *)self unsubscriptionChannelResponsesCount])
  {
    [v12 clearUnsubscriptionChannelResponses];
    unint64_t v8 = [(PSAppChannelSubscriptionResponse *)self unsubscriptionChannelResponsesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        v11 = [(PSAppChannelSubscriptionResponse *)self unsubscriptionChannelResponseAtIndex:j];
        [v12 addUnsubscriptionChannelResponse:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_appId copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v8 = self->_subscriptionChannelResponses;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)v12) copyWithZone:a3];
        [v5 addSubscriptionChannelResponse:v13];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v14 = self->_unsubscriptionChannelResponses;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      long long v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v18), "copyWithZone:", a3, (void)v21);
        [v5 addUnsubscriptionChannelResponse:v19];

        long long v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((appId = self->_appId, !((unint64_t)appId | v4[1]))
     || -[NSString isEqual:](appId, "isEqual:"))
    && ((subscriptionChannelResponses = self->_subscriptionChannelResponses,
         !((unint64_t)subscriptionChannelResponses | v4[2]))
     || -[NSMutableArray isEqual:](subscriptionChannelResponses, "isEqual:")))
  {
    unsubscriptionChannelResponses = self->_unsubscriptionChannelResponses;
    if ((unint64_t)unsubscriptionChannelResponses | v4[3]) {
      unsigned __int8 v8 = -[NSMutableArray isEqual:](unsubscriptionChannelResponses, "isEqual:");
    }
    else {
      unsigned __int8 v8 = 1;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_appId hash];
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_subscriptionChannelResponses hash] ^ v3;
  return v4 ^ (unint64_t)[(NSMutableArray *)self->_unsubscriptionChannelResponses hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[PSAppChannelSubscriptionResponse setAppId:](self, "setAppId:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 2);
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(PSAppChannelSubscriptionResponse *)self addSubscriptionChannelResponse:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 3);
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[PSAppChannelSubscriptionResponse addUnsubscriptionChannelResponse:](self, "addUnsubscriptionChannelResponse:", *(void *)(*((void *)&v15 + 1) + 8 * (void)j), (void)v15);
      }
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSString)appId
{
  return self->_appId;
}

- (void)setAppId:(id)a3
{
}

- (NSMutableArray)subscriptionChannelResponses
{
  return self->_subscriptionChannelResponses;
}

- (void)setSubscriptionChannelResponses:(id)a3
{
}

- (NSMutableArray)unsubscriptionChannelResponses
{
  return self->_unsubscriptionChannelResponses;
}

- (void)setUnsubscriptionChannelResponses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsubscriptionChannelResponses, 0);
  objc_storeStrong((id *)&self->_subscriptionChannelResponses, 0);
  objc_storeStrong((id *)&self->_appId, 0);
}

@end