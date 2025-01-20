@interface MPSGraphRandomNormalOp
- (MPSGraphRandomNormalOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphRandomNormalOp

- (MPSGraphRandomNormalOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  *(&self->_dataType + 1) = [v15 dataType];
  [v15 mean];
  self->_mean = v17;
  [v15 standardDeviation];
  self->_standardDeviation = v18;
  self->_samplingMethod = [v15 samplingMethod];
  v19 = [(MPSGraphOperation *)self initWithGraph:v12 inputTensors:v13 controlDependencies:v14 name:v16];

  return v19;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  v67[4] = *MEMORY[0x1E4F143B8];
  id v49 = a7;
  mpsFileLoc("-[MPSGraphRandomNormalOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphRandomOps.mm", __p);
  id v11 = v49;
  __int16 v62 = 260;
  v61[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v61);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x120u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    HIBYTE(v67[0]) = 17;
    LOBYTE(v67[0]) = 108;
    int8x16_t __dst = *(int8x16_t *)"mps.random_normal";
    v19 = (char *)v67 + 1;
    goto LABEL_13;
  }
  id v14 = v11;
  id v15 = (const char *)[v11 UTF8String];
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
    v67[0] = v21 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v67[0]) = v16;
    p_dst = &__dst;
    if (!v16) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  v19 = &p_dst->i8[v17];
  id v11 = v14;
LABEL_13:
  __int8 *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v63);
  v22 = (std::string *)v63.__r_.__value_.__r.__words[0];
  if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v22 = &v63;
  }
  char v23 = 1;
  HIBYTE(v62) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v61[0] = v22;
    char v23 = 3;
  }
  LOBYTE(v62) = v23;
  uint64_t v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v61);
  uint64_t v25 = mlir::NameLoc::get(v24, v13);
  if (!v25) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v63.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v67[0]) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v67[0]) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v53 < 0) {
    operator delete(__p[0]);
  }
  id v50 = v11;
  uint64_t MLIRElementType = getMLIRElementType(*(mlir::MLIRContext **)a3, (mlir::MLIRContext *)*(&self->_dataType + 1));
  v27 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 8uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v28 = MLIRElementType;
  v29 = llvm::detail::IEEEFloat::IEEEFloat((llvm::detail::IEEEFloat *)v61, self->_mean);
  v30 = llvm::APFloatBase::IEEEsingle(v29);
  llvm::APFloat::Storage::Storage(&v59, v61, v30);
  llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)v61);
  llvm::detail::IEEEFloat::IEEEFloat((llvm::detail::IEEEFloat *)v61, self->_standardDeviation);
  llvm::APFloat::Storage::Storage(&v57, v61, v30);
  llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)v61);
  unsigned int samplingMethod = self->_samplingMethod;
  uint64_t v54 = v25;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v54);
  uint64_t v33 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.random_normal", (const unsigned __int8 *)0x11, Context);
  if (!v34)
  {
    __int16 v65 = 1283;
    v63.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.random_normal";
    uint64_t v64 = 17;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v56 = 259;
    llvm::operator+((uint64_t *)&v63, (uint64_t *)&v55, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v61, v25, v33);
  uint64_t v36 = *v27;
  uint64_t v35 = v27[1];
  v37 = v59;
  v39 = llvm::APFloatBase::PPCDoubleDouble(v38);
  if (v39 == v37) {
    llvm::detail::DoubleAPFloat::DoubleAPFloat(&__dst.i64[1], &v59);
  }
  else {
    llvm::detail::IEEEFloat::IEEEFloat((uint64_t)&__dst.i64[1], (uint64_t)&v59);
  }
  if (v39 == v57) {
    llvm::detail::DoubleAPFloat::DoubleAPFloat(&v63.__r_.__value_.__l.__size_, &v57);
  }
  else {
    llvm::detail::IEEEFloat::IEEEFloat((uint64_t)&v63.__r_.__value_.__l.__size_, (uint64_t)&v57);
  }
  mlir::mps::RandomNormalOp::build((mlir::Float32Type **)a3, (uint64_t)v61, v36, v35, v28, (uint64_t)&__dst, (uint64_t)&v63, samplingMethod);
  if (v39 == (void *)v63.__r_.__value_.__l.__size_)
  {
    std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)&v63.__r_.__value_.__r.__words[2]);
    v40 = v50;
    if (v39 != (void *)__dst.i64[1]) {
      goto LABEL_34;
    }
  }
  else
  {
    llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v63.__r_.__value_.__r.__words[1]);
    v40 = v50;
    if (v39 != (void *)__dst.i64[1])
    {
LABEL_34:
      llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&__dst.u64[1]);
      goto LABEL_37;
    }
  }
  std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)v67);
LABEL_37:
  v41 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v61);
  if (!v41)
  {
    v45 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v46 = 662;
    v47 = "Casting.h";
    v48 = "dyn_cast";
    goto LABEL_51;
  }
  uint64_t v42 = llvm::DefaultDoCastIfPossible<mlir::mps::RandomNormalOp,mlir::Operation *,llvm::CastInfo<mlir::mps::RandomNormalOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v41);
  if (!v42)
  {
    v45 = "result && \"builder didn't return the right type\"";
    int v46 = 497;
    v47 = "Builders.h";
    v48 = "create";
LABEL_51:
    __assert_rtn(v48, v47, v46, v45);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v61);
  if (!*(_DWORD *)(v42 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v51 = v42 - 16;
  if (v39 == v57)
  {
    std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)&v58);
    if (v39 != v59) {
      goto LABEL_42;
    }
LABEL_44:
    std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)&v60);
    goto LABEL_45;
  }
  llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v57);
  if (v39 == v59) {
    goto LABEL_44;
  }
LABEL_42:
  llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v59);
LABEL_45:
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v51);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  return 0;
}

@end