@interface MPSGraphReshapeOp
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphReshapeOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10 = a7;
  mpsFileLoc("-[MPSGraphReshapeOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", v30);
  id v11 = v10;
  __int16 v36 = 260;
  v35[0] = v30;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v35);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x133u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    HIBYTE(v34) = 11;
    *(__int32 *)((char *)&__dst.i32[1] + 3) = 1701863784;
    __dst.i64[0] = *(void *)"mps.reshape";
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
    unint64_t v34 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v34) = v15;
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
  HIBYTE(v36) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v35[0] = p_p;
    char v22 = 3;
  }
  LOBYTE(v36) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v35);
  uint64_t v24 = mlir::NameLoc::get(v23, v13);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v34) & 0x80000000) == 0)
    {
LABEL_20:

      if ((v31 & 0x80000000) == 0) {
        goto LABEL_21;
      }
LABEL_25:
      operator delete(v30[0]);
      v25 = *(uint64_t **)a5;
      unint64_t v26 = *((void *)a5 + 1) - *(void *)a5;
      if (!v26) {
        goto LABEL_32;
      }
      goto LABEL_26;
    }
  }
  else if ((SHIBYTE(v34) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);

  if (v31 < 0) {
    goto LABEL_25;
  }
LABEL_21:
  v25 = *(uint64_t **)a5;
  unint64_t v26 = *((void *)a5 + 1) - *(void *)a5;
  if (!v26) {
LABEL_32:
  }
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
LABEL_26:
  if (v26 <= 8) {
    goto LABEL_32;
  }
  v27 = mlir::OpBuilder::create<mlir::mps::ReshapeOp,mlir::Value,mlir::Value&>((mlir::UnitAttr **)a3, v24, v25, v25 + 1);
  if (!*((_DWORD *)v27 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v35[0] = (char *)v27 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)v35);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  uint64_t v13 = NSString;
  v14 = [(MPSGraphOperation *)self name];
  size_t v15 = [v13 stringWithFormat:@"%@/%@/reshape/shapeOp", v11, v14];
  size_t v16 = [WeakRetained shapeOfTensor:v9 name:v15];

  id v17 = objc_loadWeakRetained((id *)&self->super._graph);
  v18 = NSString;
  uint64_t v19 = [(MPSGraphOperation *)self name];
  uint64_t v20 = [v18 stringWithFormat:@"%@/%@/reshape", v11, v19];
  v21 = [v17 reshapeTensor:v10 withShapeTensor:v16 name:v20];

  return v21;
}

- (void).cxx_destruct
{
}

@end