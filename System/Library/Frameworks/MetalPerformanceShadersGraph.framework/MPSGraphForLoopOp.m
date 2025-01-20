@interface MPSGraphForLoopOp
- (BOOL)recurseFromBlock:(id)a3 onEscaped:(id)a4 withAutodiff:(void *)a5;
- (BOOL)recurseOnBlocksFromOutput:(id)a3 withAutodiff:(void *)a4;
- (BOOL)recurseOutFromBlockInput:(id)a3 withAutodiff:(void *)a4;
- (MPSGraphForLoopOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 bodyBlock:(id)a6 iterArgs:(id)a7 name:(id)a8;
- (id).cxx_construct;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
- (void)makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:;
- (void)partialDerivateForCFOpWithAutodiff:(void *)a3;
@end

@implementation MPSGraphForLoopOp

- (MPSGraphForLoopOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 bodyBlock:(id)a6 iterArgs:(id)a7 name:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = (void *)MEMORY[0x1852FE7D0](v17);
  id bodyBlock = self->_bodyBlock;
  self->_id bodyBlock = v20;

  objc_storeStrong((id *)&self->_iterArgs, a7);
  value = self->_opData.__ptr_.__value_;
  self->_opData.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(AutodiffOpData *))(*(void *)value + 8))(value);
  }
  v23 = objc_alloc_init(MPSGraphRegion);
  v26.receiver = self;
  v26.super_class = (Class)MPSGraphForLoopOp;
  v24 = [(MPSGraphOperation *)&v26 initWithGraph:v14 inputTensors:v15 controlDependencies:v16 region:v23 name:v19];

  return v24;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v58 = (mlir::OpBuilder *)a3;
  v59 = self;
  id v10 = a7;
  mpsFileLoc("-[MPSGraphForLoopOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphControlFlowOps.mm", __p);
  id v11 = v10;
  __int16 v67 = 260;
  v66[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v66);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x9F3u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    HIBYTE(v69) = 7;
    qmemcpy(&__dst, "scf.for", 7);
    id v18 = &__dst.i8[7];
    goto LABEL_13;
  }
  id v14 = (const char *)[v11 UTF8String];
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
    unint64_t v69 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v69) = v15;
    p_dst = &__dst;
    if (!v15) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  id v18 = &p_dst->i8[v16];
LABEL_13:
  *id v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v63);
  v21 = (std::string *)v63.__r_.__value_.__r.__words[0];
  if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v21 = &v63;
  }
  char v22 = 1;
  HIBYTE(v67) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v66[0] = v21;
    char v22 = 3;
  }
  LOBYTE(v67) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v66);
  uint64_t v24 = mlir::NameLoc::get(v23, v13);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v63.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v69) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v69) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  uint64_t v57 = v24;
  if (v56 < 0) {
    operator delete(__p[0]);
  }
  WeakRetained = objc_loadWeakRetained((id *)&v59->super._graph);
  objc_super v26 = (void *)WeakRetained[22];
  id v50 = v26;

  if (*((void *)a5 + 1) == *(void *)a5) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  v27 = mlir::OpBuilder::create<mlir::tensor::ExtractOp,mlir::Value &>(v58, v57, *(void *)a5);
  if (!*((_DWORD *)v27 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  if (*((void *)a5 + 1) - *(void *)a5 <= 8uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  v28 = mlir::OpBuilder::create<mlir::tensor::ExtractOp,mlir::Value &>(v58, v57, *(void *)a5 + 8);
  if (!*((_DWORD *)v28 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  if (*((void *)a5 + 1) - *(void *)a5 <= 0x10uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  v29 = mlir::OpBuilder::create<mlir::tensor::ExtractOp,mlir::Value &>(v58, v57, *(void *)a5 + 16);
  if (!*((_DWORD *)v29 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v31 = v57;
  v30 = v58;
  getValuesFromTensors(v59->_iterArgs, (char **)&v52);
  v51[0] = &v58;
  v51[1] = &v57;
  v51[2] = &v59;
  uint64_t v60 = v31;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v60);
  uint64_t v33 = mlir::RegisteredOperationName::lookup((int8x16_t *)"scf.for", (const unsigned __int8 *)7, Context);
  if (!v34)
  {
    __int16 v65 = 1283;
    v63.__r_.__value_.__r.__words[2] = (std::string::size_type)"scf.for";
    uint64_t v64 = 7;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v62 = 259;
    llvm::operator+((uint64_t *)&v63, (uint64_t *)&v61, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v66, v31, v33);
  mlir::ValueRange::ValueRange((unint64_t *)&__dst, (uint64_t)v52, (v53 - (unsigned char *)v52) >> 3);
  mlir::scf::ForOp::build((uint64_t)v30, (uint64_t)v66, (uint64_t)v27 - 16, (uint64_t)v28 - 16, (uint64_t)v29 - 16, __dst.i64[0], __dst.i64[1], v35, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t))llvm::function_ref<void ()(mlir::OpBuilder &,mlir::Location,mlir::Value,mlir::ValueRange)>::callback_fn<-[MPSGraphForLoopOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]::$_1>, (uint64_t)v51);
  v36 = mlir::OpBuilder::create(v30, (const mlir::OperationState *)v66);
  if (!v36)
  {
    v46 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v47 = 662;
    v48 = "Casting.h";
    v49 = "dyn_cast";
    goto LABEL_47;
  }
  uint64_t v37 = llvm::DefaultDoCastIfPossible<mlir::scf::ForOp,mlir::Operation *,llvm::CastInfo<mlir::scf::ForOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v36);
  if (!v37)
  {
    v46 = "result && \"builder didn't return the right type\"";
    int v47 = 497;
    v48 = "Builders.h";
    v49 = "create";
LABEL_47:
    __assert_rtn(v49, v48, v47, v46);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v66);
  uint64_t v54 = v37;
  if (v52)
  {
    v53 = v52;
    operator delete(v52);
  }
  uint64_t v38 = *(void *)(mlir::anec::A11Legacy::getBody((mlir::anec::A11Legacy *)&v54) + 8);
  v39 = [(NSMutableArray *)v59->super._region->_blocks objectAtIndexedSubscript:0];
  uint64_t v40 = v38 - 8;
  if (!v38) {
    uint64_t v40 = 0;
  }
  v39[3] = v40;

  v41 = (id *)objc_loadWeakRetained((id *)&v59->super._graph);
  objc_storeStrong(v41 + 22, v26);

  uint64_t Results = mlir::pdl::ApplyNativeRewriteOp::getResults((mlir::pdl::ApplyNativeRewriteOp *)&v54);
  if (!v43) {
    __assert_rtn("operator[]", "STLExtras.h", 1281, "Index < size() && \"invalid index for value range\"");
  }
  v66[0] = mlir::detail::OpResultImpl::getNextResultAtOffset(Results, 0);
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)v66);

  return DefiningOp;
}

- (BOOL)recurseFromBlock:(id)a3 onEscaped:(id)a4 withAutodiff:(void *)a5
{
  return recurseForUsesOnEscaped((Autodiff *)a5, (MPSGraphBlock *)a3, (MPSGraphTensor *)a4);
}

- (BOOL)recurseOnBlocksFromOutput:(id)a3 withAutodiff:(void *)a4
{
  id v6 = a3;
  uint64_t OpData = getOpData(&self->super);
  LOBYTE(a4) = (*(uint64_t (**)(uint64_t, void *, id))(*(void *)OpData + 24))(OpData, a4, v6);

  return (char)a4;
}

- (BOOL)recurseOutFromBlockInput:(id)a3 withAutodiff:(void *)a4
{
  id v6 = a3;
  uint64_t OpData = getOpData(&self->super);
  LOBYTE(a4) = (*(uint64_t (**)(uint64_t, void *, id))(*(void *)OpData + 32))(OpData, a4, v6);

  return (char)a4;
}

- (void)partialDerivateForCFOpWithAutodiff:(void *)a3
{
  uint64_t OpData = (AutodiffOpData *)getOpData(&self->super);

  AutodiffOpData::createPartialDerivatives(OpData, (Autodiff *)a3);
}

- (void).cxx_destruct
{
  value = self->_opData.__ptr_.__value_;
  self->_opData.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(AutodiffOpData *, SEL))(*(void *)value + 8))(value, a2);
  }
  objc_storeStrong((id *)&self->_forBlockArguments, 0);
  objc_storeStrong((id *)&self->_iterArgs, 0);
  objc_storeStrong((id *)&self->_bodyResult, 0);

  objc_storeStrong(&self->_bodyBlock, 0);
}

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  return self;
}

- (void)makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:
{
  v65[38] = *MEMORY[0x1E4F143B8];
  uint64_t v63 = a5;
  unint64_t v64 = a6;
  v8 = **a1;
  uint64_t v9 = (uint64_t)*a1[1];
  uint64_t v61 = a4;
  mlir::ValueRange::ValueRange(v62, (uint64_t)&v61, 1uLL);
  uint64_t v53 = v9;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v53);
  uint64_t v11 = mlir::RegisteredOperationName::lookup((int8x16_t *)"tensor.from_elements", (const unsigned __int8 *)0x14, Context);
  if (!v12)
  {
    __int16 v59 = 1283;
    uint64_t v57 = "tensor.from_elements";
    uint64_t v58 = 20;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v55 = 259;
    llvm::operator+(v56, v54, (uint64_t)v60);
    llvm::report_fatal_error((llvm::Twine *)v60, 1);
  }
  mlir::OperationState::OperationState(v65, v9, v11);
  mlir::tensor::FromElementsOp::build((uint64_t)v8, (uint64_t)v65, v62[0], v62[1]);
  uint64_t v13 = mlir::OpBuilder::create(v8, (const mlir::OperationState *)v65);
  id v14 = v13;
  if (!v13)
  {
    uint64_t v43 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v44 = 662;
    v45 = "Casting.h";
    v46 = "dyn_cast";
    goto LABEL_30;
  }
  uint64_t v15 = *((void *)v13 + 6);
  size_t v16 = *(void **)(v15 + 16);
  if (v16 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    v60[0] = *(void *)(v15 + 8);
    uint64_t AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)v60);
    if (v48 == 20)
    {
      BOOL v49 = *(void *)AttrData == 0x662E726F736E6574 && *(void *)(AttrData + 8) == 0x6D656C655F6D6F72;
      if (v49 && *(_DWORD *)(AttrData + 16) == 1937010277)
      {
        __int16 v59 = 1283;
        v56[0] = (uint64_t)"classof on '";
        uint64_t v57 = "tensor.from_elements";
        uint64_t v58 = 20;
        v54[0] = (uint64_t)"' failed due to the operation not being registered";
        __int16 v55 = 259;
        llvm::operator+(v56, v54, (uint64_t)v60);
        llvm::report_fatal_error((llvm::Twine *)v60, 1);
      }
    }
    goto LABEL_29;
  }
  if (v16 != &mlir::detail::TypeIDResolver<mlir::tensor::FromElementsOp,void>::id)
  {
LABEL_29:
    uint64_t v43 = "result && \"builder didn't return the right type\"";
    int v44 = 497;
    v45 = "Builders.h";
    v46 = "create";
LABEL_30:
    __assert_rtn(v46, v45, v44, v43);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v65);
  if (!*((_DWORD *)v14 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v17 = *(void *)(*((void *)v14 - 1) & 0xFFFFFFFFFFFFFFF8);
  if (!v17) {
    __assert_rtn("getAbstractType", "TypeSupport.h", 160, "abstractType && \"Malformed type storage object.\"");
  }
  if (*(_UNKNOWN **)(v17 + 136) != &mlir::detail::TypeIDResolver<mlir::RankedTensorType,void>::id) {
    __assert_rtn("cast", "Casting.h", 566, "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\"");
  }
  uint64_t v52 = (uint64_t)v14 - 16;
  uint64_t v18 = mlir::IntegerType::get(*(void *)**a1, 0x20u, 1u);
  uint64_t v19 = (mlir::UnknownLoc **)**a1;
  uint64_t v20 = (uint64_t)*a1[1];
  v65[0] = mlir::TypeAttr::get(v18);
  v21 = mlir::OpBuilder::create<mlir::mps::CastOp,mlir::Value &,mlir::TypeAttr &>(v19, v20, &v52, v65);
  if (!*((_DWORD *)v21 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  char v22 = [*((id *)*a1[2] + 5) appendNewBlock];
  uint64_t v23 = [MPSGraphTensor alloc];
  uint64_t v24 = (uint64_t)*a1[2];
  id WeakRetained = objc_loadWeakRetained((id *)(v24 + 8));
  id v51 = [(MPSGraphTensor *)v23 initTensorWithOperation:v24 value:(char *)v21 - 16 graph:WeakRetained parentBlock:v22 name:0];

  objc_super v26 = objc_opt_new();
  if (a6)
  {
    unint64_t v27 = 0;
    do
    {
      uint64_t v28 = mlir::ValueRange::dereference_iterator(&v63, v27);
      v29 = [MPSGraphTensor alloc];
      uint64_t v30 = (uint64_t)*a1[2];
      id v31 = objc_loadWeakRetained((id *)(v30 + 8));
      id v32 = [(MPSGraphTensor *)v29 initTensorWithOperation:v30 value:v28 graph:v31 parentBlock:v22 name:0];

      [v26 addObject:v32];
      ++v27;
    }
    while (v64 > v27);
  }
  objc_storeStrong((id *)*a1[2] + 14, v26);
  uint64_t v33 = (id *)objc_loadWeakRetained((id *)*a1[2] + 1);
  objc_storeStrong(v33 + 22, v22);

  uint64_t v34 = (*(void (**)(void))(*((void *)*a1[2] + 11) + 16))();
  uint64_t v35 = (uint64_t)*a1[2];
  v36 = *(void **)(v35 + 96);
  *(void *)(v35 + 96) = v34;

  uint64_t v37 = (uint64_t)*a1[2];
  uint64_t v38 = *(void **)(v37 + 88);
  *(void *)(v37 + 88) = 0;

  v39 = [MPSGraphYieldOp alloc];
  id v40 = objc_loadWeakRetained((id *)*a1[2] + 1);
  v41 = [(MPSGraphOperation *)v39 initWithGraph:v40 inputTensors:*((void *)*a1[2] + 12) controlDependencies:MEMORY[0x1E4F1CBF0] name:0];

  v42 = (id *)objc_loadWeakRetained((id *)*a1[2] + 1);
  [v42[22] addTerminatorOperation:v41];
}

@end