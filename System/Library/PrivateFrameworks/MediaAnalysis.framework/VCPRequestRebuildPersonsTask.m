@interface VCPRequestRebuildPersonsTask
+ (id)taskWithLocalIdentifiers:(id)a3 andPhotoLibraryURL:(id)a4 andProgressHandler:(id)a5 andReply:(id)a6;
- (BOOL)autoCancellable;
- (BOOL)isCanceled;
- (VCPRequestRebuildPersonsTask)initWithLocalIdentifiers:(id)a3 andPhotoLibraryURL:(id)a4 andProgressHandler:(id)a5 andReply:(id)a6;
- (float)resourceRequirement;
- (id)cancelBlock;
- (int)run;
- (void)cancel;
- (void)dealloc;
- (void)setCancelBlock:(id)a3;
@end

@implementation VCPRequestRebuildPersonsTask

- (VCPRequestRebuildPersonsTask)initWithLocalIdentifiers:(id)a3 andPhotoLibraryURL:(id)a4 andProgressHandler:(id)a5 andReply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)VCPRequestRebuildPersonsTask;
  v13 = [(VCPRequestRebuildPersonsTask *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_personLocalIdentifiers, a3);
    objc_storeStrong((id *)&v14->_photoLibraryURL, a4);
    id v15 = objc_retainBlock(v12);
    id reply = v14->_reply;
    v14->_id reply = v15;
  }
  return v14;
}

+ (id)taskWithLocalIdentifiers:(id)a3 andPhotoLibraryURL:(id)a4 andProgressHandler:(id)a5 andReply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [objc_alloc((Class)objc_opt_class()) initWithLocalIdentifiers:v9 andPhotoLibraryURL:v10 andProgressHandler:v11 andReply:v12];

  return v13;
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
    v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v9 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v8];
    reply[2](reply, 0, v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)VCPRequestRebuildPersonsTask;
  [(VCPRequestRebuildPersonsTask *)&v10 dealloc];
}

- (float)resourceRequirement
{
  return 1.0;
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
    v5 = +[NSMutableDictionary dictionary];
    if ([(NSArray *)self->_personLocalIdentifiers count]) {
      [v5 setObject:self->_personLocalIdentifiers forKeyedSubscript:VCPMediaAnalysisServiceRebuildPersonWithLocalIdentifierKey];
    }
    v6 = +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:v4];
    v7 = +[VCPFaceProcessingServiceWorker workerWithPhotoLibrary:v4 andContext:v6];
    id reply = self->_reply;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100141078;
    v12[3] = &unk_100219D98;
    v12[4] = self;
    [v7 rebuildPersonsWithContext:v5 reply:reply extendTimeout:&stru_10021E968 cancel:v12];
    int v9 = 0;
  }
  else
  {
    objc_super v10 = (void (**)(id, void, void *))self->_reply;
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    v5 = +[NSString stringWithFormat:@"Failed to find client specified Photos Library (%@)", self->_photoLibraryURL];
    v14 = v5;
    v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    v7 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v6];
    v10[2](v10, 0, v7);
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
  objc_storeStrong((id *)&self->_personLocalIdentifiers, 0);
}

@end