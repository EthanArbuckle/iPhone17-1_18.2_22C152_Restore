@interface PSChannelSubscriptionsUpdatePayload
+ (Class)appChannelUpdatesType;
+ (Class)subscriptionUpdatesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)appChannelUpdates;
- (NSMutableArray)subscriptionUpdates;
- (id)appChannelUpdatesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)subscriptionUpdatesAtIndex:(unint64_t)a3;
- (unint64_t)appChannelUpdatesCount;
- (unint64_t)hash;
- (unint64_t)subscriptionUpdatesCount;
- (void)addAppChannelUpdates:(id)a3;
- (void)addSubscriptionUpdates:(id)a3;
- (void)clearAppChannelUpdates;
- (void)clearSubscriptionUpdates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppChannelUpdates:(id)a3;
- (void)setSubscriptionUpdates:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSChannelSubscriptionsUpdatePayload

- (void)clearAppChannelUpdates
{
}

- (void)addAppChannelUpdates:(id)a3
{
  id v4 = a3;
  appChannelUpdates = self->_appChannelUpdates;
  id v8 = v4;
  if (!appChannelUpdates)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_appChannelUpdates;
    self->_appChannelUpdates = v6;

    id v4 = v8;
    appChannelUpdates = self->_appChannelUpdates;
  }
  [(NSMutableArray *)appChannelUpdates addObject:v4];
}

- (unint64_t)appChannelUpdatesCount
{
  return (unint64_t)[(NSMutableArray *)self->_appChannelUpdates count];
}

- (id)appChannelUpdatesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_appChannelUpdates objectAtIndex:a3];
}

+ (Class)appChannelUpdatesType
{
  return (Class)objc_opt_class();
}

- (void)clearSubscriptionUpdates
{
}

- (void)addSubscriptionUpdates:(id)a3
{
  id v4 = a3;
  subscriptionUpdates = self->_subscriptionUpdates;
  id v8 = v4;
  if (!subscriptionUpdates)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_subscriptionUpdates;
    self->_subscriptionUpdates = v6;

    id v4 = v8;
    subscriptionUpdates = self->_subscriptionUpdates;
  }
  [(NSMutableArray *)subscriptionUpdates addObject:v4];
}

- (unint64_t)subscriptionUpdatesCount
{
  return (unint64_t)[(NSMutableArray *)self->_subscriptionUpdates count];
}

- (id)subscriptionUpdatesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_subscriptionUpdates objectAtIndex:a3];
}

+ (Class)subscriptionUpdatesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PSChannelSubscriptionsUpdatePayload;
  v3 = [(PSChannelSubscriptionsUpdatePayload *)&v7 description];
  id v4 = [(PSChannelSubscriptionsUpdatePayload *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_appChannelUpdates count])
  {
    id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_appChannelUpdates, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v5 = self->_appChannelUpdates;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"app_channel_updates"];
  }
  if ([(NSMutableArray *)self->_subscriptionUpdates count])
  {
    id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_subscriptionUpdates, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = self->_subscriptionUpdates;
    id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)j), "dictionaryRepresentation", (void)v19);
          [v11 addObject:v17];
        }
        id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"subscription_updates"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10007F700(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_appChannelUpdates;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_subscriptionUpdates;
  id v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      id v14 = 0;
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
  if ([(PSChannelSubscriptionsUpdatePayload *)self appChannelUpdatesCount])
  {
    [v12 clearAppChannelUpdates];
    unint64_t v4 = [(PSChannelSubscriptionsUpdatePayload *)self appChannelUpdatesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(PSChannelSubscriptionsUpdatePayload *)self appChannelUpdatesAtIndex:i];
        [v12 addAppChannelUpdates:v7];
      }
    }
  }
  if ([(PSChannelSubscriptionsUpdatePayload *)self subscriptionUpdatesCount])
  {
    [v12 clearSubscriptionUpdates];
    unint64_t v8 = [(PSChannelSubscriptionsUpdatePayload *)self subscriptionUpdatesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        id v11 = [(PSChannelSubscriptionsUpdatePayload *)self subscriptionUpdatesAtIndex:j];
        [v12 addSubscriptionUpdates:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = self->_appChannelUpdates;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v10) copyWithZone:a3];
        [v5 addAppChannelUpdates:v11];

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = self->_subscriptionUpdates;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      long long v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v16), "copyWithZone:", a3, (void)v19);
        [v5 addSubscriptionUpdates:v17];

        long long v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((appChannelUpdates = self->_appChannelUpdates, !((unint64_t)appChannelUpdates | v4[1]))
     || -[NSMutableArray isEqual:](appChannelUpdates, "isEqual:")))
  {
    subscriptionUpdates = self->_subscriptionUpdates;
    if ((unint64_t)subscriptionUpdates | v4[2]) {
      unsigned __int8 v7 = -[NSMutableArray isEqual:](subscriptionUpdates, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSMutableArray *)self->_appChannelUpdates hash];
  return (unint64_t)[(NSMutableArray *)self->_subscriptionUpdates hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (id *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[1];
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(PSChannelSubscriptionsUpdatePayload *)self addAppChannelUpdates:*(void *)(*((void *)&v19 + 1) + 8 * (void)v9)];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[2];
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[PSChannelSubscriptionsUpdatePayload addSubscriptionUpdates:](self, "addSubscriptionUpdates:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v14), (void)v15);
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSMutableArray)appChannelUpdates
{
  return self->_appChannelUpdates;
}

- (void)setAppChannelUpdates:(id)a3
{
}

- (NSMutableArray)subscriptionUpdates
{
  return self->_subscriptionUpdates;
}

- (void)setSubscriptionUpdates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionUpdates, 0);
  objc_storeStrong((id *)&self->_appChannelUpdates, 0);
}

@end