@interface ASDTIOPAudioIOBufferDevice
+ (id)forIOObject:(unsigned int)a3 andIDValue:(id)a4;
- (BOOL)open;
- (char)ioBuffer;
- (char)mapIOBuffer;
- (id).cxx_construct;
- (id)initForIOObject:(unsigned int)a3 andIDValue:(id)a4;
- (unsigned)ioBufferSize;
- (void)close;
- (void)mapIOBuffer;
- (void)open;
- (void)releaseIOBuffer;
- (void)setIoBuffer:(char *)a3;
- (void)setIoBufferSize:(unsigned int)a3;
@end

@implementation ASDTIOPAudioIOBufferDevice

+ (id)forIOObject:(unsigned int)a3 andIDValue:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initForIOObject:v4 andIDValue:v6];

  return v7;
}

- (id)initForIOObject:(unsigned int)a3 andIDValue:(id)a4
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v4 = a4;
  operator new();
}

- (BOOL)open
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  value = self->_userClient.__ptr_.__value_;
  if (!value) {
    -[ASDTIOPAudioIOBufferDevice open]();
  }
  id v4 = [(ASDTIOService *)self idValue];
  [v4 clientType];
  char v5 = ASDT::IOUserClient::OpenConnection((ASDT::IOUserClient *)value);

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = ASDTIOPLogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = [(ASDTIOService *)self idValue];
      [(ASDTIOPAudioIOBufferDevice *)v7 open];
    }
  }
  return v5;
}

- (void)close
{
}

- (char)mapIOBuffer
{
  if (!self->_userClient.__ptr_.__value_) {
    -[ASDTIOPAudioIOBufferDevice mapIOBuffer]();
  }
  [(ASDTIOPAudioIOBufferDevice *)self releaseIOBuffer];
  value = self->_userClient.__ptr_.__value_;
  p_descriptor = &self->_descriptor;
  if (ASDT::IOPAudio::IOBuffer::UserClient::MapIOBuffer((ASDT::IOPAudio::IOBuffer::UserClient *)value, p_descriptor)) {
    return p_descriptor->mBuffer;
  }
  else {
    return 0;
  }
}

- (unsigned)ioBufferSize
{
  return self->_descriptor.mSizeBytes;
}

- (char)ioBuffer
{
  return self->_descriptor.mBuffer;
}

- (void)releaseIOBuffer
{
}

- (void)setIoBufferSize:(unsigned int)a3
{
  self->_ioBufferSize = a3;
}

- (void)setIoBuffer:(char *)a3
{
  self->_ioBuffer = a3;
}

- (void).cxx_destruct
{
  value = self->_userClient.__ptr_.__value_;
  self->_userClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((_DWORD *)self + 10) = 0;
  return self;
}

- (void)initForIOObject:(os_log_t)log andIDValue:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_248A68000, log, OS_LOG_TYPE_ERROR, "ASDTIOPAudioIOBufferDevice: Failed to create IOBuffer user client", v1, 2u);
}

- (void)open
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_248A68000, log, OS_LOG_TYPE_ERROR, "%@: Failed to open connection to IOBuffer user client", buf, 0xCu);
}

- (void)mapIOBuffer
{
}

@end