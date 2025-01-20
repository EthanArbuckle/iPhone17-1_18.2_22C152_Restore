@interface MPSGraphAvgPooling2DOp
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphAvgPooling2DOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11 = a7;
  mpsFileLoc("-[MPSGraphAvgPooling2DOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphPoolingOps.mm", __p);
  uint64_t v12 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::PoolAvgOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x165u, v11);
  if (v38 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v13 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc kernelWidth];
  uint64_t v14 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc kernelHeight];
  MPSGraphTensorNamedDataLayout v15 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc dataLayout];
  uint64_t v36 = xyValTo4dAttr(v13, v14, v15, (mlir::Builder *)a3, v16);
  uint64_t v17 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc strideInX];
  uint64_t v18 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc strideInY];
  MPSGraphTensorNamedDataLayout v19 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc dataLayout];
  uint64_t v35 = xyValTo4dAttr(v17, v18, v19, (mlir::Builder *)a3, v20);
  uint64_t v21 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc dilationRateInX];
  uint64_t v22 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc dilationRateInY];
  MPSGraphTensorNamedDataLayout v23 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc dataLayout];
  uint64_t v34 = xyValTo4dAttr(v21, v22, v23, (mlir::Builder *)a3, v24);
  uint64_t v33 = padValTo4dAttr([(MPSGraphPooling2DOpDescriptor *)self->super._desc paddingLeft], [(MPSGraphPooling2DOpDescriptor *)self->super._desc paddingRight], [(MPSGraphPooling2DOpDescriptor *)self->super._desc paddingTop], [(MPSGraphPooling2DOpDescriptor *)self->super._desc paddingBottom], [(MPSGraphPooling2DOpDescriptor *)self->super._desc dataLayout], (mlir::OpBuilder *)a3);
  v25 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) == *(void *)a5) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  unsigned int v31 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc paddingStyle];
  BOOL v30 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc ceilMode];
  BOOL v29 = [(MPSGraphPooling2DOpDescriptor *)self->super._desc includeZeroPadToAverage];
  v26 = mlir::OpBuilder::create<mlir::mps::PoolAvgOp,mlir::Value &,mlir::DenseIntElementsAttr &,mlir::DenseIntElementsAttr &,mlir::DenseIntElementsAttr &,mlir::mps::PaddingStyle,mlir::DenseIntElementsAttr &,BOOL,BOOL>((mlir::UnitAttr **)a3, v12, v25, &v36, &v35, &v34, &v31, &v33, (char *)&v30, (char *)&v29);
  if (!*((_DWORD *)v26 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v32 = (char *)v26 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v32);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
  desc = self->super._desc;
  uint64_t v14 = NSString;
  MPSGraphTensorNamedDataLayout v15 = [(MPSGraphOperation *)self name];
  v16 = [v14 stringWithFormat:@"%@/%@/maxPoolGrad", v11, v15];
  uint64_t v17 = [WeakRetained avgPooling2DGradientWithGradientTensor:v10 sourceTensor:v9 descriptor:desc name:v16];

  return v17;
}

@end