@interface MPSGraphMaxPooling2DGradientOp
- (MPSGraphMaxPooling2DGradientOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 gradientWithIndices:(BOOL)a7 name:(id)a8;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphMaxPooling2DGradientOp

- (MPSGraphMaxPooling2DGradientOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 gradientWithIndices:(BOOL)a7 name:(id)a8
{
  self->_gradientWithIndices = a7;
  return [(MPSGraphPooling2DBaseOp *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 descriptor:a6 name:a8];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  v68[38] = *MEMORY[0x1E4F143B8];
  id v57 = a7;
  mpsFileLoc("-[MPSGraphMaxPooling2DGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphPoolingOps.mm", __p);
  uint64_t v58 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::PoolMaxGradientOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x19Fu, v57);
  if (v61 < 0) {
    operator delete(__p[0]);
  }
  unsigned int v11 = 88;
  uint64_t v12 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc kernelWidth];
  uint64_t v13 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc kernelHeight];
  MPSGraphTensorNamedDataLayout v14 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc dataLayout];
  uint64_t v16 = xyValTo4dAttr(v12, v13, v14, (mlir::Builder *)a3, v15);
  uint64_t v17 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc strideInX];
  uint64_t v18 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc strideInY];
  MPSGraphTensorNamedDataLayout v19 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc dataLayout];
  uint64_t v56 = xyValTo4dAttr(v17, v18, v19, (mlir::Builder *)a3, v20);
  uint64_t v21 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc dilationRateInX];
  uint64_t v22 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc dilationRateInY];
  MPSGraphTensorNamedDataLayout v23 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc dataLayout];
  uint64_t v55 = xyValTo4dAttr(v21, v22, v23, (mlir::Builder *)a3, v24);
  uint64_t v25 = padValTo4dAttr([(MPSGraphPooling2DOpDescriptor *)self->super._desc paddingLeft], [(MPSGraphPooling2DOpDescriptor *)self->super._desc paddingRight], [(MPSGraphPooling2DOpDescriptor *)self->super._desc paddingTop], [(MPSGraphPooling2DOpDescriptor *)self->super._desc paddingBottom], [(MPSGraphPooling2DOpDescriptor *)self->super._desc dataLayout], (mlir::OpBuilder *)a3);
  v26 = *(uint64_t **)a5;
  unint64_t v27 = *((void *)a5 + 1) - *(void *)a5;
  if (!v27) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v28 = v25;
  if (self->_gradientWithIndices)
  {
    if (v27 >= 0x11)
    {
      uint64_t v29 = 0;
      uint64_t v30 = v26[1];
      uint64_t v31 = v26[2];
      goto LABEL_9;
    }
LABEL_24:
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  if (v27 <= 8) {
    goto LABEL_24;
  }
  uint64_t v31 = 0;
  uint64_t v30 = 0;
  uint64_t v29 = v26[1];
LABEL_9:
  uint64_t v54 = *v26;
  uint64_t MLIRElementType = getMLIRElementType(*(mlir::MLIRContext **)a3, (mlir::MLIRContext *)[(MPSGraphPooling2DOpDescriptor *)self->super._desc returnIndicesDataType]);
  uint64_t v33 = mlir::TypeAttr::get(MLIRElementType);
  uint64_t v52 = v31;
  uint64_t v53 = v30;
  uint64_t v34 = v29;
  uint64_t v35 = v28;
  unsigned int v36 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc paddingStyle];
  uint64_t v37 = v16;
  char v38 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc ceilMode];
  char v39 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc includeZeroPadToAverage];
  MPSGraphPoolingReturnIndicesMode v40 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc returnIndicesMode];
  if (v40 >= (MPSGraphPoolingReturnIndicesLocalFlatten4D|MPSGraphPoolingReturnIndicesGlobalFlatten1D))
  {
    if (MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  else
  {
    unsigned int v11 = dword_1811343A0[v40];
  }
  uint64_t v62 = v58;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v62);
  uint64_t v42 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.pooling_max_gradient", (const unsigned __int8 *)0x18, Context);
  if (!v43)
  {
    __int16 v66 = 1283;
    v65[2] = (uint64_t)"mps.pooling_max_gradient";
    v65[3] = 24;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v64 = 259;
    llvm::operator+(v65, (uint64_t *)&v63, (uint64_t)v67);
    llvm::report_fatal_error((llvm::Twine *)v67, 1);
  }
  mlir::OperationState::OperationState(v68, v58, v42);
  mlir::mps::PoolMaxGradientOp::build((mlir::UnitAttr **)a3, (uint64_t)v68, v54, v34, v53, v52, v37, v56, v55, v36, v35, v38, v39, v11, v33);
  v44 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v68);
  if (!v44)
  {
    v48 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v49 = 662;
    v50 = "Casting.h";
    v51 = "dyn_cast";
    goto LABEL_21;
  }
  uint64_t v45 = llvm::DefaultDoCastIfPossible<mlir::mps::PoolMaxGradientOp,mlir::Operation *,llvm::CastInfo<mlir::mps::PoolMaxGradientOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v44);
  if (!v45)
  {
    v48 = "result && \"builder didn't return the right type\"";
    int v49 = 497;
    v50 = "Builders.h";
    v51 = "create";
LABEL_21:
    __assert_rtn(v51, v50, v49, v48);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v68);
  if (!*(_DWORD *)(v45 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v59 = v45 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v59);

  return DefiningOp;
}

@end