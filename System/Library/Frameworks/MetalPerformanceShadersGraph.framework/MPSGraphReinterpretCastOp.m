@interface MPSGraphReinterpretCastOp
- (MPSGraphReinterpretCastOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 destType:(unsigned int)a6 name:(id)a7;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphReinterpretCastOp

- (MPSGraphReinterpretCastOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 destType:(unsigned int)a6 name:(id)a7
{
  self->_destType = a6;
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a7];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphReinterpretCastOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", __p);
  id v12 = v11;
  __int16 v51 = 260;
  v50[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v50);
  uint64_t v14 = mlir::FileLineColLoc::get(StringAttr, 0x374u, 0);
  if (!v14) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v12)
  {
    __dst[23] = 20;
    strcpy(__dst, "mps.reinterpret_cast");
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
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &v46);
  v21 = (std::string *)v46.__r_.__value_.__r.__words[0];
  if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v21 = &v46;
  }
  char v22 = 1;
  HIBYTE(v51) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v50[0] = v21;
    char v22 = 3;
  }
  LOBYTE(v51) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v50);
  uint64_t v24 = mlir::NameLoc::get(v23, v14);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v46.__r_.__value_.__l.__data_);
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

  if (v42 < 0) {
    operator delete(__p[0]);
  }
  v25 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) == *(void *)a5) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v26 = *v25;
  if (getMPSDataType((void *)(*(void *)(*v25 + 8) & 0xFFFFFFFFFFFFFFF8)) == -2147483640
    && MTLReportFailureTypeEnabled())
  {
    MTLReportFailure();
  }
  if (self->_destType == -2147483640 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  uint64_t MLIRElementType = getMLIRElementType(*(mlir::MLIRContext **)a3, (mlir::MLIRContext *)self->_destType);
  uint64_t v28 = mlir::TypeAttr::get(MLIRElementType);
  uint64_t v43 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v43);
  uint64_t v30 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.reinterpret_cast", (const unsigned __int8 *)0x14, Context);
  if (!v31)
  {
    __int16 v48 = 1283;
    v46.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.reinterpret_cast";
    uint64_t v47 = 20;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v45 = 259;
    llvm::operator+((uint64_t *)&v46, (uint64_t *)&v44, (uint64_t)__dst);
    llvm::report_fatal_error((llvm::Twine *)__dst, 1);
  }
  mlir::OperationState::OperationState(v50, v24, v30);
  mlir::mps::ReinterpretCastOp::build((mlir::UnknownLoc **)a3, (uint64_t)v50, v26, v28);
  v32 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v50);
  if (!v32)
  {
    v36 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v37 = 662;
    v38 = "Casting.h";
    v39 = "dyn_cast";
    goto LABEL_41;
  }
  uint64_t v33 = llvm::DefaultDoCastIfPossible<mlir::mps::ReinterpretCastOp,mlir::Operation *,llvm::CastInfo<mlir::mps::ReinterpretCastOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v32);
  if (!v33)
  {
    v36 = "result && \"builder didn't return the right type\"";
    int v37 = 497;
    v38 = "Builders.h";
    v39 = "create";
LABEL_41:
    __assert_rtn(v39, v38, v37, v36);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v50);
  if (!*(_DWORD *)(v33 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v40 = v33 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v40);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  uint64_t v13 = [v9 dataType];
  uint64_t v14 = NSString;
  v15 = [(MPSGraphOperation *)self name];
  size_t v16 = [v14 stringWithFormat:@"%@/%@/reinterpretCastGradient", v11, v15];
  size_t v17 = [WeakRetained reinterpretCastTensor:v10 toType:v13 name:v16];

  return v17;
}

@end