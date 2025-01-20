@interface MPSGraphAvgPool4DOp
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphAvgPool4DOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  v45[38] = *MEMORY[0x1E4F143B8];
  id v30 = a7;
  mpsFileLoc("-[MPSGraphAvgPool4DOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphPoolingOps.mm", __p);
  uint64_t v35 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::PoolAvgOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x292u, v30);
  if (v38 < 0) {
    operator delete(__p[0]);
  }
  v11 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) == *(void *)a5) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  v31 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc kernelSizes];
  uint64_t v12 = nsArrayToAttr(v31, (mlir::Builder *)a3);
  v32 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc strides];
  uint64_t v13 = nsArrayToAttr(v32, (mlir::Builder *)a3);
  v33 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc dilationRates];
  uint64_t v14 = nsArrayToAttr(v33, (mlir::Builder *)a3);
  unsigned int v15 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc paddingStyle];
  v34 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc paddingValues];
  uint64_t v16 = nsArrayToAttr(v34, (mlir::Builder *)a3);
  char v17 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc ceilMode];
  char v18 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc includeZeroPadToAverage];
  uint64_t v39 = v35;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v39);
  uint64_t v20 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.pooling_average", (const unsigned __int8 *)0x13, Context);
  if (!v21)
  {
    __int16 v43 = 1283;
    v42[2] = (uint64_t)"mps.pooling_average";
    v42[3] = 19;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v41 = 259;
    llvm::operator+(v42, (uint64_t *)&v40, (uint64_t)v44);
    llvm::report_fatal_error((llvm::Twine *)v44, 1);
  }
  mlir::OperationState::OperationState(v45, v35, v20);
  mlir::mps::PoolAvgOp::build((mlir::UnitAttr **)a3, (uint64_t)v45, *v11, v12, v13, v14, v15, v16, v17, v18);
  v22 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v45);
  if (!v22)
  {
    v26 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v27 = 662;
    v28 = "Casting.h";
    v29 = "dyn_cast";
    goto LABEL_12;
  }
  uint64_t v23 = llvm::DefaultDoCastIfPossible<mlir::mps::PoolAvgOp,mlir::Operation *,llvm::CastInfo<mlir::mps::PoolAvgOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v22);
  if (!v23)
  {
    v26 = "result && \"builder didn't return the right type\"";
    int v27 = 497;
    v28 = "Builders.h";
    v29 = "create";
LABEL_12:
    __assert_rtn(v29, v28, v27, v26);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v45);
  if (!*(_DWORD *)(v23 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v36 = v23 - 16;

  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v36);
  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = NSString;
  uint64_t v13 = [(MPSGraphOperation *)self name];
  uint64_t v14 = [v12 stringWithFormat:@"%@/%@/avgPool4DGradient", v11, v13];

  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
  uint64_t v16 = [WeakRetained avgPooling4DGradientWithGradientTensor:v10 sourceTensor:v9 descriptor:self->super._desc name:v14];

  return v16;
}

@end