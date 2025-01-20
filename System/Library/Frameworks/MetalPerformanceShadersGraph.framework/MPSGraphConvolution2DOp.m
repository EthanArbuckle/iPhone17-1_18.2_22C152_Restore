@interface MPSGraphConvolution2DOp
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphConvolution2DOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v49 = a7;
  mpsFileLoc("-[MPSGraphConvolution2DOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphConvolutionOps.mm", __p);
  id v11 = v49;
  __int16 v68 = 260;
  v67[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v67);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x118u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    HIBYTE(v66) = 11;
    *(__int32 *)((char *)&__dst.i32[1] + 3) = 1681022838;
    __dst.i64[0] = *(void *)"mps.conv_2d";
    v18 = &__dst.i8[11];
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
    p_dst = (int8x16_t *)operator new(v19 + 1);
    __dst.i64[1] = v16;
    unint64_t v66 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v66) = v15;
    p_dst = &__dst;
    if (!v15) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v18 = &p_dst->i8[v16];
LABEL_13:
  __int8 *v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v62);
  v21 = (std::string *)v62.__r_.__value_.__r.__words[0];
  if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v21 = &v62;
  }
  char v22 = 1;
  HIBYTE(v68) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v67[0] = v21;
    char v22 = 3;
  }
  LOBYTE(v68) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v67);
  uint64_t v24 = mlir::NameLoc::get(v23, v13);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v62.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v66) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v66) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  v55 = (mlir::Builder *)a3;
  if (v58 < 0) {
    operator delete(__p[0]);
  }
  v25 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 8uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v26 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc groups];
  unint64_t v27 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc strideInX];
  NSUInteger v28 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc strideInY];
  NSUInteger v29 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc dilationRateInX];
  NSUInteger v30 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc dilationRateInY];
  NSUInteger v31 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc paddingLeft];
  unint64_t v54 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc paddingRight];
  unint64_t v52 = v31;
  uint64_t v53 = v30;
  unint64_t v32 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc paddingTop];
  unint64_t v33 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc paddingBottom];
  uint64_t v50 = v29;
  unint64_t v51 = v28;
  unsigned int v34 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc paddingStyle];
  unsigned int v35 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc dataLayout];
  unsigned int v36 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc weightsLayout];
  uint64_t v59 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v59);
  uint64_t v38 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.conv_2d", (const unsigned __int8 *)0xB, Context);
  if (!v39)
  {
    __int16 v64 = 1283;
    v62.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.conv_2d";
    uint64_t v63 = 11;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v61 = 259;
    llvm::operator+((uint64_t *)&v62, (uint64_t *)&v60, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v67, v24, v38);
  mlir::mps::Conv2DOp::build(v55, (uint64_t)v67, *v25, v25[1], v26, v27, v51, v50, v53, v52, v54, v32, v33, v34, v35, v36);
  v40 = mlir::OpBuilder::create(v55, (const mlir::OperationState *)v67);
  if (!v40)
  {
    v45 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v46 = 662;
    v47 = "Casting.h";
    v48 = "dyn_cast";
    goto LABEL_36;
  }
  uint64_t v41 = llvm::DefaultDoCastIfPossible<mlir::mps::Conv2DOp,mlir::Operation *,llvm::CastInfo<mlir::mps::Conv2DOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v40);
  if (!v41)
  {
    v45 = "result && \"builder didn't return the right type\"";
    int v46 = 497;
    v47 = "Builders.h";
    v48 = "create";
LABEL_36:
    __assert_rtn(v48, v47, v46, v45);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v67);
  if (!*(_DWORD *)(v41 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v56 = v41 - 16;
  uint64_t DefiningOp = mlir::Value::getDefiningOp((mlir::Value *)&v56);
  if (!DefiningOp) {
    __assert_rtn("dyn_cast", "Casting.h", 662, "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"");
  }
  llvm::DefaultDoCastIfPossible<mlir::mps::Conv2DOp,mlir::Operation *,llvm::CastInfo<mlir::mps::Conv2DOp,mlir::Operation *,void>>::doCastIfPossible(DefiningOp);
  v43 = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v56);

  return v43;
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
    NSUInteger v30 = [v28 stringWithFormat:@"%@/%@/convolutionTranspose2DDataGradient/shapeOp", v10, v29];
    uint64_t v19 = [WeakRetained shapeOfTensor:v27 name:v30];

    id v20 = objc_loadWeakRetained((id *)&self->super.super._graph);
    v21 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:1];
    desc = self->super._desc;
    unint64_t v32 = NSString;
    uint64_t v24 = [(MPSGraphOperation *)self name];
    v25 = v36;
    uint64_t v26 = [v32 stringWithFormat:@"%@/%@/convolution2DDataGradient", v10, v24];
    [v20 convolution2DDataGradientWithIncomingGradientTensor:v36 weightsTensor:v21 outputShapeTensor:v19 forwardConvolutionDescriptor:desc name:v26];
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
    uint64_t v26 = [v23 stringWithFormat:@"%@/%@/convolution2DWeightsGradient", v10, v24];
    [v20 convolution2DWeightsGradientWithIncomingGradientTensor:v36 sourceTensor:v21 outputShapeTensor:v19 forwardConvolutionDescriptor:v22 name:v26];
  unint64_t v33 = };

  return v33;
}

@end