@interface MPSGraphMaxPool4DGradientOp
- (MPSGraphMaxPool4DGradientOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 gradientWithIndices:(BOOL)a7 name:(id)a8;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphMaxPool4DGradientOp

- (MPSGraphMaxPool4DGradientOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 gradientWithIndices:(BOOL)a7 name:(id)a8
{
  self->_gradientWithIndices = a7;
  v9.receiver = self;
  v9.super_class = (Class)MPSGraphMaxPool4DGradientOp;
  return [(MPSGraphPooling4DBaseOp *)&v9 initWithGraph:a3 inputTensors:a4 controlDependencies:a5 descriptor:a6 name:a8];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  v58[38] = *MEMORY[0x1E4F143B8];
  id v38 = a7;
  mpsFileLoc("-[MPSGraphMaxPool4DGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphPoolingOps.mm", __p);
  uint64_t v48 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::PoolMaxGradientOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x321u, v38);
  if (v51 < 0) {
    operator delete(__p[0]);
  }
  v11 = *(uint64_t **)a5;
  unint64_t v12 = *((void *)a5 + 1) - *(void *)a5;
  if (!v12) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v13 = *v11;
  if (self->_gradientWithIndices)
  {
    if (v12 >= 0x11)
    {
      uint64_t v14 = 0;
      uint64_t v16 = v11[1];
      uint64_t v15 = v11[2];
      goto LABEL_9;
    }
LABEL_24:
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  if (v12 <= 8) {
    goto LABEL_24;
  }
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v14 = v11[1];
LABEL_9:
  unsigned int v17 = 88;
  uint64_t MLIRElementType = getMLIRElementType(*(mlir::MLIRContext **)a3, (mlir::MLIRContext *)[(MPSGraphPooling4DOpDescriptor *)self->super._desc returnIndicesDataType]);
  uint64_t v19 = mlir::TypeAttr::get(MLIRElementType);
  v39 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc kernelSizes];
  uint64_t v20 = nsArrayToAttr(v39, (mlir::Builder *)a3);
  v40 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc strides];
  uint64_t v21 = nsArrayToAttr(v40, (mlir::Builder *)a3);
  v41 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc dilationRates];
  uint64_t v46 = nsArrayToAttr(v41, (mlir::Builder *)a3);
  unsigned int v45 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc paddingStyle];
  [(MPSGraphPooling4DOpDescriptor *)self->super._desc paddingValues];
  uint64_t v43 = v21;
  v47 = uint64_t v44 = v20;
  uint64_t v22 = nsArrayToAttr(v47, (mlir::Builder *)a3);
  uint64_t v23 = v19;
  uint64_t v42 = v15;
  char v24 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc ceilMode];
  char v25 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc includeZeroPadToAverage];
  MPSGraphPoolingReturnIndicesMode v26 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc returnIndicesMode];
  if (v26 >= (MPSGraphPoolingReturnIndicesLocalFlatten4D|MPSGraphPoolingReturnIndicesGlobalFlatten1D))
  {
    if (MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  else
  {
    unsigned int v17 = dword_1811343A0[v26];
  }
  uint64_t v52 = v48;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v52);
  uint64_t v28 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.pooling_max_gradient", (const unsigned __int8 *)0x18, Context);
  if (!v29)
  {
    __int16 v56 = 1283;
    v55[2] = (uint64_t)"mps.pooling_max_gradient";
    v55[3] = 24;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v54 = 259;
    llvm::operator+(v55, (uint64_t *)&v53, (uint64_t)v57);
    llvm::report_fatal_error((llvm::Twine *)v57, 1);
  }
  mlir::OperationState::OperationState(v58, v48, v28);
  mlir::mps::PoolMaxGradientOp::build((mlir::UnitAttr **)a3, (uint64_t)v58, v13, v14, v16, v42, v44, v43, v46, v45, v22, v24, v25, v17, v23);
  v30 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v58);
  if (!v30)
  {
    v34 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v35 = 662;
    v36 = "Casting.h";
    v37 = "dyn_cast";
    goto LABEL_21;
  }
  uint64_t v31 = llvm::DefaultDoCastIfPossible<mlir::mps::PoolMaxGradientOp,mlir::Operation *,llvm::CastInfo<mlir::mps::PoolMaxGradientOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v30);
  if (!v31)
  {
    v34 = "result && \"builder didn't return the right type\"";
    int v35 = 497;
    v36 = "Builders.h";
    v37 = "create";
LABEL_21:
    __assert_rtn(v37, v36, v35, v34);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v58);
  if (!*(_DWORD *)(v31 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v49 = v31 - 16;

  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v49);
  return DefiningOp;
}

@end