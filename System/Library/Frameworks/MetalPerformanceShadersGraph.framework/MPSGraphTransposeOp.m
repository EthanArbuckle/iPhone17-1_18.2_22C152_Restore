@interface MPSGraphTransposeOp
- (MPSGraphTransposeOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dimension:(unint64_t)a6 withDimension:(unint64_t)a7 name:(id)a8;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphTransposeOp

- (MPSGraphTransposeOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dimension:(unint64_t)a6 withDimension:(unint64_t)a7 name:(id)a8
{
  self->_dimensionIndex = a6;
  self->_dimensionIndex2 = a7;
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a8];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphTransposeOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", __p);
  id v12 = v11;
  __int16 v52 = 260;
  v51[0] = (uint64_t)__p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v51);
  uint64_t v14 = mlir::FileLineColLoc::get(StringAttr, 0xD2u, 0);
  if (!v14) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v12)
  {
    HIBYTE(v50) = 13;
    qmemcpy(&__dst, "mps.transpose", 13);
    v19 = &__dst.i8[13];
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
    unint64_t v50 = v21 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v50) = v16;
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
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v46);
  v22 = (std::string *)v46.__r_.__value_.__r.__words[0];
  if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v22 = &v46;
  }
  char v23 = 1;
  HIBYTE(v52) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v51[0] = (uint64_t)v22;
    char v23 = 3;
  }
  LOBYTE(v52) = v23;
  uint64_t v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v51);
  uint64_t v25 = mlir::NameLoc::get(v24, v14);
  if (!v25) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v46.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v50) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v50) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v42 < 0) {
    operator delete(__p[0]);
  }
  v26 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) == *(void *)a5) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  unsigned int dimensionIndex = self->_dimensionIndex;
  unsigned int dimensionIndex2 = self->_dimensionIndex2;
  uint64_t v43 = v25;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v43);
  uint64_t v30 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.transpose", (const unsigned __int8 *)0xD, Context);
  if (!v31)
  {
    __int16 v48 = 1283;
    v46.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.transpose";
    uint64_t v47 = 13;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v45 = 259;
    llvm::operator+((uint64_t *)&v46, (uint64_t *)&v44, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v51, v25, v30);
  mlir::mps::TransposeOp::build((mlir::mps::ConstantOp *)a3, v51, *v26, dimensionIndex, dimensionIndex2);
  v32 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v51);
  if (!v32)
  {
    v36 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v37 = 662;
    v38 = "Casting.h";
    v39 = "dyn_cast";
    goto LABEL_35;
  }
  uint64_t v33 = llvm::DefaultDoCastIfPossible<mlir::mps::TransposeOp,mlir::Operation *,llvm::CastInfo<mlir::mps::TransposeOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v32);
  if (!v33)
  {
    v36 = "result && \"builder didn't return the right type\"";
    int v37 = 497;
    v38 = "Builders.h";
    v39 = "create";
LABEL_35:
    __assert_rtn(v39, v38, v37, v36);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v51);
  if (!*(_DWORD *)(v33 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v40 = v33 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v40);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  unint64_t dimensionIndex = self->_dimensionIndex;
  unint64_t dimensionIndex2 = self->_dimensionIndex2;
  v13 = NSString;
  uint64_t v14 = [(MPSGraphOperation *)self name];
  v15 = [v13 stringWithFormat:@"%@/%@/transpose", v9, v14];
  size_t v16 = [WeakRetained transposeTensor:v8 dimension:dimensionIndex withDimension:dimensionIndex2 name:v15];

  return v16;
}

@end