@interface MPSGraphCastOp
- (MPSGraphCastOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 destType:(unsigned int)a6 name:(id)a7;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphCastOp

- (MPSGraphCastOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 destType:(unsigned int)a6 name:(id)a7
{
  self->_destType = a6;
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a7];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11 = a7;
  mpsFileLoc("-[MPSGraphCastOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", v30);
  id v12 = v11;
  __int16 v36 = 260;
  v35[0] = v30;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v35);
  uint64_t v14 = mlir::FileLineColLoc::get(StringAttr, 0x347u, 0);
  if (!v14) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v12)
  {
    HIBYTE(v34) = 8;
    strcpy(__dst.i8, "mps.cast");
    goto LABEL_13;
  }
  v15 = (const char *)[v12 UTF8String];
  size_t v16 = strlen(v15);
  if (v16 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v17 = v16;
  if (v16 >= 0x17)
  {
    uint64_t v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v19 = v16 | 7;
    }
    uint64_t v20 = v19 + 1;
    p_dst = (int8x16_t *)operator new(v19 + 1);
    __dst.i64[1] = v17;
    unint64_t v34 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v34) = v16;
    p_dst = &__dst;
    if (!v16) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  p_dst->i8[v17] = 0;
LABEL_13:
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
  uint64_t v24 = mlir::NameLoc::get(v23, v14);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v34) & 0x80000000) == 0) {
      goto LABEL_20;
    }
LABEL_25:
    operator delete((void *)__dst.i64[0]);

    if ((v31 & 0x80000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_26;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v34) < 0) {
    goto LABEL_25;
  }
LABEL_20:

  if ((v31 & 0x80000000) == 0) {
    goto LABEL_21;
  }
LABEL_26:
  operator delete(v30[0]);
LABEL_21:
  uint64_t MLIRElementType = getMLIRElementType(*(mlir::MLIRContext **)a3, (mlir::MLIRContext *)self->_destType);
  v26 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) == *(void *)a5) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  __dst.i64[0] = mlir::TypeAttr::get(MLIRElementType);
  v27 = mlir::OpBuilder::create<mlir::mps::CastOp,mlir::Value &,mlir::TypeAttr &>((mlir::UnknownLoc **)a3, v24, v26, __dst.i64);
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
  uint64_t v13 = [v9 dataType];
  uint64_t v14 = NSString;
  v15 = [(MPSGraphOperation *)self name];
  size_t v16 = [v14 stringWithFormat:@"%@/%@/castGradient", v11, v15];
  size_t v17 = [WeakRetained castTensor:v10 toType:v13 name:v16];

  return v17;
}

@end