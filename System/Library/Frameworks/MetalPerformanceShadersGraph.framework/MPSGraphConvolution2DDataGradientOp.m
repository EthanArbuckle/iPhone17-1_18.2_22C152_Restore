@interface MPSGraphConvolution2DDataGradientOp
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphConvolution2DDataGradientOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v50 = a7;
  mpsFileLoc("-[MPSGraphConvolution2DDataGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphConvolutionOps.mm", __p);
  id v11 = v50;
  __int16 v69 = 260;
  v68[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v68);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x15Bu, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    v18 = (char *)operator new(0x20uLL);
    __dst = (void **)v18;
    long long v67 = xmmword_181130E20;
    qmemcpy(v18, "mps.conv_2d_data_gradient", 25);
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
    *(void *)&long long v67 = v16;
    *((void *)&v67 + 1) = v21 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v67) = v15;
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
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v63);
  v22 = (std::string *)v63.__r_.__value_.__r.__words[0];
  if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v22 = &v63;
  }
  char v23 = 1;
  HIBYTE(v69) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v68[0] = v22;
    char v23 = 3;
  }
  LOBYTE(v69) = v23;
  uint64_t v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v68);
  uint64_t v25 = mlir::NameLoc::get(v24, v13);
  if (!v25) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v63.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v67) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v67) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  v56 = (mlir::Builder *)a3;
  if (v59 < 0) {
    operator delete(__p[0]);
  }
  v26 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 0x10uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v27 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc groups];
  unint64_t v28 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc strideInX];
  NSUInteger v29 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc strideInY];
  NSUInteger v30 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc dilationRateInX];
  NSUInteger v31 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc dilationRateInY];
  NSUInteger v32 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc paddingLeft];
  unint64_t v55 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc paddingRight];
  unint64_t v54 = v32;
  unint64_t v53 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc paddingTop];
  uint64_t v52 = v31;
  unint64_t v33 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc paddingBottom];
  uint64_t v34 = v30;
  unint64_t v51 = v29;
  unsigned int v35 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc paddingStyle];
  unsigned int v36 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc dataLayout];
  unsigned int v37 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc weightsLayout];
  uint64_t v60 = v25;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v60);
  uint64_t v39 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.conv_2d_data_gradient", (const unsigned __int8 *)0x19, Context);
  if (!v40)
  {
    __int16 v65 = 1283;
    v63.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.conv_2d_data_gradient";
    uint64_t v64 = 25;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v62 = 259;
    llvm::operator+((uint64_t *)&v63, (uint64_t *)&v61, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v68, v25, v39);
  mlir::mps::Conv2DDataGradientOp::build(v56, (uint64_t)v68, *v26, v26[1], v26[2], v27, v28, v51, v34, v52, v54, v55, v53, v33, v35, v36, v37);
  v41 = mlir::OpBuilder::create(v56, (const mlir::OperationState *)v68);
  if (!v41)
  {
    v46 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v47 = 662;
    v48 = "Casting.h";
    v49 = "dyn_cast";
    goto LABEL_36;
  }
  uint64_t v42 = llvm::DefaultDoCastIfPossible<mlir::mps::Conv2DDataGradientOp,mlir::Operation *,llvm::CastInfo<mlir::mps::Conv2DDataGradientOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v41);
  if (!v42)
  {
    v46 = "result && \"builder didn't return the right type\"";
    int v47 = 497;
    v48 = "Builders.h";
    v49 = "create";
LABEL_36:
    __assert_rtn(v49, v48, v47, v46);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v68);
  if (!*(_DWORD *)(v42 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v57 = v42 - 16;
  uint64_t DefiningOp = mlir::Value::getDefiningOp((mlir::Value *)&v57);
  if (!DefiningOp) {
    __assert_rtn("dyn_cast", "Casting.h", 662, "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"");
  }
  llvm::DefaultDoCastIfPossible<mlir::mps::Conv2DOp,mlir::Operation *,llvm::CastInfo<mlir::mps::Conv2DOp,mlir::Operation *,void>>::doCastIfPossible(DefiningOp);
  v44 = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v57);

  return v44;
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
    unint64_t v28 = NSString;
    uint64_t v21 = [(MPSGraphOperation *)self name];
    uint64_t v24 = [v28 stringWithFormat:@"%@/%@/convolutionTranspose2DDataGradient", v11, v21];
    v26 = [WeakRetained convolution2DWithSourceTensor:v10 weightsTensor:v20 descriptor:desc name:v24];
  }
  else {
    size_t v15 = {;
  }
    size_t v16 = NSString;
    v17 = [(MPSGraphOperation *)self name];
    v18 = [v16 stringWithFormat:@"%@/%@/convolutionTranspose2DDataGradient/shapeOp", v11, v17];
    uint64_t v19 = [WeakRetained shapeOfTensor:v15 name:v18];

    uint64_t v20 = objc_loadWeakRetained((id *)&self->super.super._graph);
    uint64_t v21 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:0];
    v22 = self->super._desc;
    char v23 = NSString;
    uint64_t v24 = [(MPSGraphOperation *)self name];
    uint64_t v25 = [v23 stringWithFormat:@"%@/%@/convolutionTranspose2DWeightsGradient", v11, v24];
    v26 = [v20 convolution2DWeightsGradientWithIncomingGradientTensor:v21 sourceTensor:v10 outputShapeTensor:v19 forwardConvolutionDescriptor:v22 name:v25];

    id WeakRetained = (id)v19;
  }

  return v26;
}

@end