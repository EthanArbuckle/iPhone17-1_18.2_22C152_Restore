@interface MPSGraphDequantizeOp
- (MPSGraphDequantizeOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dataType:(unsigned int)a6 axis:(id)a7 name:(id)a8;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphDequantizeOp

- (MPSGraphDequantizeOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dataType:(unsigned int)a6 axis:(id)a7 name:(id)a8
{
  *(&self->_dataType + 1) = a6;
  objc_storeStrong((id *)&self->_axis, a7);
  id v13 = a8;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [(MPSGraphOperation *)self initWithGraph:v16 inputTensors:v15 controlDependencies:v14 name:v13];

  return v17;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11 = a7;
  uint64_t MLIRElementType = getMLIRElementType(*(mlir::MLIRContext **)a3, (mlir::MLIRContext *)*(&self->_dataType + 1));
  uint64_t v23 = 0;
  uint64_t v24 = mlir::TypeAttr::get(MLIRElementType);
  if (self->_axis)
  {
    uint64_t IntegerType = mlir::Builder::getIntegerType((mlir::Builder *)a3, 0x20u, 1);
    uint64_t v23 = mlir::IntegerAttr::get(IntegerType, [(NSNumber *)self->_axis intValue]);
  }
  mpsFileLoc("-[MPSGraphDequantizeOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphQuantizationOps.mm", __p);
  uint64_t v14 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::DequantizeOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x74u, v11);
  if (v22 < 0)
  {
    operator delete(__p[0]);
    id v15 = *(uint64_t **)a5;
    id v16 = (uint64_t *)*((void *)a5 + 1);
    unint64_t v17 = (unint64_t)v16 - *(void *)a5;
    if (v17 == 24) {
      goto LABEL_5;
    }
  }
  else
  {
    id v15 = *(uint64_t **)a5;
    id v16 = (uint64_t *)*((void *)a5 + 1);
    unint64_t v17 = (unint64_t)v16 - *(void *)a5;
    if (v17 == 24)
    {
LABEL_5:
      uint64_t v18 = mlir::OpBuilder::create<mlir::mps::DequantizeOp,mlir::Value &,mlir::Value &,mlir::Value &,mlir::TypeAttr &,mlir::IntegerAttr &>((mlir::Float32Type **)a3, v14, v15, v15 + 1, v15 + 2, &v24, &v23);
      goto LABEL_10;
    }
  }
  if (v16 == v15 || v17 <= 0x18) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v18 = mlir::OpBuilder::create<mlir::mps::DequantizeOp,mlir::Value &,mlir::Value &,mlir::Value &,mlir::Value &,mlir::TypeAttr &,mlir::IntegerAttr &>((mlir::UnknownLoc **)a3, v14, v15, v15 + 1, v15 + 2, v15 + 3, &v24, &v23);
LABEL_10:
  v19 = (void *)v18;

  return v19;
}

- (void).cxx_destruct
{
}

@end