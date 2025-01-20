@interface ASDTIOPAudioIsolatedIOBufferDevice
+ (id)forIOObject:(unsigned int)a3 andIDValue:(id)a4;
- (BOOL)getStreamDescription:(AudioStreamBasicDescription *)a3;
- (BOOL)open;
- (BOOL)setStreamDescription:(const AudioStreamBasicDescription *)a3 withBufferFrameSize:(unsigned int)a4;
- (BOOL)setupClientIO:(unint64_t)a3 withBufferFrameSize:(unsigned int)a4;
- (BOOL)setupIO;
- (BOOL)teardownClientIO:(unint64_t)a3;
- (BOOL)teardownIO;
- (id).cxx_construct;
- (id)initForIOObject:(unsigned int)a3 andIDValue:(id)a4;
- (void)close;
- (void)open;
- (void)setupIO;
- (void)teardownIO;
- (void)userClient;
@end

@implementation ASDTIOPAudioIsolatedIOBufferDevice

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
    -[ASDTIOPAudioIsolatedIOBufferDevice open]();
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
      [(ASDTIOPAudioIsolatedIOBufferDevice *)v7 open];
    }
  }
  return v5;
}

- (void)close
{
}

- (void)userClient
{
  return self->_userClient.__ptr_.__value_;
}

- (BOOL)setStreamDescription:(const AudioStreamBasicDescription *)a3 withBufferFrameSize:(unsigned int)a4
{
  value = self->_userClient.__ptr_.__value_;
  if (!value) {
    -[ASDTIOPAudioIsolatedIOBufferDevice setStreamDescription:withBufferFrameSize:]();
  }
  if (!a3) {
    -[ASDTIOPAudioIsolatedIOBufferDevice setStreamDescription:withBufferFrameSize:]();
  }
  return ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetStreamDescription((ASDT::IOPAudio::IsolatedIOBuffer::UserClient *)value, a3, a4);
}

- (BOOL)getStreamDescription:(AudioStreamBasicDescription *)a3
{
  value = self->_userClient.__ptr_.__value_;
  if (!value) {
    -[ASDTIOPAudioIsolatedIOBufferDevice getStreamDescription:]();
  }
  if (!a3) {
    -[ASDTIOPAudioIsolatedIOBufferDevice getStreamDescription:]();
  }
  return ASDT::IOPAudio::IsolatedIOBuffer::UserClient::GetStreamDescription((ASDT::IOPAudio::IsolatedIOBuffer::UserClient *)value, a3);
}

- (BOOL)setupIO
{
  value = self->_userClient.__ptr_.__value_;
  if (!value) {
    -[ASDTIOPAudioIsolatedIOBufferDevice setupIO]();
  }
  return ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetupIO((ASDT::IOPAudio::IsolatedIOBuffer::UserClient *)value);
}

- (BOOL)teardownIO
{
  value = self->_userClient.__ptr_.__value_;
  if (!value) {
    -[ASDTIOPAudioIsolatedIOBufferDevice teardownIO]();
  }
  return ASDT::IOPAudio::IsolatedIOBuffer::UserClient::TeardownIO((ASDT::IOPAudio::IsolatedIOBuffer::UserClient *)value);
}

- (BOOL)setupClientIO:(unint64_t)a3 withBufferFrameSize:(unsigned int)a4
{
  value = self->_userClient.__ptr_.__value_;
  if (!value) {
    -[ASDTIOPAudioIsolatedIOBufferDevice setupClientIO:withBufferFrameSize:]();
  }
  return ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetupClientIO((ASDT::IOPAudio::IsolatedIOBuffer::UserClient *)value, a3, a4);
}

- (BOOL)teardownClientIO:(unint64_t)a3
{
  value = self->_userClient.__ptr_.__value_;
  if (!value) {
    -[ASDTIOPAudioIsolatedIOBufferDevice teardownClientIO:]();
  }
  return ASDT::IOPAudio::IsolatedIOBuffer::UserClient::TeardownClientIO((ASDT::IOPAudio::IsolatedIOBuffer::UserClient *)value, a3);
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
  return self;
}

- (void)initForIOObject:(uint64_t)a1 andIDValue:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_248A68000, a2, OS_LOG_TYPE_ERROR, "%@: Failed to create IsolatedIOBuffer user client", (uint8_t *)&v2, 0xCu);
}

- (void)open
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_248A68000, log, OS_LOG_TYPE_ERROR, "%@: Failed to open connection to IsolatedIOBuffer user client", buf, 0xCu);
}

- (void)setStreamDescription:withBufferFrameSize:.cold.1()
{
}

- (void)setStreamDescription:withBufferFrameSize:.cold.2()
{
}

- (void)getStreamDescription:.cold.1()
{
}

- (void)getStreamDescription:.cold.2()
{
}

- (void)setupIO
{
}

- (void)teardownIO
{
}

- (void)setupClientIO:withBufferFrameSize:.cold.1()
{
}

- (void)teardownClientIO:.cold.1()
{
}

@end