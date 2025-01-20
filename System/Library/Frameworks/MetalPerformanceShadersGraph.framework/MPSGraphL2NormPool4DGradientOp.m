@interface MPSGraphL2NormPool4DGradientOp
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphL2NormPool4DGradientOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphL2NormPool4DGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphPoolingOps.mm", __p);
  id v12 = v11;
  __int16 v70 = 260;
  v69[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v69);
  uint64_t v14 = mlir::FileLineColLoc::get(StringAttr, 0x371u, 0);
  if (!v14) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v12)
  {
    v19 = (char *)operator new(0x20uLL);
    __dst = (void **)v19;
    long long v68 = xmmword_181129E90;
    qmemcpy(v19, "mps.pooling_l2_norm_gradient", 28);
    v20 = v19 + 28;
    goto LABEL_13;
  }
  v15 = (const char *)[v12 UTF8String];
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
    *(void *)&long long v68 = v17;
    *((void *)&v68 + 1) = v22 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v68) = v16;
    p_dst = (void **)&__dst;
    if (!v16) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  v20 = (char *)p_dst + v17;
LABEL_13:
  unsigned char *v20 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v64);
  v23 = (std::string *)v64.__r_.__value_.__r.__words[0];
  if ((v64.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v23 = &v64;
  }
  char v24 = 1;
  HIBYTE(v70) = 1;
  if (v23->__r_.__value_.__s.__data_[0])
  {
    v69[0] = v23;
    char v24 = 3;
  }
  LOBYTE(v70) = v24;
  uint64_t v25 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v69);
  uint64_t v26 = mlir::NameLoc::get(v25, v14);
  if (!v26) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v64.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v64.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v68) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v68) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  if (v60 < 0) {
    operator delete(__p[0]);
  }
  v27 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 8uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  v53 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc kernelSizes];
  uint64_t v28 = nsArrayToAttr(v53, (mlir::Builder *)a3);
  v54 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc strides];
  uint64_t v29 = nsArrayToAttr(v54, (mlir::Builder *)a3);
  v55 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc dilationRates];
  uint64_t v56 = v29;
  uint64_t v30 = nsArrayToAttr(v55, (mlir::Builder *)a3);
  unsigned int v31 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc paddingStyle];
  v57 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc paddingValues];
  uint64_t v32 = nsArrayToAttr(v57, (mlir::Builder *)a3);
  char v33 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc ceilMode];
  char v34 = [(MPSGraphPooling4DOpDescriptor *)self->super._desc includeZeroPadToAverage];
  uint64_t v61 = v26;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v61);
  uint64_t v36 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.pooling_l2_norm_gradient", (const unsigned __int8 *)0x1C, Context);
  if (!v37)
  {
    __int16 v66 = 1283;
    v64.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.pooling_l2_norm_gradient";
    uint64_t v65 = 28;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v63 = 259;
    llvm::operator+((uint64_t *)&v64, v62, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v69, v26, v36);
  mlir::mps::PoolL2NormGradientOp::build((mlir::UnitAttr **)a3, (uint64_t)v69, *v27, v27[1], v28, v56, v30, v31, v32, v33, v34);
  v38 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v69);
  v39 = v38;
  if (!v38)
  {
    v44 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v45 = 662;
    v46 = "Casting.h";
    v47 = "dyn_cast";
    goto LABEL_51;
  }
  uint64_t v40 = *((void *)v38 + 6);
  v41 = *(void **)(v40 + 16);
  if (v41 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst = *(void ***)(v40 + 8);
    uint64_t AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v49 == 28)
    {
      BOOL v50 = *(void *)AttrData == 0x6C6F6F702E73706DLL && *(void *)(AttrData + 8) == 0x6E5F326C5F676E69;
      BOOL v51 = v50 && *(void *)(AttrData + 16) == 0x646172675F6D726FLL;
      if (v51 && *(_DWORD *)(AttrData + 24) == 1953391977)
      {
        __int16 v66 = 1283;
        v64.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
        v64.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.pooling_l2_norm_gradient";
        uint64_t v65 = 28;
        v62[0] = (uint64_t)"' failed due to the operation not being registered";
        __int16 v63 = 259;
        llvm::operator+((uint64_t *)&v64, v62, (uint64_t)&__dst);
        llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
      }
    }
    goto LABEL_50;
  }
  if (v41 != &mlir::detail::TypeIDResolver<mlir::mps::PoolL2NormGradientOp,void>::id)
  {
LABEL_50:
    v44 = "result && \"builder didn't return the right type\"";
    int v45 = 497;
    v46 = "Builders.h";
    v47 = "create";
LABEL_51:
    __assert_rtn(v47, v46, v45, v44);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v69);
  if (!*((_DWORD *)v39 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v58 = (char *)v39 - 16;

  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v58);
  return DefiningOp;
}

@end