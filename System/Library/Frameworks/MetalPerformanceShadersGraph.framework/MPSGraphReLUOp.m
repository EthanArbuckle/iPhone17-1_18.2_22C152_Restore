@interface MPSGraphReLUOp
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphReLUOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10 = a7;
  mpsFileLoc("-[MPSGraphReLUOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphActivationOps.mm", __p);
  uint64_t v11 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::ReluOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x1Du, v10);
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  if (*((void *)a5 + 1) == *(void *)a5) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v12 = mlir::OpBuilder::create<mlir::mps::ReluOp,mlir::Value &>((mlir::OpBuilder *)a3, v11, *(uint64_t **)a5);
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
  v14 = [WeakRetained constantWithScalar:&unk_1EC9F1928 shape:268435488 dataType:0.0];

  id v15 = objc_loadWeakRetained((id *)p_graph);
  if (v11)
  {
    v16 = [v11 stringByAppendingString:@"/greaterThanOrEqualTo"];
  }
  else
  {
    v16 = @"reLUGrad/greaterThanOrEqualTo";
  }
  char v17 = [v15 greaterThanWithPrimaryTensor:v9 secondaryTensor:v14 name:v16];
  if (v11)
  {

    id v18 = objc_loadWeakRetained((id *)p_graph);
    v19 = [v11 stringByAppendingString:@"/multiplication"];
  }
  else
  {

    id v18 = objc_loadWeakRetained((id *)p_graph);
    v19 = @"reLUGrad/multiplication";
  }
  v20 = [v18 multiplicationWithPrimaryTensor:v10 secondaryTensor:v17 name:v19];
  if (v11) {

  }
  return v20;
}

@end