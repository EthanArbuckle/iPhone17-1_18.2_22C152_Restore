@interface MPSGraphMaxWithIndicesPooling2DOp
- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphMaxWithIndicesPooling2DOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11 = a7;
  mpsFileLoc("-[MPSGraphMaxWithIndicesPooling2DOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphPoolingOps.mm", __p);
  uint64_t v12 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::PoolMaxOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x124u, v11);
  if (v42 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v13 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc kernelWidth];
  uint64_t v14 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc kernelHeight];
  MPSGraphTensorNamedDataLayout v15 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc dataLayout];
  uint64_t v40 = xyValTo4dAttr(v13, v14, v15, (mlir::Builder *)a3, v16);
  uint64_t v17 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc strideInX];
  uint64_t v18 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc strideInY];
  MPSGraphTensorNamedDataLayout v19 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc dataLayout];
  uint64_t v39 = xyValTo4dAttr(v17, v18, v19, (mlir::Builder *)a3, v20);
  uint64_t v21 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc dilationRateInX];
  uint64_t v22 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc dilationRateInY];
  MPSGraphTensorNamedDataLayout v23 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc dataLayout];
  uint64_t v38 = xyValTo4dAttr(v21, v22, v23, (mlir::Builder *)a3, v24);
  uint64_t v37 = padValTo4dAttr([(MPSGraphPooling2DOpDescriptor *)self->super._desc paddingLeft], [(MPSGraphPooling2DOpDescriptor *)self->super._desc paddingRight], [(MPSGraphPooling2DOpDescriptor *)self->super._desc paddingTop], [(MPSGraphPooling2DOpDescriptor *)self->super._desc paddingBottom], [(MPSGraphPooling2DOpDescriptor *)self->super._desc dataLayout], (mlir::OpBuilder *)a3);
  uint64_t MLIRElementType = getMLIRElementType(*(mlir::MLIRContext **)a3, (mlir::MLIRContext *)[(MPSGraphPooling2DOpDescriptor *)self->super._desc returnIndicesDataType]);
  v26 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) == *(void *)a5) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v27 = MLIRElementType;
  unsigned int v36 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc paddingStyle];
  BOOL v35 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc ceilMode];
  BOOL v34 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc includeZeroPadToAverage];
  MPSGraphPoolingReturnIndicesMode v28 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc returnIndicesMode];
  if (v28 >= (MPSGraphPoolingReturnIndicesLocalFlatten4D|MPSGraphPoolingReturnIndicesGlobalFlatten1D))
  {
    if (MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  else
  {
    unsigned int v29 = dword_1811343A0[v28];
  }
  unsigned int v33 = v29;
  uint64_t v32 = mlir::TypeAttr::get(v27);
  v30 = mlir::OpBuilder::create<mlir::mps::PoolMaxOp,mlir::Value &,mlir::DenseIntElementsAttr &,mlir::DenseIntElementsAttr &,mlir::DenseIntElementsAttr &,mlir::mps::PaddingStyle,mlir::DenseIntElementsAttr &,BOOL,BOOL,mlir::mps::PoolIndicesMode,mlir::TypeAttr>((mlir::UnitAttr **)a3, v12, v26, &v40, &v39, &v38, &v36, &v37, (char *)&v35, (char *)&v34, &v33, &v32);

  return v30;
}

- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5
{
  id v8 = a3;
  id v35 = a4;
  id v36 = a5;
  uint64_t v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  MPSGraphTensorNamedDataLayout v9 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc dataLayout];
  MPSGraphPoolingReturnIndicesMode v10 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc returnIndicesMode];
  id v11 = self->super._desc;
  if ([(MPSGraphPooling2DOpDescriptor *)v11 dilationRateInX] == 1)
  {
    BOOL v12 = [(MPSGraphPooling2DOpDescriptor *)v11 dilationRateInY] == 1;
    if (v9 == MPSGraphTensorNamedDataLayoutNCHW) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v12 = 0;
    if (v9 == MPSGraphTensorNamedDataLayoutNCHW)
    {
LABEL_3:

      char v13 = !v12;
      if (v10 != MPSGraphPoolingReturnIndicesGlobalFlatten2D) {
        char v13 = 1;
      }
      if (v13) {
        goto LABEL_14;
      }
LABEL_12:
      MPSGraphTensorNamedDataLayout v15 = NSString;
      id v33 = v8;
      v16 = [(MPSGraphOperation *)self name];
      uint64_t v17 = [v15 stringWithFormat:@"%@/%@/shapeOf", v36, v16];

      uint64_t v18 = NSString;
      MPSGraphTensorNamedDataLayout v19 = [(MPSGraphOperation *)self name];
      v20 = [v18 stringWithFormat:@"%@/%@/maxPoolGradWithIndices", v36, v19];

      id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
      uint64_t v22 = [v8 objectAtIndexedSubscript:0];
      MPSGraphTensorNamedDataLayout v23 = [WeakRetained shapeOfTensor:v22 name:v17];

      v24 = objc_loadWeakRetained((id *)&self->super.super._graph);
      v25 = [v35 objectAtIndexedSubscript:0];
      v26 = [(MPSGraphOperation *)self outputTensors];
      uint64_t v27 = [v26 objectAtIndexedSubscript:1];
      MPSGraphPoolingReturnIndicesMode v28 = [v24 maxPooling2DGradientWithGradientTensor:v25 indicesTensor:v27 outputShapeTensor:v23 descriptor:self->super._desc name:v20];

      id v8 = v33;
      unsigned int v29 = (void *)v34;
      goto LABEL_15;
    }
  }
  if (v9 == MPSGraphTensorNamedDataLayoutNHWC)
  {

    char v14 = !v12;
    if (v10 != MPSGraphPoolingReturnIndicesGlobalFlatten3D) {
      char v14 = 1;
    }
    if (v14) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

LABEL_14:
  v30 = NSString;
  unsigned int v29 = (void *)v34;
  v31 = [(MPSGraphOperation *)self name];
  uint64_t v17 = [v30 stringWithFormat:@"%@/%@/maxPoolGrad", v36, v31];

  v20 = objc_loadWeakRetained((id *)&self->super.super._graph);
  MPSGraphTensorNamedDataLayout v23 = [v35 objectAtIndexedSubscript:0];
  v24 = [v8 objectAtIndexedSubscript:0];
  MPSGraphPoolingReturnIndicesMode v28 = [v20 maxPooling2DGradientWithGradientTensor:v23 sourceTensor:v24 descriptor:self->super._desc name:v17];
LABEL_15:

  [v29 addObject:v28];

  return v29;
}

@end