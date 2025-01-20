@interface ANSTISPAlgorithm
+ (Class)_concreteClassOfVersion:(unint64_t)a3;
+ (id)new;
- (ANSTISPAlgorithm)init;
- (ANSTISPAlgorithm)initWithConfiguration:(id)a3;
- (id)resultForPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (id)resultForPixelBuffer:(__CVBuffer *)a3 orientation:(int64_t)a4 error:(id *)a5;
- (unint64_t)networkInputBufferHeight;
- (unint64_t)networkInputBufferWidth;
- (unsigned)networkInputBufferPixelFormat;
@end

@implementation ANSTISPAlgorithm

+ (id)new
{
  id result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTISPAlgorithm)init
{
  id result = (ANSTISPAlgorithm *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

+ (Class)_concreteClassOfVersion:(unint64_t)a3
{
  if (a3 == 0x10000)
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  return (Class)v4;
}

- (ANSTISPAlgorithm)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ANSTISPAlgorithm;
  return [(ANSTAlgorithm *)&v4 initWithConfiguration:a3];
}

- (id)resultForPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  return (id)MEMORY[0x270F9A6D0](self, sel_resultForPixelBuffer_orientation_error_, a3);
}

- (id)resultForPixelBuffer:(__CVBuffer *)a3 orientation:(int64_t)a4 error:(id *)a5
{
  id result = (id)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, a4, a5);
  __break(1u);
  return result;
}

- (unint64_t)networkInputBufferWidth
{
  return self->_networkInputBufferWidth;
}

- (unint64_t)networkInputBufferHeight
{
  return self->_networkInputBufferHeight;
}

- (unsigned)networkInputBufferPixelFormat
{
  return self->_networkInputBufferPixelFormat;
}

@end