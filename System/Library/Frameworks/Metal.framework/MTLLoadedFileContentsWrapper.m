@interface MTLLoadedFileContentsWrapper
- (MTLLoadedFileContentsWrapper)initWithData:(id)a3;
- (NSData)sourceContents;
- (OS_dispatch_data)dispatchData;
- (const)bytes;
- (unint64_t)length;
- (void)dealloc;
@end

@implementation MTLLoadedFileContentsWrapper

- (unint64_t)length
{
  return [(NSData *)self->_sourceContents length];
}

- (const)bytes
{
  return [(NSData *)self->_sourceContents bytes];
}

- (OS_dispatch_data)dispatchData
{
  return self->_dispatchData;
}

- (MTLLoadedFileContentsWrapper)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTLLoadedFileContentsWrapper;
  v4 = [(MTLLoadedFileContentsWrapper *)&v7 init];
  if (v4)
  {
    v5 = (NSData *)a3;
    v4->_sourceContents = v5;
    v4->_dispatchData = (OS_dispatch_data *)_MTLNSDataToDispatchData(v5, 0);
  }
  return v4;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_dispatchData);

  v3.receiver = self;
  v3.super_class = (Class)MTLLoadedFileContentsWrapper;
  [(MTLLoadedFileContentsWrapper *)&v3 dealloc];
}

- (NSData)sourceContents
{
  return self->_sourceContents;
}

@end