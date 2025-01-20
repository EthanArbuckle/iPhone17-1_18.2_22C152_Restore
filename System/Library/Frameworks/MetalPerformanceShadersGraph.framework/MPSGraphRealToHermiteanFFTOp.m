@interface MPSGraphRealToHermiteanFFTOp
- (MPSGraphRealToHermiteanFFTOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7;
- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphRealToHermiteanFFTOp

- (MPSGraphRealToHermiteanFFTOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = (MPSGraphFFTDescriptor *)[v15 copy];
  desc = self->_desc;
  self->_desc = v17;

  v19 = [(MPSGraphOperation *)self initWithGraph:v12 inputTensors:v13 controlDependencies:v14 name:v16];
  return v19;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphRealToHermiteanFFTOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphFourierTransformOps.mm", __p);
  id v12 = v11;
  __int16 v59 = 260;
  v58[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v58);
  uint64_t v14 = mlir::FileLineColLoc::get(StringAttr, 0xA0u, 0);
  if (!v14) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v12)
  {
    v19 = (char *)operator new(0x20uLL);
    __dst = (void **)v19;
    long long v57 = xmmword_181130E20;
    qmemcpy(v19, "mps.real_to_hermitean_fft", 25);
    v20 = v19 + 25;
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
    uint64_t v21 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v21 = v16 | 7;
    }
    uint64_t v22 = v21 + 1;
    p_dst = (void **)operator new(v21 + 1);
    *(void *)&long long v57 = v17;
    *((void *)&v57 + 1) = v22 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v57) = v16;
    p_dst = (void **)&__dst;
    if (!v16) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  v20 = (char *)p_dst + v17;
LABEL_13:
  unsigned char *v20 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v53);
  v23 = (std::string *)v53.__r_.__value_.__r.__words[0];
  if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v23 = &v53;
  }
  char v24 = 1;
  HIBYTE(v59) = 1;
  if (v23->__r_.__value_.__s.__data_[0])
  {
    v58[0] = v23;
    char v24 = 3;
  }
  LOBYTE(v59) = v24;
  uint64_t v25 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v58);
  uint64_t v26 = mlir::NameLoc::get(v25, v14);
  if (!v26) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v53.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v57) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v57) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  if (v49 < 0) {
    operator delete(__p[0]);
  }
  int v27 = [(MPSGraphFFTDescriptor *)self->_desc inverse];
  MPSGraphFFTScalingMode v28 = [(MPSGraphFFTDescriptor *)self->_desc scalingMode];
  if (v28 == MPSGraphFFTScalingModeUnitary) {
    unsigned int v29 = 2;
  }
  else {
    unsigned int v29 = v28 == MPSGraphFFTScalingModeSize;
  }
  v30 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 8uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v50 = v26;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v50);
  uint64_t v32 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.real_to_hermitean_fft", (const unsigned __int8 *)0x19, Context);
  if (!v33)
  {
    __int16 v55 = 1283;
    v53.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.real_to_hermitean_fft";
    uint64_t v54 = 25;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v52 = 259;
    llvm::operator+((uint64_t *)&v53, v51, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v58, v26, v32);
  mlir::mps::RealToHermiteanFFTOp::build((mlir::UnitAttr **)a3, (uint64_t)v58, *v30, v30[1], v29, v27);
  v34 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v58);
  v35 = v34;
  if (!v34)
  {
    v39 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v40 = 662;
    v41 = "Casting.h";
    v42 = "dyn_cast";
    goto LABEL_52;
  }
  uint64_t v36 = *((void *)v34 + 6);
  v37 = *(void **)(v36 + 16);
  if (v37 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst = *(void ***)(v36 + 8);
    uint64_t AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v44 == 25
      && *(void *)AttrData == 0x6C6165722E73706DLL
      && *(void *)(AttrData + 8) == 0x6D7265685F6F745FLL
      && *(void *)(AttrData + 16) == 0x66665F6E61657469
      && *(unsigned char *)(AttrData + 24) == 116)
    {
      __int16 v55 = 1283;
      v53.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v53.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.real_to_hermitean_fft";
      uint64_t v54 = 25;
      v51[0] = (uint64_t)"' failed due to the operation not being registered";
      __int16 v52 = 259;
      llvm::operator+((uint64_t *)&v53, v51, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    goto LABEL_51;
  }
  if (v37 != &mlir::detail::TypeIDResolver<mlir::mps::RealToHermiteanFFTOp,void>::id)
  {
LABEL_51:
    v39 = "result && \"builder didn't return the right type\"";
    int v40 = 497;
    v41 = "Builders.h";
    v42 = "create";
LABEL_52:
    __assert_rtn(v42, v41, v40, v39);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v58);

  return v35;
}

- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5
{
  return 0;
}

- (void).cxx_destruct
{
}

@end