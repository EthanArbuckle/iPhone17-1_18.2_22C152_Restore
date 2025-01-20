@interface FigCaptureSinkPipeline
- (BOOL)discardsSampleData;
- (FigCaptureSinkPipeline)initWithGraph:(id)a3 name:(id)a4 sinkID:(id)a5;
- (NSString)sinkID;
- (void)dealloc;
- (void)setDiscardsSampleData:(BOOL)a3;
- (void)setUpstreamOutput:(id)a3;
@end

@implementation FigCaptureSinkPipeline

- (void)setDiscardsSampleData:(BOOL)a3
{
}

- (BOOL)discardsSampleData
{
  return [(BWNodeOutput *)self->_upstreamOutput discardsSampleData];
}

- (FigCaptureSinkPipeline)initWithGraph:(id)a3 name:(id)a4 sinkID:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)FigCaptureSinkPipeline;
  v6 = [(FigCapturePipeline *)&v8 initWithGraph:a3 name:a4];
  if (v6) {
    v6->_sinkID = (NSString *)a5;
  }
  return v6;
}

- (NSString)sinkID
{
  return self->_sinkID;
}

- (void)setUpstreamOutput:(id)a3
{
  if (self->_upstreamOutput) {
    FigDebugAssert3();
  }
  self->_upstreamOutput = (BWNodeOutput *)a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSinkPipeline;
  [(FigCapturePipeline *)&v3 dealloc];
}

@end