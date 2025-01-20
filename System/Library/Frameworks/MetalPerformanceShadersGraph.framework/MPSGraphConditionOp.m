@interface MPSGraphConditionOp
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphConditionOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  mpsFileLoc("-[MPSGraphConditionOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphControlFlowOps.mm", __p);
  id v11 = v10;
  __int16 v47 = 260;
  v46[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v46);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x95u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    HIBYTE(v49) = 13;
    qmemcpy(&__dst, "scf.condition", 13);
    v18 = &__dst.i8[13];
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
    unint64_t v49 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v49) = v15;
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
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v43);
  v21 = (std::string *)v43.__r_.__value_.__r.__words[0];
  if ((v43.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v21 = &v43;
  }
  char v22 = 1;
  HIBYTE(v47) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v46[0] = v21;
    char v22 = 3;
  }
  LOBYTE(v47) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v46);
  uint64_t v24 = mlir::NameLoc::get(v23, v13);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v43.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v49) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v49) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v39 < 0) {
    operator delete(__p[0]);
  }
  if (*((void *)a5 + 1) == *(void *)a5) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  v25 = mlir::OpBuilder::create<mlir::tensor::ExtractOp,mlir::Value &>((mlir::OpBuilder *)a3, v24, *(void *)a5);
  if (!*((_DWORD *)v25 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v26 = *(void *)a5;
  uint64_t v27 = *((void *)a5 + 1);
  uint64_t v40 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v40);
  uint64_t v29 = mlir::RegisteredOperationName::lookup((int8x16_t *)"scf.condition", (const unsigned __int8 *)0xD, Context);
  if (!v30)
  {
    __int16 v45 = 1283;
    v43.__r_.__value_.__r.__words[2] = (std::string::size_type)"scf.condition";
    uint64_t v44 = 13;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v42 = 259;
    llvm::operator+((uint64_t *)&v43, (uint64_t *)&v41, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v46, v24, v29);
  mlir::ValueRange::ValueRange((unint64_t *)&__dst, v26 + 8, ((v27 - v26) >> 3) - 1);
  mlir::pdl_interp::ReplaceOp::build((uint64_t)a3, (uint64_t)v46, (uint64_t)v25 - 16, __dst.i64[0], __dst.i64[1]);
  v31 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v46);
  if (!v31)
  {
    v34 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v35 = 662;
    v36 = "Casting.h";
    v37 = "dyn_cast";
    goto LABEL_36;
  }
  v32 = (void *)llvm::DefaultDoCastIfPossible<mlir::scf::ConditionOp,mlir::Operation *,llvm::CastInfo<mlir::scf::ConditionOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v31);
  if (!v32)
  {
    v34 = "result && \"builder didn't return the right type\"";
    int v35 = 497;
    v36 = "Builders.h";
    v37 = "create";
LABEL_36:
    __assert_rtn(v37, v36, v35, v34);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v46);

  return v32;
}

@end