@interface CAMTransientImageManagerRequest
- (BOOL)isCanceled;
- (BOOL)isFinished;
- (NSString)uuid;
- (id)resultHandler;
- (void)setIsCanceled:(BOOL)a3;
- (void)setIsFinished:(BOOL)a3;
- (void)setResultHandler:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation CAMTransientImageManagerRequest

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void)setResultHandler:(id)a3
{
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (void)setIsCanceled:(BOOL)a3
{
  self->_isCanceled = a3;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end