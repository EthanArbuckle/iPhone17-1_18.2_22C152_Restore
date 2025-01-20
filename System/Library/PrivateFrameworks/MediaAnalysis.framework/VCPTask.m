@interface VCPTask
- (BOOL)isCancelled;
- (PHPhotoLibrary)photoLibrary;
- (VCPTask)init;
- (VCPTask)initWithPhotoLibrary:(id)a3;
- (id)cancel;
- (id)progressHandler;
- (int)error;
- (int)mainInternal;
- (void)main;
- (void)setCancel:(id)a3;
- (void)setProgressHandler:(id)a3;
@end

@implementation VCPTask

- (VCPTask)init
{
  return 0;
}

- (VCPTask)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VCPTask;
  v6 = [(VCPTask *)&v10 init];
  v7 = v6;
  if (v6)
  {
    id cancel = v6->_cancel;
    v6->_id cancel = &stru_10021F208;

    v7->_error = 0;
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
  }

  return v7;
}

- (BOOL)isCancelled
{
  v5.receiver = self;
  v5.super_class = (Class)VCPTask;
  if ([(VCPTask *)&v5 isCancelled])
  {
    LOBYTE(cancel) = 1;
  }
  else
  {
    id cancel = (uint64_t (**)(void))self->_cancel;
    if (cancel) {
      LOBYTE(cancel) = cancel[2]();
    }
  }
  return (char)cancel;
}

- (int)mainInternal
{
  return -4;
}

- (void)main
{
  self->_error = [(VCPTask *)self mainInternal];
}

- (id)cancel
{
  return self->_cancel;
}

- (void)setCancel:(id)a3
{
}

- (int)error
{
  return self->_error;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong(&self->_cancel, 0);
}

@end