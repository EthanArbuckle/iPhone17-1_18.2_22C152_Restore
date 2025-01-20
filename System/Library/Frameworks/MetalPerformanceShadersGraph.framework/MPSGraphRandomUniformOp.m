@interface MPSGraphRandomUniformOp
- (MPSGraphRandomUniformOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphRandomUniformOp

- (MPSGraphRandomUniformOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  LODWORD(self->_maximum) = [v15 dataType];
  [v15 min];
  *((_DWORD *)&self->_minimum + 1) = v17;
  [v15 max];
  self->_minimum = v18;
  self->_minInteger = [v15 minInteger];
  self->_maxInteger = [v15 maxInteger];
  v19 = [(MPSGraphOperation *)self initWithGraph:v12 inputTensors:v13 controlDependencies:v14 name:v16];

  return v19;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11 = a7;
  mpsFileLoc("-[MPSGraphRandomUniformOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphRandomOps.mm", v28);
  id v12 = v11;
  __int16 v33 = 260;
  v32[0] = (uint64_t)v28;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v32);
  uint64_t v14 = mlir::FileLineColLoc::get(StringAttr, 0xEEu, 0);
  if (!v14) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v12)
  {
    __dst[23] = 18;
    strcpy(__dst, "mps.random_uniform");
    goto LABEL_13;
  }
  id v15 = (const char *)[v12 UTF8String];
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
    float v18 = operator new(v19 + 1);
    *(void *)&__dst[8] = v17;
    *(void *)&__dst[16] = v20 | 0x8000000000000000;
    *(void *)__dst = v18;
  }
  else
  {
    __dst[23] = v16;
    float v18 = __dst;
    if (!v16) {
      goto LABEL_12;
    }
  }
  memmove(v18, v15, v17);
LABEL_12:
  v18[v17] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  char v22 = 1;
  HIBYTE(v33) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v32[0] = (uint64_t)p_p;
    char v22 = 3;
  }
  LOBYTE(v33) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v32);
  uint64_t v24 = mlir::NameLoc::get(v23, v14);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((__dst[23] & 0x80000000) == 0) {
      goto LABEL_20;
    }
LABEL_25:
    operator delete(*(void **)__dst);

    if ((v29 & 0x80000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_26;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if ((__dst[23] & 0x80000000) != 0) {
    goto LABEL_25;
  }
LABEL_20:

  if ((v29 & 0x80000000) == 0) {
    goto LABEL_21;
  }
LABEL_26:
  operator delete(v28[0]);
LABEL_21:
  v32[0] = getMLIRElementType(*(mlir::MLIRContext **)a3, (mlir::MLIRContext *)LODWORD(self->_maximum));
  if (*((void *)a5 + 1) - *(void *)a5 <= 0x18uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v25 = mlir::OpBuilder::create<mlir::mps::RandomUniformOp,mlir::Value &,mlir::Value &,mlir::Value &,mlir::Value &,mlir::Type &>((mlir::OpBuilder *)a3, v24, *(uint64_t **)a5, (uint64_t *)(*(void *)a5 + 8), (uint64_t *)(*(void *)a5 + 16), (uint64_t *)(*(void *)a5 + 24), v32);
  if (!*(_DWORD *)(v25 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  *(void *)__dst = v25 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)__dst);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  return 0;
}

@end