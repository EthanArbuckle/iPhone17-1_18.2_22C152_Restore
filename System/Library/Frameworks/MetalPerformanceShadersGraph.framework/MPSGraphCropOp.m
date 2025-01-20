@interface MPSGraphCropOp
- (MPSGraphCropOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dimension_index:(int64_t)a6 amount_before:(unint64_t)a7 amount_after:(unint64_t)a8 name:(id)a9;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphCropOp

- (MPSGraphCropOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dimension_index:(int64_t)a6 amount_before:(unint64_t)a7 amount_after:(unint64_t)a8 name:(id)a9
{
  self->_amount_after = a8;
  self->_amount_before = a7;
  self->_dimensionIndex = a6;
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a9];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphCropOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", __p);
  id v12 = v11;
  __int16 v49 = 260;
  v48[0] = (uint64_t)__p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v48);
  uint64_t v14 = mlir::FileLineColLoc::get(StringAttr, 0x1BBu, 0);
  if (!v14) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v12)
  {
    HIBYTE(v47) = 8;
    strcpy(__dst.i8, "mps.crop");
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
    unint64_t v47 = v20 | 0x8000000000000000;
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
  p_dst->i8[v17] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v43);
  v21 = (std::string *)v43.__r_.__value_.__r.__words[0];
  if ((v43.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v21 = &v43;
  }
  char v22 = 1;
  HIBYTE(v49) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v48[0] = (uint64_t)v21;
    char v22 = 3;
  }
  LOBYTE(v49) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v48);
  uint64_t v24 = mlir::NameLoc::get(v23, v14);
  if (!v24) {
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
  v25 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 8uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v40 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v40);
  uint64_t v27 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.crop", (const unsigned __int8 *)8, Context);
  if (!v28)
  {
    __int16 v45 = 1283;
    v43.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.crop";
    uint64_t v44 = 8;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v42 = 259;
    llvm::operator+((uint64_t *)&v43, (uint64_t *)&v41, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v48, v24, v27);
  mlir::mps::CropOp::build((mlir::mps::ConstantOp *)a3, v48, *v25, v25[1], self->_amount_before, self->_amount_after);
  v29 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v48);
  if (!v29)
  {
    v33 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v34 = 662;
    v35 = "Casting.h";
    v36 = "dyn_cast";
    goto LABEL_35;
  }
  uint64_t v30 = llvm::DefaultDoCastIfPossible<mlir::mps::CropOp,mlir::Operation *,llvm::CastInfo<mlir::mps::CropOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v29);
  if (!v30)
  {
    v33 = "result && \"builder didn't return the right type\"";
    int v34 = 497;
    v35 = "Builders.h";
    v36 = "create";
LABEL_35:
    __assert_rtn(v36, v35, v34, v33);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v48);
  if (!*(_DWORD *)(v30 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v37 = v30 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v37);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9 = a3;
  id v26 = a4;
  id v10 = a6;
  int64_t dimensionIndex = self->_dimensionIndex;
  if (dimensionIndex < 0)
  {
    id v12 = [v9 shape];
    int64_t dimensionIndex = self->_dimensionIndex + [v12 count];
  }
  v13 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
  for (unint64_t i = 0; ; ++i)
  {
    size_t v16 = [v9 shape];
    unint64_t v17 = [v16 count];

    if (i >= v17) {
      break;
    }
    if (dimensionIndex == i)
    {
      v18 = [NSNumber numberWithUnsignedInteger:self->_amount_before];
      [v13 addObject:v18];

      uint64_t v19 = [NSNumber numberWithUnsignedInteger:self->_amount_after];
      [v14 addObject:v19];
    }
    else
    {
      [v13 addObject:&unk_1EC9EFFC0];
      [v14 addObject:&unk_1EC9EFFC0];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  v21 = NSString;
  char v22 = [(MPSGraphOperation *)self name];
  uint64_t v23 = [v21 stringWithFormat:@"%@/%@/pad", v10, v22];
  uint64_t v24 = [WeakRetained padTensor:v26 withPaddingMode:0 leftPadding:v13 rightPadding:v14 constantValue:v23 name:0.0];

  return v24;
}

@end