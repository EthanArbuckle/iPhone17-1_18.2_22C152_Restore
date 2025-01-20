@interface MPSGraphSingleGateRNNOp
- (MPSGraphSingleGateRNNOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7;
- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphSingleGateRNNOp

- (MPSGraphSingleGateRNNOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = (MPSGraphSingleGateRNNDescriptor *)[v15 copy];
  desc = self->super._desc;
  self->super._desc = v17;

  v19 = [(MPSGraphOperation *)self initWithGraph:v12 inputTensors:v13 controlDependencies:v14 name:v16];
  return v19;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  mpsFileLoc("-[MPSGraphSingleGateRNNOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphRNNOps.mm", __p);
  id v11 = v10;
  __int16 v56 = 260;
  v55[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v55);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x110u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    __dst[23] = 18;
    strcpy(__dst, "mps.singlegate_rnn");
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
    uint64_t v18 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17) {
      uint64_t v18 = v15 | 7;
    }
    uint64_t v19 = v18 + 1;
    v17 = operator new(v18 + 1);
    *(void *)&__dst[8] = v16;
    *(void *)&__dst[16] = v19 | 0x8000000000000000;
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
  v17[v16] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &v51);
  v20 = (std::string *)v51.__r_.__value_.__r.__words[0];
  if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v20 = &v51;
  }
  char v21 = 1;
  HIBYTE(v56) = 1;
  if (v20->__r_.__value_.__s.__data_[0])
  {
    v55[0] = v20;
    char v21 = 3;
  }
  LOBYTE(v56) = v21;
  uint64_t v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v55);
  uint64_t v23 = mlir::NameLoc::get(v22, v13);
  if (!v23) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v51.__r_.__value_.__l.__data_);
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

  if (v47 < 0) {
    operator delete(__p[0]);
  }
  int v24 = [(MPSGraphSingleGateRNNDescriptor *)self->super._desc training];
  MPSGraphRNNActivation v25 = [(MPSGraphSingleGateRNNDescriptor *)self->super._desc activation];
  if (v25 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu)) {
    unsigned int v26 = 1;
  }
  else {
    unsigned int v26 = v25;
  }
  desc = self->super._desc;
  v29 = *(uint64_t **)a5;
  v28 = (uint64_t *)*((void *)a5 + 1);
  if (!desc->_hasInitState)
  {
    uint64_t v30 = 0;
    unint64_t v31 = 2;
    if (desc->_hasMask) {
      goto LABEL_28;
    }
LABEL_34:
    uint64_t v33 = 0;
    unint64_t v32 = (char *)v28 - (char *)v29;
    if (v28 == v29) {
      goto LABEL_49;
    }
    goto LABEL_35;
  }
  if ((unint64_t)((char *)v28 - (char *)v29) < 0x18)
  {
    int v44 = 282;
    goto LABEL_48;
  }
  uint64_t v30 = v29[2];
  unint64_t v31 = 3;
  if (!desc->_hasMask) {
    goto LABEL_34;
  }
LABEL_28:
  unint64_t v32 = (char *)v28 - (char *)v29;
  if (v31 >= v28 - v29)
  {
    int v44 = 286;
LABEL_48:
    __assert_rtn("-[MPSGraphSingleGateRNNOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphRNNOps.mm", v44, "inputValues->size() > index");
  }
  uint64_t v33 = v29[v31];
  if (v28 == v29) {
LABEL_49:
  }
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
LABEL_35:
  if (v32 <= 8) {
    goto LABEL_49;
  }
  uint64_t v48 = v23;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v48);
  uint64_t v35 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.singlegate_rnn", (const unsigned __int8 *)0x12, Context);
  if (!v36)
  {
    __int16 v53 = 1283;
    v51.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.singlegate_rnn";
    uint64_t v52 = 18;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v50 = 259;
    llvm::operator+((uint64_t *)&v51, (uint64_t *)&v49, (uint64_t)__dst);
    llvm::report_fatal_error((llvm::Twine *)__dst, 1);
  }
  mlir::OperationState::OperationState(v55, v23, v35);
  mlir::mps::SingleGateRNNOp::build((mlir::UnitAttr **)a3, (uint64_t)v55, *v29, v29[1], v26, v24, v30, v33);
  v37 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v55);
  if (!v37)
  {
    v40 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v41 = 662;
    v42 = "Casting.h";
    v43 = "dyn_cast";
    goto LABEL_45;
  }
  v38 = (void *)llvm::DefaultDoCastIfPossible<mlir::mps::SingleGateRNNOp,mlir::Operation *,llvm::CastInfo<mlir::mps::SingleGateRNNOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v37);
  if (!v38)
  {
    v40 = "result && \"builder didn't return the right type\"";
    int v41 = 497;
    v42 = "Builders.h";
    v43 = "create";
LABEL_45:
    __assert_rtn(v43, v42, v41, v40);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v55);

  return v38;
}

- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count])
  {
    id v11 = self->super._desc;
    if (![(MPSGraphSingleGateRNNDescriptor *)v11 training])
    {
      id v12 = (MPSGraphSingleGateRNNDescriptor *)[(MPSGraphSingleGateRNNDescriptor *)self->super._desc copy];

      id v11 = v12;
      [(MPSGraphSingleGateRNNDescriptor *)v12 setTraining:1];
    }
    if (v11->_hasInitState)
    {
      v34 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:2];
      uint64_t v13 = 3;
      uint64_t v33 = v9;
      id v31 = v10;
      if (v11->_hasMask)
      {
LABEL_6:
        id v14 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:v13];
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v33 = v9;
      v34 = 0;
      uint64_t v13 = 2;
      id v31 = v10;
      if (v11->_hasMask) {
        goto LABEL_6;
      }
    }
    id v14 = 0;
LABEL_12:
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
    v17 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:0];
    uint64_t v18 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:1];
    unint64_t v32 = [WeakRetained singleGateRNNWithSourceTensor:v17 recurrentWeight:v18 inputWeight:0 bias:0 initState:v34 mask:v14 descriptor:v11 name:0];

    id v19 = objc_loadWeakRetained((id *)&self->super.super._graph);
    v20 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:0];
    char v21 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:1];
    uint64_t v22 = [v33 objectAtIndexedSubscript:0];
    uint64_t v23 = [v32 objectAtIndexedSubscript:1];
    int v24 = [v19 singleGateRNNGradientsWithSourceTensor:v20 recurrentWeight:v21 sourceGradient:v22 zState:v23 inputWeight:0 bias:0 initState:v34 mask:v14 descriptor:v11 name:0];

    size_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    for (unint64_t i = 0; i < [v8 count]; ++i)
    {
      unsigned int v26 = [MEMORY[0x1E4F1CA98] null];
      v27 = [v8 objectAtIndexedSubscript:i];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        uint64_t v29 = [v24 objectAtIndexedSubscript:i];

        unsigned int v26 = (void *)v29;
      }
      [v15 addObject:v26];
    }
    id v9 = v33;
    id v10 = v31;
    goto LABEL_18;
  }
  if (MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  size_t v15 = 0;
LABEL_18:

  return v15;
}

@end