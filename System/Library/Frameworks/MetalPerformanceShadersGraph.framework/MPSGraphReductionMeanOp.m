@interface MPSGraphReductionMeanOp
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphReductionMeanOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10 = a7;
  mpsFileLoc("-[MPSGraphReductionMeanOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphReductionOps.mm", v30);
  id v11 = v10;
  __int16 v35 = 260;
  v34[0] = (uint64_t)v30;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v34);
  uint64_t v13 = mlir::FileLineColLoc::get(StringAttr, 0x119u, 0);
  if (!v13) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v11)
  {
    __dst[23] = 18;
    strcpy(__dst, "mps.reduction_mean");
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
    uint64_t v18 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17) {
      uint64_t v18 = v15 | 7;
    }
    uint64_t v19 = v18 + 1;
    v17 = operator new(v18 + 1);
    *(void *)&__dst[8] = v16;
    *(void *)&__dst[16] = v19 | 0x8000000000000000;
    *(void *)__dst = v17;
  }
  else
  {
    __dst[23] = v15;
    v17 = __dst;
    if (!v15) {
      goto LABEL_12;
    }
  }
  memmove(v17, v14, v16);
LABEL_12:
  v17[v16] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  char v21 = 1;
  HIBYTE(v35) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v34[0] = (uint64_t)p_p;
    char v21 = 3;
  }
  LOBYTE(v35) = v21;
  uint64_t v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v34);
  uint64_t v23 = mlir::NameLoc::get(v22, v13);
  if (!v23) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((__dst[23] & 0x80000000) == 0)
    {
LABEL_20:

      if ((v31 & 0x80000000) == 0) {
        goto LABEL_21;
      }
LABEL_25:
      operator delete(v30[0]);
      v24 = *(uint64_t **)a5;
      v25 = (uint64_t *)*((void *)a5 + 1);
      if ((unint64_t)v25 - *(void *)a5 >= 9) {
        goto LABEL_22;
      }
      goto LABEL_26;
    }
  }
  else if ((__dst[23] & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(*(void **)__dst);

  if (v31 < 0) {
    goto LABEL_25;
  }
LABEL_21:
  v24 = *(uint64_t **)a5;
  v25 = (uint64_t *)*((void *)a5 + 1);
  if ((unint64_t)v25 - *(void *)a5 >= 9)
  {
LABEL_22:
    uint64_t v26 = v24[1];
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v26 = 0;
LABEL_27:
  v34[0] = v26;
  if (v25 == v24) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  __p.__r_.__value_.__s.__data_[0] = 1;
  v27 = mlir::OpBuilder::create<mlir::mps::ReductionMeanOp,mlir::Value &,mlir::Value &,BOOL>((mlir::UnitAttr **)a3, v23, v24, v34, (unsigned __int8 *)&__p);
  if (!*((_DWORD *)v27 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  *(void *)__dst = (char *)v27 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)__dst);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  p_graph = &self->super.super._graph;
  id v13 = objc_loadWeakRetained((id *)&self->super.super._graph);
  v14 = [v13 shapeOfTensor:v9 name:@"ShapeForReductionGrad"];
  uint64_t v15 = [v13 broadcastTensor:v10 toShapeTensor:v14 name:@"Broadcast to input shape"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
  axes = self->super._axes;
  v33 = (void *)v15;
  if (v11)
  {
    uint64_t v18 = [v11 stringByAppendingFormat:@"/dimSize"];
  }
  else
  {
    uint64_t v18 = @"meanGrad/dimSize";
  }
  uint64_t v19 = [WeakRetained dimensionSizeOfTensor:v9 axes:axes name:v18];
  if (v11)
  {

    id v20 = objc_loadWeakRetained((id *)&self->super.super._graph);
    char v21 = [v11 stringByAppendingFormat:@"/reductionProduct"];
  }
  else
  {

    id v20 = objc_loadWeakRetained((id *)&self->super.super._graph);
    char v21 = @"meanGrad/reductionProduct";
  }
  uint64_t v22 = [v20 reductionProductWithTensor:v19 axis:0 name:v21];
  if (v11) {

  }
  id v23 = objc_loadWeakRetained((id *)p_graph);
  uint64_t v24 = [v10 dataType];
  if (v11)
  {
    v25 = [v11 stringByAppendingFormat:@"/cast"];
  }
  else
  {
    v25 = @"meanGrad/cast";
  }
  uint64_t v26 = [v23 castTensor:v22 toType:v24 name:v25];
  if (v11)
  {

    id v27 = objc_loadWeakRetained((id *)p_graph);
    v28 = [v11 stringByAppendingString:@"/reciprocal"];
  }
  else
  {

    id v27 = objc_loadWeakRetained((id *)p_graph);
    v28 = @"meanGrad/reciprocal";
  }
  v29 = [v27 reciprocalWithTensor:v26 name:v28];
  if (v11) {

  }
  id v30 = objc_loadWeakRetained((id *)p_graph);
  char v31 = [v30 multiplicationWithPrimaryTensor:v33 secondaryTensor:v29 name:v11];

  return v31;
}

@end