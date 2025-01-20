@interface MPSGraphInterleaveOp
- (MPSGraphInterleaveOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 interleaveFactor:(unint64_t)a6 name:(id)a7;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphInterleaveOp

- (MPSGraphInterleaveOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 interleaveFactor:(unint64_t)a6 name:(id)a7
{
  self->_interleaveFactor = a6;
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a7];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphInterleaveOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", __p);
  id v12 = v11;
  __int16 v53 = 260;
  v52[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v52);
  uint64_t v14 = mlir::FileLineColLoc::get(StringAttr, 0x627u, 0);
  if (!v14) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v12)
  {
    HIBYTE(v51) = 15;
    qmemcpy(&__dst, "mpsx.interleave", 15);
    v19 = &__dst.i8[15];
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
    uint64_t v20 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v20 = v16 | 7;
    }
    uint64_t v21 = v20 + 1;
    p_dst = (int8x16_t *)operator new(v20 + 1);
    __dst.i64[1] = v17;
    unint64_t v51 = v21 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v51) = v16;
    p_dst = &__dst;
    if (!v16) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  v19 = &p_dst->i8[v17];
LABEL_13:
  __int8 *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v47);
  v22 = (std::string *)v47.__r_.__value_.__r.__words[0];
  if ((v47.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v22 = &v47;
  }
  char v23 = 1;
  HIBYTE(v53) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v52[0] = v22;
    char v23 = 3;
  }
  LOBYTE(v53) = v23;
  uint64_t v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v52);
  uint64_t v25 = mlir::NameLoc::get(v24, v14);
  if (!v25) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v47.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v51) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v51) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v43 < 0) {
    operator delete(__p[0]);
  }
  v26 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) == *(void *)a5) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v44 = v25;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v44);
  uint64_t v28 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mpsx.interleave", (const unsigned __int8 *)0xF, Context);
  if (!v29)
  {
    __int16 v49 = 1283;
    v47.__r_.__value_.__r.__words[2] = (std::string::size_type)"mpsx.interleave";
    uint64_t v48 = 15;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v46 = 259;
    llvm::operator+((uint64_t *)&v47, v45, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v52, v25, v28);
  mlir::mpsx::InterleaveOp::build((mlir::Builder *)a3, (uint64_t)v52, *v26, self->_interleaveFactor);
  v30 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v52);
  v31 = v30;
  if (!v30)
  {
    v35 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v36 = 662;
    v37 = "Casting.h";
    v38 = "dyn_cast";
    goto LABEL_43;
  }
  uint64_t v32 = *((void *)v30 + 6);
  v33 = *(void **)(v32 + 16);
  if (v33 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst.i64[0] = *(void *)(v32 + 8);
    AttrData = (void *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v40 == 15 && *AttrData == 0x746E692E7873706DLL && *(void *)((char *)AttrData + 7) == 0x657661656C726574)
    {
      __int16 v49 = 1283;
      v47.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v47.__r_.__value_.__r.__words[2] = (std::string::size_type)"mpsx.interleave";
      uint64_t v48 = 15;
      v45[0] = (uint64_t)"' failed due to the operation not being registered";
      __int16 v46 = 259;
      llvm::operator+((uint64_t *)&v47, v45, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    goto LABEL_42;
  }
  if (v33 != &mlir::detail::TypeIDResolver<mlir::mpsx::InterleaveOp,void>::id)
  {
LABEL_42:
    v35 = "result && \"builder didn't return the right type\"";
    int v36 = 497;
    v37 = "Builders.h";
    v38 = "create";
LABEL_43:
    __assert_rtn(v38, v37, v36, v35);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v52);

  return v31;
}

@end