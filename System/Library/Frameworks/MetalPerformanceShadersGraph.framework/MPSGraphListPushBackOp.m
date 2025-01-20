@interface MPSGraphListPushBackOp
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphListPushBackOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  mpsFileLoc("-[MPSGraphListPushBackOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphListOps.mm", __p);
  id v11 = v10;
  __int16 v54 = 260;
  v53[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v53);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x5Bu, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    __dst[23] = 19;
    qmemcpy(__dst, "mpsx.list_push_back", 19);
    v18 = &__dst[19];
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
    v17 = operator new(v19 + 1);
    *(void *)&__dst[8] = v16;
    *(void *)&__dst[16] = v20 | 0x8000000000000000;
    *(void *)__dst = v17;
  }
  else
  {
    __dst[23] = v15;
    v17 = __dst;
    if (!v15) {
      goto LABEL_12;
    }
  }
  memmove(v17, v14, v16);
LABEL_12:
  v18 = &v17[v16];
LABEL_13:
  unsigned char *v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &v49);
  v21 = (std::string *)v49.__r_.__value_.__r.__words[0];
  if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v21 = &v49;
  }
  char v22 = 1;
  HIBYTE(v54) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v53[0] = v21;
    char v22 = 3;
  }
  LOBYTE(v54) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v53);
  uint64_t v24 = mlir::NameLoc::get(v23, v13);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v49.__r_.__value_.__l.__data_);
    if ((__dst[23] & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((__dst[23] & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(*(void **)__dst);
LABEL_20:

  if (v45 < 0) {
    operator delete(__p[0]);
  }
  v25 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 8uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v46 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v46);
  uint64_t v27 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mpsx.list_push_back", (const unsigned __int8 *)0x13, Context);
  if (!v28)
  {
    __int16 v51 = 1283;
    v49.__r_.__value_.__r.__words[2] = (std::string::size_type)"mpsx.list_push_back";
    uint64_t v50 = 19;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v48 = 259;
    llvm::operator+((uint64_t *)&v49, v47, (uint64_t)__dst);
    llvm::report_fatal_error((llvm::Twine *)__dst, 1);
  }
  mlir::OperationState::OperationState(v53, v24, v27);
  mlir::mpsx::ListPushBackOp::build((uint64_t *)a3, (uint64_t)v53, *v25, v25[1]);
  v29 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v53);
  v30 = v29;
  if (!v29)
  {
    v35 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v36 = 662;
    v37 = "Casting.h";
    v38 = "dyn_cast";
    goto LABEL_48;
  }
  uint64_t v31 = *((void *)v29 + 6);
  v32 = *(void **)(v31 + 16);
  if (v32 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    *(void *)__dst = *(void *)(v31 + 8);
    AttrData = (void *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)__dst);
    if (v40 == 19)
    {
      BOOL v41 = *AttrData == 0x73696C2E7873706DLL && AttrData[1] == 0x625F687375705F74;
      if (v41 && *(void *)((char *)AttrData + 11) == 0x6B6361625F687375)
      {
        __int16 v51 = 1283;
        v49.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
        v49.__r_.__value_.__r.__words[2] = (std::string::size_type)"mpsx.list_push_back";
        uint64_t v50 = 19;
        v47[0] = (uint64_t)"' failed due to the operation not being registered";
        __int16 v48 = 259;
        llvm::operator+((uint64_t *)&v49, v47, (uint64_t)__dst);
        llvm::report_fatal_error((llvm::Twine *)__dst, 1);
      }
    }
    goto LABEL_47;
  }
  if (v32 != &mlir::detail::TypeIDResolver<mlir::mpsx::ListPushBackOp,void>::id)
  {
LABEL_47:
    v35 = "result && \"builder didn't return the right type\"";
    int v36 = 497;
    v37 = "Builders.h";
    v38 = "create";
LABEL_48:
    __assert_rtn(v38, v37, v36, v35);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v53);
  if (!*((_DWORD *)v30 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v43 = (char *)v30 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v43);

  return DefiningOp;
}

@end