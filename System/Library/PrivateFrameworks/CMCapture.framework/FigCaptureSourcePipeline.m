@interface FigCaptureSourcePipeline
- (FigCaptureSourcePipeline)initWithGraph:(id)a3 name:(id)a4 sourceID:(id)a5;
- (NSString)sourceID;
- (void)dealloc;
@end

@implementation FigCaptureSourcePipeline

- (NSString)sourceID
{
  return self->_sourceID;
}

- (FigCaptureSourcePipeline)initWithGraph:(id)a3 name:(id)a4 sourceID:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)FigCaptureSourcePipeline;
  v6 = [(FigCapturePipeline *)&v8 initWithGraph:a3 name:a4];
  if (v6) {
    v6->_sourceID = (NSString *)a5;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSourcePipeline;
  [(FigCapturePipeline *)&v3 dealloc];
}

@end