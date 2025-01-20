@interface VCPRequestSuggestedPersonsTask
+ (id)taskWithPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 andPhotoLibraryURL:(id)a6 andProgressHandler:(id)a7 andReply:(id)a8;
- (BOOL)autoCancellable;
- (BOOL)isCanceled;
- (VCPRequestSuggestedPersonsTask)initWithPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 andPhotoLibraryURL:(id)a6 andProgressHandler:(id)a7 andReply:(id)a8;
- (float)resourceRequirement;
- (id)cancelBlock;
- (int)run;
- (void)cancel;
- (void)dealloc;
- (void)setCancelBlock:(id)a3;
@end

@implementation VCPRequestSuggestedPersonsTask

- (VCPRequestSuggestedPersonsTask)initWithPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 andPhotoLibraryURL:(id)a6 andProgressHandler:(id)a7 andReply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)VCPRequestSuggestedPersonsTask;
  v19 = [(VCPRequestSuggestedPersonsTask *)&v24 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_personLocalIdentifier, a3);
    objc_storeStrong((id *)&v20->_toBeConfirmedPersonSuggestions, a4);
    objc_storeStrong((id *)&v20->_toBeRejectedPersonSuggestions, a5);
    objc_storeStrong((id *)&v20->_photoLibraryURL, a6);
    id v21 = objc_retainBlock(v18);
    id reply = v20->_reply;
    v20->_id reply = v21;
  }
  return v20;
}

+ (id)taskWithPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 andPhotoLibraryURL:(id)a6 andProgressHandler:(id)a7 andReply:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = [[VCPRequestSuggestedPersonsTask alloc] initWithPersonWithLocalIdentifier:v13 toBeConfirmedPersonSuggestions:v14 toBeRejectedPersonSuggestions:v15 andPhotoLibraryURL:v16 andProgressHandler:v17 andReply:v18];

  return v19;
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
    v12 = v7;
    v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    v9 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v8];
    reply[2](reply, 0, v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)VCPRequestSuggestedPersonsTask;
  [(VCPRequestSuggestedPersonsTask *)&v10 dealloc];
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
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10013C2B8;
    v16[3] = &unk_100219D98;
    v16[4] = self;
    v7 = objc_retainBlock(v16);
    personLocalIdentifier = self->_personLocalIdentifier;
    toBeConfirmedPersonSuggestions = self->_toBeConfirmedPersonSuggestions;
    toBeRejectedPersonSuggestions = self->_toBeRejectedPersonSuggestions;
    NSErrorUserInfoKey v11 = +[NSDictionary dictionary];
    [v6 suggestPersonsForPersonWithLocalIdentifier:personLocalIdentifier toBeConfirmedPersonSuggestions:toBeConfirmedPersonSuggestions toBeRejectedPersonSuggestions:toBeRejectedPersonSuggestions context:v11 cancelOrExtendTimeoutBlock:v7 reply:self->_reply];

    int v12 = 0;
  }
  else
  {
    id reply = (void (**)(id, void, void *))self->_reply;
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    v5 = +[NSString stringWithFormat:@"Failed to find client specified Photos Library (%@)", self->_photoLibraryURL];
    id v18 = v5;
    v6 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v14 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v6];
    reply[2](reply, 0, v14);

    int v12 = -50;
  }

  return v12;
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
  objc_storeStrong((id *)&self->_toBeRejectedPersonSuggestions, 0);
  objc_storeStrong((id *)&self->_toBeConfirmedPersonSuggestions, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifier, 0);
}

@end