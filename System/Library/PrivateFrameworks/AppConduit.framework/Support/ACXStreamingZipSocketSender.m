@interface ACXStreamingZipSocketSender
+ (id)senderForURL:(id)a3 queue:(id)a4 writingUsingBlock:(id)a5;
- (ACXStreamingZipSocketSender)initWithURL:(id)a3 queue:(id)a4 writerBlock:(id)a5;
- (BOOL)stopWriting;
- (NSError)error;
- (NSURL)url;
- (OS_dispatch_queue)clientQueue;
- (id)progressBlock;
- (id)writerBlock;
- (int64_t)bytesOutput;
- (int64_t)completedBytes;
- (int64_t)totalBytes;
- (void)beginSendingWithCompletionBlock:(id)a3;
- (void)cancelSending;
- (void)setBytesOutput:(int64_t)a3;
- (void)setCompletedBytes:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setProgressBlock:(id)a3;
- (void)setStopWriting:(BOOL)a3;
- (void)setTotalBytes:(int64_t)a3;
@end

@implementation ACXStreamingZipSocketSender

- (ACXStreamingZipSocketSender)initWithURL:(id)a3 queue:(id)a4 writerBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ACXStreamingZipSocketSender;
  v12 = [(ACXStreamingZipSocketSender *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientQueue, a4);
    objc_storeStrong((id *)&v13->_url, a3);
    id v14 = objc_retainBlock(v11);
    id writerBlock = v13->_writerBlock;
    v13->_id writerBlock = v14;
  }
  return v13;
}

+ (id)senderForURL:(id)a3 queue:(id)a4 writingUsingBlock:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)objc_opt_class()) initWithURL:v9 queue:v8 writerBlock:v7];

  return v10;
}

- (void)beginSendingWithCompletionBlock:(id)a3
{
  id v4 = a3;
  qos_class_t v5 = qos_class_self();
  v6 = dispatch_get_global_queue(v5, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005ADE8;
  v8[3] = &unk_10008E198;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  sub_100006BB8(v6, v8);
}

- (void)cancelSending
{
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
}

- (int64_t)bytesOutput
{
  return self->_bytesOutput;
}

- (void)setBytesOutput:(int64_t)a3
{
  self->_bytesOutput = a3;
}

- (int64_t)totalBytes
{
  return self->_totalBytes;
}

- (void)setTotalBytes:(int64_t)a3
{
  self->_totalBytes = a3;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSURL)url
{
  return self->_url;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)stopWriting
{
  return self->_stopWriting;
}

- (void)setStopWriting:(BOOL)a3
{
  self->_stopWriting = a3;
}

- (id)writerBlock
{
  return self->_writerBlock;
}

- (int64_t)completedBytes
{
  return self->_completedBytes;
}

- (void)setCompletedBytes:(int64_t)a3
{
  self->_completedBytes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_writerBlock, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);

  objc_storeStrong(&self->_progressBlock, 0);
}

@end