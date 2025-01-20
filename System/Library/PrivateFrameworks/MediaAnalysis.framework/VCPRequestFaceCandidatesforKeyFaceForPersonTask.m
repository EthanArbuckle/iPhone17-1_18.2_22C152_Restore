@interface VCPRequestFaceCandidatesforKeyFaceForPersonTask
+ (id)taskWithLocalIdentifiers:(id)a3 andPhotoLibraryURL:(id)a4 andProgressHandler:(id)a5 andReply:(id)a6;
- (BOOL)autoCancellable;
- (BOOL)isCanceled;
- (VCPRequestFaceCandidatesforKeyFaceForPersonTask)initWithLocalIdentifiers:(id)a3 andPhotoLibraryURL:(id)a4 andProgressHandler:(id)a5 andReply:(id)a6;
- (float)resourceRequirement;
- (id)cancelBlock;
- (int)run;
- (void)cancel;
- (void)dealloc;
- (void)setCancelBlock:(id)a3;
@end

@implementation VCPRequestFaceCandidatesforKeyFaceForPersonTask

- (VCPRequestFaceCandidatesforKeyFaceForPersonTask)initWithLocalIdentifiers:(id)a3 andPhotoLibraryURL:(id)a4 andProgressHandler:(id)a5 andReply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)VCPRequestFaceCandidatesforKeyFaceForPersonTask;
  v13 = [(VCPRequestFaceCandidatesforKeyFaceForPersonTask *)&v18 init];
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
  v10.super_class = (Class)VCPRequestFaceCandidatesforKeyFaceForPersonTask;
  [(VCPRequestFaceCandidatesforKeyFaceForPersonTask *)&v10 dealloc];
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
    [v6 faceCandidatesforKeyFaceForPersonsWithLocalIdentifiers:self->_personLocalIdentifiers context:&__NSDictionary0__struct reply:self->_reply];

    int v7 = 0;
  }
  else
  {
    id reply = (void (**)(id, void, void *))self->_reply;
    id v9 = +[NSString stringWithFormat:@"Failed to find client specified Photos Library (%@)", self->_photoLibraryURL, NSLocalizedDescriptionKey];
    v14 = v9;
    objc_super v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    NSErrorUserInfoKey v11 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v10];
    reply[2](reply, 0, v11);

    int v7 = -50;
  }

  return v7;
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