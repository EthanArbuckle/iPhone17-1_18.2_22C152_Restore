@interface MPSGraphMakeListOp
- (MPSGraphMakeListOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 elementType:(id)a6 maxSize:(id)a7 name:(id)a8;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphMakeListOp

- (MPSGraphMakeListOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 elementType:(id)a6 maxSize:(id)a7 name:(id)a8
{
  id v23 = a6;
  v15 = (NSNumber *)a7;
  objc_storeStrong((id *)&self->_elementType, a6);
  id v16 = a8;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  maxSize = self->_maxSize;
  self->_maxSize = v15;

  v21 = [(MPSGraphOperation *)self initWithGraph:v19 inputTensors:v18 controlDependencies:v17 name:v16];
  return v21;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  uint64_t MLIRType = getMLIRType(*(mlir::MLIRContext **)a3, self->_elementType);
  uint64_t v12 = mlir::TypeAttr::get(MLIRType);
  if (self->_maxSize)
  {
    uint64_t v13 = mlir::IntegerType::get(*(void *)a3, 0x20u, 2u);
    uint64_t v14 = mlir::IntegerAttr::get(v13, [(NSNumber *)self->_maxSize unsignedLongValue]);
  }
  else
  {
    uint64_t v14 = 0;
  }
  mpsFileLoc("-[MPSGraphMakeListOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphListOps.mm", __p);
  id v15 = v10;
  __int16 v56 = 260;
  v55[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v55);
  uint64_t v17 = mlir::FileLineColLoc::get(StringAttr, 0x45u, 0);
  if (!v17) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v15)
  {
    HIBYTE(v54) = 14;
    strcpy(__dst.i8, "mpsx.make_list");
    goto LABEL_16;
  }
  id v18 = (const char *)[v15 UTF8String];
  size_t v19 = strlen(v18);
  if (v19 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v20 = v19;
  if (v19 >= 0x17)
  {
    uint64_t v22 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17) {
      uint64_t v22 = v19 | 7;
    }
    uint64_t v23 = v22 + 1;
    p_dst = (int8x16_t *)operator new(v22 + 1);
    __dst.i64[1] = v20;
    unint64_t v54 = v23 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v54) = v19;
    p_dst = &__dst;
    if (!v19) {
      goto LABEL_15;
    }
  }
  memmove(p_dst, v18, v20);
LABEL_15:
  p_dst->i8[v20] = 0;
LABEL_16:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v50);
  v24 = (std::string *)v50.__r_.__value_.__r.__words[0];
  if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v24 = &v50;
  }
  char v25 = 1;
  HIBYTE(v56) = 1;
  if (v24->__r_.__value_.__s.__data_[0])
  {
    v55[0] = v24;
    char v25 = 3;
  }
  LOBYTE(v56) = v25;
  uint64_t v26 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v55);
  uint64_t v27 = mlir::NameLoc::get(v26, v17);
  if (!v27) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v50.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v54) & 0x80000000) == 0) {
      goto LABEL_23;
    }
  }
  else if ((SHIBYTE(v54) & 0x80000000) == 0)
  {
    goto LABEL_23;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_23:

  if (v46 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v47 = v27;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v47);
  uint64_t v29 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mpsx.make_list", (const unsigned __int8 *)0xE, Context);
  if (!v30)
  {
    __int16 v52 = 1283;
    v50.__r_.__value_.__r.__words[2] = (std::string::size_type)"mpsx.make_list";
    uint64_t v51 = 14;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v49 = 259;
    llvm::operator+((uint64_t *)&v50, v48, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v55, v27, v29);
  mlir::mpsx::MakeListOp::build((mlir::UnknownLoc **)a3, (uint64_t)v55, v12, v14);
  v31 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v55);
  v32 = v31;
  if (!v31)
  {
    v37 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v38 = 662;
    v39 = "Casting.h";
    v40 = "dyn_cast";
    goto LABEL_46;
  }
  uint64_t v33 = *((void *)v31 + 6);
  v34 = *(void **)(v33 + 16);
  if (v34 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst.i64[0] = *(void *)(v33 + 8);
    AttrData = (void *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v42 == 14 && *AttrData == 0x6B616D2E7873706DLL && *(void *)((char *)AttrData + 6) == 0x7473696C5F656B61)
    {
      __int16 v52 = 1283;
      v50.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v50.__r_.__value_.__r.__words[2] = (std::string::size_type)"mpsx.make_list";
      uint64_t v51 = 14;
      v48[0] = (uint64_t)"' failed due to the operation not being registered";
      __int16 v49 = 259;
      llvm::operator+((uint64_t *)&v50, v48, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    goto LABEL_45;
  }
  if (v34 != &mlir::detail::TypeIDResolver<mlir::mpsx::MakeListOp,void>::id)
  {
LABEL_45:
    v37 = "result && \"builder didn't return the right type\"";
    int v38 = 497;
    v39 = "Builders.h";
    v40 = "create";
LABEL_46:
    __assert_rtn(v40, v39, v38, v37);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v55);
  if (!*((_DWORD *)v32 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v44 = (char *)v32 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v44);

  return DefiningOp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxSize, 0);

  objc_storeStrong((id *)&self->_elementType, 0);
}

@end