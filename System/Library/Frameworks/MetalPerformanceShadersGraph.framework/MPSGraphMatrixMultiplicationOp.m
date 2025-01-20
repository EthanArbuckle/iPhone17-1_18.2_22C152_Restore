@interface MPSGraphMatrixMultiplicationOp
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphMatrixMultiplicationOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10 = a7;
  mpsFileLoc("-[MPSGraphMatrixMultiplicationOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphMatrixMultiplicationOps.mm", v29);
  id v11 = v10;
  __int16 v35 = 260;
  v34[0] = v29;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v34);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x2Bu, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    HIBYTE(v33) = 10;
    strcpy(__dst.i8, "mps.matmul");
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
    uint64_t v18 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17) {
      uint64_t v18 = v15 | 7;
    }
    uint64_t v19 = v18 + 1;
    p_dst = (int8x16_t *)operator new(v18 + 1);
    __dst.i64[1] = v16;
    unint64_t v33 = v19 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v33) = v15;
    p_dst = &__dst;
    if (!v15) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  p_dst->i8[v16] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  char v21 = 1;
  HIBYTE(v35) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v34[0] = p_p;
    char v21 = 3;
  }
  LOBYTE(v35) = v21;
  uint64_t v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v34);
  uint64_t v23 = mlir::NameLoc::get(v22, v13);
  if (!v23) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v33) & 0x80000000) == 0)
    {
LABEL_20:

      if ((v30 & 0x80000000) == 0) {
        goto LABEL_21;
      }
LABEL_25:
      operator delete(v29[0]);
      v24 = *(uint64_t **)a5;
      unint64_t v25 = *((void *)a5 + 1) - *(void *)a5;
      if (!v25) {
        goto LABEL_32;
      }
      goto LABEL_26;
    }
  }
  else if ((SHIBYTE(v33) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);

  if (v30 < 0) {
    goto LABEL_25;
  }
LABEL_21:
  v24 = *(uint64_t **)a5;
  unint64_t v25 = *((void *)a5 + 1) - *(void *)a5;
  if (!v25) {
LABEL_32:
  }
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
LABEL_26:
  if (v25 <= 8) {
    goto LABEL_32;
  }
  v26 = mlir::OpBuilder::create<mlir::mps::MatMulOp,mlir::Value &,mlir::Value &>((mlir::BoolAttr **)a3, v23, v24, v24 + 1);
  if (!*((_DWORD *)v26 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v34[0] = (char *)v26 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)v34);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v41 = a3;
  id v43 = a4;
  id v10 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  id v11 = [(MPSGraphOperation *)self inputTensors];
  v12 = [v11 objectAtIndexedSubscript:0];
  uint64_t v13 = [(MPSGraphOperation *)self inputTensors];
  v14 = [v13 objectAtIndexedSubscript:1];
  size_t v15 = NSString;
  size_t v16 = [(MPSGraphOperation *)self name];
  if (a5)
  {
    v17 = [v15 stringWithFormat:@"%@/%@/matMulSecondaryGrad", v10, v16];
    [WeakRetained matrixMultiplicationSecondaryGradientWithIncomingGradientTensor:v43 primaryTensor:v12 secondaryTensor:v14 name:v17];
  }
  else
  {
    v17 = [v15 stringWithFormat:@"%@/%@/matMulPrimaryGrad", v10, v16];
    [WeakRetained matrixMultiplicationPrimaryGradientWithIncomingGradientTensor:v43 primaryTensor:v12 secondaryTensor:v14 name:v17];
  v44 = };

  id v18 = objc_loadWeakRetained((id *)&self->super._graph);
  uint64_t v19 = [(MPSGraphOperation *)self inputTensors];
  v20 = [v19 objectAtIndexedSubscript:a5];
  char v21 = NSString;
  uint64_t v22 = [(MPSGraphOperation *)self name];
  uint64_t v23 = [v21 stringWithFormat:@"%@/%@/braodcastGrad", v10, v22];
  v24 = [v18 broadcastGradientArgsForPrimaryTensor:v44 withSecondaryTensor:v20 name:v23];

  id v25 = objc_loadWeakRetained((id *)&self->super._graph);
  v26 = NSString;
  v27 = [(MPSGraphOperation *)self name];
  v28 = [v26 stringWithFormat:@"%@/%@/braodcastGrad", v10, v27];
  v29 = [v25 reductionSumWithTensor:v44 axesTensor:v24 name:v28];

  id v30 = objc_loadWeakRetained((id *)&self->super._graph);
  v31 = NSString;
  v32 = [(MPSGraphOperation *)self name];
  unint64_t v33 = [v31 stringWithFormat:@"%@/%@/braodcastGrad", v10, v32];
  v34 = [v30 shapeOfTensor:v41 name:v33];

  id v35 = objc_loadWeakRetained((id *)&self->super._graph);
  v36 = NSString;
  v37 = [(MPSGraphOperation *)self name];
  v38 = [v36 stringWithFormat:@"%@/%@/braodcastGrad", v10, v37];
  v39 = [v35 reshapeTensor:v29 withShapeTensor:v34 name:v38];

  return v39;
}

@end