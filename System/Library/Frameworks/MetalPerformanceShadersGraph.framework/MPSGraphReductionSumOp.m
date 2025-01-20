@interface MPSGraphReductionSumOp
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphReductionSumOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10 = a7;
  mpsFileLoc("-[MPSGraphReductionSumOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphReductionOps.mm", v31);
  id v11 = v10;
  __int16 v37 = 260;
  v36[0] = (uint64_t)v31;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v36);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x3Cu, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    HIBYTE(v35) = 17;
    LOBYTE(v35) = 109;
    int8x16_t __dst = *(int8x16_t *)"mps.reduction_sum";
    v18 = (char *)&v35 + 1;
    goto LABEL_13;
  }
  v14 = (const char *)[v11 UTF8String];
  size_t v15 = strlen(v14);
  if (v15 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v16 = v15;
  if (v15 >= 0x17)
  {
    uint64_t v19 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17) {
      uint64_t v19 = v15 | 7;
    }
    uint64_t v20 = v19 + 1;
    p_dst = (int8x16_t *)operator new(v19 + 1);
    __dst.i64[1] = v16;
    unint64_t v35 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v35) = v15;
    p_dst = &__dst;
    if (!v15) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v18 = &p_dst->i8[v16];
LABEL_13:
  __int8 *v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  char v22 = 1;
  HIBYTE(v37) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v36[0] = (uint64_t)p_p;
    char v22 = 3;
  }
  LOBYTE(v37) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v36);
  uint64_t v24 = mlir::NameLoc::get(v23, v13);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v35) & 0x80000000) == 0)
    {
LABEL_20:

      if ((v32 & 0x80000000) == 0) {
        goto LABEL_21;
      }
LABEL_25:
      operator delete(v31[0]);
      v25 = *(uint64_t **)a5;
      v26 = (uint64_t *)*((void *)a5 + 1);
      if ((unint64_t)v26 - *(void *)a5 >= 9) {
        goto LABEL_22;
      }
      goto LABEL_26;
    }
  }
  else if ((SHIBYTE(v35) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);

  if (v32 < 0) {
    goto LABEL_25;
  }
LABEL_21:
  v25 = *(uint64_t **)a5;
  v26 = (uint64_t *)*((void *)a5 + 1);
  if ((unint64_t)v26 - *(void *)a5 >= 9)
  {
LABEL_22:
    uint64_t v27 = v25[1];
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v27 = 0;
LABEL_27:
  v36[0] = v27;
  if (v26 == v25) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  __p.__r_.__value_.__s.__data_[0] = 1;
  v28 = mlir::OpBuilder::create<mlir::mps::ReductionSumOp,mlir::Value &,mlir::Value &,BOOL &>((mlir::UnitAttr **)a3, v24, v25, v36, (unsigned __int8 *)&__p);
  if (!*((_DWORD *)v28 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  __dst.i64[0] = (uint64_t)v28 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&__dst);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_loadWeakRetained((id *)&self->super.super._graph);
  id v11 = [v10 shapeOfTensor:v8 name:@"ShapeForReductionGrad"];
  v12 = [v10 broadcastTensor:v9 toShapeTensor:v11 name:@"Broadcast to input shape"];

  return v12;
}

@end