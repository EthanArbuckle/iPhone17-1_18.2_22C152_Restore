@interface BUZipFileDescriptorWrapper
- (BUReadChannel)readChannel;
- (BUZipFileDescriptorWrapper)init;
- (BUZipFileDescriptorWrapper)initWithFileDescriptor:(int)a3 queue:(id)a4;
- (OS_dispatch_group)accessGroup;
- (int)fileDescriptor;
- (void)beginAccess;
- (void)dealloc;
- (void)endAccess;
- (void)setAccessGroup:(id)a3;
- (void)waitForAccessToEnd;
@end

@implementation BUZipFileDescriptorWrapper

- (BUZipFileDescriptorWrapper)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = objc_msgSend_stringWithFormat_(NSString, a2, @"%@: %s", @"Do not call method", "-[BUZipFileDescriptorWrapper init]");
  objc_msgSend_exceptionWithName_reason_userInfo_(v2, v5, v3, v4, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BUZipFileDescriptorWrapper)initWithFileDescriptor:(int)a3 queue:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ((v4 & 0x80000000) == 0)
  {
    v18.receiver = self;
    v18.super_class = (Class)BUZipFileDescriptorWrapper;
    v7 = [(BUZipFileDescriptorWrapper *)&v18 init];
    self = v7;
    if (!v7)
    {
      close(v4);
      goto LABEL_7;
    }
    v7->_fileDescriptor = v4;
    v8 = [BUFileIOChannel alloc];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = sub_21E1DADE8;
    v16[3] = &unk_26449DD10;
    int v17 = v4;
    v10 = (BUReadChannel *)objc_msgSend_initForReadingDescriptor_queue_cleanupHandler_(v8, v9, v4, v6, v16);
    readChannel = self->_readChannel;
    self->_readChannel = v10;

    if (self->_readChannel)
    {
      v12 = (OS_dispatch_group *)dispatch_group_create();
      accessGroup = self->_accessGroup;
      self->_accessGroup = v12;

LABEL_7:
      self = self;
      v14 = self;
      goto LABEL_8;
    }
  }
  v14 = 0;
LABEL_8:

  return v14;
}

- (void)dealloc
{
  objc_msgSend_close(self->_readChannel, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)BUZipFileDescriptorWrapper;
  [(BUZipFileDescriptorWrapper *)&v4 dealloc];
}

- (void)beginAccess
{
}

- (void)endAccess
{
}

- (void)waitForAccessToEnd
{
}

- (int)fileDescriptor
{
  return self->_fileDescriptor;
}

- (BUReadChannel)readChannel
{
  return self->_readChannel;
}

- (OS_dispatch_group)accessGroup
{
  return self->_accessGroup;
}

- (void)setAccessGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessGroup, 0);

  objc_storeStrong((id *)&self->_readChannel, 0);
}

@end