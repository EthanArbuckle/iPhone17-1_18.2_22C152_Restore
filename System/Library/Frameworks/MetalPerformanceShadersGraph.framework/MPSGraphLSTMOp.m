@interface MPSGraphLSTMOp
- (MPSGraphLSTMOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7;
- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphLSTMOp

- (MPSGraphLSTMOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
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
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v57 = a7;
  mpsFileLoc("-[MPSGraphLSTMOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphRNNOps.mm", __p);
  id v11 = v57;
  __int16 v75 = 260;
  v74[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v74);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x1BDu, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    HIBYTE(v73) = 8;
    strcpy(__dst.i8, "mps.lstm");
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
    uint64_t v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v19 = v16 | 7;
    }
    uint64_t v20 = v19 + 1;
    p_dst = (int8x16_t *)operator new(v19 + 1);
    __dst.i64[1] = v17;
    unint64_t v73 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v73) = v16;
    p_dst = &__dst;
    if (!v16) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  p_dst->i8[v17] = 0;
  id v11 = v14;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v69);
  v21 = (std::string *)v69.__r_.__value_.__r.__words[0];
  if ((v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v21 = &v69;
  }
  char v22 = 1;
  HIBYTE(v75) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v74[0] = v21;
    char v22 = 3;
  }
  LOBYTE(v75) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v74);
  uint64_t v24 = mlir::NameLoc::get(v23, v13);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v69.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v73) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v73) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v65 < 0) {
    operator delete(__p[0]);
  }
  BOOL v25 = [(MPSGraphLSTMDescriptor *)self->super._desc training];
  MPSGraphRNNActivation v26 = [(MPSGraphLSTMDescriptor *)self->super._desc inputGateActivation];
  if (v26 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu)) {
    unsigned int v27 = 1;
  }
  else {
    unsigned int v27 = v26;
  }
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
  unsigned int v63 = v33;
  MPSGraphRNNActivation v34 = [(MPSGraphLSTMDescriptor *)self->super._desc activation];
  if (v34 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu)) {
    int v35 = 1;
  }
  else {
    int v35 = v34;
  }
  unsigned int v62 = v35;
  desc = self->super._desc;
  if (!desc->_hasInitState)
  {
    uint64_t v61 = 0;
    unint64_t v37 = 2;
    if (desc->_hasInitCell) {
      goto LABEL_40;
    }
LABEL_49:
    uint64_t v58 = 0;
    unsigned int v59 = v31;
    unsigned int v60 = v29;
    if (desc->_hasMask) {
      goto LABEL_42;
    }
LABEL_50:
    v38 = (mlir::UnitAttr **)a3;
    uint64_t v39 = 0;
    if (desc->_hasPeephole) {
      goto LABEL_44;
    }
    goto LABEL_51;
  }
  if (*((void *)a5 + 1) - *(void *)a5 < 0x18uLL)
  {
    int v56 = 462;
    goto LABEL_67;
  }
  uint64_t v61 = *(void *)(*(void *)a5 + 16);
  unint64_t v37 = 3;
  if (!desc->_hasInitCell) {
    goto LABEL_49;
  }
LABEL_40:
  if (v37 >= (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3)
  {
    int v56 = 466;
    goto LABEL_67;
  }
  uint64_t v58 = *(void *)(*(void *)a5 + 8 * v37++);
  unsigned int v59 = v31;
  unsigned int v60 = v29;
  if (!desc->_hasMask) {
    goto LABEL_50;
  }
LABEL_42:
  if (v37 >= (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3)
  {
    int v56 = 470;
    goto LABEL_67;
  }
  v38 = (mlir::UnitAttr **)a3;
  uint64_t v39 = *(void *)(*(void *)a5 + 8 * v37++);
  if (desc->_hasPeephole)
  {
LABEL_44:
    if (v37 < (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3)
    {
      v40 = v11;
      uint64_t v41 = *(void *)(*(void *)a5 + 8 * v37);
      goto LABEL_52;
    }
    int v56 = 474;
LABEL_67:
    __assert_rtn("-[MPSGraphLSTMOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphRNNOps.mm", v56, "inputValues->size() > index");
  }
LABEL_51:
  v40 = v11;
  uint64_t v41 = 0;
LABEL_52:
  char v42 = v25;
  unsigned int v43 = [(MPSGraphLSTMDescriptor *)desc forgetGateLast];
  v44 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 8uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  unsigned int v45 = v43;
  uint64_t v66 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v66);
  uint64_t v47 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.lstm", (const unsigned __int8 *)8, Context);
  if (!v48)
  {
    __int16 v71 = 1283;
    v69.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.lstm";
    uint64_t v70 = 8;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v68 = 259;
    llvm::operator+((uint64_t *)&v69, (uint64_t *)&v67, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v74, v24, v47);
  mlir::mps::LSTMOp::build(v38, (uint64_t)v74, *v44, v44[1], v27, v60, v59, v63, v62, v45, v42, v61, v58, v39, v41, 0);
  v49 = mlir::OpBuilder::create((mlir::OpBuilder *)v38, (const mlir::OperationState *)v74);
  if (!v49)
  {
    v52 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v53 = 662;
    v54 = "Casting.h";
    v55 = "dyn_cast";
    goto LABEL_62;
  }
  v50 = (void *)llvm::DefaultDoCastIfPossible<mlir::mps::LSTMOp,mlir::Operation *,llvm::CastInfo<mlir::mps::LSTMOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v49);
  if (!v50)
  {
    v52 = "result && \"builder didn't return the right type\"";
    int v53 = 497;
    v54 = "Builders.h";
    v55 = "create";
LABEL_62:
    __assert_rtn(v55, v54, v53, v52);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v74);

  return v50;
}

- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count])
  {
    id v40 = v10;
    char v42 = self->super._desc;
    if (![(MPSGraphLSTMDescriptor *)v42 training])
    {
      id v11 = (MPSGraphLSTMDescriptor *)[(MPSGraphLSTMDescriptor *)self->super._desc copy];

      char v42 = v11;
      [(MPSGraphLSTMDescriptor *)v11 setTraining:1];
    }
    desc = self->super._desc;
    if (desc->_hasInitState)
    {
      if ([(NSArray *)self->super.super._inputTensors count] <= 2) {
        __assert_rtn("-[MPSGraphLSTMOp partialDerivativesForInputTensors:incomingGradients:name:]", "MPSGraphRNNOps.mm", 520, "_inputTensors.count > index");
      }
      uint64_t v13 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:2];
      desc = self->super._desc;
      unint64_t v14 = 3;
      unsigned int v43 = (void *)v13;
      if (desc->_hasInitCell)
      {
LABEL_7:
        if ([(NSArray *)self->super.super._inputTensors count] <= v14) {
          __assert_rtn("-[MPSGraphLSTMOp partialDerivativesForInputTensors:incomingGradients:name:]", "MPSGraphRNNOps.mm", 524, "_inputTensors.count > index");
        }
        uint64_t v15 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:v14];
        ++v14;
        desc = self->super._desc;
        v44 = (void *)v15;
        if (desc->_hasMask)
        {
LABEL_9:
          if ([(NSArray *)self->super.super._inputTensors count] <= v14) {
            __assert_rtn("-[MPSGraphLSTMOp partialDerivativesForInputTensors:incomingGradients:name:]", "MPSGraphRNNOps.mm", 528, "_inputTensors.count > index");
          }
          uint64_t v16 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:v14++];
          if (self->super._desc->_hasPeephole) {
            goto LABEL_11;
          }
          goto LABEL_19;
        }
LABEL_18:
        uint64_t v16 = 0;
        if (desc->_hasPeephole)
        {
LABEL_11:
          if ([(NSArray *)self->super.super._inputTensors count] <= v14) {
            __assert_rtn("-[MPSGraphLSTMOp partialDerivativesForInputTensors:incomingGradients:name:]", "MPSGraphRNNOps.mm", 532, "_inputTensors.count > index");
          }
          uint64_t v41 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:v14];
          goto LABEL_20;
        }
LABEL_19:
        uint64_t v41 = 0;
LABEL_20:
        id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
        uint64_t v39 = (void *)v16;
        uint64_t v19 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:0];
        uint64_t v20 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:1];
        v21 = [WeakRetained LSTMWithSourceTensor:v19 recurrentWeight:v20 inputWeight:0 bias:0 initState:v43 initCell:v44 mask:v16 peephole:v41 descriptor:v42 name:@"fwd"];

        if ((unint64_t)[v9 count] < 2
          || ([v9 objectAtIndexedSubscript:1],
              char v22 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              char isKindOfClass = objc_opt_isKindOfClass(),
              v22,
              (isKindOfClass & 1) != 0))
        {
          v38 = 0;
        }
        else
        {
          v38 = [v9 objectAtIndexedSubscript:1];
        }
        id v24 = objc_loadWeakRetained((id *)&self->super.super._graph);
        BOOL v25 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:0];
        MPSGraphRNNActivation v26 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:1];
        unsigned int v27 = [v9 objectAtIndexedSubscript:0];
        MPSGraphRNNActivation v28 = [v21 objectAtIndexedSubscript:2];
        int v29 = v21;
        MPSGraphRNNActivation v30 = [v21 objectAtIndexedSubscript:1];
        int v31 = [v24 LSTMGradientsWithSourceTensor:v25 recurrentWeight:v26 sourceGradient:v27 zState:v28 cellOutputFwd:v30 stateGradient:0 cellGradient:v38 inputWeight:0 bias:0 initState:v43 initCell:v44 mask:v39 peephole:v41 descriptor:v42 name:v40];

        size_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
        for (unint64_t i = 0; i < [v8 count]; ++i)
        {
          int v33 = [MEMORY[0x1E4F1CA98] null];
          MPSGraphRNNActivation v34 = [v8 objectAtIndexedSubscript:i];
          objc_opt_class();
          char v35 = objc_opt_isKindOfClass();

          if ((v35 & 1) == 0)
          {
            uint64_t v36 = [v31 objectAtIndexedSubscript:i];

            int v33 = (void *)v36;
          }
          [v17 addObject:v33];
        }
        id v10 = v40;
        goto LABEL_30;
      }
    }
    else
    {
      unsigned int v43 = 0;
      unint64_t v14 = 2;
      if (desc->_hasInitCell) {
        goto LABEL_7;
      }
    }
    v44 = 0;
    if (desc->_hasMask) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
  if (MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  size_t v17 = 0;
LABEL_30:

  return v17;
}

@end