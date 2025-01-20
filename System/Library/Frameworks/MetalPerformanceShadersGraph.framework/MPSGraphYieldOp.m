@interface MPSGraphYieldOp
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphYieldOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  mpsFileLoc("-[MPSGraphYieldOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphControlFlowOps.mm", __p);
  id v11 = v10;
  __int16 v44 = 260;
  v43[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v43);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0xB3u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    HIBYTE(v46) = 9;
    __dst.i8[8] = 100;
    __dst.i64[0] = *(void *)"scf.yield";
    v18 = &__dst.i8[9];
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
    unint64_t v46 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v46) = v15;
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
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v40);
  v21 = (std::string *)v40.__r_.__value_.__r.__words[0];
  if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v21 = &v40;
  }
  char v22 = 1;
  HIBYTE(v44) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v43[0] = v21;
    char v22 = 3;
  }
  LOBYTE(v44) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v43);
  uint64_t v24 = mlir::NameLoc::get(v23, v13);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v40.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v46) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v46) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v36 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v37 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v37);
  uint64_t v26 = mlir::RegisteredOperationName::lookup((int8x16_t *)"scf.yield", (const unsigned __int8 *)9, Context);
  if (!v27)
  {
    __int16 v42 = 1283;
    v40.__r_.__value_.__r.__words[2] = (std::string::size_type)"scf.yield";
    uint64_t v41 = 9;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v39 = 259;
    llvm::operator+((uint64_t *)&v40, (uint64_t *)&v38, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v43, v24, v26);
  mlir::ValueRange::ValueRange((unint64_t *)&__dst, *(void *)a5, (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3);
  mlir::anec::RegionReturn::build((uint64_t)a3, (uint64_t)v43, __dst.i64[0], __dst.i64[1]);
  v28 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v43);
  if (!v28)
  {
    v31 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v32 = 662;
    v33 = "Casting.h";
    v34 = "dyn_cast";
    goto LABEL_33;
  }
  v29 = (void *)llvm::DefaultDoCastIfPossible<mlir::scf::YieldOp,mlir::Operation *,llvm::CastInfo<mlir::scf::YieldOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v28);
  if (!v29)
  {
    v31 = "result && \"builder didn't return the right type\"";
    int v32 = 497;
    v33 = "Builders.h";
    v34 = "create";
LABEL_33:
    __assert_rtn(v34, v33, v32, v31);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v43);

  return v29;
}

@end