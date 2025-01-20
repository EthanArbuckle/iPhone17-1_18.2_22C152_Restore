@interface VCPRequestResetFaceClusteringStateTask
+ (id)taskWithPhotoLibraryURL:(id)a3 andProgressHandler:(id)a4 andReply:(id)a5;
- (BOOL)autoCancellable;
- (BOOL)isCanceled;
- (VCPRequestResetFaceClusteringStateTask)initWithPhotoLibraryURL:(id)a3 andProgressHandler:(id)a4 andReply:(id)a5;
- (float)resourceRequirement;
- (id)cancelBlock;
- (int)run;
- (void)cancel;
- (void)dealloc;
- (void)setCancelBlock:(id)a3;
@end

@implementation VCPRequestResetFaceClusteringStateTask

- (VCPRequestResetFaceClusteringStateTask)initWithPhotoLibraryURL:(id)a3 andProgressHandler:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VCPRequestResetFaceClusteringStateTask;
  v10 = [(VCPRequestResetFaceClusteringStateTask *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_photoLibraryURL, a3);
    id v12 = objc_retainBlock(v9);
    id reply = v11->_reply;
    v11->_id reply = v12;
  }
  return v11;
}

+ (id)taskWithPhotoLibraryURL:(id)a3 andProgressHandler:(id)a4 andReply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibraryURL:v7 andProgressHandler:v8 andReply:v9];

  return v10;
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
    id v7 = +[NSString stringWithFormat:@"%@ canceled", v6];
    id v12 = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v9 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v8];
    reply[2](reply, 0, v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)VCPRequestResetFaceClusteringStateTask;
  [(VCPRequestResetFaceClusteringStateTask *)&v10 dealloc];
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
    if (objc_msgSend(v4, "mad_useVUGallery"))
    {
      v5 = objc_msgSend(v4, "mad_allFacesFetchOptions");
      v6 = +[PHFace fetchFacesWithOptions:v5];
      if ([v6 count])
      {
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10013FF7C;
        v26[3] = &unk_100219D70;
        id v27 = v6;
        v28 = self;
        id v25 = 0;
        unsigned __int8 v7 = [v4 performChangesAndWait:v26 error:&v25];
        id v8 = v25;

        if ((v7 & 1) == 0)
        {
          (*((void (**)(void))self->_reply + 2))();
          int v9 = [v8 code];
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        id v8 = 0;
      }
      +[PNPersonPromoter setProcessed:0 forLibrary:v4];
      v23[0] = 0;
      v23[1] = v23;
      v23[2] = 0x2020000000;
      int v24 = 0;
      if ((objc_msgSend(v4, "vcp_isSyndicationLibrary") & 1) == 0)
      {
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1001400BC;
        v22[3] = &unk_10021E928;
        v22[4] = v23;
        v16 = objc_retainBlock(v22);
        v17 = objc_msgSend(v4, "vcp_visionCacheStorageDirectoryURL");
        v18 = [v17 URLByAppendingPathComponent:@"VUIndex.sqlite"];
        ((void (*)(void *, void *))v16[2])(v16, v18);

        v19 = [v17 URLByAppendingPathComponent:@"VUIndex.sqlite-shm"];
        ((void (*)(void *, void *))v16[2])(v16, v19);

        v20 = [v17 URLByAppendingPathComponent:@"VUIndex.sqlite-wal"];
        ((void (*)(void *, void *))v16[2])(v16, v20);
      }
      (*((void (**)(void))self->_reply + 2))();
      _Block_object_dispose(v23, 8);
      int v9 = 1;
      goto LABEL_12;
    }
    v14 = +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:v4];
    objc_super v15 = +[VCPFaceProcessingServiceWorker workerWithPhotoLibrary:v4 andContext:v14];
    [v15 resetFaceClusteringStateWithContext:&__NSDictionary0__struct reply:self->_reply];

    int v9 = 0;
  }
  else
  {
    id reply = (void (**)(id, void, void *))self->_reply;
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v11 = +[NSString stringWithFormat:@"Failed to find client specified Photos Library (%@)", self->_photoLibraryURL];
    v30 = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    v13 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v12];
    reply[2](reply, 0, v13);

    int v9 = -50;
  }
LABEL_13:

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