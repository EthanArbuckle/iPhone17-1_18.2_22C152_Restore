@interface IOBufferMutableData
- (IOBufferMutableData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 bufferID:(unsigned int)a5 deallocator:(id)a6;
- (const)bytes;
- (id)deallocator;
- (unint64_t)length;
- (unsigned)bufferID;
- (void)dealloc;
- (void)mutableBytes;
- (void)setDeallocator:(id)a3;
- (void)setID:(unsigned int)a3;
- (void)setLength:(unint64_t)a3;
@end

@implementation IOBufferMutableData

- (IOBufferMutableData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 bufferID:(unsigned int)a5 deallocator:(id)a6
{
  self->_bytes = a3;
  self->_length = a4;
  self->_bufferID = a5;
  [(IOBufferMutableData *)self setDeallocator:a6];
  return self;
}

- (void)dealloc
{
  v3 = [(IOBufferMutableData *)self deallocator];

  if (v3)
  {
    v4 = [(IOBufferMutableData *)self deallocator];
    ((void (**)(void, IOBufferMutableData *, unint64_t))v4)[2](v4, self, self->_length);
  }
  v5.receiver = self;
  v5.super_class = (Class)IOBufferMutableData;
  [(IOBufferMutableData *)&v5 dealloc];
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  id v3 = [MEMORY[0x263EFF940] exceptionWithName:@"ioDataSetLengthException" reason:@"Length can not be modified for ioData buffer" userInfo:0];
  objc_exception_throw(v3);
}

- (unsigned)bufferID
{
  return self->_bufferID;
}

- (void)setID:(unsigned int)a3
{
  id v3 = [MEMORY[0x263EFF940] exceptionWithName:@"ioDataSetIDException" reason:@"ID can not be modified for ioData buffer" userInfo:0];
  objc_exception_throw(v3);
}

- (const)bytes
{
  return self->_bytes;
}

- (void)mutableBytes
{
  return self->_bytes;
}

- (id)deallocator
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setDeallocator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end