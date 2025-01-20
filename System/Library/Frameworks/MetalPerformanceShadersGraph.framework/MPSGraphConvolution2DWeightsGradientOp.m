@interface MPSGraphConvolution2DWeightsGradientOp
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphConvolution2DWeightsGradientOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphConvolution2DWeightsGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphConvolutionOps.mm", __p);
  id v12 = v11;
  __int16 v78 = 260;
  v77[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v77);
  uint64_t v14 = mlir::FileLineColLoc::get(StringAttr, 0x19Cu, 0);
  if (!v14) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v12)
  {
    v20 = (char *)operator new(0x20uLL);
    __dst = (void **)v20;
    long long v76 = xmmword_181129E90;
    qmemcpy(v20, "mps.conv_2d_weights_gradient", 28);
    v21 = v20 + 28;
    goto LABEL_13;
  }
  v15 = a3;
  v16 = (const char *)[v12 UTF8String];
  size_t v17 = strlen(v16);
  if (v17 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v18 = v17;
  if (v17 >= 0x17)
  {
    uint64_t v22 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17) {
      uint64_t v22 = v17 | 7;
    }
    uint64_t v23 = v22 + 1;
    p_dst = (void **)operator new(v22 + 1);
    *(void *)&long long v76 = v18;
    *((void *)&v76 + 1) = v23 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v76) = v17;
    p_dst = (void **)&__dst;
    if (!v17) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v16, v18);
LABEL_12:
  a3 = v15;
  v21 = (char *)p_dst + v18;
LABEL_13:
  unsigned char *v21 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v72);
  v24 = (std::string *)v72.__r_.__value_.__r.__words[0];
  if ((v72.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v24 = &v72;
  }
  char v25 = 1;
  HIBYTE(v78) = 1;
  if (v24->__r_.__value_.__s.__data_[0])
  {
    v77[0] = v24;
    char v25 = 3;
  }
  LOBYTE(v78) = v25;
  uint64_t v26 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v77);
  uint64_t v27 = mlir::NameLoc::get(v26, v14);
  if (!v27) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v72.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v76) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v76) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  v65 = v12;
  if (v68 < 0) {
    operator delete(__p[0]);
  }
  v28 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 0x10uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v29 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc groups];
  NSUInteger v30 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc strideInX];
  NSUInteger v31 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc strideInY];
  NSUInteger v32 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc dilationRateInX];
  NSUInteger v33 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc dilationRateInY];
  unint64_t v64 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc paddingLeft];
  uint64_t v63 = v33;
  unint64_t v62 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc paddingRight];
  unint64_t v34 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc paddingTop];
  uint64_t v59 = v32;
  unint64_t v60 = v31;
  unint64_t v61 = v30;
  unint64_t v35 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc paddingBottom];
  v36 = (mlir::Builder *)a3;
  unsigned int v37 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc paddingStyle];
  unsigned int v38 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc dataLayout];
  unsigned int v39 = [(MPSGraphConvolution2DOpDescriptor *)self->super._desc weightsLayout];
  uint64_t v69 = v27;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v69);
  uint64_t v41 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.conv_2d_weights_gradient", (const unsigned __int8 *)0x1C, Context);
  if (!v42)
  {
    __int16 v74 = 1283;
    v72.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.conv_2d_weights_gradient";
    uint64_t v73 = 28;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v71 = 259;
    llvm::operator+((uint64_t *)&v72, v70, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v77, v27, v41);
  mlir::mps::Conv2DWeightsGradientOp::build(v36, (uint64_t)v77, *v28, v28[1], v28[2], v29, v61, v60, v59, v63, v64, v62, v34, v35, v37, v38, v39);
  v43 = mlir::OpBuilder::create(v36, (const mlir::OperationState *)v77);
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
    uint64_t AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v55 == 28)
    {
      BOOL v56 = *(void *)AttrData == 0x766E6F632E73706DLL && *(void *)(AttrData + 8) == 0x676965775F64325FLL;
      BOOL v57 = v56 && *(void *)(AttrData + 16) == 0x646172675F737468;
      if (v57 && *(_DWORD *)(AttrData + 24) == 1953391977)
      {
        __int16 v74 = 1283;
        v72.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
        v72.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.conv_2d_weights_gradient";
        uint64_t v73 = 28;
        v70[0] = (uint64_t)"' failed due to the operation not being registered";
        __int16 v71 = 259;
        llvm::operator+((uint64_t *)&v72, v70, (uint64_t)&__dst);
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
  if (v46 != &mlir::detail::TypeIDResolver<mlir::mps::Conv2DWeightsGradientOp,void>::id)
  {
    v50 = "result && \"builder didn't return the right type\"";
    int v51 = 497;
    v52 = "Builders.h";
    v53 = "create";
    goto LABEL_31;
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v77);
  if (!*((_DWORD *)v44 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v66 = (char *)v44 - 16;
  uint64_t DefiningOp = mlir::Value::getDefiningOp((mlir::Value *)&v66);
  if (!DefiningOp) {
    __assert_rtn("dyn_cast", "Casting.h", 662, "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"");
  }
  llvm::DefaultDoCastIfPossible<mlir::mps::Conv2DOp,mlir::Operation *,llvm::CastInfo<mlir::mps::Conv2DOp,mlir::Operation *,void>>::doCastIfPossible(DefiningOp);
  v48 = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v66);

  return v48;
}

@end