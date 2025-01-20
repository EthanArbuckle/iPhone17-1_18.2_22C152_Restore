@interface DYPlaybackEngineFSEBuilder
- (DYPlaybackEngineFSEBuilder)init;
- (DYPlaybackEngineFSEBuilder)initWithPlaybackEngineCache:(void *)a3;
- (void)performPostCaptureVisitActions;
- (void)performPreCaptureVisitActions;
- (void)performPreVisitActions;
- (void)visitCaptureStore:(id)a3;
- (void)visitFunctionStreamFile:(id)a3;
@end

@implementation DYPlaybackEngineFSEBuilder

- (DYPlaybackEngineFSEBuilder)init
{
  return 0;
}

- (DYPlaybackEngineFSEBuilder)initWithPlaybackEngineCache:(void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DYPlaybackEngineFSEBuilder;
  v4 = [(DYCaptureVisitor *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_cache = a3;
    [(DYInOrderInstructionFilesVisitor *)v4 setVisitDeltaFiles:1];
  }
  return v5;
}

- (void)visitCaptureStore:(id)a3
{
  self->_store = (DYCaptureStore *)a3;
  v5.receiver = self;
  v5.super_class = (Class)DYPlaybackEngineFSEBuilder;
  -[DYInOrderInstructionFilesVisitor visitCaptureStore:](&v5, sel_visitCaptureStore_);
  self->_store = 0;
  cache = self->_cache;
  if (cache[3] != *cache)
  {
    if (cache[4] != *cache) {
      return;
    }
LABEL_5:
    cache[4] = cache[1];
    return;
  }
  cache[3] = cache[1];
  cache = self->_cache;
  if (cache[4] == *cache) {
    goto LABEL_5;
  }
}

- (void)visitFunctionStreamFile:(id)a3
{
}

- (void)performPreVisitActions
{
  *((void *)self->_cache + 3) = *(void *)self->_cache;
  *((void *)self->_cache + 4) = *(void *)self->_cache;
}

- (void)performPreCaptureVisitActions
{
  *((void *)self->_cache + 3) = *((void *)self->_cache + 1);
  self->_buildDecodedFunctionStreams = 1;
}

- (void)performPostCaptureVisitActions
{
  *((void *)self->_cache + 4) = *((void *)self->_cache + 1);
}

- (void)visitFunctionStreamFile:(GPUTools::Playback::DecodedFunctionStream *)a1 .cold.1(GPUTools::Playback::DecodedFunctionStream *a1)
{
  GPUTools::Playback::DecodedFunctionStream::~DecodedFunctionStream(a1);
  JUMPOUT(0x25335FE80);
}

@end