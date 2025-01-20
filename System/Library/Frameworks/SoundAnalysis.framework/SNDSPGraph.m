@interface SNDSPGraph
- (BOOL)preflight:(int64_t)a3 outputFrameCount:(int64_t *)a4 error:(id *)a5;
- (BOOL)processInputBufferList:(AudioBufferList *)a3 inputFrameCount:(unsigned int)a4 atSourcePosition:(int64_t)a5 to:(AudioBufferList *)a6 outputFrameCapacity:(unsigned int)a7 outputFrameCount:(unsigned int *)a8 atDestinationPosition:(int64_t *)a9 error:(id *)a10;
- (SNDSPGraph)init;
- (id).cxx_construct;
@end

@implementation SNDSPGraph

- (SNDSPGraph)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  v4 = [NSString stringWithUTF8String:"-[SNDSPGraph init]"];
  [v3 raise:*MEMORY[0x1E4F1C3C8], @"Do not call %@", v4 format];

  return 0;
}

- (BOOL)preflight:(int64_t)a3 outputFrameCount:(int64_t *)a4 error:(id *)a5
{
  if (DSPGraph::Graph::numInputs((DSPGraph::Graph *)self->_graph.__ptr_) >= 2) {
    __assert_rtn("-[SNDSPGraph preflight:outputFrameCount:error:]", "SNDSPGraph.mm", 255, "_graph->numInputs() <= 1");
  }
  if (DSPGraph::Graph::numOutputs((DSPGraph::Graph *)self->_graph.__ptr_) >= 2) {
    __assert_rtn("-[SNDSPGraph preflight:outputFrameCount:error:]", "SNDSPGraph.mm", 256, "_graph->numOutputs() <= 1");
  }
  if (!a4) {
    __assert_rtn("-[SNDSPGraph preflight:outputFrameCount:error:]", "SNDSPGraph.mm", 257, "outputFrameCount");
  }
  DSPGraph::Graph::preflight();
  *a4 = 0;
  return 1;
}

- (BOOL)processInputBufferList:(AudioBufferList *)a3 inputFrameCount:(unsigned int)a4 atSourcePosition:(int64_t)a5 to:(AudioBufferList *)a6 outputFrameCapacity:(unsigned int)a7 outputFrameCount:(unsigned int *)a8 atDestinationPosition:(int64_t *)a9 error:(id *)a10
{
  if (DSPGraph::Graph::numInputs((DSPGraph::Graph *)self->_graph.__ptr_) >= 2) {
    __assert_rtn("-[SNDSPGraph processInputBufferList:inputFrameCount:atSourcePosition:to:outputFrameCapacity:outputFrameCount:atDestinationPosition:error:]", "SNDSPGraph.mm", 309, "_graph->numInputs() <= 1");
  }
  if (DSPGraph::Graph::numOutputs((DSPGraph::Graph *)self->_graph.__ptr_) >= 2) {
    __assert_rtn("-[SNDSPGraph processInputBufferList:inputFrameCount:atSourcePosition:to:outputFrameCapacity:outputFrameCount:atDestinationPosition:error:]", "SNDSPGraph.mm", 310, "_graph->numOutputs() <= 1");
  }
  if (!a9) {
    __assert_rtn("-[SNDSPGraph processInputBufferList:inputFrameCount:atSourcePosition:to:outputFrameCapacity:outputFrameCount:atDestinationPosition:error:]", "SNDSPGraph.mm", 311, "destinationFramePosition");
  }
  DSPGraph::Graph::processMultiple();
  *a8 = a7;
  *a9 = (uint64_t)0.0;
  return 1;
}

- (void).cxx_destruct
{
  cntrl = self->_graph.__cntrl_;
  if (cntrl) {
    sub_1DCB44254((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end