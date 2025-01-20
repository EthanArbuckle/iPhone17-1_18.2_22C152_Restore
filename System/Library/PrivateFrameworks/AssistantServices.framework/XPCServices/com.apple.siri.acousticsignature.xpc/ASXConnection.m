@interface ASXConnection
- (id)_extractor;
- (void)appendAcousticData:(id)a3 sampleCount:(int)a4 sampleRate:(int)a5;
- (void)getSignature:(id)a3;
- (void)reset;
- (void)setSampleRate:(int)a3;
@end

@implementation ASXConnection

- (void).cxx_destruct
{
}

- (void)reset
{
  id v2 = [(ASXConnection *)self _extractor];
  [v2 reset];
}

- (void)getSignature:(id)a3
{
  v6 = (void (**)(id, void *))a3;
  v4 = [(ASXConnection *)self _extractor];
  v5 = [v4 currentSignature];

  if (v6) {
    v6[2](v6, v5);
  }
}

- (void)appendAcousticData:(id)a3 sampleCount:(int)a4 sampleRate:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v10 = [(ASXConnection *)self _extractor];
  if ((int)v5 >= 1) {
    [v10 setSampleRate:v5];
  }
  v9 = [(ASXConnection *)self _extractor];
  [v9 appendAcousticData:v8 sampleCount:v6];
}

- (void)setSampleRate:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(ASXConnection *)self _extractor];
  [v4 setSampleRate:v3];
}

- (id)_extractor
{
  extractor = self->_extractor;
  if (!extractor)
  {
    id v4 = objc_alloc_init(ASXExtractor);
    uint64_t v5 = self->_extractor;
    self->_extractor = v4;

    extractor = self->_extractor;
  }
  return extractor;
}

@end