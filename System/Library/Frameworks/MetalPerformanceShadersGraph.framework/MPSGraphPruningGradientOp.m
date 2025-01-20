@interface MPSGraphPruningGradientOp
- (MPSGraphPruningGradientOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 shape:(id)a6 descriptor:(id)a7 name:(id)a8;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphPruningGradientOp

- (MPSGraphPruningGradientOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 shape:(id)a6 descriptor:(id)a7 name:(id)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a8;
  v16 = (MPSGraphPruningDescriptor *)[(MPSGraphPruningDescriptor *)self->_pruningDesc copy];
  pruningDesc = self->_pruningDesc;
  self->_pruningDesc = v16;

  objc_storeStrong((id *)&self->_shape, a6);
  v18 = [MPSGraphPruningGradientOp alloc];
  v19 = [(MPSGraphOperation *)v18 initWithGraph:v12 inputTensors:v13 controlDependencies:MEMORY[0x1E4F1CBF0] name:v15];

  return v19;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v52 = a7;
  mpsFileLoc("-[MPSGraphPruningGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphPruningOps.mm", __p);
  id v11 = v52;
  __int16 v69 = 260;
  v68[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v68);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x52u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    __dst[23] = 18;
    strcpy(__dst, "mps.prune_gradient");
    goto LABEL_13;
  }
  id v14 = (const char *)objc_msgSend(v11, "UTF8String", v52);
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
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &v59);
  v20 = (std::string *)v59.__r_.__value_.__r.__words[0];
  if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v20 = &v59;
  }
  char v21 = 1;
  HIBYTE(v69) = 1;
  if (v20->__r_.__value_.__s.__data_[0])
  {
    v68[0] = v20;
    char v21 = 3;
  }
  LOBYTE(v69) = v21;
  uint64_t v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v68);
  uint64_t v23 = mlir::NameLoc::get(v22, v13);
  if (!v23) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v59.__r_.__value_.__l.__data_);
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

  if (v55 < 0) {
    operator delete(__p[0]);
  }
  v24 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 8uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  unsigned int v25 = [(MPSGraphPruningDescriptor *)self->_pruningDesc pruningMetric];
  unsigned int v26 = [(MPSGraphPruningDescriptor *)self->_pruningDesc pruningStructure];
  [(MPSGraphPruningDescriptor *)self->_pruningDesc sparsity];
  v28 = llvm::detail::IEEEFloat::IEEEFloat((llvm::detail::IEEEFloat *)v68, v27);
  v29 = llvm::APFloatBase::IEEEsingle(v28);
  llvm::APFloat::Storage::Storage(&v63, v68, v29);
  llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)v68);
  uint64_t v56 = v23;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v56);
  uint64_t v31 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.prune_gradient", (const unsigned __int8 *)0x12, Context);
  if (!v32)
  {
    __int16 v61 = 1283;
    v59.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.prune_gradient";
    uint64_t v60 = 18;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v58 = 259;
    llvm::operator+((uint64_t *)&v59, v57, (uint64_t)__dst);
    llvm::report_fatal_error((llvm::Twine *)__dst, 1);
  }
  mlir::OperationState::OperationState(v68, v23, v31);
  uint64_t v34 = *v24;
  uint64_t v33 = v24[1];
  v35 = v63;
  v37 = llvm::APFloatBase::PPCDoubleDouble(v36);
  if (v37 == v35) {
    llvm::detail::DoubleAPFloat::DoubleAPFloat(&v66, &v63);
  }
  else {
    llvm::detail::IEEEFloat::IEEEFloat((uint64_t)&v66, (uint64_t)&v63);
  }
  mlir::mps::PruningGradientOp::build((mlir::Float32Type **)a3, (uint64_t)v68, v34, v33, v25, v26, (uint64_t)v65);
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
    goto LABEL_57;
  }
  uint64_t v40 = *((void *)v38 + 6);
  v41 = *(void **)(v40 + 16);
  if (v41 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    *(void *)__dst = *(void *)(v40 + 8);
    uint64_t AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)__dst);
    if (v49 == 18)
    {
      BOOL v50 = *(void *)AttrData == 0x6E7572702E73706DLL && *(void *)(AttrData + 8) == 0x6569646172675F65;
      if (v50 && *(_WORD *)(AttrData + 16) == 29806)
      {
        __int16 v61 = 1283;
        v59.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
        v59.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.prune_gradient";
        uint64_t v60 = 18;
        v57[0] = (uint64_t)"' failed due to the operation not being registered";
        __int16 v58 = 259;
        llvm::operator+((uint64_t *)&v59, v57, (uint64_t)__dst);
        llvm::report_fatal_error((llvm::Twine *)__dst, 1);
      }
    }
    goto LABEL_56;
  }
  if (v41 != &mlir::detail::TypeIDResolver<mlir::mps::PruningGradientOp,void>::id)
  {
LABEL_56:
    v44 = "result && \"builder didn't return the right type\"";
    int v45 = 497;
    v46 = "Builders.h";
    v47 = "create";
LABEL_57:
    __assert_rtn(v47, v46, v45, v44);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v68);
  if (!*((_DWORD *)v39 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v53 = (char *)v39 - 16;
  if (v37 == v63) {
    std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)&v64);
  }
  else {
    llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v63);
  }
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v53);

  return DefiningOp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);

  objc_storeStrong((id *)&self->_pruningDesc, 0);
}

@end