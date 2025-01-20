@interface MPSGraphSigmoidOp
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphSigmoidOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10 = a7;
  mpsFileLoc("-[MPSGraphSigmoidOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphActivationOps.mm", __p);
  uint64_t v11 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::ReluOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x91u, v10);
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  if (*((void *)a5 + 1) == *(void *)a5) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v12 = mlir::OpBuilder::create<mlir::mps::SigmoidOp,mlir::Value &>((mlir::OpBuilder *)a3, v11, *(uint64_t **)a5);
  if (!*(_DWORD *)(v12 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v15 = v12 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v15);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  p_graph = &self->super._graph;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  v14 = objc_msgSend(WeakRetained, "constantWithScalar:shape:dataType:", &unk_1EC9F1940, objc_msgSend(v9, "dataType"), 1.0);

  id v15 = objc_loadWeakRetained((id *)p_graph);
  if (v11)
  {
    v16 = [v11 stringByAppendingString:@"/sigmoid"];
  }
  else
  {
    v16 = @"sigmoidGrad/sigmoid";
  }
  char v17 = [v15 sigmoidWithTensor:v9 name:v16];
  if (v11)
  {

    id v18 = objc_loadWeakRetained((id *)p_graph);
    v19 = [v11 stringByAppendingString:@"/subtraction"];
  }
  else
  {

    id v18 = objc_loadWeakRetained((id *)p_graph);
    v19 = @"sigmoidGrad/subtraction";
  }
  v20 = [v18 subtractionWithPrimaryTensor:v14 secondaryTensor:v17 name:v19];
  if (v11)
  {

    id v21 = objc_loadWeakRetained((id *)p_graph);
    v22 = [v11 stringByAppendingString:@"/multiplication"];
  }
  else
  {

    id v21 = objc_loadWeakRetained((id *)p_graph);
    v22 = @"sigmoidGrad/multiplication";
  }
  v23 = [v21 multiplicationWithPrimaryTensor:v20 secondaryTensor:v17 name:v22];
  if (v11)
  {

    id v24 = objc_loadWeakRetained((id *)p_graph);
    v25 = [v11 stringByAppendingString:@"/multiplication_1"];
  }
  else
  {

    id v24 = objc_loadWeakRetained((id *)p_graph);
    v25 = @"sigmoidGrad/multiplication_1";
  }
  v26 = [v24 multiplicationWithPrimaryTensor:v10 secondaryTensor:v23 name:v25];
  if (v11) {

  }
  return v26;
}

@end