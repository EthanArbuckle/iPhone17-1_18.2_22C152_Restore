@interface MPSGraphTopKOp
- (MPSGraphTopKOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 smallest:(BOOL)a6 name:(id)a7;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphTopKOp

- (MPSGraphTopKOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 smallest:(BOOL)a6 name:(id)a7
{
  self->super._smallest = a6;
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a7];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphTopKOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTopKOps.mm", __p);
  id v12 = v11;
  __int16 v49 = 260;
  v48[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v48);
  uint64_t v14 = mlir::FileLineColLoc::get(StringAttr, 0x3Bu, 0);
  if (!v14) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v12)
  {
    HIBYTE(v47) = 9;
    __dst.i8[8] = 107;
    __dst.i64[0] = *(void *)"mps.top_k";
    v19 = &__dst.i8[9];
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
    unint64_t v47 = v21 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v47) = v16;
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
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v43);
  v22 = (std::string *)v43.__r_.__value_.__r.__words[0];
  if ((v43.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v22 = &v43;
  }
  char v23 = 1;
  HIBYTE(v49) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v48[0] = v22;
    char v23 = 3;
  }
  LOBYTE(v49) = v23;
  uint64_t v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v48);
  uint64_t v25 = mlir::NameLoc::get(v24, v14);
  if (!v25) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v43.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v47) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v47) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v39 < 0) {
    operator delete(__p[0]);
  }
  v26 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 0x10uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  BOOL smallest = self->super._smallest;
  uint64_t v40 = v25;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v40);
  uint64_t v29 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.top_k", (const unsigned __int8 *)9, Context);
  if (!v30)
  {
    __int16 v45 = 1283;
    v43.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.top_k";
    uint64_t v44 = 9;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v42 = 259;
    llvm::operator+((uint64_t *)&v43, (uint64_t *)&v41, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v48, v25, v29);
  mlir::mps::TopKOp::build((mlir::UnitAttr **)a3, (uint64_t)v48, *v26, v26[1], v26[2], smallest);
  v31 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v48);
  if (!v31)
  {
    v34 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v35 = 662;
    v36 = "Casting.h";
    v37 = "dyn_cast";
    goto LABEL_34;
  }
  v32 = (void *)llvm::DefaultDoCastIfPossible<mlir::mps::TopKOp,mlir::Operation *,llvm::CastInfo<mlir::mps::TopKOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v31);
  if (!v32)
  {
    v34 = "result && \"builder didn't return the right type\"";
    int v35 = 497;
    v36 = "Builders.h";
    v37 = "create";
LABEL_34:
    __assert_rtn(v37, v36, v35, v34);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v48);

  return v32;
}

- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = v8;
  id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
  v13 = [v9 objectAtIndexedSubscript:0];
  uint64_t v14 = [(MPSGraphOperation *)self inputTensors];
  v15 = [v14 objectAtIndexedSubscript:0];
  size_t v16 = [(MPSGraphOperation *)self inputTensors];
  size_t v17 = [v16 objectAtIndexedSubscript:1];
  v18 = [WeakRetained topKWithGradientTensor:v13 source:v15 kTensor:v17 name:v10];

  [v11 addObject:v18];
  v19 = [MEMORY[0x1E4F1CA98] null];
  [v11 addObject:v19];

  return v11;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (a5)
  {
    v13 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
    v15 = [(MPSGraphOperation *)self inputTensors];
    size_t v16 = [v15 objectAtIndexedSubscript:1];
    v13 = [WeakRetained topKWithGradientTensor:v11 source:v10 kTensor:v16 name:v12];
  }

  return v13;
}

@end