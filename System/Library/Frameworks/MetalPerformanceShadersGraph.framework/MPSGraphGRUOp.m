@interface MPSGraphGRUOp
- (MPSGraphGRUOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7;
- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphGRUOp

- (MPSGraphGRUOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
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
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v54 = a7;
  mpsFileLoc("-[MPSGraphGRUOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphRNNOps.mm", __p);
  id v11 = v54;
  __int16 v71 = 260;
  v70[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v70);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x2BFu, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    HIBYTE(v69) = 7;
    qmemcpy(&__dst, "mps.gru", 7);
    v18 = &__dst.i8[7];
    goto LABEL_13;
  }
  id v14 = (const char *)[v11 UTF8String];
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
    p_dst = (int8x16_t *)operator new(v19 + 1);
    __dst.i64[1] = v16;
    unint64_t v69 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v69) = v15;
    p_dst = &__dst;
    if (!v15) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v18 = &p_dst->i8[v16];
LABEL_13:
  __int8 *v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v65);
  v21 = (std::string *)v65.__r_.__value_.__r.__words[0];
  if ((v65.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v21 = &v65;
  }
  char v22 = 1;
  HIBYTE(v71) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v70[0] = v21;
    char v22 = 3;
  }
  LOBYTE(v71) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v70);
  uint64_t v24 = mlir::NameLoc::get(v23, v13);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v65.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v65.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v69) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v69) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v61 < 0) {
    operator delete(__p[0]);
  }
  BOOL v25 = [(MPSGraphGRUDescriptor *)self->super._desc training];
  MPSGraphRNNActivation v26 = [(MPSGraphGRUDescriptor *)self->super._desc updateGateActivation];
  if (v26 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu)) {
    int v27 = 1;
  }
  else {
    int v27 = v26;
  }
  MPSGraphRNNActivation v28 = [(MPSGraphGRUDescriptor *)self->super._desc resetGateActivation];
  v59 = v11;
  if (v28 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu)) {
    int v29 = 1;
  }
  else {
    int v29 = v28;
  }
  MPSGraphRNNActivation v30 = [(MPSGraphGRUDescriptor *)self->super._desc outputGateActivation];
  if (v30 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu)) {
    int v31 = 1;
  }
  else {
    int v31 = v30;
  }
  desc = self->super._desc;
  if (!desc->_hasInitState)
  {
    uint64_t v33 = 0;
    unint64_t v34 = 2;
    if (desc->_hasMask) {
      goto LABEL_34;
    }
LABEL_41:
    uint64_t v55 = 0;
    unsigned int v57 = v31;
    unsigned int v58 = v29;
    unsigned int v56 = v27;
    if (desc->_hasBias2) {
      goto LABEL_36;
    }
    goto LABEL_42;
  }
  if (*((void *)a5 + 1) - *(void *)a5 < 0x18uLL)
  {
    int v53 = 717;
    goto LABEL_57;
  }
  uint64_t v33 = *(void *)(*(void *)a5 + 16);
  unint64_t v34 = 3;
  if (!desc->_hasMask) {
    goto LABEL_41;
  }
LABEL_34:
  if (v34 >= (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3)
  {
    int v53 = 721;
    goto LABEL_57;
  }
  uint64_t v55 = *(void *)(*(void *)a5 + 8 * v34++);
  unsigned int v57 = v31;
  unsigned int v58 = v29;
  unsigned int v56 = v27;
  if (desc->_hasBias2)
  {
LABEL_36:
    if (v34 < (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3)
    {
      char v35 = v25;
      uint64_t v36 = *(void *)(*(void *)a5 + 8 * v34);
      goto LABEL_43;
    }
    int v53 = 725;
LABEL_57:
    __assert_rtn("-[MPSGraphGRUOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphRNNOps.mm", v53, "inputValues->size() > index");
  }
LABEL_42:
  char v35 = v25;
  uint64_t v36 = 0;
LABEL_43:
  v37 = (mlir::UnitAttr **)a3;
  unsigned int v38 = [(MPSGraphGRUDescriptor *)desc resetGateFirst];
  v39 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 8uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  unsigned int v40 = v38;
  char v41 = [(MPSGraphGRUDescriptor *)self->super._desc resetAfter];
  unsigned __int8 v42 = [(MPSGraphGRUDescriptor *)self->super._desc flipZ];
  uint64_t v62 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v62);
  uint64_t v44 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.gru", (const unsigned __int8 *)7, Context);
  if (!v45)
  {
    __int16 v67 = 1283;
    v65.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.gru";
    uint64_t v66 = 7;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v64 = 259;
    llvm::operator+((uint64_t *)&v65, (uint64_t *)&v63, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v70, v24, v44);
  mlir::mps::GRUOp::build(v37, (uint64_t)v70, *v39, v39[1], v56, v58, v57, v40, v35, v41, v42, v33, v55, v36);
  v46 = mlir::OpBuilder::create((mlir::OpBuilder *)v37, (const mlir::OperationState *)v70);
  if (!v46)
  {
    v49 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v50 = 662;
    v51 = "Casting.h";
    v52 = "dyn_cast";
    goto LABEL_53;
  }
  v47 = (void *)llvm::DefaultDoCastIfPossible<mlir::mps::GRUOp,mlir::Operation *,llvm::CastInfo<mlir::mps::GRUOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v46);
  if (!v47)
  {
    v49 = "result && \"builder didn't return the right type\"";
    int v50 = 497;
    v51 = "Builders.h";
    v52 = "create";
LABEL_53:
    __assert_rtn(v52, v51, v50, v49);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v70);

  return v47;
}

- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count])
  {
    id v11 = self->super._desc;
    v37 = v9;
    if (![(MPSGraphGRUDescriptor *)v11 training])
    {
      id v12 = (MPSGraphGRUDescriptor *)[(MPSGraphGRUDescriptor *)self->super._desc copy];

      id v11 = v12;
      [(MPSGraphGRUDescriptor *)v12 setTraining:1];
    }
    desc = self->super._desc;
    if (desc->_hasInitState)
    {
      if ([(NSArray *)self->super.super._inputTensors count] <= 2) {
        __assert_rtn("-[MPSGraphGRUOp partialDerivativesForInputTensors:incomingGradients:name:]", "MPSGraphRNNOps.mm", 769, "_inputTensors.count > index");
      }
      uint64_t v14 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:2];
      desc = self->super._desc;
      unint64_t v15 = 3;
      v39 = (void *)v14;
      if (desc->_hasMask)
      {
LABEL_7:
        if ([(NSArray *)self->super.super._inputTensors count] <= v15) {
          __assert_rtn("-[MPSGraphGRUOp partialDerivativesForInputTensors:incomingGradients:name:]", "MPSGraphRNNOps.mm", 773, "_inputTensors.count > index");
        }
        size_t v16 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:v15++];
        id v36 = v10;
        if (self->super._desc->_hasBias2) {
          goto LABEL_9;
        }
        goto LABEL_16;
      }
    }
    else
    {
      v39 = 0;
      unint64_t v15 = 2;
      if (desc->_hasMask) {
        goto LABEL_7;
      }
    }
    size_t v16 = 0;
    id v36 = v10;
    if (desc->_hasBias2)
    {
LABEL_9:
      if ([(NSArray *)self->super.super._inputTensors count] <= v15) {
        __assert_rtn("-[MPSGraphGRUOp partialDerivativesForInputTensors:incomingGradients:name:]", "MPSGraphRNNOps.mm", 777, "_inputTensors.count > index");
      }
      unsigned int v38 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:v15];
      goto LABEL_17;
    }
LABEL_16:
    unsigned int v38 = 0;
LABEL_17:
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
    char v35 = v11;
    uint64_t v19 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:0];
    uint64_t v20 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:1];
    v21 = [WeakRetained GRUWithSourceTensor:v19 recurrentWeight:v20 inputWeight:0 bias:0 initState:v39 mask:v16 secondaryBias:v38 descriptor:v11 name:@"GRU fwd"];

    id v22 = objc_loadWeakRetained((id *)&self->super.super._graph);
    uint64_t v23 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:0];
    uint64_t v24 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:1];
    BOOL v25 = [v37 objectAtIndexedSubscript:0];
    MPSGraphRNNActivation v26 = [v21 objectAtIndexedSubscript:1];
    int v27 = [v21 objectAtIndexedSubscript:0];
    MPSGraphRNNActivation v28 = [v22 GRUGradientsWithSourceTensor:v23 recurrentWeight:v24 sourceGradient:v25 zState:v26 outputFwd:v27 stateGradient:0 inputWeight:0 bias:0 initState:v39 mask:v16 secondaryBias:v38 descriptor:v35 name:v36];

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    for (unint64_t i = 0; i < [v8 count]; ++i)
    {
      MPSGraphRNNActivation v30 = [MEMORY[0x1E4F1CA98] null];
      int v31 = [v8 objectAtIndexedSubscript:i];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        uint64_t v33 = [v28 objectAtIndexedSubscript:i];

        MPSGraphRNNActivation v30 = (void *)v33;
      }
      [v17 addObject:v30];
    }
    id v10 = v36;
    id v9 = v37;
    goto LABEL_23;
  }
  if (MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  v17 = 0;
LABEL_23:

  return v17;
}

@end