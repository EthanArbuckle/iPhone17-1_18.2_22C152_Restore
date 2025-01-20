@interface MPSGraphVariableFromTensorOp
- (MPSGraphVariableFromTensorOp)initWithGraph:(id)a3 tensor:(id)a4 name:(id)a5;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphVariableFromTensorOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10 = a7;
  mpsFileLoc("-[MPSGraphVariableFromTensorOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphVariableFromTensorOp.mm", v36);
  id v11 = v10;
  __int16 v42 = 260;
  v41[0] = v36;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v41);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x1Du, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    v18 = (char *)operator new(0x20uLL);
    __dst = (void **)v18;
    long long v40 = xmmword_181129E30;
    qmemcpy(v18, "mps.variable_from_tensor", 24);
    v19 = v18 + 24;
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
    p_dst = (void **)operator new(v20 + 1);
    *(void *)&long long v40 = v16;
    *((void *)&v40 + 1) = v21 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v40) = v15;
    p_dst = (void **)&__dst;
    if (!v15) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v19 = (char *)p_dst + v16;
LABEL_13:
  unsigned char *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  char v23 = 1;
  HIBYTE(v42) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v41[0] = p_p;
    char v23 = 3;
  }
  LOBYTE(v42) = v23;
  uint64_t v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v41);
  uint64_t v25 = mlir::NameLoc::get(v24, v13);
  if (!v25) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v40) & 0x80000000) == 0)
    {
LABEL_20:

      if ((v37 & 0x80000000) == 0) {
        goto LABEL_21;
      }
      goto LABEL_29;
    }
  }
  else if ((SHIBYTE(v40) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);

  if ((v37 & 0x80000000) == 0)
  {
LABEL_21:
    v26 = *(uint64_t **)a5;
    if (*((void *)a5 + 1) != *(void *)a5) {
      goto LABEL_22;
    }
LABEL_30:
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
LABEL_29:
  operator delete(v36[0]);
  v26 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) == *(void *)a5) {
    goto LABEL_30;
  }
LABEL_22:
  uint64_t v27 = mlir::OpBuilder::create<mlir::mps::VariableFromTensorOp,mlir::Value &>((mlir::OpBuilder *)a3, v25, v26);
  if (!*(_DWORD *)(v27 + 36))
  {
    v32 = "resultNumber < getNumResults() && \"Result number is out of range for operation\"";
    int v33 = 984;
    v34 = "Operation.h";
    v35 = "getOpResultImpl";
    goto LABEL_36;
  }
  uint64_t v28 = *(void *)(*(void *)(v27 - 8) & 0xFFFFFFFFFFFFFFF8);
  if (!v28)
  {
    v32 = "abstractType && \"Malformed type storage object.\"";
    int v33 = 160;
    v34 = "TypeSupport.h";
    v35 = "getAbstractType";
    goto LABEL_36;
  }
  v29 = *(void **)(v28 + 136);
  if (v29 != &mlir::detail::TypeIDResolver<mlir::RankedTensorType,void>::id
    && v29 != &mlir::detail::TypeIDResolver<mlir::UnrankedTensorType,void>::id)
  {
    v32 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\"";
    int v33 = 566;
    v34 = "Casting.h";
    v35 = "cast";
LABEL_36:
    __assert_rtn(v35, v34, v33, v32);
  }
  v41[0] = v27 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)v41);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v6 = a4;

  return v6;
}

- (MPSGraphVariableFromTensorOp)initWithGraph:(id)a3 tensor:(id)a4 name:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v14.receiver = self;
  v14.super_class = (Class)MPSGraphVariableFromTensorOp;
  v12 = [(MPSGraphOperation *)&v14 initWithGraph:v8 inputTensors:v11 controlDependencies:MEMORY[0x1E4F1CBF0] name:v10];

  return v12;
}

@end