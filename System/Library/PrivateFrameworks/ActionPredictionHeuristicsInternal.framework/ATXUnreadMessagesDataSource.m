@interface ATXUnreadMessagesDataSource
- (ATXUnreadMessagesDataSource)initWithDevice:(id)a3;
- (void)unreadMessagesWithLimit:(int64_t)a3 callback:(id)a4;
@end

@implementation ATXUnreadMessagesDataSource

- (ATXUnreadMessagesDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXUnreadMessagesDataSource;
  v6 = [(ATXUnreadMessagesDataSource *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("ATXUnreadMessagesDataSource.resultsQueue", v8);
    resultsQueue = v7->_resultsQueue;
    v7->_resultsQueue = (OS_dispatch_queue *)v9;

    v11 = v7;
  }

  return v7;
}

- (void)unreadMessagesWithLimit:(int64_t)a3 callback:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end