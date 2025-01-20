@interface MPSGraphGatherAlongAxisOp
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphGatherAlongAxisOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphGatherAlongAxisOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphGatherOps.mm", __p);
  id v12 = v11;
  __int16 v49 = 260;
  v48[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v48);
  uint64_t v14 = mlir::FileLineColLoc::get(StringAttr, 0xEAu, 0);
  if (!v14) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v12)
  {
    __dst[23] = 21;
    qmemcpy(__dst, "mps.gather_along_axis", 21);
    v19 = &__dst[21];
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
    v18 = operator new(v20 + 1);
    *(void *)&__dst[8] = v17;
    *(void *)&__dst[16] = v21 | 0x8000000000000000;
    *(void *)__dst = v18;
  }
  else
  {
    __dst[23] = v16;
    v18 = __dst;
    if (!v16) {
      goto LABEL_12;
    }
  }
  memmove(v18, v15, v17);
LABEL_12:
  v19 = &v18[v17];
LABEL_13:
  unsigned char *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &v44);
  v22 = (std::string *)v44.__r_.__value_.__r.__words[0];
  if ((v44.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v22 = &v44;
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
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v44.__r_.__value_.__l.__data_);
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

  if (v40 < 0) {
    operator delete(__p[0]);
  }
  v26 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 0x10uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v41 = v25;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v41);
  uint64_t v28 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.gather_along_axis", (const unsigned __int8 *)0x15, Context);
  if (!v29)
  {
    __int16 v46 = 1283;
    v44.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.gather_along_axis";
    uint64_t v45 = 21;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v43 = 259;
    llvm::operator+((uint64_t *)&v44, (uint64_t *)&v42, (uint64_t)__dst);
    llvm::report_fatal_error((llvm::Twine *)__dst, 1);
  }
  mlir::OperationState::OperationState(v48, v25, v28);
  mlir::mps::GatherAlongAxisOp::build((mlir::UnitAttr **)a3, (uint64_t)v48, *v26, v26[1], v26[2], self->_allowNegativeIndices);
  v30 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v48);
  if (!v30)
  {
    v34 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v35 = 662;
    v36 = "Casting.h";
    v37 = "dyn_cast";
    goto LABEL_35;
  }
  uint64_t v31 = llvm::DefaultDoCastIfPossible<mlir::mps::GatherAlongAxisOp,mlir::Operation *,llvm::CastInfo<mlir::mps::GatherAlongAxisOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v30);
  if (!v31)
  {
    v34 = "result && \"builder didn't return the right type\"";
    int v35 = 497;
    v36 = "Builders.h";
    v37 = "create";
LABEL_35:
    __assert_rtn(v37, v36, v35, v34);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v48);
  if (!*(_DWORD *)(v31 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v38 = v31 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v38);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [(MPSGraphOperation *)self inputTensors];
  id v13 = [v12 objectAtIndexedSubscript:0];
  if (v13 != v9)
  {
    uint64_t v14 = 0;
LABEL_5:

    goto LABEL_6;
  }
  v15 = [v9 shape];
  int v16 = isStaticShape(v15);

  if (v16)
  {
    id v12 = v10;
    size_t v17 = [(MPSGraphOperation *)self inputTensors];
    id v13 = [v17 objectAtIndexedSubscript:1];

    v18 = [(MPSGraphOperation *)self inputTensors];
    v26 = [v18 objectAtIndexedSubscript:2];

    id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
    uint64_t v20 = [v9 shape];
    uint64_t v21 = NSString;
    uint64_t v25 = (void *)v20;
    v22 = [(MPSGraphOperation *)self name];
    char v23 = [v21 stringWithFormat:@"%@/%@/scatterAlongAxis", v11, v22];
    uint64_t v14 = [WeakRetained scatterAlongAxisTensor:v26 withUpdatesTensor:v12 indicesTensor:v13 shape:v25 mode:0 name:v23];

    goto LABEL_5;
  }
  uint64_t v14 = 0;
LABEL_6:

  return v14;
}

@end