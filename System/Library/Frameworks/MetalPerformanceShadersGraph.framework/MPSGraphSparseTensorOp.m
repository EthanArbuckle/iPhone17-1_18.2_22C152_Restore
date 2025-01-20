@interface MPSGraphSparseTensorOp
- (MPSGraphSparseTensorOp)initWithGraph:(id)a3 sparseStorageType:(unint64_t)a4 inputTensors:(id)a5 shape:(id)a6 dataType:(unsigned int)a7 name:(id)a8;
- (NSArray)shape;
- (unint64_t)sparseStorageType;
- (unsigned)dataType;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphSparseTensorOp

- (MPSGraphSparseTensorOp)initWithGraph:(id)a3 sparseStorageType:(unint64_t)a4 inputTensors:(id)a5 shape:(id)a6 dataType:(unsigned int)a7 name:(id)a8
{
  objc_storeStrong((id *)&self->_shape, a6);
  id v15 = a6;
  id v16 = a8;
  id v17 = a5;
  id v18 = a3;
  *(&self->_dataType + 1) = a7;
  self->_sparseStorageType = a4;
  v21.receiver = self;
  v21.super_class = (Class)MPSGraphSparseTensorOp;
  v19 = [(MPSGraphOperation *)&v21 initWithGraph:v18 inputTensors:v17 controlDependencies:MEMORY[0x1E4F1CBF0] name:v16];

  return v19;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphSparseTensorOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphSparseOps.mm", __p);
  id v12 = v11;
  __int16 v64 = 260;
  v63[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v63);
  uint64_t v14 = mlir::FileLineColLoc::get(StringAttr, 0x5Fu, 0);
  if (!v14) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v12)
  {
    v19 = (char *)operator new(0x20uLL);
    __dst = (void **)v19;
    long long v60 = xmmword_181129EA0;
    qmemcpy(v19, "mps.materialize_sparse_tensor", 29);
    v20 = v19 + 29;
    goto LABEL_13;
  }
  id v15 = (const char *)[v12 UTF8String];
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
    *(void *)&long long v60 = v17;
    *((void *)&v60 + 1) = v22 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v60) = v16;
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
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v56);
  v23 = (std::string *)v56.__r_.__value_.__r.__words[0];
  if ((v56.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v23 = &v56;
  }
  char v24 = 1;
  HIBYTE(v64) = 1;
  if (v23->__r_.__value_.__s.__data_[0])
  {
    v63[0] = v23;
    char v24 = 3;
  }
  LOBYTE(v64) = v24;
  uint64_t v25 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v63);
  uint64_t v26 = mlir::NameLoc::get(v25, v14);
  if (!v26) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v56.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v60) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v60) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  if (v52 < 0) {
    operator delete(__p[0]);
  }
  MLIRType = getMLIRType((mlir::MLIRContext **)a3, self->_shape, (mlir::MLIRContext *)*(&self->_dataType + 1));
  v28 = *(uint64_t **)a5;
  unint64_t v29 = *((void *)a5 + 1) - *(void *)a5;
  if (!v29) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  if (v29 < 9 || (v61[0] = v28[1], v29 <= 0x10)) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v30 = (uint64_t)MLIRType;
  v61[1] = v28[2];
  mlir::ValueRange::ValueRange(v62, (uint64_t)v61, 2uLL);
  unsigned int sparseStorageType = self->_sparseStorageType;
  uint64_t v53 = v26;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v53);
  uint64_t v33 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.materialize_sparse_tensor", (const unsigned __int8 *)0x1D, Context);
  if (!v34)
  {
    __int16 v58 = 1283;
    v56.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.materialize_sparse_tensor";
    uint64_t v57 = 29;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v55 = 259;
    llvm::operator+((uint64_t *)&v56, v54, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v63, v26, v33);
  mlir::mps::MaterializeSparseTensorOp::build((mlir::MLIRContext **)a3, (uint64_t)v63, v30, *v28, v62[0], v62[1], sparseStorageType);
  v35 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v63);
  v36 = v35;
  if (!v35)
  {
    v41 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v42 = 662;
    v43 = "Casting.h";
    v44 = "dyn_cast";
    goto LABEL_54;
  }
  uint64_t v37 = *((void *)v35 + 6);
  v38 = *(void **)(v37 + 16);
  if (v38 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst = *(void ***)(v37 + 8);
    AttrData = (void *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v46 == 29)
    {
      BOOL v47 = *AttrData == 0x6574616D2E73706DLL && AttrData[1] == 0x5F657A696C616972;
      BOOL v48 = v47 && AttrData[2] == 0x745F657372617073;
      if (v48 && *(void *)((char *)AttrData + 21) == 0x726F736E65745F65)
      {
        __int16 v58 = 1283;
        v56.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
        v56.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.materialize_sparse_tensor";
        uint64_t v57 = 29;
        v54[0] = (uint64_t)"' failed due to the operation not being registered";
        __int16 v55 = 259;
        llvm::operator+((uint64_t *)&v56, v54, (uint64_t)&__dst);
        llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
      }
    }
    goto LABEL_53;
  }
  if (v38 != &mlir::detail::TypeIDResolver<mlir::mps::MaterializeSparseTensorOp,void>::id)
  {
LABEL_53:
    v41 = "result && \"builder didn't return the right type\"";
    int v42 = 497;
    v43 = "Builders.h";
    v44 = "create";
LABEL_54:
    __assert_rtn(v44, v43, v42, v41);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v63);
  if (!*((_DWORD *)v36 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v50 = (char *)v36 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v50);

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

- (unint64_t)sparseStorageType
{
  return self->_sparseStorageType;
}

- (void).cxx_destruct
{
}

@end