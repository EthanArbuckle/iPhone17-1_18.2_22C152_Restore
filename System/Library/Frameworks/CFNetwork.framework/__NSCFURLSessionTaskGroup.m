@interface __NSCFURLSessionTaskGroup
- (NSURLSession)_groupSession;
- (NSURLSessionConfiguration)_groupConfiguration;
- (id)dataTaskWithRequest:(id)a3;
- (id)dataTaskWithRequest:(id)a3 completionHandler:(id)a4;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)uploadTaskWithStreamedRequest:(id)a3;
- (void)dealloc;
@end

@implementation __NSCFURLSessionTaskGroup

- (id)uploadTaskWithStreamedRequest:(id)a3
{
  v5 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], self);
  v7 = v5;
  if (v5) {
    objc_setProperty_atomic(v5, v6, a3, 16);
  }
  groupSession_ivar = self->_groupSession_ivar;
  id v9 = v7;

  return [(NSURLSession *)groupSession_ivar _uploadTaskWithTaskForClass:v9];
}

- (id)dataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], self);
  id v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, a3, 16);
    objc_setProperty_atomic_copy(v9, v10, a4, 48);
  }
  groupSession_ivar = self->_groupSession_ivar;
  id v12 = v9;

  return [(NSURLSession *)groupSession_ivar _dataTaskWithTaskForClass:v12];
}

- (id)dataTaskWithRequest:(id)a3
{
  v5 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], self);
  v7 = v5;
  if (v5) {
    objc_setProperty_atomic(v5, v6, a3, 16);
  }
  groupSession_ivar = self->_groupSession_ivar;
  id v9 = v7;

  return [(NSURLSession *)groupSession_ivar _dataTaskWithTaskForClass:v9];
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  Name = sel_getName(a3);
  NSLog(&cfstr_TaskgroupForwa.isa, Name, self->_groupSession_ivar);
  return self->_groupSession_ivar;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)__NSCFURLSessionTaskGroup;
  [(__NSCFURLSessionTaskGroup *)&v3 dealloc];
}

- (NSURLSession)_groupSession
{
  return self->_groupSession_ivar;
}

- (NSURLSessionConfiguration)_groupConfiguration
{
  return self->_groupConfiguration_ivar;
}

@end