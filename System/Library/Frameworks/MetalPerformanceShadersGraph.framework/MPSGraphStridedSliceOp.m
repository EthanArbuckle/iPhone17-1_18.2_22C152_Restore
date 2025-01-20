@interface MPSGraphStridedSliceOp
- (MPSGraphStridedSliceOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 startMask:(unsigned int)a6 endMask:(unsigned int)a7 shrinkAxisMask:(unsigned int)a8 endIsSize:(BOOL)a9 name:(id)a10;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphStridedSliceOp

- (MPSGraphStridedSliceOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 startMask:(unsigned int)a6 endMask:(unsigned int)a7 shrinkAxisMask:(unsigned int)a8 endIsSize:(BOOL)a9 name:(id)a10
{
  self->_begin_mask = a6;
  self->_end_mask = a7;
  self->_shrink_axis_mask = a8;
  self->_end_is_size = a9;
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a10];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v37 = a7;
  mpsFileLoc("-[MPSGraphStridedSliceOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", __p);
  id v11 = v37;
  __int16 v50 = 260;
  v49[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v49);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x208u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    HIBYTE(v48) = 17;
    LOBYTE(v48) = 101;
    int8x16_t __dst = *(int8x16_t *)"mps.strided_slice";
    v18 = (char *)&v48 + 1;
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
    unint64_t v48 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v48) = v15;
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
  uint64_t v24 = mlir::NameLoc::get(v23, v13);
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
  if (*((void *)a5 + 1) - *(void *)a5 <= 0x18uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v41 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v41);
  uint64_t v27 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.strided_slice", (const unsigned __int8 *)0x11, Context);
  if (!v28)
  {
    __int16 v46 = 1283;
    v44.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.strided_slice";
    uint64_t v45 = 17;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v43 = 259;
    llvm::operator+((uint64_t *)&v44, (uint64_t *)&v42, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v49, v24, v27);
  mlir::mps::StridedSliceOp::build((mlir::Builder *)a3, (uint64_t)v49, *v25, v25[1], v25[2], v25[3], self->_begin_mask, self->_end_mask, self->_shrink_axis_mask, self->_end_is_size);
  v29 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v49);
  if (!v29)
  {
    v33 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v34 = 662;
    v35 = "Casting.h";
    v36 = "dyn_cast";
    goto LABEL_35;
  }
  uint64_t v30 = llvm::DefaultDoCastIfPossible<mlir::mps::StridedSliceOp,mlir::Operation *,llvm::CastInfo<mlir::mps::StridedSliceOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v29);
  if (!v30)
  {
    v33 = "result && \"builder didn't return the right type\"";
    int v34 = 497;
    v35 = "Builders.h";
    v36 = "create";
LABEL_35:
    __assert_rtn(v36, v35, v34, v33);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v49);
  if (!*(_DWORD *)(v30 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v38 = v30 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v38);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  uint64_t v13 = [WeakRetained shapeOfTensor:v9 name:@"in shape"];

  LODWORD(WeakRetained) = self->_end_is_size;
  id v14 = objc_loadWeakRetained((id *)&self->super._graph);
  [(NSArray *)self->super._inputTensors objectAtIndexedSubscript:1];
  if (WeakRetained) {
    size_t v15 = {;
  }
    size_t v16 = [(NSArray *)self->super._inputTensors objectAtIndexedSubscript:2];
    v17 = [v14 sliceGradientTensor:v10 fwdInShapeTensor:v13 startTensor:v15 sizeTensor:v16 squeezeMask:self->_shrink_axis_mask name:v11];
  }
  else {
    size_t v15 = {;
  }
    size_t v16 = [(NSArray *)self->super._inputTensors objectAtIndexedSubscript:2];
    v18 = [(NSArray *)self->super._inputTensors objectAtIndexedSubscript:3];
    v17 = objc_msgSend(v14, "sliceGradientTensor:fwdInShapeTensor:startTensor:endTensor:strideTensor:startMask:endMask:squeezeMask:name:", v10, v13, v15, v16, v18, self->_begin_mask, *(void *)&self->_end_mask, v11);
  }

  return v17;
}

@end