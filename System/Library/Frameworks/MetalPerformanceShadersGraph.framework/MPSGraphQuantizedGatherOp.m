@interface MPSGraphQuantizedGatherOp
- (MPSGraphQuantizedGatherOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 hasZeroPoint:(BOOL)a6 hasMin:(BOOL)a7 dequantDataType:(unsigned int)a8 axis:(int64_t)a9 batchDimensions:(unint64_t)a10 name:(id)a11;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphQuantizedGatherOp

- (MPSGraphQuantizedGatherOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 hasZeroPoint:(BOOL)a6 hasMin:(BOOL)a7 dequantDataType:(unsigned int)a8 axis:(int64_t)a9 batchDimensions:(unint64_t)a10 name:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a11;
  self->_hasMin = a6;
  *(&self->_hasMin + 1) = a7;
  if ((unint64_t)[v18 count] <= 3) {
    __assert_rtn("-[MPSGraphQuantizedGatherOp initWithGraph:inputTensors:controlDependencies:hasZeroPoint:hasMin:dequantDataType:axis:batchDimensions:name:]", "MPSGraphGatherOps.mm", 345, "0 && \"Number of input tensors should be >= 4\"");
  }
  self->_dequantDataType = a8;
  self->_axis = a9;
  self->_batchDims = a10;
  self->_allowNegativeIndices = 0;
  v21 = [(MPSGraphOperation *)self initWithGraph:v17 inputTensors:v18 controlDependencies:v19 name:v20];

  return v21;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11 = a7;
  if (self->_hasMin)
  {
    if (*((void *)a5 + 1) - *(void *)a5 <= 0x20uLL) {
      std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
    }
    uint64_t v12 = *(void *)(*(void *)a5 + 32);
    uint64_t v38 = v12;
    if (*(&self->_hasMin + 1)) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v13 = 0;
    goto LABEL_8;
  }
  uint64_t v12 = 0;
  uint64_t v38 = 0;
  if (!*(&self->_hasMin + 1)) {
    goto LABEL_7;
  }
LABEL_4:
  if (*((void *)a5 + 1) - *(void *)a5 <= 0x28uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v13 = *(void *)(*(void *)a5 + 40);
LABEL_8:
  uint64_t v37 = v13;
  uint64_t MLIRElementType = getMLIRElementType(*(mlir::MLIRContext **)a3, (mlir::MLIRContext *)self->_dequantDataType);
  uint64_t v35 = 0;
  uint64_t v36 = mlir::TypeAttr::get(MLIRElementType);
  if (v12)
  {
    if (v13) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  mpsFileLoc("-[MPSGraphQuantizedGatherOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphGatherOps.mm", __p);
  uint64_t v15 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::ConstantOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x170u, v11);
  if (v34 < 0) {
    operator delete(__p[0]);
  }
  LODWORD(v28) = 0;
  v16 = mlir::OpBuilder::create<mlir::mps::ConstantOp,int>((mlir::mps::ConstantOp *)a3, v15, (unsigned int *)&v28);
  if (!*((_DWORD *)v16 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v38 = (uint64_t)v16 - 16;
  if (!v13)
  {
LABEL_15:
    mpsFileLoc("-[MPSGraphQuantizedGatherOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphGatherOps.mm", v31);
    uint64_t v17 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::ConstantOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)v31, 0x175u, v11);
    if (v32 < 0) {
      operator delete(v31[0]);
    }
    LODWORD(v28) = 0;
    id v18 = mlir::OpBuilder::create<mlir::mps::ConstantOp,float>((mlir::Float32Type **)a3, v17, (float *)&v28);
    if (!*((_DWORD *)v18 + 9)) {
      __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
    }
    uint64_t v37 = (uint64_t)v18 - 16;
  }
LABEL_19:
  mpsFileLoc("-[MPSGraphQuantizedGatherOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphGatherOps.mm", v29);
  uint64_t v19 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::DequantizeOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)v29, 0x179u, v11);
  if (v30 < 0) {
    operator delete(v29[0]);
  }
  if (*((void *)a5 + 1) - *(void *)a5 <= 0x18uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v20 = mlir::OpBuilder::create<mlir::mps::DequantizeOp,mlir::Value &,mlir::Value &,mlir::Value &,mlir::Value &,mlir::TypeAttr &,mlir::IntegerAttr &>((mlir::UnknownLoc **)a3, v19, *(uint64_t **)a5, (uint64_t *)(*(void *)a5 + 24), &v38, &v37, &v36, &v35);
  if (!*(_DWORD *)(v20 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v28 = v20 - 16;
  mpsFileLoc("-[MPSGraphQuantizedGatherOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphGatherOps.mm", v26);
  uint64_t v21 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::GatherOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)v26, 0x17Fu, v11);
  if (v27 < 0) {
    operator delete(v26[0]);
  }
  if (*((void *)a5 + 1) - *(void *)a5 <= 0x10uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v22 = mlir::OpBuilder::create<mlir::mps::GatherOp,mlir::Value &,mlir::Value &,mlir::Value &,unsigned long &,BOOL &>((mlir::Builder *)a3, v21, &v28, (uint64_t *)(*(void *)a5 + 8), (uint64_t *)(*(void *)a5 + 16), (unsigned int *)&self->_batchDims, (unsigned __int8 *)&self->_allowNegativeIndices);
  if (!*(_DWORD *)(v22 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v25 = v22 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v25);

  return DefiningOp;
}

@end