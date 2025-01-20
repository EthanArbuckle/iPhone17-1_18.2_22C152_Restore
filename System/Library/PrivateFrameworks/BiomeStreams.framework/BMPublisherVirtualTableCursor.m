@interface BMPublisherVirtualTableCursor
- (BMPublisherVirtualTableCursor)initWithVirtualTable:(id)a3;
- (BMStreamVirtualTable)virtualTable;
- (BPSPublisher)publisher;
- (BPSSubscription)subscription;
- (NSString)description;
- (id)rowObject;
- (int64_t)receiveInput:(id)a3;
- (int64_t)rowID;
- (void)advance;
- (void)cancel;
- (void)close;
- (void)receiveSubscription:(id)a3;
- (void)receivedEvent:(id)a3;
- (void)requestNextEvents;
- (void)reset;
- (void)resetWithOptions:(id)a3;
- (void)subscribeTo:(id)a3;
@end

@implementation BMPublisherVirtualTableCursor

- (BMPublisherVirtualTableCursor)initWithVirtualTable:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BMPublisherVirtualTableCursor;
  v6 = [(BMPublisherVirtualTableCursor *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_virtualTable, a3);
    id rowObject = v7->_rowObject;
    v7->_id rowObject = 0;
  }
  return v7;
}

- (void)reset
{
}

- (void)resetWithOptions:(id)a3
{
  id rowObject = self->_rowObject;
  self->_id rowObject = 0;
  id v5 = a3;

  v6 = [(BMStreamVirtualTable *)self->_virtualTable publisherBlock];
  ((void (**)(void, id))v6)[2](v6, v5);
  id obj = (id)objc_claimAutoreleasedReturnValue();

  if (BPSPipelineSupportsPullBasedPublishers())
  {
    [(BMPublisherVirtualTableCursor *)self _resetWithPublisher:obj];
  }
  else
  {
    objc_storeStrong((id *)&self->_publisher, obj);
    [(BPSPublisher *)self->_publisher subscribe:self];
    [(BMPublisherVirtualTableCursor *)self advance];
  }
}

- (void)advance
{
  id rowObject = self->_rowObject;
  self->_id rowObject = 0;

  if (BPSPipelineSupportsPullBasedPublishers())
  {
    [(BMPublisherVirtualTableCursor *)self _advance];
  }
  else
  {
    subscription = self->_subscription;
    [(BPSSubscription *)subscription requestDemand:1];
  }
}

- (void)close
{
  self->_subscription = 0;
  MEMORY[0x1F41817F8]();
}

- (int64_t)receiveInput:(id)a3
{
  id v4 = a3;
  id rowObject = self->_rowObject;
  if (rowObject) {
    id rowObject = (id)(self->_rowID + 1);
  }
  self->_rowID = (int64_t)rowObject;
  id v6 = self->_rowObject;
  self->_id rowObject = v4;
  v7 = self;

  int64_t v8 = *MEMORY[0x1E4F501C0];
  return v8;
}

- (void)receiveSubscription:(id)a3
{
}

- (void)cancel
{
}

- (void)subscribeTo:(id)a3
{
  objc_storeStrong((id *)&self->_publisher, a3);
  id v4 = [(BMPublisherVirtualTableCursor *)self publisher];
  id v6 = [v4 startWithSubscriber:self];

  id v5 = v6;
  if (!v6)
  {
    [(BMPublisherVirtualTableCursor *)self requestNextEvents];
    id v5 = 0;
  }
}

- (void)receivedEvent:(id)a3
{
  id v4 = a3;
  id rowObject = self->_rowObject;
  if (rowObject) {
    id rowObject = (id)(self->_rowID + 1);
  }
  self->_rowID = (int64_t)rowObject;
  self->_id rowObject = v4;

  MEMORY[0x1F41817F8]();
}

- (void)requestNextEvents
{
  uint64_t v3 = [(BPSPublisher *)self->_publisher nextEvent];
  if (v3) {
    [(BMPublisherVirtualTableCursor *)self receivedEvent:v3];
  }

  MEMORY[0x1F41817F8]();
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  publisher = self->_publisher;
  id v6 = [NSNumber numberWithLongLong:self->_rowID];
  v7 = [NSNumber numberWithInt:self->_rowObject == 0];
  int64_t v8 = (void *)[v3 initWithFormat:@"<%@ %p> publisher: %@, rowid: %@, finished: %@", v4, self, publisher, v6, v7];

  return (NSString *)v8;
}

- (BMStreamVirtualTable)virtualTable
{
  return self->_virtualTable;
}

- (BPSPublisher)publisher
{
  return self->_publisher;
}

- (BPSSubscription)subscription
{
  return self->_subscription;
}

- (id)rowObject
{
  return self->_rowObject;
}

- (int64_t)rowID
{
  return self->_rowID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_virtualTable, 0);

  objc_storeStrong(&self->_rowObject, 0);
}

@end