@interface ATDeviceSyncSessionTask
- (ATConcreteMessageLink)messageLink;
- (ATDeviceSyncSessionTask)initWithDataClass:(id)a3 onMessageLink:(id)a4;
- (NSString)linkIdentifier;
- (OS_dispatch_queue)queue;
- (void)messageLink:(id)a3 didReceiveRequest:(id)a4;
- (void)sendRequest:(id)a3 withCompletion:(id)a4;
- (void)updateProgressWithCount:(unint64_t)a3 totalItemCount:(unint64_t)a4;
@end

@implementation ATDeviceSyncSessionTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_linkIdentifier, 0);

  objc_storeStrong((id *)&self->_messageLink, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)linkIdentifier
{
  return self->_linkIdentifier;
}

- (ATConcreteMessageLink)messageLink
{
  return self->_messageLink;
}

- (void)messageLink:(id)a3 didReceiveRequest:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)ATDeviceSyncSessionTask;
  -[ATDeviceSyncSessionTask doesNotRecognizeSelector:](&v4, sel_doesNotRecognizeSelector_, a2, a4);
}

- (void)sendRequest:(id)a3 withCompletion:(id)a4
{
}

- (void)updateProgressWithCount:(unint64_t)a3 totalItemCount:(unint64_t)a4
{
  -[ATSessionTask setCompletedItemCount:](self, "setCompletedItemCount:");
  [(ATSessionTask *)self setTotalItemCount:a4];
  if (a4) {
    double v7 = (double)a3 / (double)a4;
  }
  else {
    double v7 = 0.0;
  }

  [(ATSessionTask *)self setProgress:v7];
}

- (ATDeviceSyncSessionTask)initWithDataClass:(id)a3 onMessageLink:(id)a4
{
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ATDeviceSyncSessionTask;
  v8 = [(ATSessionTask *)&v17 initWithDataClass:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_messageLink, a4);
    uint64_t v10 = [v7 identifier];
    linkIdentifier = v9->_linkIdentifier;
    v9->_linkIdentifier = (NSString *)v10;

    v12 = (objc_class *)objc_opt_class();
    Name = class_getName(v12);
    dispatch_queue_t v14 = dispatch_queue_create(Name, 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v14;
  }
  return v9;
}

@end