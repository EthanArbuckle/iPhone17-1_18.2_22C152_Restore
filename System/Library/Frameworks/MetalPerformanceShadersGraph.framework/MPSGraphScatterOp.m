@interface MPSGraphScatterOp
- (MPSGraphScatterOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 axis:(int64_t)a6 mode:(int64_t)a7 name:(id)a8;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphScatterOp

- (MPSGraphScatterOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 axis:(int64_t)a6 mode:(int64_t)a7 name:(id)a8
{
  self->_axis = a6;
  self->_mode = a7;
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a8];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11 = a7;
  mpsFileLoc("-[MPSGraphScatterOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphScatterOps.mm", v31);
  id v12 = v11;
  __int16 v37 = 260;
  v36[0] = v31;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v36);
  uint64_t v14 = mlir::FileLineColLoc::get(StringAttr, 0xBEu, 0);
  if (!v14) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v12)
  {
    HIBYTE(v35) = 11;
    *(__int32 *)((char *)&__dst.i32[1] + 3) = 1919251572;
    __dst.i64[0] = *(void *)"mps.scatter";
    v19 = &__dst.i8[11];
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
    uint64_t v20 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v20 = v16 | 7;
    }
    uint64_t v21 = v20 + 1;
    p_dst = (int8x16_t *)operator new(v20 + 1);
    __dst.i64[1] = v17;
    unint64_t v35 = v21 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v35) = v16;
    p_dst = &__dst;
    if (!v16) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  v19 = &p_dst->i8[v17];
LABEL_13:
  __int8 *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  char v23 = 1;
  HIBYTE(v37) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v36[0] = p_p;
    char v23 = 3;
  }
  LOBYTE(v37) = v23;
  uint64_t v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v36);
  uint64_t v25 = mlir::NameLoc::get(v24, v14);
  if (!v25) {
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
      v26 = *(uint64_t **)a5;
      unint64_t v27 = *((void *)a5 + 1) - *(void *)a5;
      if (!v27) {
        goto LABEL_32;
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
  v26 = *(uint64_t **)a5;
  unint64_t v27 = *((void *)a5 + 1) - *(void *)a5;
  if (!v27) {
LABEL_32:
  }
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
LABEL_26:
  if (v27 <= 0x18) {
    goto LABEL_32;
  }
  __dst.i32[0] = self->_mode;
  v28 = mlir::OpBuilder::create<mlir::mps::ScatterOp,mlir::Value &,mlir::Value &,mlir::Value &,mlir::Value &,mlir::mps::ScatterMode>((mlir::MLIRContext **)a3, v25, v26, v26 + 1, v26 + 2, v26 + 3, (unsigned int *)&__dst);
  if (!*((_DWORD *)v28 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v36[0] = (char *)v28 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)v36);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [(MPSGraphOperation *)self inputTensors];
  id v13 = [v12 objectAtIndexedSubscript:0];
  if (v13 == v9)
  {
    int64_t mode = self->_mode;

    if (!mode)
    {
      id v18 = v10;
      goto LABEL_8;
    }
  }
  else
  {
  }
  v15 = [(MPSGraphOperation *)self inputTensors];
  id v16 = [v15 objectAtIndexedSubscript:1];
  if (v16 != v9)
  {

LABEL_7:
    id v18 = 0;
    goto LABEL_8;
  }
  int64_t v17 = self->_mode;

  if (v17) {
    goto LABEL_7;
  }
  id v20 = v10;
  uint64_t v21 = [(MPSGraphOperation *)self inputTensors];
  v22 = [v21 objectAtIndexedSubscript:2];

  id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  int64_t axis = self->_axis;
  uint64_t v25 = NSString;
  v26 = [(MPSGraphOperation *)self name];
  unint64_t v27 = [v25 stringWithFormat:@"%@/%@/gather", v11, v26];
  id v18 = [WeakRetained gatherWithUpdatesTensor:v20 indicesTensor:v22 axis:axis batchDimensions:0 name:v27];

LABEL_8:

  return v18;
}

@end