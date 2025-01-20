@interface VCPRequestPersonPromoterStatusTask
+ (id)taskWithAdvancedFlag:(BOOL)a3 andPhotoLibraryURL:(id)a4 andProgressHandler:(id)a5 andReply:(id)a6;
- (BOOL)autoCancellable;
- (BOOL)isCanceled;
- (VCPRequestPersonPromoterStatusTask)initWithAdvancedFlag:(BOOL)a3 andPhotoLibraryURL:(id)a4 andProgressHandler:(id)a5 andReply:(id)a6;
- (float)resourceRequirement;
- (id)cancelBlock;
- (int)run;
- (void)cancel;
- (void)dealloc;
- (void)setCancelBlock:(id)a3;
@end

@implementation VCPRequestPersonPromoterStatusTask

- (VCPRequestPersonPromoterStatusTask)initWithAdvancedFlag:(BOOL)a3 andPhotoLibraryURL:(id)a4 andProgressHandler:(id)a5 andReply:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)VCPRequestPersonPromoterStatusTask;
  v12 = [(VCPRequestPersonPromoterStatusTask *)&v17 init];
  v13 = v12;
  if (v12)
  {
    v12->_advancedStatus = a3;
    objc_storeStrong((id *)&v12->_photoLibraryURL, a4);
    id v14 = objc_retainBlock(v11);
    id reply = v13->_reply;
    v13->_id reply = v14;
  }
  return v13;
}

+ (id)taskWithAdvancedFlag:(BOOL)a3 andPhotoLibraryURL:(id)a4 andProgressHandler:(id)a5 andReply:(id)a6
{
  BOOL v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [objc_alloc((Class)objc_opt_class()) initWithAdvancedFlag:v8 andPhotoLibraryURL:v9 andProgressHandler:v10 andReply:v11];

  return v12;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0)
  {
    id reply = (void (**)(id, void, void *))self->_reply;
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = +[NSString stringWithFormat:@"%@ canceled", v6];
    id v12 = v7;
    BOOL v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v9 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v8];
    reply[2](reply, 0, v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)VCPRequestPersonPromoterStatusTask;
  [(VCPRequestPersonPromoterStatusTask *)&v10 dealloc];
}

- (float)resourceRequirement
{
  return 0.55;
}

- (void)cancel
{
}

- (BOOL)isCanceled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_cancel);
  if (v2)
  {
    LOBYTE(cancelBlock) = 1;
  }
  else
  {
    cancelBlock = (uint64_t (**)(void))self->_cancelBlock;
    if (cancelBlock) {
      LOBYTE(cancelBlock) = cancelBlock[2]();
    }
  }
  return (char)cancelBlock;
}

- (int)run
{
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  unsigned __int8 v3 = +[VCPPhotoLibraryManager sharedManager];
  v4 = [v3 photoLibraryWithURL:self->_photoLibraryURL];

  if (v4)
  {
    v5 = +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:v4];
    v6 = +[VCPFaceProcessingServiceWorker workerWithPhotoLibrary:v4 andContext:v5];
    uint64_t v12 = VCPMediaAnalysisServicePersonPromoterRequestAdvancedStatusKey;
    v7 = +[NSNumber numberWithBool:self->_advancedStatus];
    v13 = v7;
    BOOL v8 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [v6 personPromoterStatusWithContext:v8 reply:self->_reply];

    int v9 = 0;
  }
  else
  {
    id reply = (void (**)(id, void, void *))self->_reply;
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    v5 = +[NSString stringWithFormat:@"Failed to find client specified Photos Library (%@)", self->_photoLibraryURL];
    v15 = v5;
    v6 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v7 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v6];
    reply[2](reply, 0, v7);
    int v9 = -50;
  }

  return v9;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong(&self->_reply, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_photoLibraryURL, 0);
}

@end