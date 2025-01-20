@interface EDMessagePersistence
- (id)deliveryInfoForMessage:(id)a3;
- (int64_t)mailDropDeliveryStateForMessage:(id)a3;
- (void)setDeliveryInfo:(id)a3 forMessage:(id)a4;
- (void)setMailDropDeliveryState:(int64_t)a3 forMessage:(id)a4;
@end

@implementation EDMessagePersistence

- (id)deliveryInfoForMessage:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectID];
    v7 = [(EDMessagePersistence *)self cachedMetadataJSONForKey:@"maild.deliveryInfo" messageID:v6];

    v8 = [[MessageDeliveryInfo alloc] initWithJSON:v7];
  }
  else
  {
    v8 = objc_alloc_init(MessageDeliveryInfo);
  }

  return v8;
}

- (void)setDeliveryInfo:(id)a3 forMessage:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = [v9 encodedAsJSON];
    v8 = [v6 objectID];
    [(EDMessagePersistence *)self setCachedMetadataJSON:v7 forKey:@"maild.deliveryInfo" messageID:v8];
  }
}

- (int64_t)mailDropDeliveryStateForMessage:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectID];
    v7 = [(EDMessagePersistence *)self cachedMetadataJSONForKey:@"maild.mailDropDeliveryState" messageID:v6];

    if (v7)
    {
      unsigned int v8 = [v7 intValue];
      if (v8 - 9 >= 0xFFFFFFF8) {
        signed int v9 = v8;
      }
      else {
        signed int v9 = 0;
      }
      int64_t v10 = v9;
    }
    else
    {
      int64_t v10 = 0;
    }
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (void)setMailDropDeliveryState:(int64_t)a3 forMessage:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v8 = v6;
    if (a3)
    {
      a3 = +[NSString stringWithFormat:@"%d", a3];
      id v6 = v8;
    }
    v7 = [v6 objectID];
    [(EDMessagePersistence *)self setCachedMetadataJSON:a3 forKey:@"maild.mailDropDeliveryState" messageID:v7];

    id v6 = v8;
  }
}

@end