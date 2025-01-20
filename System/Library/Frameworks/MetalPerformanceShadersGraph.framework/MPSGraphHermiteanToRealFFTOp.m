@interface MPSGraphHermiteanToRealFFTOp
- (MPSGraphHermiteanToRealFFTOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7;
- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphHermiteanToRealFFTOp

- (MPSGraphHermiteanToRealFFTOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
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
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphHermiteanToRealFFTOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphFourierTransformOps.mm", __p);
  id v12 = v11;
  __int16 v61 = 260;
  v60[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v60);
  uint64_t v14 = mlir::FileLineColLoc::get(StringAttr, 0xD0u, 0);
  if (!v14) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v12)
  {
    v19 = (char *)operator new(0x20uLL);
    __dst = (void **)v19;
    long long v59 = xmmword_181130E20;
    qmemcpy(v19, "mps.hermitean_to_real_fft", 25);
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
    *(void *)&long long v59 = v17;
    *((void *)&v59 + 1) = v22 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v59) = v16;
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
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v55);
  v23 = (std::string *)v55.__r_.__value_.__r.__words[0];
  if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v23 = &v55;
  }
  char v24 = 1;
  HIBYTE(v61) = 1;
  if (v23->__r_.__value_.__s.__data_[0])
  {
    v60[0] = v23;
    char v24 = 3;
  }
  LOBYTE(v61) = v24;
  uint64_t v25 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v60);
  uint64_t v26 = mlir::NameLoc::get(v25, v14);
  if (!v26) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v55.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v59) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v59) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  if (v51 < 0) {
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
  BOOL v30 = [(MPSGraphFFTDescriptor *)self->_desc roundToOddHermitean];
  v31 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 8uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  int v32 = v30;
  uint64_t v52 = v26;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v52);
  uint64_t v34 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.hermitean_to_real_fft", (const unsigned __int8 *)0x19, Context);
  if (!v35)
  {
    __int16 v57 = 1283;
    v55.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.hermitean_to_real_fft";
    uint64_t v56 = 25;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v54 = 259;
    llvm::operator+((uint64_t *)&v55, v53, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v60, v26, v34);
  mlir::mps::HermiteanToRealFFTOp::build((mlir::UnitAttr **)a3, (uint64_t)v60, *v31, v31[1], v29, v27, v32);
  v36 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v60);
  v37 = v36;
  if (!v36)
  {
    v41 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v42 = 662;
    v43 = "Casting.h";
    v44 = "dyn_cast";
    goto LABEL_52;
  }
  uint64_t v38 = *((void *)v36 + 6);
  v39 = *(void **)(v38 + 16);
  if (v39 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst = *(void ***)(v38 + 8);
    uint64_t AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v46 == 25
      && *(void *)AttrData == 0x6D7265682E73706DLL
      && *(void *)(AttrData + 8) == 0x6F745F6E61657469
      && *(void *)(AttrData + 16) == 0x66665F6C6165725FLL
      && *(unsigned char *)(AttrData + 24) == 116)
    {
      __int16 v57 = 1283;
      v55.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v55.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.hermitean_to_real_fft";
      uint64_t v56 = 25;
      v53[0] = (uint64_t)"' failed due to the operation not being registered";
      __int16 v54 = 259;
      llvm::operator+((uint64_t *)&v55, v53, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    goto LABEL_51;
  }
  if (v39 != &mlir::detail::TypeIDResolver<mlir::mps::HermiteanToRealFFTOp,void>::id)
  {
LABEL_51:
    v41 = "result && \"builder didn't return the right type\"";
    int v42 = 497;
    v43 = "Builders.h";
    v44 = "create";
LABEL_52:
    __assert_rtn(v44, v43, v42, v41);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v60);

  return v37;
}

- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5
{
  return 0;
}

- (void).cxx_destruct
{
}

@end