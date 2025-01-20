@interface MPSGraphPruningOp
- (MPSGraphPruningOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 shape:(id)a6 descriptor:(id)a7 name:(id)a8;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphPruningOp

- (MPSGraphPruningOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 shape:(id)a6 descriptor:(id)a7 name:(id)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a8;
  v16 = (MPSGraphPruningDescriptor *)[(MPSGraphPruningDescriptor *)self->_pruningDesc copy];
  pruningDesc = self->_pruningDesc;
  self->_pruningDesc = v16;

  objc_storeStrong((id *)&self->_shape, a6);
  v18 = [MPSGraphPruningOp alloc];
  v19 = [(MPSGraphOperation *)v18 initWithGraph:v12 inputTensors:v13 controlDependencies:MEMORY[0x1E4F1CBF0] name:v15];

  return v19;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  v11 = [WeakRetained prunedGradientTensorWithDescriptor:self->_pruningDesc inputTensor:v8 gradientTensor:v9 shape:self->_shape name:0];

  return v11;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v51 = a7;
  mpsFileLoc("-[MPSGraphPruningOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphPruningOps.mm", __p);
  id v11 = v51;
  __int16 v69 = 260;
  v68[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v68);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x8Fu, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    HIBYTE(v62) = 9;
    __dst.i8[8] = 101;
    __dst.i64[0] = *(void *)"mps.prune";
    v18 = &__dst.i8[9];
    goto LABEL_13;
  }
  id v14 = (const char *)[v11 UTF8String];
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
    unint64_t v62 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v62) = v15;
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
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v58);
  v21 = (std::string *)v58.__r_.__value_.__r.__words[0];
  if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v21 = &v58;
  }
  char v22 = 1;
  HIBYTE(v69) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v68[0] = v21;
    char v22 = 3;
  }
  LOBYTE(v69) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v68);
  uint64_t v24 = mlir::NameLoc::get(v23, v13);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v58.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v62) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v62) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v54 < 0) {
    operator delete(__p[0]);
  }
  v25 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) == *(void *)a5) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  unsigned int v26 = [(MPSGraphPruningDescriptor *)self->_pruningDesc pruningMetric];
  unsigned int v27 = [(MPSGraphPruningDescriptor *)self->_pruningDesc pruningStructure];
  [(MPSGraphPruningDescriptor *)self->_pruningDesc sparsity];
  v29 = llvm::detail::IEEEFloat::IEEEFloat((llvm::detail::IEEEFloat *)v68, v28);
  v30 = llvm::APFloatBase::IEEEsingle(v29);
  llvm::APFloat::Storage::Storage(&v63, v68, v30);
  llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)v68);
  uint64_t v55 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v55);
  uint64_t v32 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.prune", (const unsigned __int8 *)9, Context);
  if (!v33)
  {
    __int16 v60 = 1283;
    v58.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.prune";
    uint64_t v59 = 9;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v57 = 259;
    llvm::operator+((uint64_t *)&v58, v56, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v68, v24, v32);
  uint64_t v34 = *v25;
  v35 = v63;
  v37 = llvm::APFloatBase::PPCDoubleDouble(v36);
  if (v37 == v35) {
    llvm::detail::DoubleAPFloat::DoubleAPFloat(&v66, &v63);
  }
  else {
    llvm::detail::IEEEFloat::IEEEFloat((uint64_t)&v66, (uint64_t)&v63);
  }
  mlir::mps::PruningOp::build((mlir::Float32Type **)a3, (uint64_t)v68, v34, v26, v27, (uint64_t)v65);
  if (v37 == v66) {
    std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)&v67);
  }
  else {
    llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v66);
  }
  v38 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v68);
  v39 = v38;
  if (!v38)
  {
    v44 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v45 = 662;
    v46 = "Casting.h";
    v47 = "dyn_cast";
    goto LABEL_54;
  }
  uint64_t v40 = *((void *)v38 + 6);
  v41 = *(void **)(v40 + 16);
  if (v41 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst.i64[0] = *(void *)(v40 + 8);
    uint64_t AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v49 == 9 && *(void *)AttrData == 0x6E7572702E73706DLL && *(unsigned char *)(AttrData + 8) == 101)
    {
      __int16 v60 = 1283;
      v58.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v58.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.prune";
      uint64_t v59 = 9;
      v56[0] = (uint64_t)"' failed due to the operation not being registered";
      __int16 v57 = 259;
      llvm::operator+((uint64_t *)&v58, v56, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    goto LABEL_53;
  }
  if (v41 != &mlir::detail::TypeIDResolver<mlir::mps::PruningOp,void>::id)
  {
LABEL_53:
    v44 = "result && \"builder didn't return the right type\"";
    int v45 = 497;
    v46 = "Builders.h";
    v47 = "create";
LABEL_54:
    __assert_rtn(v47, v46, v45, v44);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v68);
  if (!*((_DWORD *)v39 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v52 = (char *)v39 - 16;
  if (v37 == v63) {
    std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)&v64);
  }
  else {
    llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v63);
  }
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v52);

  return DefiningOp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);

  objc_storeStrong((id *)&self->_pruningDesc, 0);
}

@end