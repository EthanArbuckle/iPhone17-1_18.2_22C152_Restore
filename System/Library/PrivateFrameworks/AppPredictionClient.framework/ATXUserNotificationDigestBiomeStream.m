@interface ATXUserNotificationDigestBiomeStream
- (ATXUserNotificationDigestBiomeStream)init;
- (ATXUserNotificationDigestBiomeStream)initWithStoreConfig:(id)a3;
- (NSString)identifier;
- (id)publisherFromStartTime:(double)a3;
- (id)source;
- (void)sendEvent:(id)a3;
@end

@implementation ATXUserNotificationDigestBiomeStream

- (NSString)identifier
{
  return (NSString *)@"notificationDigestLoggingEvents";
}

- (ATXUserNotificationDigestBiomeStream)init
{
  return [(ATXUserNotificationDigestBiomeStream *)self initWithStoreConfig:0];
}

- (ATXUserNotificationDigestBiomeStream)initWithStoreConfig:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXUserNotificationDigestBiomeStream;
  v5 = [(ATXUserNotificationDigestBiomeStream *)&v13 init];
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
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F50490]) initWithPrivateStreamIdentifier:@"notificationDigestLoggingEvents" storeConfig:v6 eventDataClass:objc_opt_class()];
    inner = v5->_inner;
    v5->_inner = (BMStoreStream *)v8;

    uint64_t v10 = [(BMStoreStream *)v5->_inner source];
    source = v5->_source;
    v5->_source = (BMSource *)v10;
  }
  return v5;
}

- (id)publisherFromStartTime:(double)a3
{
  return (id)[(BMStoreStream *)self->_inner publisherFromStartTime:a3];
}

- (id)source
{
  return self->_source;
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXUserNotificationDigestBiomeStream *)self source];
  [v5 sendEvent:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_inner, 0);
}

@end