@interface MPSGraphConvolution3DOp
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphConvolution3DOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  mpsFileLoc("-[MPSGraphConvolution3DOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphConvolutionOps.mm", __p);
  id v11 = v10;
  __int16 v74 = 260;
  v73[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v73);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x1F1u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    HIBYTE(v72) = 11;
    *(__int32 *)((char *)&__dst.i32[1] + 3) = 1681088374;
    __dst.i64[0] = *(void *)"mps.conv_3d";
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
    unint64_t v72 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v72) = v15;
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
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v68);
  v21 = (std::string *)v68.__r_.__value_.__r.__words[0];
  if ((v68.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v21 = &v68;
  }
  char v22 = 1;
  HIBYTE(v74) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v73[0] = v21;
    char v22 = 3;
  }
  LOBYTE(v74) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v73);
  uint64_t v24 = mlir::NameLoc::get(v23, v13);
  if (!v24) {
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
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  uint64_t v60 = v24;
  if (v64 < 0) {
    operator delete(__p[0]);
  }
  NSUInteger v25 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc strideInX];
  NSUInteger v26 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc strideInY];
  NSUInteger v27 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc strideInZ];
  v28 = (uint64_t *)operator new(0x18uLL);
  uint64_t *v28 = v25;
  v28[1] = v26;
  v61 = v28;
  v28[2] = v27;
  NSUInteger v29 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc dilationRateInX];
  NSUInteger v30 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc dilationRateInY];
  NSUInteger v31 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc dilationRateInZ];
  v57 = v11;
  v58 = (mlir::Builder *)a3;
  v32 = (uint64_t *)operator new(0x18uLL);
  uint64_t *v32 = v29;
  v32[1] = v30;
  v32[2] = v31;
  NSUInteger v33 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc paddingLeft];
  NSUInteger v34 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc paddingRight];
  NSUInteger v35 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc paddingTop];
  NSUInteger v36 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc paddingBottom];
  NSUInteger v37 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc paddingFront];
  NSUInteger v38 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc paddingBack];
  v39 = (uint64_t *)operator new(0x30uLL);
  uint64_t *v39 = v33;
  v39[1] = v34;
  v39[2] = v35;
  v39[3] = v36;
  v39[4] = v37;
  v39[5] = v38;
  v40 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 8uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v41 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc groups];
  unsigned int v42 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc paddingStyle];
  unsigned int v43 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc dataLayout];
  unsigned int v44 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc weightsLayout];
  uint64_t v65 = v60;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v65);
  uint64_t v46 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.conv_3d", (const unsigned __int8 *)0xB, Context);
  if (!v47)
  {
    __int16 v70 = 1283;
    v68.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.conv_3d";
    uint64_t v69 = 11;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v67 = 259;
    llvm::operator+((uint64_t *)&v68, (uint64_t *)&v66, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v73, v60, v46);
  mlir::mps::Conv3DOp::build(v58, (uint64_t)v73, *v40, v40[1], v41, v61, 3, v48, v32, 3, v39, 6, v42, v43, v44);
  v49 = mlir::OpBuilder::create(v58, (const mlir::OperationState *)v73);
  if (!v49)
  {
    v53 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v54 = 662;
    v55 = "Casting.h";
    v56 = "dyn_cast";
    goto LABEL_35;
  }
  uint64_t v50 = llvm::DefaultDoCastIfPossible<mlir::mps::Conv3DOp,mlir::Operation *,llvm::CastInfo<mlir::mps::Conv3DOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v49);
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
  operator delete(v39);
  operator delete(v32);
  operator delete(v61);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9 = a3;
  id v36 = a4;
  id v10 = a6;
  NSUInteger v35 = v9;
  id v11 = [(MPSGraphOperation *)self inputTensors];
  id v12 = [v11 objectAtIndexedSubscript:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
  inputTensors = self->super.super._inputTensors;
  if (v12 == v9)
  {
    NSUInteger v27 = [(NSArray *)inputTensors objectAtIndexedSubscript:0];
    v28 = NSString;
    NSUInteger v29 = [(MPSGraphOperation *)self name];
    NSUInteger v30 = [v28 stringWithFormat:@"%@/%@/convolution3DDataGradient/shapeOp", v10, v29];
    uint64_t v19 = [WeakRetained shapeOfTensor:v27 name:v30];

    id v20 = objc_loadWeakRetained((id *)&self->super.super._graph);
    v21 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:1];
    desc = self->super._desc;
    v32 = NSString;
    uint64_t v24 = [(MPSGraphOperation *)self name];
    NSUInteger v25 = v36;
    NSUInteger v26 = [v32 stringWithFormat:@"%@/%@/convolution3DDataGradient", v10, v24];
    [v20 convolution3DDataGradientWithIncomingGradientTensor:v36 weightsTensor:v21 outputShapeTensor:v19 forwardConvolutionDescriptor:desc name:v26];
  }
  else
  {
    size_t v15 = [(NSArray *)inputTensors objectAtIndexedSubscript:1];
    size_t v16 = NSString;
    v17 = [(MPSGraphOperation *)self name];
    v18 = [v16 stringWithFormat:@"%@/%@/convolution3DDataGradient/shapeOp", v10, v17];
    uint64_t v19 = [WeakRetained shapeOfTensor:v15 name:v18];

    id v20 = objc_loadWeakRetained((id *)&self->super.super._graph);
    v21 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:0];
    char v22 = self->super._desc;
    uint64_t v23 = NSString;
    uint64_t v24 = [(MPSGraphOperation *)self name];
    NSUInteger v25 = v36;
    NSUInteger v26 = [v23 stringWithFormat:@"%@/%@/convolution3DWeightsGradient", v10, v24];
    [v20 convolution3DWeightsGradientWithIncomingGradientTensor:v36 sourceTensor:v21 outputShapeTensor:v19 forwardConvolutionDescriptor:v22 name:v26];
  NSUInteger v33 = };

  return v33;
}

@end