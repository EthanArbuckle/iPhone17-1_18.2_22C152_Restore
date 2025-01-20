@interface ANSTForegroundSegmentationResult
+ (id)new;
- (ANSTForegroundSegmentationResult)init;
- (ANSTForegroundSegmentationResult)initWithMask:(__CVBuffer *)a3;
- (__CVBuffer)semanticMap;
- (id)_init;
- (void)dealloc;
@end

@implementation ANSTForegroundSegmentationResult

+ (id)new
{
  id result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTForegroundSegmentationResult)init
{
  id result = (ANSTForegroundSegmentationResult *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (id)_init
{
  return (id)((uint64_t (*)(ANSTForegroundSegmentationResult *, char *))MEMORY[0x270F9A6D0])(self, sel_init);
}

- (ANSTForegroundSegmentationResult)initWithMask:(__CVBuffer *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ANSTForegroundSegmentationResult;
  v4 = [(ANSTResult *)&v6 _init];
  if (v4) {
    v4->_semanticMap = CVBufferRetain(a3);
  }
  return v4;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_semanticMap);
  v3.receiver = self;
  v3.super_class = (Class)ANSTForegroundSegmentationResult;
  [(ANSTForegroundSegmentationResult *)&v3 dealloc];
}

- (__CVBuffer)semanticMap
{
  return self->_semanticMap;
}

@end