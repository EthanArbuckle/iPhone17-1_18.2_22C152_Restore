@interface MPSGraphDepthwiseConvolution3DDataGradientOp
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphDepthwiseConvolution3DDataGradientOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v46 = a7;
  mpsFileLoc("-[MPSGraphDepthwiseConvolution3DDataGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphDepthwiseConvolutionOps.mm", v52);
  id v11 = v46;
  __int16 v63 = 260;
  v62[0] = v52;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v62);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x1FFu, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    v19 = (char *)operator new(0x28uLL);
    __dst = (void **)v19;
    long long v61 = xmmword_181129DE0;
    qmemcpy(v19, "mps.depthwise_conv_3d_data_gradient", 35);
    v20 = v19 + 35;
    goto LABEL_13;
  }
  id v14 = v11;
  v15 = (const char *)[v11 UTF8String];
  size_t v16 = strlen(v15);
  if (v16 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v17 = v16;
  if (v16 >= 0x17)
  {
    uint64_t v21 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v21 = v16 | 7;
    }
    uint64_t v22 = v21 + 1;
    p_dst = (void **)operator new(v21 + 1);
    *(void *)&long long v61 = v17;
    *((void *)&v61 + 1) = v22 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v61) = v16;
    p_dst = (void **)&__dst;
    if (!v16) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  v20 = (char *)p_dst + v17;
  id v11 = v14;
LABEL_13:
  unsigned char *v20 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  char v24 = 1;
  HIBYTE(v63) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v62[0] = p_p;
    char v24 = 3;
  }
  LOBYTE(v63) = v24;
  uint64_t v25 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v62);
  uint64_t v26 = mlir::NameLoc::get(v25, v13);
  if (!v26) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v61) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v61) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  if (v53 < 0)
  {
    operator delete(v52[0]);
    v27 = *(uint64_t **)a5;
    uint64_t v28 = (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3;
    v49 = v11;
    if (v28 == 2) {
      goto LABEL_22;
    }
  }
  else
  {
    v27 = *(uint64_t **)a5;
    uint64_t v28 = (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3;
    v49 = v11;
    if (v28 == 2)
    {
LABEL_22:
      uint64_t v29 = 0;
      goto LABEL_28;
    }
  }
  if (v28 != 3) {
    __assert_rtn("-[MPSGraphDepthwiseConvolution3DDataGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphDepthwiseConvolutionOps.mm", 513, "inputValues->size() == 2 || inputValues->size() == 3");
  }
  uint64_t v29 = v27[2];
LABEL_28:
  v47 = [(MPSGraphDepthwiseConvolution3DOpDescriptor *)self->super._desc strides];
  uint64_t v30 = nsArrayToAttr(v47, (mlir::Builder *)a3);
  v48 = [(MPSGraphDepthwiseConvolution3DOpDescriptor *)self->super._desc dilationRates];
  uint64_t v31 = nsArrayToAttr(v48, (mlir::Builder *)a3);
  v50 = [(MPSGraphDepthwiseConvolution3DOpDescriptor *)self->super._desc paddingValues];
  uint64_t v32 = nsArrayToAttr(v50, (mlir::Builder *)a3);
  unsigned int v33 = [(MPSGraphDepthwiseConvolution3DOpDescriptor *)self->super._desc paddingStyle];
  int v34 = [(MPSGraphDepthwiseConvolution3DOpDescriptor *)self->super._desc channelDimensionIndex];
  uint64_t v54 = v26;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v54);
  uint64_t v36 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.depthwise_conv_3d_data_gradient", (const unsigned __int8 *)0x23, Context);
  if (!v37)
  {
    __int16 v59 = 1283;
    __p.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.depthwise_conv_3d_data_gradient";
    uint64_t v58 = 35;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v56 = 259;
    llvm::operator+((uint64_t *)&__p, (uint64_t *)&v55, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v62, v26, v36);
  mlir::mps::DepthwiseConv3DDataGradientOp::build((mlir::Builder *)a3, (uint64_t)v62, *v27, v27[1], v29, v30, v31, v32, v33, v34);
  v38 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v62);
  if (!v38)
  {
    v42 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v43 = 662;
    v44 = "Casting.h";
    v45 = "dyn_cast";
    goto LABEL_38;
  }
  uint64_t v39 = llvm::DefaultDoCastIfPossible<mlir::mps::DepthwiseConv3DDataGradientOp,mlir::Operation *,llvm::CastInfo<mlir::mps::DepthwiseConv3DDataGradientOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v38);
  if (!v39)
  {
    v42 = "result && \"builder didn't return the right type\"";
    int v43 = 497;
    v44 = "Builders.h";
    v45 = "create";
LABEL_38:
    __assert_rtn(v45, v44, v43, v42);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v62);
  if (!*(_DWORD *)(v39 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v51 = v39 - 16;

  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v51);
  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v30 = v9;
  v12 = [(MPSGraphOperation *)self inputTensors];
  id v13 = [v12 objectAtIndexedSubscript:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
  [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:1];
  if (v13 == v9) {
    v20 = {;
  }
    desc = self->super._desc;
    uint64_t v28 = NSString;
    uint64_t v21 = [(MPSGraphOperation *)self name];
    char v24 = [v28 stringWithFormat:@"%@/%@/depthwiseConvolution3DDataGradient", v11, v21];
    uint64_t v26 = [WeakRetained depthwiseConvolution3DWithSourceTensor:v10 weightsTensor:v20 descriptor:desc name:v24];
  }
  else {
    v15 = {;
  }
    size_t v16 = NSString;
    size_t v17 = [(MPSGraphOperation *)self name];
    v18 = [v16 stringWithFormat:@"%@/%@/depthwiseConvolution3DDataGradient/shapeOp", v11, v17];
    uint64_t v19 = [WeakRetained shapeOfTensor:v15 name:v18];

    v20 = objc_loadWeakRetained((id *)&self->super.super._graph);
    uint64_t v21 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:0];
    uint64_t v22 = self->super._desc;
    v23 = NSString;
    char v24 = [(MPSGraphOperation *)self name];
    uint64_t v25 = [v23 stringWithFormat:@"%@/%@/depthwiseConvolution3DWeightsGradient", v11, v24];
    uint64_t v26 = [v20 depthwiseConvolution3DWeightsGradientWithIncomingGradientTensor:v21 sourceTensor:v10 outputShapeTensor:v19 descriptor:v22 name:v25];

    id WeakRetained = (id)v19;
  }

  return v26;
}

@end