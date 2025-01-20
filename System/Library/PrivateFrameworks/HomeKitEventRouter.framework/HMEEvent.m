@interface HMEEvent
+ (id)eventFromProtobuff:(id)a3;
- (HMEEvent)initWithEventData:(id)a3;
- (HMEEvent)initWithSubclassedEventMetadata:(id)a3;
- (HMEEventMetadata)eventMetadata;
- (NSData)encodedData;
- (NSData)eventData;
- (id)_initWithEventData:(id)a3 metadata:(id)a4;
- (id)description;
- (id)pbEvent;
@end

@implementation HMEEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (NSData)eventData
{
  return self->_eventData;
}

- (HMEEventMetadata)eventMetadata
{
  return (HMEEventMetadata *)objc_getProperty(self, a2, 8, 1);
}

- (id)pbEvent
{
  v3 = objc_alloc_init(HMEProtoEvent);
  v4 = [(HMEEvent *)self encodedData];
  [(HMEProtoEvent *)v3 setEventData:v4];

  v5 = objc_alloc_init(HMEProtoEventMetadata);
  [(HMEProtoEvent *)v3 setEventMetadata:v5];

  v6 = [(HMEEvent *)self eventMetadata];
  v7 = [v6 source];
  v8 = [(HMEProtoEvent *)v3 eventMetadata];
  [v8 setSource:v7];

  v9 = [(HMEEvent *)self eventMetadata];
  [v9 intervalSinceReferenceDate];
  double v11 = v10;
  v12 = [(HMEProtoEvent *)v3 eventMetadata];
  [v12 setTimestamp:v11];

  v13 = [(HMEEvent *)self eventMetadata];
  uint64_t v14 = [v13 rawCachePolicy];
  v15 = [(HMEProtoEvent *)v3 eventMetadata];
  [v15 setCachePolicy:v14];

  v16 = [(HMEEvent *)self eventMetadata];
  uint64_t v17 = [v16 rawCombineType];
  v18 = [(HMEProtoEvent *)v3 eventMetadata];
  [v18 setCombinePolicy:v17];

  v19 = [(HMEEvent *)self eventMetadata];
  uint64_t v20 = [v19 rawQOS];
  v21 = [(HMEProtoEvent *)v3 eventMetadata];
  [v21 setQos:v20];

  return v3;
}

- (id)description
{
  v2 = NSString;
  v3 = NSNumber;
  v4 = [(HMEEvent *)self eventData];
  v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
  v6 = [v2 stringWithFormat:@"<HMEEvent size = %@>", v5];

  return v6;
}

- (NSData)encodedData
{
  v2 = [(HMEEvent *)self eventData];
  v3 = (void *)[v2 copy];

  return (NSData *)v3;
}

- (id)_initWithEventData:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMEEvent;
  v8 = [(HMEEvent *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_eventMetadata, a4);
    uint64_t v10 = [v6 copy];
    eventData = v9->_eventData;
    v9->_eventData = (NSData *)v10;
  }
  return v9;
}

- (HMEEvent)initWithEventData:(id)a3
{
  id v4 = a3;
  id v5 = [[HMEEventMetadata alloc] initDefaultMetadata];
  id v6 = [(HMEEvent *)self _initWithEventData:v4 metadata:v5];

  return v6;
}

- (HMEEvent)initWithSubclassedEventMetadata:(id)a3
{
  id v4 = a3;
  if ([(HMEEvent *)self isMemberOfClass:objc_opt_class()])
  {
    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can only be called by subclass" userInfo:0];
    objc_exception_throw(v7);
  }
  id v5 = [(HMEEvent *)self _initWithEventData:0 metadata:v4];

  return v5;
}

+ (id)eventFromProtobuff:(id)a3
{
  id v3 = a3;
  if (![v3 hasEventData])
  {
    double v11 = 0;
    goto LABEL_22;
  }
  if ([v3 hasEventMetadata])
  {
    id v4 = [v3 eventMetadata];
    uint64_t v5 = [v4 source];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [v3 eventMetadata];
      v8 = [v7 source];
      uint64_t v9 = [v8 length];

      if (!v9)
      {
        uint64_t v10 = @"Unknown";
        goto LABEL_11;
      }
      id v4 = [v3 eventMetadata];
      uint64_t v10 = [v4 source];
    }
    else
    {
      uint64_t v10 = @"Unknown";
    }

LABEL_11:
    v15 = [v3 eventMetadata];
    int v16 = [v15 hasTimestamp];

    double v14 = 0.0;
    if (v16)
    {
      uint64_t v17 = [v3 eventMetadata];
      [v17 timestamp];
      double v14 = v18;
    }
    v19 = [v3 eventMetadata];
    int v20 = [v19 hasCachePolicy];

    if (v20)
    {
      v21 = [v3 eventMetadata];
      unsigned int v12 = [v21 cachePolicy];
    }
    else
    {
      unsigned int v12 = 0;
    }
    v22 = [v3 eventMetadata];
    int v23 = [v22 hasCombinePolicy];

    if (v23)
    {
      v24 = [v3 eventMetadata];
      [v24 combinePolicy];
    }
    v25 = [v3 eventMetadata];
    int v26 = [v25 hasQos];

    if (v26)
    {
      v27 = [v3 eventMetadata];
      unsigned int v28 = [v27 qos];

      uint64_t v13 = v28;
    }
    else
    {
      uint64_t v13 = 0;
    }
    goto LABEL_21;
  }
  unsigned int v12 = 0;
  uint64_t v13 = 0;
  double v14 = 0.0;
  uint64_t v10 = @"Unknown";
LABEL_21:
  id v29 = [[HMEEventMetadata alloc] _initWithSource:v10 rawCachePolicy:v12 rawCombineType:2 rawQos:v13 timestamp:v14];
  v30 = [HMEEvent alloc];
  v31 = [v3 eventData];
  double v11 = [(HMEEvent *)v30 initWithEventData:v31 metadata:v29];

LABEL_22:
  return v11;
}

@end