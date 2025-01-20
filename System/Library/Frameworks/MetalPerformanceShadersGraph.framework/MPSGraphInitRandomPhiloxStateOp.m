@interface MPSGraphInitRandomPhiloxStateOp
- (MPSGraphInitRandomPhiloxStateOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 counterLow:(unint64_t)a6 counterHigh:(unint64_t)a7 key:(unint64_t)a8 name:(id)a9;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphInitRandomPhiloxStateOp

- (MPSGraphInitRandomPhiloxStateOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 counterLow:(unint64_t)a6 counterHigh:(unint64_t)a7 key:(unint64_t)a8 name:(id)a9
{
  self->_counterLow = a6;
  self->_counterHigh = a7;
  self->_key = a8;
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a9];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  mpsFileLoc("-[MPSGraphInitRandomPhiloxStateOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphRandomOps.mm", __p);
  id v11 = v10;
  __int16 v74 = 260;
  v73[0] = (uint64_t)__p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v73);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0xB1u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    v18 = (uint64_t *)operator new(0x20uLL);
    __dst = v18;
    long long v72 = xmmword_181129E90;
    qmemcpy(v18, "mps.init_random_philox_state", 28);
    v19 = (char *)v18 + 28;
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
    p_dst = (uint64_t *)operator new(v20 + 1);
    *(void *)&long long v72 = v16;
    *((void *)&v72 + 1) = v21 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v72) = v15;
    p_dst = (uint64_t *)&__dst;
    if (!v15) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v19 = (char *)p_dst + v16;
LABEL_13:
  unsigned char *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v77);
  v22 = (std::string *)v77.__r_.__value_.__r.__words[0];
  if ((v77.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v22 = &v77;
  }
  char v23 = 1;
  HIBYTE(v74) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v73[0] = (uint64_t)v22;
    char v23 = 3;
  }
  LOBYTE(v74) = v23;
  uint64_t v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v73);
  uint64_t v25 = mlir::NameLoc::get(v24, v13);
  if (!v25) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v77.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v72) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v72) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  if (v70 < 0) {
    operator delete(__p[0]);
  }
  v77.__r_.__value_.__r.__words[0] = 1;
  uint64_t IntegerType = mlir::Builder::getIntegerType((mlir::Builder *)a3, 0x40u, 1);
  v27 = (uint64_t **)mlir::RankedTensorType::get((uint64_t)&v77, 1, IntegerType, 0);
  if (!mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor(v27))
  {
    v29 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\"";
    int v30 = 566;
    v31 = "Casting.h";
    v32 = "cast";
LABEL_50:
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
      goto LABEL_50;
    }
  }
  else
  {
    uint64_t InterfaceFor = 0;
  }
  unint64_t counterLow = self->_counterLow;
  v33 = (uint64_t *)mlir::DenseElementsAttr::getFromRawBuffer(v27, InterfaceFor, &counterLow, 8, 8, 1, 1);
  if (!mlir::DenseIntElementsAttr::classof((uint64_t)v33))
  {
    v56 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\"";
    int v57 = 566;
    v58 = "Casting.h";
    v59 = "cast";
    goto LABEL_53;
  }
  __dst = v33;
  v34 = mlir::OpBuilder::create<mlir::mps::ConstantOp,mlir::DenseIntElementsAttr>((mlir::OpBuilder *)a3, v25, &__dst);
  if (!*((_DWORD *)v34 + 9))
  {
    v56 = "resultNumber < getNumResults() && \"Result number is out of range for operation\"";
    int v57 = 984;
    v58 = "Operation.h";
    v59 = "getOpResultImpl";
LABEL_53:
    __assert_rtn(v59, v58, v57, v56);
  }
  v73[0] = (uint64_t)v34 - 16;
  unint64_t counterLow = 1;
  uint64_t v35 = mlir::Builder::getIntegerType((mlir::Builder *)a3, 0x40u, 1);
  v36 = (uint64_t **)mlir::RankedTensorType::get((uint64_t)&counterLow, 1, v35, 0);
  if (!mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor(v36))
  {
    v38 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\"";
    int v39 = 566;
    v40 = "Casting.h";
    v41 = "cast";
LABEL_55:
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
      goto LABEL_55;
    }
  }
  else
  {
    uint64_t v37 = 0;
  }
  unint64_t counterHigh = self->_counterHigh;
  uint64_t v42 = mlir::DenseElementsAttr::getFromRawBuffer(v36, v37, &counterHigh, 8, 8, 1, 1);
  if (!mlir::DenseIntElementsAttr::classof(v42))
  {
    v60 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\"";
    int v61 = 566;
    v62 = "Casting.h";
    v63 = "cast";
    goto LABEL_58;
  }
  v77.__r_.__value_.__r.__words[0] = v42;
  v43 = mlir::OpBuilder::create<mlir::mps::ConstantOp,mlir::DenseIntElementsAttr>((mlir::OpBuilder *)a3, v25, (uint64_t **)&v77);
  if (!*((_DWORD *)v43 + 9))
  {
    v60 = "resultNumber < getNumResults() && \"Result number is out of range for operation\"";
    int v61 = 984;
    v62 = "Operation.h";
    v63 = "getOpResultImpl";
LABEL_58:
    __assert_rtn(v63, v62, v61, v60);
  }
  __dst = (uint64_t *)((char *)v43 - 16);
  unint64_t counterHigh = 1;
  uint64_t v44 = mlir::Builder::getIntegerType((mlir::Builder *)a3, 0x40u, 1);
  v45 = (uint64_t **)mlir::RankedTensorType::get((uint64_t)&counterHigh, 1, v44, 0);
  if (!mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor(v45))
  {
    v47 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\"";
    int v48 = 566;
    v49 = "Casting.h";
    v50 = "cast";
LABEL_60:
    __assert_rtn(v50, v49, v48, v47);
  }
  if (v45)
  {
    uint64_t v46 = mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor(v45);
    if (!v46)
    {
      v47 = "(!t || conceptImpl) && \"expected value to provide interface instance\"";
      int v48 = 98;
      v49 = "InterfaceSupport.h";
      v50 = "Interface";
      goto LABEL_60;
    }
  }
  else
  {
    uint64_t v46 = 0;
  }
  unint64_t key = self->_key;
  v51 = (uint64_t *)mlir::DenseElementsAttr::getFromRawBuffer(v45, v46, &key, 8, 8, 1, 1);
  if (!mlir::DenseIntElementsAttr::classof((uint64_t)v51))
  {
    v64 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\"";
    int v65 = 566;
    v66 = "Casting.h";
    v67 = "cast";
    goto LABEL_63;
  }
  unint64_t counterLow = (unint64_t)v51;
  v52 = mlir::OpBuilder::create<mlir::mps::ConstantOp,mlir::DenseIntElementsAttr>((mlir::OpBuilder *)a3, v25, (uint64_t **)&counterLow);
  if (!*((_DWORD *)v52 + 9))
  {
    v64 = "resultNumber < getNumResults() && \"Result number is out of range for operation\"";
    int v65 = 984;
    v66 = "Operation.h";
    v67 = "getOpResultImpl";
LABEL_63:
    __assert_rtn(v67, v66, v65, v64);
  }
  v77.__r_.__value_.__r.__words[0] = (std::string::size_type)v52 - 16;
  uint64_t v53 = mlir::OpBuilder::create<mlir::mps::InitRandomPhiloxStateOp,mlir::Value &,mlir::Value &,mlir::Value &>((uint64_t *)a3, v25, v73, (uint64_t *)&__dst, (uint64_t *)&v77);
  if (!*(_DWORD *)(v53 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  unint64_t counterLow = v53 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&counterLow);

  return DefiningOp;
}

@end