@interface MPSGraphReverseOp
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphReverseOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10 = a7;
  mpsFileLoc("-[MPSGraphReverseOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", v31);
  id v11 = v10;
  __int16 v37 = 260;
  v36[0] = v31;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v36);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0xC18u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    HIBYTE(v35) = 11;
    *(__int32 *)((char *)&__dst.i32[1] + 3) = 1702064741;
    __dst.i64[0] = *(void *)"mps.reverse";
    v18 = &__dst.i8[11];
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
    v36[0] = p_p;
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
      goto LABEL_26;
    }
  }
  else if ((SHIBYTE(v35) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);

  if ((v32 & 0x80000000) == 0)
  {
LABEL_21:
    v25 = *(uint64_t **)a5;
    v26 = (uint64_t *)*((void *)a5 + 1);
    unint64_t v27 = (unint64_t)v26 - *(void *)a5;
    if (v27 == 8) {
      goto LABEL_22;
    }
    goto LABEL_27;
  }
LABEL_26:
  operator delete(v31[0]);
  v25 = *(uint64_t **)a5;
  v26 = (uint64_t *)*((void *)a5 + 1);
  unint64_t v27 = (unint64_t)v26 - *(void *)a5;
  if (v27 == 8)
  {
LABEL_22:
    uint64_t v28 = mlir::OpBuilder::create<mlir::mps::ReverseOp,mlir::Value &>((mlir::OpBuilder *)a3, v24, (uint64_t)v25);
    if (!*(_DWORD *)(v28 + 36)) {
      __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
    }
    goto LABEL_30;
  }
LABEL_27:
  if (v26 == v25 || v27 <= 8) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v28 = mlir::OpBuilder::create<mlir::mps::ReverseOp,mlir::Value &,mlir::Value &>((mlir::OpBuilder *)a3, v24, v25, v25 + 1);
  if (!*(_DWORD *)(v28 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
LABEL_30:
  v36[0] = v28 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)v36);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  if (a5)
  {
    id v11 = 0;
  }
  else
  {
    NSUInteger v12 = [(NSArray *)self->super._inputTensors count];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
    v14 = WeakRetained;
    if (v12 < 2)
    {
      id v11 = [WeakRetained reverseTensor:v9 name:v10];
    }
    else
    {
      size_t v15 = [(NSArray *)self->super._inputTensors objectAtIndexedSubscript:1];
      id v11 = [v14 reverseTensor:v9 axesTensor:v15 name:v10];
    }
  }

  return v11;
}

@end