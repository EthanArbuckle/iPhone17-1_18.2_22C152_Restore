@interface MPSGraphAvgPooling2DGradientOp
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphAvgPooling2DGradientOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  v55[38] = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphAvgPooling2DGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphPoolingOps.mm", __p);
  uint64_t v12 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::PoolAvgGradientOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x1D3u, v11);
  if (v48 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v13 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc kernelWidth];
  uint64_t v14 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc kernelHeight];
  MPSGraphTensorNamedDataLayout v15 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc dataLayout];
  uint64_t v17 = xyValTo4dAttr(v13, v14, v15, (mlir::Builder *)a3, v16);
  uint64_t v18 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc strideInX];
  uint64_t v19 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc strideInY];
  MPSGraphTensorNamedDataLayout v20 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc dataLayout];
  uint64_t v44 = xyValTo4dAttr(v18, v19, v20, (mlir::Builder *)a3, v21);
  uint64_t v45 = v17;
  uint64_t v22 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc dilationRateInX];
  uint64_t v23 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc dilationRateInY];
  MPSGraphTensorNamedDataLayout v24 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc dataLayout];
  uint64_t v26 = xyValTo4dAttr(v22, v23, v24, (mlir::Builder *)a3, v25);
  uint64_t v27 = padValTo4dAttr([(MPSGraphPooling2DOpDescriptor *)self->super._desc paddingLeft], [(MPSGraphPooling2DOpDescriptor *)self->super._desc paddingRight], [(MPSGraphPooling2DOpDescriptor *)self->super._desc paddingTop], [(MPSGraphPooling2DOpDescriptor *)self->super._desc paddingBottom], [(MPSGraphPooling2DOpDescriptor *)self->super._desc dataLayout], (mlir::OpBuilder *)a3);
  v28 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 8uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v29 = v27;
  unsigned int v30 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc paddingStyle];
  char v31 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc ceilMode];
  char v32 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc includeZeroPadToAverage];
  uint64_t v49 = v12;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v49);
  uint64_t v34 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.pooling_average_gradient", (const unsigned __int8 *)0x1C, Context);
  if (!v35)
  {
    __int16 v53 = 1283;
    v52[2] = (uint64_t)"mps.pooling_average_gradient";
    v52[3] = 28;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v51 = 259;
    llvm::operator+(v52, (uint64_t *)&v50, (uint64_t)v54);
    llvm::report_fatal_error((llvm::Twine *)v54, 1);
  }
  mlir::OperationState::OperationState(v55, v12, v34);
  mlir::mps::PoolAvgGradientOp::build((mlir::UnitAttr **)a3, (uint64_t)v55, *v28, v28[1], v45, v44, v26, v30, v29, v31, v32);
  v36 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v55);
  if (!v36)
  {
    v40 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v41 = 662;
    v42 = "Casting.h";
    v43 = "dyn_cast";
    goto LABEL_12;
  }
  uint64_t v37 = llvm::DefaultDoCastIfPossible<mlir::mps::PoolAvgGradientOp,mlir::Operation *,llvm::CastInfo<mlir::mps::PoolAvgGradientOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v36);
  if (!v37)
  {
    v40 = "result && \"builder didn't return the right type\"";
    int v41 = 497;
    v42 = "Builders.h";
    v43 = "create";
LABEL_12:
    __assert_rtn(v43, v42, v41, v40);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v55);
  if (!*(_DWORD *)(v37 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v46 = v37 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v46);

  return DefiningOp;
}

@end