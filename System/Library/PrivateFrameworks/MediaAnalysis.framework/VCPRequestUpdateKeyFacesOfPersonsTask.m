@interface VCPRequestUpdateKeyFacesOfPersonsTask
+ (id)taskWithLocalIdentifiers:(id)a3 andForceUpdate:(BOOL)a4 andPhotoLibraryURL:(id)a5 andProgressHandler:(id)a6 andReply:(id)a7;
- (BOOL)autoCancellable;
- (BOOL)isCanceled;
- (VCPRequestUpdateKeyFacesOfPersonsTask)initWithLocalIdentifiers:(id)a3 andForceUpdate:(BOOL)a4 andPhotoLibraryURL:(id)a5 andProgressHandler:(id)a6 andReply:(id)a7;
- (float)resourceRequirement;
- (id)cancelBlock;
- (int)run;
- (void)cancel;
- (void)dealloc;
- (void)setCancelBlock:(id)a3;
@end

@implementation VCPRequestUpdateKeyFacesOfPersonsTask

- (VCPRequestUpdateKeyFacesOfPersonsTask)initWithLocalIdentifiers:(id)a3 andForceUpdate:(BOOL)a4 andPhotoLibraryURL:(id)a5 andProgressHandler:(id)a6 andReply:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)VCPRequestUpdateKeyFacesOfPersonsTask;
  v15 = [(VCPRequestUpdateKeyFacesOfPersonsTask *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_personLocalIdentifiers, a3);
    v16->_forceUpdate = a4;
    objc_storeStrong((id *)&v16->_photoLibraryURL, a5);
    id v17 = objc_retainBlock(v14);
    id reply = v16->_reply;
    v16->_id reply = v17;
  }
  return v16;
}

+ (id)taskWithLocalIdentifiers:(id)a3 andForceUpdate:(BOOL)a4 andPhotoLibraryURL:(id)a5 andProgressHandler:(id)a6 andReply:(id)a7
{
  BOOL v10 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [objc_alloc((Class)objc_opt_class()) initWithLocalIdentifiers:v11 andForceUpdate:v10 andPhotoLibraryURL:v12 andProgressHandler:v13 andReply:v14];

  return v15;
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
    v9 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v8];
    reply[2](reply, 0, v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)VCPRequestUpdateKeyFacesOfPersonsTask;
  [(VCPRequestUpdateKeyFacesOfPersonsTask *)&v10 dealloc];
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
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10013C9CC;
    v12[3] = &unk_100219D98;
    v12[4] = self;
    v7 = objc_retainBlock(v12);
    [v6 updateKeyFacesOfPersonsWithLocalIdentifiers:self->_personLocalIdentifiers forceUpdate:self->_forceUpdate context:&__NSDictionary0__struct cancelOrExtendTimeoutBlock:v7 reply:self->_reply];

    int v8 = 0;
  }
  else
  {
    id reply = (void (**)(id, void, void *))self->_reply;
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    v5 = +[NSString stringWithFormat:@"Failed to find client specified Photos Library (%@)", self->_photoLibraryURL];
    id v14 = v5;
    v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    objc_super v10 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v6];
    reply[2](reply, 0, v10);

    int v8 = -50;
  }

  return v8;
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