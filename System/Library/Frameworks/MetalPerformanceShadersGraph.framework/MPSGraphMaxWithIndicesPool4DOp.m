@interface MPSGraphMaxWithIndicesPool4DOp
- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphMaxWithIndicesPool4DOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  v49[38] = *MEMORY[0x1E4F143B8];
  id v32 = a7;
  mpsFileLoc("-[MPSGraphMaxWithIndicesPool4DOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphPoolingOps.mm", __p);
  uint64_t v40 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::PoolMaxOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x2D2u, v32);
  if (v42 < 0) {
    operator delete(__p[0]);
  }
  uint64_t MLIRElementType = getMLIRElementType(*(mlir::MLIRContext **)a3, (mlir::MLIRContext *)[(MPSGraphPooling4DOpDescriptor *)self->super._desc returnIndicesDataType]);
  v12 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) == *(void *)a5) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v13 = MLIRElementType;
  v33 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc kernelSizes];
  uint64_t v14 = nsArrayToAttr(v33, (mlir::Builder *)a3);
  v34 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc strides];
  uint64_t v15 = nsArrayToAttr(v34, (mlir::Builder *)a3);
  v35 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc dilationRates];
  uint64_t v16 = nsArrayToAttr(v35, (mlir::Builder *)a3);
  unsigned int v17 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc paddingStyle];
  v39 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc paddingValues];
  uint64_t v36 = nsArrayToAttr(v39, (mlir::Builder *)a3);
  unsigned int v37 = v17;
  uint64_t v38 = v16;
  char v18 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc ceilMode];
  char v19 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc includeZeroPadToAverage];
  MPSGraphPoolingReturnIndicesMode v20 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc returnIndicesMode];
  if (v20 >= (MPSGraphPoolingReturnIndicesLocalFlatten4D|MPSGraphPoolingReturnIndicesGlobalFlatten1D))
  {
    if (MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  else
  {
    unsigned int v17 = dword_1811343A0[v20];
  }
  uint64_t v21 = mlir::TypeAttr::get(v13);
  uint64_t v43 = v40;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v43);
  uint64_t v23 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.pooling_max", (const unsigned __int8 *)0xF, Context);
  if (!v24)
  {
    __int16 v47 = 1283;
    v46[2] = (uint64_t)"mps.pooling_max";
    v46[3] = 15;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v45 = 259;
    llvm::operator+(v46, (uint64_t *)&v44, (uint64_t)v48);
    llvm::report_fatal_error((llvm::Twine *)v48, 1);
  }
  mlir::OperationState::OperationState(v49, v40, v23);
  mlir::mps::PoolMaxOp::build((mlir::UnitAttr **)a3, (uint64_t)v49, *v12, v14, v15, v38, v37, v36, v18, v19, v17, v21);
  v25 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v49);
  if (!v25)
  {
    v28 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v29 = 662;
    v30 = "Casting.h";
    v31 = "dyn_cast";
    goto LABEL_15;
  }
  v26 = (void *)llvm::DefaultDoCastIfPossible<mlir::mps::PoolMaxOp,mlir::Operation *,llvm::CastInfo<mlir::mps::PoolMaxOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v25);
  if (!v26)
  {
    v28 = "result && \"builder didn't return the right type\"";
    int v29 = 497;
    v30 = "Builders.h";
    v31 = "create";
LABEL_15:
    __assert_rtn(v31, v30, v29, v28);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v49);

  return v26;
}

- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5
{
  id v8 = a3;
  id v45 = a4;
  id v46 = a5;
  id v44 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v9 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc kernelSizes];
  v10 = [v9 objectAtIndexedSubscript:0];
  if ([v10 intValue] == 1)
  {
    v11 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc kernelSizes];
    v12 = [v11 objectAtIndexedSubscript:1];
    if ([v12 intValue] == 1)
    {
      uint64_t v13 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc strides];
      uint64_t v14 = [v13 objectAtIndexedSubscript:0];
      if ([v14 intValue] == 1)
      {
        char v42 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc strides];
        uint64_t v15 = [v42 objectAtIndexedSubscript:1];
        BOOL v16 = [v15 intValue] == 1;
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  unsigned int v17 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc kernelSizes];
  char v18 = [v17 objectAtIndexedSubscript:0];
  if ([v18 intValue] == 1)
  {
    char v19 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc kernelSizes];
    MPSGraphPoolingReturnIndicesMode v20 = [v19 objectAtIndexedSubscript:3];
    if ([v20 intValue] == 1)
    {
      uint64_t v43 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc strides];
      uint64_t v21 = [v43 objectAtIndexedSubscript:0];
      if ([v21 intValue] == 1)
      {
        v41 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc strides];
        v22 = [v41 objectAtIndexedSubscript:3];
        BOOL v23 = [v22 intValue] == 1;
      }
      else
      {
        BOOL v23 = 0;
      }
    }
    else
    {
      BOOL v23 = 0;
    }

    if (!v16 && !v23) {
      goto LABEL_22;
    }
  }
  else
  {

    if (!v16) {
      goto LABEL_22;
    }
  }
  if (isValidIndicesInput4D((MPSGraphTensorNamedDataLayout)!v16, [(MPSGraphPooling4DOpDescriptor *)self->super._desc returnIndicesMode], self->super._desc))
  {
    char v24 = NSString;
    v25 = [(MPSGraphOperation *)self name];
    v26 = [v24 stringWithFormat:@"%@/%@/shapeOf", v46, v25];

    v27 = NSString;
    v28 = [(MPSGraphOperation *)self name];
    int v29 = [v27 stringWithFormat:@"%@/%@/maxPoolGradWithIndices", v46, v28];

    id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
    v31 = [v8 objectAtIndexedSubscript:0];
    id v32 = [WeakRetained shapeOfTensor:v31 name:v26];

    v33 = objc_loadWeakRetained((id *)&self->super.super._graph);
    v34 = [v45 objectAtIndexedSubscript:0];
    v35 = [(MPSGraphOperation *)self outputTensors];
    uint64_t v36 = [v35 objectAtIndexedSubscript:1];
    unsigned int v37 = [v33 maxPooling4DGradientWithGradientTensor:v34 indicesTensor:v36 outputShapeTensor:v32 descriptor:self->super._desc name:v29];

    goto LABEL_23;
  }
LABEL_22:
  uint64_t v38 = NSString;
  v39 = [(MPSGraphOperation *)self name];
  v26 = [v38 stringWithFormat:@"%@/%@/maxPoolGrad", v46, v39];

  int v29 = objc_loadWeakRetained((id *)&self->super.super._graph);
  id v32 = [v45 objectAtIndexedSubscript:0];
  v33 = [v8 objectAtIndexedSubscript:0];
  unsigned int v37 = [v29 maxPooling4DGradientWithGradientTensor:v32 sourceTensor:v33 descriptor:self->super._desc name:v26];
LABEL_23:

  [v44 addObject:v37];

  return v44;
}

@end