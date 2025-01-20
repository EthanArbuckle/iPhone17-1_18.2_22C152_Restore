@interface MPSGraphGRUGradientOp
- (MPSGraphGRUGradientOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphGRUGradientOp

- (MPSGraphGRUGradientOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = (MPSGraphGRUDescriptor *)[v15 copy];
  desc = self->super._desc;
  self->super._desc = v17;

  v19 = [(MPSGraphOperation *)self initWithGraph:v12 inputTensors:v13 controlDependencies:v14 name:v16];
  return v19;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v57 = a7;
  mpsFileLoc("-[MPSGraphGRUGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphRNNOps.mm", __p);
  id v11 = v57;
  __int16 v72 = 260;
  v71[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v71);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x34Bu, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    __dst[23] = 16;
    strcpy(__dst, "mps.gru_gradient");
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
    uint64_t v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v19 = v16 | 7;
    }
    uint64_t v20 = v19 + 1;
    v18 = operator new(v19 + 1);
    *(void *)&__dst[8] = v17;
    *(void *)&__dst[16] = v20 | 0x8000000000000000;
    *(void *)__dst = v18;
  }
  else
  {
    __dst[23] = v16;
    v18 = __dst;
    if (!v16) {
      goto LABEL_12;
    }
  }
  memmove(v18, v15, v17);
LABEL_12:
  v18[v17] = 0;
  a3 = v14;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &v67);
  v21 = (std::string *)v67.__r_.__value_.__r.__words[0];
  if ((v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v21 = &v67;
  }
  char v22 = 1;
  HIBYTE(v72) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v71[0] = v21;
    char v22 = 3;
  }
  LOBYTE(v72) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v71);
  uint64_t v24 = mlir::NameLoc::get(v23, v13);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v67.__r_.__value_.__l.__data_);
    if ((__dst[23] & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((__dst[23] & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(*(void **)__dst);
LABEL_20:

  if (v63 < 0) {
    operator delete(__p[0]);
  }
  MPSGraphRNNActivation v25 = [(MPSGraphGRUDescriptor *)self->super._desc updateGateActivation];
  if (v25 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu)) {
    unsigned int v26 = 1;
  }
  else {
    unsigned int v26 = v25;
  }
  MPSGraphRNNActivation v27 = [(MPSGraphGRUDescriptor *)self->super._desc resetGateActivation];
  if (v27 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu)) {
    unsigned int v28 = 1;
  }
  else {
    unsigned int v28 = v27;
  }
  MPSGraphRNNActivation v29 = [(MPSGraphGRUDescriptor *)self->super._desc outputGateActivation];
  if (v29 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu)) {
    int v30 = 1;
  }
  else {
    int v30 = v29;
  }
  desc = self->super._desc;
  v61 = v11;
  if (!desc->_hasInitState)
  {
    uint64_t v32 = 0;
    unint64_t v33 = 4;
    if (desc->_hasMask) {
      goto LABEL_34;
    }
LABEL_41:
    uint64_t v59 = 0;
    v60 = (mlir::UnitAttr **)a3;
    if (desc->_hasBias2) {
      goto LABEL_36;
    }
    goto LABEL_42;
  }
  if (*((void *)a5 + 1) - *(void *)a5 < 0x28uLL)
  {
    int v53 = 855;
    goto LABEL_56;
  }
  uint64_t v32 = *(void *)(*(void *)a5 + 32);
  unint64_t v33 = 5;
  if (!desc->_hasMask) {
    goto LABEL_41;
  }
LABEL_34:
  if (v33 >= (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3)
  {
    int v53 = 859;
    goto LABEL_56;
  }
  uint64_t v59 = *(void *)(*(void *)a5 + 8 * v33);
  v60 = (mlir::UnitAttr **)a3;
  ++v33;
  if (desc->_hasBias2)
  {
LABEL_36:
    if (v33 < (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3)
    {
      uint64_t v34 = *(void *)(*(void *)a5 + 8 * v33);
      goto LABEL_43;
    }
    int v53 = 863;
LABEL_56:
    __assert_rtn("-[MPSGraphGRUGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphRNNOps.mm", v53, "inputValues->size() > index");
  }
LABEL_42:
  uint64_t v34 = 0;
LABEL_43:
  uint64_t v35 = v24;
  unsigned int v58 = v30;
  unsigned int v36 = [(MPSGraphGRUDescriptor *)desc resetGateFirst];
  v37 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 0x18uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  unsigned int v38 = v36;
  char v39 = [(MPSGraphGRUDescriptor *)self->super._desc resetAfter];
  char v40 = [(MPSGraphGRUDescriptor *)self->super._desc flipZ];
  uint64_t v64 = v35;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v64);
  uint64_t v42 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.gru_gradient", (const unsigned __int8 *)0x10, Context);
  if (!v43)
  {
    __int16 v69 = 1283;
    v67.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.gru_gradient";
    uint64_t v68 = 16;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v66 = 259;
    llvm::operator+((uint64_t *)&v67, v65, (uint64_t)__dst);
    llvm::report_fatal_error((llvm::Twine *)__dst, 1);
  }
  mlir::OperationState::OperationState(v71, v35, v42);
  mlir::mps::GRUGradientOp::build(v60, (uint64_t)v71, *v37, v37[1], v37[2], v37[3], v26, v28, v58, v38, v39, v40, v32, v59, v34);
  v44 = mlir::OpBuilder::create((mlir::OpBuilder *)v60, (const mlir::OperationState *)v71);
  v45 = v44;
  if (!v44)
  {
    v49 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v50 = 662;
    v51 = "Casting.h";
    v52 = "dyn_cast";
    goto LABEL_66;
  }
  uint64_t v46 = *((void *)v44 + 6);
  v47 = *(void **)(v46 + 16);
  if (v47 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    *(void *)__dst = *(void *)(v46 + 8);
    AttrData = (void *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)__dst);
    if (v55 == 16 && *AttrData == 0x5F7572672E73706DLL && AttrData[1] == 0x746E656964617267)
    {
      __int16 v69 = 1283;
      v67.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v67.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.gru_gradient";
      uint64_t v68 = 16;
      v65[0] = (uint64_t)"' failed due to the operation not being registered";
      __int16 v66 = 259;
      llvm::operator+((uint64_t *)&v67, v65, (uint64_t)__dst);
      llvm::report_fatal_error((llvm::Twine *)__dst, 1);
    }
    goto LABEL_65;
  }
  if (v47 != &mlir::detail::TypeIDResolver<mlir::mps::GRUGradientOp,void>::id)
  {
LABEL_65:
    v49 = "result && \"builder didn't return the right type\"";
    int v50 = 497;
    v51 = "Builders.h";
    v52 = "create";
LABEL_66:
    __assert_rtn(v52, v51, v50, v49);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v71);

  return v45;
}

@end