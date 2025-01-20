@interface MPSGraphListPopBackOp
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphListPopBackOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  mpsFileLoc("-[MPSGraphListPopBackOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphListOps.mm", __p);
  id v11 = v10;
  __int16 v51 = 260;
  v50[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v50);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x70u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    __dst[23] = 18;
    strcpy(__dst, "mpsx.list_pop_back");
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
    uint64_t v18 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17) {
      uint64_t v18 = v15 | 7;
    }
    uint64_t v19 = v18 + 1;
    v17 = operator new(v18 + 1);
    *(void *)&__dst[8] = v16;
    *(void *)&__dst[16] = v19 | 0x8000000000000000;
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
  v17[v16] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &v46);
  v20 = (std::string *)v46.__r_.__value_.__r.__words[0];
  if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v20 = &v46;
  }
  char v21 = 1;
  HIBYTE(v51) = 1;
  if (v20->__r_.__value_.__s.__data_[0])
  {
    v50[0] = v20;
    char v21 = 3;
  }
  LOBYTE(v51) = v21;
  uint64_t v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v50);
  uint64_t v23 = mlir::NameLoc::get(v22, v13);
  if (!v23) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v46.__r_.__value_.__l.__data_);
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

  if (v42 < 0) {
    operator delete(__p[0]);
  }
  v24 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) == *(void *)a5) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v43 = v23;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v43);
  uint64_t v26 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mpsx.list_pop_back", (const unsigned __int8 *)0x12, Context);
  if (!v27)
  {
    __int16 v48 = 1283;
    v46.__r_.__value_.__r.__words[2] = (std::string::size_type)"mpsx.list_pop_back";
    uint64_t v47 = 18;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v45 = 259;
    llvm::operator+((uint64_t *)&v46, v44, (uint64_t)__dst);
    llvm::report_fatal_error((llvm::Twine *)__dst, 1);
  }
  mlir::OperationState::OperationState(v50, v23, v26);
  mlir::mpsx::ListPopBackOp::build((uint64_t)a3, (uint64_t)v50, *v24);
  v28 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v50);
  v29 = v28;
  if (!v28)
  {
    v33 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v34 = 662;
    v35 = "Casting.h";
    v36 = "dyn_cast";
    goto LABEL_46;
  }
  uint64_t v30 = *((void *)v28 + 6);
  v31 = *(void **)(v30 + 16);
  if (v31 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    *(void *)__dst = *(void *)(v30 + 8);
    uint64_t AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)__dst);
    if (v38 == 18
      && *(void *)AttrData == 0x73696C2E7873706DLL
      && *(void *)(AttrData + 8) == 0x61625F706F705F74
      && *(_WORD *)(AttrData + 16) == 27491)
    {
      __int16 v48 = 1283;
      v46.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v46.__r_.__value_.__r.__words[2] = (std::string::size_type)"mpsx.list_pop_back";
      uint64_t v47 = 18;
      v44[0] = (uint64_t)"' failed due to the operation not being registered";
      __int16 v45 = 259;
      llvm::operator+((uint64_t *)&v46, v44, (uint64_t)__dst);
      llvm::report_fatal_error((llvm::Twine *)__dst, 1);
    }
    goto LABEL_45;
  }
  if (v31 != &mlir::detail::TypeIDResolver<mlir::mpsx::ListPopBackOp,void>::id)
  {
LABEL_45:
    v33 = "result && \"builder didn't return the right type\"";
    int v34 = 497;
    v35 = "Builders.h";
    v36 = "create";
LABEL_46:
    __assert_rtn(v36, v35, v34, v33);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v50);

  return v29;
}

@end