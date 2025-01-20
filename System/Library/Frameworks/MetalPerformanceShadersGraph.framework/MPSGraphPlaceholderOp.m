@interface MPSGraphPlaceholderOp
- (MPSGraphPlaceholderOp)initWithGraph:(id)a3 shape:(id)a4 dataType:(unsigned int)a5 name:(id)a6;
- (MPSGraphPlaceholderOp)initWithGraph:(id)a3 shape:(id)a4 dataType:(unsigned int)a5 value:(Value)a6 name:(id)a7;
- (NSArray)shape;
- (unsigned)dataType;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphPlaceholderOp

- (MPSGraphPlaceholderOp)initWithGraph:(id)a3 shape:(id)a4 dataType:(unsigned int)a5 name:(id)a6
{
  objc_storeStrong((id *)&self->_shape, a4);
  id v11 = a4;
  id v12 = a6;
  id v13 = a3;
  *(&self->_dataType + 1) = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPSGraphPlaceholderOp;
  v14 = [(MPSGraphOperation *)&v16 initWithGraph:v13 inputTensors:MEMORY[0x1E4F1CBF0] controlDependencies:MEMORY[0x1E4F1CBF0] name:v12];

  return v14;
}

- (MPSGraphPlaceholderOp)initWithGraph:(id)a3 shape:(id)a4 dataType:(unsigned int)a5 value:(Value)a6 name:(id)a7
{
  v23[1] = *MEMORY[0x1E4F143B8];
  impl = a6.impl;
  v9 = (id *)a3;
  v10 = [(MPSGraphOperation *)self initInternal];
  objc_storeWeak((id *)&v10->super._graph, v9);
  inputTensors = v10->super._inputTensors;
  v10->super._inputTensors = (NSArray *)MEMORY[0x1E4F1CBF0];

  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  controlDependencies = v10->super._controlDependencies;
  v10->super._controlDependencies = (NSMutableArray *)v12;

  name = v10->super._name;
  v10->super._name = 0;

  if (a6.impl)
  {
    id v15 = [[MPSGraphTensor alloc] initTensorWithOperation:v10 value:a6.impl graph:v9];
    v23[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    outputTensors = v10->super._outputTensors;
    v10->super._outputTensors = (NSArray *)v16;

    DefiningOp = (mlir::Operation *)mlir::Value::getDefiningOp((mlir::Value *)&impl);
    uint64_t v19 = getOpName(DefiningOp);
    v20 = v10->super._name;
    v10->super._name = (NSString *)v19;
  }
  [v9[10] addObject:v10];

  return v10;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  mpsFileLoc("-[MPSGraphPlaceholderOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphMemoryOps.mm", __p);
  id v11 = v10;
  __int16 v55 = 260;
  v54[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v54);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x77u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    HIBYTE(v53) = 15;
    qmemcpy(&__dst, "mps.placeholder", 15);
    v18 = &__dst.i8[15];
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
    unint64_t v53 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v53) = v15;
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
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v49);
  v21 = (std::string *)v49.__r_.__value_.__r.__words[0];
  if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v21 = &v49;
  }
  char v22 = 1;
  HIBYTE(v55) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v54[0] = v21;
    char v22 = 3;
  }
  LOBYTE(v55) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v54);
  uint64_t v24 = mlir::NameLoc::get(v23, v13);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v49.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v53) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v53) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v45 < 0) {
    operator delete(__p[0]);
  }
  MLIRType = getMLIRType((mlir::MLIRContext **)a3, self->_shape, (mlir::MLIRContext *)*(&self->_dataType + 1));
  uint64_t v46 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v46);
  uint64_t v27 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.placeholder", (const unsigned __int8 *)0xF, Context);
  if (!v28)
  {
    __int16 v51 = 1283;
    v49.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.placeholder";
    uint64_t v50 = 15;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v48 = 259;
    llvm::operator+((uint64_t *)&v49, (uint64_t *)&v47, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v54, v24, v27);
  mlir::mps::PlaceholderOp::build((uint64_t)a3, (uint64_t)v54, (uint64_t)MLIRType);
  v29 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v54);
  if (!v29)
  {
    v35 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v36 = 662;
    v37 = "Casting.h";
    v38 = "dyn_cast";
    goto LABEL_37;
  }
  uint64_t v30 = llvm::DefaultDoCastIfPossible<mlir::mps::PlaceholderOp,mlir::Operation *,llvm::CastInfo<mlir::mps::PlaceholderOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v29);
  if (!v30)
  {
    v35 = "result && \"builder didn't return the right type\"";
    int v36 = 497;
    v37 = "Builders.h";
    v38 = "create";
LABEL_37:
    __assert_rtn(v38, v37, v36, v35);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v54);
  if (!*(_DWORD *)(v30 + 36))
  {
    v39 = "resultNumber < getNumResults() && \"Result number is out of range for operation\"";
    int v40 = 984;
    v41 = "Operation.h";
    v42 = "getOpResultImpl";
    goto LABEL_41;
  }
  uint64_t v31 = *(void *)(*(void *)(v30 - 8) & 0xFFFFFFFFFFFFFFF8);
  if (!v31)
  {
    v39 = "abstractType && \"Malformed type storage object.\"";
    int v40 = 160;
    v41 = "TypeSupport.h";
    v42 = "getAbstractType";
    goto LABEL_41;
  }
  v32 = *(void **)(v31 + 136);
  if (v32 != &mlir::detail::TypeIDResolver<mlir::RankedTensorType,void>::id
    && v32 != &mlir::detail::TypeIDResolver<mlir::UnrankedTensorType,void>::id)
  {
    v39 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\"";
    int v40 = 566;
    v41 = "Casting.h";
    v42 = "cast";
LABEL_41:
    __assert_rtn(v42, v41, v40, v39);
  }
  uint64_t v43 = v30 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v43);

  return DefiningOp;
}

- (NSArray)shape
{
  return self->_shape;
}

- (unsigned)dataType
{
  return *(&self->_dataType + 1);
}

- (void).cxx_destruct
{
}

@end