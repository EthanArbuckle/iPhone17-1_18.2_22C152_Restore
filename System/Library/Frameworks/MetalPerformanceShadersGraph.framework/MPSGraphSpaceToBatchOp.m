@interface MPSGraphSpaceToBatchOp
- (MPSGraphSpaceToBatchOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 usePixelShuffleOrder:(BOOL)a6 name:(id)a7;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphSpaceToBatchOp

- (MPSGraphSpaceToBatchOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 usePixelShuffleOrder:(BOOL)a6 name:(id)a7
{
  self->_pixelShuffleOrder = a6;
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a7];
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  v11 = [(NSArray *)self->super._inputTensors objectAtIndexedSubscript:1];
  v12 = [(NSArray *)self->super._inputTensors objectAtIndexedSubscript:2];
  v13 = [(NSArray *)self->super._inputTensors objectAtIndexedSubscript:3];
  BOOL pixelShuffleOrder = self->_pixelShuffleOrder;
  v15 = NSString;
  v16 = [(MPSGraphOperation *)self name];
  v17 = [v15 stringWithFormat:@"%@/%@/spaceToBatchGradient", v9, v16];
  v18 = [WeakRetained batchToSpaceTensor:v8 spatialAxesTensor:v11 batchAxisTensor:v12 blockDimensionsTensor:v13 usePixelShuffleOrder:pixelShuffleOrder name:v17];

  return v18;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphSpaceToBatchOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", __p);
  id v12 = v11;
  __int16 v48 = 260;
  v47[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v47);
  uint64_t v14 = mlir::FileLineColLoc::get(StringAttr, 0x490u, 0);
  if (!v14) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v12)
  {
    __dst[23] = 18;
    strcpy(__dst, "mps.space_to_batch");
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
    v18 = operator new(v19 + 1);
    *(void *)&__dst[8] = v17;
    *(void *)&__dst[16] = v20 | 0x8000000000000000;
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
  v18[v17] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &v43);
  v21 = (std::string *)v43.__r_.__value_.__r.__words[0];
  if ((v43.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v21 = &v43;
  }
  char v22 = 1;
  HIBYTE(v48) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v47[0] = v21;
    char v22 = 3;
  }
  LOBYTE(v48) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v47);
  uint64_t v24 = mlir::NameLoc::get(v23, v14);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v43.__r_.__value_.__l.__data_);
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

  if (v39 < 0) {
    operator delete(__p[0]);
  }
  v25 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 0x18uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v40 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v40);
  uint64_t v27 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.space_to_batch", (const unsigned __int8 *)0x12, Context);
  if (!v28)
  {
    __int16 v45 = 1283;
    v43.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.space_to_batch";
    uint64_t v44 = 18;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v42 = 259;
    llvm::operator+((uint64_t *)&v43, (uint64_t *)&v41, (uint64_t)__dst);
    llvm::report_fatal_error((llvm::Twine *)__dst, 1);
  }
  mlir::OperationState::OperationState(v47, v24, v27);
  mlir::mps::SpaceToBatchOp::build((mlir::UnitAttr **)a3, (uint64_t)v47, *v25, v25[1], v25[2], v25[3], self->_pixelShuffleOrder);
  v29 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v47);
  if (!v29)
  {
    v33 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v34 = 662;
    v35 = "Casting.h";
    v36 = "dyn_cast";
    goto LABEL_35;
  }
  uint64_t v30 = llvm::DefaultDoCastIfPossible<mlir::mps::SpaceToBatchOp,mlir::Operation *,llvm::CastInfo<mlir::mps::SpaceToBatchOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v29);
  if (!v30)
  {
    v33 = "result && \"builder didn't return the right type\"";
    int v34 = 497;
    v35 = "Builders.h";
    v36 = "create";
LABEL_35:
    __assert_rtn(v36, v35, v34, v33);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v47);
  if (!*(_DWORD *)(v30 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v37 = v30 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v37);

  return DefiningOp;
}

@end