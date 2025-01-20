@interface MPSGraphDepthwiseConvolution3DOp
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphDepthwiseConvolution3DOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v43 = a7;
  mpsFileLoc("-[MPSGraphDepthwiseConvolution3DOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphDepthwiseConvolutionOps.mm", __p);
  id v46 = v43;
  __int16 v58 = 260;
  v57[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v57);
  uint64_t v12 = mlir::FileLineColLoc::get(StringAttr, 0x1C4u, 0);
  if (!v12) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v46)
  {
    __dst[23] = 21;
    qmemcpy(__dst, "mps.depthwise_conv_3d", 21);
    v17 = &__dst[21];
    goto LABEL_13;
  }
  v13 = (const char *)[v46 UTF8String];
  size_t v14 = strlen(v13);
  if (v14 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v15 = v14;
  if (v14 >= 0x17)
  {
    uint64_t v18 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v18 = v14 | 7;
    }
    uint64_t v19 = v18 + 1;
    v16 = operator new(v18 + 1);
    *(void *)&__dst[8] = v15;
    *(void *)&__dst[16] = v19 | 0x8000000000000000;
    *(void *)__dst = v16;
  }
  else
  {
    __dst[23] = v14;
    v16 = __dst;
    if (!v14) {
      goto LABEL_12;
    }
  }
  memmove(v16, v13, v15);
LABEL_12:
  v17 = &v16[v15];
LABEL_13:
  unsigned char *v17 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &v53);
  v20 = (std::string *)v53.__r_.__value_.__r.__words[0];
  if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v20 = &v53;
  }
  char v21 = 1;
  HIBYTE(v58) = 1;
  if (v20->__r_.__value_.__s.__data_[0])
  {
    v57[0] = v20;
    char v21 = 3;
  }
  LOBYTE(v58) = v21;
  uint64_t v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v57);
  uint64_t v23 = mlir::NameLoc::get(v22, v12);
  if (!v23) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v53.__r_.__value_.__l.__data_);
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

  if (v49 < 0) {
    operator delete(__p[0]);
  }
  v24 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 8uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  v44 = [(MPSGraphDepthwiseConvolution3DOpDescriptor *)self->super._desc strides];
  uint64_t v25 = nsArrayToAttr(v44, (mlir::Builder *)a3);
  v45 = [(MPSGraphDepthwiseConvolution3DOpDescriptor *)self->super._desc dilationRates];
  uint64_t v26 = nsArrayToAttr(v45, (mlir::Builder *)a3);
  v27 = [(MPSGraphDepthwiseConvolution3DOpDescriptor *)self->super._desc paddingValues];
  uint64_t v28 = nsArrayToAttr(v27, (mlir::Builder *)a3);
  unsigned int v29 = [(MPSGraphDepthwiseConvolution3DOpDescriptor *)self->super._desc paddingStyle];
  int v30 = [(MPSGraphDepthwiseConvolution3DOpDescriptor *)self->super._desc channelDimensionIndex];
  uint64_t v50 = v23;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v50);
  uint64_t v32 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.depthwise_conv_3d", (const unsigned __int8 *)0x15, Context);
  if (!v33)
  {
    __int16 v55 = 1283;
    v53.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.depthwise_conv_3d";
    uint64_t v54 = 21;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v52 = 259;
    llvm::operator+((uint64_t *)&v53, (uint64_t *)&v51, (uint64_t)__dst);
    llvm::report_fatal_error((llvm::Twine *)__dst, 1);
  }
  mlir::OperationState::OperationState(v57, v23, v32);
  mlir::mps::DepthwiseConv3DOp::build((mlir::Builder *)a3, (uint64_t)v57, *v24, v24[1], v25, v26, v28, v29, v30);
  v34 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v57);
  if (!v34)
  {
    v39 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v40 = 662;
    v41 = "Casting.h";
    v42 = "dyn_cast";
    goto LABEL_38;
  }
  uint64_t v35 = llvm::DefaultDoCastIfPossible<mlir::mps::DepthwiseConv3DOp,mlir::Operation *,llvm::CastInfo<mlir::mps::DepthwiseConv3DOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v34);
  if (!v35)
  {
    v39 = "result && \"builder didn't return the right type\"";
    int v40 = 497;
    v41 = "Builders.h";
    v42 = "create";
LABEL_38:
    __assert_rtn(v42, v41, v40, v39);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v57);
  if (!*(_DWORD *)(v35 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v47 = v35 - 16;

  uint64_t DefiningOp = mlir::Value::getDefiningOp((mlir::Value *)&v47);
  if (!DefiningOp) {
    __assert_rtn("dyn_cast", "Casting.h", 662, "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"");
  }
  v57[0] = llvm::DefaultDoCastIfPossible<mlir::mps::DepthwiseConv3DOp,mlir::Operation *,llvm::CastInfo<mlir::mps::DepthwiseConv3DOp,mlir::Operation *,void>>::doCastIfPossible(DefiningOp);
  if (v57[0]) {
    mlir::mps::DepthwiseConv3DOp::verify((mlir::mps::DepthwiseConv3DOp *)v57);
  }
  v37 = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v47);

  return v37;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9 = a3;
  id v36 = a4;
  id v10 = a6;
  uint64_t v35 = v9;
  v11 = [(MPSGraphOperation *)self inputTensors];
  id v12 = [v11 objectAtIndexedSubscript:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
  inputTensors = self->super.super._inputTensors;
  if (v12 == v9)
  {
    v27 = [(NSArray *)inputTensors objectAtIndexedSubscript:0];
    uint64_t v28 = NSString;
    unsigned int v29 = [(MPSGraphOperation *)self name];
    int v30 = [v28 stringWithFormat:@"%@/%@/depthwiseConvolution3DDataGradient/shapeOp", v10, v29];
    uint64_t v19 = [WeakRetained shapeOfTensor:v27 name:v30];

    id v20 = objc_loadWeakRetained((id *)&self->super.super._graph);
    char v21 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:1];
    desc = self->super._desc;
    uint64_t v32 = NSString;
    v24 = [(MPSGraphOperation *)self name];
    uint64_t v25 = v36;
    uint64_t v26 = [v32 stringWithFormat:@"%@/%@/depthwiseConvolution3DDataGradient", v10, v24];
    [v20 depthwiseConvolution3DDataGradientWithIncomingGradientTensor:v36 weightsTensor:v21 outputShapeTensor:v19 descriptor:desc name:v26];
  }
  else
  {
    size_t v15 = [(NSArray *)inputTensors objectAtIndexedSubscript:1];
    v16 = NSString;
    v17 = [(MPSGraphOperation *)self name];
    uint64_t v18 = [v16 stringWithFormat:@"%@/%@/convolutionTranspose2DDataGradient/shapeOp", v10, v17];
    uint64_t v19 = [WeakRetained shapeOfTensor:v15 name:v18];

    id v20 = objc_loadWeakRetained((id *)&self->super.super._graph);
    char v21 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:0];
    uint64_t v22 = self->super._desc;
    uint64_t v23 = NSString;
    v24 = [(MPSGraphOperation *)self name];
    uint64_t v25 = v36;
    uint64_t v26 = [v23 stringWithFormat:@"%@/%@/convolution3DWeightsGradient", v10, v24];
    [v20 depthwiseConvolution3DWeightsGradientWithIncomingGradientTensor:v36 sourceTensor:v21 outputShapeTensor:v19 descriptor:v22 name:v26];
  char v33 = };

  return v33;
}

@end