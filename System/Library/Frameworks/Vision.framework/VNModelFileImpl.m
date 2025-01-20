@interface VNModelFileImpl
- (VNModelFileImpl)initWithMappedModel:(const mapped_model_file *)a3;
- (__sFILE)ptrFile;
- (const)baseAddress;
- (unint64_t)length;
- (void)advise:(int64_t)a3;
@end

@implementation VNModelFileImpl

- (__sFILE)ptrFile
{
  return (__sFILE *)(*((uint64_t (**)(void))self->m_impl->var0 + 4))();
}

- (void)advise:(int64_t)a3
{
}

- (unint64_t)length
{
  return self->m_impl->var1;
}

- (const)baseAddress
{
  return (const void *)(*((uint64_t (**)(void))self->m_impl->var0 + 2))();
}

- (VNModelFileImpl)initWithMappedModel:(const mapped_model_file *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VNModelFileImpl;
  result = [(VNModelFileImpl *)&v5 init];
  if (result) {
    result->m_impl = a3;
  }
  return result;
}

@end