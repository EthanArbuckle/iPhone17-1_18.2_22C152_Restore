@interface FigCaptureRemoteQueueSinkPipeline
- (BWRemoteQueueSinkNode)sinkNode;
- (void)dealloc;
- (void)setSinkNode:(id)a3;
- (void)updateClientAuditToken:(id *)a3;
@end

@implementation FigCaptureRemoteQueueSinkPipeline

- (void)setSinkNode:(id)a3
{
  if (self->_sinkNode) {
    FigDebugAssert3();
  }
  self->_sinkNode = (BWRemoteQueueSinkNode *)a3;
}

- (BWRemoteQueueSinkNode)sinkNode
{
  return self->_sinkNode;
}

- (void)updateClientAuditToken:(id *)a3
{
  sinkNode = self->_sinkNode;
  long long v4 = *(_OWORD *)&a3->var0[4];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v4;
  [(BWRemoteQueueSinkNode *)sinkNode updateClientAuditToken:v5];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureRemoteQueueSinkPipeline;
  [(FigCaptureSinkPipeline *)&v3 dealloc];
}

@end