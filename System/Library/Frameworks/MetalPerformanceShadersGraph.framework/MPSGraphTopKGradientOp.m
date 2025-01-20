@interface MPSGraphTopKGradientOp
- (MPSGraphTopKGradientOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 smallest:(BOOL)a6 name:(id)a7;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphTopKGradientOp

- (MPSGraphTopKGradientOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 smallest:(BOOL)a6 name:(id)a7
{
  self->super._smallest = a6;
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a7];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphTopKGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTopKOps.mm", __p);
  id v12 = v11;
  __int16 v55 = 260;
  v54[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v54);
  uint64_t v14 = mlir::FileLineColLoc::get(StringAttr, 0x7Eu, 0);
  if (!v14) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v12)
  {
    HIBYTE(v53) = 14;
    strcpy(__dst.i8, "mps.top_k_grad");
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
    uint64_t v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v19 = v16 | 7;
    }
    uint64_t v20 = v19 + 1;
    p_dst = (int8x16_t *)operator new(v19 + 1);
    __dst.i64[1] = v17;
    unint64_t v53 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v53) = v16;
    p_dst = &__dst;
    if (!v16) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  p_dst->i8[v17] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v49);
  v21 = (std::string *)v49.__r_.__value_.__r.__words[0];
  if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v21 = &v49;
  }
  char v22 = 1;
  HIBYTE(v55) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v54[0] = v21;
    char v22 = 3;
  }
  LOBYTE(v55) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v54);
  uint64_t v24 = mlir::NameLoc::get(v23, v14);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v49.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v53) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v53) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v45 < 0) {
    operator delete(__p[0]);
  }
  v25 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 0x18uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  BOOL smallest = self->super._smallest;
  uint64_t v46 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v46);
  uint64_t v28 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.top_k_grad", (const unsigned __int8 *)0xE, Context);
  if (!v29)
  {
    __int16 v51 = 1283;
    v49.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.top_k_grad";
    uint64_t v50 = 14;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v48 = 259;
    llvm::operator+((uint64_t *)&v49, v47, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v54, v24, v28);
  mlir::mps::TopKGradientOp::build((mlir::UnitAttr **)a3, (uint64_t)v54, *v25, v25[1], v25[2], v25[3], smallest);
  v30 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v54);
  v31 = v30;
  if (!v30)
  {
    v36 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v37 = 662;
    v38 = "Casting.h";
    v39 = "dyn_cast";
    goto LABEL_45;
  }
  uint64_t v32 = *((void *)v30 + 6);
  v33 = *(void **)(v32 + 16);
  if (v33 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst.i64[0] = *(void *)(v32 + 8);
    AttrData = (void *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v41 == 14 && *AttrData == 0x5F706F742E73706DLL && *(void *)((char *)AttrData + 6) == 0x646172675F6B5F70)
    {
      __int16 v51 = 1283;
      v49.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v49.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.top_k_grad";
      uint64_t v50 = 14;
      v47[0] = (uint64_t)"' failed due to the operation not being registered";
      __int16 v48 = 259;
      llvm::operator+((uint64_t *)&v49, v47, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    goto LABEL_44;
  }
  if (v33 != &mlir::detail::TypeIDResolver<mlir::mps::TopKGradientOp,void>::id)
  {
LABEL_44:
    v36 = "result && \"builder didn't return the right type\"";
    int v37 = 497;
    v38 = "Builders.h";
    v39 = "create";
LABEL_45:
    __assert_rtn(v39, v38, v37, v36);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v54);
  if (!*((_DWORD *)v31 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v43 = (char *)v31 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v43);

  return DefiningOp;
}

@end