@interface ODRPreallocatedFile
- (void)dealloc;
@end

@implementation ODRPreallocatedFile

- (void)dealloc
{
  int fileDescriptor = self->_fileDescriptor;
  if (fileDescriptor)
  {
    close(fileDescriptor);
    self->_int fileDescriptor = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ODRPreallocatedFile;
  [(ODRPreallocatedFile *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end