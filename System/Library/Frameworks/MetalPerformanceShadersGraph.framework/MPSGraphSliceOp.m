@interface MPSGraphSliceOp
- (MPSGraphSliceOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dimension:(unint64_t)a6 start:(int64_t)a7 length:(int64_t)a8 name:(id)a9;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphSliceOp

- (MPSGraphSliceOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dimension:(unint64_t)a6 start:(int64_t)a7 length:(int64_t)a8 name:(id)a9
{
  self->_dimensionIndex = a6;
  self->_start = a7;
  self->_length = a8;
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a9];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphSliceOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", __p);
  id v12 = v11;
  __int16 v50 = 260;
  v49[0] = (uint64_t)__p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v49);
  uint64_t v14 = mlir::FileLineColLoc::get(StringAttr, 0x16Bu, 0);
  if (!v14) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v12)
  {
    HIBYTE(v48) = 9;
    __dst.i8[8] = 101;
    __dst.i64[0] = *(void *)"mps.slice";
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
    unint64_t v48 = v21 | 0x8000000000000000;
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
  v19 = &p_dst->i8[v17];
LABEL_13:
  __int8 *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v44);
  v22 = (std::string *)v44.__r_.__value_.__r.__words[0];
  if ((v44.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v22 = &v44;
  }
  char v23 = 1;
  HIBYTE(v50) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v49[0] = (uint64_t)v22;
    char v23 = 3;
  }
  LOBYTE(v50) = v23;
  uint64_t v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v49);
  uint64_t v25 = mlir::NameLoc::get(v24, v14);
  if (!v25) {
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
  v26 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) == *(void *)a5) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v41 = v25;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v41);
  uint64_t v28 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.slice", (const unsigned __int8 *)9, Context);
  if (!v29)
  {
    __int16 v46 = 1283;
    v44.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.slice";
    uint64_t v45 = 9;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v43 = 259;
    llvm::operator+((uint64_t *)&v44, (uint64_t *)&v42, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v49, v25, v28);
  mlir::mps::SliceOp::build((mlir::mps::ConstantOp *)a3, v49, *v26, self->_dimensionIndex, self->_start, self->_length);
  v30 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v49);
  if (!v30)
  {
    v34 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v35 = 662;
    v36 = "Casting.h";
    v37 = "dyn_cast";
    goto LABEL_35;
  }
  uint64_t v31 = llvm::DefaultDoCastIfPossible<mlir::mps::SliceOp,mlir::Operation *,llvm::CastInfo<mlir::mps::SliceOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v30);
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
  id v33 = a6;
  int64_t dimensionIndex = self->_dimensionIndex;
  if (dimensionIndex < 0)
  {
    id v12 = [v9 shape];
    int64_t dimensionIndex = self->_dimensionIndex + [v12 count];
  }
  v13 = [MEMORY[0x1E4F1CA48] array];
  v32 = v10;
  uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v15 = 0;
  while (1)
  {
    size_t v16 = [v9 shape];
    unint64_t v17 = [v16 count];

    if (v15 >= v17) {
      break;
    }
    if (dimensionIndex == v15)
    {
      v18 = [v9 shape];
      v19 = [v18 objectAtIndexedSubscript:dimensionIndex];
      uint64_t v20 = [v19 integerValue];

      if (v20 <= 0 && MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
      uint64_t v21 = v20 - self->_length;
      int64_t v22 = (v20 & (self->_start >> 63)) + self->_start;
      uint64_t v23 = v21 - v22;
      if (v22 < 0 || v23 < 0)
      {
        if (MTLReportFailureTypeEnabled()) {
          MTLReportFailure();
        }
      }
      uint64_t v24 = [NSNumber numberWithInteger:v22];
      [v13 addObject:v24];

      uint64_t v25 = [NSNumber numberWithInteger:v23];
      [v14 addObject:v25];

      ++v15;
    }
    else
    {
      [v13 addObject:&unk_1EC9EFFC0];
      [v14 addObject:&unk_1EC9EFFC0];
      ++v15;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  v27 = NSString;
  uint64_t v28 = [(MPSGraphOperation *)self name];
  char v29 = [v27 stringWithFormat:@"%@/%@/pad", v33, v28];
  v30 = [WeakRetained padTensor:v32 withPaddingMode:0 leftPadding:v13 rightPadding:v14 constantValue:v29 name:0.0];

  return v30;
}

@end