@interface MPSGraphReductionBaseOp
- (MPSGraphReductionBaseOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 axes:(id)a6 name:(id)a7;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphReductionBaseOp

- (MPSGraphReductionBaseOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 axes:(id)a6 name:(id)a7
{
  objc_storeStrong((id *)&self->_axes, a6);
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(MPSGraphOperation *)self initWithGraph:v15 inputTensors:v14 controlDependencies:v13 name:v12];

  return v16;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v7 = a7;
  __assert_rtn("-[MPSGraphReductionBaseOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphReductionOps.mm", 43, "0 && \"use a child class\"");
}

- (void).cxx_destruct
{
}

@end