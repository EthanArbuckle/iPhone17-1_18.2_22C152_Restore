@interface MTLIOAccelDeviceShmem
- (MTLIOAccelDeviceShmem)initWithDevice:(id)a3 shmemSize:(unsigned int)a4;
- (unsigned)shmemID;
- (unsigned)shmemSize;
- (void)dealloc;
- (void)virtualAddress;
@end

@implementation MTLIOAccelDeviceShmem

- (MTLIOAccelDeviceShmem)initWithDevice:(id)a3 shmemSize:(unsigned int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MTLIOAccelDeviceShmem;
  v5 = [(MTLIOAccelDeviceShmem *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_device = (MTLIOAccelDevice *)a3;
    [a3 sharedRef];
    if (IOAccelSharedCreateDeviceShmem())
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  if (self->_shmemID)
  {
    [(MTLIOAccelDevice *)self->_device sharedRef];
    IOAccelSharedDestroyDeviceShmem();
    self->_shmemID = 0;
  }
  self->_device = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelDeviceShmem;
  [(MTLIOAccelDeviceShmem *)&v3 dealloc];
}

- (void)virtualAddress
{
  return self->_virtualAddress;
}

- (unsigned)shmemID
{
  return self->_shmemID;
}

- (unsigned)shmemSize
{
  return self->_shmemSize;
}

@end