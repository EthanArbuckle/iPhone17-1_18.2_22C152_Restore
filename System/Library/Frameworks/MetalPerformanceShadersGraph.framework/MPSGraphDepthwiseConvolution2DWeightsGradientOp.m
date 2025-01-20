@interface MPSGraphDepthwiseConvolution2DWeightsGradientOp
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphDepthwiseConvolution2DWeightsGradientOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  mpsFileLoc("-[MPSGraphDepthwiseConvolution2DWeightsGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphDepthwiseConvolutionOps.mm", __p);
  id v11 = v10;
  __int16 v79 = 260;
  v78[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v78);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x12Cu, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    v19 = (char *)operator new(0x28uLL);
    __dst = (void **)v19;
    long long v77 = xmmword_18112B060;
    qmemcpy(v19, "mps.depthwise_conv_2d_weights_gradient", 38);
    v20 = v19 + 38;
    goto LABEL_13;
  }
  v14 = a3;
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
    *(void *)&long long v77 = v17;
    *((void *)&v77 + 1) = v22 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v77) = v16;
    p_dst = (void **)&__dst;
    if (!v16) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  v20 = (char *)p_dst + v17;
  a3 = v14;
LABEL_13:
  unsigned char *v20 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v73);
  v23 = (std::string *)v73.__r_.__value_.__r.__words[0];
  if ((v73.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v23 = &v73;
  }
  char v24 = 1;
  HIBYTE(v79) = 1;
  if (v23->__r_.__value_.__s.__data_[0])
  {
    v78[0] = v23;
    char v24 = 3;
  }
  LOBYTE(v79) = v24;
  uint64_t v25 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v78);
  uint64_t v26 = mlir::NameLoc::get(v25, v13);
  if (!v26) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v73.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v77) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v77) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  if (v69 < 0) {
    operator delete(__p[0]);
  }
  v27 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 0x10uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  NSUInteger v28 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc strideInX];
  NSUInteger v29 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc strideInY];
  NSUInteger v30 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc dilationRateInX];
  v66 = v11;
  NSUInteger v31 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc dilationRateInY];
  NSUInteger v32 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc paddingLeft];
  uint64_t v64 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc paddingRight];
  uint64_t v62 = v30;
  uint64_t v63 = v29;
  uint64_t v61 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc paddingTop];
  uint64_t v33 = v32;
  uint64_t v34 = v31;
  v60 = (mlir::Builder *)a3;
  uint64_t v35 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc paddingBottom];
  uint64_t v36 = v28;
  unsigned int v37 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc paddingStyle];
  unsigned int v38 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc dataLayout];
  unsigned int v39 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self->super._desc weightsLayout];
  uint64_t v70 = v26;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v70);
  uint64_t v41 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.depthwise_conv_2d_weights_gradient", (const unsigned __int8 *)0x26, Context);
  if (!v42)
  {
    __int16 v75 = 1283;
    v73.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.depthwise_conv_2d_weights_gradient";
    uint64_t v74 = 38;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v72 = 259;
    llvm::operator+((uint64_t *)&v73, v71, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v78, v26, v41);
  mlir::mps::DepthwiseConv2DWeightsGradientOp::build(v60, (uint64_t)v78, *v27, v27[1], v27[2], v36, v63, v62, v34, v33, v64, v61, v35, v37, v38, v39);
  v43 = mlir::OpBuilder::create(v60, (const mlir::OperationState *)v78);
  v44 = v43;
  if (!v43)
  {
    v50 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v51 = 662;
    v52 = "Casting.h";
    v53 = "dyn_cast";
    goto LABEL_31;
  }
  uint64_t v45 = *((void *)v43 + 6);
  v46 = *(void **)(v45 + 16);
  if (v46 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst = *(void ***)(v45 + 8);
    AttrData = (void *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v55 == 38)
    {
      BOOL v56 = *AttrData == 0x747065642E73706DLL && AttrData[1] == 0x6F635F6573697768;
      BOOL v57 = v56 && AttrData[2] == 0x65775F64325F766ELL;
      BOOL v58 = v57 && AttrData[3] == 0x72675F7374686769;
      if (v58 && *(void *)((char *)AttrData + 30) == 0x746E656964617267)
      {
        __int16 v75 = 1283;
        v73.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
        v73.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.depthwise_conv_2d_weights_gradient";
        uint64_t v74 = 38;
        v71[0] = (uint64_t)"' failed due to the operation not being registered";
        __int16 v72 = 259;
        llvm::operator+((uint64_t *)&v73, v71, (uint64_t)&__dst);
        llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
      }
    }
    v50 = "result && \"builder didn't return the right type\"";
    int v51 = 497;
    v52 = "Builders.h";
    v53 = "create";
LABEL_31:
    __assert_rtn(v53, v52, v51, v50);
  }
  if (v46 != &mlir::detail::TypeIDResolver<mlir::mps::DepthwiseConv2DWeightsGradientOp,void>::id)
  {
    v50 = "result && \"builder didn't return the right type\"";
    int v51 = 497;
    v52 = "Builders.h";
    v53 = "create";
    goto LABEL_31;
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v78);
  if (!*((_DWORD *)v44 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v67 = (char *)v44 - 16;
  uint64_t DefiningOp = mlir::Value::getDefiningOp((mlir::Value *)&v67);
  if (!DefiningOp) {
    __assert_rtn("dyn_cast", "Casting.h", 662, "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"");
  }
  llvm::DefaultDoCastIfPossible<mlir::mps::DepthwiseConv2DOp,mlir::Operation *,llvm::CastInfo<mlir::mps::DepthwiseConv2DOp,mlir::Operation *,void>>::doCastIfPossible(DefiningOp);
  v48 = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v67);

  return v48;
}

@end