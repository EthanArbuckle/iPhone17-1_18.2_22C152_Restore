@interface MPSGraphSqueezeOp
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphSqueezeOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  mpsFileLoc("-[MPSGraphSqueezeOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", __p);
  id v11 = v10;
  __int16 v51 = 260;
  v50[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v50);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0xC61u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    HIBYTE(v49) = 11;
    *(__int32 *)((char *)&__dst.i32[1] + 3) = 1702520165;
    __dst.i64[0] = *(void *)"mps.squeeze";
    v18 = &__dst.i8[11];
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
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v45);
  v21 = (std::string *)v45.__r_.__value_.__r.__words[0];
  if ((v45.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v21 = &v45;
  }
  char v22 = 1;
  HIBYTE(v51) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v50[0] = v21;
    char v22 = 3;
  }
  LOBYTE(v51) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v50);
  uint64_t v24 = mlir::NameLoc::get(v23, v13);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v45.__r_.__value_.__l.__data_);
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

  if (v41 < 0) {
    operator delete(__p[0]);
  }
  v25 = *(uint64_t **)a5;
  unint64_t v26 = *((void *)a5 + 1) - *(void *)a5;
  if (!v26) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  if (v26 < 9) {
    uint64_t v27 = 0;
  }
  else {
    uint64_t v27 = v25[1];
  }
  uint64_t v42 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v42);
  uint64_t v29 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.squeeze", (const unsigned __int8 *)0xB, Context);
  if (!v30)
  {
    __int16 v47 = 1283;
    v45.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.squeeze";
    uint64_t v46 = 11;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v44 = 259;
    llvm::operator+((uint64_t *)&v45, (uint64_t *)&v43, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v50, v24, v29);
  mlir::mps::SqueezeOp::build((uint64_t)a3, (uint64_t)v50, *v25, v27);
  v31 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v50);
  if (!v31)
  {
    v35 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v36 = 662;
    v37 = "Casting.h";
    v38 = "dyn_cast";
    goto LABEL_38;
  }
  uint64_t v32 = llvm::DefaultDoCastIfPossible<mlir::mps::SqueezeOp,mlir::Operation *,llvm::CastInfo<mlir::mps::SqueezeOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v31);
  if (!v32)
  {
    v35 = "result && \"builder didn't return the right type\"";
    int v36 = 497;
    v37 = "Builders.h";
    v38 = "create";
LABEL_38:
    __assert_rtn(v38, v37, v36, v35);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v50);
  if (!*(_DWORD *)(v32 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v39 = v32 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v39);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  return 0;
}

@end