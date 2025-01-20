@interface MPSGraphLSTMGradientOp
- (MPSGraphLSTMGradientOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphLSTMGradientOp

- (MPSGraphLSTMGradientOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = (MPSGraphLSTMDescriptor *)[v15 copy];
  desc = self->super._desc;
  self->super._desc = v17;

  v19 = [(MPSGraphOperation *)self initWithGraph:v12 inputTensors:v13 controlDependencies:v14 name:v16];
  return v19;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v69 = a7;
  mpsFileLoc("-[MPSGraphLSTMGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphRNNOps.mm", __p);
  id v11 = v69;
  __int16 v87 = 260;
  v86[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v86);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x25Bu, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    HIBYTE(v85) = 17;
    LOBYTE(v85) = 116;
    int8x16_t __dst = *(int8x16_t *)"mps.lstm_gradient";
    v19 = (char *)&v85 + 1;
    goto LABEL_13;
  }
  id v14 = a3;
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
    unint64_t v85 = v21 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v85) = v16;
    p_dst = &__dst;
    if (!v16) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  v19 = &p_dst->i8[v17];
  a3 = v14;
LABEL_13:
  __int8 *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v81);
  v22 = (std::string *)v81.__r_.__value_.__r.__words[0];
  if ((v81.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v22 = &v81;
  }
  char v23 = 1;
  HIBYTE(v87) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v86[0] = v22;
    char v23 = 3;
  }
  LOBYTE(v87) = v23;
  uint64_t v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v86);
  uint64_t v25 = mlir::NameLoc::get(v24, v13);
  if (!v25) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v81.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v81.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v85) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v85) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v77 < 0) {
    operator delete(__p[0]);
  }
  MPSGraphRNNActivation v26 = [(MPSGraphLSTMDescriptor *)self->super._desc inputGateActivation];
  if (v26 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu)) {
    int v27 = 1;
  }
  else {
    int v27 = v26;
  }
  unsigned int v75 = v27;
  MPSGraphRNNActivation v28 = [(MPSGraphLSTMDescriptor *)self->super._desc forgetGateActivation];
  if (v28 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu)) {
    int v29 = 1;
  }
  else {
    int v29 = v28;
  }
  MPSGraphRNNActivation v30 = [(MPSGraphLSTMDescriptor *)self->super._desc cellGateActivation];
  if (v30 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu)) {
    int v31 = 1;
  }
  else {
    int v31 = v30;
  }
  MPSGraphRNNActivation v32 = [(MPSGraphLSTMDescriptor *)self->super._desc outputGateActivation];
  if (v32 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu)) {
    int v33 = 1;
  }
  else {
    int v33 = v32;
  }
  MPSGraphRNNActivation v34 = [(MPSGraphLSTMDescriptor *)self->super._desc activation];
  if (v34 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu)) {
    int v35 = 1;
  }
  else {
    int v35 = v34;
  }
  unsigned int v74 = v35;
  desc = self->super._desc;
  v73 = v11;
  if (!desc->_hasInitState)
  {
    uint64_t v37 = 0;
    unint64_t v38 = 4;
    if (desc->_hasInitCell) {
      goto LABEL_40;
    }
LABEL_51:
    unsigned int v39 = v29;
    uint64_t v40 = 0;
    if (desc->_hasMask) {
      goto LABEL_42;
    }
LABEL_52:
    uint64_t v41 = 0;
    if (desc->_hasPeephole) {
      goto LABEL_44;
    }
LABEL_53:
    uint64_t v42 = 0;
    unsigned int v71 = v31;
    unsigned int v72 = v39;
    unsigned int v70 = v33;
    if (desc->_hasCellGradient) {
      goto LABEL_46;
    }
    goto LABEL_54;
  }
  if (*((void *)a5 + 1) - *(void *)a5 < 0x28uLL)
  {
    int v64 = 619;
    goto LABEL_70;
  }
  uint64_t v37 = *(void *)(*(void *)a5 + 32);
  unint64_t v38 = 5;
  if (!desc->_hasInitCell) {
    goto LABEL_51;
  }
LABEL_40:
  if (v38 >= (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3)
  {
    int v64 = 623;
    goto LABEL_70;
  }
  unsigned int v39 = v29;
  uint64_t v40 = *(void *)(*(void *)a5 + 8 * v38++);
  if (!desc->_hasMask) {
    goto LABEL_52;
  }
LABEL_42:
  if (v38 >= (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3)
  {
    int v64 = 627;
    goto LABEL_70;
  }
  uint64_t v41 = *(void *)(*(void *)a5 + 8 * v38++);
  if (!desc->_hasPeephole) {
    goto LABEL_53;
  }
LABEL_44:
  if (v38 >= (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3)
  {
    int v64 = 631;
    goto LABEL_70;
  }
  uint64_t v42 = *(void *)(*(void *)a5 + 8 * v38++);
  unsigned int v71 = v31;
  unsigned int v72 = v39;
  unsigned int v70 = v33;
  if (desc->_hasCellGradient)
  {
LABEL_46:
    if (v38 < (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3)
    {
      uint64_t v43 = v25;
      uint64_t v44 = v37;
      uint64_t v45 = v43;
      uint64_t v46 = *(void *)(*(void *)a5 + 8 * v38);
      goto LABEL_55;
    }
    int v64 = 635;
LABEL_70:
    __assert_rtn("-[MPSGraphLSTMGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphRNNOps.mm", v64, "inputValues->size() > index");
  }
LABEL_54:
  uint64_t v47 = v25;
  uint64_t v44 = v37;
  uint64_t v45 = v47;
  uint64_t v46 = 0;
LABEL_55:
  v48 = (mlir::MLIRContext **)a3;
  unsigned int v49 = [(MPSGraphLSTMDescriptor *)desc forgetGateLast];
  v50 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 0x18uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  unsigned int v51 = v49;
  uint64_t v78 = v45;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v78);
  uint64_t v53 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.lstm_gradient", (const unsigned __int8 *)0x11, Context);
  if (!v54)
  {
    __int16 v83 = 1283;
    v81.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.lstm_gradient";
    uint64_t v82 = 17;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v80 = 259;
    llvm::operator+((uint64_t *)&v81, v79, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v86, v45, v53);
  mlir::mps::LSTMGradientOp::build(v48, (uint64_t)v86, *v50, v50[1], v50[2], v50[3], v75, v72, v71, v70, v74, v51, v44, v40, v41, v42, 0, v46);
  v55 = mlir::OpBuilder::create((mlir::OpBuilder *)v48, (const mlir::OperationState *)v86);
  v56 = v55;
  if (!v55)
  {
    v60 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v61 = 662;
    v62 = "Casting.h";
    v63 = "dyn_cast";
    goto LABEL_83;
  }
  uint64_t v57 = *((void *)v55 + 6);
  v58 = *(void **)(v57 + 16);
  if (v58 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst.i64[0] = *(void *)(v57 + 8);
    uint64_t AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v66 == 17
      && *(void *)AttrData == 0x6D74736C2E73706DLL
      && *(void *)(AttrData + 8) == 0x6E6569646172675FLL
      && *(unsigned char *)(AttrData + 16) == 116)
    {
      __int16 v83 = 1283;
      v81.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v81.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.lstm_gradient";
      uint64_t v82 = 17;
      v79[0] = (uint64_t)"' failed due to the operation not being registered";
      __int16 v80 = 259;
      llvm::operator+((uint64_t *)&v81, v79, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    goto LABEL_82;
  }
  if (v58 != &mlir::detail::TypeIDResolver<mlir::mps::LSTMGradientOp,void>::id)
  {
LABEL_82:
    v60 = "result && \"builder didn't return the right type\"";
    int v61 = 497;
    v62 = "Builders.h";
    v63 = "create";
LABEL_83:
    __assert_rtn(v63, v62, v61, v60);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v86);

  return v56;
}

@end