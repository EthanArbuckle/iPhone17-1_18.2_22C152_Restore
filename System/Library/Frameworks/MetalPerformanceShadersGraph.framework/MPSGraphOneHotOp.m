@interface MPSGraphOneHotOp
- (MPSGraphOneHotOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 depth:(unint64_t)a6 axis:(unint64_t)a7 dataType:(unsigned int)a8 name:(id)a9;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphOneHotOp

- (MPSGraphOneHotOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 depth:(unint64_t)a6 axis:(unint64_t)a7 dataType:(unsigned int)a8 name:(id)a9
{
  self->_depth = a6;
  self->_axis = a7;
  self->_dataType = a8;
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a9];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphOneHotOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphOneHotOps.mm", __p);
  id v64 = v11;
  __int16 v75 = 260;
  v74[0] = (uint64_t *)__p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v74);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x34u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v64)
  {
    HIBYTE(v77) = 11;
    *(__int32 *)((char *)&__dst.i32[1] + 3) = 1953458271;
    __dst.i64[0] = *(void *)"mps.one_hot";
    v18 = &__dst.i8[11];
    goto LABEL_13;
  }
  v14 = (const char *)[v64 UTF8String];
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
    unint64_t v77 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v77) = v15;
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
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v71);
  v21 = (std::string *)v71.__r_.__value_.__r.__words[0];
  if ((v71.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v21 = &v71;
  }
  char v22 = 1;
  HIBYTE(v75) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v74[0] = (uint64_t *)v21;
    char v22 = 3;
  }
  LOBYTE(v75) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v74);
  uint64_t v24 = mlir::NameLoc::get(v23, v13);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v71.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v77) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v77) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v67 < 0) {
    operator delete(__p[0]);
  }
  uint64_t MLIRElementType = getMLIRElementType(*(mlir::MLIRContext **)a3, (mlir::MLIRContext *)self->_dataType);
  __dst.i64[0] = 1;
  uint64_t IntegerType = mlir::Builder::getIntegerType((mlir::Builder *)a3, 0x20u, 0);
  v27 = (uint64_t **)mlir::RankedTensorType::get((uint64_t)&__dst, 1, IntegerType, 0);
  if (!mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor(v27))
  {
    v29 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\"";
    int v30 = 566;
    v31 = "Casting.h";
    v32 = "cast";
LABEL_47:
    __assert_rtn(v32, v31, v30, v29);
  }
  if (v27)
  {
    uint64_t InterfaceFor = mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor(v27);
    if (!InterfaceFor)
    {
      v29 = "(!t || conceptImpl) && \"expected value to provide interface instance\"";
      int v30 = 98;
      v31 = "InterfaceSupport.h";
      v32 = "Interface";
      goto LABEL_47;
    }
  }
  else
  {
    uint64_t InterfaceFor = 0;
  }
  LODWORD(v71.__r_.__value_.__l.__data_) = self->_depth;
  v33 = (uint64_t *)mlir::DenseElementsAttr::getFromRawBuffer(v27, InterfaceFor, &v71, 4, 4, 1, 0);
  if (!mlir::DenseIntElementsAttr::classof((uint64_t)v33))
  {
    v52 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\"";
    int v53 = 566;
    v54 = "Casting.h";
    v55 = "cast";
    goto LABEL_50;
  }
  v74[0] = v33;
  v34 = mlir::OpBuilder::create<mlir::mps::ConstantOp,mlir::DenseIntElementsAttr>((mlir::OpBuilder *)a3, v24, v74);
  if (!*((_DWORD *)v34 + 9))
  {
    v52 = "resultNumber < getNumResults() && \"Result number is out of range for operation\"";
    int v53 = 984;
    v54 = "Operation.h";
    v55 = "getOpResultImpl";
LABEL_50:
    __assert_rtn(v55, v54, v53, v52);
  }
  __dst.i64[0] = 1;
  uint64_t v35 = mlir::Builder::getIntegerType((mlir::Builder *)a3, 0x20u, 1);
  v36 = (uint64_t **)mlir::RankedTensorType::get((uint64_t)&__dst, 1, v35, 0);
  if (!mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor(v36))
  {
    v38 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\"";
    int v39 = 566;
    v40 = "Casting.h";
    v41 = "cast";
LABEL_52:
    __assert_rtn(v41, v40, v39, v38);
  }
  if (v36)
  {
    uint64_t v37 = mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor(v36);
    if (!v37)
    {
      v38 = "(!t || conceptImpl) && \"expected value to provide interface instance\"";
      int v39 = 98;
      v40 = "InterfaceSupport.h";
      v41 = "Interface";
      goto LABEL_52;
    }
  }
  else
  {
    uint64_t v37 = 0;
  }
  LODWORD(v71.__r_.__value_.__l.__data_) = self->_axis;
  v42 = (uint64_t *)mlir::DenseElementsAttr::getFromRawBuffer(v36, v37, &v71, 4, 4, 1, 1);
  if (!mlir::DenseIntElementsAttr::classof((uint64_t)v42))
  {
    v56 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\"";
    int v57 = 566;
    v58 = "Casting.h";
    v59 = "cast";
    goto LABEL_55;
  }
  v74[0] = v42;
  v43 = mlir::OpBuilder::create<mlir::mps::ConstantOp,mlir::DenseIntElementsAttr>((mlir::OpBuilder *)a3, v24, v74);
  if (!*((_DWORD *)v43 + 9))
  {
    v56 = "resultNumber < getNumResults() && \"Result number is out of range for operation\"";
    int v57 = 984;
    v58 = "Operation.h";
    v59 = "getOpResultImpl";
LABEL_55:
    __assert_rtn(v59, v58, v57, v56);
  }
  v44 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) == *(void *)a5) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v68 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v68);
  uint64_t v46 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.one_hot", (const unsigned __int8 *)0xB, Context);
  if (!v47)
  {
    __int16 v73 = 1283;
    v71.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.one_hot";
    uint64_t v72 = 11;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v70 = 259;
    llvm::operator+((uint64_t *)&v71, (uint64_t *)&v69, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v74, v24, v46);
  mlir::mps::OneHotOp::build((mlir::UnknownLoc **)a3, (uint64_t)v74, *v44, (uint64_t)v34 - 16, (uint64_t)v43 - 16, MLIRElementType);
  v48 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v74);
  if (!v48)
  {
    v60 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v61 = 662;
    v62 = "Casting.h";
    v63 = "dyn_cast";
    goto LABEL_59;
  }
  uint64_t v49 = llvm::DefaultDoCastIfPossible<mlir::mps::OneHotOp,mlir::Operation *,llvm::CastInfo<mlir::mps::OneHotOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v48);
  if (!v49)
  {
    v60 = "result && \"builder didn't return the right type\"";
    int v61 = 497;
    v62 = "Builders.h";
    v63 = "create";
LABEL_59:
    __assert_rtn(v63, v62, v61, v60);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v74);
  if (!*(_DWORD *)(v49 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v65 = v49 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v65);

  return DefiningOp;
}

@end