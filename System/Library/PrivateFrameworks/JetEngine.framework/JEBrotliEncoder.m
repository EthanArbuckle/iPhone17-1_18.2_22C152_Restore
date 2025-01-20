@interface JEBrotliEncoder
- (BOOL)compressStreamWithOperation:(int64_t)a3 availableIn:(unint64_t *)a4 nextIn:(const char *)a5 availableOut:(unint64_t *)a6 nextOut:(char *)a7;
- (BOOL)isFinished;
- (BrotliEncoderStateStruct)encoder;
- (JEBrotliEncoder)init;
- (unsigned)quality;
- (unsigned)sizeHint;
- (void)dealloc;
- (void)setQuality:(unsigned int)a3;
- (void)setSizeHint:(unsigned int)a3;
@end

@implementation JEBrotliEncoder

- (JEBrotliEncoder)init
{
  v6.receiver = self;
  v6.super_class = (Class)JEBrotliEncoder;
  v2 = [(JEBrotliEncoder *)&v6 init];
  if (v2
    && (Instance = BrotliEncoderCreateInstance(0, 0, 0),
        (v2->_encoder = (BrotliEncoderStateStruct *)Instance) == 0))
  {
    v4 = 0;
  }
  else
  {
    v4 = v2;
  }

  return v4;
}

- (void)dealloc
{
  BrotliEncoderDestroyInstance((uint64_t)[(JEBrotliEncoder *)self encoder]);
  v3.receiver = self;
  v3.super_class = (Class)JEBrotliEncoder;
  [(JEBrotliEncoder *)&v3 dealloc];
}

- (void)setQuality:(unsigned int)a3
{
  self->_quality = a3;
  if (BrotliEncoderSetParameter((uint64_t)[(JEBrotliEncoder *)self encoder], 1, a3) != 1) {
    NSLog(&cfstr_FailedToSetQua.isa);
  }
}

- (void)setSizeHint:(unsigned int)a3
{
  self->_sizeHint = a3;
  if (BrotliEncoderSetParameter((uint64_t)[(JEBrotliEncoder *)self encoder], 5, a3) != 1) {
    NSLog(&cfstr_FailedToSetSiz.isa);
  }
}

- (BOOL)isFinished
{
  return BrotliEncoderIsFinished((uint64_t)[(JEBrotliEncoder *)self encoder]);
}

- (BOOL)compressStreamWithOperation:(int64_t)a3 availableIn:(unint64_t *)a4 nextIn:(const char *)a5 availableOut:(unint64_t *)a6 nextOut:(char *)a7
{
  return BrotliEncoderCompressStream((uint64_t)[(JEBrotliEncoder *)self encoder], a3, a4, (const void **)a5, a6, (void **)a7, 0) == 1;
}

- (unsigned)quality
{
  return self->_quality;
}

- (unsigned)sizeHint
{
  return self->_sizeHint;
}

- (BrotliEncoderStateStruct)encoder
{
  return self->_encoder;
}

@end