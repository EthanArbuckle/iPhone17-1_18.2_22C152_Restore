@interface PSAppChannelSubscriptions
+ (Class)attributesType;
+ (Class)subscriptionChannelsType;
+ (Class)unsubscriptionChannelsType;
- (BOOL)hasAppId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)attributes;
- (NSMutableArray)subscriptionChannels;
- (NSMutableArray)unsubscriptionChannels;
- (NSString)appId;
- (id)attributesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)subscriptionChannelsAtIndex:(unint64_t)a3;
- (id)unsubscriptionChannelsAtIndex:(unint64_t)a3;
- (unint64_t)attributesCount;
- (unint64_t)hash;
- (unint64_t)subscriptionChannelsCount;
- (unint64_t)unsubscriptionChannelsCount;
- (void)addAttributes:(id)a3;
- (void)addSubscriptionChannels:(id)a3;
- (void)addUnsubscriptionChannels:(id)a3;
- (void)clearAttributes;
- (void)clearSubscriptionChannels;
- (void)clearUnsubscriptionChannels;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppId:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setSubscriptionChannels:(id)a3;
- (void)setUnsubscriptionChannels:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSAppChannelSubscriptions

- (BOOL)hasAppId
{
  return self->_appId != 0;
}

- (void)clearSubscriptionChannels
{
}

- (void)addSubscriptionChannels:(id)a3
{
  id v4 = a3;
  subscriptionChannels = self->_subscriptionChannels;
  id v8 = v4;
  if (!subscriptionChannels)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_subscriptionChannels;
    self->_subscriptionChannels = v6;

    id v4 = v8;
    subscriptionChannels = self->_subscriptionChannels;
  }
  [(NSMutableArray *)subscriptionChannels addObject:v4];
}

- (unint64_t)subscriptionChannelsCount
{
  return (unint64_t)[(NSMutableArray *)self->_subscriptionChannels count];
}

- (id)subscriptionChannelsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_subscriptionChannels objectAtIndex:a3];
}

+ (Class)subscriptionChannelsType
{
  return (Class)objc_opt_class();
}

- (void)clearUnsubscriptionChannels
{
}

- (void)addUnsubscriptionChannels:(id)a3
{
  id v4 = a3;
  unsubscriptionChannels = self->_unsubscriptionChannels;
  id v8 = v4;
  if (!unsubscriptionChannels)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_unsubscriptionChannels;
    self->_unsubscriptionChannels = v6;

    id v4 = v8;
    unsubscriptionChannels = self->_unsubscriptionChannels;
  }
  [(NSMutableArray *)unsubscriptionChannels addObject:v4];
}

- (unint64_t)unsubscriptionChannelsCount
{
  return (unint64_t)[(NSMutableArray *)self->_unsubscriptionChannels count];
}

- (id)unsubscriptionChannelsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_unsubscriptionChannels objectAtIndex:a3];
}

+ (Class)unsubscriptionChannelsType
{
  return (Class)objc_opt_class();
}

- (void)clearAttributes
{
}

- (void)addAttributes:(id)a3
{
  id v4 = a3;
  attributes = self->_attributes;
  id v8 = v4;
  if (!attributes)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_attributes;
    self->_attributes = v6;

    id v4 = v8;
    attributes = self->_attributes;
  }
  [(NSMutableArray *)attributes addObject:v4];
}

- (unint64_t)attributesCount
{
  return (unint64_t)[(NSMutableArray *)self->_attributes count];
}

- (id)attributesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_attributes objectAtIndex:a3];
}

+ (Class)attributesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PSAppChannelSubscriptions;
  v3 = [(PSAppChannelSubscriptions *)&v7 description];
  id v4 = [(PSAppChannelSubscriptions *)self dictionaryRepresentation];
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
  if ([(NSMutableArray *)self->_subscriptionChannels count])
  {
    id v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_subscriptionChannels, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    objc_super v7 = self->_subscriptionChannels;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v37;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v36 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"subscription_channels"];
  }
  if ([(NSMutableArray *)self->_unsubscriptionChannels count])
  {
    id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_unsubscriptionChannels, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v14 = self->_unsubscriptionChannels;
    id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v33;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v32 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"unsubscription_channels"];
  }
  if ([(NSMutableArray *)self->_attributes count])
  {
    id v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_attributes, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v21 = self->_attributes;
    id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v29;
      do
      {
        for (k = 0; k != v23; k = (char *)k + 1)
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * (void)k), "dictionaryRepresentation", (void)v28);
          [v20 addObject:v26];
        }
        id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
      }
      while (v23);
    }

    [v4 setObject:v20 forKey:@"attributes"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006A528(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_appId) {
    PBDataWriterWriteStringField();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v5 = self->_subscriptionChannels;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = self->_unsubscriptionChannels;
  v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = self->_attributes;
  id v16 = (char *)[(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = (char *)[(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (void)copyTo:(id)a3
{
  id v16 = a3;
  if (self->_appId) {
    objc_msgSend(v16, "setAppId:");
  }
  if ([(PSAppChannelSubscriptions *)self subscriptionChannelsCount])
  {
    [v16 clearSubscriptionChannels];
    unint64_t v4 = [(PSAppChannelSubscriptions *)self subscriptionChannelsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(PSAppChannelSubscriptions *)self subscriptionChannelsAtIndex:i];
        [v16 addSubscriptionChannels:v7];
      }
    }
  }
  if ([(PSAppChannelSubscriptions *)self unsubscriptionChannelsCount])
  {
    [v16 clearUnsubscriptionChannels];
    unint64_t v8 = [(PSAppChannelSubscriptions *)self unsubscriptionChannelsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        v11 = [(PSAppChannelSubscriptions *)self unsubscriptionChannelsAtIndex:j];
        [v16 addUnsubscriptionChannels:v11];
      }
    }
  }
  if ([(PSAppChannelSubscriptions *)self attributesCount])
  {
    [v16 clearAttributes];
    unint64_t v12 = [(PSAppChannelSubscriptions *)self attributesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        id v15 = [(PSAppChannelSubscriptions *)self attributesAtIndex:k];
        [v16 addAttributes:v15];
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

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  unint64_t v8 = self->_subscriptionChannels;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      unint64_t v12 = 0;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v35 + 1) + 8 * (void)v12) copyWithZone:a3];
        [v5 addSubscriptionChannels:v13];

        unint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v10);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v14 = self->_unsubscriptionChannels;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v32;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)v18) copyWithZone:a3];
        [v5 addUnsubscriptionChannels:v19];

        uint64_t v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v16);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v20 = self->_attributes;
  id v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      long long v24 = 0;
      do
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)v24), "copyWithZone:", a3, (void)v27);
        [v5 addAttributes:v25];

        long long v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      id v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v22);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((appId = self->_appId, !((unint64_t)appId | v4[1]))
     || -[NSString isEqual:](appId, "isEqual:"))
    && ((subscriptionChannels = self->_subscriptionChannels, !((unint64_t)subscriptionChannels | v4[3]))
     || -[NSMutableArray isEqual:](subscriptionChannels, "isEqual:"))
    && ((unsubscriptionChannels = self->_unsubscriptionChannels, !((unint64_t)unsubscriptionChannels | v4[4]))
     || -[NSMutableArray isEqual:](unsubscriptionChannels, "isEqual:")))
  {
    attributes = self->_attributes;
    if ((unint64_t)attributes | v4[2]) {
      unsigned __int8 v9 = -[NSMutableArray isEqual:](attributes, "isEqual:");
    }
    else {
      unsigned __int8 v9 = 1;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_appId hash];
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_subscriptionChannels hash] ^ v3;
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_unsubscriptionChannels hash];
  return v4 ^ v5 ^ (unint64_t)[(NSMutableArray *)self->_attributes hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[PSAppChannelSubscriptions setAppId:](self, "setAppId:");
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = *((id *)v4 + 3);
  id v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        [(PSAppChannelSubscriptions *)self addSubscriptionChannels:*(void *)(*((void *)&v28 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = *((id *)v4 + 4);
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(PSAppChannelSubscriptions *)self addUnsubscriptionChannels:*(void *)(*((void *)&v24 + 1) + 8 * (void)j)];
      }
      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = *((id *)v4 + 2);
  id v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t k = 0; k != v17; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[PSAppChannelSubscriptions addAttributes:](self, "addAttributes:", *(void *)(*((void *)&v20 + 1) + 8 * (void)k), (void)v20);
      }
      id v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (NSString)appId
{
  return self->_appId;
}

- (void)setAppId:(id)a3
{
}

- (NSMutableArray)subscriptionChannels
{
  return self->_subscriptionChannels;
}

- (void)setSubscriptionChannels:(id)a3
{
}

- (NSMutableArray)unsubscriptionChannels
{
  return self->_unsubscriptionChannels;
}

- (void)setUnsubscriptionChannels:(id)a3
{
}

- (NSMutableArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsubscriptionChannels, 0);
  objc_storeStrong((id *)&self->_subscriptionChannels, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_appId, 0);
}

@end