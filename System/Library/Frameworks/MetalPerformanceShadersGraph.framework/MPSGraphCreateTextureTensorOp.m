@interface MPSGraphCreateTextureTensorOp
- (BOOL)compressed;
- (MPSGraphCreateTextureTensorOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 pixelFormat:(unint64_t)a6 isCompressed:(BOOL)a7 name:(id)a8;
- (unint64_t)mtlPixelFormat;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphCreateTextureTensorOp

- (MPSGraphCreateTextureTensorOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 pixelFormat:(unint64_t)a6 isCompressed:(BOOL)a7 name:(id)a8
{
  self->_mtlPixelFormat = a6;
  *(&self->_compressed + 1) = a7;
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a8];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphCreateTextureTensorOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphMemoryOps.mm", __p);
  id v12 = v11;
  __int16 v60 = 260;
  v59[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v59);
  uint64_t v14 = mlir::FileLineColLoc::get(StringAttr, 0x153u, 0);
  if (!v14) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v12)
  {
    v19 = (char *)operator new(0x20uLL);
    __dst = (void **)v19;
    long long v58 = xmmword_181130E20;
    qmemcpy(v19, "mps.create_texture_tensor", 25);
    v20 = v19 + 25;
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
    uint64_t v21 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v21 = v16 | 7;
    }
    uint64_t v22 = v21 + 1;
    p_dst = (void **)operator new(v21 + 1);
    *(void *)&long long v58 = v17;
    *((void *)&v58 + 1) = v22 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v58) = v16;
    p_dst = (void **)&__dst;
    if (!v16) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  v20 = (char *)p_dst + v17;
LABEL_13:
  unsigned char *v20 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v54);
  v23 = (std::string *)v54.__r_.__value_.__r.__words[0];
  if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v23 = &v54;
  }
  char v24 = 1;
  HIBYTE(v60) = 1;
  if (v23->__r_.__value_.__s.__data_[0])
  {
    v59[0] = v23;
    char v24 = 3;
  }
  LOBYTE(v60) = v24;
  uint64_t v25 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v59);
  uint64_t v26 = mlir::NameLoc::get(v25, v14);
  if (!v26) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v54.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v58) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v58) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  if (v50 < 0) {
    operator delete(__p[0]);
  }
  unsigned int MLIRMetalPixelFormat = getMLIRMetalPixelFormat(self->_mtlPixelFormat);
  v28 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) == *(void *)a5) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  unsigned int v29 = MLIRMetalPixelFormat;
  uint64_t v51 = v26;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v51);
  uint64_t v31 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.create_texture_tensor", (const unsigned __int8 *)0x19, Context);
  if (!v32)
  {
    __int16 v56 = 1283;
    v54.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.create_texture_tensor";
    uint64_t v55 = 25;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v53 = 259;
    llvm::operator+((uint64_t *)&v54, v52, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v59, v26, v31);
  mlir::mps::CreateTextureTensorOp::build((mlir::UnitAttr **)a3, (uint64_t)v59, *v28, v29, *((unsigned __int8 *)&self->_compressed + 1));
  v33 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v59);
  v34 = v33;
  if (!v33)
  {
    v39 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v40 = 662;
    v41 = "Casting.h";
    v42 = "dyn_cast";
    goto LABEL_51;
  }
  uint64_t v35 = *((void *)v33 + 6);
  v36 = *(void **)(v35 + 16);
  if (v36 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst = *(void ***)(v35 + 8);
    uint64_t AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v44 == 25)
    {
      BOOL v45 = *(void *)AttrData == 0x616572632E73706DLL && *(void *)(AttrData + 8) == 0x75747865745F6574;
      BOOL v46 = v45 && *(void *)(AttrData + 16) == 0x6F736E65745F6572;
      if (v46 && *(unsigned char *)(AttrData + 24) == 114)
      {
        __int16 v56 = 1283;
        v54.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
        v54.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.create_texture_tensor";
        uint64_t v55 = 25;
        v52[0] = (uint64_t)"' failed due to the operation not being registered";
        __int16 v53 = 259;
        llvm::operator+((uint64_t *)&v54, v52, (uint64_t)&__dst);
        llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
      }
    }
    goto LABEL_50;
  }
  if (v36 != &mlir::detail::TypeIDResolver<mlir::mps::CreateTextureTensorOp,void>::id)
  {
LABEL_50:
    v39 = "result && \"builder didn't return the right type\"";
    int v40 = 497;
    v41 = "Builders.h";
    v42 = "create";
LABEL_51:
    __assert_rtn(v42, v41, v40, v39);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v59);
  if (!*((_DWORD *)v34 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v48 = (char *)v34 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v48);

  return DefiningOp;
}

- (unint64_t)mtlPixelFormat
{
  return self->_mtlPixelFormat;
}

- (BOOL)compressed
{
  return *(&self->_compressed + 1);
}

@end