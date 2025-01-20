@interface SMTAttachmentsDownload
+ (void)initialize;
- (SMTAttachmentsDownload)initWithQueue:(id)a3;
- (void)cancel;
- (void)downloadAttachments:(id)a3 completion:(id)a4;
@end

@implementation SMTAttachmentsDownload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)downloadAttachments:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007E28;
  block[3] = &unk_10003D018;
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)cancel
{
  [(NSURLSession *)self->_session invalidateAndCancel];
  session = self->_session;
  self->_session = 0;
}

- (SMTAttachmentsDownload)initWithQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SMTAttachmentsDownload;
  id v6 = [(SMTAttachmentsDownload *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = +[NSURLSessionConfiguration defaultSessionConfiguration];
    [v8 setAllowsCellularAccess:0];
    [v8 setNetworkServiceType:3];
    id v9 = objc_alloc_init((Class)NSOperationQueue);
    [v9 setUnderlyingQueue:v7->_queue];
    uint64_t v10 = +[NSURLSession sessionWithConfiguration:v8 delegate:v7 delegateQueue:v9];
    session = v7->_session;
    v7->_session = (NSURLSession *)v10;
  }
  return v7;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_1000443B0 = (uint64_t)os_log_create("com.apple.speech.speechmodeltraining", "SMTAttachmentsDownload");
    _objc_release_x1();
  }
}

@end