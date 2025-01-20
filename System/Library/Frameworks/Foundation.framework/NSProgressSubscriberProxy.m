@interface NSProgressSubscriberProxy
- (BOOL)isFromConnection:(id)a3;
- (NSFileAccessNode)itemLocation;
- (NSProgressSubscriberProxy)initWithForwarder:(id)a3 onConnection:(id)a4 subscriberID:(id)a5 appBundleID:(id)a6;
- (NSString)category;
- (NSString)description;
- (id)appBundleID;
- (id)descriptionWithIndenting:(id)a3;
- (void)addPublisher:(id)a3 forID:(id)a4 withValues:(id)a5 isOld:(BOOL)a6;
- (void)dealloc;
- (void)observePublisherForID:(id)a3 values:(id)a4 forKeys:(id)a5;
- (void)observePublisherUserInfoForID:(id)a3 value:(id)a4 forKey:(id)a5;
- (void)removePublisherForID:(id)a3;
- (void)setCategory:(id)a3;
- (void)setItemLocation:(id)a3;
@end

@implementation NSProgressSubscriberProxy

- (void)observePublisherUserInfoForID:(id)a3 value:(id)a4 forKey:(id)a5
{
  v8 = (void *)[(NSProgressSubscriber *)self->_forwarder _unboostingRemoteObjectProxy];

  [v8 observePublisherUserInfoForID:a3 value:a4 forKey:a5];
}

- (NSProgressSubscriberProxy)initWithForwarder:(id)a3 onConnection:(id)a4 subscriberID:(id)a5 appBundleID:(id)a6
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)NSProgressSubscriberProxy;
  v10 = [(NSProgressSubscriberProxy *)&v12 init];
  if (v10)
  {
    v10->_forwarder = (NSProgressSubscriber *)a3;
    v10->_subscriberID = (id)[a5 copy];
    v10->_bundleID = (NSString *)[a6 copy];
    v10->_connection = (NSXPCConnection *)a4;
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSProgressSubscriberProxy;
  [(NSProgressSubscriberProxy *)&v3 dealloc];
}

- (id)appBundleID
{
  v2 = self->_bundleID;

  return v2;
}

- (void)setItemLocation:(id)a3
{
  itemLocation = self->_itemLocation;
  if (itemLocation != a3)
  {
    [(NSFileAccessNode *)itemLocation removeProgressSubscriber:self];
    self->_itemLocation = (NSFileAccessNode *)a3;
    [a3 addProgressSubscriber:self];
  }
}

- (NSFileAccessNode)itemLocation
{
  v2 = self->_itemLocation;

  return v2;
}

- (void)addPublisher:(id)a3 forID:(id)a4 withValues:(id)a5 isOld:(BOOL)a6
{
}

- (void)observePublisherForID:(id)a3 values:(id)a4 forKeys:(id)a5
{
  v8 = (void *)[(NSProgressSubscriber *)self->_forwarder _unboostingRemoteObjectProxy];

  [v8 observePublisherForID:a3 values:a4 forKeys:a5];
}

- (void)removePublisherForID:(id)a3
{
}

- (id)descriptionWithIndenting:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@<%@ %p> forwarder: %@, subscriber ID: %@\n%@location: %p", a3, objc_opt_class(), self, self->_forwarder, self->_subscriberID, [a3 stringByAppendingString:@"    "], self->_itemLocation);
}

- (NSString)description
{
  return (NSString *)[(NSProgressSubscriberProxy *)self descriptionWithIndenting:&stru_1ECA5C228];
}

- (BOOL)isFromConnection:(id)a3
{
  return self->_connection == a3;
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCategory:(id)a3
{
}

@end