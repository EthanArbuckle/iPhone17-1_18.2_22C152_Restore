@interface MPSGraphReductionArgBaseOp
- (MPSGraphReductionArgBaseOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 axis:(int64_t)a6 name:(id)a7;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphReductionArgBaseOp

- (MPSGraphReductionArgBaseOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 axis:(int64_t)a6 name:(id)a7
{
  self->_axis = a6;
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a7];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v7 = a7;
  __assert_rtn("-[MPSGraphReductionArgBaseOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphReductionOps.mm", 353, "0 && \"use a child class\"");
}

@end