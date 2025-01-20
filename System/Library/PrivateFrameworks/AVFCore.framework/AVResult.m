@interface AVResult
- (AVResult)init;
- (BOOL)isFailed;
- (void)dealloc;
- (void)getStatus:(int64_t *)a3 error:(id *)a4;
- (void)markAsCompleted;
- (void)markAsFailedWithError:(id)a3;
@end

@implementation AVResult

- (BOOL)isFailed
{
  uint64_t v3 = 0;
  [(AVResult *)self getStatus:&v3 error:0];
  return v3 == 2;
}

- (void)getStatus:(int64_t *)a3 error:(id *)a4
{
  MEMORY[0x199715030](self->_ivarAccessLock, a2);
  if (a3) {
    *a3 = self->_status;
  }
  if (a4) {
    *a4 = (id)[(NSError *)self->_error copy];
  }
  JUMPOUT(0x199715040);
}

- (AVResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)AVResult;
  v2 = [(AVResult *)&v6 init];
  if (v2)
  {
    uint64_t v3 = FigSimpleMutexCreate();
    v2->_status = 0;
    v2->_error = 0;
    v2->_ivarAccessLock = (OpaqueFigSimpleMutex *)v3;
    v4 = v2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)dealloc
{
  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)AVResult;
  [(AVResult *)&v3 dealloc];
}

- (void)markAsCompleted
{
  MEMORY[0x199715030](self->_ivarAccessLock, a2);
  self->_status = 1;
  JUMPOUT(0x199715040);
}

- (void)markAsFailedWithError:(id)a3
{
  MEMORY[0x199715030](self->_ivarAccessLock, a2);
  self->_status = 2;
  self->_error = (NSError *)[a3 copy];
  JUMPOUT(0x199715040);
}

@end