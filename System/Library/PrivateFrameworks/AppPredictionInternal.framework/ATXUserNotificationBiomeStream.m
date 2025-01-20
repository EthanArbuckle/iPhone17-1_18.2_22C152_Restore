@interface ATXUserNotificationBiomeStream
- (ATXUserNotificationBiomeStream)init;
- (ATXUserNotificationBiomeStream)initWithStoreConfig:(id)a3;
- (NSString)identifier;
- (id)publisherFromStartTime:(double)a3;
- (id)publisherFromStartTime:(id)a3 endTime:(id)a4 maxEvents:(unint64_t)a5 lastN:(unint64_t)a6 reversed:(BOOL)a7;
- (id)source;
- (void)deleteAllEvents;
- (void)sendEvent:(id)a3;
- (void)sendEvent:(int64_t)a3 notification:(id)a4 deliveryReason:(unint64_t)a5 interactionUI:(unint64_t)a6;
@end

@implementation ATXUserNotificationBiomeStream

- (NSString)identifier
{
  return (NSString *)@"userNotificationEvents";
}

- (ATXUserNotificationBiomeStream)init
{
  return [(ATXUserNotificationBiomeStream *)self initWithStoreConfig:0];
}

- (ATXUserNotificationBiomeStream)initWithStoreConfig:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXUserNotificationBiomeStream;
  v5 = [(ATXUserNotificationBiomeStream *)&v11 init];
  if (v5)
  {
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F50278], "atx_storeConfig");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F50490]) initWithPrivateStreamIdentifier:@"userNotificationEvents" storeConfig:v6 eventDataClass:objc_opt_class()];
    inner = v5->_inner;
    v5->_inner = (BMStoreStream *)v8;
  }
  return v5;
}

- (id)publisherFromStartTime:(double)a3
{
  return (id)[(BMStoreStream *)self->_inner publisherFromStartTime:a3];
}

- (id)publisherFromStartTime:(id)a3 endTime:(id)a4 maxEvents:(unint64_t)a5 lastN:(unint64_t)a6 reversed:(BOOL)a7
{
  BOOL v7 = a7;
  inner = self->_inner;
  v12 = (objc_class *)MEMORY[0x1E4F503E8];
  id v13 = a4;
  id v14 = a3;
  v15 = (void *)[[v12 alloc] initWithStartDate:v14 endDate:v13 maxEvents:a5 lastN:a6 reversed:v7];

  v16 = [(BMStoreStream *)inner publisherWithOptions:v15];

  return v16;
}

- (id)source
{
  v2 = self;
  objc_sync_enter(v2);
  source = v2->_source;
  if (!source)
  {
    uint64_t v4 = [(BMStoreStream *)v2->_inner source];
    v5 = v2->_source;
    v2->_source = (BMSource *)v4;

    source = v2->_source;
  }
  id v6 = source;
  objc_sync_exit(v2);

  return v6;
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXUserNotificationBiomeStream *)self source];
  [v5 sendEvent:v4];
}

- (void)sendEvent:(int64_t)a3 notification:(id)a4 deliveryReason:(unint64_t)a5 interactionUI:(unint64_t)a6
{
  v10 = (objc_class *)MEMORY[0x1E4F4B420];
  id v11 = a4;
  id v12 = [v10 alloc];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  id v13 = (id)objc_msgSend(v12, "initFromUserNotification:eventType:timestamp:deliveryReason:deliveryUI:", v11, a3, a5, a6);

  [(ATXUserNotificationBiomeStream *)self sendEvent:v13];
}

- (void)deleteAllEvents
{
}

uint64_t __49__ATXUserNotificationBiomeStream_deleteAllEvents__block_invoke()
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_inner, 0);
}

@end