@interface MPSGraphDepthwiseConvolution2DOp
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphDepthwiseConvolution2DOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v48 = a7;
  mpsFileLoc("-[MPSGraphDepthwiseConvolution2DOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphDepthwiseConvolutionOps.mm", __p);
  id v11 = v48;
  __int16 v66 = 260;
  v65[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v65);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0xA8u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    __dst[23] = 21;
    qmemcpy(__dst, "mps.depthwise_conv_2d", 21);
    v18 = &__dst[21];
    goto LABEL_13;
  }
  v14 = (const char *)[v11 UTF8String];
  size_t v15 = strlen(v14);
  if (v15 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v16 = v15;
  if (v15 >= 0x17)
  {
    uint64_t v19 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17) {
      uint64_t v19 = v15 | 7;
    }
    uint64_t v20 = v19 + 1;
    v17 = operator new(v19 + 1);
    *(void *)&__dst[8] = v16;
    *(void *)&__dst[16] = v20 | 0x8000000000000000;
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
  v18 = &v17[v16];
LABEL_13:
  unsigned char *v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &v61);
  v21 = (std::string *)v61.__r_.__value_.__r.__words[0];
  if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v21 = &v61;
  }
  char v22 = 1;
  HIBYTE(v66) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v65[0] = v21;
    char v22 = 3;
  }
  LOBYTE(v66) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v65);
  uint64_t v24 = mlir::NameLoc::get(v23, v13);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v61.__r_.__value_.__l.__data_);
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

  v54 = (mlir::Builder *)a3;
  if (v57 < 0) {
    operator delete(__p[0]);
  }
  v25 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 8uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  NSUInteger v26 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc strideInX];
  unint64_t v27 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc strideInY];
  NSUInteger v28 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc dilationRateInX];
  v53 = v11;
  NSUInteger v29 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc dilationRateInY];
  unint64_t v30 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc paddingLeft];
  unint64_t v52 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc paddingRight];
  unint64_t v51 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc paddingTop];
  uint64_t v50 = v29;
  unint64_t v31 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc paddingBottom];
  uint64_t v49 = v28;
  unint64_t v32 = v26;
  unsigned int v33 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc paddingStyle];
  unsigned int v34 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc dataLayout];
  unsigned int v35 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc weightsLayout];
  uint64_t v58 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v58);
  uint64_t v37 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.depthwise_conv_2d", (const unsigned __int8 *)0x15, Context);
  if (!v38)
  {
    __int16 v63 = 1283;
    v61.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.depthwise_conv_2d";
    uint64_t v62 = 21;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v60 = 259;
    llvm::operator+((uint64_t *)&v61, (uint64_t *)&v59, (uint64_t)__dst);
    llvm::report_fatal_error((llvm::Twine *)__dst, 1);
  }
  mlir::OperationState::OperationState(v65, v24, v37);
  mlir::mps::DepthwiseConv2DOp::build(v54, (uint64_t)v65, *v25, v25[1], v32, v27, v49, v50, v30, v52, v51, v31, v33, v34, v35);
  v39 = mlir::OpBuilder::create(v54, (const mlir::OperationState *)v65);
  if (!v39)
  {
    v44 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v45 = 662;
    v46 = "Casting.h";
    v47 = "dyn_cast";
    goto LABEL_36;
  }
  uint64_t v40 = llvm::DefaultDoCastIfPossible<mlir::mps::DepthwiseConv2DOp,mlir::Operation *,llvm::CastInfo<mlir::mps::DepthwiseConv2DOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v39);
  if (!v40)
  {
    v44 = "result && \"builder didn't return the right type\"";
    int v45 = 497;
    v46 = "Builders.h";
    v47 = "create";
LABEL_36:
    __assert_rtn(v47, v46, v45, v44);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v65);
  if (!*(_DWORD *)(v40 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v55 = v40 - 16;
  uint64_t DefiningOp = mlir::Value::getDefiningOp((mlir::Value *)&v55);
  if (!DefiningOp) {
    __assert_rtn("dyn_cast", "Casting.h", 662, "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"");
  }
  llvm::DefaultDoCastIfPossible<mlir::mps::DepthwiseConv2DOp,mlir::Operation *,llvm::CastInfo<mlir::mps::DepthwiseConv2DOp,mlir::Operation *,void>>::doCastIfPossible(DefiningOp);
  v42 = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v55);

  return v42;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9 = a3;
  id v36 = a4;
  id v10 = a6;
  unsigned int v35 = v9;
  id v11 = [(MPSGraphOperation *)self inputTensors];
  id v12 = [v11 objectAtIndexedSubscript:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
  inputTensors = self->super.super._inputTensors;
  if (v12 == v9)
  {
    unint64_t v27 = [(NSArray *)inputTensors objectAtIndexedSubscript:0];
    NSUInteger v28 = NSString;
    NSUInteger v29 = [(MPSGraphOperation *)self name];
    unint64_t v30 = [v28 stringWithFormat:@"%@/%@/depthwiseConvolution2DDataGradient/shapeOp", v10, v29];
    uint64_t v19 = [WeakRetained shapeOfTensor:v27 name:v30];

    id v20 = objc_loadWeakRetained((id *)&self->super.super._graph);
    v21 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:1];
    desc = self->super._desc;
    unint64_t v32 = NSString;
    uint64_t v24 = [(MPSGraphOperation *)self name];
    v25 = v36;
    NSUInteger v26 = [v32 stringWithFormat:@"%@/%@/depthwiseConvolution2DDataGradient", v10, v24];
    [v20 depthwiseConvolution2DDataGradientWithIncomingGradientTensor:v36 weightsTensor:v21 outputShapeTensor:v19 descriptor:desc name:v26];
  }
  else
  {
    size_t v15 = [(NSArray *)inputTensors objectAtIndexedSubscript:1];
    size_t v16 = NSString;
    v17 = [(MPSGraphOperation *)self name];
    v18 = [v16 stringWithFormat:@"%@/%@/convolutionTranspose2DDataGradient/shapeOp", v10, v17];
    uint64_t v19 = [WeakRetained shapeOfTensor:v15 name:v18];

    id v20 = objc_loadWeakRetained((id *)&self->super.super._graph);
    v21 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:0];
    char v22 = self->super._desc;
    uint64_t v23 = NSString;
    uint64_t v24 = [(MPSGraphOperation *)self name];
    v25 = v36;
    NSUInteger v26 = [v23 stringWithFormat:@"%@/%@/convolution2DWeightsGradient", v10, v24];
    [v20 depthwiseConvolution2DWeightsGradientWithIncomingGradientTensor:v36 sourceTensor:v21 outputShapeTensor:v19 descriptor:v22 name:v26];
  unsigned int v33 = };

  return v33;
}

@end