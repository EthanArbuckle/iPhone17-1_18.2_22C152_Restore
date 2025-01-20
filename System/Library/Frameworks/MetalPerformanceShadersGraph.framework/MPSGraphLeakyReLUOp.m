@interface MPSGraphLeakyReLUOp
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphLeakyReLUOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  mpsFileLoc("-[MPSGraphLeakyReLUOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphActivationOps.mm", __p);
  id v11 = v10;
  __int16 v48 = 260;
  v47[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v47);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x44u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    HIBYTE(v46) = 14;
    strcpy(__dst.i8, "mps.leaky_relu");
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
    p_dst = (int8x16_t *)operator new(v18 + 1);
    __dst.i64[1] = v16;
    unint64_t v46 = v19 | 0x8000000000000000;
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
  p_dst->i8[v16] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v42);
  v20 = (std::string *)v42.__r_.__value_.__r.__words[0];
  if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v20 = &v42;
  }
  char v21 = 1;
  HIBYTE(v48) = 1;
  if (v20->__r_.__value_.__s.__data_[0])
  {
    v47[0] = v20;
    char v21 = 3;
  }
  LOBYTE(v48) = v21;
  uint64_t v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v47);
  uint64_t v23 = mlir::NameLoc::get(v22, v13);
  if (!v23) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v42.__r_.__value_.__l.__data_);
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

  if (v38 < 0) {
    operator delete(__p[0]);
  }
  v24 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 8uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v39 = v23;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v39);
  uint64_t v26 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.leaky_relu", (const unsigned __int8 *)0xE, Context);
  if (!v27)
  {
    __int16 v44 = 1283;
    v42.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.leaky_relu";
    uint64_t v43 = 14;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v41 = 259;
    llvm::operator+((uint64_t *)&v42, (uint64_t *)&v40, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v47, v23, v26);
  mlir::mps::ATan2Op::build((mlir::Float32Type **)a3, (uint64_t)v47, *v24, v24[1]);
  v28 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v47);
  if (!v28)
  {
    v32 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v33 = 662;
    v34 = "Casting.h";
    v35 = "dyn_cast";
    goto LABEL_35;
  }
  uint64_t v29 = llvm::DefaultDoCastIfPossible<mlir::mps::LeakyReluOp,mlir::Operation *,llvm::CastInfo<mlir::mps::LeakyReluOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v28);
  if (!v29)
  {
    v32 = "result && \"builder didn't return the right type\"";
    int v33 = 497;
    v34 = "Builders.h";
    v35 = "create";
LABEL_35:
    __assert_rtn(v35, v34, v33, v32);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v47);
  if (!*(_DWORD *)(v29 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v36 = v29 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v36);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  uint64_t v13 = [(NSArray *)self->super._inputTensors objectAtIndexedSubscript:1];
  v14 = [WeakRetained leakyReLUGradientWithIncomingGradient:v10 sourceTensor:v9 alphaTensor:v13 name:v11];

  return v14;
}

@end