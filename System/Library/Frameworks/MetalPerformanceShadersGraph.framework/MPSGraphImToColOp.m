@interface MPSGraphImToColOp
- (MPSGraphImToColOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphImToColOp

- (MPSGraphImToColOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = (MPSGraphImToColOpDescriptor *)[v15 copy];
  imToColDesc = self->_imToColDesc;
  self->_imToColDesc = v17;

  v19 = [(MPSGraphOperation *)self initWithGraph:v12 inputTensors:v13 controlDependencies:v14 name:v16];
  return v19;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  mpsFileLoc("-[MPSGraphImToColOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphImToColOps.mm", __p);
  id v59 = v10;
  __int16 v72 = 260;
  v71[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v71);
  uint64_t v12 = mlir::FileLineColLoc::get(StringAttr, 0x85u, 0);
  if (!v12) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v59)
  {
    HIBYTE(v70) = 13;
    qmemcpy(&__dst, "mps.im_to_col", 13);
    v17 = &__dst.i8[13];
    goto LABEL_13;
  }
  id v13 = (const char *)[v59 UTF8String];
  size_t v14 = strlen(v13);
  if (v14 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v15 = v14;
  if (v14 >= 0x17)
  {
    uint64_t v18 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v18 = v14 | 7;
    }
    uint64_t v19 = v18 + 1;
    p_dst = (int8x16_t *)operator new(v18 + 1);
    __dst.i64[1] = v15;
    unint64_t v70 = v19 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v70) = v14;
    p_dst = &__dst;
    if (!v14) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v13, v15);
LABEL_12:
  v17 = &p_dst->i8[v15];
LABEL_13:
  __int8 *v17 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v66);
  v20 = (std::string *)v66.__r_.__value_.__r.__words[0];
  if ((v66.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v20 = &v66;
  }
  char v21 = 1;
  HIBYTE(v72) = 1;
  if (v20->__r_.__value_.__s.__data_[0])
  {
    v71[0] = v20;
    char v21 = 3;
  }
  LOBYTE(v72) = v21;
  uint64_t v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v71);
  uint64_t v23 = mlir::NameLoc::get(v22, v12);
  if (!v23) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v66.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v70) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v70) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v62 < 0) {
    operator delete(__p[0]);
  }
  NSUInteger v24 = [(MPSGraphImToColOpDescriptor *)self->_imToColDesc kernelHeight];
  NSUInteger v25 = [(MPSGraphImToColOpDescriptor *)self->_imToColDesc kernelWidth];
  v26 = (long long *)operator new(0x10uLL);
  *(void *)v26 = v24;
  *((void *)v26 + 1) = v25;
  v58 = v26;
  NSUInteger v27 = [(MPSGraphImToColOpDescriptor *)self->_imToColDesc strideInY];
  NSUInteger v28 = [(MPSGraphImToColOpDescriptor *)self->_imToColDesc strideInX];
  v29 = (long long *)operator new(0x10uLL);
  *(void *)v29 = v27;
  *((void *)v29 + 1) = v28;
  NSUInteger v30 = [(MPSGraphImToColOpDescriptor *)self->_imToColDesc dilationRateInY];
  NSUInteger v31 = [(MPSGraphImToColOpDescriptor *)self->_imToColDesc dilationRateInX];
  v32 = (long long *)operator new(0x10uLL);
  *(void *)v32 = v30;
  *((void *)v32 + 1) = v31;
  NSUInteger v33 = [(MPSGraphImToColOpDescriptor *)self->_imToColDesc paddingTop];
  NSUInteger v34 = [(MPSGraphImToColOpDescriptor *)self->_imToColDesc paddingBottom];
  NSUInteger v35 = [(MPSGraphImToColOpDescriptor *)self->_imToColDesc paddingLeft];
  NSUInteger v36 = [(MPSGraphImToColOpDescriptor *)self->_imToColDesc paddingRight];
  v37 = (uint64_t *)operator new(0x20uLL);
  uint64_t *v37 = v33;
  v37[1] = v34;
  v37[2] = v35;
  v37[3] = v36;
  v38 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) == *(void *)a5) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  unsigned int v39 = [(MPSGraphImToColOpDescriptor *)self->_imToColDesc dataLayout];
  uint64_t v63 = v23;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v63);
  uint64_t v41 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.im_to_col", (const unsigned __int8 *)0xD, Context);
  if (!v42)
  {
    __int16 v68 = 1283;
    v66.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.im_to_col";
    uint64_t v67 = 13;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v65 = 259;
    llvm::operator+((uint64_t *)&v66, v64, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v71, v23, v41);
  mlir::mps::ImToColOp::build((mlir::Builder *)a3, (uint64_t)v71, *v38, v58, 2, v29, 2, v43, v32, 2, v37, 4, v39);
  v44 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v71);
  v45 = v44;
  if (!v44)
  {
    v50 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v51 = 662;
    v52 = "Casting.h";
    v53 = "dyn_cast";
    goto LABEL_45;
  }
  uint64_t v46 = *((void *)v44 + 6);
  v47 = *(void **)(v46 + 16);
  if (v47 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst.i64[0] = *(void *)(v46 + 8);
    AttrData = (void *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v55 == 13 && *AttrData == 0x745F6D692E73706DLL && *(void *)((char *)AttrData + 5) == 0x6C6F635F6F745F6DLL)
    {
      __int16 v68 = 1283;
      v66.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v66.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.im_to_col";
      uint64_t v67 = 13;
      v64[0] = (uint64_t)"' failed due to the operation not being registered";
      __int16 v65 = 259;
      llvm::operator+((uint64_t *)&v66, v64, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    goto LABEL_44;
  }
  if (v47 != &mlir::detail::TypeIDResolver<mlir::mps::ImToColOp,void>::id)
  {
LABEL_44:
    v50 = "result && \"builder didn't return the right type\"";
    int v51 = 497;
    v52 = "Builders.h";
    v53 = "create";
LABEL_45:
    __assert_rtn(v53, v52, v51, v50);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v71);
  if (!*((_DWORD *)v45 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v60 = (char *)v45 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v60);
  operator delete(v37);
  operator delete(v32);
  operator delete(v29);
  operator delete(v58);

  return DefiningOp;
}

- (void).cxx_destruct
{
}

@end