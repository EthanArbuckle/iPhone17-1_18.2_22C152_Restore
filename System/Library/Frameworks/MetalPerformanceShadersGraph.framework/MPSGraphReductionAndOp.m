@interface MPSGraphReductionAndOp
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphReductionAndOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  mpsFileLoc("-[MPSGraphReductionAndOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphReductionOps.mm", v46);
  id v11 = v10;
  __int16 v57 = 260;
  v56[0] = v46;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v56);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0xE5u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    HIBYTE(v55) = 17;
    LOBYTE(v55) = 100;
    int8x16_t __dst = *(int8x16_t *)"mps.reduction_and";
    v18 = (char *)&v55 + 1;
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
    unint64_t v55 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v55) = v15;
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
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  char v22 = 1;
  HIBYTE(v57) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v56[0] = p_p;
    char v22 = 3;
  }
  LOBYTE(v57) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v56);
  uint64_t v24 = mlir::NameLoc::get(v23, v13);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v55) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v55) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v47 < 0)
  {
    operator delete(v46[0]);
    v26 = *(uint64_t **)a5;
    v25 = (uint64_t *)*((void *)a5 + 1);
    if ((unint64_t)v25 - *(void *)a5 >= 9) {
      goto LABEL_22;
    }
  }
  else
  {
    v26 = *(uint64_t **)a5;
    v25 = (uint64_t *)*((void *)a5 + 1);
    if ((unint64_t)v25 - *(void *)a5 >= 9)
    {
LABEL_22:
      uint64_t v27 = v26[1];
      goto LABEL_27;
    }
  }
  uint64_t v27 = 0;
LABEL_27:
  if (v25 == v26) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v48 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v48);
  uint64_t v29 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.reduction_and", (const unsigned __int8 *)0x11, Context);
  if (!v30)
  {
    __int16 v53 = 1283;
    __p.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.reduction_and";
    uint64_t v52 = 17;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v50 = 259;
    llvm::operator+((uint64_t *)&__p, v49, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v56, v24, v29);
  mlir::mps::ReductionAndOp::build((mlir::UnitAttr **)a3, (uint64_t)v56, *v26, v27, 1);
  v31 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v56);
  v32 = v31;
  if (!v31)
  {
    v37 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v38 = 662;
    v39 = "Casting.h";
    v40 = "dyn_cast";
    goto LABEL_51;
  }
  uint64_t v33 = *((void *)v31 + 6);
  v34 = *(void **)(v33 + 16);
  if (v34 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst.i64[0] = *(void *)(v33 + 8);
    uint64_t AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v42 == 17)
    {
      BOOL v43 = *(void *)AttrData == 0x756465722E73706DLL && *(void *)(AttrData + 8) == 0x6E615F6E6F697463;
      if (v43 && *(unsigned char *)(AttrData + 16) == 100)
      {
        __int16 v53 = 1283;
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
        __p.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.reduction_and";
        uint64_t v52 = 17;
        v49[0] = (uint64_t)"' failed due to the operation not being registered";
        __int16 v50 = 259;
        llvm::operator+((uint64_t *)&__p, v49, (uint64_t)&__dst);
        llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
      }
    }
    goto LABEL_50;
  }
  if (v34 != &mlir::detail::TypeIDResolver<mlir::mps::ReductionAndOp,void>::id)
  {
LABEL_50:
    v37 = "result && \"builder didn't return the right type\"";
    int v38 = 497;
    v39 = "Builders.h";
    v40 = "create";
LABEL_51:
    __assert_rtn(v40, v39, v38, v37);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v56);
  if (!*((_DWORD *)v32 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v45 = (char *)v32 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v45);

  return DefiningOp;
}

@end