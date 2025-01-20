@interface MPSGraphStencilOp
- (MPSGraphStencilOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphStencilOp

- (MPSGraphStencilOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = (MPSGraphStencilOpDescriptor *)[v15 copy];
  desc = self->_desc;
  self->_desc = v17;

  v19 = [(MPSGraphOperation *)self initWithGraph:v12 inputTensors:v13 controlDependencies:v14 name:v16];
  return v19;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  v89[3] = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphStencilOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphStencilOps.mm", __p);
  id v12 = v11;
  __int16 v87 = 260;
  v85 = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)&v85);
  uint64_t v14 = mlir::FileLineColLoc::get(StringAttr, 0x90u, 0);
  if (!v14) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  v72 = v12;
  if (!v12)
  {
    HIBYTE(v89[0]) = 11;
    *(__int32 *)((char *)&__dst.i32[1] + 3) = 1818846062;
    __dst.i64[0] = *(void *)"mps.stencil";
    v22 = &__dst.i8[11];
    goto LABEL_13;
  }
  id v15 = v12;
  id v16 = a4;
  v17 = a3;
  v18 = (const char *)[v15 UTF8String];
  size_t v19 = strlen(v18);
  if (v19 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v20 = v19;
  if (v19 >= 0x17)
  {
    uint64_t v23 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17) {
      uint64_t v23 = v19 | 7;
    }
    uint64_t v24 = v23 + 1;
    p_dst = (int8x16_t *)operator new(v23 + 1);
    __dst.i64[1] = v20;
    v89[0] = v24 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
    a4 = v16;
  }
  else
  {
    HIBYTE(v89[0]) = v19;
    p_dst = &__dst;
    if (!v19) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v18, v20);
LABEL_12:
  v22 = &p_dst->i8[v20];
  id v12 = v72;
  a3 = v17;
LABEL_13:
  __int8 *v22 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v80);
  v25 = (std::string *)v80.__r_.__value_.__r.__words[0];
  if ((v80.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v25 = &v80;
  }
  char v26 = 1;
  HIBYTE(v87) = 1;
  if (v25->__r_.__value_.__s.__data_[0])
  {
    v85 = v25;
    char v26 = 3;
  }
  LOBYTE(v87) = v26;
  uint64_t v27 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)&v85);
  uint64_t v28 = mlir::NameLoc::get(v27, v14);
  if (!v28) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v80.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v89[0]) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v89[0]) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v76 < 0) {
    operator delete(__p[0]);
  }
  v29 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 8uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  id v73 = [(MPSGraphStencilOpDescriptor *)self->_desc offsets];
  uint64_t IntegerType = mlir::Builder::getIntegerType((mlir::Builder *)a3, 0x40u, 1);
  uint64_t v31 = [v73 count];
  v32 = operator new(8uLL);
  void *v32 = v31;
  v33 = (uint64_t **)mlir::RankedTensorType::get((uint64_t)v32, 1, IntegerType, 0);
  if (!mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor(v33))
  {
    v35 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\"";
    int v36 = 566;
    v37 = "Casting.h";
    v38 = "cast";
LABEL_50:
    __assert_rtn(v38, v37, v36, v35);
  }
  if (v33)
  {
    uint64_t InterfaceFor = mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor(v33);
    if (!InterfaceFor)
    {
      v35 = "(!t || conceptImpl) && \"expected value to provide interface instance\"";
      int v36 = 98;
      v37 = "InterfaceSupport.h";
      v38 = "Interface";
      goto LABEL_50;
    }
  }
  else
  {
    uint64_t InterfaceFor = 0;
  }
  MPSShapeToVector<unsigned long long>(v73, (uint64_t **)&v85);
  uint64_t v39 = mlir::DenseElementsAttr::getFromRawBuffer(v33, InterfaceFor, v85, v86 - (unsigned char *)v85, 8, 1, 1);
  if ((mlir::DenseIntElementsAttr::classof(v39) & 1) == 0) {
    __assert_rtn("cast", "Casting.h", 566, "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\"");
  }
  if (v85)
  {
    v86 = v85;
    operator delete(v85);
  }
  operator delete(v32);

  v40 = [(MPSGraphStencilOpDescriptor *)self->_desc strides];
  uint64_t v41 = nsArrayToUI64Attr(v40, (mlir::Builder *)a3);
  v66 = [(MPSGraphStencilOpDescriptor *)self->_desc dilationRates];
  uint64_t v42 = nsArrayToUI64Attr(v66, (mlir::Builder *)a3);
  v71 = [(MPSGraphStencilOpDescriptor *)self->_desc explicitPadding];
  uint64_t v43 = nsArrayToUI64Attr(v71, (mlir::Builder *)a3);
  [(MPSGraphStencilOpDescriptor *)self->_desc paddingConstant];
  v45 = llvm::detail::IEEEFloat::IEEEFloat((llvm::detail::IEEEFloat *)&v85, v44);
  v46 = llvm::APFloatBase::IEEEsingle(v45);
  llvm::APFloat::Storage::Storage(&v83, &v85, v46);
  v70 = (mlir::Float32Type **)a3;
  llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v85);
  unsigned int v69 = [(MPSGraphStencilOpDescriptor *)self->_desc reductionMode];
  uint64_t v67 = v41;
  uint64_t v68 = v39;
  unsigned int v47 = [(MPSGraphStencilOpDescriptor *)self->_desc boundaryMode];
  unsigned int v48 = [(MPSGraphStencilOpDescriptor *)self->_desc paddingStyle];
  uint64_t v77 = v28;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v77);
  uint64_t v50 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.stencil", (const unsigned __int8 *)0xB, Context);
  if (!v51)
  {
    __int16 v82 = 1283;
    v80.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.stencil";
    uint64_t v81 = 11;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v79 = 259;
    llvm::operator+((uint64_t *)&v80, (uint64_t *)&v78, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(&v85, v28, v50);
  v52 = v40;
  uint64_t v54 = *v29;
  uint64_t v53 = v29[1];
  v55 = v83;
  v57 = llvm::APFloatBase::PPCDoubleDouble(v56);
  if (v57 == v55) {
    llvm::detail::DoubleAPFloat::DoubleAPFloat(&__dst.i64[1], &v83);
  }
  else {
    llvm::detail::IEEEFloat::IEEEFloat((uint64_t)&__dst.i64[1], (uint64_t)&v83);
  }
  mlir::mps::StencilOp::build(v70, (uint64_t)&v85, v54, v53, v68, v67, v42, v43, (uint64_t)&__dst, v69, v47, v48);
  if (v57 == (void *)__dst.i64[1]) {
    std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)v89);
  }
  else {
    llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&__dst.u64[1]);
  }
  v58 = mlir::OpBuilder::create((mlir::OpBuilder *)v70, (const mlir::OperationState *)&v85);
  if (!v58)
  {
    v62 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v63 = 662;
    v64 = "Casting.h";
    v65 = "dyn_cast";
    goto LABEL_55;
  }
  uint64_t v59 = llvm::DefaultDoCastIfPossible<mlir::mps::StencilOp,mlir::Operation *,llvm::CastInfo<mlir::mps::StencilOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v58);
  if (!v59)
  {
    v62 = "result && \"builder didn't return the right type\"";
    int v63 = 497;
    v64 = "Builders.h";
    v65 = "create";
LABEL_55:
    __assert_rtn(v65, v64, v63, v62);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)&v85);
  if (!*(_DWORD *)(v59 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v74 = v59 - 16;
  if (v57 == v83) {
    std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)&v84);
  }
  else {
    llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v83);
  }

  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v74);
  return DefiningOp;
}

- (void).cxx_destruct
{
}

@end