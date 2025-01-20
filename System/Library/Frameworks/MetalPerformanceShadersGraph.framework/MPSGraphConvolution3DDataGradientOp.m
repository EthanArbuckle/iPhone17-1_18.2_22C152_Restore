@interface MPSGraphConvolution3DDataGradientOp
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphConvolution3DDataGradientOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  mpsFileLoc("-[MPSGraphConvolution3DDataGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphConvolutionOps.mm", __p);
  id v11 = v10;
  __int16 v74 = 260;
  v73[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v73);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x22Cu, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    v18 = (char *)operator new(0x20uLL);
    __dst = (void **)v18;
    long long v72 = xmmword_181130E20;
    qmemcpy(v18, "mps.conv_3d_data_gradient", 25);
    v19 = v18 + 25;
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
    uint64_t v20 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17) {
      uint64_t v20 = v15 | 7;
    }
    uint64_t v21 = v20 + 1;
    p_dst = (void **)operator new(v20 + 1);
    *(void *)&long long v72 = v16;
    *((void *)&v72 + 1) = v21 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v72) = v15;
    p_dst = (void **)&__dst;
    if (!v15) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v19 = (char *)p_dst + v16;
LABEL_13:
  unsigned char *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v68);
  v22 = (std::string *)v68.__r_.__value_.__r.__words[0];
  if ((v68.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v22 = &v68;
  }
  char v23 = 1;
  HIBYTE(v74) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v73[0] = v22;
    char v23 = 3;
  }
  LOBYTE(v74) = v23;
  uint64_t v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v73);
  uint64_t v25 = mlir::NameLoc::get(v24, v13);
  if (!v25) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v68.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v72) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v72) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  uint64_t v60 = v25;
  if (v64 < 0) {
    operator delete(__p[0]);
  }
  NSUInteger v26 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc strideInX];
  NSUInteger v27 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc strideInY];
  NSUInteger v28 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc strideInZ];
  v29 = (uint64_t *)operator new(0x18uLL);
  uint64_t *v29 = v26;
  v29[1] = v27;
  v61 = v29;
  v29[2] = v28;
  NSUInteger v30 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc dilationRateInX];
  NSUInteger v31 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc dilationRateInY];
  NSUInteger v32 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc dilationRateInZ];
  v57 = v11;
  v58 = (mlir::Builder *)a3;
  v33 = (uint64_t *)operator new(0x18uLL);
  uint64_t *v33 = v30;
  v33[1] = v31;
  v33[2] = v32;
  NSUInteger v34 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc paddingLeft];
  NSUInteger v35 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc paddingRight];
  NSUInteger v36 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc paddingTop];
  NSUInteger v37 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc paddingBottom];
  NSUInteger v38 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc paddingFront];
  NSUInteger v39 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc paddingBack];
  v40 = (uint64_t *)operator new(0x30uLL);
  uint64_t *v40 = v34;
  v40[1] = v35;
  v40[2] = v36;
  v40[3] = v37;
  v40[4] = v38;
  v40[5] = v39;
  v41 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 0x10uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v42 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc groups];
  unsigned int v43 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc paddingStyle];
  unsigned int v44 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc dataLayout];
  unsigned int v45 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc weightsLayout];
  uint64_t v65 = v60;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v65);
  uint64_t v47 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.conv_3d_data_gradient", (const unsigned __int8 *)0x19, Context);
  if (!v48)
  {
    __int16 v70 = 1283;
    v68.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.conv_3d_data_gradient";
    uint64_t v69 = 25;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v67 = 259;
    llvm::operator+((uint64_t *)&v68, (uint64_t *)&v66, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v73, v60, v47);
  mlir::mps::Conv3DDataGradientOp::build(v58, (uint64_t)v73, *v41, v41[1], v41[2], v42, v61, 3, v33, 3, v40, 6, v43, v44, v45);
  v49 = mlir::OpBuilder::create(v58, (const mlir::OperationState *)v73);
  if (!v49)
  {
    v53 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v54 = 662;
    v55 = "Casting.h";
    v56 = "dyn_cast";
    goto LABEL_35;
  }
  uint64_t v50 = llvm::DefaultDoCastIfPossible<mlir::mps::Conv3DDataGradientOp,mlir::Operation *,llvm::CastInfo<mlir::mps::Conv3DDataGradientOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v49);
  if (!v50)
  {
    v53 = "result && \"builder didn't return the right type\"";
    int v54 = 497;
    v55 = "Builders.h";
    v56 = "create";
LABEL_35:
    __assert_rtn(v56, v55, v54, v53);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v73);
  if (!*(_DWORD *)(v50 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v62 = v50 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v62);
  operator delete(v40);
  operator delete(v33);
  operator delete(v61);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  NSUInteger v30 = v9;
  v12 = [(MPSGraphOperation *)self inputTensors];
  id v13 = [v12 objectAtIndexedSubscript:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
  [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:1];
  if (v13 == v9) {
    uint64_t v20 = {;
  }
    desc = self->super._desc;
    NSUInteger v28 = NSString;
    uint64_t v21 = [(MPSGraphOperation *)self name];
    uint64_t v24 = [v28 stringWithFormat:@"%@/%@/convolution3DDataGradient", v11, v21];
    NSUInteger v26 = [WeakRetained convolution3DWithSourceTensor:v10 weightsTensor:v20 descriptor:desc name:v24];
  }
  else {
    size_t v15 = {;
  }
    size_t v16 = NSString;
    v17 = [(MPSGraphOperation *)self name];
    v18 = [v16 stringWithFormat:@"%@/%@/convolution3DDataGradient/shapeOp", v11, v17];
    uint64_t v19 = [WeakRetained shapeOfTensor:v15 name:v18];

    uint64_t v20 = objc_loadWeakRetained((id *)&self->super.super._graph);
    uint64_t v21 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:0];
    v22 = self->super._desc;
    char v23 = NSString;
    uint64_t v24 = [(MPSGraphOperation *)self name];
    uint64_t v25 = [v23 stringWithFormat:@"%@/%@/convolution3DWeightsGradient", v11, v24];
    NSUInteger v26 = [v20 convolution3DWeightsGradientWithIncomingGradientTensor:v21 sourceTensor:v10 outputShapeTensor:v19 forwardConvolutionDescriptor:v22 name:v25];

    id WeakRetained = (id)v19;
  }

  return v26;
}

@end