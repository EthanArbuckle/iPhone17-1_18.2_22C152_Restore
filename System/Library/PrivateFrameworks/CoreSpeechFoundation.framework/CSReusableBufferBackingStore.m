@interface CSReusableBufferBackingStore
- (BOOL)configureWithBytes:(const void *)a3 length:(unint64_t)a4;
- (CSReusableBufferBackingStore)initWithBuffer:(void *)a3 bufferSize:(unint64_t)a4 deallocator:(id)a5;
- (const)bytes;
- (unint64_t)recycleHostTime;
- (void)dealloc;
- (void)setRecycleHostTime:(unint64_t)a3;
@end

@implementation CSReusableBufferBackingStore

- (void).cxx_destruct
{
}

- (void)setRecycleHostTime:(unint64_t)a3
{
  self->_recycleHostTime = a3;
}

- (unint64_t)recycleHostTime
{
  return self->_recycleHostTime;
}

- (BOOL)configureWithBytes:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    v4 = CSLogContextFacilityCoreSpeech;
    BOOL v8 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v8) {
      return result;
    }
    int v10 = 136315138;
    v11 = "-[CSReusableBufferBackingStore configureWithBytes:length:]";
    v7 = "%s Failed to allocate buffer since length zero";
    goto LABEL_7;
  }
  if (self->_bufferSize < a4)
  {
    v4 = CSLogContextFacilityCoreSpeech;
    BOOL v5 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v5) {
      return result;
    }
    int v10 = 136315138;
    v11 = "-[CSReusableBufferBackingStore configureWithBytes:length:]";
    v7 = "%s Failed to allocate buffer since length is larger than configuration";
LABEL_7:
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0xCu);
    return 0;
  }
  buffer = self->_buffer;
  if (a3) {
    memmove(buffer, a3, a4);
  }
  else {
    bzero(buffer, a4);
  }
  return 1;
}

- (void)dealloc
{
  deallocator = (void (**)(id, SEL))self->_deallocator;
  if (deallocator) {
    deallocator[2](deallocator, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSReusableBufferBackingStore;
  [(CSReusableBufferBackingStore *)&v4 dealloc];
}

- (CSReusableBufferBackingStore)initWithBuffer:(void *)a3 bufferSize:(unint64_t)a4 deallocator:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CSReusableBufferBackingStore;
  v9 = [(CSReusableBufferBackingStore *)&v14 init];
  int v10 = v9;
  if (v9)
  {
    v9->_buffer = a3;
    v9->_bufferSize = a4;
    uint64_t v11 = [v8 copy];
    id deallocator = v10->_deallocator;
    v10->_id deallocator = (id)v11;
  }
  return v10;
}

- (const)bytes
{
  return self->_buffer;
}

@end