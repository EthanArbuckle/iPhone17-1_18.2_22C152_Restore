@interface MPSGraphScatterNDOp
- (MPSGraphScatterNDOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 batchDimensions:(unint64_t)a6 mode:(int64_t)a7 name:(id)a8;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphScatterNDOp

- (MPSGraphScatterNDOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 batchDimensions:(unint64_t)a6 mode:(int64_t)a7 name:(id)a8
{
  self->_batchDims = a6;
  self->_mode = a7;
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a8];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphScatterNDOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphScatterOps.mm", __p);
  id v12 = v11;
  __int16 v50 = 260;
  v49[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v49);
  uint64_t v14 = mlir::FileLineColLoc::get(StringAttr, 0x31u, 0);
  if (!v14) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v12)
  {
    HIBYTE(v48) = 14;
    strcpy(__dst.i8, "mps.scatter_nd");
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
    uint64_t v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v19 = v16 | 7;
    }
    uint64_t v20 = v19 + 1;
    p_dst = (int8x16_t *)operator new(v19 + 1);
    __dst.i64[1] = v17;
    unint64_t v48 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v48) = v16;
    p_dst = &__dst;
    if (!v16) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  p_dst->i8[v17] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v44);
  v21 = (std::string *)v44.__r_.__value_.__r.__words[0];
  if ((v44.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v21 = &v44;
  }
  char v22 = 1;
  HIBYTE(v50) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v49[0] = v21;
    char v22 = 3;
  }
  LOBYTE(v50) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v49);
  uint64_t v24 = mlir::NameLoc::get(v23, v14);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v44.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v48) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v48) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v40 < 0) {
    operator delete(__p[0]);
  }
  v25 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 0x10uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  unsigned int mode = self->_mode;
  uint64_t v41 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v41);
  uint64_t v28 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.scatter_nd", (const unsigned __int8 *)0xE, Context);
  if (!v29)
  {
    __int16 v46 = 1283;
    v44.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.scatter_nd";
    uint64_t v45 = 14;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v43 = 259;
    llvm::operator+((uint64_t *)&v44, (uint64_t *)&v42, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v49, v24, v28);
  mlir::mps::ScatterNDOp::build((mlir::Builder *)a3, (uint64_t)v49, *v25, v25[1], v25[2], self->_batchDims, mode);
  v30 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v49);
  if (!v30)
  {
    v34 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v35 = 662;
    v36 = "Casting.h";
    v37 = "dyn_cast";
    goto LABEL_35;
  }
  uint64_t v31 = llvm::DefaultDoCastIfPossible<mlir::mps::ScatterNDOp,mlir::Operation *,llvm::CastInfo<mlir::mps::ScatterNDOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v30);
  if (!v31)
  {
    v34 = "result && \"builder didn't return the right type\"";
    int v35 = 497;
    v36 = "Builders.h";
    v37 = "create";
LABEL_35:
    __assert_rtn(v37, v36, v35, v34);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v49);
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
  if (v13 == v9)
  {
    int64_t mode = self->_mode;

    if (!mode)
    {
      id v18 = v10;
      goto LABEL_8;
    }
  }
  else
  {
  }
  v15 = [(MPSGraphOperation *)self inputTensors];
  id v16 = [v15 objectAtIndexedSubscript:1];
  if (v16 != v9)
  {

LABEL_7:
    id v18 = 0;
    goto LABEL_8;
  }
  int64_t v17 = self->_mode;

  if (v17) {
    goto LABEL_7;
  }
  id v20 = v10;
  v21 = [(MPSGraphOperation *)self inputTensors];
  char v22 = [v21 objectAtIndexedSubscript:2];

  id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  unint64_t batchDims = self->_batchDims;
  v25 = NSString;
  v26 = [(MPSGraphOperation *)self name];
  v27 = [v25 stringWithFormat:@"%@/%@/gatherND", v11, v26];
  id v18 = [WeakRetained gatherNDWithUpdatesTensor:v20 indicesTensor:v22 batchDimensions:batchDims name:v27];

LABEL_8:

  return v18;
}

@end