@interface MPSGraphConvolution3DWeightsGradientOp
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphConvolution3DWeightsGradientOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  mpsFileLoc("-[MPSGraphConvolution3DWeightsGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphConvolutionOps.mm", __p);
  id v11 = v10;
  __int16 v81 = 260;
  v80[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v80);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x266u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    v18 = (char *)operator new(0x20uLL);
    __dst = (void **)v18;
    long long v79 = xmmword_181129E90;
    qmemcpy(v18, "mps.conv_3d_weights_gradient", 28);
    v19 = v18 + 28;
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
    *(void *)&long long v79 = v16;
    *((void *)&v79 + 1) = v21 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v79) = v15;
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
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v75);
  v22 = (std::string *)v75.__r_.__value_.__r.__words[0];
  if ((v75.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v22 = &v75;
  }
  char v23 = 1;
  HIBYTE(v81) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v80[0] = v22;
    char v23 = 3;
  }
  LOBYTE(v81) = v23;
  uint64_t v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v80);
  uint64_t v25 = mlir::NameLoc::get(v24, v13);
  if (!v25) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v75.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v79) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v79) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  if (v71 < 0) {
    operator delete(__p[0]);
  }
  NSUInteger v26 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc strideInX];
  NSUInteger v27 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc strideInY];
  NSUInteger v28 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc strideInZ];
  v29 = (uint64_t *)operator new(0x18uLL);
  uint64_t *v29 = v26;
  v29[1] = v27;
  v29[2] = v28;
  NSUInteger v30 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc dilationRateInX];
  NSUInteger v31 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc dilationRateInY];
  NSUInteger v32 = [(MPSGraphConvolution3DOpDescriptor *)self->super._desc dilationRateInZ];
  v64 = v11;
  v65 = (mlir::Builder *)a3;
  v67 = v29;
  v33 = (uint64_t *)operator new(0x18uLL);
  uint64_t *v33 = v30;
  v33[1] = v31;
  v66 = v33;
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
  uint64_t v72 = v25;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v72);
  uint64_t v47 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.conv_3d_weights_gradient", (const unsigned __int8 *)0x1C, Context);
  if (!v48)
  {
    __int16 v77 = 1283;
    v75.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.conv_3d_weights_gradient";
    uint64_t v76 = 28;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v74 = 259;
    llvm::operator+((uint64_t *)&v75, v73, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v80, v25, v47);
  mlir::mps::Conv3DWeightsGradientOp::build(v65, (uint64_t)v80, *v41, v41[1], v41[2], v42, v67, 3, v66, 3, v40, 6, v43, v44, v45);
  v49 = mlir::OpBuilder::create(v65, (const mlir::OperationState *)v80);
  v50 = v49;
  if (!v49)
  {
    v55 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v56 = 662;
    v57 = "Casting.h";
    v58 = "dyn_cast";
    goto LABEL_30;
  }
  uint64_t v51 = *((void *)v49 + 6);
  v52 = *(void **)(v51 + 16);
  if (v52 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst = *(void ***)(v51 + 8);
    uint64_t AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v60 == 28)
    {
      BOOL v61 = *(void *)AttrData == 0x766E6F632E73706DLL && *(void *)(AttrData + 8) == 0x676965775F64335FLL;
      BOOL v62 = v61 && *(void *)(AttrData + 16) == 0x646172675F737468;
      if (v62 && *(_DWORD *)(AttrData + 24) == 1953391977)
      {
        __int16 v77 = 1283;
        v75.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
        v75.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.conv_3d_weights_gradient";
        uint64_t v76 = 28;
        v73[0] = (uint64_t)"' failed due to the operation not being registered";
        __int16 v74 = 259;
        llvm::operator+((uint64_t *)&v75, v73, (uint64_t)&__dst);
        llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
      }
    }
    v55 = "result && \"builder didn't return the right type\"";
    int v56 = 497;
    v57 = "Builders.h";
    v58 = "create";
LABEL_30:
    __assert_rtn(v58, v57, v56, v55);
  }
  if (v52 != &mlir::detail::TypeIDResolver<mlir::mps::Conv3DWeightsGradientOp,void>::id)
  {
    v55 = "result && \"builder didn't return the right type\"";
    int v56 = 497;
    v57 = "Builders.h";
    v58 = "create";
    goto LABEL_30;
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v80);
  if (!*((_DWORD *)v50 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v69 = (char *)v50 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v69);
  operator delete(v40);
  operator delete(v66);
  operator delete(v67);

  return DefiningOp;
}

@end