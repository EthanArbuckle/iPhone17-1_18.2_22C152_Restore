@interface MPSGraphStridedSliceGradientOp
- (MPSGraphStridedSliceGradientOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 startMask:(unsigned int)a6 endMask:(unsigned int)a7 shrinkAxisMask:(unsigned int)a8 endIsSize:(BOOL)a9 name:(id)a10;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphStridedSliceGradientOp

- (MPSGraphStridedSliceGradientOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 startMask:(unsigned int)a6 endMask:(unsigned int)a7 shrinkAxisMask:(unsigned int)a8 endIsSize:(BOOL)a9 name:(id)a10
{
  self->_begin_mask = a6;
  self->_end_mask = a7;
  self->_shrink_axis_mask = a8;
  self->_end_is_size = a9;
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a10];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v45 = a7;
  mpsFileLoc("-[MPSGraphStridedSliceGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", __p);
  id v11 = v45;
  __int16 v58 = 260;
  v57[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v57);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x251u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    v18 = (char *)operator new(0x20uLL);
    __dst = (void **)v18;
    long long v56 = xmmword_181130460;
    qmemcpy(v18, "mps.strided_slice_gradient", 26);
    v19 = v18 + 26;
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
    uint64_t v20 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17) {
      uint64_t v20 = v15 | 7;
    }
    uint64_t v21 = v20 + 1;
    p_dst = (void **)operator new(v20 + 1);
    *(void *)&long long v56 = v16;
    *((void *)&v56 + 1) = v21 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v56) = v15;
    p_dst = (void **)&__dst;
    if (!v15) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v19 = (char *)p_dst + v16;
LABEL_13:
  unsigned char *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v52);
  v22 = (std::string *)v52.__r_.__value_.__r.__words[0];
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v22 = &v52;
  }
  char v23 = 1;
  HIBYTE(v58) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v57[0] = v22;
    char v23 = 3;
  }
  LOBYTE(v58) = v23;
  uint64_t v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v57);
  uint64_t v25 = mlir::NameLoc::get(v24, v13);
  if (!v25) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v52.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v56) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v56) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  if (v48 < 0) {
    operator delete(__p[0]);
  }
  v26 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 0x20uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v49 = v25;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v49);
  uint64_t v28 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.strided_slice_gradient", (const unsigned __int8 *)0x1A, Context);
  if (!v29)
  {
    __int16 v54 = 1283;
    v52.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.strided_slice_gradient";
    uint64_t v53 = 26;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v51 = 259;
    llvm::operator+((uint64_t *)&v52, v50, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v57, v25, v28);
  mlir::mps::StridedSliceGradientOp::build((mlir::Builder *)a3, (uint64_t)v57, *v26, v26[1], v26[2], v26[3], v26[4], self->_begin_mask, self->_end_mask, self->_shrink_axis_mask, self->_end_is_size);
  v30 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v57);
  v31 = v30;
  if (!v30)
  {
    v36 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v37 = 662;
    v38 = "Casting.h";
    v39 = "dyn_cast";
    goto LABEL_51;
  }
  uint64_t v32 = *((void *)v30 + 6);
  v33 = *(void **)(v32 + 16);
  if (v33 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst = *(void ***)(v32 + 8);
    uint64_t AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v41 == 26)
    {
      BOOL v42 = *(void *)AttrData == 0x697274732E73706DLL && *(void *)(AttrData + 8) == 0x63696C735F646564;
      BOOL v43 = v42 && *(void *)(AttrData + 16) == 0x6569646172675F65;
      if (v43 && *(_WORD *)(AttrData + 24) == 29806)
      {
        __int16 v54 = 1283;
        v52.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
        v52.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.strided_slice_gradient";
        uint64_t v53 = 26;
        v50[0] = (uint64_t)"' failed due to the operation not being registered";
        __int16 v51 = 259;
        llvm::operator+((uint64_t *)&v52, v50, (uint64_t)&__dst);
        llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
      }
    }
    goto LABEL_50;
  }
  if (v33 != &mlir::detail::TypeIDResolver<mlir::mps::StridedSliceGradientOp,void>::id)
  {
LABEL_50:
    v36 = "result && \"builder didn't return the right type\"";
    int v37 = 497;
    v38 = "Builders.h";
    v39 = "create";
LABEL_51:
    __assert_rtn(v39, v38, v37, v36);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v57);
  if (!*((_DWORD *)v31 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v46 = (char *)v31 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v46);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  BOOL end_is_size = self->_end_is_size;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  [(NSArray *)self->super._inputTensors objectAtIndexedSubscript:2];
  if (end_is_size) {
    v12 = {;
  }
    uint64_t v13 = [(NSArray *)self->super._inputTensors objectAtIndexedSubscript:3];
    v14 = [WeakRetained sliceTensor:v8 startTensor:v12 sizeTensor:v13 squeezeMask:self->_shrink_axis_mask name:v9];
  }
  else {
    v12 = {;
  }
    uint64_t v13 = [(NSArray *)self->super._inputTensors objectAtIndexedSubscript:3];
    size_t v15 = [(NSArray *)self->super._inputTensors objectAtIndexedSubscript:4];
    LODWORD(v17) = self->_shrink_axis_mask;
    v14 = [WeakRetained sliceTensor:v8 startTensor:v12 endTensor:v13 strideTensor:v15 startMask:self->_begin_mask endMask:self->_end_mask squeezeMask:v17 name:v9];
  }

  return v14;
}

@end