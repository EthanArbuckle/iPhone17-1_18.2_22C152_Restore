@interface MTLLoadedFile
- (MTLLoadedFile)initWithData:(id)a3 parent:(void *)a4;
- (NSData)contents;
- (void)dealloc;
@end

@implementation MTLLoadedFile

- (void)dealloc
{
  if (self->_isCached) {
    LoaderGlobalState::deallocFile((LoaderGlobalState *)self->_parent, self);
  }

  v3.receiver = self;
  v3.super_class = (Class)MTLLoadedFile;
  [(MTLLoadedFile *)&v3 dealloc];
}

- (MTLLoadedFile)initWithData:(id)a3 parent:(void *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MTLLoadedFile;
  v6 = [(MTLLoadedFile *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_fileData = (NSData *)a3;
    v6->_parent = a4;
  }
  else
  {
  }
  return v7;
}

- (NSData)contents
{
  return self->_fileData;
}

@end