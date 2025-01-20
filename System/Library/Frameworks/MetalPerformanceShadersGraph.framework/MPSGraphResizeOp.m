@interface MPSGraphResizeOp
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphResizeOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v41 = a7;
  mpsFileLoc("-[MPSGraphResizeOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphResizeOps.mm", v45);
  id v11 = v41;
  __int16 v56 = 260;
  v55[0] = v45;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v55);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0xB4u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    HIBYTE(v54) = 10;
    strcpy(__dst.i8, "mps.resize");
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
    unint64_t v54 = v19 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v54) = v15;
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
  HIBYTE(v56) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v55[0] = p_p;
    char v21 = 3;
  }
  LOBYTE(v56) = v21;
  uint64_t v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v55);
  uint64_t v23 = mlir::NameLoc::get(v22, v13);
  if (!v23) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v54) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v54) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v46 < 0)
  {
    operator delete(v45[0]);
    v25 = *(uint64_t **)a5;
    v24 = (uint64_t *)*((void *)a5 + 1);
    unint64_t v26 = (unint64_t)v24 - *(void *)a5;
    v42 = v11;
    if (v26 == 32) {
      goto LABEL_22;
    }
  }
  else
  {
    v25 = *(uint64_t **)a5;
    v24 = (uint64_t *)*((void *)a5 + 1);
    unint64_t v26 = (unint64_t)v24 - *(void *)a5;
    v42 = v11;
    if (v26 == 32)
    {
LABEL_22:
      uint64_t v27 = v25[2];
      uint64_t v43 = v25[3];
      goto LABEL_29;
    }
  }
  if (v24 == v25 || v26 <= 8) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v43 = 0;
  uint64_t v27 = 0;
LABEL_29:
  unsigned int mode = self->super._mode;
  uint64_t v29 = mlir::mps::NearestRoundingModeAttr::get(*(mlir::MLIRContext **)a3, self->super._nearestRoundingMode);
  uint64_t v47 = v23;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v47);
  uint64_t v31 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.resize", (const unsigned __int8 *)0xA, Context);
  if (!v32)
  {
    __int16 v52 = 1283;
    __p.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.resize";
    uint64_t v51 = 10;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v49 = 259;
    llvm::operator+((uint64_t *)&__p, (uint64_t *)&v48, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v55, v23, v31);
  mlir::mps::ResizeOp::build((mlir::UnitAttr **)a3, (uint64_t)v55, *v25, v25[1], v27, v43, mode, self->super._centerResult, self->super._alignCorners, v29);
  v33 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v55);
  if (!v33)
  {
    v37 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v38 = 662;
    v39 = "Casting.h";
    v40 = "dyn_cast";
    goto LABEL_39;
  }
  uint64_t v34 = llvm::DefaultDoCastIfPossible<mlir::mps::ResizeOp,mlir::Operation *,llvm::CastInfo<mlir::mps::ResizeOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v33);
  if (!v34)
  {
    v37 = "result && \"builder didn't return the right type\"";
    int v38 = 497;
    v39 = "Builders.h";
    v40 = "create";
LABEL_39:
    __assert_rtn(v40, v39, v38, v37);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v55);
  if (!*(_DWORD *)(v34 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v44 = v34 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v44);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (a5)
  {
    uint64_t v13 = 0;
    goto LABEL_13;
  }
  if (!self->super._mode)
  {
    uint64_t v19 = [(MPSGraphOperation *)self inputTensors];
    uint64_t v20 = [v19 count];

    id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
    v17 = WeakRetained;
    if (v20 == 2)
    {
      uint64_t v18 = [WeakRetained resizeNearestWithGradientTensor:v11 input:v10 nearestRoundingMode:self->super._nearestRoundingMode centerResult:self->super._centerResult alignCorners:self->super._alignCorners layout:self->super._layout name:v12];
      goto LABEL_8;
    }
    uint64_t v22 = [(MPSGraphOperation *)self inputTensors];
    uint64_t v23 = [v22 objectAtIndexedSubscript:2];
    uint64_t v24 = [v17 resizeNearestWithGradientTensor:v11 input:v10 scaleOffsetTensor:v23 nearestRoundingMode:self->super._nearestRoundingMode layout:self->super._layout name:v12];
LABEL_11:
    uint64_t v13 = (void *)v24;

    goto LABEL_12;
  }
  v14 = [(MPSGraphOperation *)self inputTensors];
  uint64_t v15 = [v14 count];

  id v16 = objc_loadWeakRetained((id *)&self->super.super._graph);
  v17 = v16;
  if (v15 != 2)
  {
    uint64_t v22 = [(MPSGraphOperation *)self inputTensors];
    uint64_t v23 = [v22 objectAtIndexedSubscript:2];
    uint64_t v24 = [v17 resizeWithGradientTensor:v11 input:v10 scaleOffsetTensor:v23 mode:self->super._mode layout:self->super._layout name:v12];
    goto LABEL_11;
  }
  uint64_t v18 = [v16 resizeWithGradientTensor:v11 input:v10 mode:self->super._mode centerResult:self->super._centerResult alignCorners:self->super._alignCorners layout:self->super._layout name:v12];
LABEL_8:
  uint64_t v13 = (void *)v18;
LABEL_12:

LABEL_13:

  return v13;
}

@end