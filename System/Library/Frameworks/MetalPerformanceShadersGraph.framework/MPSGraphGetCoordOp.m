@interface MPSGraphGetCoordOp
- (MPSGraphGetCoordOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dataType:(unsigned int)a6 name:(id)a7;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphGetCoordOp

- (MPSGraphGetCoordOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dataType:(unsigned int)a6 name:(id)a7
{
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a7];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10 = a7;
  mpsFileLoc("-[MPSGraphGetCoordOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", v30);
  id v11 = v10;
  __int16 v35 = 260;
  v34[0] = v30;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v34);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x66Fu, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    __dst[23] = 19;
    qmemcpy(__dst, "mps.get_coordinates", 19);
    v18 = &__dst[19];
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
    v17 = operator new(v19 + 1);
    *(void *)&__dst[8] = v16;
    *(void *)&__dst[16] = v20 | 0x8000000000000000;
    *(void *)__dst = v17;
  }
  else
  {
    __dst[23] = v15;
    v17 = __dst;
    if (!v15) {
      goto LABEL_12;
    }
  }
  memmove(v17, v14, v16);
LABEL_12:
  v18 = &v17[v16];
LABEL_13:
  unsigned char *v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  char v22 = 1;
  HIBYTE(v35) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v34[0] = p_p;
    char v22 = 3;
  }
  LOBYTE(v35) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v34);
  uint64_t v24 = mlir::NameLoc::get(v23, v13);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((__dst[23] & 0x80000000) == 0)
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
  else if ((__dst[23] & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(*(void **)__dst);

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
  v27 = mlir::OpBuilder::create<mlir::mps::GetCoordOp,mlir::Value &,mlir::Value &>((uint64_t *)a3, v24, v25, v25 + 1);
  if (!*((_DWORD *)v27 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v34[0] = (char *)v27 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)v34);

  return DefiningOp;
}

@end