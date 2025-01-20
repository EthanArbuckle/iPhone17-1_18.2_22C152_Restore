@interface AVCapturePreparedPhotoSettingsArrayRequest
+ (id)preparedPhotoSettingsArrayRequestWithArray:(id)a3 completionHandler:(id)a4;
- (BOOL)isCompleted;
- (NSArray)photoSettingsArray;
- (id)_initWithArray:(id)a3 completionHandler:(id)a4;
- (id)completionHandler;
- (unint64_t)requestID;
- (void)_setRequestID:(unint64_t)a3;
- (void)dealloc;
- (void)setCompleted:(BOOL)a3;
@end

@implementation AVCapturePreparedPhotoSettingsArrayRequest

- (unint64_t)requestID
{
  return self->_requestID;
}

- (NSArray)photoSettingsArray
{
  return self->_photoSettingsArray;
}

+ (id)preparedPhotoSettingsArrayRequestWithArray:(id)a3 completionHandler:(id)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithArray:a3 completionHandler:a4];

  return v4;
}

- (id)_initWithArray:(id)a3 completionHandler:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVCapturePreparedPhotoSettingsArrayRequest;
  v6 = [(AVCapturePreparedPhotoSettingsArrayRequest *)&v8 init];
  if (v6)
  {
    v6->_requestID = +[AVCapturePhotoSettings uniqueID];
    v6->_photoSettingsArray = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:a3 copyItems:1];
    v6->_completionHandler = (id)[a4 copy];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCapturePreparedPhotoSettingsArrayRequest;
  [(AVCapturePreparedPhotoSettingsArrayRequest *)&v3 dealloc];
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)_setRequestID:(unint64_t)a3
{
  self->_requestID = a3;
}

@end