@interface HMEEventInfo
+ (id)eventInfoFromProtoData:(id)a3;
+ (id)eventsMapFromEventInfos:(id)a3;
+ (id)eventsMapFromProtoEvents:(id)a3;
+ (id)fromProtobuff:(id)a3;
+ (unint64_t)topicAndMetadataMaxSizeInBytes;
- (HMEEvent)event;
- (HMEEventInfo)initWithEvent:(id)a3 topic:(id)a4;
- (NSString)topic;
- (id)description;
- (id)pbEventInfo;
@end

@implementation HMEEventInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

- (NSString)topic
{
  return self->_topic;
}

- (HMEEvent)event
{
  return self->_event;
}

- (id)pbEventInfo
{
  v3 = objc_alloc_init(HMEProtoEventInfo);
  v4 = [(HMEEventInfo *)self topic];
  [(HMEProtoEventInfo *)v3 setTopic:v4];

  v5 = [(HMEEventInfo *)self event];
  v6 = [v5 pbEvent];
  [(HMEProtoEventInfo *)v3 setEvent:v6];

  return v3;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMEEventInfo *)self topic];
  v5 = [(HMEEventInfo *)self event];
  v6 = [v3 stringWithFormat:@"<HMEEventInfo topic = %@, event = %@>", v4, v5];

  return v6;
}

- (HMEEventInfo)initWithEvent:(id)a3 topic:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMEEventInfo;
  v9 = [(HMEEventInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_event, a3);
    objc_storeStrong((id *)&v10->_topic, a4);
  }

  return v10;
}

+ (unint64_t)topicAndMetadataMaxSizeInBytes
{
  return 256;
}

+ (id)eventsMapFromProtoEvents:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = +[HMEEventInfo fromProtobuff:](HMEEventInfo, "fromProtobuff:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  objc_super v12 = [a1 eventsMapFromEventInfos:v5];

  return v12;
}

+ (id)eventsMapFromEventInfos:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "topic", (void)v16);

        if (v11)
        {
          objc_super v12 = [v10 event];
          v13 = [v10 topic];
          [v4 setObject:v12 forKeyedSubscript:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  long long v14 = (void *)[v4 copy];
  return v14;
}

+ (id)eventInfoFromProtoData:(id)a3
{
  id v4 = a3;
  id v5 = [[HMEProtoEventInfo alloc] initWithData:v4];

  if (v5)
  {
    uint64_t v6 = [a1 fromProtobuff:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)fromProtobuff:(id)a3
{
  id v3 = a3;
  if ([v3 hasTopic]
    && [v3 hasEvent]
    && ([v3 event],
        id v4 = objc_claimAutoreleasedReturnValue(),
        +[HMEEvent eventFromProtobuff:v4],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    uint64_t v6 = [HMEEventInfo alloc];
    uint64_t v7 = [v3 topic];
    uint64_t v8 = [(HMEEventInfo *)v6 initWithEvent:v5 topic:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end