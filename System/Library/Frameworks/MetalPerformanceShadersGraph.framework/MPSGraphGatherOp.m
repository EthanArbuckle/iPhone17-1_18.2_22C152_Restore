@interface MPSGraphGatherOp
- (MPSGraphGatherOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 axis:(int64_t)a6 batchDimensions:(unint64_t)a7 name:(id)a8;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphGatherOp

- (MPSGraphGatherOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 axis:(int64_t)a6 batchDimensions:(unint64_t)a7 name:(id)a8
{
  self->_axis = a6;
  self->_batchDims = a7;
  self->_allowNegativeIndices = 0;
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a8];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11 = a7;
  mpsFileLoc("-[MPSGraphGatherOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphGatherOps.mm", __p);
  uint64_t v12 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::GatherOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x89u, v11);
  if (v18 < 0) {
    operator delete(__p[0]);
  }
  if (*((void *)a5 + 1) - *(void *)a5 <= 0x10uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v13 = mlir::OpBuilder::create<mlir::mps::GatherOp,mlir::Value &,mlir::Value &,mlir::Value &,unsigned long &,BOOL &>((mlir::Builder *)a3, v12, *(uint64_t **)a5, (uint64_t *)(*(void *)a5 + 8), (uint64_t *)(*(void *)a5 + 16), (unsigned int *)&self->_batchDims, (unsigned __int8 *)&self->_allowNegativeIndices);
  if (!*(_DWORD *)(v13 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v16 = v13 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v16);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [(MPSGraphOperation *)self inputTensors];
  id v13 = [v12 objectAtIndexedSubscript:0];
  if (v13 == v9)
  {
    v15 = [v9 shape];
    int v16 = isStaticShape(v15);

    if (!v16)
    {
      v14 = 0;
      goto LABEL_13;
    }
    unint64_t batchDims = self->_batchDims;
    id v46 = v10;
    id v47 = v11;
    id v45 = v10;
    char v18 = [(MPSGraphOperation *)self inputTensors];
    int64_t v49 = batchDims;
    v19 = [v18 objectAtIndexedSubscript:1];

    int64_t axis = self->_axis;
    unint64_t v21 = self->_batchDims;
    v50 = [MEMORY[0x1E4F1CA48] array];
    v22 = (void *)MEMORY[0x1E4F1CA48];
    v23 = [v19 shape];
    v24 = [v22 arrayWithArray:v23];
    uint64_t v25 = axis - v21;

    if (axis != v21)
    {
      uint64_t v26 = 0;
      do
      {
        v27 = [NSNumber numberWithInteger:v26 + self->_batchDims];
        [v50 addObject:v27];

        v28 = [v9 shape];
        v29 = [v28 objectAtIndexedSubscript:v26 + self->_batchDims];
        [v24 insertObject:v29 atIndex:v26 + self->_batchDims];

        ++v26;
      }
      while (v25 != v26);
    }
    [v50 addObject:&unk_1EC9EFF30];
    [v24 addObject:&unk_1EC9EFF48];
    location = (id *)&self->super._graph;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
    v31 = NSString;
    id v11 = v47;
    uint64_t v12 = v45;
    v32 = [(MPSGraphOperation *)self name];
    v33 = [v31 stringWithFormat:@"%@/%@/expandDims", v47, v32];
    v44 = [WeakRetained expandDimsOfTensor:v19 axes:v50 name:v33];

    if (v25 < 1)
    {
      id v13 = v44;
    }
    else
    {
      int64_t v49 = self->_axis;
      id v34 = objc_loadWeakRetained(location);
      v35 = NSString;
      v43 = [(MPSGraphOperation *)self name];
      v36 = [v35 stringWithFormat:@"%@/%@/broadcast", v47, v43];
      id v13 = [v34 broadcastTensor:v44 toShape:v24 name:v36];
    }
    id v37 = objc_loadWeakRetained(location);
    v38 = [v9 shape];
    v39 = NSString;
    v40 = [(MPSGraphOperation *)self name];
    v41 = [v39 stringWithFormat:@"%@/%@/scatterND", v47, v40];
    v14 = [v37 scatterNDWithUpdatesTensor:v45 indicesTensor:v13 shape:v38 batchDimensions:v49 name:v41];

    id v10 = v46;
  }
  else
  {
    v14 = 0;
  }

LABEL_13:

  return v14;
}

@end