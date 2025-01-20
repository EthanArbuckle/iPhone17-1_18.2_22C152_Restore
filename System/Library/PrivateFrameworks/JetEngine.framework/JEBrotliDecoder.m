@interface JEBrotliDecoder
- (BrotliDecoderStateStruct)decoder;
- (JEBrotliDecoder)init;
- (int64_t)decompressStreamWithAvailableIn:(unint64_t *)a3 nextIn:(const char *)a4 availableOut:(unint64_t *)a5 nextOut:(char *)a6;
- (void)dealloc;
@end

@implementation JEBrotliDecoder

- (JEBrotliDecoder)init
{
  v6.receiver = self;
  v6.super_class = (Class)JEBrotliDecoder;
  v2 = [(JEBrotliDecoder *)&v6 init];
  if (v2
    && (Instance = (BrotliDecoderStateStruct *)BrotliDecoderCreateInstance(0, 0, 0),
        (v2->_decoder = Instance) == 0))
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
  BrotliDecoderDestroyInstance((uint64_t)[(JEBrotliDecoder *)self decoder]);
  v3.receiver = self;
  v3.super_class = (Class)JEBrotliDecoder;
  [(JEBrotliDecoder *)&v3 dealloc];
}

- (int64_t)decompressStreamWithAvailableIn:(unint64_t *)a3 nextIn:(const char *)a4 availableOut:(unint64_t *)a5 nextOut:(char *)a6
{
  return BrotliDecoderDecompressStream((uint64_t)[(JEBrotliDecoder *)self decoder], (uint64_t *)a3, (uint64_t *)a4, a5, (void **)a6, 0);
}

- (BrotliDecoderStateStruct)decoder
{
  return self->_decoder;
}

@end