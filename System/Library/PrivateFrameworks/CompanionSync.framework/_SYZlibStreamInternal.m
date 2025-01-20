@interface _SYZlibStreamInternal
- (_SYZlibStreamInternal)init;
- (const)outputPtr;
- (int64_t)inputRoom;
- (int64_t)outputAvailable;
- (int64_t)readOutputToBuffer:(void *)a3 length:(int64_t)a4;
- (int64_t)readOutputToStream:(id)a3;
- (int64_t)writeInputFromBuffer:(const void *)a3 length:(int64_t)a4;
- (int64_t)writeInputFromStream:(id)a3;
- (void)dealloc;
- (void)inputPtr;
- (void)lock;
- (void)setInputSize:(int64_t)a3;
- (void)setOutputSize:(int64_t)a3;
- (void)setStatusForStream:(id)a3;
- (void)setZlibError:(int)a3 forStream:(id)a4;
- (void)synchronized:(id)a3;
- (void)unlock;
@end

@implementation _SYZlibStreamInternal

- (_SYZlibStreamInternal)init
{
  v7.receiver = self;
  v7.super_class = (Class)_SYZlibStreamInternal;
  v2 = [(_SYZlibStreamInternal *)&v7 init];
  v3 = v2;
  if (v2)
  {
    *((void *)v2 + 24) = 1024;
    *((void *)v2 + 23) = 1024;
    v4 = v2 + 72;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    *(_OWORD *)(v2 + 120) = 0u;
    *(_OWORD *)(v2 + 136) = 0u;
    *(_OWORD *)(v2 + 152) = 0u;
    *(_OWORD *)(v2 + 168) = 0u;
    *((void *)v2 + 25) = malloc_type_malloc(*((void *)v2 + 23), 0xD5505B01uLL);
    v3[26] = malloc_type_malloc(v3[24], 0x40E0CFA8uLL);
    void *v4 = v3[25];
    *((_DWORD *)v3 + 20) = 0;
    uint64_t v5 = v3[26];
    v3[11] = 0;
    v3[12] = v5;
    *((_DWORD *)v3 + 26) = v3[24];
    v3[14] = 0;
    v3[17] = 0;
    v3[18] = 0;
    *((_DWORD *)v3 + 58) = 0;
  }

  return 0;
}

- (void)dealloc
{
  input = self->_input;
  if (input) {
    free(input);
  }
  output = self->_output;
  if (output) {
    free(output);
  }
  v5.receiver = self;
  v5.super_class = (Class)_SYZlibStreamInternal;
  [(_SYStreamGuts *)&v5 dealloc];
}

- (void)lock
{
}

- (void)unlock
{
}

- (void)synchronized:(id)a3
{
  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)setInputSize:(int64_t)a3
{
  if (self->_inputSize != a3)
  {
    next_in = self->_zStream.next_in;
    input = self->_input;
    int64_t v6 = next_in - (Bytef *)input;
    self->_inputSize = a3;
    objc_super v7 = (char *)malloc_type_realloc(input, a3, 0x99815D9FuLL);
    self->_input = v7;
    self->_zStream.next_in = (Bytef *)&v7[v6];
  }
}

- (void)setOutputSize:(int64_t)a3
{
  unint64_t outputSize = self->_outputSize;
  if (a3 != outputSize)
  {
    p_zStream = &self->_zStream;
    next_out = self->_zStream.next_out;
    output = self->_output;
    int64_t v8 = next_out - (Bytef *)output;
    int v9 = a3 - outputSize;
    self->_unint64_t outputSize = a3;
    v10 = (char *)malloc_type_realloc(output, a3, 0x28E455C7uLL);
    self->_output = v10;
    p_zStream->next_out = (Bytef *)&v10[v8];
    p_zStream->avail_out += v9;
  }
}

- (void)setZlibError:(int)a3 forStream:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  p_zStream = &self->_zStream;
  objc_super v7 = (objc_class *)NSString;
  id v8 = a4;
  int v9 = (void *)[[v7 alloc] initWithUTF8String:p_zStream->msg];
  uint64_t v13 = *MEMORY[0x263F08320];
  v14[0] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v11 = (NSError *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"SYZlibErrorDomain" code:a3 userInfo:v10];

  error = self->super._error;
  self->super._error = v11;

  self->super._status = 7;
  [(_SYStreamGuts *)self postStreamEvent:8 forStream:v8];
}

- (void)setStatusForStream:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_zStream.total_out)
  {
    self->super._status = 2;
  }
  else
  {
    id v6 = v4;
    id v4 = (id)[v4 streamStatus];
    id v5 = v6;
    if (v4 == (id)5)
    {
      self->super._status = 5;
      id v4 = (id)[(_SYStreamGuts *)self postStreamEvent:16 forStream:v6];
      id v5 = v6;
    }
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (int64_t)inputRoom
{
  return self->_inputSize - self->_writeOffset;
}

- (void)inputPtr
{
  return &self->_input[self->_writeOffset];
}

- (int64_t)outputAvailable
{
  return self->_zStream.total_out - self->_readOffset;
}

- (const)outputPtr
{
  return &self->_output[self->_readOffset];
}

- (int64_t)writeInputFromBuffer:(const void *)a3 length:(int64_t)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v8 = [(_SYZlibStreamInternal *)self inputRoom];
  if (v8 < a4) {
    a4 = v8;
  }
  memcpy([(_SYZlibStreamInternal *)self inputPtr], a3, a4);
  self->_zStream.avail_in += a4;
  self->_writeOffset += a4;
  os_unfair_lock_unlock(p_lock);
  return a4;
}

- (int64_t)writeInputFromStream:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  int64_t v6 = objc_msgSend(v5, "read:maxLength:", -[_SYZlibStreamInternal inputPtr](self, "inputPtr"), -[_SYZlibStreamInternal inputRoom](self, "inputRoom"));

  if ((v6 & 0x8000000000000000) == 0)
  {
    self->_zStream.avail_out += v6;
    self->_writeOffset += v6;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (int64_t)readOutputToBuffer:(void *)a3 length:(int64_t)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v8 = [(_SYZlibStreamInternal *)self outputAvailable];
  if (v8 < a4) {
    a4 = v8;
  }
  memcpy(a3, [(_SYZlibStreamInternal *)self outputPtr], a4);
  unint64_t v9 = self->_readOffset + a4;
  self->_readOffset = v9;
  if (v9 == self->_zStream.total_out)
  {
    self->_zStream.next_out = (Bytef *)self->_output;
    self->_zStream.avail_out = self->_outputSize;
    self->_zStream.total_out = 0;
    self->_readOffset = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return a4;
}

- (int64_t)readOutputToStream:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  int64_t v6 = objc_msgSend(v5, "write:maxLength:", -[_SYZlibStreamInternal outputPtr](self, "outputPtr"), -[_SYZlibStreamInternal outputAvailable](self, "outputAvailable"));

  if ((v6 & 0x8000000000000000) == 0)
  {
    unint64_t v7 = self->_readOffset + v6;
    self->_readOffset = v7;
    if (v7 == self->_zStream.total_out)
    {
      self->_zStream.next_out = (Bytef *)self->_output;
      self->_zStream.avail_out = self->_outputSize;
      self->_zStream.total_out = 0;
      self->_readOffset = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

@end