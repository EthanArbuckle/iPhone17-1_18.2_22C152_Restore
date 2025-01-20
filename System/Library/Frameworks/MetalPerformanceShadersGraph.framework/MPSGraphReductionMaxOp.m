@interface MPSGraphReductionMaxOp
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphReductionMaxOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10 = a7;
  mpsFileLoc("-[MPSGraphReductionMaxOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphReductionOps.mm", __p);
  uint64_t v11 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::ReductionMaxOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x7Au, v10);
  if (v23 < 0)
  {
    operator delete(__p[0]);
    v12 = *(uint64_t **)a5;
    v13 = (uint64_t *)*((void *)a5 + 1);
    if ((unint64_t)v13 - *(void *)a5 >= 9) {
      goto LABEL_3;
    }
  }
  else
  {
    v12 = *(uint64_t **)a5;
    v13 = (uint64_t *)*((void *)a5 + 1);
    if ((unint64_t)v13 - *(void *)a5 >= 9)
    {
LABEL_3:
      uint64_t v14 = v12[1];
      goto LABEL_6;
    }
  }
  uint64_t v14 = 0;
LABEL_6:
  uint64_t v21 = v14;
  if (v13 == v12) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  unsigned __int8 v19 = 1;
  unsigned __int8 v18 = 0;
  v15 = mlir::OpBuilder::create<mlir::mps::ReductionMaxOp,mlir::Value &,mlir::Value &,BOOL,BOOL>((mlir::UnitAttr **)a3, v11, v12, &v21, &v19, &v18);
  if (!*((_DWORD *)v15 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v20 = (char *)v15 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v20);

  return DefiningOp;
}

@end