@interface NSProgressPublisherProxy
- (BOOL)isFromConnection:(id)a3;
- (NSFileAccessNode)itemLocation;
- (NSProgressPublisherProxy)initWithForwarder:(id)a3 onConnection:(id)a4 publisherID:(id)a5 values:(id)a6;
- (NSProgressValues)values;
- (NSString)category;
- (NSString)description;
- (id)descriptionWithIndenting:(id)a3;
- (id)publisherID;
- (void)appWithBundleID:(id)a3 didAcknowledgeWithSuccess:(BOOL)a4;
- (void)cancel;
- (void)dealloc;
- (void)observeUserInfoValue:(id)a3 forKey:(id)a4;
- (void)observeValues:(id)a3 forKeys:(id)a4;
- (void)pause;
- (void)prioritize;
- (void)resume;
- (void)setCategory:(id)a3;
- (void)setItemLocation:(id)a3;
@end

@implementation NSProgressPublisherProxy

- (void)observeUserInfoValue:(id)a3 forKey:(id)a4
{
  userInfo = self->_values->_userInfo;
  if (!userInfo)
  {
    self->_values->_userInfo = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    userInfo = self->_values->_userInfo;
  }

  [(NSMutableDictionary *)userInfo setObject:a3 forKeyedSubscript:a4];
}

- (NSFileAccessNode)itemLocation
{
  v2 = self->_itemLocation;

  return v2;
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSProgressPublisherProxy)initWithForwarder:(id)a3 onConnection:(id)a4 publisherID:(id)a5 values:(id)a6
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)NSProgressPublisherProxy;
  v10 = [(NSProgressPublisherProxy *)&v12 init];
  if (v10)
  {
    v10->_forwarder = (NSProgressPublisher *)a3;
    v10->_publisherID = a5;
    v10->_connection = (NSXPCConnection *)a4;
    v10->_values = (NSProgressValues *)[a6 copy];
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSProgressPublisherProxy;
  [(NSProgressPublisherProxy *)&v3 dealloc];
}

- (id)publisherID
{
  id v2 = self->_publisherID;

  return v2;
}

- (void)setItemLocation:(id)a3
{
  v6[5] = *MEMORY[0x1E4F143B8];
  itemLocation = self->_itemLocation;
  if (itemLocation != a3)
  {
    if (!a3)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __44__NSProgressPublisherProxy_setItemLocation___block_invoke;
      v6[3] = &unk_1E51F6600;
      v6[4] = self;
      [(NSFileAccessNode *)itemLocation forEachProgressSubscriberOfItemOrContainingItemPerformProcedure:v6];
      itemLocation = self->_itemLocation;
    }
    [(NSFileAccessNode *)itemLocation removeProgressPublisher:self];
    self->_itemLocation = (NSFileAccessNode *)a3;
    [a3 addProgressPublisher:self];
  }
}

uint64_t __44__NSProgressPublisherProxy_setItemLocation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removePublisherForID:*(void *)(*(void *)(a1 + 32) + 16)];
}

- (BOOL)isFromConnection:(id)a3
{
  return self->_connection == a3;
}

- (void)cancel
{
}

- (void)pause
{
}

- (void)resume
{
}

- (void)prioritize
{
}

- (void)appWithBundleID:(id)a3 didAcknowledgeWithSuccess:(BOOL)a4
{
}

- (id)descriptionWithIndenting:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@<%@ %p> forwarder: %@, publisher ID: %@\n%@location: %p", a3, objc_opt_class(), self, self->_forwarder, self->_publisherID, [a3 stringByAppendingString:@"    "], self->_itemLocation);
}

- (NSString)description
{
  return (NSString *)[(NSProgressPublisherProxy *)self descriptionWithIndenting:&stru_1ECA5C228];
}

- (void)observeValues:(id)a3 forKeys:(id)a4
{
  uint64_t v7 = [a3 count];
  uint64_t v8 = [a4 count];
  if (v7 && v7 == v8)
  {
    for (uint64_t i = 0; i != v7; ++i)
      -[NSProgressValues setValue:forKey:](self->_values, "setValue:forKey:", [a3 objectAtIndexedSubscript:i], objc_msgSend(a4, "objectAtIndexedSubscript:", i));
  }
}

- (void)setCategory:(id)a3
{
}

- (NSProgressValues)values
{
  return (NSProgressValues *)objc_getProperty(self, a2, 48, 1);
}

@end